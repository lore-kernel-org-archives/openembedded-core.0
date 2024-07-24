Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB88EC3DA7E
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:08:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14792.1721837320974530714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B5B1DA7
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:09:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 293FF3F73F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:08:40 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] ptest-packagelists: sort entries
Date: Wed, 24 Jul 2024 17:08:29 +0100
Message-Id: <20240724160832.2384962-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202459

Sort the entries for OCD reasons.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
index 5e90096b1e8..08a8d612048 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -28,22 +28,23 @@ PTESTS_FAST =3D "\
     json-c \
     json-glib \
     libconvert-asn1-perl \
+    libexif \
     libgpg-error\
     libnl \
     libpcre \
     libssh2 \
-    libtimedate-perl \
     libtest-fatal-perl \
     libtest-needs-perl \
     libtest-warnings-perl \
+    libtimedate-perl \
     libtry-tiny-perl \
     liburi-perl \
     libusb1 \
     libxml-namespacesupport-perl \
-    libxml-perl \
     libxml-parser-perl \
-    libxml-sax-perl \
+    libxml-perl \
     libxml-sax-base-perl \
+    libxml-sax-perl \
     libxml-simple-perl \
     libxml2 \
     libxmlb \
@@ -57,6 +58,7 @@ PTESTS_FAST =3D "\
     python3-atomicwrites \
     python3-attrs \
     python3-bcrypt \
+    python3-beartype \
     python3-calver \
     python3-hypothesis \
     python3-jinja2 \
@@ -81,7 +83,6 @@ PTESTS_FAST =3D "\
     wayland \
     xz \
     zlib \
-    libexif \
 "
 PTESTS_FAST:append:libc-glibc =3D " glibc-y2038-tests"
 PTESTS_PROBLEMS:remove:libc-glibc =3D "glibc-y2038-tests"
@@ -106,22 +107,22 @@ PTESTS_SLOW =3D "\
     libevent \
     libgcrypt \
     libmodule-build-perl \
+    libseccomp \
     lttng-tools \
+    lz4 \
     openssh \
     openssl \
     parted \
     perl \
-    python3-cryptography \
     python3 \
     python3-click \
+    python3-cryptography \
     python3-xmltodict \
     strace \
     tar \
     tcl \
     util-linux \
     valgrind \
-    lz4 \
-    libseccomp \
 "
=20
 # python3 ptests hang on qemuriscv64
--=20
2.34.1


