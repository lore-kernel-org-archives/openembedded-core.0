Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33443C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 11:05:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5126.1657883136014875556
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 04:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13FE01474;
	Fri, 15 Jul 2022 04:05:36 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B2613F73D;
	Fri, 15 Jul 2022 04:05:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] pulseaudio: add m4-native to DEPENDS
Date: Fri, 15 Jul 2022 12:05:33 +0100
Message-Id: <20220715110533.4008485-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 11:05:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168055

Normally m4-native ends up in the sysroot via the toolchain, but if a
non-standard toolchain is used them m4-native may not be installed.

However Pulseaudio explicitly checks for m4 in the meson.build, so add
it to DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
index 602d7263ce8..6055a9ebadb 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -61,7 +61,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0e5cd938de1a=
7a53ea5adac38cc10c39 \
 "
=20
 # libtool is needed for libltdl, used in module loading.
-DEPENDS =3D "libatomic-ops libsndfile1 libtool"
+DEPENDS =3D "m4-native libatomic-ops libsndfile1 libtool"
 # optional
 DEPENDS +=3D "udev alsa-lib glib-2.0"
 DEPENDS +=3D "speexdsp libxml-parser-perl-native libcap"
--=20
2.34.1


