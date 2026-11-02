Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13526.1793629583813736209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 06:26:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OE97LgVh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D2AEC4FECD
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 14:27:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BD9B60750;
	Mon,  2 Nov 2026 14:26:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09DDF1032909D;
	Mon,  2 Nov 2026 15:26:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793629576; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1H+I+pP010UA2Rw/wxLU56TEj1mIvXkC00mKr3Z3ELs=;
	b=OE97LgVhZRKFNKnBDv69SSf7tySYfXKH3Udvx4qCNrXmaj7JD373lVliah7ZuzRD14v75D
	dizfM+SrIKRD4q5FMf3uBSNJyZeNnzAcaiToBdiVR4/aJP/IGdBpv10KEsfwylZc7z4kAD
	eXhdVny7iA8mXiTrLC3hW8qtuAUvbEZMDB7vXxJ35F1zexePo/VhysnHBrnnHWHjOlIz6m
	Cg46GO04l7PnP3LnCNWba8m6B2ZcQSem5YcnnnoRembomqYsJKKoHkhEhD+CfPQAPhyYjT
	MwHDA3ca0cMOcptTzLagM44Nn/xCqyTHsOF0QGi1CfjwVNPgPzQlLwigsZUfBA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 02 Nov 2026 15:26:09 +0100
Subject: [PATCH] python3-sbom-cve-check: update to version 1.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-sbom-cve-check-update-1-4-0-v1-1-ba8e76e1359d@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQqDMAwA0F+RnA00RQrbr4wd2hhnNqbSqAjiv
 9vN47u8HUyyisG92iHLqqbjUEB1BdzH4SWobTF45wOR82hp/CKvgtwLf3CZ2jgLEjboMMVAIXZ
 8C8lDGaYsnW7//fG8bEt6C8+/Eo7jBEbj3w5/AAAA
X-Change-ID: 20261102-sbom-cve-check-update-1-4-0-ba616afc96b2
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 14:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249212

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.4.0

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
This release introduces an OpenVEX export type and fixes various issues.
Most importantly, it corrects the CVE assessment for the Linux kernel:
previously, a large number of CVEs were incorrectly marked as fixed when
they should have been marked as affected.
---
 ...{python3-sbom-cve-check_1.3.5.bb => python3-sbom-cve-check_1.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
similarity index 80%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
index 5396720fbd0a..fe38fed5ea3c 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
-SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
+SRC_URI[sha256sum] = "b0dfd6a60c715d7b4694897fdde5dddac0524e9bb25bc6736160712ce1d91e86"
 
 inherit pypi python_hatchling
 

---
base-commit: 5ffd9e055469165d486048cd1f505058dbc35b63
change-id: 20261102-sbom-cve-check-update-1-4-0-ba616afc96b2

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

