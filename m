Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0CDC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:30:40 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web08.10918.1639402239756360753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mN7ESD2W;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639402231; i=@fujitsu.com;
	bh=/yLvqPTwzBZDYuY1qdoXMl8cAB5Lant6Fz/hUcxFL8E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mN7ESD2WPSA192HbRRj0aXvOdc2e2bGF48ity/ofcPQMf4xjWpDhaFG/rUsRLJyg/
	 aa+sh3ePL59sf8v3ntqJRfHl7Pa1RAStKM3uA789lAu6oBrPpsg6r7u+zudPR6fiUM
	 Qbqv3hmaLmlKwAqJ1A3dRTOwOqHpa5K5fMIRem/fdwK/1nrqNVgdZ3xIy5i+yG2deo
	 blzKX67qhh4DKP0zf+wmzIs/51WvXQ93cxT66+4I3Oux+23gTFhppn+lYF7jXU/mFP
	 UeCb7otMnP3nNKrOQ6WQEpDJ53t9QqDIQIkOn3z16o+neb1udtsQSr9CiJP4Oe9nNS
	 Ml6Ur9Usr0Ycg==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id BF/5F-30341-7FA47B16;
 Mon, 13 Dec 2021 13:30:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqPvda3u
  iwb4T4hZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b32XbGgk1iFZPXxDUwbhHpYuTiEBJ4zCjR
  9OwDO4Rznkli0Zz1LF2MnEDOHkaJLbMMQGw2AV2Jc4/XAhVxcIgI6Elc/ScKEhYWcJD4OuMVG
  4jNIqAqcezIYTCbV8BdYumG68wgtoSAgsSUh++ZIeKCEidnPgEbzywgIXHwxQtmkJESAooSs6
  fLQ5RXSLw+fAmqVU3i6rlNzBMY+WYh6Z6FpHsBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdE10
  jY0u9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzknBS9vNSSTYzAsEspZnm/g7Gp76feIUZJ
  DiYlUd5g1u2JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4f5sD5QSLUtNTK9Iyc4AxAJOW4OBRE
  uF19wRK8xYXJOYWZ6ZDpE4x6nK8bvm5g1mIJS8/L1VKnPcFSJEASFFGaR7cCFg8XmKUlRLmZW
  RgYBDiKUgtys0sQZV/xSjOwagkzJvsCDSFJzOvBG7TK6AjmICOYKzcDHJESSJCSqqBaVJb0vV
  6x6wrGTvqVKWDddbnpVn1ufrfvhLDLnvml+vBt1+cL5yv7Fl95cEdPasZsVc3Hq7NvPp5/+ri
  5Up3o16IFX1r/Gc0L3mSrcQiXb4a391xJ/qPnynivDv7UrvM896i1gXVlwO93kpOfG6ixHJJ0
  OvdvalRFwq9zJ2tX50KLNM71mG0RSFoa36lyVFP7y8xO/lKs5+zO37osf97v3+ijSnbwuTpQR
  /CEvbpq4rrHX+9SPomcwzvgdBvcq0bpO56dplbdpYy95wq/Mt691D/n0r3fwFX63xnK+WcLwq
  0UD21XbU2x3X7nPTN29UnmdfeXDDRYvFC+daqPWUfDitLFShI+dX6TpHyiExRYinOSDTUYi4q
  TgQAfdua40IDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1639402231!2131!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2497 invoked from network); 13 Dec 2021 13:30:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:30:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D5906100242
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:30:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C9D7E100239
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:30:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:30:09 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.13.07 -> 0.13.08
Date: Tue, 14 Dec 2021 06:30:03 +0800
Message-ID: <1639434603-2635-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:30:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159633

0001-Do-not-preserve-ownership-when-installing-example-jo.patch
removed since it is included in 0.13.08

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ownership-when-installing-example-jo.patch | 24 -------------------
 ...ess-ng_0.13.07.bb => stress-ng_0.13.08.bb} |  6 ++---
 2 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.07.bb => stress-ng_0.13.08.bb} (80%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
deleted file mode 100644
index 107b83d20b..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From f14d9d8184753dfbff99d7a51939145355627dcd Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 30 Jul 2019 18:38:03 +0200
-Subject: [PATCH] Do not preserve ownership when installing example jobs
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/162]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 91d8ed4..72d0ca0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -502,6 +502,6 @@ else
- 	cp stress-ng.1 ${DESTDIR}${MANDIR}
- endif
- 	mkdir -p ${DESTDIR}${JOBDIR}
--	cp -rp example-jobs/*.job ${DESTDIR}${JOBDIR}
-+	cp -r example-jobs/*.job ${DESTDIR}${JOBDIR}
- 	mkdir -p ${DESTDIR}${BASHDIR}
- 	cp bash-completion/stress-ng ${DESTDIR}${BASHDIR}
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.07.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.08.bb
similarity index 80%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.07.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.08.bb
index b96d16fa7b..f7197a27fa 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.07.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.08.bb
@@ -5,10 +5,8 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
-           file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
-           "
-SRCREV = "924a37f50f73207fa230ae27a63897c77ff8e6cc"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRCREV = "0af163e0e378e5c62abb9328a27b653289c05679"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.25.1


