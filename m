Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC982CCFA0D
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 00:07:01 +0000 (UTC)
Received: from xmbg8.mail.qq.com (xmbg8.mail.qq.com [116.128.173.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.232.1762294730945544497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 14:18:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foxmail.com header.s=s201512 header.b=rATPsut+;
 spf=pass (domain: foxmail.com, ip: 116.128.173.90, mailfrom: wenyang.linux@foxmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1762294723;
	bh=9yLcgfRYz4Pi1Q9yjOapC0oDOXZvBWst3et8MJWd38w=;
	h=From:To:Cc:Subject:Date;
	b=rATPsut+MJi7g029gUagm/yI51MObLJPCJQgVEUm8D7RS42uG7cYH1pRhA8zjhJ01
	 208gPuMh+XsuFQ+pft5A1t+KIS2lLHxmtEcClJpD+xXk0B8EP7R2Xlvu+sUsxSr1LU
	 5w4Oo93RGL4hDJKxDR6S9FQO46Z86GrqFx45EJq8=
Received: from localhost.localdomain ([2409:891f:9263:2dd2:baf3:6f3:1d15:e894])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 3A60744B; Wed, 05 Nov 2025 01:14:38 +0800
X-QQ-mid: xmsmtpt1762276478tcp0vh6wm
Message-ID: <tencent_5A2A52EA8E20CDC9A5F4546616BFFA67FC07@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznabAE4plbYU+03HiWOcgrh9g58LuxLQkx3dCuzZcSU3ha1QzqDB
	 vdqB6K90ZE3+2DCJtrtPUqHbw6BWpg9VB1H61nolKFKUWWRfQ19bQ3DuCBKwjfNNEoGSkjtNVqSt
	 LoVg/LVBaGXTaeYXl1Bflix85NIhWPVyNqP4vk5s3GQ0d8Nmx/IHnmPmz86AZkikHqyrlXzMGVJo
	 UyIN1yera2Wq93dDUPcfACfE0yCwf+0z2GjWQZGPzHS3QMZZS2vEK3cTADZ5qdKZhtZt5LlAJjXH
	 MkEaCe/wKbysmYSsbFfzNno9rAQMVREyJc1Kxr0EskRdw32c5iFOOlC365piIfuzg/3AAi9LDmaK
	 L+bYOvHiZM1SqMLnQHH8MgidWrf1RMBRFeWQ7l6tqFZhexSkUbTv3kCNnTpAIKxEF+b3qGO7uQoU
	 Fpe8aDGTtuYloLDg3+NV36rLs/K4ohK83J/VHvMso3cQ9g+PP5mD47vMFbStR+3O3CZmUGQpkCb4
	 4zjXwwZZn6aAKq6IQ/I/E8JSeNDiTt368kqLrkvcKOdS3KVE2huwccq/QnldsncQFmQRsii3si4o
	 0zUGXYZCSp6afK9MDZKPb8mjf8WBaWhRDcME63Xlrpp94jGnOAjDZJ8z6cXkvby+fa3uvOjpsNR7
	 tlT1fPjrLrfi4wUJ+vasNTeCFPghxtXChmNTTzfs9QGOSbfAzzdgnW1Z+2Z1g47t7n/S13VjJwn/
	 rcI8dlKKW4VnaE72CfkT8IEajjZPGVpoJ7ZK/gbiKYts+EdZ68xVe/VlEl6nVf2+Ya6BJcwklrBX
	 DHm5sCDj7ILsVZ9TuKiOGaEqO22X2a7W0vuBPUXsX5+34Q3vcvQsq6lEybU+sthjJDoQMm5CNN6z
	 SAURZ9Q9I9zq00ew1NVsbTFCuFPtzUStQmcG54kSYhrcc270VmEhgWQ+cFq2nvKt/Md2NVjOlvui
	 +SfCDHPx1tED63vXIEu/ZXPYscrk+a4kkA/cpEqavS9aOU/NAAdE74xiDyrFgUYhK/7V0L4qjQRz
	 KPvdEV59NJyPoiJzadaFaLzKWPtG6tnDuF1FtHL0FBP9G8MF8vsT47PBRJnRc=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: wenyang.linux@foxmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: Wen Yang <wenyang.linux@foxmail.com>
Subject: [meta-oe][PATCH] nethogs: add recipe
Date: Wed,  5 Nov 2025 01:14:36 +0800
X-OQ-MSGID: <20251104171436.13056-1-wenyang.linux@foxmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 00:07:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225960

From: Wen Yang <wenyang.linux@foxmail.com>

NetHogs is a small 'net top' tool. Instead of breaking the traffic
down per protocol or per subnet, like most tools do, it groups
bandwidth by process.

Signed-off-by: Wen Yang <wenyang.linux@foxmail.com>
---
 .../recipes-connectivity/nethogs/nethogs.inc   | 18 ++++++++++++++++++
 .../nethogs/nethogs_0.8.8.bb                   |  4 ++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs.inc
 create mode 100644 meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb

diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs.inc b/meta-oe/recipes-connectivity/nethogs/nethogs.inc
new file mode 100644
index 0000000000..78c92915c9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/nethogs.inc
@@ -0,0 +1,18 @@
+SUMMARY = "NetHogs is a small 'net top' tool that can group bandwidth by process"
+HOMEPAGE = "https://github.com/raboof/nethogs"
+SECTION = "console/network"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://github.com/raboof/nethogs.git;branch=main;protocol=https"
+DEPENDS = "ncurses libpcap"
+
+do_compile() {
+    oe_runmake nethogs
+}
+
+do_install() {
+    oe_runmake install PREFIX=${prefix} DESTDIR=${D}
+}
+
+FILES:${PN} = "${sbindir}/nethogs"
diff --git a/meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb b/meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb
new file mode 100644
index 0000000000..cb0c4b68eb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/nethogs/nethogs_0.8.8.bb
@@ -0,0 +1,4 @@
+require nethogs.inc
+
+# tag for v0.8.8
+SRCREV = "632a78846eb3cc3259dc45c59a47fa9c293a2831"
-- 
2.25.1


