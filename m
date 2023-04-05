Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9C1C761A6
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 15:44:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.133702.1680709460336606887
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 08:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9983740C3A
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Apr 2023 15:44:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w9jtsz0UtIVB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2023 15:44:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8819C40C21
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Apr 2023 15:44:19 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 461D01637F6;
	Wed,  5 Apr 2023 11:43:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] xz: upgrade 5.4.1 -> 5.4.2
Date: Wed,  5 Apr 2023 15:44:08 +0000
Message-Id: <20230405154409.4035459-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 15:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179742

COPYING files had 2 updates w/o affecting licensing:
* URLs to gnu.org and fsf.org switched to https
* Clarifying licensing of liblzma Doxygen-generated docs - details below

5.4.2 (2023-03-18)
    * All fixes from 5.2.11 that were not included in 5.4.1.
    * If xz is built with support for the Capsicum sandbox but running
      in an environment that doesn't support Capsicum, xz now runs
      normally without sandboxing instead of exiting with an error.
    * liblzma:
        - Documentation was updated to improve the style, consistency,
          and completeness of the liblzma API headers.
        - The Doxygen-generated HTML documentation for the liblzma API
          header files is now included in the source release and is
          installed as part of "make install". All JavaScript is
          removed to simplify license compliance and to reduce the
          install size.
        - Fixed a minor bug in lzma_str_from_filters() that produced
          too many filters in the output string instead of reporting
          an error if the input array had more than four filters. This
          bug did not affect xz.
    * Build systems:
        - autogen.sh now invokes the doxygen tool via the new wrapper
          script doxygen/update-doxygen, unless the command line option
          --no-doxygen is used.
        - Added microlzma_encoder.c and microlzma_decoder.c to the
          VS project files for Windows and to the CMake build. These
          should have been included in 5.3.2alpha.
    * Tests:
        - Added a test to the CMake build that was forgotten in the
          previous release.
        - Added and refactored a few tests.
    * Translations:
        - Updated the Brazilian Portuguese translation.
        - Added Brazilian Portuguese man page translation.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/recipes-extended/xz/{xz_5.4.1.bb =3D> xz_5.4.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.4.1.bb =3D> xz_5.4.2.bb} (87%)

diff --git a/meta/recipes-extended/xz/xz_5.4.1.bb b/meta/recipes-extended=
/xz/xz_5.4.2.bb
similarity index 87%
rename from meta/recipes-extended/xz/xz_5.4.1.bb
rename to meta/recipes-extended/xz/xz_5.4.2.bb
index 71bf4b540a..87f9602bf6 100644
--- a/meta/recipes-extended/xz/xz_5.4.1.bb
+++ b/meta/recipes-extended/xz/xz_5.4.2.bb
@@ -17,15 +17,15 @@ LICENSE:${PN}-dbg =3D "GPL-2.0-or-later"
 LICENSE:${PN}-locale =3D "GPL-2.0-or-later"
 LICENSE:liblzma =3D "PD"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97d554a32881fee0aa283d96e47cb=
24a \
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc8ea84ebe7b93cce676b54355dc6b=
2c0 \
                     file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263 \
-                    file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d4=
7fae504 \
+                    file://COPYING.GPLv3;md5=3D1ebbd3e34237af26da5dc08a4=
e440464 \
                     file://COPYING.LGPLv2.1;md5=3D4fbd65380cdd2559510790=
08b364516c \
                     file://lib/getopt.c;endline=3D23;md5=3D2069b0ee71057=
2c03bb3114e4532cd84 \
                     "
=20
 SRC_URI =3D "https://tukaani.org/xz/xz-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "e4b0f81582efa155ccf27bb88275254a429d44968e488fc9=
4b806f2a61cd3e22"
+SRC_URI[sha256sum] =3D "87947679abcf77cc509d8d1b474218fd16b72281e2797360=
e909deaee1ac9d05"
 UPSTREAM_CHECK_REGEX =3D "xz-(?P<pver>\d+(\.\d+)+)\.tar"
=20
 CACHED_CONFIGUREVARS +=3D "gl_cv_posix_shell=3D/bin/sh"
--=20
2.25.1


