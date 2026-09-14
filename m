Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED766C88E64
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 12:08:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18489.1789387693143238086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 05:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=ZGr2DB3c;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDCF31570
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:08 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26FE43F86F
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789387692; bh=6WIbnJ66mt8PWdz4SdfJtYsNV4JQ0HZSr82YOGsuEWg=;
	h=From:To:Subject:Date:From;
	b=ZGr2DB3crnMTJ0lYMdNt1AXVdUTXfVGiB0xVTG568WEbpoRmZ4h1JlgzvosL8Vtov
	 mK/wQO/ilpKYZ5pYzNTFNmxZ2pBJvdqaOVb21hSUA7y7Hg4jwSNzlqAdPoEaT5h7DC
	 eCFL+MsC4IeWmMXckJ0l5zo2y/Nm7btC9g+BXwA8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] xdg-utils: switch to git
Date: Mon, 14 Sep 2026 13:08:03 +0100
Message-ID: <20260914120807.2162673-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 12:08:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245766

Tarballs haven't been uploaded to portland.freedesktop.org for some time
now, so we missed several upstream releases.

Upstream isn't making tarball releases, so switch to git clones. The
version is not changed here and the end result is identical.

Also make the description more concise as 12 lines is a little excessive.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xdg-utils/xdg-utils_1.1.3.bb              | 20 +++----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/re=
cipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index e39a65831e0..d7a103c1f81 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -1,32 +1,18 @@
 SUMMARY =3D "Basic desktop integration functions"
 HOMEPAGE =3D "https://www.freedesktop.org/wiki/Software/xdg-utils/"
-DESCRIPTION =3D "The xdg-utils package is a set of simple scripts that p=
rovide basic \
-desktop integration functions for any Free Desktop, such as Linux. \
-They are intended to provide a set of defacto standards. \
-The following scripts are provided at this time: \
-xdg-desktop-icon \
-xdg-desktop-menu \
-xdg-email \
-xdg-icon-resource \
-xdg-mime \
-xdg-open \
-xdg-screensaver \
-xdg-terminal \
-"
+DESCRIPTION =3D "The xdg-utils package is a set of simple scripts that p=
rovide basic desktop integration functions."
=20
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da5367a90934098d6b05af3b746405=
014"
=20
-SRC_URI =3D "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.=
gz \
+SRC_URI =3D "git://gitlab.freedesktop.org/xdg/xdg-utils.git;protocol=3Dh=
ttps;branch=3Dmaster;tag=3Dv${PV} \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
            file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
            file://CVE-2022-4055.patch \
           "
=20
-SRC_URI[sha256sum] =3D "d798b08af8a8e2063ddde6c9fa3398ca81484f27dec642c5=
627ffcaa0d4051d9"
-
-UPSTREAM_CHECK_REGEX =3D "xdg-utils-(?P<pver>((\d+[\.\-_]*)+)((rc|alpha|=
beta)\d+)?)\.(tar\.gz|tgz)"
+SRCREV =3D "159fc37075db2decf446f453fe1a796da6921aad"
=20
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep features_check
--=20
2.43.0


