Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id BBD1F78D43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id a3-v6so5460554wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PnZfXzAqHDtHpJo2/HMvwQnkOzQYa3azaCsdAMUL/PA=;
	b=H7ZNZr0NvZi1OKdL2WxsUYE+OpOJZdae3Hx9FbAsBmhgbAM3rzJcNnnt8JZTVBfYfN
	unT7dlt955wcvnCv2rkiQJhkVGeHRdlB9AYB/2003VqLeI6lagk3yiN2q7LAY9iApQqa
	dBA3/mxj0TT4PIcOnvoHXmH4VFZVLgVKf0UJ7UYfVQAnYOcNZ2E3XuFR0jkDZWaCMVoD
	ydsVNenuLIG05cTMdHGognAlbbSzEnRDs+BSwhl40OkrJZe18b3uLfunXQepE83cumKD
	GNXHHHE7jp7Mtz77AxK9+ni51EiSNBI6vt2p9fdyvaMNU3fKV8MtdOIz4FV87rZxzuBU
	M+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PnZfXzAqHDtHpJo2/HMvwQnkOzQYa3azaCsdAMUL/PA=;
	b=FCEvi/i595BXeRRQNcBNdiIsyMFCSSAEqjS4uhSpmROMKVlNHzAOAMhKIst54bOOUg
	YdfCVI4QnP5Y7kWAQMPM6SbaIsut7KP8H2NL6Z3xn4wWHxElkjYSqulnNdv0rRQfGy4Y
	iAIr8zsEEsMs4tvgPmZ50UahlI3d1xtKsA+1C2c3k08xX409qpkRNt23Lfm0AAXadClz
	8/r+F0HUL3t92ZbQc9EmJYagKEKay+mSM9wHYenOK6oB1o50vjVz5KrHrcOYOzHX3L3j
	ouDtmEtyWjpsbSFKUSBN3IkDBEaYnSv2OnvgNFgEY7h2TT4cH4lbeQHaexoJ+ErycNMS
	6oYA==
X-Gm-Message-State: AOUpUlE77p1twYtjkaecStd1iZOE28peuq48ElBpS/0Uz0VJFPorVoI5
	gFZEKJeccibNcf1tjEze3+FtGw77ha8=
X-Google-Smtp-Source: AAOMgpduAwTjWsWIX2DrUE10G9kqZ6r2Vw5DIGeqj2RPhO732uSYadjXPWLpHOEXWvTr9HobbCEtHQ==
X-Received: by 2002:adf:d842:: with SMTP id k2-v6mr5195109wrl.26.1532705578624;
	Fri, 27 Jul 2018 08:32:58 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:38 +0100
Message-Id: <20180727153248.22838-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180727153248.22838-1-ross.burton@intel.com>
References: <20180727153248.22838-1-ross.burton@intel.com>
Subject: [PATCH 06/16] ossp-uuid: remove
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jul 2018 15:32:59 -0000

This project is dead (upstream website doesn't respond anymore) and can mostly
be replaced with the uuid.h in util-linux.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc           |   1 -
 .../ossp-uuid/0001-Change-library-name.patch       | 119 ---------------------
 ...erve-m-option-status-in-v-option-handling.patch |  62 -----------
 .../ossp-uuid/0003-Fix-whatis-entries.patch        |  58 ----------
 .../ossp-uuid/0004-fix-data-uuid-from-string.patch |  43 --------
 .../ossp-uuid/ossp-uuid/install-pc.patch           |  19 ----
 .../ossp-uuid/ossp-uuid/ldflags.patch              |  26 -----
 .../ossp-uuid/ossp-uuid/libtool-tag.patch          |  21 ----
 .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |  27 -----
 .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |  19 ----
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  66 ------------
 11 files changed, 461 deletions(-)
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/libtool-tag.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
 delete mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4d58766451e..6e7efd12752 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -509,7 +509,6 @@ RECIPE_MAINTAINER_pn-opkg-keyrings = "Alejandro del Castillo <alejandro.delcasti
 RECIPE_MAINTAINER_pn-opkg-utils = "Alejandro del Castillo <alejandro.delcastillo@ni.com>"
 RECIPE_MAINTAINER_pn-orc = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-os-release = "Ross Burton <ross.burton@intel.com>"
-RECIPE_MAINTAINER_pn-ossp-uuid = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ovmf = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
 RECIPE_MAINTAINER_pn-ovmf-shell-image = "Ricardo Neri <ricardo.neri-calderon@linux.intel.com>"
 RECIPE_MAINTAINER_pn-p11-kit = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
deleted file mode 100644
index ed67c501cb0..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0001-Change-library-name.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From: Piotr Roszatycki <dexter@debian.org>
-Date: Wed, 27 Jan 2010 16:53:11 +0100
-Subject: [PATCH] Change library name
-
-The soname was changed to ossp-uuid to prevend the name clash with e2fsprogs's
-uuid library.
----
- Makefile.in      |    6 +++---
- perl/Makefile.PL |   12 ++++++------
- php/config.m4    |    2 +-
- uuid-config.in   |    2 +-
- uuid.pc.in       |    4 ++--
- 5 files changed, 13 insertions(+), 13 deletions(-)
-
-----
-Upstream-Status: Inappropriate [not author]
-
-This patch is from debian ossp-uuid 1.6.2 integration.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff --git a/Makefile.in b/Makefile.in
-index d28f4be..c2ba99d 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -62,13 +62,13 @@ PERL        = @PERL@
- PHP         = @PHP@
- PG_CONFIG   = @PG_CONFIG@
- 
--LIB_NAME    = libuuid.la
-+LIB_NAME    = libossp-uuid.la
- LIB_OBJS    = uuid.lo uuid_md5.lo uuid_sha1.lo uuid_prng.lo uuid_mac.lo uuid_time.lo uuid_ui64.lo uuid_ui128.lo uuid_str.lo
- 
--DCE_NAME    = libuuid_dce.la
-+DCE_NAME    = libossp-uuid_dce.la
- DCE_OBJS    = uuid_dce.lo $(LIB_OBJS)
- 
--CXX_NAME    = libuuid++.la
-+CXX_NAME    = libossp-uuid++.la
- CXX_OBJS    = uuid++.lo $(LIB_OBJS)
- 
- PRG_NAME    = uuid
-diff --git a/perl/Makefile.PL b/perl/Makefile.PL
-index 92f4494..9c6fee6 100644
---- a/perl/Makefile.PL
-+++ b/perl/Makefile.PL
-@@ -33,9 +33,9 @@ use Config;
- use ExtUtils::MakeMaker;
- 
- #   determine source directory
--my ($srcdir) = map { my $d = $_; $d =~ s/\/libuuid\.la$//; $d }
--               grep { -f $_ } ("../libuuid.la", glob("../*/libuuid.la"))
--    or die "no source directory found (where libuuid.la is located)";
-+my ($srcdir) = map { my $d = $_; $d =~ s/\/libossp-uuid\.la$//; $d }
-+               grep { -f $_ } ("../libossp-uuid.la", glob("../*/libossp-uuid.la"))
-+    or die "no source directory found (where libossp-uuid.la is located)";
- 
- #   determine extra build options
- my $compat = 0;
-@@ -47,15 +47,15 @@ WriteMakefile(
-     VERSION_FROM      => 'uuid.pm',
-     ABSTRACT_FROM     => 'uuid.pod',
-     PREREQ_PM         => {},
--    LIBS              => [ "-L$srcdir/.libs -L$srcdir -luuid" ],
-+    LIBS              => [ "-L$srcdir/.libs -L$srcdir -lossp-uuid" ],
-     DEFINE            => '',
-     INC               => "-I. -I$srcdir",
-     PM                => { 'uuid.pm'   => '$(INST_LIBDIR)/uuid.pm',
-                            'uuid.pod'  => '$(INST_LIBDIR)/uuid.pod',
-                            ($compat ? ('uuid_compat.pm'  => '$(INST_LIBDIR)/../Data/UUID.pm')  : ()),
-                            ($compat ? ('uuid_compat.pod' => '$(INST_LIBDIR)/../Data/UUID.pod') : ()), },
--    MAN3PODS          => { 'uuid.pod' => '$(INST_MAN3DIR)/OSSP::uuid.3',
--                           ($compat ? ('uuid_compat.pod' => '$(INST_MAN3DIR)/Data::UUID.3') : ()), },
-+    MAN3PODS          => { 'uuid.pod' => '$(INST_MAN3DIR)/OSSP::uuid.3pm',
-+                           ($compat ? ('uuid_compat.pod' => '$(INST_MAN3DIR)/Data::UUID.3pm') : ()), },
-     TYPEMAPS          => [ 'uuid.tm' ],
-     test              => { TESTS => 'uuid.ts' . ($compat ? ' uuid_compat.ts' : '') },
-     NO_META           => 1,
-diff --git a/php/config.m4 b/php/config.m4
-index 5091b96..969b457 100644
---- a/php/config.m4
-+++ b/php/config.m4
-@@ -34,7 +34,7 @@ if test "$PHP_UUID" != "no"; then
-     PHP_NEW_EXTENSION(uuid, uuid.c, $ext_shared)
-     AC_DEFINE(HAVE_UUID, 1, [Have OSSP uuid library])
-     PHP_ADD_LIBPATH([..], )
--    PHP_ADD_LIBRARY([uuid],, UUID_SHARED_LIBADD)
-+    PHP_ADD_LIBRARY([ossp-uuid],, UUID_SHARED_LIBADD)
-     PHP_ADD_INCLUDE([..])
-     PHP_SUBST(UUID_SHARED_LIBADD)
- 
-diff --git a/uuid-config.in b/uuid-config.in
-index 8d2a063..5b58812 100644
---- a/uuid-config.in
-+++ b/uuid-config.in
-@@ -121,7 +121,7 @@ do
-             output_extra="$output_extra $uuid_ldflags"
-             ;;
-         --libs)
--            output="$output -luuid"
-+            output="$output -lossp-uuid"
-             output_extra="$output_extra $uuid_libs"
-             ;;
-         * )
-diff --git a/uuid.pc.in b/uuid.pc.in
-index c76ad1e..de00c2f 100644
---- a/uuid.pc.in
-+++ b/uuid.pc.in
-@@ -36,7 +36,7 @@ Name: OSSP uuid
- Description: Universally Unique Identifier (UUID) Library
- Version: @UUID_VERSION_RAW@
- URL: http://www.ossp.org/pkg/lib/uuid/
--Cflags: -I${includedir}
--Libs: -L${libdir} -luuid
-+Cflags: -I${includedir}/ossp
-+Libs: -L${libdir} -lossp-uuid
- Libs.private: @LIBS@
- 
--- 
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
deleted file mode 100644
index 804a62731df..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0002-uuid-preserve-m-option-status-in-v-option-handling.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From: Marco Nenciarini <marco.nenciarini@devise.it>
-Date: Wed, 27 Jan 2010 19:46:21 +0100
-Subject: [PATCH] uuid: preserve -m option status in -v option handling
-
-Bug: 531396
----
- uuid_cli.c |   19 ++++++++++---------
- 1 files changed, 10 insertions(+), 9 deletions(-)
-
-----
-Upstream-Status: Inappropriate [not author]
-
-This patch is from debian ossp-uuid 1.6.2 integration.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff --git a/uuid_cli.c b/uuid_cli.c
-index d1b0b11..14a67fe 100644
---- a/uuid_cli.c
-+++ b/uuid_cli.c
-@@ -140,11 +140,12 @@ int main(int argc, char *argv[])
-                 i = strtol(optarg, &p, 10);
-                 if (*p != '\0')
-                     usage("invalid argument to option 'v'");
-+                version &= ~(UUID_MAKE_V1|UUID_MAKE_V3|UUID_MAKE_V4|UUID_MAKE_V5);
-                 switch (i) {
--                    case 1: version = UUID_MAKE_V1; break;
--                    case 3: version = UUID_MAKE_V3; break;
--                    case 4: version = UUID_MAKE_V4; break;
--                    case 5: version = UUID_MAKE_V5; break;
-+                    case 1: version |= UUID_MAKE_V1; break;
-+                    case 3: version |= UUID_MAKE_V3; break;
-+                    case 4: version |= UUID_MAKE_V4; break;
-+                    case 5: version |= UUID_MAKE_V5; break;
-                     default:
-                         usage("invalid version on option 'v'");
-                         break;
-@@ -213,10 +214,10 @@ int main(int argc, char *argv[])
-     }
-     else {
-         /* encoding */
--        if (   (version == UUID_MAKE_V1 && argc != 0)
--            || (version == UUID_MAKE_V3 && argc != 2)
--            || (version == UUID_MAKE_V4 && argc != 0)
--            || (version == UUID_MAKE_V5 && argc != 2))
-+        if (   (version & UUID_MAKE_V1 && argc != 0)
-+            || (version & UUID_MAKE_V3 && argc != 2)
-+            || (version & UUID_MAKE_V4 && argc != 0)
-+            || (version & UUID_MAKE_V5 && argc != 2))
-             usage("invalid number of arguments");
-         if ((rc = uuid_create(&uuid)) != UUID_RC_OK)
-             error(1, "uuid_create: %s", uuid_error(rc));
-@@ -232,7 +233,7 @@ int main(int argc, char *argv[])
-                 if ((rc = uuid_load(uuid, "nil")) != UUID_RC_OK)
-                     error(1, "uuid_load: %s", uuid_error(rc));
-             }
--            if (version == UUID_MAKE_V3 || version == UUID_MAKE_V5) {
-+            if (version & UUID_MAKE_V3 || version & UUID_MAKE_V5) {
-                 if ((rc = uuid_create(&uuid_ns)) != UUID_RC_OK)
-                     error(1, "uuid_create: %s", uuid_error(rc));
-                 if ((rc = uuid_load(uuid_ns, argv[0])) != UUID_RC_OK) {
--- 
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
deleted file mode 100644
index 13cbb598964..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0003-Fix-whatis-entries.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From: Marco Nenciarini <marco.nenciarini@devise.it>
-Date: Tue, 2 Feb 2010 12:16:49 +0100
-Subject: [PATCH] Fix whatis entries
-
-Fix whatis entry of uuid.1, uuid.3ossp and uuid++.3ossp manpages
----
- uuid++.pod   |    2 +-
- uuid.pod     |    2 +-
- uuid_cli.pod |    2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-----
-Upstream-Status: Inappropriate [not author]
-
-This patch is from debian ossp-uuid 1.6.2 integration.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff --git a/uuid++.pod b/uuid++.pod
-index 8b5a4b1..89c5efb 100644
---- a/uuid++.pod
-+++ b/uuid++.pod
-@@ -31,7 +31,7 @@
- 
- =head1 NAME
- 
--B<OSSP uuid> - B<Universally Unique Identifier> (C++ API)
-+B<uuid++> - B<Universally Unique Identifier> (C++ API)
- 
- =head1 VERSION
- 
-diff --git a/uuid.pod b/uuid.pod
-index 4ad3742..0179a46 100644
---- a/uuid.pod
-+++ b/uuid.pod
-@@ -31,7 +31,7 @@
- 
- =head1 NAME
- 
--B<OSSP uuid> - B<Universally Unique Identifier>
-+B<uuid> - B<Universally Unique Identifier>
- 
- =head1 VERSION
- 
-diff --git a/uuid_cli.pod b/uuid_cli.pod
-index ddec6bb..df9dc83 100644
---- a/uuid_cli.pod
-+++ b/uuid_cli.pod
-@@ -31,7 +31,7 @@
- 
- =head1 NAME
- 
--B<OSSP uuid> - B<Universally Unique Identifier Command-Line Tool>
-+B<uuid> - B<Universally Unique Identifier Command-Line Tool>
- 
- =head1 VERSION
- 
--- 
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
deleted file mode 100644
index bc5e111ee54..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/0004-fix-data-uuid-from-string.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Description: Support dash-less args to from_string.
-Author: Tim Retout <diocles@debian.org>
-Bug-Debian: http://bugs.debian.org/635607
-
-The module Data::GUID depends on Data::UUID supporting this behaviour.
-
-----
-Upstream-Status: Inappropriate [not author]
-
-This patch is from debian ossp-uuid 1.6.2 integration.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
---- a/perl/uuid_compat.pm
-+++ b/perl/uuid_compat.pm
-@@ -93,7 +93,9 @@
-     $uuid->import('str',
-           $str =~ /^0x/
-         ? join '-', unpack('x2 a8 a4 a4 a4 a12', $str)
--        : $str
-+        : $str =~ /-/
-+        ? $str
-+        : join '-', unpack('A8 A4 A4 A4 A12', $str)
-     );
-     return $uuid->export('bin');
- }
---- a/perl/uuid_compat.ts
-+++ b/perl/uuid_compat.ts
-@@ -28,7 +28,7 @@
- ##  uuid_compat.ts: Data::UUID Backward Compatibility Perl API (Perl test suite part)
- ##
- 
--use Test::More tests => 14;
-+use Test::More tests => 16;
- 
- BEGIN {
-     use_ok('Data::UUID');
-@@ -53,3 +53,5 @@
- ok($uuid8 = $ug->from_string("6ba7b811-9dad-11d1-80b4-00c04fd430c8"));
- ok($ug->compare($uuid7, $uuid8) == 0);
- 
-+ok($uuid9 = $ug->from_string("6ba7b8119dad11d180b400c04fd430c8"));
-+ok($ug->compare($uuid7, $uuid9) == 0);
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
deleted file mode 100644
index 63b80f6a14f..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/install-pc.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-uuid.pc is generated at build time so should be installed from the current
-directory, and not $S.
-
-Upstream-Status: Pending [should be submitted]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Index: uuid-1.6.2/Makefile.in
-===================================================================
---- uuid-1.6.2.orig/Makefile.in	2012-11-13 16:58:28.624156000 +0000
-+++ uuid-1.6.2/Makefile.in	2012-11-13 17:05:24.224158670 +0000
-@@ -232,7 +232,7 @@
- 	$(SHTOOL) mkdir -f -p -m 755 $(DESTDIR)$(mandir)/man1
- 	$(SHTOOL) install -c -m 755 uuid-config $(DESTDIR)$(bindir)/
- 	$(SHTOOL) install -c -m 644 $(S)/uuid-config.1 $(DESTDIR)$(mandir)/man1/
--	$(SHTOOL) install -c -m 644 $(S)/uuid.pc $(DESTDIR)$(libdir)/pkgconfig/
-+	$(SHTOOL) install -c -m 644 uuid.pc $(DESTDIR)$(libdir)/pkgconfig/
- 	$(SHTOOL) install -c -m 644 uuid.h $(DESTDIR)$(includedir)/
- 	-@if [ ".$(WITH_DCE)" = .yes ]; then \
- 	    echo "$(SHTOOL) install -c -m 644 $(S)/uuid_dce.h $(DESTDIR)$(includedir)/"; \
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
deleted file mode 100644
index 4dfc1370c18..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Obey LDFLAGS
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-Upstream-Status: Pending
-
---- uuid-1.6.2.orig/Makefile.in
-+++ uuid-1.6.2/Makefile.in
-@@ -113,15 +113,15 @@ all: $(TARGETS)
-	@$(LIBTOOL) --mode=compile $(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $<
-
- $(LIB_NAME): $(LIB_OBJS)
--	@$(LIBTOOL) --mode=link $(CC) -o $(LIB_NAME) $(LIB_OBJS) -rpath $(libdir) \
-+	@$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o $(LIB_NAME) $(LIB_OBJS) -rpath $(libdir) \
-	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
-
- $(DCE_NAME): $(DCE_OBJS)
--	@$(LIBTOOL) --mode=link $(CC) -o $(DCE_NAME) $(DCE_OBJS) -rpath $(libdir) \
-+	@$(LIBTOOL) --mode=link $(CC) $(LDFLAGS) -o $(DCE_NAME) $(DCE_OBJS) -rpath $(libdir) \
-	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
-
- $(CXX_NAME): $(CXX_OBJS)
--	@$(LIBTOOL) --mode=link $(CXX) -o $(CXX_NAME) $(CXX_OBJS) -rpath $(libdir) \
-+	@$(LIBTOOL) --mode=link $(CXX) $(LDFLAGS) -o $(CXX_NAME) $(CXX_OBJS) -rpath $(libdir) \
-	    -version-info `$(SHTOOL) version -l c -d libtool $(S)/uuid_vers.h`
-
- $(PRG_NAME): $(PRG_OBJS) $(LIB_NAME)
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/libtool-tag.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/libtool-tag.patch
deleted file mode 100644
index 7f601afab59..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/libtool-tag.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Repect LIBTOOLFLAGS
-
-This add a knob that can be controlled from env to set generic options
-for libtool
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: uuid-1.6.2/Makefile.in
-===================================================================
---- uuid-1.6.2.orig/Makefile.in
-+++ uuid-1.6.2/Makefile.in
-@@ -56,7 +56,7 @@ RM          = rm -f
- CP          = cp
- RMDIR       = rmdir
- SHTOOL      = $(S)/shtool
--LIBTOOL     = @LIBTOOL@
-+LIBTOOL     = @LIBTOOL@ $(LIBTOOLFLAGS)
- TRUE        = true
- POD2MAN     = pod2man
- PERL        = @PERL@
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
deleted file mode 100644
index 4bc91b86ee5..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-libtool.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Remove hardcoded libtool name, fall back to generated name
-
-Upstream-Status: Inappropriate [no upstream]
-The project appears to no longer be accepting changes.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur uuid-1.6.2.orig/Makefile.in uuid-1.6.2/Makefile.in
---- uuid-1.6.2.orig/Makefile.in	2012-05-14 14:37:19.579672930 -0500
-+++ uuid-1.6.2/Makefile.in	2012-05-14 14:37:49.112733787 -0500
-@@ -32,6 +32,7 @@
- VPATH       = @srcdir@
- srcdir      = @srcdir@
- top_srcdir  = @top_srcdir@
-+top_builddir = @top_builddir@
- S           = $(srcdir)
- C           = .
- 
-@@ -55,7 +56,7 @@
- CP          = cp
- RMDIR       = rmdir
- SHTOOL      = $(S)/shtool
--LIBTOOL     = $(C)/libtool
-+LIBTOOL     = @LIBTOOL@
- TRUE        = true
- POD2MAN     = pod2man
- PERL        = @PERL@
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch b/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
deleted file mode 100644
index d806b5fb70b..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid/uuid-nostrip.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-We don't want anything stripped
-
-Upstream-Status: Inappropriate [no upstream]
-The project appears to no longer be accepting changes.
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff -ur uuid-1.6.2.orig/Makefile.in uuid-1.6.2/Makefile.in
---- uuid-1.6.2.orig/Makefile.in	2012-05-14 14:42:42.225789456 -0500
-+++ uuid-1.6.2/Makefile.in	2012-05-14 15:03:03.119733400 -0500
-@@ -254,7 +254,7 @@
- 	-@if [ ".$(WITH_CXX)" = .yes ]; then \
- 	    $(LIBTOOL) --mode=install $(SHTOOL) install -c -m 644 $(CXX_NAME) $(DESTDIR)$(libdir)/; \
- 	fi
--	@$(LIBTOOL) --mode=install $(SHTOOL) install -c -s -m 755 uuid $(DESTDIR)$(bindir)/
-+	@$(LIBTOOL) --mode=install $(SHTOOL) install -c -m 755 uuid $(DESTDIR)$(bindir)/
- 	$(SHTOOL) install -c -m 644 $(S)/uuid.1 $(DESTDIR)$(mandir)/man1/
- 	-@if [ ".$(WITH_PERL)" = .yes ]; then \
- 	    (cd $(S)/perl && $(MAKE) $(MFLAGS) install DESTDIR=$(DESTDIR)); \
diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
deleted file mode 100644
index 5d9ca790e98..00000000000
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ /dev/null
@@ -1,66 +0,0 @@
-SUMMARY = "Universally Unique Identifier (UUID) library"
-DESCRIPTION = "OSSP uuid is a ISO-C:1999 application programming interface \
-(API) and corresponding command line interface (CLI) for the generation of \
-DCE 1.1, ISO/IEC 11578:1996 and RFC 4122 compliant Universally Unique \
-Identifier (UUID). It supports DCE 1.1 variant UUIDs of version 1 (time \
-and node based), version 3 (name based, MD5), version 4 (random number \
-based) and version 5 (name based, SHA-1)."
-DESCRIPTION_uuid = "This package contains a tool to create Universally \
-Unique Identifiers (UUID) from the command-line."
-
-HOMEPAGE = "http://www.ossp.org/pkg/lib/uuid/"
-SECTION = "libs"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;beginline=30;endline=55;md5=b394fadb039bbfca6ad9d9d769ee960e \
-	   file://uuid_md5.c;beginline=1;endline=28;md5=9c1f4b2218546deae24c91be1dcf00dd"
-
-PR = "r2"
-UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/o/ossp-uuid/"
-
-SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
-	   file://0001-Change-library-name.patch \
-	   file://0002-uuid-preserve-m-option-status-in-v-option-handling.patch \
-	   file://0003-Fix-whatis-entries.patch \
-	   file://0004-fix-data-uuid-from-string.patch \
-	   file://uuid-libtool.patch \
-	   file://uuid-nostrip.patch \
-           file://install-pc.patch \
-           file://ldflags.patch \
-           file://libtool-tag.patch \
-	  "
-SRC_URI[md5sum] = "5db0d43a9022a6ebbbc25337ae28942f"
-SRC_URI[sha256sum] = "11a615225baa5f8bb686824423f50e4427acd3f70d394765bdff32801f0fd5b0"
-
-S = "${WORKDIR}/uuid-${PV}"
-
-inherit autotools update-alternatives
-
-EXTRA_OECONF = "--without-dce --without-cxx --without-perl --without-perl-compat --without-php --without-pgsql"
-EXTRA_OECONF = "--includedir=${includedir}/ossp"
-EXTRA_OEMAKE_class-target = "LIBTOOLFLAGS='--tag=CC'"
-
-do_configure_prepend() {
-  # This package has a completely custom aclocal.m4, which should be acinclude.m4.
-  if [ ! -e ${S}/acinclude.m4 ]; then
-    mv ${S}/aclocal.m4 ${S}/acinclude.m4
-  fi
-
-  rm -f ${S}/libtool.m4
-}
-
-do_install_append() {
-  mkdir -p  ${D}${includedir}/ossp
-  mv ${D}${libdir}/pkgconfig/uuid.pc ${D}${libdir}/pkgconfig/ossp-uuid.pc
-}
-
-PACKAGES =+ "uuid"
-FILES_uuid = "${bindir}/uuid"
-FILES_${PN} = "${libdir}/libossp-uuid.so.16*"
-FILES_${PN}-dev += "${bindir}/uuid-config"
-
-BBCLASSEXTEND = "native nativesdk"
-
-ALTERNATIVE_${PN}-doc = "uuid.3"
-ALTERNATIVE_PRIORITY_${PN}-doc = "200"
-ALTERNATIVE_LINK_NAME[uuid.3] = "${mandir}/man3/uuid.3"
-- 
2.11.0


