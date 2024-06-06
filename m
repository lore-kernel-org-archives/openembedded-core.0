Return-Path: <michael@opdenacker.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E045C27C54
	for <webhook@archiver.kernel.org>; Thu,  6 Jun 2024 14:18:33 +0000 (UTC)
Received: from sender-op-o19.zoho.eu (sender-op-o19.zoho.eu [136.143.169.19])
 by mx.groups.io with SMTP id smtpd.web11.15694.1717683503178857486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jun 2024 07:18:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: signature did not verify: crypto/rsa: verification error" header.i=michael@opdenacker.org header.s=zmail header.b=I8HGI8/H;
 spf=pass (domain: opdenacker.org, ip: 136.143.169.19, mailfrom: michael@opdenacker.org)
ARC-Seal: i=1; a=rsa-sha256; t=1717683499; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=TirwdZk9FVHYVzPVSvsIlVbg3wWgfQh0FZbeP2f5IpnHZ5fjYdcZ22C1uPukSI0zCjhKya7MeVDbDxNODkMQfXnCt80VcisKKh/hViA9Nmies7u2ZgeDuhT/uaf3V7rsDEQNsdNbnAS6qALG/v0OIKdXgcM5qYInsirUJ+M4sgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1717683499; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lX994H4Sh5/WOkm1ITZqXol3jlqPOCH3UbldLwuySUw=; 
	b=AeteBSFUzmjVT05NFsXcy1p8CB7XaDXqfYOLFapRH2ANlG/wR0PEzoE3lVKsdD5RVc6BAxLP7zo/3tkHU96IB8sYu+NRrwQ3gcAxTqPkUOjiUFkyAOdZmxMU05x2vswRGsxkR+AbXnuT45YJ9mk6xj9vRgb8ODRTqXxcAQ7aoOY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=opdenacker.org;
	spf=pass  smtp.mailfrom=michael@opdenacker.org;
	dmarc=pass header.from=<michael@opdenacker.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1717683499;
	s=zmail; d=opdenacker.org; i=michael@opdenacker.org;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=lX994H4Sh5/WOkm1ITZqXol3jlqPOCH3UbldLwuySUw=;
	b=I8HGI8/HUyRSJJaa7KeZQ63ePtv0f6fDiEFNs3kLGr/NS3DYEiBO10D6vGczq+lz
	IXjCaPFBBLRq8fmjA3TUo6eZBpbGEQVcC8660DCnFBNNsoiXayHHYzqELutJ8x4LsA7
	q+6tMzzOscNCG93sBCYrndEMFpRSSKIADtJOJAMw=
Received: by mx.zoho.eu with SMTPS id 1717683497161370.9845321695965;
	Thu, 6 Jun 2024 16:18:17 +0200 (CEST)
From: michael@opdenacker.org
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael@opdenacker.org>
Subject: [PATCH] maintainers.inc: update self e-mail address
Date: Thu,  6 Jun 2024 16:17:58 +0200
Message-ID: <20240606141758.51552-1-michael@opdenacker.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jun 2024 14:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200405

From: Michael Opdenacker <michael@opdenacker.org>

Signed-off-by: Michael Opdenacker <michael@opdenacker.org>
---
 meta/conf/distro/include/maintainers.inc | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5028a507eb..89a02dd8bd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -31,13 +31,13 @@ RECIPE_MAINTAINER:pn-acl = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-acpica = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-acpid = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-adwaita-icon-theme = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-alsa-lib = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-plugins = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-state = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-alsa-lib = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-plugins = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-state = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-tools = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-topology-conf = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-appstream = "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -174,7 +174,7 @@ RECIPE_MAINTAINER:pn-expect = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-ffmpeg = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-flac = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-font-alias = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-font-util = "Unassigned <unassigned@yoctoproject.org>"
@@ -302,7 +302,7 @@ RECIPE_MAINTAINER:pn-keymaps = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-kmod = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-kmscube = "Carlos Rafael Giani <crg7475@mailbox.org>"
 RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libacpi = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -774,8 +774,8 @@ RECIPE_MAINTAINER:pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.c
 RECIPE_MAINTAINER:pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
-RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
+RECIPE_MAINTAINER:pn-speex = "Michael Opdenacker <michael@opdenacker.org>"
+RECIPE_MAINTAINER:pn-speexdsp = "Michael Opdenacker <michael@opdenacker.org>"
 RECIPE_MAINTAINER:pn-spirv-headers = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-spirv-tools = "Jose Quaresma <quaresma.jose@gmail.com>"
 RECIPE_MAINTAINER:pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"

