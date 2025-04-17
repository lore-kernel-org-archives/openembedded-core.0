Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05953C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 15:18:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11466.1744903100096974669
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 08:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 279131515
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:18:17 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4E1E13F59E
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:18:19 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] autoconf: upgrade to final 2.72 release
Date: Thu, 17 Apr 2025 16:18:13 +0100
Message-ID: <20250417151813.2295435-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 15:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215099

autoconf 2.72e was the fifth release candidate build, and whilst we had
good reason to use RCs during development we failed to notice that the
final release was made because alpha.gnu.org _only_ contains the release
candidates.

There are minimal changes in the final release compared to 2.72e:

6199cff2 (tag: v2.72) Finalize NEWS for release 2.72.

  This is the finalisation of the release, updating documentation and
  version numbers.

e544a323 Save/restore AC_LANG setting in AC_PROG_CC_C_O.

  This is a bug fix, aligning behaviour of AC_PROG_CC_C_O.

634fb3e7 Remove bashism from tests/local.at.
4fbe6436 Revert debugging change committed by mistake
8794cd1c Address =E2=80=9Cautom4te preselections=E2=80=9D testsuite failu=
re
e5d98f4c Avoid a spurious test failure with shells that ignore write erro=
rs.
3fbfb13e Address =E2=80=9Cautoconf: forbidden tokens, basic=E2=80=9D test=
suite failure
fdb58df6 testsuite: Skip tests that use aclocal or automake if they=E2=80=
=99re too old.

  These are fixes for the test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../autoconf/{autoconf_2.72e.bb =3D> autoconf_2.72.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/autoconf/{autoconf_2.72e.bb =3D> autoconf_2=
.72.bb} (94%)

diff --git a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb b/meta/reci=
pes-devtools/autoconf/autoconf_2.72.bb
similarity index 94%
rename from meta/recipes-devtools/autoconf/autoconf_2.72e.bb
rename to meta/recipes-devtools/autoconf/autoconf_2.72.bb
index db374373cff..f2d2781fec9 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.72e.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.72.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcc3f3a7596cb=
558bbd9eb7fbaa3ef16c \
 		    file://COPYINGv3;md5=3D1ebbd3e34237af26da5dc08a4e440464"
=20
 SRC_URI =3D " \
-           https://alpha.gnu.org/gnu/autoconf/${BP}.tar.gz \
+           ${GNU_MIRROR}/autoconf/${BP}.tar.gz \
            file://program_prefix.patch \
            file://autoreconf-exclude.patch \
            file://remove-usr-local-lib-from-m4.patch \
@@ -22,7 +22,7 @@ SRC_URI =3D " \
 "
 SRC_URI:append:class-native =3D " file://no-man.patch"
=20
-SRC_URI[sha256sum] =3D "f3478d3b597d51f5d61596fb2f6f6aba49cdd974b4b05ff0=
bac57f56b5cfdb39"
+SRC_URI[sha256sum] =3D "afb181a76e1ee72832f6581c0eddf8df032b83e2e0239ef7=
9ebedc4467d92d6e"
=20
 RDEPENDS:${PN} =3D "m4 gnu-config \
 		  perl \
--=20
2.43.0


