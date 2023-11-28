Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA26C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 07:36:44 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.27745.1701157000368630532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 23:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=RBtKN9El;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-456497-202311280736377ac64c3561b70353fb-07zdzg@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202311280736377ac64c3561b70353fb
        for <openembedded-core@lists.openembedded.org>;
        Tue, 28 Nov 2023 08:36:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=klhBAVE/890Evw9o4WGBjW+DdOtN/wMmoYtceVBNQCk=;
 b=RBtKN9ElarBJ7pihwXI2albAgoyTr1IfRYR0YD5fxBC4mJ9nQw2RZQ/6QldRfyKAN6io51
 /Ft+wgEoI1IG1BSAgZQeHEBWy4N6qPv7q2lKWY/hWzohBwYPi0hnlfTqn0PfaBmtIrVM4bKN
 8avZMm0jVQkpwRBNy5+UGueumT+rs=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH] rdfind: add version 1.6.0
Date: Tue, 28 Nov 2023 08:36:29 +0100
Message-ID: <20231128073632.38829-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 07:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191335

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add 1.6.0 recipe from meta-oe as of commit 39dfcaceba36
("rdfind: upgrade 1.5.0 -> 1.6.0"). It's required by linux-firmware
installer script starting from 20230919.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Shall probably come before patch "linux-firmware: require rdfind-native".
Link: https://patchwork.yoctoproject.org/project/oe-core/patch/20231127203230.2704211-1-alexander.sverdlin@siemens.com/

 meta/recipes-support/rdfind/rdfind_1.6.0.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-support/rdfind/rdfind_1.6.0.bb

diff --git a/meta/recipes-support/rdfind/rdfind_1.6.0.bb b/meta/recipes-support/rdfind/rdfind_1.6.0.bb
new file mode 100644
index 00000000000..3a15fe6c9a2
--- /dev/null
+++ b/meta/recipes-support/rdfind/rdfind_1.6.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Rdfind is a program that finds duplicate files"
+HOMEPAGE = "https://rdfind.pauldreik.se/"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fa22e16ebbe6638b2bd253338fbded9f"
+
+DEPENDS = "nettle autoconf-archive"
+
+SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz"
+SRC_URI[sha256sum] = "7a406e8ef1886a5869655604618dd98f672f12c6a6be4926d053be65070f3279"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


