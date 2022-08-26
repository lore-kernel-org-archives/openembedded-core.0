Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F40BECAAA2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 03:01:43 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.32880.1661482898081174827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 20:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vy90B6Qu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482895; i=@fujitsu.com;
	bh=kH0gPcKGfKRgXk5CioEW5RGG/hsvjy0iQ8i+f77Ewe8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vy90B6QukQODTNi1cGXsp/ayvoLwAyiNrQMwpciX04ZqOxiJttJNP0+8cliD3phL8
	 6tM5L1oIaDQQHzz1z43vy4l3dpXjL4ZPqY0pHBJFSU/QPYUoPPEUPTQZFsl/uhAM4D
	 Rmp5rlrly0W7ChY/iGYlRzt5qYe22jkRfYRvau8uTx6mKbTUBnBSooXxtc/zdjfhVK
	 Bo9m1gvg/GigUQneATsoeIByJvWAReysSf70fmiB8lk675ZeMM6xR5o0s2F/SHLQMJ
	 MwFvSAU3saHnB6GfX/LMvvXcIg2nvptaIdm7ME1SqRp8IpZF2tjILflPxtD5kHNmuB
	 ozU19dvty5Hvw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDIsWRWlGSWpSXmKPExsViZ8MxSbfPnCP
  Z4PcZC4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePIuflsBQc5Kn68P8HawPiIvYuRi0NI4DGj
  xOSf75kgnOtMEo2vZrF2MXICOXsZJeZvZgex2QTUJKbfugEU5+AQEdCTuPpPFCTMLKAi8eJ3D
  1iJsICrxLafDUwgNouAqsSiuddYQMp5BZwktt63AAlLCChITHn4nhnE5hUQlDg58wkLxBgJiY
  MvXjBD1ChKzL7czAJhV0rsmdXPBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVolVSUmZ5RkpuYmaN
  raGCga2hoqmuoa2RorpdYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJERiQKcWM
  N3cwtvb91DvEKMnBpCTKq/+MPVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+aCUeykGBRanpqR
  VpmDjA6YNISHDxKIrzSokBp3uKCxNzizHSI1ClGXY6Pfy7uZRZiycvPS5US5/U0AyoSACnKKM
  2DGwGL1EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHmlQKbwZOaVwG16BXQEE9ARUhvYQY4
  oSURISTUwXXLoFJ4RV6bX4dF70J918kXt4luuVp4iOxsEAta+2PLuDtsdizcODxpaeGo3XN3W
  lLvfpvH+IymmicfXLqtJZV8U4de7/K/I7+67K4W2v9249ZzuOuHwzbuFq2ecvX/2Ko84d0D7p
  fOCkZlbjUov/z9swz+pNLrkHMtT49qYIt21BZGcZoGdCU+Ud84XzG66dVuh4ONypZ5lHfsjD+
  QvPtOd7Zyr8F7tl85RWyGrY+nK86dWuExoOPlI86zOoVmWBTmiihOrzrxX1SiRkP9wfYlx5oJ
  9e8Rjso8sZGSx2Wk28du9uD/nzVMD565Yq16anmka3Bf3h+GH/RqFw8oiLK7L7Nhzssv323zg
  URdVYinOSDTUYi4qTgQAgmwlaU8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1661482894!277926!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8088 invoked from network); 26 Aug 2022 03:01:34 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 03:01:34 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 8CA481000CC
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:01:34 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 80A2A100078
	for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:01:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 04:01:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pygments: upgrade 2.12.0 -> 2.13.0
Date: Fri, 26 Aug 2022 11:01:21 +0800
Message-ID: <1661482881-10682-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 03:01:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169901

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pygments_2.12.0.bb => python3-pygments_2.13.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.12.0.bb => python3-pygments_2.13.0.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.12.0.bb b/meta/recipes-devtools/python/python3-pygments_2.13.0.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pygments_2.12.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.13.0.bb
index b47e0aff67..59706cc200 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.12.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.13.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "5eb116118f9612ff1ee89ac96437bb6b49e8f04d8a13b514ba26f620208e26eb"
+SRC_URI[sha256sum] = "56a8508ae95f98e2b9bdf93a6be5ae3f7d8af858b43e02c5a2ff083726be40c1"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.25.1


