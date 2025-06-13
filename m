Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A121AC71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 13:16:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.10090.1749820582910912706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 06:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 288331C0A
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:02 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20D423F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:16:22 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] default-distrovars: set an empty default for LICENSE_PATH
Date: Fri, 13 Jun 2025 14:16:10 +0100
Message-ID: <20250613131620.221912-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:16:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218601

This variable is a list of paths that contain extra license texts. It
doesn't have a default so can be unset.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/default-distrovars.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
index 85835c4c617..9ea3b5414c7 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -36,6 +36,7 @@ COMMERCIAL_VIDEO_PLUGINS ?=3D ""
 # COMMERCIAL_VIDEO_PLUGINS ?=3D "gst-plugins-ugly-mpeg2dec gst-plugins-u=
gly-mpegstream gst-plugins-bad-mpegvideoparse"
 # Set of common licenses used for license.bbclass
 COMMON_LICENSE_DIR ??=3D "${COREBASE}/meta/files/common-licenses"
+LICENSE_PATH ??=3D ""
=20
 BB_GENERATE_MIRROR_TARBALLS ??=3D "0"
=20
--=20
2.43.0


