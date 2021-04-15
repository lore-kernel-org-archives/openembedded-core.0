Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.2144.1618530625030432703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 16:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dS2ivG+j;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1618530623; i=@fujitsu.com;
	bh=3jHTfDi368BpgGmZXEfLnY47XkH8ZSg/FLqBEzENuyE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=dS2ivG+jAHgFM6HQrZlg64LK/QVXJGIrsUEncn0SGYOv1mh3No9/HAJKLTPpG6Hc6
	 YGtjVDB1ebVo/ubSTVdBesELaKdzfOMZUVF6bKA1+Zg/yt1U5SPJwzdaaVqoJ+ORtr
	 /NxR1WyE8F5kfjReUhvbVIJMYLAbzzZBqG514aFOmutIARIczDfd46POYTqSz6iuzF
	 qOScfpht5gPMDlQOwMZ+aD864fYyA/yhRYVPKOMQZIrEYxfVi+Y6U1LODTMWELaOe9
	 za7kv+UeEyITEKMr+5A24wBGVIN0/SvlH4gy0Pg+at0lBo/rJzPlPpTtFOjfRgUnW6
	 QAUoYK1NxH8Rg==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id 30/CE-55623-E31D8706; Thu, 15 Apr 2021 23:50:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MRomt3sSL
  BYPNFWYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPL4+KCVTwVH75NZGlg/M7VxcjFISQwi0li
  8ppHTBDOcUaJDcu/sHQxcnKwCahJTL91g7WLkYNDREBP4uo/UZAws4CKxIvfPewgtrCAjcT/7
  08YQWwWAVWJExM2sILYvAJOEt1NB5lBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF1A1ihKzLz
  ezQNiVEp3rFzBOYOSdhaRlFpKWBYxMqxgtkooy0zNKchMzc3QNDQx0DQ2NdQ11TQ31Eqt0E/V
  SS3WTU/NKihKBknqJ5cV6xZW5yTkpenmpJZsYgcGVUshovIPx4OsPeocYJTmYlER5D60oSxDi
  S8pPqcxILM6ILyrNSS0+xCjDwaEkwetyviJBSLAoNT21Ii0zBxjoMGkJDh4lEd5PIGne4oLE3
  OLMdIjUKUZdjiurlixiFmLJy89LlRLn3QJSJABSlFGaBzcCFnWXGGWlhHkZGRgYhHgKUotyM0
  tQ5V8xinMwKgnzloJM4cnMK4Hb9AroCCagIypWlYIcUZKIkJJqYIqRPlVgGzH/mKjlrMWB9bl
  ykz4/af/UqejkmpB5gz1N6tpMnp22bCrX3fSDxacnPpFSf9WTKl/b+NduYnj119M/LG8dPuhz
  LHR+3t/1X104n8drbZk42VC/1f9Uw6TgA5+tbs81W/4vRH6PxfvCWRMlgqTFk5tjHQ2EF2ly2
  L75WbcpO+nqYc87tqpJlzKMfgj/EXG3UNvIP+Hv1S37FPj2b6xXahA6v7vcz67df9c721NefK
  LTHkrf81hjo1efq3al+Un4S7ON/WkiwrKcU4KZcy7IsZWvF76ycglT6fIzq0873ljpdt9VeG9
  KeVvtM8UpMYXC+1WS1/1qjtJetcI64Mi/fMn1zAfurj5hoMRSnJFoqMVcVJwIAC+eV+k1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-232.messagelabs.com!1618530621!1574957!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14276 invoked from network); 15 Apr 2021 23:50:22 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-18.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Apr 2021 23:50:22 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 13FNoFWh032024
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 00:50:21 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 16 Apr 2021 00:50:14 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] mesa: upgrade 21.0.1 -> 21.0.2
Date: Fri, 16 Apr 2021 07:50:02 +0800
Message-ID: <1618530602-26607-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.1.bb => mesa-gl_21.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.1.bb => mesa_21.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb b/meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index caf3c62ad8..5705ae0f08 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
            "
 
-SRC_URI[sha256sum] = "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
+SRC_URI[sha256sum] = "46c1dc5bb54a372dee43ec3c067229c299187d5bdadf1402756bbf66a6df5b88"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-graphics/mesa/mesa_21.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.0.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.0.2.bb
-- 
2.25.1

