Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.7505.1614176816463021071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 06:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
Received: from [100.112.195.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id B3/CA-14660-E2266306; Wed, 24 Feb 2021 14:26:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MRqquXZJZ
  gMPmomsWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjH51SK2gs+cFf+mLmBuYHzO0cXIxSEksJlJ
  YuO3J2xdjJxAzglGiVVPikBsNgFNid4tWxi7GDk4RAT0JK7+EwUJMwuoS1xa18ICEhYWsJGY/
  j0IJMwioCrxs/crM4jNK+AqceraJ0YQW0JAQWLKw/dgcU4BN4nTK88xQWxyldi6egUbRL2gxM
  mZT1ggxktIHHzxghmiV1Fi9uVmFgi7SmJNxzS2CYz8s5C0zELSsoCRaRWjeVJRZnpGSW5iZo6
  uoYGBrqGhka6hpZGuiYleYpVuol5qqW55anGJrqFeYnmxXnFlbnJOil5easkmRmAgphQc0NnB
  +PPVB71DjJIcTEqivB+9zRKE+JLyUyozEosz4otKc1KLDzHKcHAoSfAWxwPlBItS01Mr0jJzg
  FEBk5bg4FES4Z0XB5TmLS5IzC3OTIdInWJUlBLn1UoASgiAJDJK8+DaYJF4iVFWSpiXkYGBQY
  inILUoN7MEVf4VozgHo5IwbyzIFJ7MvBK46a+AFjMBLb4SA7a4JBEhJdXAlP5gTXznDA7uVM2
  or4fvTnuRIX4vSKZWM18l4OzL9V83f96zWLuc2/DB+vxHUh8u2+x5FvBf4F+u9/OYGX2dnLLN
  MgGa0kJfTDP97E/a6ofqyJtKiQRGG3+qMTUSMcj+skP869LX1TaqdzvXS62P7Hddli/vcfarw
  bdIQ5OYlmMuN62fCJt9PccfpX9Q7HGNEfcVs2K5d90O3Qvu347QtHgRpyC6KW9HqPRMtR8VCl
  calh4wbEloCpBg9Cgpid3plPp4ecrnndMb/Zmz6vfu2nJgzcaAn7KyVps/hZ2dZ/pAo0uDh/3
  Bs/Sn9w+47io/tKTnk1ru4j8/FyuK+rXaPSlzu1u+O0A0wyPh5yslluKMREMt5qLiRACYzbDC
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-29.tower-267.messagelabs.com!1614176814!517635!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=fail
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24565 invoked from network); 24 Feb 2021 14:26:54 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-29.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Feb 2021 14:26:54 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 11OEQrSU017151
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 14:26:53 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Feb 2021 14:26:52 +0000
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] nfs-utils: upgrade 2.5.2 -> 2.5.3
Date: Wed, 24 Feb 2021 22:26:28 +0800
Message-ID: <1614176788-19920-3-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1614176788-19920-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1614176788-19920-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../nfs-utils/{nfs-utils_2.5.2.bb => nfs-utils_2.5.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.5.2.bb => nfs-utils_2.5.3.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
index c7ac67cf31..d8c6391b3d 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.5.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
            "
-SRC_URI[sha256sum] = "d493b81c9d3ffce5d10af701a63ed2b8a21768c23da4a2eceb4d708aea65d9de"
+SRC_URI[sha256sum] = "b54d6d8ea2ee62d64111278301ba4631b7bb19174e7f717a724fe5d463900c80"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.25.1

