Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49773C88E42
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11258.1789038274653029211
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 04:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=D/zpLbAq;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53D1CC2BB3B;
	Thu, 10 Sep 2026 11:05:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A0DE602B8;
	Thu, 10 Sep 2026 11:04:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1462D11C78B4F;
	Thu, 10 Sep 2026 13:04:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789038272; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CCIzJL1Sn+VUHWfDIHYjFWMGCHXB0lAFUVheqawyhas=;
	b=D/zpLbAqEiJOvTVYQdkuEgZSxNGCx3rtZvJfnoJeHO0IdDdDdA51oXB6ueo+eIbr2HXSqh
	/NEFT4hE5CA9GriqWf6WqBhDEKUdF6W1MuIxd3DFy2hKkzRcC7/mF26iN8Mt5GPj0JR4WQ
	e810WZ6xdmbiw1z2rTWm6rHGPFtUJNNGp9M0iWCfqwm2SqwgYqQD1LIUp5qfZb1TC/k6ju
	08B9sd1UoSg5AMy69ncNMhkRL03vNF7t5Pgq/tgJuqWxqxx89M32CbfF1OJkspAahc1YKk
	TMsABeW66SHDFSFQMfw4ZlI7wGeZ/cME/k0aSp7y9fkpGeTp1NXRBET1livILw==
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Date: Thu, 10 Sep 2026 13:04:00 +0200
Subject: [PATCH 7/7] dpkg: 1.23.7 -> 1.23.11
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260910-mathieu-updates-2026-09-10-v1-7-da1b555eace9@bootlin.com>
References: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
In-Reply-To: <20260910-mathieu-updates-2026-09-10-v1-0-da1b555eace9@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789038241; l=21890;
 i=mathieu.dubois-briand@bootlin.com; s=20241219; h=from:subject:message-id;
 bh=TmbBq0Vyoxie4RzPND7WsdgHBm4bbI5ei72Owanq/es=;
 b=h1Mq76rUzXGsiCl380sGiSPv4pOegy8F8gb4y1HYyrZI7n0o5PvBVOLmJOax3DDpSuGiuyRDe
 nS0VqfHptoxAPayoxfrPDCvTM3LQInDXEQoYa/f+kJ7RBnuv1/V389t
X-Developer-Key: i=mathieu.dubois-briand@bootlin.com; a=ed25519;
 pk=1PVTmzPXfKvDwcPUzG0aqdGoKZJA3b9s+3DqRlm0Lww=
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 11:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245557

Changelog: https://salsa.debian.org/dpkg-team/dpkg/-/blob/d0dbbb454332e57=
c4e713d2a4a61b547a0f9232c/debian/changelog

Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../dpkg/0001-Add-support-for-riscv32-CPU.patch    |  6 ++---
 ...01-build.c-ignore-return-of-1-from-tar-cf.patch |  7 ++----
 .../dpkg/0001-dpkg-Support-muslx32-build.patch     |  6 ++---
 ...tions-dirs.c-set_rootfs-was-not-checking-.patch |  7 ++----
 .../dpkg/0001-pkg-log.c-Add-missing-header.patch   | 29 ++++++++++++++++=
++++++
 .../dpkg/0001-script.c-avoid-use-of-chroot.patch   | 14 +++++------
 ...nux-wrs-kernel-version-which-has-characte.patch |  7 ++----
 ...-function-doesn-t-work-properly-for-all-s.patch | 18 +++++++-------
 ...0006-add-musleabi-to-known-target-tripets.patch |  6 ++---
 ...uild.c-Remove-usage-of-clamp-mtime-in-tar.patch |  7 ++----
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        |  4 +--
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch      |  7 ++----
 meta/recipes-devtools/dpkg/dpkg/noman.patch        |  4 +--
 .../dpkg/dpkg/remove-tar-no-timestamp.patch        |  9 +++----
 meta/recipes-devtools/dpkg/dpkg/run-ptest          |  3 +++
 .../dpkg/{dpkg_1.23.7.bb =3D> dpkg_1.23.11.bb}       |  3 ++-
 16 files changed, 76 insertions(+), 61 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32=
-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32=
-CPU.patch
index 8943f6c2f02a..834c5116e0dc 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.pa=
tch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.pa=
tch
@@ -1,4 +1,4 @@
-From 5c332c2a4625519a2b6065b9d9fc724e84c9b6d6 Mon Sep 17 00:00:00 2001
+From ced05d08a83a55ae557228b613619e465be491dd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/data/cputable b/data/cputable
-index 575c008e3..7a801a03a 100644
+index 0da0281c3c27..14cb42f2ef8a 100644
 --- a/data/cputable
 +++ b/data/cputable
 @@ -43,6 +43,7 @@ powerpc		powerpc		(powerpc|ppc)		32	big
@@ -23,7 +23,7 @@ index 575c008e3..7a801a03a 100644
  s390		s390		s390			32	big
  s390x		s390x		s390x			64	big
 diff --git a/scripts/Dpkg/Vendor/Debian.pm b/scripts/Dpkg/Vendor/Debian.=
pm
-index edf94bc19..d76f97494 100644
+index 15f0840f82cc..5d462caada32 100644
 --- a/scripts/Dpkg/Vendor/Debian.pm
 +++ b/scripts/Dpkg/Vendor/Debian.pm
 @@ -216,6 +216,7 @@ sub set_build_features {
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-o=
f-1-from-tar-cf.patch b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-igno=
re-return-of-1-from-tar-cf.patch
index 166059742214..fc96dbfff35e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-fro=
m-tar-cf.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-build.c-ignore-return-of-1-fro=
m-tar-cf.patch
@@ -1,4 +1,4 @@
-From 5014728695639f33895feff9cabad199b0612c45 Mon Sep 17 00:00:00 2001
+From e13096fb5b55c9c4d7f05da5963eff4c2cde8d15 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@microsoft.com>
 Date: Sun, 8 Feb 2026 21:34:54 -0800
 Subject: [PATCH] build.c: ignore return of 1 from tar -cf
@@ -31,7 +31,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
=20
 diff --git a/src/deb/build.c b/src/deb/build.c
-index f7a0156f1..67e758185 100644
+index f7a0156f1275..67e758185b6b 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -526,6 +526,7 @@ tarball_pack(const char *dir, filenames_feed_func *t=
ar_filenames_feeder,
@@ -53,6 +53,3 @@ index f7a0156f1..67e758185 100644
  }
 =20
  static intmax_t
---=20
-2.49.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-bu=
ild.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-bui=
ld.patch
index 67fce89d8059..12f56147aa78 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.pat=
ch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.pat=
ch
@@ -1,4 +1,4 @@
-From df6c641e3fc248d0c864e4e752c4609412067df7 Mon Sep 17 00:00:00 2001
+From 14b3bbbcfd8505c3833bbb40d2472a23d1bcf5ef Mon Sep 17 00:00:00 2001
 From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
@@ -13,7 +13,7 @@ Signed-off-by: sweeaun <swee.aun.khor@intel.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/data/ostable b/data/ostable
-index 860355774..28779beca 100644
+index edfa2e0b27a6..a40f7c7fa578 100644
 --- a/data/ostable
 +++ b/data/ostable
 @@ -21,6 +21,7 @@ base-uclibc-linux	linux-uclibc		linux[^-]*-uclibc
@@ -25,7 +25,7 @@ index 860355774..28779beca 100644
  eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
  abin32-gnu-linux	linux-gnuabin32		linux[^-]*-gnuabin32
 diff --git a/data/tupletable b/data/tupletable
-index 82ae3604e..707d85bdb 100644
+index 6168027dc761..42162bc93f7e 100644
 --- a/data/tupletable
 +++ b/data/tupletable
 @@ -26,6 +26,7 @@ base-uclibc-linux-<cpu>		uclibc-linux-<cpu>
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c=
-set_rootfs-was-not-checking-.patch b/meta/recipes-devtools/dpkg/dpkg/000=
1-lib-dpkg-options-dirs.c-set_rootfs-was-not-checking-.patch
index 34060c746346..36401e112a82 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_ro=
otfs-was-not-checking-.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_ro=
otfs-was-not-checking-.patch
@@ -1,4 +1,4 @@
-From c036cfa1ee53a900b4ed45bc91e45a0792547eea Mon Sep 17 00:00:00 2001
+From 4958631014017b179406396bd600a4eb40792be2 Mon Sep 17 00:00:00 2001
 From: Mark Hatle <mark.hatle@kernel.crashing.org>
 Date: Sat, 17 Jan 2026 20:20:23 +0000
 Subject: [PATCH] lib/dpkg/options-dirs.c: set_rootfs was not checking
@@ -18,7 +18,7 @@ Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.o=
rg>
  1 file changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/lib/dpkg/options-dirs.c b/lib/dpkg/options-dirs.c
-index 9b7a122fe..34869d792 100644
+index 9b7a122fe92a..34869d792fc5 100644
 --- a/lib/dpkg/options-dirs.c
 +++ b/lib/dpkg/options-dirs.c
 @@ -49,13 +49,18 @@ set_admindir(const struct cmdinfo *cip, const char *=
value)
@@ -41,6 +41,3 @@ index 9b7a122fe..34869d792 100644
  	dpkg_db_set_dir(db_dir);
  	free(db_dir);
  }
---=20
-2.30.2
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-missing-h=
eader.patch b/meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-missing-=
header.patch
new file mode 100644
index 000000000000..8ff56bce9672
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-pkg-log.c-Add-missing-header.p=
atch
@@ -0,0 +1,29 @@
+From 0fd1a56b750c42efe392d58fd97a57841ca27491 Mon Sep 17 00:00:00 2001
+From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+Date: Thu, 10 Sep 2026 10:58:19 +0200
+Subject: [PATCH] pkg/log.c: Add missing header
+
+Build is failing with some compilers, as free() is not declared. Add the
+missing stdlib.h include.
+
+Upstream-Status: Submitted [https://lists.debian.org/debian-dpkg/2026/09=
/msg00012.html]
+Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
+---
+ lib/dpkg/log.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/dpkg/log.c b/lib/dpkg/log.c
+index ae65ed4092a3..ef9b209d42a6 100644
+--- a/lib/dpkg/log.c
++++ b/lib/dpkg/log.c
+@@ -29,6 +29,7 @@
+ #include <fcntl.h>
+ #include <unistd.h>
+ #include <stdarg.h>
++#include <stdlib.h>
+=20
+ #include <dpkg/i18n.h>
+ #include <dpkg/dpkg.h>
+--=20
+2.47.3
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-c=
hroot.patch b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-=
chroot.patch
index ffa10142dd54..6152ac8e1cea 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.p=
atch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-script.c-avoid-use-of-chroot.p=
atch
@@ -1,4 +1,4 @@
-From 756513b01ba2d4f0ecfc95955dbe598591ad2d9e Mon Sep 17 00:00:00 2001
+From 4e720386c346db10c0fcd8b20078c05d38c85951 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 8 Feb 2026 21:17:43 -0800
 Subject: [PATCH] script.c: avoid use of chroot
@@ -25,7 +25,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 insertions(+), 53 deletions(-)
=20
 diff --git a/src/main/script.c b/src/main/script.c
-index dd3f3a4bb..9782d0140 100644
+index 951cdfe7b4e9..102740798617 100644
 --- a/src/main/script.c
 +++ b/src/main/script.c
 @@ -99,60 +99,10 @@ static const char *
@@ -47,9 +47,9 @@ index dd3f3a4bb..9782d0140 100644
 -		if (strncmp(admindir, instdir, instdirlen) !=3D 0)
 -			ohshit(_("admindir must be inside instdir for dpkg to work properly"=
));
 -		if (setenv("DPKG_ADMINDIR", admindir + instdirlen, 1) < 0)
--			ohshite(_("unable to setenv for subprocesses"));
+-			ohshite(_("cannot set environment for subprocesses"));
 -		if (setenv("DPKG_ROOT", "", 1) < 0)
--			ohshite(_("unable to setenv for subprocesses"));
+-			ohshite(_("cannot set environment for subprocesses"));
 -
 -		rc =3D chroot(instdir);
 -		if (rc && in_force(FORCE_NON_ROOT) && errno =3D=3D EPERM)
@@ -57,13 +57,13 @@ index dd3f3a4bb..9782d0140 100644
 -			         "directory with --force-not-root, consider "
 -			         "using --force-script-chrootless?"));
 -		else if (rc)
--			ohshite(_("failed to chroot to '%s'"), instdir);
+-			ohshite(_("cannot change root directory to '%s'"), instdir);
 -	}
 -
 -	/* Switch to a known good directory to give the maintainer script
 -	 * a saner environment, also needed after the chroot(). */
 -	if (chdir(changedir))
--		ohshite(_("failed to chdir to '%s'"), changedir);
+-		ohshite(_("cannot change directory to '%s'"), changedir);
 -
 -	if (debug_has_flag(dbg_scripts)) {
 -		struct varbuf args =3D VARBUF_INIT;
@@ -93,5 +93,5 @@ index dd3f3a4bb..9782d0140 100644
 =20
  /**
 --=20
-2.49.0
+2.47.3
=20
diff --git a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kern=
el-version-which-has-characte.patch b/meta/recipes-devtools/dpkg/dpkg/000=
2-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch
index a4f0eb7d8293..a74937dd101c 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-vers=
ion-which-has-characte.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0002-Adapt-to-linux-wrs-kernel-vers=
ion-which-has-characte.patch
@@ -1,4 +1,4 @@
-From 3d27ccbc3409c473a4acba56df15e6b7e71f83fb Mon Sep 17 00:00:00 2001
+From 804e3cc382fc28f2c67dd34fc42997b70d61b337 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 8 Feb 2026 21:11:56 -0800
 Subject: [PATCH] Adapt to linux-wrs kernel version, which has character =
'_'
@@ -16,7 +16,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 4 deletions(-)
=20
 diff --git a/lib/dpkg/parsehelp.c b/lib/dpkg/parsehelp.c
-index 307b7705a..82713c008 100644
+index 307b7705a522..82713c0088c7 100644
 --- a/lib/dpkg/parsehelp.c
 +++ b/lib/dpkg/parsehelp.c
 @@ -303,18 +303,16 @@ parseversion(struct dpkg_version *rversion, const =
char *string,
@@ -40,6 +40,3 @@ index 307b7705a..82713c008 100644
  			return dpkg_put_warn(err, _("invalid character in revision number"))=
;
  	}
 =20
---=20
-2.49.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-do=
esn-t-work-properly-for-all-s.patch b/meta/recipes-devtools/dpkg/dpkg/000=
4-The-lutimes-function-doesn-t-work-properly-for-all-s.patch
index 9e063fa961fd..4c28d1aa51e8 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-w=
ork-properly-for-all-s.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0004-The-lutimes-function-doesn-t-w=
ork-properly-for-all-s.patch
@@ -1,4 +1,4 @@
-From 541260d2d954d53b2fddd20863cf473d53017de2 Mon Sep 17 00:00:00 2001
+From 49df215996fb32133e0e4e3ecdedda301c5259bd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 8 Feb 2026 21:21:43 -0800
 Subject: [PATCH] The lutimes function doesn't work properly for all syst=
ems.
@@ -10,25 +10,25 @@ Upstream-Status: Inappropriate [embedded specific]
 Rebase to 1.23.5
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- src/main/archives.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
+ src/main/archives.c | 2 ++
+ 1 file changed, 2 insertions(+)
=20
 diff --git a/src/main/archives.c b/src/main/archives.c
-index b5c6f0356..6db2c712c 100644
+index ff778bc9cf22..a58b27c2eb3a 100644
 --- a/src/main/archives.c
 +++ b/src/main/archives.c
-@@ -526,9 +526,10 @@ tarobject_set_mtime(struct tar_entry *te, const cha=
r *path)
+@@ -557,9 +557,11 @@ tarobject_set_mtime(struct tar_entry *te, const cha=
r *path)
 =20
  	if (te->type =3D=3D TAR_FILETYPE_SYMLINK) {
  #ifdef HAVE_LUTIMES
--		if (lutimes(path, tv) && errno !=3D ENOSYS)
-+/*		if (lutimes(path, tv) && errno !=3D ENOSYS)
- 			ohshite(_("error setting timestamps of '%s'"),
++	/*
+ 		if (lutimes(path, tv) && errno !=3D ENOSYS)
+ 			ohshite(_("cannot set timestamps of '%s'"),
  			        path);
 +*/
  #endif
  	} else {
  		if (utimes(path, tv))
 --=20
-2.49.0
+2.47.3
=20
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-t=
arget-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-t=
o-known-target-tripets.patch
index 4f60a89a5663..ace43399569e 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-t=
ripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-t=
ripets.patch
@@ -1,4 +1,4 @@
-From e3dc69aa987b379e247dde3fce479e43be6c81aa Mon Sep 17 00:00:00 2001
+From 98da13e96cd24feb19f7f2f1e4cf2b54208b8897 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 30 Dec 2015 23:05:41 +0000
 Subject: [PATCH] add musleabi to known target tripets
@@ -17,7 +17,7 @@ Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@lin=
ux.intel.com>
  2 files changed, 2 insertions(+)
=20
 diff --git a/data/ostable b/data/ostable
-index 64f424490..860355774 100644
+index 5e7490fb49bf..edfa2e0b27a6 100644
 --- a/data/ostable
 +++ b/data/ostable
 @@ -19,6 +19,7 @@
@@ -29,7 +29,7 @@ index 64f424490..860355774 100644
  eabihf-gnu-linux	linux-gnueabihf		linux[^-]*-gnueabihf
  eabi-gnu-linux		linux-gnueabi		linux[^-]*-gnueabi
 diff --git a/data/tupletable b/data/tupletable
-index 7436f8056..82ae3604e 100644
+index bc1fcc5ab808..6168027dc761 100644
 --- a/data/tupletable
 +++ b/data/tupletable
 @@ -24,6 +24,7 @@
diff --git a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove=
-usage-of-clamp-mtime-in-tar.patch b/meta/recipes-devtools/dpkg/dpkg/0007=
-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch
index 6d39e43c5f70..83ec737e4105 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-=
of-clamp-mtime-in-tar.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0007-dpkg-deb-build.c-Remove-usage-=
of-clamp-mtime-in-tar.patch
@@ -1,4 +1,4 @@
-From 5c9c44274ecf0e704e1aadb1001d6df9f3ce403a Mon Sep 17 00:00:00 2001
+From d75a9ae0653ad5f5153af6f6ff7a9b39aa9d50ef Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Sun, 8 Feb 2026 21:25:06 -0800
 Subject: [PATCH] dpkg-deb/build.c: Remove usage of --clamp-mtime in tar
@@ -32,7 +32,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/src/deb/build.c b/src/deb/build.c
-index 259c6251c..f7a0156f1 100644
+index 259c6251ccf2..f7a0156f1275 100644
 --- a/src/deb/build.c
 +++ b/src/deb/build.c
 @@ -553,7 +553,6 @@ tarball_pack(const char *dir, filenames_feed_func *t=
ar_filenames_feeder,
@@ -43,6 +43,3 @@ index 259c6251c..f7a0156f1 100644
  		                 NULL);
  		/* Mode might become a positional argument, pass it
  		 * before -T. */
---=20
-2.49.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patc=
h b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index d1fac2168a90..5793e82092e8 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -1,4 +1,4 @@
-From 8ded32a35287a840de7e505c66e76cccd9edbac6 Mon Sep 17 00:00:00 2001
+From 0535ba354ed82144695178d3831f2db7e7945be4 Mon Sep 17 00:00:00 2001
 From: "Krishnanjanappa, Jagadeesh"
  <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Date: Wed, 8 Apr 2015 18:08:14 +0530
@@ -34,7 +34,7 @@ Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@lin=
ux.intel.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/data/tupletable b/data/tupletable
-index ae9f2ddb4..7436f8056 100644
+index 7c306d497962..bc1fcc5ab808 100644
 --- a/data/tupletable
 +++ b/data/tupletable
 @@ -27,6 +27,7 @@ eabihf-musl-linux-arm		musl-linux-armhf
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes=
-devtools/dpkg/dpkg/arch_pm.patch
index 676e0956cc6d..45d204bb6309 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -1,4 +1,4 @@
-From 961482eef79e90f9be6f60f48a063b66221a8ea1 Mon Sep 17 00:00:00 2001
+From a9eab9d87b6c5e0eb5142d4004727b78749ca5d0 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Sun, 8 Feb 2026 21:06:44 -0800
 Subject: [PATCH] dpkg: fix configuration issue for mips64
@@ -19,7 +19,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 3 deletions(-)
=20
 diff --git a/scripts/Dpkg/Arch.pm b/scripts/Dpkg/Arch.pm
-index 3d9e3e975..05c6debc3 100644
+index 3d9e3e97503b..05c6debc3cc7 100644
 --- a/scripts/Dpkg/Arch.pm
 +++ b/scripts/Dpkg/Arch.pm
 @@ -326,9 +326,6 @@ sub _load_tupletable
@@ -32,6 +32,3 @@ index 3d9e3e975..05c6debc3 100644
                      $debarch_to_debtuple{$da} =3D $dt;
                      $debtuple_to_debarch{$dt} =3D $da;
                  }
---=20
-2.49.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/noman.patch b/meta/recipes-d=
evtools/dpkg/dpkg/noman.patch
index 3f3e08351c52..59edcd52dac2 100644
--- a/meta/recipes-devtools/dpkg/dpkg/noman.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/noman.patch
@@ -1,4 +1,4 @@
-From e671b43a52bf5785fe4aad84712dbabc6c86b39e Mon Sep 17 00:00:00 2001
+From 043745d8dbe5e11007491253a54246238b1ea67f Mon Sep 17 00:00:00 2001
 From: Chris Larson <kergoth@openedhand.com>
 Date: Tue, 5 Sep 2006 07:24:58 +0000
 Subject: [PATCH] Add dpkg, modified from upstream oe.
@@ -9,7 +9,7 @@ Upstream-Status: Inappropriate [disable feature]
  1 file changed, 1 deletion(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 74f8df197..35e5eee39 100644
+index db480795ff72..737d8fe981fe 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -11,7 +11,6 @@ SUBDIRS =3D \
diff --git a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patc=
h b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
index 754b4fef1789..95de07694306 100644
--- a/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/remove-tar-no-timestamp.patch
@@ -1,4 +1,4 @@
-From a559247b71ce44978b7dc49a6fdb51167e22c0bf Mon Sep 17 00:00:00 2001
+From 60d32f2a547c28d7cf7ccb3842664ee8135f2eca Mon Sep 17 00:00:00 2001
 From: Constantin Musca <constantinx.musca@intel.com>
 Date: Sun, 8 Feb 2026 21:03:30 -0800
 Subject: [PATCH] busybox-1.19.4 tar utility doesn't support
@@ -15,10 +15,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/src/deb/extract.c b/src/deb/extract.c
-index e0234726a..e153f72ab 100644
+index 16d559f8303a..0cc390ce9767 100644
 --- a/src/deb/extract.c
 +++ b/src/deb/extract.c
-@@ -353,7 +353,6 @@ extracthalf(const char *debar, const char *dir,
+@@ -371,7 +371,6 @@ extracthalf(const char *debar, const char *dir,
 =20
  			command_add_arg(&cmd, "-f");
  			command_add_arg(&cmd, "-");
@@ -26,6 +26,3 @@ index e0234726a..e153f72ab 100644
 =20
  			m_dup2(p2[0], 0);
  			close(p2[0]);
---=20
-2.49.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/run-ptest b/meta/recipes-dev=
tools/dpkg/dpkg/run-ptest
index 8c4739ab6626..86a1e0aea56d 100644
--- a/meta/recipes-devtools/dpkg/dpkg/run-ptest
+++ b/meta/recipes-devtools/dpkg/dpkg/run-ptest
@@ -16,6 +16,9 @@ done
 # This allows running tests that require root access (which we have)
 export DPKG_AS_ROOT=3D1
=20
+# This allows running tests that require permissions to use mkdnod (whic=
h we have)
+export DPKG_SYS_HAS_MKNOD=3D1
+
 for test in $(grep "TESTS_PASS +=3D" Makefile | cut -f3 -d" "); do
     ALL_TESTS=3D$((ALL_TESTS + 1))
     make ${test}-test >> ../dpkg-test.log 2>&1
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb b/meta/recipes-dev=
tools/dpkg/dpkg_1.23.11.bb
similarity index 90%
rename from meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.23.11.bb
index 8e838b2d058f..94e881096c47 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.23.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.23.11.bb
@@ -15,8 +15,9 @@ SRC_URI =3D "git://salsa.debian.org/dpkg-team/dpkg.git;=
protocol=3Dhttps;branch=3Dmain;
            file://0001-dpkg-Support-muslx32-build.patch \
            file://0001-Add-support-for-riscv32-CPU.patch \
            file://0001-lib-dpkg-options-dirs.c-set_rootfs-was-not-checki=
ng-.patch \
+           file://0001-pkg-log.c-Add-missing-header.patch \
            "
=20
 SRC_URI:append:class-native =3D " file://0001-build.c-ignore-return-of-1=
-from-tar-cf.patch"
=20
-SRCREV =3D "ef4d59f5925661818484ac666014ee3e665aadcf"
+SRCREV =3D "c32c7e899b28627a2b2e9aa260ff09ca585141c3"

--=20
2.47.3


