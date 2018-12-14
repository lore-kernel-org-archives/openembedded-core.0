Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 65EC979C9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:43:28 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y139so4986035wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ifIh9VEqBV4/sg/lY6fTLrtUfqRU+76Q9WnZW4z27CQ=;
	b=IyuxZmpQ8BdJfFIy8l9fQgNfBLG96Pj5XNdvwpKEzudpU13qOiTa+a6zZn5rzLwbu5
	pYtgC+JHSZfPJ46nWhrG7nj5M/SZfpG8qFYtYtrBU6KlIzfCHMtDZ/Kz4wxKqlwz5pNC
	xKXhkZC5sIqvOk0zKGZMaUV0+PrxvGdo04DQgKN9uNRIICf3tr+l7YOfmLCGxZukqi0I
	527dPhcv700XzyWNMXnZwJ88UIHheg5jrY8g9vNt+7081sMLLFLJOBcNlZp78mU3j7PC
	jVZmmgqKcdMgwkqq4fHnXOGoQcSTlM8+F6q0+M7tHB6vUJwuGIq/CG0a7G7F1It6tLom
	w9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=ifIh9VEqBV4/sg/lY6fTLrtUfqRU+76Q9WnZW4z27CQ=;
	b=HgD1+7IOzdc6dBMXYEBaWdU45ybtuRHd1kG4awljkLhuxrU7OAmeO7bVxT3TvEQO4D
	5RfUUtMUS/Jk7pay2Kb3iN+0QO7wKSxORRIhSCHbkT0rexUGB+l7I8OdCHMtuHuVbq7l
	1SuD5noRTGEvSbeL3fm+MZNiAlTR/IP+uFJd+xtMtOl9x78snKD16MkQAuCbcn9Y8ZMs
	5k9xbIcZAxWnOXbO311281O4wxofKGBaerRlTyt+2xOGiqYArt2Pp/lmcQk64gw5u27M
	IDitQGo401fSgw4xvK5AD70gOy6LczY6s77sQVXVMtNEZKdicC7V+05YzjMl+KaZkrO6
	BjuA==
X-Gm-Message-State: AA+aEWYQ0eCJZcbqq9Os311KWOU4Lo6SWw7GF3SNeOfHKwIemPayl6ly
	sIDBVWvXgn74Ol0tgxAGW+8vi3RF
X-Google-Smtp-Source: AFSGD/Xwstn3ntFT+C6SVI+WWLjzTzv05r/yTbXoVwssuyG4cRUC/rAoCT5CP8/kPcV+qTum/4cy1g==
X-Received: by 2002:a1c:f8f:: with SMTP id 137mr2564877wmp.96.1544780606868;
	Fri, 14 Dec 2018 01:43:26 -0800 (PST)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	o81sm5478990wmd.10.2018.12.14.01.43.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 01:43:25 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 10:43:19 +0100
Message-Id: <20181214094319.2935-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [PATCH] perl{,-native}: Update 5.24.4 -> 5.28.1
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
X-List-Received-Date: Fri, 14 Dec 2018 09:43:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update recipe for Perl Programming Language to 5.28.0:
* update debian patches from perl_5.28.0-4.debian.tar.xz
* re-introduce separation between platform specific and platform
  independent library directories
* introduce non-threaded Perl (by default), since it's up to 30%
  faster
* add alternatives for bundled bin/* scripts fof core-modules
* add create_rdepends_inc() for rdepends.inc update

Changes in Perl Programming Language contained in this update:
* https://metacpan.org/pod/release/SHAY/perl-5.28.1/pod/perldelta.pod
* https://metacpan.org/pod/release/SHAY/perl-5.28.1/pod/perl5280delta.pod
* https://metacpan.org/pod/release/SHAY/perl-5.28.1/pod/perl5260delta.pod

Security issues fixed
* CVE-2018-18311: Integer overflow leading to buffer overflow and segmentation fault
* CVE-2018-18312: Heap-buffer-overflow write in S_regatom (regcomp.c)
* CVE-2017-12837: Heap buffer overflow in regular expression compiler
* CVE-2017-12883: Buffer over-read in regular expression parser
* CVE-2018-12015: directory traversal vulnerability
* CVE-2016-1238: do not properly remove . (period) characters from the end of the includes directory array

Signed-off-by: Jens Rehsack <sno@netbsd.org>

-> perl
---
 meta/classes/cpan.bbclass                     |    5 +-
 meta/classes/cpan_build.bbclass               |    3 +-
 meta/classes/perl-version.bbclass             |   41 +
 ...native_5.24.4.bb => perl-native_5.28.1.bb} |   38 +-
 .../perl/perl-rdepends_5.24.4.inc             | 2575 ---------------
 .../perl/perl-rdepends_5.28.1.inc             | 2818 +++++++++++++++++
 meta/recipes-devtools/perl/perl.inc           |    2 +-
 ...-ExtUtils-MM_Unix.pm-fix-race-issues.patch |   52 -
 ...tests-if-PERL_BUILD_PACKAGING-is-set.patch |  126 -
 .../perl/perl/CVE-2018-12015.patch            |   48 -
 .../perl/perl/MM_Unix.pm.patch                |   19 +-
 .../perl/perl/Makefile.SH.patch               |  186 +-
 meta/recipes-devtools/perl/perl/config.sh     |  282 +-
 meta/recipes-devtools/perl/perl/config.sh-32  |    7 +
 meta/recipes-devtools/perl/perl/config.sh-64  |    4 +
 .../perl/debian/cpan-missing-site-dirs.diff   |    7 +-
 .../perl/perl/debian/cpan_definstalldirs.diff |    9 +-
 .../perl/perl/debian/db_file_ver.diff         |    5 +-
 .../perl/perl/debian/deprecate-with-apt.diff  |   28 +-
 .../perl/perl/debian/disable-stack-check.diff |   64 +
 .../perl/perl/debian/doc_info.diff            |    7 +-
 .../perl/perl/debian/enc2xs_inc.diff          |   15 +-
 .../perl/perl/debian/errno_ver.diff           |   41 +-
 .../debian/extutils_set_libperl_path.diff     |   20 +-
 .../perl/perl/debian/fakeroot.diff            |    9 +-
 .../perl/perl/debian/find_html2text.diff      |    7 +-
 .../perl/perl/debian/fixes/autodie-scope.diff |   99 +
 .../perl/debian/fixes/caretx-fallback.diff    |   73 +
 .../perl/perl/debian/fixes/cpan_web_link.diff |   26 +
 .../fixes/document_makemaker_ccflags.diff     |    7 +-
 .../perl/debian/fixes/errno-include-path.diff |   77 +
 .../perl/perl/debian/fixes/eumm-usrmerge.diff |  124 +
 .../debian/fixes/fix-manifest-failures.diff   |   44 +
 .../perl/perl/debian/fixes/getopt-long-4.diff |   30 +
 .../fixes/inplace-editing-bugfix/part1.diff   |  135 +
 .../fixes/inplace-editing-bugfix/part2.diff   |   56 +
 .../fixes/inplace-editing-bugfix/part3.diff   |  131 +
 .../fixes/math_complex_doc_angle_units.diff   |   28 +
 .../fixes/math_complex_doc_great_circle.diff  |   25 +
 .../fixes/math_complex_doc_see_also.diff      |   25 +
 .../perl/perl/debian/fixes/memoize-pod.diff   |   34 +
 .../debian/fixes/memoize_storable_nstore.diff |    7 +-
 .../perl/perl/debian/fixes/net_smtp_docs.diff |   26 -
 .../perl/perl/debian/fixes/perl-Cnn.diff      |   74 -
 .../fixes/pod_man_reproducible_date.diff      |  171 -
 .../perl/debian/fixes/podman-empty-date.diff  |   52 -
 .../perl/perl/debian/fixes/podman-pipe.diff   |  110 -
 .../perl/debian/fixes/podman-utc-docs.diff    |   87 -
 .../perl/perl/debian/fixes/podman-utc.diff    |   34 -
 .../perl/perl/debian/fixes/respect_umask.diff |   43 +-
 .../debian/fixes/storable-crosscompile.diff   |   72 +
 .../perl/debian/fixes/storable-prereq.diff    |   48 +
 .../perl/debian/fixes/storable-recursion.diff |  292 ++
 .../perl/debian/fixes/time-local-2020.diff    |   69 +
 .../perl/perl/debian/gdbm-fatal.diff          |   26 +
 .../perl/perl/debian/installman-utf8.diff     |   28 +
 .../perl/perl/debian/instmodsh_doc.diff       |    7 +-
 .../perl/perl/debian/ld_run_path.diff         |   20 +-
 .../perl/perl/debian/libnet_config_path.diff  |    9 +-
 .../perl/perl/debian/libperl_embed_doc.diff   |    7 +-
 .../perl/perl/debian/locale-robustness.diff   |   53 -
 ...fix_changes.diff => makemaker-manext.diff} |  124 +-
 .../perl/perl/debian/makemaker-pasthru.diff   |    7 +-
 .../perl/debian/makemaker_customized.diff     |   43 -
 .../perl/perl/debian/mod_paths.diff           |   43 +-
 .../perl/debian/no_packlist_perllocal.diff    |   93 -
 .../perl/perl/debian/patchlevel.diff          |   31 -
 .../debian/perl5db-x-terminal-emulator.patch  |    7 +-
 .../perl/perl/debian/perldoc-pager.diff       |   28 +
 .../perl/perl/debian/perlivp.diff             |    7 +-
 .../perl/perl/debian/pod2man-customized.diff  |   24 -
 .../perl/perl/debian/prune_libs.diff          |   43 -
 .../perl/perl/debian/regen-skip.diff          |   28 -
 .../perl/perl/debian/skip-kfreebsd-crash.diff |   41 -
 .../perl/debian/skip-upstream-git-tests.diff  |   29 -
 .../perl/debian/squelch-locale-warnings.diff  |   25 +-
 .../perl/debian/storable-disable-probing.diff |   40 +
 .../perl/perl/debian/writable_site_dirs.diff  |   11 +-
 .../perl/perl/fix_bad_rpath.patch             |   14 +-
 .../perl/fix_configpm_no_dot_in_INC.patch     |   22 +
 ...ite_buildcustomize.pl_no_dot_in_INC.patch} |   23 +-
 .../perl/perl/letgcc-find-errno.patch         |   14 +-
 .../perl/perl/native-nopacklist.patch         |   91 -
 .../perl-5.26.1-guard_old_libcrypt_fix.patch  |   28 -
 ...Tools-don-t-filter-out-blib-from-INC.patch |   33 -
 .../perl/perl/perl-dynloader.patch            |    8 +-
 ...ix-conflict-between-skip_all-and-END.patch |  181 --
 .../perl/perl/perl-moreconfig.patch           |   10 +-
 .../perl/{perl_5.24.4.bb => perl_5.28.1.bb}   |  375 ++-
 89 files changed, 5187 insertions(+), 4803 deletions(-)
 rename meta/recipes-devtools/perl/{perl-native_5.24.4.bb => perl-native_5.28.1.bb} (70%)
 delete mode 100644 meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
 create mode 100644 meta/recipes-devtools/perl/perl-rdepends_5.28.1.inc
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
 create mode 100644 meta/recipes-devtools/perl/perl/debian/disable-stack-check.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/autodie-scope.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/caretx-fallback.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/cpan_web_link.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/errno-include-path.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/fix-manifest-failures.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/getopt-long-4.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part1.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part2.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part3.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_angle_units.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_great_circle.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_see_also.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/storable-crosscompile.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/storable-prereq.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/storable-recursion.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/fixes/time-local-2020.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/gdbm-fatal.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/installman-utf8.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
 rename meta/recipes-devtools/perl/perl/debian/{prefix_changes.diff => makemaker-manext.diff} (10%)
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/patchlevel.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/prune_libs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/regen-skip.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
 delete mode 100644 meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
 create mode 100644 meta/recipes-devtools/perl/perl/debian/storable-disable-probing.diff
 create mode 100644 meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.patch
 copy meta/recipes-devtools/perl/perl/{perl-moreconfig.patch => fix_write_buildcustomize.pl_no_dot_in_INC.patch} (11%)
 delete mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
 rename meta/recipes-devtools/perl/{perl_5.24.4.bb => perl_5.28.1.bb} (39%)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 511fe3fb92..121643eecb 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -10,10 +10,11 @@ EXTRA_PERLFLAGS ?= ""
 export PERLCONFIGTARGET = "${@is_target(d)}"
 
 # Env var which tells perl where the perl include files are
-export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/CORE"
+export PERL_INC = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/${@get_perl_arch(d)}/CORE"
 export PERL_LIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/${@get_perl_arch(d)}"
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
+export PERLHOSTARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
 
 cpan_do_configure () {
 	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl) ${EXTRA_CPANFLAGS}
diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
index 9a2ad895ef..14c8aad772 100644
--- a/meta/classes/cpan_build.bbclass
+++ b/meta/classes/cpan_build.bbclass
@@ -7,8 +7,9 @@ EXTRA_CPAN_BUILD_FLAGS ?= ""
 
 # Env var which tells perl if it should use host (no) or target (yes) settings
 export PERLCONFIGTARGET = "${@is_target(d)}"
-export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}"
+export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version(d)}/${@get_perl_arch(d)}"
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"
+export PERLHOSTARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/${@get_perl_hostarch(d)}/"
 export LD = "${CCLD}"
 
 cpan_build_do_configure () {
diff --git a/meta/classes/perl-version.bbclass b/meta/classes/perl-version.bbclass
index bafd96518a..fc4480c3b8 100644
--- a/meta/classes/perl-version.bbclass
+++ b/meta/classes/perl-version.bbclass
@@ -22,3 +22,44 @@ def get_perl_version(d):
 
 PERLVERSION := "${@get_perl_version(d)}"
 PERLVERSION[vardepvalue] = ""
+
+# Determine the staged arch of perl from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+def get_perl_arch(d):
+    import re
+    cfg = d.expand('${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/config.sh')
+    try:
+        f = open(cfg, 'r')
+    except IOError:
+        return None
+    l = f.readlines();
+    f.close();
+    r = re.compile("^archname='([^']*)'")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
+
+PERLARCH := "${@get_perl_arch(d)}"
+PERLARCH[vardepvalue] = ""
+
+# Determine the staged arch of perl-native from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+def get_perl_hostarch(d):
+    import re
+    cfg = d.expand('${STAGING_LIBDIR_NATIVE}/perl-native/perl/config.sh')
+    try:
+        f = open(cfg, 'r')
+    except IOError:
+        return None
+    l = f.readlines();
+    f.close();
+    r = re.compile("^archname='([^']*)'")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
diff --git a/meta/recipes-devtools/perl/perl-native_5.24.4.bb b/meta/recipes-devtools/perl/perl-native_5.28.1.bb
similarity index 70%
rename from meta/recipes-devtools/perl/perl-native_5.24.4.bb
rename to meta/recipes-devtools/perl/perl-native_5.28.1.bb
index 81d3fd4898..62046b6f8f 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.28.1.bb
@@ -8,24 +8,29 @@ EXTRA_OEMAKE = "-e MAKEFLAGS="
 SRC_URI += "\
            file://Configure-multilib.patch \
            file://perl-configpm-switch.patch \
-           file://native-nopacklist.patch \
            file://native-perlinc.patch \
            file://MM_Unix.pm.patch \
            file://debian/errno_ver.diff \
            file://dynaloaderhack.patch \
-           file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
            file://0001-Configure-Remove-fstack-protector-strong-for-native-.patch \
-           file://perl-5.26.1-guard_old_libcrypt_fix.patch \
-           file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
           "
 
-SRC_URI[md5sum] = "04622bc4d3941dc7eb571c52b7c02993"
-SRC_URI[sha256sum] = "7f080287ff64750270689843ae945f02159a33cb8f2fc910248c15befba5db84"
+SRC_URI[md5sum] = "fbb590c305f2f88578f448581b8cf9c4"
+SRC_URI[sha256sum] = "fea7162d4cca940a387f0587b93f6737d884bf74d8a9d7cfd978bc12cd0b202d"
+
+PACKAGECONFIG ?= ""
+usethreads = "${@["undef", "define"][bb.utils.contains('PACKAGECONFIG', 'thread', 1, 0, d)]}"
+threadmulti = "${@["", "-thread-multi"][bb.utils.contains('PACKAGECONFIG', 'thread', 1, 0, d)]}"
+PACKAGECONFIG[thread] = "-Dusethreads,,"
 
 inherit native
 
 NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
+SITELIB_INC   = "${STAGING_LIBDIR}/perl/site_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:${STAGING_LIBDIR}/perl/site_perl/${PV}"
+VENDORLIB_INC = "${STAGING_LIBDIR}/perl/vendor_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:${STAGING_LIBDIR}/perl/vendor_perl/${PV}"
+COREELIB_INC  = "${STAGING_LIBDIR}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:${STAGING_LIBDIR}/perl/${PV}"
+
 export LD="${CCLD}"
 
 do_configure () {
@@ -41,15 +46,13 @@ do_configure () {
 		\
 		-Dbin=${STAGING_BINDIR}/${PN} \
 		-Dprivlib=${STAGING_LIBDIR}/perl/${PV} \
-		-Darchlib=${STAGING_LIBDIR}/perl/${PV} \
+		-Darchlib=${STAGING_LIBDIR}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti} \
 		-Dvendorlib=${STAGING_LIBDIR}/perl/vendor_perl/${PV} \
-		-Dvendorarch=${STAGING_LIBDIR}/perl/vendor_perl/${PV} \
+		-Dvendorarch=${STAGING_LIBDIR}/perl/vendor_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti} \
 		-Dsitelib=${STAGING_LIBDIR}/perl/site_perl/${PV} \
-		-Dsitearch=${STAGING_LIBDIR}/perl/site_perl/${PV} \
+		-Dsitearch=${STAGING_LIBDIR}/perl/site_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti} \
 		\
 		-Duseshrplib \
-		-Dusethreads \
-		-Duseithreads \
 		-Duselargefiles \
 		-Dnoextensions=ODBM_File \
 		-Ud_dosuid \
@@ -66,7 +69,8 @@ do_configure () {
 		-Uafs \
 		-Ud_csh \
 		-Uusesfio \
-		-Uusenm -des
+		-Uusenm -des \
+		${PACKAGECONFIG_CONFARGS}
 }
 
 do_install () {
@@ -77,7 +81,7 @@ do_install () {
 
         ln -sf perl ${D}${libdir}/perl5
 
-	install -d ${D}${libdir}/perl/${PV}/CORE \
+	install -d ${D}${libdir}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}/CORE \
 	           ${D}${datadir}/perl/${PV}/ExtUtils
 
 	# Save native config 
@@ -100,14 +104,14 @@ do_install () {
 		unicode_constants.h unixish.h utf8.h utfebcdic.h util.h uudmap.h \
 		vutil.h warnings.h XSUB.h
 	do
-		install $i ${D}${libdir}/perl/${PV}/CORE
+		install $i ${D}${libdir}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}/CORE
 	done
 
 	# Those wrappers mean that perl installed from sstate (which may change
 	# path location) works and that in the nativesdk case, the SDK can be
 	# installed to a different location from the one it was built for.
-	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIBDIR}/perl/vendor_perl/${PV}:${STAGING_LIBDIR}/perl/${PV}'
-	create_wrapper ${D}${bindir}/perl${PV} PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/site_perl/${PV}:${STAGING_LIBDIR}/perl/vendor_perl/${PV}:${STAGING_LIBDIR}/perl/${PV}'
+	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${SITELIB_INC}:${VENDORLIB_INC}:${COREELIB_INC}'
+	create_wrapper ${D}${bindir}/perl${PV} PERL5LIB='$PERL5LIB:${SITELIB_INC}:${VENDORLIB_INC}:${COREELIB_INC}'
 
 	# Use /usr/bin/env nativeperl for the perl script.
 	for f in `grep -Il '#! *${bindir}/perl' ${D}/${bindir}/*`; do
@@ -116,7 +120,7 @@ do_install () {
 
 	# The packlist is large with hardcoded paths meaning it needs relocating
 	# so just remove it.
-	rm ${D}${libdir}/perl/${PV}/.packlist
+	rm ${D}${libdir}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}/.packlist
 }
 
 SYSROOT_PREPROCESS_FUNCS += "perl_sysroot_create_wrapper"
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc b/meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
deleted file mode 100644
index 10e3c0429f..0000000000
--- a/meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
+++ /dev/null
@@ -1,2575 +0,0 @@
-# To create/update the perl-rdepends_${PV}.inc use this piece of ugly script (modified for your arch/paths etc):
-
-#jiahongxu:5.20.0-r1$ pwd
-#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl/5.20.0-r1
-
-#1 cp -r packages-split packages-split.new && cd packages-split.new
-#2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
-#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" 
-#| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] 
-#| awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'
-#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix 
-#| sort -u 
-#| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' 
-#| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rdepends
-
-RDEPENDS_perl-misc += "perl perl-modules"
-RDEPENDS_${PN}-pod += "perl"
-
-# Some additional dependencies that the above doesn't manage to figure out
-RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigint-calc"
-RDEPENDS_${PN}-module-thread-queue += "${PN}-module-attributes"
-RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
-
-# Depends list
-# copy contents of /tmp/perl-rdepends in this file
-RDEPENDS_${PN}-module-anydbm-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-anydbm-file += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-carp"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-config"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-constant"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-cpan"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-getopt-std"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-if"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-net-ping"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-user-pwent"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-vars"
-RDEPENDS_${PN}-module-app-cpan += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-app-prove-state"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-base"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-carp"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-constant"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-getopt-long"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-tap-harness"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-tap-harness-env"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-app-prove += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-app-prove-state-result"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-base"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-carp"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-constant"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-tap-parser-yamlish-reader"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-tap-parser-yamlish-writer"
-RDEPENDS_${PN}-module-app-prove-state += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-app-prove-state-result += "${PN}-module-app-prove-state-result-test"
-RDEPENDS_${PN}-module-app-prove-state-result += "${PN}-module-carp"
-RDEPENDS_${PN}-module-app-prove-state-result += "${PN}-module-constant"
-RDEPENDS_${PN}-module-app-prove-state-result += "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-prove-state-result += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-app-prove-state-result-test += "${PN}-module-strict"
-RDEPENDS_${PN}-module-app-prove-state-result-test += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-archive-tar-constant += "${PN}-module-constant"
-RDEPENDS_${PN}-module-archive-tar-constant += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-archive-tar-constant += "${PN}-module-io-compress-bzip2"
-RDEPENDS_${PN}-module-archive-tar-constant += "${PN}-module-time-local"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-archive-tar"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-archive-tar-constant"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-carp"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-archive-tar-file += "${PN}-module-vars"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-archive-tar-constant"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-archive-tar-file"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-carp"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-config"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-io-zlib"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-strict"
-RDEPENDS_${PN}-module-archive-tar += "${PN}-module-vars"
-RDEPENDS_${PN}-module-arybase += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-attribute-handlers += "${PN}-module-carp"
-RDEPENDS_${PN}-module-attribute-handlers += "${PN}-module-strict"
-RDEPENDS_${PN}-module-attribute-handlers += "${PN}-module-vars"
-RDEPENDS_${PN}-module-attribute-handlers += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-attributes += "${PN}-module-carp"
-RDEPENDS_${PN}-module-attributes += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-attributes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-attributes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-attributes += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-carp"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-constant"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-fatal"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-overload"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-exception += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-exception-system += "${PN}-module-carp"
-RDEPENDS_${PN}-module-autodie-exception-system += "${PN}-module-parent"
-RDEPENDS_${PN}-module-autodie-exception-system += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-exception-system += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-hints += "${PN}-module-b"
-RDEPENDS_${PN}-module-autodie-hints += "${PN}-module-carp"
-RDEPENDS_${PN}-module-autodie-hints += "${PN}-module-constant"
-RDEPENDS_${PN}-module-autodie-hints += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-hints += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie += "${PN}-module-carp"
-RDEPENDS_${PN}-module-autodie += "${PN}-module-constant"
-RDEPENDS_${PN}-module-autodie += "${PN}-module-lib"
-RDEPENDS_${PN}-module-autodie += "${PN}-module-parent"
-RDEPENDS_${PN}-module-autodie += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-scope-guard += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-scope-guard += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-scope-guardstack += "${PN}-module-autodie-scope-guard"
-RDEPENDS_${PN}-module-autodie-scope-guardstack += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-scope-guardstack += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-skip += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-skip += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autodie-util += "${PN}-module-autodie-scope-guardstack"
-RDEPENDS_${PN}-module-autodie-util += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-autodie-util += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autodie-util += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-autoloader += "${PN}-module-carp"
-RDEPENDS_${PN}-module-autoloader += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-carp"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-config"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-autosplit += "${PN}-module-strict"
-RDEPENDS_${PN}-module-autouse += "${PN}-module-carp"
-RDEPENDS_${PN}-module-base += "${PN}-module-carp"
-RDEPENDS_${PN}-module-base += "${PN}-module-strict"
-RDEPENDS_${PN}-module-base += "${PN}-module-vars"
-RDEPENDS_${PN}-module-b-concise += "${PN}-module-b"
-RDEPENDS_${PN}-module-b-concise += "${PN}-module-b-op-private"
-RDEPENDS_${PN}-module-b-concise += "${PN}-module-config"
-RDEPENDS_${PN}-module-b-concise += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-b-concise += "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-concise += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-b-debug += "${PN}-module-b"
-RDEPENDS_${PN}-module-b-debug += "${PN}-module-config"
-RDEPENDS_${PN}-module-b-debug += "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-b"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-carp"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-feature"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-overloading"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-re"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-vars"
-RDEPENDS_${PN}-module-b-deparse += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-benchmark += "${PN}-module-carp"
-RDEPENDS_${PN}-module-benchmark += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-benchmark += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-carp"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-constant"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-math-bigint-trace"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-overload"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bigint += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-bigint"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-carp"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-math-bigfloat-trace"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-math-bigint-trace"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-overload"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bignum += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-bigint"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-carp"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-math-bigint-trace"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-math-bigrat"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-overload"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bigrat += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-blib += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-blib += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-blib += "${PN}-module-vars"
-RDEPENDS_${PN}-module-b += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-b += "${PN}-module-strict"
-RDEPENDS_${PN}-module-b += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-b-showlex += "${PN}-module-b"
-RDEPENDS_${PN}-module-b-showlex += "${PN}-module-b-concise"
-RDEPENDS_${PN}-module-b-showlex += "${PN}-module-b-terse"
-RDEPENDS_${PN}-module-b-showlex += "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-terse += "${PN}-module-b"
-RDEPENDS_${PN}-module-b-terse += "${PN}-module-b-concise"
-RDEPENDS_${PN}-module-b-terse += "${PN}-module-carp"
-RDEPENDS_${PN}-module-b-terse += "${PN}-module-strict"
-RDEPENDS_${PN}-module-b-xref += "${PN}-module-b"
-RDEPENDS_${PN}-module-b-xref += "${PN}-module-config"
-RDEPENDS_${PN}-module-b-xref += "${PN}-module-strict"
-RDEPENDS_${PN}-module-bytes += "${PN}-module-bytes-heavy"
-RDEPENDS_${PN}-module-bytes += "${PN}-module-carp"
-RDEPENDS_${PN}-module-carp-heavy += "${PN}-module-carp"
-RDEPENDS_${PN}-module-carp += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-carp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-carp += "${PN}-module-warnings"
-RDEPENDS_${PN}-module--charnames += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-charnames += "${PN}-module-bytes"
-RDEPENDS_${PN}-module--charnames += "${PN}-module-carp"
-RDEPENDS_${PN}-module-charnames += "${PN}-module--charnames"
-RDEPENDS_${PN}-module--charnames += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module--charnames += "${PN}-module-re"
-RDEPENDS_${PN}-module-charnames += "${PN}-module-re"
-RDEPENDS_${PN}-module--charnames += "${PN}-module-strict"
-RDEPENDS_${PN}-module-charnames += "${PN}-module-strict"
-RDEPENDS_${PN}-module--charnames += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-charnames += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-class-struct += "${PN}-module-carp"
-RDEPENDS_${PN}-module-class-struct += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-class-struct += "${PN}-module-strict"
-RDEPENDS_${PN}-module-class-struct += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-bytes "
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-carp "
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-constant"
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-strict "
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-warnings "
-RDEPENDS_${PN}-module-compress-raw-bzip2 += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-bytes "
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-carp "
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-constant"
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-strict "
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-warnings "
-RDEPENDS_${PN}-module-compress-raw-zlib += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-bytes "
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-carp "
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-constant"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-io-compress-gzip"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-io-compress-gzip-constants"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-io-handle "
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-io-uncompress-gunzip"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-strict "
-RDEPENDS_${PN}-module-compress-zlib += "${PN}-module-warnings "
-RDEPENDS_${PN}-module-config-extensions += "${PN}-module-config"
-RDEPENDS_${PN}-module-config-extensions += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-config-extensions += "${PN}-module-strict"
-RDEPENDS_${PN}-module-config-extensions += "${PN}-module-vars"
-RDEPENDS_${PN}-module-config-perl-v += "${PN}-module-config"
-RDEPENDS_${PN}-module-config-perl-v += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-config-perl-v += "${PN}-module-strict"
-RDEPENDS_${PN}-module-config-perl-v += "${PN}-module-vars"
-RDEPENDS_${PN}-module-config-perl-v += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-constant += "${PN}-module-carp"
-RDEPENDS_${PN}-module-constant += "${PN}-module-strict"
-RDEPENDS_${PN}-module-constant += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-list-util"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-corelist"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-strict"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-vars"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-version"
-RDEPENDS_${PN}-module-corelist += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-b"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-carp"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-config"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-dirhandle"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-extutils-manifest"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-lib"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-net-ping"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-overload"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-posix"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-safe"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-strict"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-sys-hostname"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-term-readline"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-text-wrap"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-time-local"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-vars"
-RDEPENDS_${PN}-module-cpan += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-cwd += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-cwd += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-cwd += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-cwd += "${PN}-module-strict"
-RDEPENDS_${PN}-module-cwd += "${PN}-module-vars"
-RDEPENDS_${PN}-module-cwd += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-b-deparse"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-carp"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-config"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-constant"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-overload"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-data-dumper += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-dbm-filter-compress += "${PN}-module-carp"
-RDEPENDS_${PN}-module-dbm-filter-compress += "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter-compress += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-dbm-filter-encode += "${PN}-module-carp"
-RDEPENDS_${PN}-module-dbm-filter-encode += "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter-encode += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-dbm-filter-int32 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter-int32 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-dbm-filter-null += "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter-null += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-dbm-filter += "${PN}-module-carp"
-RDEPENDS_${PN}-module-dbm-filter += "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-dbm-filter-utf8 += "${PN}-module-carp"
-RDEPENDS_${PN}-module-dbm-filter-utf8 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-dbm-filter-utf8 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-db += "${PN}-module-strict"
-RDEPENDS_${PN}-module-deprecate += "${PN}-module-carp"
-RDEPENDS_${PN}-module-deprecate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-deprecate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-devel-peek += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-devel-peek += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-devel-ppport += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-devel-ppport += "${PN}-module-getopt-long"
-RDEPENDS_${PN}-module-devel-ppport += "${PN}-module-strict"
-RDEPENDS_${PN}-module-devel-ppport += "${PN}-module-vars"
-RDEPENDS_${PN}-module-devel-selfstubber += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-devel-selfstubber += "${PN}-module-selfloader"
-RDEPENDS_${PN}-module-diagnostics += "${PN}-module-carp"
-RDEPENDS_${PN}-module-diagnostics += "${PN}-module-config"
-RDEPENDS_${PN}-module-diagnostics += "${PN}-module-getopt-std"
-RDEPENDS_${PN}-module-diagnostics += "${PN}-module-strict"
-RDEPENDS_${PN}-module-diagnostics += "${PN}-module-text-tabs"
-RDEPENDS_${PN}-module-digest-base += "${PN}-module-carp"
-RDEPENDS_${PN}-module-digest-base += "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-digest-base += "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest-base += "${PN}-module-vars"
-RDEPENDS_${PN}-module-digest-file += "${PN}-module-carp"
-RDEPENDS_${PN}-module-digest-file += "${PN}-module-digest"
-RDEPENDS_${PN}-module-digest-file += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-digest-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest-file += "${PN}-module-vars"
-RDEPENDS_${PN}-module-digest-md5 += "${PN}-module-digest-base"
-RDEPENDS_${PN}-module-digest-md5 += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-digest-md5 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest-md5 += "${PN}-module-vars"
-RDEPENDS_${PN}-module-digest-md5 += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-digest += "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest += "${PN}-module-vars"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-carp"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-digest-base"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-integer"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-strict"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-vars"
-RDEPENDS_${PN}-module-digest-sha += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-dirhandle += "${PN}-module-carp"
-RDEPENDS_${PN}-module-dirhandle += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-dynaloader += "${PN}-module-carp"
-RDEPENDS_${PN}-module-dynaloader += "${PN}-module-config"
-RDEPENDS_${PN}-module-encode-alias += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encode-alias += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-alias += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-encode-alias += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-alias += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-byte += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-byte += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-byte += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-byte += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-cjkconstants += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode-cjkconstants += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-encode-cjkconstants += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-cjkconstants += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-cn-hz += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-cn-hz += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-cn-hz += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-cn-hz += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-encode-cn-hz += "${PN}-module-vars"
-RDEPENDS_${PN}-module-encode-cn-hz += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-cn += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-cn += "${PN}-module-encode-cn-hz"
-RDEPENDS_${PN}-module-encode-cn += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-cn += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-cn += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-config += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-config += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-ebcdic += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-ebcdic += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-ebcdic += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-ebcdic += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-overload"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-encoder += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-encoding += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode-encoding += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-encoding += "${PN}-module-encode-mime-name"
-RDEPENDS_${PN}-module-encode-encoding += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-encoding += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-vars"
-RDEPENDS_${PN}-module-encode-gsm0338 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-encode-unicode"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-guess += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp-h2z += "${PN}-module-encode-cjkconstants"
-RDEPENDS_${PN}-module-encode-jp-h2z += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-jp-h2z += "${PN}-module-vars"
-RDEPENDS_${PN}-module-encode-jp-h2z += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-encode-cjkconstants"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-encode-jp-h2z"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-jp-jis7 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-jp += "${PN}-module-encode-jp-jis7"
-RDEPENDS_${PN}-module-encode-jp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-jp += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-jp += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-kr-2022-kr += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-kr-2022-kr += "${PN}-module-encode-cjkconstants"
-RDEPENDS_${PN}-module-encode-kr-2022-kr += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-kr-2022-kr += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-kr-2022-kr += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-kr += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-kr += "${PN}-module-encode-kr-2022-kr"
-RDEPENDS_${PN}-module-encode-kr += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-kr += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-kr += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp += "${PN}-module-encode-cjkconstants"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-mime-header-iso-2022-jp += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-encode-mime-header += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-mime-name += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-mime-name += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-encode += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encode += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encode += "${PN}-module-encode-alias"
-RDEPENDS_${PN}-module-encode += "${PN}-module-encode-config"
-RDEPENDS_${PN}-module-encode += "${PN}-module-encode-configlocal-pm"
-RDEPENDS_${PN}-module-encode += "${PN}-module-encode-encoding"
-RDEPENDS_${PN}-module-encode += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-encode += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-symbol += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-symbol += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-symbol += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-symbol += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-tw += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-tw += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-tw += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-tw += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-unicode += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-unicode += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-unicode += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-unicode += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encode-unicode += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-encode-unicode-utf7 += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encode-unicode-utf7 += "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-encode-unicode-utf7 += "${PN}-module-parent"
-RDEPENDS_${PN}-module-encode-unicode-utf7 += "${PN}-module-re"
-RDEPENDS_${PN}-module-encode-unicode-utf7 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encode-unicode-utf7 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-config"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-constant"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-encode"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-filter-util-call"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-i18n-langinfo"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-posix"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-encoding += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-encoding-warnings += "${PN}-module-carp"
-RDEPENDS_${PN}-module-encoding-warnings += "${PN}-module-strict"
-RDEPENDS_${PN}-module-encoding-warnings += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-english += "${PN}-module-carp "
-RDEPENDS_${PN}-module-english += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-env += "${PN}-module-config"
-RDEPENDS_${PN}-module-env += "${PN}-module-tie-array"
-RDEPENDS_${PN}-module-errno += "${PN}-module-carp"
-RDEPENDS_${PN}-module-errno += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-errno += "${PN}-module-strict"
-RDEPENDS_${PN}-module-experimental += "${PN}-module-carp"
-RDEPENDS_${PN}-module-experimental += "${PN}-module-feature"
-RDEPENDS_${PN}-module-experimental += "${PN}-module-strict"
-RDEPENDS_${PN}-module-experimental += "${PN}-module-version"
-RDEPENDS_${PN}-module-experimental += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-exporter-heavy += "${PN}-module-carp"
-RDEPENDS_${PN}-module-exporter-heavy += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-exporter-heavy += "${PN}-module-strict"
-RDEPENDS_${PN}-module-exporter += "${PN}-module-exporter-heavy"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-extutils-mksymlists"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-ipc-cmd"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-extutils-cbuilder-base += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-extutils-cbuilder-platform-unix"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-aix += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-extutils-cbuilder-platform-unix"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-android += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-extutils-cbuilder-platform-unix"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-cygwin += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-extutils-cbuilder-platform-unix"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-darwin += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-extutils-cbuilder-platform-unix"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-dec-osf += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-extutils-cbuilder-platform-unix"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-os2 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-extutils-cbuilder-base"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-unix += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-extutils-cbuilder-base"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-vms += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-bcc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-gcc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows-msvc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-extutils-cbuilder-base"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-cbuilder-platform-windows += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-extutils-command"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-extutils-install"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-getopt-long"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-test-harness"
-RDEPENDS_${PN}-module-extutils-command-mm += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-command += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-constant-base += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-constant-base += "${PN}-module-constant"
-RDEPENDS_${PN}-module-extutils-constant-base += "${PN}-module-extutils-constant-utils"
-RDEPENDS_${PN}-module-extutils-constant-base += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-constant-base += "${PN}-module-text-wrap"
-RDEPENDS_${PN}-module-extutils-constant-base += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-extutils-constant-proxysubs"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-extutils-constant-utils"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-extutils-constant-xs"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-constant += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-constant-proxysubs += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-constant-proxysubs += "${PN}-module-extutils-constant-utils"
-RDEPENDS_${PN}-module-extutils-constant-proxysubs += "${PN}-module-extutils-constant-xs"
-RDEPENDS_${PN}-module-extutils-constant-proxysubs += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-constant-proxysubs += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-constant-utils += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-constant-utils += "${PN}-module-constant"
-RDEPENDS_${PN}-module-extutils-constant-utils += "${PN}-module-posix"
-RDEPENDS_${PN}-module-extutils-constant-utils += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-constant-utils += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-extutils-constant"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-extutils-constant-base"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-extutils-constant-utils"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-constant-xs += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-extutils-liblist"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-getopt-std"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-embed += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-extutils-packlist"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-installed += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-autosplit"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-extutils-packlist"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-file-compare"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-install += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-extutils-liblist-kid += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-liblist += "${PN}-module-extutils-liblist-kid"
-RDEPENDS_${PN}-module-extutils-liblist += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-liblist += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-config += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-makemaker-config += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-locale += "${PN}-module-base"
-RDEPENDS_${PN}-module-extutils-makemaker-locale += "${PN}-module-encode"
-RDEPENDS_${PN}-module-extutils-makemaker-locale += "${PN}-module-encode-alias"
-RDEPENDS_${PN}-module-extutils-makemaker-locale += "${PN}-module-i18n-langinfo"
-RDEPENDS_${PN}-module-extutils-makemaker-locale += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-b"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-extutils-makemaker-version"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-extutils-manifest"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-extutils-mm"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-extutils-my"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker += "${PN}-module-version"
-RDEPENDS_${PN}-module-extutils-makemaker-version += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-makemaker-version += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-manifest += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-miniperl += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-miniperl += "${PN}-module-extutils-embed"
-RDEPENDS_${PN}-module-extutils-miniperl += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-miniperl += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-mkbootstrap += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-mkbootstrap += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-extutils-mkbootstrap += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-mkbootstrap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mksymlists += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-mksymlists += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-mksymlists += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-mksymlists += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-aix += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-aix += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-aix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-autosplit"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-cpan"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-data-dumper"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-any += "${PN}-module-version"
-RDEPENDS_${PN}-module-extutils-mm-beos += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-beos += "${PN}-module-extutils-mm-any"
-RDEPENDS_${PN}-module-extutils-mm-beos += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-beos += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-mm-beos += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-cygwin += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-cygwin += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-cygwin += "${PN}-module-extutils-mm-win32"
-RDEPENDS_${PN}-module-extutils-mm-cygwin += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-mm-cygwin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-darwin += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-darwin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-dos += "${PN}-module-extutils-mm-any"
-RDEPENDS_${PN}-module-extutils-mm-dos += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-dos += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-macos += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-nw5 += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-nw5 += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-nw5 += "${PN}-module-extutils-mm-win32"
-RDEPENDS_${PN}-module-extutils-mm-nw5 += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-mm-nw5 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-os2 += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-os2 += "${PN}-module-extutils-mm-any"
-RDEPENDS_${PN}-module-extutils-mm-os2 += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-os2 += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-mm-os2 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm += "${PN}-module-extutils-liblist"
-RDEPENDS_${PN}-module-extutils-mm += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-qnx += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-qnx += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-dirhandle"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-encode"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-extutils-liblist"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-extutils-mm-any"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-mm-unix += "${PN}-module-version"
-RDEPENDS_${PN}-module-extutils-mm-uwin += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-uwin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-extutils-liblist-kid"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-extutils-mm-any"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-extutils-mm-vms += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-vos += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-vos += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-extutils-mm-any"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-extutils-mm-unix"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-mm-win32 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-mm-win95 += "${PN}-module-extutils-makemaker-config"
-RDEPENDS_${PN}-module-extutils-mm-win95 += "${PN}-module-extutils-mm-win32"
-RDEPENDS_${PN}-module-extutils-mm-win95 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-my += "${PN}-module-extutils-mm"
-RDEPENDS_${PN}-module-extutils-my += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-packlist += "${PN}-module-carp"
-RDEPENDS_${PN}-module-extutils-packlist += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-packlist += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-packlist += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-packlist += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-packlist += "${PN}-module-vars"
-RDEPENDS_${PN}-module-extutils-parsexs-constants += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-parsexs-constants += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-extutils-parsexs-constants += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-parsexs-countlines += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-parsexs-eval += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-parsexs-eval += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-config"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-extutils-parsexs-constants"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-extutils-parsexs-countlines"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-extutils-parsexs-eval"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-extutils-parsexs-utilities"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-re"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-parsexs += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities += "${PN}-module-extutils-parsexs-constants"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities += "${PN}-module-extutils-typemaps"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-parsexs-utilities += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-testlib += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-extutils-testlib += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-extutils-testlib += "${PN}-module-lib"
-RDEPENDS_${PN}-module-extutils-testlib += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-testlib += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-typemaps-cmd += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-extutils-typemaps-cmd += "${PN}-module-extutils-typemaps"
-RDEPENDS_${PN}-module-extutils-typemaps-cmd += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-typemaps-cmd += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-typemaps-inputmap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-typemaps-inputmap += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-typemaps-outputmap += "${PN}-module-re"
-RDEPENDS_${PN}-module-extutils-typemaps-outputmap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-typemaps-outputmap += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-extutils-parsexs"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-extutils-parsexs-constants"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-extutils-typemaps-inputmap"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-extutils-typemaps-outputmap"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-extutils-typemaps-type"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-typemaps += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-extutils-typemaps-type += "${PN}-module-extutils-typemaps"
-RDEPENDS_${PN}-module-extutils-typemaps-type += "${PN}-module-strict"
-RDEPENDS_${PN}-module-extutils-typemaps-type += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-exception-system"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-hints"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-autodie-util"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-carp"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-config"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-constant"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-posix"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-strict"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-tie-refhash"
-RDEPENDS_${PN}-module-fatal += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-fcntl += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-fcntl += "${PN}-module-strict"
-RDEPENDS_${PN}-module-fcntl += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-feature += "${PN}-module-carp"
-RDEPENDS_${PN}-module-fields += "${PN}-module-base"
-RDEPENDS_${PN}-module-fields += "${PN}-module-carp"
-RDEPENDS_${PN}-module-fields += "${PN}-module-hash-util"
-RDEPENDS_${PN}-module-fields += "${PN}-module-strict"
-RDEPENDS_${PN}-module-fields += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-basename += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-basename += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-basename += "${PN}-module-re"
-RDEPENDS_${PN}-module-file-basename += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-basename += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-filecache += "${PN}-module-carp"
-RDEPENDS_${PN}-module-filecache += "${PN}-module-parent"
-RDEPENDS_${PN}-module-filecache += "${PN}-module-strict"
-RDEPENDS_${PN}-module-filecache += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-compare += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-compare += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-compare += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-compare += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-config"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-copy += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-file-dosglob += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-dosglob += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-file-dosglob += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-file-dosglob += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-constant"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-file-copy"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-ipc-cmd"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-locale-maketext-simple"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-load"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-params-check"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-fetch += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-config"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-file-find += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-file-globmapper += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-globmapper += "${PN}-module-file-glob"
-RDEPENDS_${PN}-module-file-globmapper += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-globmapper += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-file-glob += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-glob += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-glob += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-filehandle += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-filehandle += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-filehandle += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-filehandle += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-path += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-amigaos += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-amigaos += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-amigaos += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-cygwin += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-cygwin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-cygwin += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-epoc += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-epoc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-epoc += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-functions += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-spec-functions += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-file-spec-functions += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-functions += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-functions += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-mac += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-mac += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-mac += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-os2 += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-os2 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-os2 += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-unix += "${PN}-module-constant"
-RDEPENDS_${PN}-module-file-spec-unix += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-file-spec-unix += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-file-spec-unix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-unix += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-unix += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-file-spec-vms += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-file-spec-vms += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-vms += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-vms += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-spec-win32 += "${PN}-module-cwd "
-RDEPENDS_${PN}-module-file-spec-win32 += "${PN}-module-file-spec-unix"
-RDEPENDS_${PN}-module-file-spec-win32 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-spec-win32 += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-constant"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-overload "
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-vars"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-file-stat += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-constant"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-errno"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-io-seekable"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-overload"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-parent"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-posix"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-file-temp += "${PN}-module-vars"
-RDEPENDS_${PN}-module-filter-simple += "${PN}-module-carp"
-RDEPENDS_${PN}-module-filter-simple += "${PN}-module-filter-util-call"
-RDEPENDS_${PN}-module-filter-simple += "${PN}-module-text-balanced"
-RDEPENDS_${PN}-module-filter-simple += "${PN}-module-vars"
-RDEPENDS_${PN}-module-filter-util-call += "${PN}-module-carp "
-RDEPENDS_${PN}-module-filter-util-call += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-filter-util-call += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-filter-util-call += "${PN}-module-strict"
-RDEPENDS_${PN}-module-filter-util-call += "${PN}-module-vars"
-RDEPENDS_${PN}-module-filter-util-call += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-findbin += "${PN}-module-carp"
-RDEPENDS_${PN}-module-findbin += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-findbin += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-findbin += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-findbin += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-constant"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-overload"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-pod-usage"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-strict"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-getopt-long += "${PN}-module-vars"
-RDEPENDS_${PN}-module-getopt-std += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-hash-util-fieldhash += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-hash-util-fieldhash += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-hash-util-fieldhash += "${PN}-module-strict"
-RDEPENDS_${PN}-module-hash-util-fieldhash += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-hash-util-fieldhash += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-carp"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-hash-util-fieldhash"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-strict"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-hash-util += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-i18n-collate += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-i18n-collate += "${PN}-module-overload"
-RDEPENDS_${PN}-module-i18n-collate += "${PN}-module-posix"
-RDEPENDS_${PN}-module-i18n-collate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-i18n-collate += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-i18n-langinfo += "${PN}-module-carp"
-RDEPENDS_${PN}-module-i18n-langinfo += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-i18n-langinfo += "${PN}-module-strict"
-RDEPENDS_${PN}-module-i18n-langinfo += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-i18n-langinfo += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-i18n-langtags-detect += "${PN}-module-i18n-langtags"
-RDEPENDS_${PN}-module-i18n-langtags-detect += "${PN}-module-strict"
-RDEPENDS_${PN}-module-i18n-langtags-detect += "${PN}-module-vars"
-RDEPENDS_${PN}-module-i18n-langtags-list += "${PN}-module-strict"
-RDEPENDS_${PN}-module-i18n-langtags-list += "${PN}-module-vars"
-RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-strict"
-RDEPENDS_${PN}-module-i18n-langtags += "${PN}-module-vars"
-RDEPENDS_${PN}-module-io-compress-adapter-bzip2 += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-adapter-bzip2 += "${PN}-module-compress-raw-bzip2"
-RDEPENDS_${PN}-module-io-compress-adapter-bzip2 += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-adapter-bzip2 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-compress-adapter-bzip2 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-adapter-deflate += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-adapter-deflate += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-compress-adapter-deflate += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-compress-adapter-deflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-adapter-deflate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-compress-adapter-deflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-adapter-identity += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-adapter-identity += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-adapter-identity += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-compress-adapter-identity += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-encode"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-file-globmapper"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-io-compress-base-common += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-io-handle "
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-compress-base += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-io-compress-adapter-bzip2"
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-io-compress-base"
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-bzip2 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-io-compress-adapter-deflate"
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-io-compress-rawdeflate"
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-io-compress-zlib-constants"
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-deflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-gzip-constants += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-gzip-constants += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-compress-gzip-constants += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-compress-gzip-constants += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-gzip-constants += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-io-compress-adapter-deflate"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-io-compress-gzip-constants"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-io-compress-rawdeflate"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-io-compress-zlib-extra"
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-gzip += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-io-compress-adapter-deflate"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-io-compress-base"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-rawdeflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-zip-constants += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-compress-zip-constants += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-compress-zip-constants += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-zip-constants += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-config"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-adapter-deflate"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-adapter-identity"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-bzip2"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-rawdeflate"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-zip-constants"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-io-compress-zlib-extra"
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-zip += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-zlib-constants += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-zlib-constants += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-compress-zlib-constants += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-compress-zlib-constants += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-zlib-constants += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-compress-zlib-extra += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-compress-zlib-extra += "${PN}-module-io-compress-gzip-constants"
-RDEPENDS_${PN}-module-io-compress-zlib-extra += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-compress-zlib-extra += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-file-stat"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-dir += "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-io-seekable"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-selectsaver"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-file += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-io"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-selectsaver"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-handle += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-io-pipe += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-pipe += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-pipe += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-io-pipe += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-pipe += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-poll += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-poll += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-io-poll += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-seekable += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-seekable += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-seekable += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-seekable += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-io-seekable += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-select += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-select += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-select += "${PN}-module-vars"
-RDEPENDS_${PN}-module-io-select += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-io-socket-inet += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-socket-inet += "${PN}-module-errno"
-RDEPENDS_${PN}-module-io-socket-inet += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-socket-inet += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-io-socket-inet += "${PN}-module-socket"
-RDEPENDS_${PN}-module-io-socket-inet += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-base"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-errno"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-posix"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-socket"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-socket-ip += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-errno"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-io-select"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-io-socket-inet"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-io-socket-unix"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-socket"
-RDEPENDS_${PN}-module-io-socket += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-socket-unix += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-socket-unix += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-io-socket-unix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 += "${PN}-module-compress-raw-bzip2"
-RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-uncompress-adapter-bunzip2 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-adapter-identity += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-adapter-identity += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-uncompress-adapter-identity += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-adapter-identity += "${PN}-module-io-compress-zip-constants "
-RDEPENDS_${PN}-module-io-uncompress-adapter-identity += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-uncompress-adapter-identity += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-adapter-inflate += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-uncompress-adapter-inflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-adapter-inflate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-uncompress-adapter-inflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-uncompress-adapter-inflate"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-uncompress-base"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-uncompress-gunzip"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-uncompress-inflate"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-uncompress-rawinflate"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-io-uncompress-unzip"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-uncompress-anyinflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-anyuncompress += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-anyuncompress += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-anyuncompress += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-anyuncompress += "${PN}-module-io-uncompress-base"
-RDEPENDS_${PN}-module-io-uncompress-anyuncompress += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-uncompress-anyuncompress += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-carp "
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-io-file "
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-list-util"
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-uncompress-base += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-io-uncompress-adapter-bunzip2"
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-io-uncompress-base"
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-uncompress-bunzip2 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-io-compress-gzip-constants"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-io-compress-zlib-extra"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-io-uncompress-rawinflate"
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-uncompress-gunzip += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-io-compress-zlib-constants"
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-io-uncompress-rawinflate"
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-uncompress-inflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-io-uncompress-adapter-inflate"
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-io-uncompress-base"
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-uncompress-rawinflate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-compress-raw-zlib"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-constant"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-exporter "
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-compress-base-common"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-compress-zip-constants"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-compress-zlib-extra"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-uncompress-adapter-identity"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-uncompress-adapter-inflate"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-io-uncompress-rawinflate"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-posix"
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-strict "
-RDEPENDS_${PN}-module-io-uncompress-unzip += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-carp"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-strict"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-tie-handle"
-RDEPENDS_${PN}-module-io-zlib += "${PN}-module-vars"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-constant"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-extutils-makemaker"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-io-select"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-ipc-open3"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-locale-maketext-simple"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-load"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-params-check"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-posix"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-socket"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-time-hires"
-RDEPENDS_${PN}-module-ipc-cmd += "${PN}-module-vars"
-RDEPENDS_${PN}-module-ipc-msg += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-msg += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-ipc-msg += "${PN}-module-ipc-sysv"
-RDEPENDS_${PN}-module-ipc-msg += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-msg += "${PN}-module-vars"
-RDEPENDS_${PN}-module-ipc-open2 += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-ipc-open2 += "${PN}-module-ipc-open3"
-RDEPENDS_${PN}-module-ipc-open2 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-constant"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-io-pipe"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-posix"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-open3 += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-ipc-semaphore += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-semaphore += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-ipc-semaphore += "${PN}-module-ipc-sysv"
-RDEPENDS_${PN}-module-ipc-semaphore += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-semaphore += "${PN}-module-vars"
-RDEPENDS_${PN}-module-ipc-sharedmem += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-sharedmem += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-ipc-sharedmem += "${PN}-module-ipc-sysv"
-RDEPENDS_${PN}-module-ipc-sharedmem += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-sharedmem += "${PN}-module-vars"
-RDEPENDS_${PN}-module-ipc-sysv += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ipc-sysv += "${PN}-module-config"
-RDEPENDS_${PN}-module-ipc-sysv += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-ipc-sysv += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-ipc-sysv += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ipc-sysv += "${PN}-module-vars"
-RDEPENDS_${PN}-module-json-pp-boolean += "${PN}-module-json-pp"
-RDEPENDS_${PN}-module-json-pp-boolean += "${PN}-module-strict"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-b"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-base"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-bytes"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-constant"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-encode"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-overload"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-json-pp += "${PN}-module-subs"
-RDEPENDS_${PN}-module-less += "${PN}-module-strict"
-RDEPENDS_${PN}-module-less += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-lib += "${PN}-module-carp"
-RDEPENDS_${PN}-module-lib += "${PN}-module-config"
-RDEPENDS_${PN}-module-lib += "${PN}-module-strict"
-RDEPENDS_${PN}-module-list-util += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-list-util += "${PN}-module-strict"
-RDEPENDS_${PN}-module-list-util += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-list-util-xs += "${PN}-module-list-util"
-RDEPENDS_${PN}-module-list-util-xs += "${PN}-module-strict"
-RDEPENDS_${PN}-module-loaded += "${PN}-module-carp"
-RDEPENDS_${PN}-module-loaded += "${PN}-module-strict"
-RDEPENDS_${PN}-module-loaded += "${PN}-module-vars"
-RDEPENDS_${PN}-module-load += "${PN}-module-carp"
-RDEPENDS_${PN}-module-load += "${PN}-module-config"
-RDEPENDS_${PN}-module-load += "${PN}-module-constant"
-RDEPENDS_${PN}-module-load += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-load += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-load += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-load += "${PN}-module-locale-maketext-simple"
-RDEPENDS_${PN}-module-load += "${PN}-module-corelist"
-RDEPENDS_${PN}-module-load += "${PN}-module-load"
-RDEPENDS_${PN}-module-load += "${PN}-module-params-check"
-RDEPENDS_${PN}-module-load += "${PN}-module-strict"
-RDEPENDS_${PN}-module-load += "${PN}-module-vars"
-RDEPENDS_${PN}-module-load += "${PN}-module-version"
-RDEPENDS_${PN}-module-load += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-constants += "${PN}-module-constant"
-RDEPENDS_${PN}-module-locale-codes-constants += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-constants += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-constants += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-country-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-country-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-country-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-locale-codes-country-codes"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-locale-codes-country-retired"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-country += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-country-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-country-retired += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-country-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-currency-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-currency-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-currency-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-locale-codes-currency-codes"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-locale-codes-currency-retired"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-currency += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-currency-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-currency-retired += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-currency-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langext-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langext-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-langext-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-locale-codes-langext-codes"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-locale-codes-langext-retired"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langext += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langext-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langext-retired += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-langext-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langfam-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langfam-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-langfam-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-locale-codes-langfam-codes"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-locale-codes-langfam-retired"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langfam += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langfam-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langfam-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-language-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-language-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-language-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-locale-codes-language-codes"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-locale-codes-language-retired"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-language += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-language-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-language-retired += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-language-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langvar-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langvar-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-langvar-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-locale-codes-langvar-codes"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-locale-codes-langvar-retired"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langvar += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-langvar-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-langvar-retired += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-langvar-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-script-codes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-script-codes += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-script-codes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-locale-codes"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-locale-codes-constants"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-locale-codes-script-codes"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-locale-codes-script-retired"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-script += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-codes-script-retired += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-codes-script-retired += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-locale-codes-script-retired += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-country += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-country += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-country += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-currency += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-currency += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-currency += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-language += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-language += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-language += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-locale-maketext-gutsloader += "${PN}-module-locale-maketext"
-RDEPENDS_${PN}-module-locale-maketext-guts += "${PN}-module-locale-maketext"
-RDEPENDS_${PN}-module-locale-maketext += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale-maketext += "${PN}-module-i18n-langtags"
-RDEPENDS_${PN}-module-locale-maketext += "${PN}-module-i18n-langtags-detect"
-RDEPENDS_${PN}-module-locale-maketext += "${PN}-module-integer"
-RDEPENDS_${PN}-module-locale-maketext += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-maketext += "${PN}-module-vars"
-RDEPENDS_${PN}-module-locale-maketext-simple += "${PN}-module-base"
-RDEPENDS_${PN}-module-locale-maketext-simple += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale += "${PN}-module-carp"
-RDEPENDS_${PN}-module-locale += "${PN}-module-config"
-RDEPENDS_${PN}-module-locale-script += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-locale-script += "${PN}-module-strict"
-RDEPENDS_${PN}-module-locale-script += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-carp"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-math-complex"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigfloat += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigfloat-trace += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigint-calcemu += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-calcemu += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-carp"
-RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-constant"
-RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-integer"
-RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-calc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-math-bigint-calc"
-RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigint-fastcalc += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-carp"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-complex"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigint-trace += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-carp"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-math-bigfloat"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-math-bigint"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-bigrat += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-complex += "${PN}-module-config"
-RDEPENDS_${PN}-module-math-complex += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-complex += "${PN}-module-overload"
-RDEPENDS_${PN}-module-math-complex += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-math-complex += "${PN}-module-strict"
-RDEPENDS_${PN}-module-math-complex += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-math-trig += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-math-trig += "${PN}-module-math-complex"
-RDEPENDS_${PN}-module-math-trig += "${PN}-module-strict"
-RDEPENDS_${PN}-module-memoize-anydbm-file += "${PN}-module-vars"
-RDEPENDS_${PN}-module-memoize-expirefile += "${PN}-module-carp"
-RDEPENDS_${PN}-module-memoize-expire += "${PN}-module-carp"
-RDEPENDS_${PN}-module-memoize += "${PN}-module-carp"
-RDEPENDS_${PN}-module-memoize += "${PN}-module-config"
-RDEPENDS_${PN}-module-memoize += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-memoize += "${PN}-module-strict"
-RDEPENDS_${PN}-module-memoize += "${PN}-module-vars"
-RDEPENDS_${PN}-module-memoize-sdbm-file += "${PN}-module-sdbm-file"
-RDEPENDS_${PN}-module-memoize-storable += "${PN}-module-carp"
-RDEPENDS_${PN}-module-memoize-storable += "${PN}-module-storable"
-RDEPENDS_${PN}-module-meta-notation += "${PN}-module-strict"
-RDEPENDS_${PN}-module-meta-notation += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-mime-base64 += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-mime-base64 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-mime-base64 += "${PN}-module-vars"
-RDEPENDS_${PN}-module-mime-base64 += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-mime-quotedprint += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-mime-quotedprint += "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-mime-quotedprint += "${PN}-module-strict"
-RDEPENDS_${PN}-module-mime-quotedprint += "${PN}-module-vars"
-RDEPENDS_${PN}-module-mro += "${PN}-module-strict"
-RDEPENDS_${PN}-module-mro += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-mro += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-constant"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-errno"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-net-cmd += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-config += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-config += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-config += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-config += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-posix"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-domain += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ftp-a += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-ftp-a += "${PN}-module-net-ftp-dataconn"
-RDEPENDS_${PN}-module-net-ftp-a += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp-a += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ftp-dataconn += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-ftp-dataconn += "${PN}-module-errno"
-RDEPENDS_${PN}-module-net-ftp-dataconn += "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-ftp-dataconn += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp-dataconn += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ftp-e += "${PN}-module-net-ftp-i"
-RDEPENDS_${PN}-module-net-ftp-e += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp-e += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ftp-i += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-ftp-i += "${PN}-module-net-ftp-dataconn"
-RDEPENDS_${PN}-module-net-ftp-i += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp-i += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ftp-l += "${PN}-module-net-ftp-i"
-RDEPENDS_${PN}-module-net-ftp-l += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp-l += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-constant"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-io-socket-ip"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-net-ftp-a"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-net-netrc"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-time-local"
-RDEPENDS_${PN}-module-net-ftp += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-hostent += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-net-hostent += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-hostent += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-hostent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-hostent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-net-netent += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-net-netent += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-netent += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-netent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-netent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-net-netrc += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-netrc += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-net-netrc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-netrc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-io-socket-ip"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-time-local"
-RDEPENDS_${PN}-module-net-nntp += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-constant"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-filehandle"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-posix"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-time-hires"
-RDEPENDS_${PN}-module-net-ping += "${PN}-module-vars"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-io-socket-ip"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-net-netrc"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-pop3 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-protoent += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-net-protoent += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-protoent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-protoent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-net-servent += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-net-servent += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-servent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-servent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-io-socket-ip"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-mime-base64"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-net-cmd"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-socket"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-smtp += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-carp"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-io-select"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-io-socket"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-net-config"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-strict"
-RDEPENDS_${PN}-module-net-time += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-next += "${PN}-module-carp"
-RDEPENDS_${PN}-module-next += "${PN}-module-overload"
-RDEPENDS_${PN}-module-next += "${PN}-module-strict"
-RDEPENDS_${PN}-module-odbm-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-odbm-file += "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-odbm-file += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-odbm-file += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-ok += "${PN}-module-strict"
-RDEPENDS_${PN}-module-ok += "${PN}-module-test-more"
-RDEPENDS_${PN}-module-opcode += "${PN}-module-carp"
-RDEPENDS_${PN}-module-opcode += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-opcode += "${PN}-module-strict"
-RDEPENDS_${PN}-module-opcode += "${PN}-module-subs"
-RDEPENDS_${PN}-module-opcode += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-open += "${PN}-module-carp"
-RDEPENDS_${PN}-module-open += "${PN}-module-encode"
-RDEPENDS_${PN}-module-open += "${PN}-module-encoding"
-RDEPENDS_${PN}-module-open += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-o += "${PN}-module-b"
-RDEPENDS_${PN}-module-o += "${PN}-module-carp"
-RDEPENDS_${PN}-module-ops += "${PN}-module-opcode"
-RDEPENDS_${PN}-module-overloading += "${PN}-module-overload-numbers"
-RDEPENDS_${PN}-module-overloading += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-overload += "${PN}-module-mro"
-RDEPENDS_${PN}-module-overload += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-overload += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-params-check += "${PN}-module-carp"
-RDEPENDS_${PN}-module-params-check += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-params-check += "${PN}-module-locale-maketext-simple"
-RDEPENDS_${PN}-module-params-check += "${PN}-module-strict"
-RDEPENDS_${PN}-module-params-check += "${PN}-module-vars"
-RDEPENDS_${PN}-module-parent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-parent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-perlfaq += "${PN}-module-strict"
-RDEPENDS_${PN}-module-perlfaq += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-perlio-encoding += "${PN}-module-strict"
-RDEPENDS_${PN}-module-perlio-encoding += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-perlio-mmap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-perlio-mmap += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-perlio-mmap += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-perlio-scalar += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-perlio-via += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-perlio-via-quotedprint += "${PN}-module-mime-quotedprint"
-RDEPENDS_${PN}-module-perlio-via-quotedprint += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-checker += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-checker += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-checker += "${PN}-module-pod-parser"
-RDEPENDS_${PN}-module-pod-checker += "${PN}-module-pod-parseutils"
-RDEPENDS_${PN}-module-pod-checker += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-checker += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-escapes += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-escapes += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-escapes += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-escapes += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-config"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-file-find"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-find += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-functions += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-functions += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-inputobjects += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-inputobjects += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-subs"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-man += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-parselink += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-parser += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-parser += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-parser += "${PN}-module-pod-inputobjects"
-RDEPENDS_${PN}-module-pod-parser += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-parser += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-parser += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-parseutils += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-parseutils += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-parseutils += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-baseto += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-perldoc-baseto += "${PN}-module-config"
-RDEPENDS_${PN}-module-pod-perldoc-baseto += "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-pod-perldoc-baseto += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-baseto += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-baseto += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-getoptsoo += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-getoptsoo += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-config"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-encode"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-pod-perldoc-getoptsoo"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-toansi += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-toansi += "${PN}-module-pod-text-color"
-RDEPENDS_${PN}-module-pod-perldoc-toansi += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-toansi += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-toansi += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-tochecker += "${PN}-module-pod-checker"
-RDEPENDS_${PN}-module-pod-perldoc-tochecker += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-tochecker += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-tochecker += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-encode"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-file-spec-functions"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-io-select"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-ipc-open3"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-pod-man"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-pod-perldoc-topod"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-toman += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-tonroff += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-tonroff += "${PN}-module-pod-man"
-RDEPENDS_${PN}-module-pod-perldoc-tonroff += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-tonroff += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-tonroff += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-topod += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-topod += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-topod += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-topod += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-tortf += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-tortf += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-tortf += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-tortf += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-toterm += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-toterm += "${PN}-module-pod-text-termcap"
-RDEPENDS_${PN}-module-pod-perldoc-toterm += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-toterm += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-toterm += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-totext += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-totext += "${PN}-module-pod-text"
-RDEPENDS_${PN}-module-pod-perldoc-totext += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-totext += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-totext += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-perldoc-toxml += "${PN}-module-parent"
-RDEPENDS_${PN}-module-pod-perldoc-toxml += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-perldoc-toxml += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-perldoc-toxml += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-plaintext += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-plaintext += "${PN}-module-pod-select"
-RDEPENDS_${PN}-module-pod-plaintext += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-plaintext += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-plaintext += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-select += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-select += "${PN}-module-pod-parser"
-RDEPENDS_${PN}-module-pod-select += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-select += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-blackbox += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-blackbox += "${PN}-module-integer"
-RDEPENDS_${PN}-module-pod-simple-blackbox += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-blackbox += "${PN}-module-pod-simple-transcode"
-RDEPENDS_${PN}-module-pod-simple-blackbox += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-blackbox += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-checker += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-checker += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-checker += "${PN}-module-pod-simple-methody"
-RDEPENDS_${PN}-module-pod-simple-checker += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-checker += "${PN}-module-text-wrap"
-RDEPENDS_${PN}-module-pod-simple-checker += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-debug += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-debug += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-debug += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-debug += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-dumpastext += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-dumpastext += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-dumpastext += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-dumpasxml += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-dumpasxml += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-dumpasxml += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-dumpasxml += "${PN}-module-text-wrap"
-RDEPENDS_${PN}-module-pod-simple-linksection += "${PN}-module-overload"
-RDEPENDS_${PN}-module-pod-simple-linksection += "${PN}-module-pod-simple-blackbox"
-RDEPENDS_${PN}-module-pod-simple-linksection += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-linksection += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-methody += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-methody += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-methody += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-integer"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-pod-escapes"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-pod-simple-blackbox"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-pod-simple-linksection"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-pod-simple-tiedoutfh"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-simple += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-progress += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-pullparserendtoken += "${PN}-module-pod-simple-pullparsertoken"
-RDEPENDS_${PN}-module-pod-simple-pullparserendtoken += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-pullparserendtoken += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-pullparser += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-pullparser += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-pullparser += "${PN}-module-pod-simple-pullparserendtoken"
-RDEPENDS_${PN}-module-pod-simple-pullparser += "${PN}-module-pod-simple-pullparserstarttoken"
-RDEPENDS_${PN}-module-pod-simple-pullparser += "${PN}-module-pod-simple-pullparsertexttoken"
-RDEPENDS_${PN}-module-pod-simple-pullparser += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken += "${PN}-module-pod-simple-pullparsertoken"
-RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-pullparserstarttoken += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-pullparsertexttoken += "${PN}-module-pod-simple-pullparsertoken"
-RDEPENDS_${PN}-module-pod-simple-pullparsertexttoken += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-pullparsertexttoken += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-pullparsertoken += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-rtf += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-rtf += "${PN}-module-integer"
-RDEPENDS_${PN}-module-pod-simple-rtf += "${PN}-module-pod-simple-pullparser"
-RDEPENDS_${PN}-module-pod-simple-rtf += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-rtf += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-config"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-cwd"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-search += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-simpletree += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-simpletree += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-simpletree += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-simpletree += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-textcontent += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-textcontent += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-textcontent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-textcontent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-text += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-text += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-text += "${PN}-module-pod-simple-methody"
-RDEPENDS_${PN}-module-pod-simple-text += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-text += "${PN}-module-text-wrap"
-RDEPENDS_${PN}-module-pod-simple-text += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-tiedoutfh += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-tiedoutfh += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-tiedoutfh += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-pod-simple-tiedoutfh += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-transcodedumb += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-transcodedumb += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-transcode += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-transcode += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-transcodesmart += "${PN}-module-encode"
-RDEPENDS_${PN}-module-pod-simple-transcodesmart += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-transcodesmart += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-transcodesmart += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-simple-xmloutstream += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-simple-xmloutstream += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-simple-xmloutstream += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-simple-xmloutstream += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-pod-text"
-RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-term-ansicolor"
-RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-text-color += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-pod-text"
-RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-text-overstrike += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-encode"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-pod-simple"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-text += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-pod-text"
-RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-posix"
-RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-term-cap"
-RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-vars"
-RDEPENDS_${PN}-module-pod-text-termcap += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-pod-usage += "${PN}-module-carp"
-RDEPENDS_${PN}-module-pod-usage += "${PN}-module-config"
-RDEPENDS_${PN}-module-pod-usage += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-pod-usage += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-pod-usage += "${PN}-module-strict"
-RDEPENDS_${PN}-module-pod-usage += "${PN}-module-vars"
-RDEPENDS_${PN}-module-posix += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-posix += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-posix += "${PN}-module-strict"
-RDEPENDS_${PN}-module-posix += "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-posix += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-posix += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-re += "${PN}-module-carp"
-RDEPENDS_${PN}-module-re += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-re += "${PN}-module-strict"
-RDEPENDS_${PN}-module-re += "${PN}-module-term-cap"
-RDEPENDS_${PN}-module-re += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-re += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-safe += "${PN}-module-b"
-RDEPENDS_${PN}-module-safe += "${PN}-module-carp"
-RDEPENDS_${PN}-module-safe += "${PN}-module-carp-heavy"
-RDEPENDS_${PN}-module-safe += "${PN}-module-opcode"
-RDEPENDS_${PN}-module-safe += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-safe += "${PN}-module-strict"
-RDEPENDS_${PN}-module-safe += "${PN}-module-utf8"
-RDEPENDS_${PN}-module-scalar-util += "${PN}-module-carp"
-RDEPENDS_${PN}-module-scalar-util += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-scalar-util += "${PN}-module-list-util"
-RDEPENDS_${PN}-module-scalar-util += "${PN}-module-strict"
-RDEPENDS_${PN}-module-sdbm-file += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-sdbm-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-sdbm-file += "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-sdbm-file += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-sdbm-file += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-search-dict += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-search-dict += "${PN}-module-feature"
-RDEPENDS_${PN}-module-search-dict += "${PN}-module-strict"
-RDEPENDS_${PN}-module-selectsaver += "${PN}-module-carp"
-RDEPENDS_${PN}-module-selectsaver += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-selfloader += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-selfloader += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-selfloader += "${PN}-module-strict"
-RDEPENDS_${PN}-module-selfloader += "${PN}-module-vars"
-RDEPENDS_${PN}-module-sigtrap += "${PN}-module-carp"
-RDEPENDS_${PN}-module-sigtrap += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-socket += "${PN}-module-carp"
-RDEPENDS_${PN}-module-socket += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-socket += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-socket += "${PN}-module-strict"
-RDEPENDS_${PN}-module-socket += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-socket += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-sort += "${PN}-module-carp"
-RDEPENDS_${PN}-module-sort += "${PN}-module-strict"
-RDEPENDS_${PN}-module-storable += "${PN}-module-carp"
-RDEPENDS_${PN}-module-storable += "${PN}-module-config"
-RDEPENDS_${PN}-module-storable += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-storable += "${PN}-module-io-file"
-RDEPENDS_${PN}-module-storable += "${PN}-module-vars"
-RDEPENDS_${PN}-module-storable += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-sub-util += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-sub-util += "${PN}-module-list-util"
-RDEPENDS_${PN}-module-sub-util += "${PN}-module-strict"
-RDEPENDS_${PN}-module-sub-util += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-symbol += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-sys-hostname += "${PN}-module-carp"
-RDEPENDS_${PN}-module-sys-hostname += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-sys-hostname += "${PN}-module-posix"
-RDEPENDS_${PN}-module-sys-hostname += "${PN}-module-strict"
-RDEPENDS_${PN}-module-sys-hostname += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-carp"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-posix"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-socket"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-strict"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-sys-hostname"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-vars"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-sys-syslog += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-tap-base += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-base += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-base += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-base += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-posix"
-RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-tap-formatter-color"
-RDEPENDS_${PN}-module-tap-formatter-base += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-color += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-color += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-formatter-color += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-color += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-console-parallelsession += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-console += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-console += "${PN}-module-posix"
-RDEPENDS_${PN}-module-tap-formatter-console += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-console += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-console-session += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-console-session += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-console-session += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-posix"
-RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-tap-formatter-file-session"
-RDEPENDS_${PN}-module-tap-formatter-file += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-file-session += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-formatter-session += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-formatter-session += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-formatter-session += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-harness-env += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-harness-env += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-harness-env += "${PN}-module-tap-object"
-RDEPENDS_${PN}-module-tap-harness-env += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-tap-harness-env += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-file-path"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-harness += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-object += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-object += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-object += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-aggregator += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-aggregator += "${PN}-module-benchmark"
-RDEPENDS_${PN}-module-tap-parser-aggregator += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-aggregator += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-aggregator += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-grammar += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-grammar += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-grammar += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-grammar += "${PN}-module-tap-parser-resultfactory"
-RDEPENDS_${PN}-module-tap-parser-grammar += "${PN}-module-tap-parser-yamlish-reader"
-RDEPENDS_${PN}-module-tap-parser-grammar += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-iterator-array += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-iterator-array += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iterator-array += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iteratorfactory += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-iterator += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-iterator += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-iterator += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iterator += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-iterator-process += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-iterator-process += "${PN}-module-config"
-RDEPENDS_${PN}-module-tap-parser-iterator-process += "${PN}-module-io-handle"
-RDEPENDS_${PN}-module-tap-parser-iterator-process += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iterator-process += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-iterator-stream += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-iterator-stream += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-iterator-stream += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-multiplexer += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-multiplexer += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-multiplexer += "${PN}-module-io-select"
-RDEPENDS_${PN}-module-tap-parser-multiplexer += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-multiplexer += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-grammar"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-iterator"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-result"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-resultfactory"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-source"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-sourcehandler-executable"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-sourcehandler-file"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-sourcehandler-handle"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-sourcehandler-perl"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-tap-parser-sourcehandler-rawtap"
-RDEPENDS_${PN}-module-tap-parser += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-bailout += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-bailout += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-bailout += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-comment += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-comment += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-comment += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-bailout"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-comment"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-plan"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-pragma"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-test"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-unknown"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-version"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-tap-parser-result-yaml"
-RDEPENDS_${PN}-module-tap-parser-resultfactory += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-plan += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-plan += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-plan += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-pragma += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-pragma += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-pragma += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-test += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-test += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-test += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-unknown += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-unknown += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-unknown += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-version += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-version += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-version += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-result-yaml += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-result-yaml += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-result-yaml += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-scheduler-job += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-scheduler-job += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-scheduler-job += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-scheduler += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-scheduler += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-scheduler += "${PN}-module-tap-parser-scheduler-job"
-RDEPENDS_${PN}-module-tap-parser-scheduler += "${PN}-module-tap-parser-scheduler-spinner"
-RDEPENDS_${PN}-module-tap-parser-scheduler += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-scheduler-spinner += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tap-parser-scheduler-spinner += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-scheduler-spinner += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable += "${PN}-module-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable += "${PN}-module-tap-parser-iterator-process"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-executable += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file += "${PN}-module-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file += "${PN}-module-tap-parser-iterator-stream"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-file += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle += "${PN}-module-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle += "${PN}-module-tap-parser-iterator-stream"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-handle += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler += "${PN}-module-tap-parser-iterator"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-config"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-tap-parser-iterator-process"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-perl += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap += "${PN}-module-tap-parser-iterator-array"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap += "${PN}-module-tap-parser-iteratorfactory"
-RDEPENDS_${PN}-module-tap-parser-sourcehandler-rawtap += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-source += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-source += "${PN}-module-constant"
-RDEPENDS_${PN}-module-tap-parser-source += "${PN}-module-file-basename"
-RDEPENDS_${PN}-module-tap-parser-source += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-source += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-yamlish-reader += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-yamlish-reader += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-yamlish-reader += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-tap-parser-yamlish-writer += "${PN}-module-base"
-RDEPENDS_${PN}-module-tap-parser-yamlish-writer += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tap-parser-yamlish-writer += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-term-ansicolor += "${PN}-module-carp"
-RDEPENDS_${PN}-module-term-ansicolor += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-term-ansicolor += "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-ansicolor += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-term-cap += "${PN}-module-carp"
-RDEPENDS_${PN}-module-term-cap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-cap += "${PN}-module-vars"
-RDEPENDS_${PN}-module-term-complete += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-term-complete += "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-readline += "${PN}-module-strict"
-RDEPENDS_${PN}-module-term-readline += "${PN}-module-term-cap"
-RDEPENDS_${PN}-module-test-builder-module += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test-builder-module += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-builder-module += "${PN}-module-test-builder"
-RDEPENDS_${PN}-module-test-builder += "${PN}-module-config"
-RDEPENDS_${PN}-module-test-builder += "${PN}-module-perlio"
-RDEPENDS_${PN}-module-test-builder += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-builder += "${PN}-module-threads-shared"
-RDEPENDS_${PN}-module-test-builder += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-test-builder-tester-color += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-builder-tester-color += "${PN}-module-test-builder-tester"
-RDEPENDS_${PN}-module-test-builder-tester += "${PN}-module-carp"
-RDEPENDS_${PN}-module-test-builder-tester += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test-builder-tester += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-builder-tester += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-test-builder-tester += "${PN}-module-test-builder"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-base"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-config"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-constant"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-tap-harness"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-tap-parser-aggregator"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-tap-parser-source"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-tap-parser-sourcehandler-perl"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-text-parsewords"
-RDEPENDS_${PN}-module-test-harness += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-test-more += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-test-more += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-more += "${PN}-module-test-builder-module"
-RDEPENDS_${PN}-module-test-more += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-test += "${PN}-module-carp"
-RDEPENDS_${PN}-module-test += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test += "${PN}-module-file-temp"
-RDEPENDS_${PN}-module-test += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test += "${PN}-module-vars"
-RDEPENDS_${PN}-module-test-simple += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-simple += "${PN}-module-test-builder-module"
-RDEPENDS_${PN}-module-test-tester-capture += "${PN}-module-config"
-RDEPENDS_${PN}-module-test-tester-capture += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-tester-capture += "${PN}-module-test-builder"
-RDEPENDS_${PN}-module-test-tester-capture += "${PN}-module-threads-shared"
-RDEPENDS_${PN}-module-test-tester-capture += "${PN}-module-vars"
-RDEPENDS_${PN}-module-test-tester-capturerunner += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test-tester-capturerunner += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-tester-capturerunner += "${PN}-module-test-tester-capture"
-RDEPENDS_${PN}-module-test-tester-delegate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-tester-delegate += "${PN}-module-vars"
-RDEPENDS_${PN}-module-test-tester-delegate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-test-tester += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-test-tester += "${PN}-module-strict"
-RDEPENDS_${PN}-module-test-tester += "${PN}-module-test-builder"
-RDEPENDS_${PN}-module-test-tester += "${PN}-module-test-tester-capturerunner"
-RDEPENDS_${PN}-module-test-tester += "${PN}-module-test-tester-delegate"
-RDEPENDS_${PN}-module-test-tester += "${PN}-module-vars"
-RDEPENDS_${PN}-module-text-abbrev += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-text-balanced += "${PN}-module-carp"
-RDEPENDS_${PN}-module-text-balanced += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-text-balanced += "${PN}-module-overload"
-RDEPENDS_${PN}-module-text-balanced += "${PN}-module-selfloader"
-RDEPENDS_${PN}-module-text-balanced += "${PN}-module-strict"
-RDEPENDS_${PN}-module-text-balanced += "${PN}-module-vars"
-RDEPENDS_${PN}-module-text-parsewords += "${PN}-module-carp"
-RDEPENDS_${PN}-module-text-parsewords += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-text-parsewords += "${PN}-module-strict"
-RDEPENDS_${PN}-module-text-tabs += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-text-tabs += "${PN}-module-strict"
-RDEPENDS_${PN}-module-text-tabs += "${PN}-module-vars"
-RDEPENDS_${PN}-module-text-wrap += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-text-wrap += "${PN}-module-re"
-RDEPENDS_${PN}-module-text-wrap += "${PN}-module-strict"
-RDEPENDS_${PN}-module-text-wrap += "${PN}-module-text-tabs"
-RDEPENDS_${PN}-module-text-wrap += "${PN}-module-vars"
-RDEPENDS_${PN}-module-text-wrap += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-thread += "${PN}-module-config"
-RDEPENDS_${PN}-module-thread += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-thread += "${PN}-module-strict"
-RDEPENDS_${PN}-module-thread += "${PN}-module-threads"
-RDEPENDS_${PN}-module-thread += "${PN}-module-threads-shared"
-RDEPENDS_${PN}-module-thread += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-thread-queue += "${PN}-module-carp"
-RDEPENDS_${PN}-module-thread-queue += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-thread-queue += "${PN}-module-strict"
-RDEPENDS_${PN}-module-thread-queue += "${PN}-module-threads-shared"
-RDEPENDS_${PN}-module-thread-queue += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-thread-semaphore += "${PN}-module-carp"
-RDEPENDS_${PN}-module-thread-semaphore += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-thread-semaphore += "${PN}-module-strict"
-RDEPENDS_${PN}-module-thread-semaphore += "${PN}-module-threads-shared"
-RDEPENDS_${PN}-module-thread-semaphore += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-threads += "${PN}-module-carp"
-RDEPENDS_${PN}-module-threads += "${PN}-module-config"
-RDEPENDS_${PN}-module-threads += "${PN}-module-overload"
-RDEPENDS_${PN}-module-threads += "${PN}-module-strict"
-RDEPENDS_${PN}-module-threads += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-threads += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-threads-shared += "${PN}-module-carp"
-RDEPENDS_${PN}-module-threads-shared += "${PN}-module-scalar-util"
-RDEPENDS_${PN}-module-threads-shared += "${PN}-module-strict"
-RDEPENDS_${PN}-module-threads-shared += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-threads-shared += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-tie-array += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-array += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tie-array += "${PN}-module-vars"
-RDEPENDS_${PN}-module-tie-file += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-file += "${PN}-module-fcntl"
-RDEPENDS_${PN}-module-tie-file += "${PN}-module-posix"
-RDEPENDS_${PN}-module-tie-file += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tie-file += "${PN}-module-symbol"
-RDEPENDS_${PN}-module-tie-handle += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-handle += "${PN}-module-tie-stdhandle"
-RDEPENDS_${PN}-module-tie-handle += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-tie-hash-namedcapture += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tie-hash-namedcapture += "${PN}-module-xsloader"
-RDEPENDS_${PN}-module-tie-hash += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-hash += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-tie-memoize += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tie-memoize += "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-tie-refhash += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-refhash += "${PN}-module-config"
-RDEPENDS_${PN}-module-tie-refhash += "${PN}-module-overload"
-RDEPENDS_${PN}-module-tie-refhash += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tie-refhash += "${PN}-module-tie-hash"
-RDEPENDS_${PN}-module-tie-refhash += "${PN}-module-vars"
-RDEPENDS_${PN}-module-tie-scalar += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-scalar += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-tie-stdhandle += "${PN}-module-strict"
-RDEPENDS_${PN}-module-tie-stdhandle += "${PN}-module-tie-handle"
-RDEPENDS_${PN}-module-tie-stdhandle += "${PN}-module-vars"
-RDEPENDS_${PN}-module-tie-substrhash += "${PN}-module-carp"
-RDEPENDS_${PN}-module-tie-substrhash += "${PN}-module-integer"
-RDEPENDS_${PN}-module-time-gmtime += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-gmtime += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-gmtime += "${PN}-module-time-tm"
-RDEPENDS_${PN}-module-time-gmtime += "${PN}-module-vars"
-RDEPENDS_${PN}-module-time-hires += "${PN}-module-carp"
-RDEPENDS_${PN}-module-time-hires += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-time-hires += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-hires += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-local += "${PN}-module-carp"
-RDEPENDS_${PN}-module-time-local += "${PN}-module-config"
-RDEPENDS_${PN}-module-time-local += "${PN}-module-constant"
-RDEPENDS_${PN}-module-time-local += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-local += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-local += "${PN}-module-vars"
-RDEPENDS_${PN}-module-time-localtime += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-localtime += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-localtime += "${PN}-module-time-tm"
-RDEPENDS_${PN}-module-time-localtime += "${PN}-module-vars"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-carp"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-constant"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-integer"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-overload"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-time-local"
-RDEPENDS_${PN}-module-time-piece += "${PN}-module-time-seconds"
-RDEPENDS_${PN}-module-time-seconds += "${PN}-module-constant"
-RDEPENDS_${PN}-module-time-seconds += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-time-seconds += "${PN}-module-overload"
-RDEPENDS_${PN}-module-time-seconds += "${PN}-module-strict"
-RDEPENDS_${PN}-module-time-tm += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-time-tm += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-big5 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-big5 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-gb2312 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-jisx0208 += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-cjk-korean += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-korean += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-pinyin += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-cjk-stroke += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-stroke += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-cjk-zhuyin += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate-locale += "${PN}-module-base"
-RDEPENDS_${PN}-module-unicode-collate-locale += "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-collate-locale += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate-locale += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-constant"
-RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-collate += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-dynaloader"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-normalize += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-carp"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-charnames"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-feature"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-file-spec"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-if"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-integer"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-strict"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-unicode-normalize"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-unicore"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-utf8-heavy"
-RDEPENDS_${PN}-module-unicode-ucd += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-unicore += "${PN}-module-integer"
-RDEPENDS_${PN}-module-universal += "${PN}-module-carp"
-RDEPENDS_${PN}-module-user-grent += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-user-grent += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-user-grent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-user-grent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-carp"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-class-struct"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-config"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-exporter"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-strict"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-vars"
-RDEPENDS_${PN}-module-user-pwent += "${PN}-module-warnings"
-RDEPENDS_${PN}-module-utf8 += "${PN}-module-carp"
-RDEPENDS_${PN}-module-utf8 += "${PN}-module-utf8-heavy"
-RDEPENDS_${PN}-module-version += "${PN}-module-strict"
-RDEPENDS_${PN}-module-version += "${PN}-module-vars"
-RDEPENDS_${PN}-module-version += "${PN}-module-version-regex"
-RDEPENDS_${PN}-module-version += "${PN}-module-warnings-register"
-RDEPENDS_${PN}-module-version-regex += "${PN}-module-strict"
-RDEPENDS_${PN}-module-version-regex += "${PN}-module-vars"
-RDEPENDS_${PN}-module-xsloader += "${PN}-module-carp"
-RDEPENDS_${PN}-module-xsloader += "${PN}-module-dynaloader"
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.28.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.28.1.inc
new file mode 100644
index 0000000000..67a327f453
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.28.1.inc
@@ -0,0 +1,2818 @@
+# To create/update the perl-rdepends_5.28.1.inc use this piece of ugly script (modified for your arch/paths etc):
+
+#jiahongxu:5.20.0-r1$ pwd
+#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl/5.20.0-r1
+
+#1 cp -r packages-split packages-split.new && cd packages-split.new
+#2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
+#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm"
+#| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:]
+#| awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'
+#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix
+#| sort -u
+#| sed 's/^/RDEPENDS_/;s/perl-module-/perl-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;'
+#| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rdepends
+
+RDEPENDS_perl-misc += "perl perl-modules"
+RDEPENDS_perl-pod += "perl"
+
+# Some additional dependencies that the above doesn't manage to figure out
+RDEPENDS_perl-module-file-spec += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-bigint-calc"
+RDEPENDS_perl-module-thread-queue += "perl-module-attributes"
+RDEPENDS_perl-module-overload += "perl-module-overloading"
+
+# Generated depends list beyond this line
+RDEPENDS_perl-module-anydbm-file += "perl-module-strict"
+RDEPENDS_perl-module-anydbm-file += "perl-module-warnings"
+RDEPENDS_perl-module-app-cpan += "perl-module-carp"
+RDEPENDS_perl-module-app-cpan += "perl-module-config"
+RDEPENDS_perl-module-app-cpan += "perl-module-constant"
+RDEPENDS_perl-module-app-cpan += "perl-module-cpan"
+RDEPENDS_perl-module-app-cpan += "perl-module-cwd"
+RDEPENDS_perl-module-app-cpan += "perl-module-data-dumper"
+RDEPENDS_perl-module-app-cpan += "perl-module-file-basename"
+RDEPENDS_perl-module-app-cpan += "perl-module-file-find"
+RDEPENDS_perl-module-app-cpan += "perl-module-file-spec-functions"
+RDEPENDS_perl-module-app-cpan += "perl-module-getopt-std"
+RDEPENDS_perl-module-app-cpan += "perl-module-if"
+RDEPENDS_perl-module-app-cpan += "perl-module-net-ping"
+RDEPENDS_perl-module-app-cpan += "perl-module-strict"
+RDEPENDS_perl-module-app-cpan += "perl-module-uri"
+RDEPENDS_perl-module-app-cpan += "perl-module-user-pwent"
+RDEPENDS_perl-module-app-cpan += "perl-module-vars"
+RDEPENDS_perl-module-app-cpan += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove += "perl-module-app-prove-state"
+RDEPENDS_perl-module-app-prove += "perl-module-base"
+RDEPENDS_perl-module-app-prove += "perl-module-carp"
+RDEPENDS_perl-module-app-prove += "perl-module-constant"
+RDEPENDS_perl-module-app-prove += "perl-module-file-spec"
+RDEPENDS_perl-module-app-prove += "perl-module-getopt-long"
+RDEPENDS_perl-module-app-prove += "perl-module-strict"
+RDEPENDS_perl-module-app-prove += "perl-module-tap-harness"
+RDEPENDS_perl-module-app-prove += "perl-module-tap-harness-env"
+RDEPENDS_perl-module-app-prove += "perl-module-text-parsewords"
+RDEPENDS_perl-module-app-prove += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove-state += "perl-module-app-prove-state-result"
+RDEPENDS_perl-module-app-prove-state += "perl-module-base"
+RDEPENDS_perl-module-app-prove-state += "perl-module-carp"
+RDEPENDS_perl-module-app-prove-state += "perl-module-constant"
+RDEPENDS_perl-module-app-prove-state += "perl-module-file-find"
+RDEPENDS_perl-module-app-prove-state += "perl-module-file-spec"
+RDEPENDS_perl-module-app-prove-state += "perl-module-strict"
+RDEPENDS_perl-module-app-prove-state += "perl-module-tap-parser-yamlish-reader"
+RDEPENDS_perl-module-app-prove-state += "perl-module-tap-parser-yamlish-writer"
+RDEPENDS_perl-module-app-prove-state += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-app-prove-state-result-test"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-carp"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-constant"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-strict"
+RDEPENDS_perl-module-app-prove-state-result += "perl-module-warnings"
+RDEPENDS_perl-module-app-prove-state-result-test += "perl-module-strict"
+RDEPENDS_perl-module-app-prove-state-result-test += "perl-module-warnings"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-constant"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-exporter"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-io-compress-bzip2"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-strict"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-time-local"
+RDEPENDS_perl-module-archive-tar-constant += "perl-module-warnings"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-archive-tar"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-archive-tar-constant"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-carp"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-file-basename"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-file-spec"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-io-file"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-strict"
+RDEPENDS_perl-module-archive-tar-file += "perl-module-vars"
+RDEPENDS_perl-module-archive-tar += "perl-module-archive-tar-constant"
+RDEPENDS_perl-module-archive-tar += "perl-module-archive-tar-file"
+RDEPENDS_perl-module-archive-tar += "perl-module-carp"
+RDEPENDS_perl-module-archive-tar += "perl-module-config"
+RDEPENDS_perl-module-archive-tar += "perl-module-cwd"
+RDEPENDS_perl-module-archive-tar += "perl-module-exporter"
+RDEPENDS_perl-module-archive-tar += "perl-module-file-path"
+RDEPENDS_perl-module-archive-tar += "perl-module-file-spec"
+RDEPENDS_perl-module-archive-tar += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-archive-tar += "perl-module-io-file"
+RDEPENDS_perl-module-archive-tar += "perl-module-io-zlib"
+RDEPENDS_perl-module-archive-tar += "perl-module-strict"
+RDEPENDS_perl-module-archive-tar += "perl-module-vars"
+RDEPENDS_perl-module-arybase += "perl-module-xsloader"
+RDEPENDS_perl-module-attribute-handlers += "perl-module-carp"
+RDEPENDS_perl-module-attribute-handlers += "perl-module-strict"
+RDEPENDS_perl-module-attribute-handlers += "perl-module-warnings"
+RDEPENDS_perl-module-attributes += "perl-module-carp"
+RDEPENDS_perl-module-attributes += "perl-module-exporter"
+RDEPENDS_perl-module-attributes += "perl-module-strict"
+RDEPENDS_perl-module-attributes += "perl-module-warnings"
+RDEPENDS_perl-module-attributes += "perl-module-xsloader"
+RDEPENDS_perl-module-autodie-exception += "perl-module-carp"
+RDEPENDS_perl-module-autodie-exception += "perl-module-constant"
+RDEPENDS_perl-module-autodie-exception += "perl-module-fatal"
+RDEPENDS_perl-module-autodie-exception += "perl-module-fcntl"
+RDEPENDS_perl-module-autodie-exception += "perl-module-overload"
+RDEPENDS_perl-module-autodie-exception += "perl-module-strict"
+RDEPENDS_perl-module-autodie-exception += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-carp"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-parent"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-strict"
+RDEPENDS_perl-module-autodie-exception-system += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-hints += "perl-module-b"
+RDEPENDS_perl-module-autodie-hints += "perl-module-carp"
+RDEPENDS_perl-module-autodie-hints += "perl-module-constant"
+RDEPENDS_perl-module-autodie-hints += "perl-module-strict"
+RDEPENDS_perl-module-autodie-hints += "perl-module-warnings"
+RDEPENDS_perl-module-autodie += "perl-module-carp"
+RDEPENDS_perl-module-autodie += "perl-module-constant"
+RDEPENDS_perl-module-autodie += "perl-module-lib"
+RDEPENDS_perl-module-autodie += "perl-module-parent"
+RDEPENDS_perl-module-autodie += "perl-module-strict"
+RDEPENDS_perl-module-autodie += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-scope-guard += "perl-module-strict"
+RDEPENDS_perl-module-autodie-scope-guard += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-scope-guardstack += "perl-module-autodie-scope-guard"
+RDEPENDS_perl-module-autodie-scope-guardstack += "perl-module-strict"
+RDEPENDS_perl-module-autodie-scope-guardstack += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-skip += "perl-module-strict"
+RDEPENDS_perl-module-autodie-skip += "perl-module-warnings"
+RDEPENDS_perl-module-autodie-util += "perl-module-autodie-scope-guardstack"
+RDEPENDS_perl-module-autodie-util += "perl-module-exporter"
+RDEPENDS_perl-module-autodie-util += "perl-module-strict"
+RDEPENDS_perl-module-autodie-util += "perl-module-warnings"
+RDEPENDS_perl-module-autoloader += "perl-module-carp"
+RDEPENDS_perl-module-autoloader += "perl-module-strict"
+RDEPENDS_perl-module-autosplit += "perl-module-carp"
+RDEPENDS_perl-module-autosplit += "perl-module-config"
+RDEPENDS_perl-module-autosplit += "perl-module-exporter"
+RDEPENDS_perl-module-autosplit += "perl-module-file-basename"
+RDEPENDS_perl-module-autosplit += "perl-module-file-path"
+RDEPENDS_perl-module-autosplit += "perl-module-file-spec-functions"
+RDEPENDS_perl-module-autosplit += "perl-module-strict"
+RDEPENDS_perl-module-autouse += "perl-module-carp"
+RDEPENDS_perl-module-base += "perl-module-carp"
+RDEPENDS_perl-module-base += "perl-module-strict"
+RDEPENDS_perl-module-b-concise += "perl-module-b"
+RDEPENDS_perl-module-b-concise += "perl-module-b-op-private"
+RDEPENDS_perl-module-b-concise += "perl-module-config"
+RDEPENDS_perl-module-b-concise += "perl-module-exporter"
+RDEPENDS_perl-module-b-concise += "perl-module-feature"
+RDEPENDS_perl-module-b-concise += "perl-module-strict"
+RDEPENDS_perl-module-b-concise += "perl-module-warnings"
+RDEPENDS_perl-module-b-debug += "perl-module-b"
+RDEPENDS_perl-module-b-debug += "perl-module-config"
+RDEPENDS_perl-module-b-debug += "perl-module-strict"
+RDEPENDS_perl-module-b-deparse += "perl-module-b"
+RDEPENDS_perl-module-b-deparse += "perl-module-carp"
+RDEPENDS_perl-module-b-deparse += "perl-module-config"
+RDEPENDS_perl-module-b-deparse += "perl-module-data-dumper"
+RDEPENDS_perl-module-b-deparse += "perl-module-feature"
+RDEPENDS_perl-module-b-deparse += "perl-module-re"
+RDEPENDS_perl-module-b-deparse += "perl-module-strict"
+RDEPENDS_perl-module-b-deparse += "perl-module-warnings"
+RDEPENDS_perl-module-benchmark += "perl-module-carp"
+RDEPENDS_perl-module-benchmark += "perl-module-exporter"
+RDEPENDS_perl-module-benchmark += "perl-module-strict"
+RDEPENDS_perl-module-bigint += "perl-module-carp"
+RDEPENDS_perl-module-bigint += "perl-module-constant"
+RDEPENDS_perl-module-bigint += "perl-module-exporter"
+RDEPENDS_perl-module-bigint += "perl-module-math-bigint"
+RDEPENDS_perl-module-bigint += "perl-module-math-bigint-trace"
+RDEPENDS_perl-module-bigint += "perl-module-overload"
+RDEPENDS_perl-module-bigint += "perl-module-strict"
+RDEPENDS_perl-module-bigint += "perl-module-warnings"
+RDEPENDS_perl-module-bignum += "perl-module-bigint"
+RDEPENDS_perl-module-bignum += "perl-module-carp"
+RDEPENDS_perl-module-bignum += "perl-module-exporter"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigfloat-trace"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigint"
+RDEPENDS_perl-module-bignum += "perl-module-math-bigint-trace"
+RDEPENDS_perl-module-bignum += "perl-module-overload"
+RDEPENDS_perl-module-bignum += "perl-module-strict"
+RDEPENDS_perl-module-bignum += "perl-module-warnings"
+RDEPENDS_perl-module-bigrat += "perl-module-bigint"
+RDEPENDS_perl-module-bigrat += "perl-module-carp"
+RDEPENDS_perl-module-bigrat += "perl-module-exporter"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigint"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigint-trace"
+RDEPENDS_perl-module-bigrat += "perl-module-math-bigrat"
+RDEPENDS_perl-module-bigrat += "perl-module-overload"
+RDEPENDS_perl-module-bigrat += "perl-module-strict"
+RDEPENDS_perl-module-bigrat += "perl-module-warnings"
+RDEPENDS_perl-module-blib += "perl-module-cwd"
+RDEPENDS_perl-module-blib += "perl-module-file-spec"
+RDEPENDS_perl-module-b += "perl-module-exporter"
+RDEPENDS_perl-module-b += "perl-module-xsloader"
+RDEPENDS_perl-module-b-showlex += "perl-module-b"
+RDEPENDS_perl-module-b-showlex += "perl-module-b-concise"
+RDEPENDS_perl-module-b-showlex += "perl-module-b-terse"
+RDEPENDS_perl-module-b-showlex += "perl-module-strict"
+RDEPENDS_perl-module-b-terse += "perl-module-b"
+RDEPENDS_perl-module-b-terse += "perl-module-b-concise"
+RDEPENDS_perl-module-b-terse += "perl-module-carp"
+RDEPENDS_perl-module-b-terse += "perl-module-strict"
+RDEPENDS_perl-module-b-xref += "perl-module-b"
+RDEPENDS_perl-module-b-xref += "perl-module-config"
+RDEPENDS_perl-module-b-xref += "perl-module-strict"
+RDEPENDS_perl-module-bytes += "perl-module-bytes-heavy"
+RDEPENDS_perl-module-bytes += "perl-module-carp"
+RDEPENDS_perl-module-carp-heavy += "perl-module-carp"
+RDEPENDS_perl-module-carp += "perl-module-exporter"
+RDEPENDS_perl-module-carp += "perl-module-strict"
+RDEPENDS_perl-module-carp += "perl-module-warnings"
+RDEPENDS_perl-module--charnames += "perl-module-bytes"
+RDEPENDS_perl-module-charnames += "perl-module-bytes"
+RDEPENDS_perl-module--charnames += "perl-module-carp"
+RDEPENDS_perl-module-charnames += "perl-module--charnames"
+RDEPENDS_perl-module--charnames += "perl-module-file-spec"
+RDEPENDS_perl-module--charnames += "perl-module-re"
+RDEPENDS_perl-module-charnames += "perl-module-re"
+RDEPENDS_perl-module--charnames += "perl-module-strict"
+RDEPENDS_perl-module-charnames += "perl-module-strict"
+RDEPENDS_perl-module--charnames += "perl-module-unicore-name"
+RDEPENDS_perl-module-charnames += "perl-module-unicore-name"
+RDEPENDS_perl-module--charnames += "perl-module-warnings"
+RDEPENDS_perl-module-charnames += "perl-module-warnings"
+RDEPENDS_perl-module-class-struct += "perl-module-carp"
+RDEPENDS_perl-module-class-struct += "perl-module-exporter"
+RDEPENDS_perl-module-class-struct += "perl-module-strict"
+RDEPENDS_perl-module-class-struct += "perl-module-warnings-register"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-bytes "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-carp "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-constant"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-dynaloader"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-exporter"
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-strict "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-warnings "
+RDEPENDS_perl-module-compress-raw-bzip2 += "perl-module-xsloader"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-bytes "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-carp "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-constant"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-dynaloader"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-exporter"
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-strict "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-warnings "
+RDEPENDS_perl-module-compress-raw-zlib += "perl-module-xsloader"
+RDEPENDS_perl-module-compress-zlib += "perl-module-bytes "
+RDEPENDS_perl-module-compress-zlib += "perl-module-carp "
+RDEPENDS_perl-module-compress-zlib += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-compress-zlib += "perl-module-constant"
+RDEPENDS_perl-module-compress-zlib += "perl-module-exporter"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-compress-gzip"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-handle "
+RDEPENDS_perl-module-compress-zlib += "perl-module-io-uncompress-gunzip"
+RDEPENDS_perl-module-compress-zlib += "perl-module-scalar-util"
+RDEPENDS_perl-module-compress-zlib += "perl-module-strict "
+RDEPENDS_perl-module-compress-zlib += "perl-module-warnings "
+RDEPENDS_perl-module-config-extensions += "perl-module-config"
+RDEPENDS_perl-module-config-extensions += "perl-module-exporter"
+RDEPENDS_perl-module-config-extensions += "perl-module-strict"
+RDEPENDS_perl-module-config-perl-v += "perl-module-config"
+RDEPENDS_perl-module-config-perl-v += "perl-module-exporter"
+RDEPENDS_perl-module-config-perl-v += "perl-module-strict"
+RDEPENDS_perl-module-config-perl-v += "perl-module-vars"
+RDEPENDS_perl-module-config-perl-v += "perl-module-warnings"
+RDEPENDS_perl-module-constant += "perl-module-carp"
+RDEPENDS_perl-module-constant += "perl-module-strict"
+RDEPENDS_perl-module-constant += "perl-module-warnings-register"
+RDEPENDS_perl-module-corelist += "perl-module-list-util"
+RDEPENDS_perl-module-corelist += "perl-module-corelist"
+RDEPENDS_perl-module-corelist += "perl-module-strict"
+RDEPENDS_perl-module-corelist += "perl-module-version"
+RDEPENDS_perl-module-corelist += "perl-module-warnings"
+RDEPENDS_perl-module-cpan += "perl-module-b"
+RDEPENDS_perl-module-cpan += "perl-module-carp"
+RDEPENDS_perl-module-cpan += "perl-module-config"
+RDEPENDS_perl-module-cpan += "perl-module-cwd"
+RDEPENDS_perl-module-cpan += "perl-module-data-dumper"
+RDEPENDS_perl-module-cpan += "perl-module-dirhandle"
+RDEPENDS_perl-module-cpan += "perl-module-errno"
+RDEPENDS_perl-module-cpan += "perl-module-exporter"
+RDEPENDS_perl-module-cpan += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-cpan += "perl-module-extutils-manifest"
+RDEPENDS_perl-module-cpan += "perl-module-fcntl"
+RDEPENDS_perl-module-cpan += "perl-module-file-basename"
+RDEPENDS_perl-module-cpan += "perl-module-file-copy"
+RDEPENDS_perl-module-cpan += "perl-module-file-find"
+RDEPENDS_perl-module-cpan += "perl-module-filehandle"
+RDEPENDS_perl-module-cpan += "perl-module-file-path"
+RDEPENDS_perl-module-cpan += "perl-module-file-spec"
+RDEPENDS_perl-module-cpan += "perl-module-lib"
+RDEPENDS_perl-module-cpan += "perl-module-net-ping"
+RDEPENDS_perl-module-cpan += "perl-module-overload"
+RDEPENDS_perl-module-cpan += "perl-module-posix"
+RDEPENDS_perl-module-cpan += "perl-module-safe"
+RDEPENDS_perl-module-cpan += "perl-module-scalar-util"
+RDEPENDS_perl-module-cpan += "perl-module-strict"
+RDEPENDS_perl-module-cpan += "perl-module-sys-hostname"
+RDEPENDS_perl-module-cpan += "perl-module-term-readline"
+RDEPENDS_perl-module-cpan += "perl-module-text-parsewords"
+RDEPENDS_perl-module-cpan += "perl-module-text-wrap"
+RDEPENDS_perl-module-cpan += "perl-module-time-local"
+RDEPENDS_perl-module-cpan += "perl-module-vars"
+RDEPENDS_perl-module-cpan += "perl-module-warnings"
+RDEPENDS_perl-module-cwd += "perl-module-errno"
+RDEPENDS_perl-module-cwd += "perl-module-exporter"
+RDEPENDS_perl-module-cwd += "perl-module-file-spec"
+RDEPENDS_perl-module-cwd += "perl-module-strict"
+RDEPENDS_perl-module-cwd += "perl-module-xsloader"
+RDEPENDS_perl-module-data-dumper += "perl-module-b-deparse"
+RDEPENDS_perl-module-data-dumper += "perl-module-carp"
+RDEPENDS_perl-module-data-dumper += "perl-module-config"
+RDEPENDS_perl-module-data-dumper += "perl-module-constant"
+RDEPENDS_perl-module-data-dumper += "perl-module-exporter"
+RDEPENDS_perl-module-data-dumper += "perl-module-scalar-util"
+RDEPENDS_perl-module-data-dumper += "perl-module-xsloader"
+RDEPENDS_perl-module-dbm-filter-compress += "perl-module-carp"
+RDEPENDS_perl-module-dbm-filter-compress += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-compress += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-encode += "perl-module-carp"
+RDEPENDS_perl-module-dbm-filter-encode += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-encode += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-int32 += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-int32 += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-null += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-null += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter += "perl-module-carp"
+RDEPENDS_perl-module-dbm-filter += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter += "perl-module-warnings"
+RDEPENDS_perl-module-dbm-filter-utf8 += "perl-module-carp"
+RDEPENDS_perl-module-dbm-filter-utf8 += "perl-module-strict"
+RDEPENDS_perl-module-dbm-filter-utf8 += "perl-module-warnings"
+RDEPENDS_perl-module-db += "perl-module-meta-notation.pm"
+RDEPENDS_perl-module-db += "perl-module-strict"
+RDEPENDS_perl-module-deprecate += "perl-module-carp"
+RDEPENDS_perl-module-deprecate += "perl-module-strict"
+RDEPENDS_perl-module-deprecate += "perl-module-warnings"
+RDEPENDS_perl-module-devel-peek += "perl-module-exporter"
+RDEPENDS_perl-module-devel-peek += "perl-module-xsloader"
+RDEPENDS_perl-module-devel-ppport += "perl-module-file-find"
+RDEPENDS_perl-module-devel-ppport += "perl-module-getopt-long"
+RDEPENDS_perl-module-devel-ppport += "perl-module-strict"
+RDEPENDS_perl-module-devel-ppport += "perl-module-vars"
+RDEPENDS_perl-module-devel-selfstubber += "perl-module-file-spec"
+RDEPENDS_perl-module-devel-selfstubber += "perl-module-selfloader"
+RDEPENDS_perl-module-diagnostics += "perl-module-carp"
+RDEPENDS_perl-module-diagnostics += "perl-module-config"
+RDEPENDS_perl-module-diagnostics += "perl-module-getopt-std"
+RDEPENDS_perl-module-diagnostics += "perl-module-strict"
+RDEPENDS_perl-module-diagnostics += "perl-module-text-tabs"
+RDEPENDS_perl-module-digest-base += "perl-module-carp"
+RDEPENDS_perl-module-digest-base += "perl-module-mime-base64"
+RDEPENDS_perl-module-digest-base += "perl-module-strict"
+RDEPENDS_perl-module-digest-base += "perl-module-vars"
+RDEPENDS_perl-module-digest-file += "perl-module-carp"
+RDEPENDS_perl-module-digest-file += "perl-module-digest"
+RDEPENDS_perl-module-digest-file += "perl-module-exporter"
+RDEPENDS_perl-module-digest-file += "perl-module-strict"
+RDEPENDS_perl-module-digest-file += "perl-module-vars"
+RDEPENDS_perl-module-digest-md5 += "perl-module-digest-base"
+RDEPENDS_perl-module-digest-md5 += "perl-module-exporter"
+RDEPENDS_perl-module-digest-md5 += "perl-module-strict"
+RDEPENDS_perl-module-digest-md5 += "perl-module-vars"
+RDEPENDS_perl-module-digest-md5 += "perl-module-xsloader"
+RDEPENDS_perl-module-digest += "perl-module-strict"
+RDEPENDS_perl-module-digest += "perl-module-vars"
+RDEPENDS_perl-module-digest-sha += "perl-module-carp"
+RDEPENDS_perl-module-digest-sha += "perl-module-digest-base"
+RDEPENDS_perl-module-digest-sha += "perl-module-dynaloader"
+RDEPENDS_perl-module-digest-sha += "perl-module-exporter"
+RDEPENDS_perl-module-digest-sha += "perl-module-fcntl"
+RDEPENDS_perl-module-digest-sha += "perl-module-integer"
+RDEPENDS_perl-module-digest-sha += "perl-module-strict"
+RDEPENDS_perl-module-digest-sha += "perl-module-vars"
+RDEPENDS_perl-module-digest-sha += "perl-module-warnings"
+RDEPENDS_perl-module-digest-sha += "perl-module-xsloader"
+RDEPENDS_perl-module-dirhandle += "perl-module-carp"
+RDEPENDS_perl-module-dirhandle += "perl-module-symbol"
+RDEPENDS_perl-module-dynaloader += "perl-module-carp"
+RDEPENDS_perl-module-dynaloader += "perl-module-config"
+RDEPENDS_perl-module-encode-alias += "perl-module-carp"
+RDEPENDS_perl-module-encode-alias += "perl-module-constant"
+RDEPENDS_perl-module-encode-alias += "perl-module-encode"
+RDEPENDS_perl-module-encode-alias += "perl-module-exporter"
+RDEPENDS_perl-module-encode-alias += "perl-module-strict"
+RDEPENDS_perl-module-encode-alias += "perl-module-warnings"
+RDEPENDS_perl-module-encode-byte += "perl-module-encode"
+RDEPENDS_perl-module-encode-byte += "perl-module-strict"
+RDEPENDS_perl-module-encode-byte += "perl-module-warnings"
+RDEPENDS_perl-module-encode-byte += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-carp"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-exporter"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-strict"
+RDEPENDS_perl-module-encode-cjkconstants += "perl-module-warnings"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-encode"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-parent"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-strict"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-utf8"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-vars"
+RDEPENDS_perl-module-encode-cn-hz += "perl-module-warnings"
+RDEPENDS_perl-module-encode-cn += "perl-module-encode"
+RDEPENDS_perl-module-encode-cn += "perl-module-encode-cn-hz"
+RDEPENDS_perl-module-encode-cn += "perl-module-strict"
+RDEPENDS_perl-module-encode-cn += "perl-module-warnings"
+RDEPENDS_perl-module-encode-cn += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-config += "perl-module-strict"
+RDEPENDS_perl-module-encode-config += "perl-module-warnings"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-encode"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-strict"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-warnings"
+RDEPENDS_perl-module-encode-ebcdic += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-encoder += "perl-module-carp"
+RDEPENDS_perl-module-encode-encoder += "perl-module-constant"
+RDEPENDS_perl-module-encode-encoder += "perl-module-encode"
+RDEPENDS_perl-module-encode-encoder += "perl-module-exporter"
+RDEPENDS_perl-module-encode-encoder += "perl-module-overload"
+RDEPENDS_perl-module-encode-encoder += "perl-module-strict"
+RDEPENDS_perl-module-encode-encoder += "perl-module-warnings"
+RDEPENDS_perl-module-encode-encoding += "perl-module-carp"
+RDEPENDS_perl-module-encode-encoding += "perl-module-constant"
+RDEPENDS_perl-module-encode-encoding += "perl-module-encode"
+RDEPENDS_perl-module-encode-encoding += "perl-module-encode-mime-name"
+RDEPENDS_perl-module-encode-encoding += "perl-module-strict"
+RDEPENDS_perl-module-encode-encoding += "perl-module-warnings"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-carp"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-encode"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-parent"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-strict"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-utf8"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-vars"
+RDEPENDS_perl-module-encode-gsm0338 += "perl-module-warnings"
+RDEPENDS_perl-module-encode-guess += "perl-module-bytes"
+RDEPENDS_perl-module-encode-guess += "perl-module-carp"
+RDEPENDS_perl-module-encode-guess += "perl-module-constant"
+RDEPENDS_perl-module-encode-guess += "perl-module-encode"
+RDEPENDS_perl-module-encode-guess += "perl-module-encode-unicode"
+RDEPENDS_perl-module-encode-guess += "perl-module-parent"
+RDEPENDS_perl-module-encode-guess += "perl-module-strict"
+RDEPENDS_perl-module-encode-guess += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-strict"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-vars"
+RDEPENDS_perl-module-encode-jp-h2z += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-bytes"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-encode"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-encode-jp-h2z"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-parent"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-strict"
+RDEPENDS_perl-module-encode-jp-jis7 += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp += "perl-module-encode"
+RDEPENDS_perl-module-encode-jp += "perl-module-encode-jp-jis7"
+RDEPENDS_perl-module-encode-jp += "perl-module-strict"
+RDEPENDS_perl-module-encode-jp += "perl-module-warnings"
+RDEPENDS_perl-module-encode-jp += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-encode"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-parent"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-strict"
+RDEPENDS_perl-module-encode-kr-2022-kr += "perl-module-warnings"
+RDEPENDS_perl-module-encode-kr += "perl-module-encode"
+RDEPENDS_perl-module-encode-kr += "perl-module-encode-kr-2022-kr"
+RDEPENDS_perl-module-encode-kr += "perl-module-strict"
+RDEPENDS_perl-module-encode-kr += "perl-module-warnings"
+RDEPENDS_perl-module-encode-kr += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-constant"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-encode-cjkconstants"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-parent"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-strict"
+RDEPENDS_perl-module-encode-mime-header-iso-2022-jp += "perl-module-warnings"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-carp"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-encode"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-mime-base64"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-parent"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-strict"
+RDEPENDS_perl-module-encode-mime-header += "perl-module-warnings"
+RDEPENDS_perl-module-encode-mime-name += "perl-module-strict"
+RDEPENDS_perl-module-encode-mime-name += "perl-module-warnings"
+RDEPENDS_perl-module-encode += "perl-module-bytes"
+RDEPENDS_perl-module-encode += "perl-module-carp"
+RDEPENDS_perl-module-encode += "perl-module-constant"
+RDEPENDS_perl-module-encode += "perl-module-encode-alias"
+RDEPENDS_perl-module-encode += "perl-module-encode-config"
+RDEPENDS_perl-module-encode += "perl-module-encode-configlocal-pm"
+RDEPENDS_perl-module-encode += "perl-module-encode-mime-name"
+RDEPENDS_perl-module-encode += "perl-module-exporter"
+RDEPENDS_perl-module-encode += "perl-module-parent"
+RDEPENDS_perl-module-encode += "perl-module-storable"
+RDEPENDS_perl-module-encode += "perl-module-strict"
+RDEPENDS_perl-module-encode += "perl-module-warnings"
+RDEPENDS_perl-module-encode += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-symbol += "perl-module-encode"
+RDEPENDS_perl-module-encode-symbol += "perl-module-strict"
+RDEPENDS_perl-module-encode-symbol += "perl-module-warnings"
+RDEPENDS_perl-module-encode-symbol += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-tw += "perl-module-encode"
+RDEPENDS_perl-module-encode-tw += "perl-module-strict"
+RDEPENDS_perl-module-encode-tw += "perl-module-warnings"
+RDEPENDS_perl-module-encode-tw += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-unicode += "perl-module-encode"
+RDEPENDS_perl-module-encode-unicode += "perl-module-parent"
+RDEPENDS_perl-module-encode-unicode += "perl-module-strict"
+RDEPENDS_perl-module-encode-unicode += "perl-module-warnings"
+RDEPENDS_perl-module-encode-unicode += "perl-module-xsloader"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-encode"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-mime-base64"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-parent"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-re"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-strict"
+RDEPENDS_perl-module-encode-unicode-utf7 += "perl-module-warnings"
+RDEPENDS_perl-module-encoding += "perl-module-carp"
+RDEPENDS_perl-module-encoding += "perl-module-config"
+RDEPENDS_perl-module-encoding += "perl-module-constant"
+RDEPENDS_perl-module-encoding += "perl-module-encode"
+RDEPENDS_perl-module-encoding += "perl-module-filter-util-call"
+RDEPENDS_perl-module-encoding += "perl-module-i18n-langinfo"
+RDEPENDS_perl-module-encoding += "perl-module-posix"
+RDEPENDS_perl-module-encoding += "perl-module-strict"
+RDEPENDS_perl-module-encoding += "perl-module-utf8"
+RDEPENDS_perl-module-encoding += "perl-module-warnings"
+RDEPENDS_perl-module-encoding-warnings += "perl-module-carp"
+RDEPENDS_perl-module-encoding-warnings += "perl-module-strict"
+RDEPENDS_perl-module-encoding-warnings += "perl-module-warnings"
+RDEPENDS_perl-module-english += "perl-module-carp "
+RDEPENDS_perl-module-english += "perl-module-exporter"
+RDEPENDS_perl-module-env += "perl-module-config"
+RDEPENDS_perl-module-env += "perl-module-tie-array"
+RDEPENDS_perl-module-errno += "perl-module-carp"
+RDEPENDS_perl-module-errno += "perl-module-exporter"
+RDEPENDS_perl-module-errno += "perl-module-strict"
+RDEPENDS_perl-module-experimental += "perl-module-carp"
+RDEPENDS_perl-module-experimental += "perl-module-strict"
+RDEPENDS_perl-module-experimental += "perl-module-version"
+RDEPENDS_perl-module-experimental += "perl-module-warnings"
+RDEPENDS_perl-module-exporter-heavy += "perl-module-carp"
+RDEPENDS_perl-module-exporter-heavy += "perl-module-exporter"
+RDEPENDS_perl-module-exporter-heavy += "perl-module-strict"
+RDEPENDS_perl-module-exporter += "perl-module-exporter-heavy"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-config"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-dynaloader"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-extutils-mksymlists"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-file-temp"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-ipc-cmd"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-text-parsewords"
+RDEPENDS_perl-module-extutils-cbuilder-base += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-aix += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-config"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-android += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-cygwin += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-darwin += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-darwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-darwin += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-dec-osf += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-os2 += "perl-module-extutils-cbuilder-platform-unix"
+RDEPENDS_perl-module-extutils-cbuilder-platform-os2 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-os2 += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-unix += "perl-module-extutils-cbuilder-base"
+RDEPENDS_perl-module-extutils-cbuilder-platform-unix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-unix += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-config"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-extutils-cbuilder-base"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-file-spec-functions"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-vms += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-bcc += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-bcc += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-gcc += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-gcc += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-msvc += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows-msvc += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-extutils-cbuilder-base"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-io-file"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-strict"
+RDEPENDS_perl-module-extutils-cbuilder-platform-windows += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-extutils-command"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-extutils-install"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-getopt-long"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-strict"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-test-harness"
+RDEPENDS_perl-module-extutils-command-mm += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-command += "perl-module-carp"
+RDEPENDS_perl-module-extutils-command += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-copy"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-command += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-command += "perl-module-strict"
+RDEPENDS_perl-module-extutils-command += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-carp"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-constant"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-text-wrap"
+RDEPENDS_perl-module-extutils-constant-base += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant += "perl-module-carp"
+RDEPENDS_perl-module-extutils-constant += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-constant += "perl-module-extutils-constant-proxysubs"
+RDEPENDS_perl-module-extutils-constant += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant += "perl-module-extutils-constant-xs"
+RDEPENDS_perl-module-extutils-constant += "perl-module-filehandle"
+RDEPENDS_perl-module-extutils-constant += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-carp"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-extutils-constant-xs"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-proxysubs += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-carp"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-constant"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-posix"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-utils += "perl-module-vars"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-carp"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-data-dumper"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-extutils-constant"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-extutils-constant-base"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-extutils-constant-utils"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-strict"
+RDEPENDS_perl-module-extutils-constant-xs += "perl-module-vars"
+RDEPENDS_perl-module-extutils-embed += "perl-module-config"
+RDEPENDS_perl-module-extutils-embed += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-embed += "perl-module-extutils-liblist"
+RDEPENDS_perl-module-extutils-embed += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-embed += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-embed += "perl-module-getopt-std"
+RDEPENDS_perl-module-extutils-embed += "perl-module-strict"
+RDEPENDS_perl-module-extutils-installed += "perl-module-carp"
+RDEPENDS_perl-module-extutils-installed += "perl-module-config"
+RDEPENDS_perl-module-extutils-installed += "perl-module-data-dumper"
+RDEPENDS_perl-module-extutils-installed += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-installed += "perl-module-extutils-packlist"
+RDEPENDS_perl-module-extutils-installed += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-installed += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-installed += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-installed += "perl-module-strict"
+RDEPENDS_perl-module-extutils-installed += "perl-module-vars"
+RDEPENDS_perl-module-extutils-install += "perl-module-autosplit"
+RDEPENDS_perl-module-extutils-install += "perl-module-carp"
+RDEPENDS_perl-module-extutils-install += "perl-module-config"
+RDEPENDS_perl-module-extutils-install += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-install += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-install += "perl-module-extutils-packlist"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-compare"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-copy"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-install += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-install += "perl-module-strict"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-strict"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-text-parsewords"
+RDEPENDS_perl-module-extutils-liblist-kid += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-liblist += "perl-module-extutils-liblist-kid"
+RDEPENDS_perl-module-extutils-liblist += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-liblist += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker-config += "perl-module-config"
+RDEPENDS_perl-module-extutils-makemaker-config += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-base"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-encode"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-encode-alias"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-encode-hanextra"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-i18n-langinfo"
+RDEPENDS_perl-module-extutils-makemaker-locale += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-b"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-carp"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-cpan"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-makemaker-version"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-manifest"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-mm"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-extutils-my"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker += "perl-module-version"
+RDEPENDS_perl-module-extutils-makemaker-version += "perl-module-extutils-makemaker-version-regex"
+RDEPENDS_perl-module-extutils-makemaker-version += "perl-module-strict"
+RDEPENDS_perl-module-extutils-makemaker-version += "perl-module-vars"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-carp"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-config"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-copy"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-path"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-strict"
+RDEPENDS_perl-module-extutils-manifest += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-miniperl += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-miniperl += "perl-module-extutils-embed"
+RDEPENDS_perl-module-extutils-miniperl += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-config"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-dynaloader"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-mkbootstrap += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-carp"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-config"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-mksymlists += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-aix += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-aix += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-aix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-autosplit"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-carp"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-cpan"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-data-dumper"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-any += "perl-module-version"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-mm-beos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-extutils-mm-win32"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-mm-cygwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-darwin += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-darwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-dos += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-dos += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-dos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-macos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-extutils-mm-win32"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-nw5 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-mm-os2 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm += "perl-module-extutils-liblist"
+RDEPENDS_perl-module-extutils-mm += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-qnx += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-qnx += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-carp"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-encode"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-liblist"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-vars"
+RDEPENDS_perl-module-extutils-mm-unix += "perl-module-version"
+RDEPENDS_perl-module-extutils-mm-uwin += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-uwin += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-liblist-kid"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-file-find"
+RDEPENDS_perl-module-extutils-mm-vms += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-vos += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-vos += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-mm-any"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-extutils-mm-unix"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-mm-win32 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-mm-win95 += "perl-module-extutils-makemaker-config"
+RDEPENDS_perl-module-extutils-mm-win95 += "perl-module-extutils-mm-win32"
+RDEPENDS_perl-module-extutils-mm-win95 += "perl-module-strict"
+RDEPENDS_perl-module-extutils-my += "perl-module-extutils-mm"
+RDEPENDS_perl-module-extutils-my += "perl-module-strict"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-carp"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-config"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-strict"
+RDEPENDS_perl-module-extutils-packlist += "perl-module-vars"
+RDEPENDS_perl-module-extutils-parsexs-constants += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-constants += "perl-module-symbol"
+RDEPENDS_perl-module-extutils-parsexs-constants += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-parsexs-countlines += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-eval += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-eval += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-config"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-constants"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-countlines"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-eval"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-extutils-parsexs-utilities"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-file-basename"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-re"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs += "perl-module-symbol"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-extutils-parsexs-constants"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-extutils-typemaps"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-strict"
+RDEPENDS_perl-module-extutils-parsexs-utilities += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-cwd"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-file-spec"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-lib"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-strict"
+RDEPENDS_perl-module-extutils-testlib += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-exporter"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-extutils-typemaps"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-cmd += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-inputmap += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-inputmap += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-outputmap += "perl-module-re"
+RDEPENDS_perl-module-extutils-typemaps-outputmap += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-outputmap += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-parsexs"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-parsexs-constants"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-typemaps-inputmap"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-typemaps-outputmap"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-extutils-typemaps-type"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps += "perl-module-warnings"
+RDEPENDS_perl-module-extutils-typemaps-type += "perl-module-extutils-typemaps"
+RDEPENDS_perl-module-extutils-typemaps-type += "perl-module-strict"
+RDEPENDS_perl-module-extutils-typemaps-type += "perl-module-warnings"
+RDEPENDS_perl-module-fatal += "perl-module-autodie"
+RDEPENDS_perl-module-fatal += "perl-module-autodie-exception-system"
+RDEPENDS_perl-module-fatal += "perl-module-autodie-hints"
+RDEPENDS_perl-module-fatal += "perl-module-autodie-util"
+RDEPENDS_perl-module-fatal += "perl-module-carp"
+RDEPENDS_perl-module-fatal += "perl-module-config"
+RDEPENDS_perl-module-fatal += "perl-module-constant"
+RDEPENDS_perl-module-fatal += "perl-module-fcntl"
+RDEPENDS_perl-module-fatal += "perl-module-posix"
+RDEPENDS_perl-module-fatal += "perl-module-scalar-util"
+RDEPENDS_perl-module-fatal += "perl-module-strict"
+RDEPENDS_perl-module-fatal += "perl-module-tie-refhash"
+RDEPENDS_perl-module-fatal += "perl-module-warnings"
+RDEPENDS_perl-module-fcntl += "perl-module-exporter"
+RDEPENDS_perl-module-fcntl += "perl-module-strict"
+RDEPENDS_perl-module-fcntl += "perl-module-xsloader"
+RDEPENDS_perl-module-feature += "perl-module-carp"
+RDEPENDS_perl-module-fields += "perl-module-base"
+RDEPENDS_perl-module-fields += "perl-module-carp"
+RDEPENDS_perl-module-fields += "perl-module-hash-util"
+RDEPENDS_perl-module-fields += "perl-module-strict"
+RDEPENDS_perl-module-file-basename += "perl-module-carp"
+RDEPENDS_perl-module-file-basename += "perl-module-exporter"
+RDEPENDS_perl-module-file-basename += "perl-module-re"
+RDEPENDS_perl-module-file-basename += "perl-module-strict"
+RDEPENDS_perl-module-file-basename += "perl-module-warnings"
+RDEPENDS_perl-module-filecache += "perl-module-carp"
+RDEPENDS_perl-module-filecache += "perl-module-parent"
+RDEPENDS_perl-module-filecache += "perl-module-strict"
+RDEPENDS_perl-module-file-compare += "perl-module-carp"
+RDEPENDS_perl-module-file-compare += "perl-module-exporter"
+RDEPENDS_perl-module-file-compare += "perl-module-strict"
+RDEPENDS_perl-module-file-compare += "perl-module-warnings"
+RDEPENDS_perl-module-file-copy += "perl-module-carp"
+RDEPENDS_perl-module-file-copy += "perl-module-config"
+RDEPENDS_perl-module-file-copy += "perl-module-exporter"
+RDEPENDS_perl-module-file-copy += "perl-module-file-basename"
+RDEPENDS_perl-module-file-copy += "perl-module-file-spec"
+RDEPENDS_perl-module-file-copy += "perl-module-strict"
+RDEPENDS_perl-module-file-copy += "perl-module-warnings"
+RDEPENDS_perl-module-file-dosglob += "perl-module-strict"
+RDEPENDS_perl-module-file-dosglob += "perl-module-text-parsewords"
+RDEPENDS_perl-module-file-dosglob += "perl-module-warnings"
+RDEPENDS_perl-module-file-dosglob += "perl-module-xsloader"
+RDEPENDS_perl-module-file-fetch += "perl-module-carp"
+RDEPENDS_perl-module-file-fetch += "perl-module-constant"
+RDEPENDS_perl-module-file-fetch += "perl-module-cwd"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-basename"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-copy"
+RDEPENDS_perl-module-file-fetch += "perl-module-filehandle"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-path"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-spec"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-fetch += "perl-module-file-temp"
+RDEPENDS_perl-module-file-fetch += "perl-module-ipc-cmd"
+RDEPENDS_perl-module-file-fetch += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-file-fetch += "perl-module-load"
+RDEPENDS_perl-module-file-fetch += "perl-module-params-check"
+RDEPENDS_perl-module-file-fetch += "perl-module-strict"
+RDEPENDS_perl-module-file-fetch += "perl-module-vars"
+RDEPENDS_perl-module-file-find += "perl-module-config"
+RDEPENDS_perl-module-file-find += "perl-module-cwd"
+RDEPENDS_perl-module-file-find += "perl-module-exporter"
+RDEPENDS_perl-module-file-find += "perl-module-file-basename"
+RDEPENDS_perl-module-file-find += "perl-module-file-spec"
+RDEPENDS_perl-module-file-find += "perl-module-strict"
+RDEPENDS_perl-module-file-find += "perl-module-warnings"
+RDEPENDS_perl-module-file-find += "perl-module-warnings-register"
+RDEPENDS_perl-module-file-globmapper += "perl-module-carp"
+RDEPENDS_perl-module-file-globmapper += "perl-module-file-glob"
+RDEPENDS_perl-module-file-globmapper += "perl-module-strict"
+RDEPENDS_perl-module-file-globmapper += "perl-module-warnings"
+RDEPENDS_perl-module-file-glob += "perl-module-exporter"
+RDEPENDS_perl-module-file-glob += "perl-module-strict"
+RDEPENDS_perl-module-file-glob += "perl-module-warnings"
+RDEPENDS_perl-module-file-glob += "perl-module-xsloader"
+RDEPENDS_perl-module-filehandle += "perl-module-exporter"
+RDEPENDS_perl-module-filehandle += "perl-module-fcntl"
+RDEPENDS_perl-module-filehandle += "perl-module-io-file"
+RDEPENDS_perl-module-filehandle += "perl-module-strict"
+RDEPENDS_perl-module-file-path += "perl-module-carp"
+RDEPENDS_perl-module-file-path += "perl-module-cwd"
+RDEPENDS_perl-module-file-path += "perl-module-exporter"
+RDEPENDS_perl-module-file-path += "perl-module-file-basename"
+RDEPENDS_perl-module-file-path += "perl-module-file-spec"
+RDEPENDS_perl-module-file-path += "perl-module-strict"
+RDEPENDS_perl-module-file-path += "perl-module-vars"
+RDEPENDS_perl-module-file-spec-amigaos += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-amigaos += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-cygwin += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-cygwin += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-cygwin += "perl-module-win32api-file"
+RDEPENDS_perl-module-file-spec-epoc += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-epoc += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-functions += "perl-module-exporter"
+RDEPENDS_perl-module-file-spec-functions += "perl-module-file-spec"
+RDEPENDS_perl-module-file-spec-functions += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-functions += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-mac += "perl-module-cwd"
+RDEPENDS_perl-module-file-spec-mac += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-mac += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-os2 += "perl-module-cwd"
+RDEPENDS_perl-module-file-spec-os2 += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-os2 += "perl-module-strict"
+RDEPENDS_perl-module-file-spec += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-unix += "perl-module-constant"
+RDEPENDS_perl-module-file-spec-unix += "perl-module-cwd"
+RDEPENDS_perl-module-file-spec-unix += "perl-module-scalar-util"
+RDEPENDS_perl-module-file-spec-unix += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-vms += "perl-module-cwd"
+RDEPENDS_perl-module-file-spec-vms += "perl-module-file-basename"
+RDEPENDS_perl-module-file-spec-vms += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-vms += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-win32 += "perl-module-cwd"
+RDEPENDS_perl-module-file-spec-win32 += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-file-spec-win32 += "perl-module-strict"
+RDEPENDS_perl-module-file-spec-win32 += "perl-module-win32api-file"
+RDEPENDS_perl-module-file-stat += "perl-module-carp"
+RDEPENDS_perl-module-file-stat += "perl-module-class-struct"
+RDEPENDS_perl-module-file-stat += "perl-module-constant"
+RDEPENDS_perl-module-file-stat += "perl-module-exporter"
+RDEPENDS_perl-module-file-stat += "perl-module-fcntl"
+RDEPENDS_perl-module-file-stat += "perl-module-overload "
+RDEPENDS_perl-module-file-stat += "perl-module-strict"
+RDEPENDS_perl-module-file-stat += "perl-module-symbol"
+RDEPENDS_perl-module-file-stat += "perl-module-warnings"
+RDEPENDS_perl-module-file-stat += "perl-module-warnings-register"
+RDEPENDS_perl-module-file-temp += "perl-module-carp"
+RDEPENDS_perl-module-file-temp += "perl-module-constant"
+RDEPENDS_perl-module-file-temp += "perl-module-cwd"
+RDEPENDS_perl-module-file-temp += "perl-module-errno"
+RDEPENDS_perl-module-file-temp += "perl-module-exporter"
+RDEPENDS_perl-module-file-temp += "perl-module-fcntl"
+RDEPENDS_perl-module-file-temp += "perl-module-file-path"
+RDEPENDS_perl-module-file-temp += "perl-module-file-spec"
+RDEPENDS_perl-module-file-temp += "perl-module-io-seekable"
+RDEPENDS_perl-module-file-temp += "perl-module-overload"
+RDEPENDS_perl-module-file-temp += "perl-module-parent"
+RDEPENDS_perl-module-file-temp += "perl-module-posix"
+RDEPENDS_perl-module-file-temp += "perl-module-scalar-util"
+RDEPENDS_perl-module-file-temp += "perl-module-strict"
+RDEPENDS_perl-module-file-temp += "perl-module-symbol"
+RDEPENDS_perl-module-file-temp += "perl-module-vars"
+RDEPENDS_perl-module-filter-simple += "perl-module-carp"
+RDEPENDS_perl-module-filter-simple += "perl-module-filter-util-call"
+RDEPENDS_perl-module-filter-simple += "perl-module-text-balanced"
+RDEPENDS_perl-module-filter-util-call += "perl-module-carp"
+RDEPENDS_perl-module-filter-util-call += "perl-module-exporter"
+RDEPENDS_perl-module-filter-util-call += "perl-module-strict"
+RDEPENDS_perl-module-filter-util-call += "perl-module-warnings"
+RDEPENDS_perl-module-filter-util-call += "perl-module-xsloader"
+RDEPENDS_perl-module-findbin += "perl-module-carp"
+RDEPENDS_perl-module-findbin += "perl-module-cwd"
+RDEPENDS_perl-module-findbin += "perl-module-exporter"
+RDEPENDS_perl-module-findbin += "perl-module-file-basename"
+RDEPENDS_perl-module-findbin += "perl-module-file-spec"
+RDEPENDS_perl-module-getopt-long += "perl-module-constant"
+RDEPENDS_perl-module-getopt-long += "perl-module-exporter"
+RDEPENDS_perl-module-getopt-long += "perl-module-overload"
+RDEPENDS_perl-module-getopt-long += "perl-module-pod-usage"
+RDEPENDS_perl-module-getopt-long += "perl-module-strict"
+RDEPENDS_perl-module-getopt-long += "perl-module-text-parsewords"
+RDEPENDS_perl-module-getopt-long += "perl-module-vars"
+RDEPENDS_perl-module-getopt-long += "perl-module-warnings"
+RDEPENDS_perl-module-getopt-std += "perl-module-exporter"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-exporter"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-scalar-util"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-strict"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-warnings"
+RDEPENDS_perl-module-hash-util-fieldhash += "perl-module-xsloader"
+RDEPENDS_perl-module-hash-util += "perl-module-carp"
+RDEPENDS_perl-module-hash-util += "perl-module-exporter"
+RDEPENDS_perl-module-hash-util += "perl-module-hash-util-fieldhash"
+RDEPENDS_perl-module-hash-util += "perl-module-scalar-util"
+RDEPENDS_perl-module-hash-util += "perl-module-strict"
+RDEPENDS_perl-module-hash-util += "perl-module-warnings"
+RDEPENDS_perl-module-hash-util += "perl-module-warnings-register"
+RDEPENDS_perl-module-hash-util += "perl-module-xsloader"
+RDEPENDS_perl-module-i18n-collate += "perl-module-exporter"
+RDEPENDS_perl-module-i18n-collate += "perl-module-overload"
+RDEPENDS_perl-module-i18n-collate += "perl-module-posix"
+RDEPENDS_perl-module-i18n-collate += "perl-module-strict"
+RDEPENDS_perl-module-i18n-collate += "perl-module-warnings-register"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-carp"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-exporter"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-strict"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-warnings"
+RDEPENDS_perl-module-i18n-langinfo += "perl-module-xsloader"
+RDEPENDS_perl-module-i18n-langtags-detect += "perl-module-i18n-langtags"
+RDEPENDS_perl-module-i18n-langtags-detect += "perl-module-strict"
+RDEPENDS_perl-module-i18n-langtags-list += "perl-module-strict"
+RDEPENDS_perl-module-i18n-langtags += "perl-module-exporter"
+RDEPENDS_perl-module-i18n-langtags += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-compress-raw-bzip2"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-bzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-deflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-adapter-identity += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-carp"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-encode"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-file-globmapper"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-scalar-util"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-strict"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-utf8"
+RDEPENDS_perl-module-io-compress-base-common += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-base += "perl-module-carp) "
+RDEPENDS_perl-module-io-compress-base += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-base += "perl-module-io-file"
+RDEPENDS_perl-module-io-compress-base += "perl-module-io-handle "
+RDEPENDS_perl-module-io-compress-base += "perl-module-scalar-util"
+RDEPENDS_perl-module-io-compress-base += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-base += "perl-module-symbol)"
+RDEPENDS_perl-module-io-compress-base += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-io-compress-adapter-bzip2"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-io-compress-base"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-bzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-rawdeflate"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-io-compress-zlib-constants"
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-deflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-gzip-constants += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-rawdeflate"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-gzip += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-fcntl"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-io-compress-base"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-rawdeflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zip-constants += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-config"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-exporter "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-fcntl"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-file-spec)"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-adapter-deflate"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-adapter-identity"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-bzip2 "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-lzma "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-rawdeflate"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-zip-constants"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-compress-zip += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zip += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-constant"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-exporter"
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zlib-constants += "perl-module-warnings"
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-bytes"
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-strict "
+RDEPENDS_perl-module-io-compress-zlib-extra += "perl-module-warnings"
+RDEPENDS_perl-module-io-dir += "perl-module-carp"
+RDEPENDS_perl-module-io-dir += "perl-module-exporter"
+RDEPENDS_perl-module-io-dir += "perl-module-file-spec"
+RDEPENDS_perl-module-io-dir += "perl-module-file-stat"
+RDEPENDS_perl-module-io-dir += "perl-module-io-file"
+RDEPENDS_perl-module-io-dir += "perl-module-strict"
+RDEPENDS_perl-module-io-dir += "perl-module-symbol"
+RDEPENDS_perl-module-io-dir += "perl-module-tie-hash"
+RDEPENDS_perl-module-io-file += "perl-module-carp"
+RDEPENDS_perl-module-io-file += "perl-module-exporter"
+RDEPENDS_perl-module-io-file += "perl-module-fcntl"
+RDEPENDS_perl-module-io-file += "perl-module-io-seekable"
+RDEPENDS_perl-module-io-file += "perl-module-selectsaver"
+RDEPENDS_perl-module-io-file += "perl-module-strict"
+RDEPENDS_perl-module-io-file += "perl-module-symbol"
+RDEPENDS_perl-module-io-handle += "perl-module-carp"
+RDEPENDS_perl-module-io-handle += "perl-module-exporter"
+RDEPENDS_perl-module-io-handle += "perl-module-io"
+RDEPENDS_perl-module-io-handle += "perl-module-io-file"
+RDEPENDS_perl-module-io-handle += "perl-module-selectsaver"
+RDEPENDS_perl-module-io-handle += "perl-module-strict"
+RDEPENDS_perl-module-io-handle += "perl-module-symbol"
+RDEPENDS_perl-module-io += "perl-module-carp"
+RDEPENDS_perl-module-io += "perl-module-strict"
+RDEPENDS_perl-module-io += "perl-module-warnings"
+RDEPENDS_perl-module-io += "perl-module-xsloader"
+RDEPENDS_perl-module-io-pipe += "perl-module-carp"
+RDEPENDS_perl-module-io-pipe += "perl-module-fcntl"
+RDEPENDS_perl-module-io-pipe += "perl-module-io-handle"
+RDEPENDS_perl-module-io-pipe += "perl-module-strict"
+RDEPENDS_perl-module-io-pipe += "perl-module-symbol"
+RDEPENDS_perl-module-io-poll += "perl-module-exporter"
+RDEPENDS_perl-module-io-poll += "perl-module-io-handle"
+RDEPENDS_perl-module-io-poll += "perl-module-strict"
+RDEPENDS_perl-module-io-seekable += "perl-module-carp"
+RDEPENDS_perl-module-io-seekable += "perl-module-exporter"
+RDEPENDS_perl-module-io-seekable += "perl-module-fcntl"
+RDEPENDS_perl-module-io-seekable += "perl-module-io-handle"
+RDEPENDS_perl-module-io-seekable += "perl-module-strict"
+RDEPENDS_perl-module-io-select += "perl-module-exporter"
+RDEPENDS_perl-module-io-select += "perl-module-strict"
+RDEPENDS_perl-module-io-select += "perl-module-warnings-register"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-carp"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-errno"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-exporter"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-io-socket"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-socket"
+RDEPENDS_perl-module-io-socket-inet += "perl-module-strict"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-base"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-carp"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-constant"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-errno"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-posix"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-socket"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-strict"
+RDEPENDS_perl-module-io-socket-ip += "perl-module-warnings"
+RDEPENDS_perl-module-io-socket += "perl-module-carp"
+RDEPENDS_perl-module-io-socket += "perl-module-errno"
+RDEPENDS_perl-module-io-socket += "perl-module-exporter"
+RDEPENDS_perl-module-io-socket += "perl-module-io-handle"
+RDEPENDS_perl-module-io-socket += "perl-module-io-select"
+RDEPENDS_perl-module-io-socket += "perl-module-io-socket-inet"
+RDEPENDS_perl-module-io-socket += "perl-module-io-socket-unix"
+RDEPENDS_perl-module-io-socket += "perl-module-socket"
+RDEPENDS_perl-module-io-socket += "perl-module-strict"
+RDEPENDS_perl-module-io-socket-unix += "perl-module-carp"
+RDEPENDS_perl-module-io-socket-unix += "perl-module-io-socket"
+RDEPENDS_perl-module-io-socket-unix += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-compress-raw-bzip2"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-bunzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-io-compress-zip-constants "
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-identity += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-adapter-inflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-adapter-inflate"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-gunzip"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-inflate"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-io-uncompress-unzip"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-anyinflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-strict"
+RDEPENDS_perl-module-io-uncompress-anyuncompress += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-carp "
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-constant"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-io-file "
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-list-util"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-scalar-util"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-symbol"
+RDEPENDS_perl-module-io-uncompress-base += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-io-uncompress-adapter-bunzip2"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-bunzip2 += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-compress-gzip-constants"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-gunzip += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-io-compress-zlib-constants"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-inflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-io-uncompress-adapter-inflate"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-io-uncompress-base"
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-rawinflate += "perl-module-warnings"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-bytes"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-compress-raw-zlib"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-constant"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-exporter "
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-fcntl"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-compress-base-common"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-compress-zip-constants"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-compress-zlib-extra"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-file"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-uncompress-adapter-identity"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-uncompress-adapter-inflate"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-io-uncompress-rawinflate"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-posix"
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-strict "
+RDEPENDS_perl-module-io-uncompress-unzip += "perl-module-warnings"
+RDEPENDS_perl-module-io-zlib += "perl-module-carp"
+RDEPENDS_perl-module-io-zlib += "perl-module-fcntl"
+RDEPENDS_perl-module-io-zlib += "perl-module-io-handle"
+RDEPENDS_perl-module-io-zlib += "perl-module-strict"
+RDEPENDS_perl-module-io-zlib += "perl-module-symbol"
+RDEPENDS_perl-module-io-zlib += "perl-module-tie-handle"
+RDEPENDS_perl-module-io-zlib += "perl-module-vars"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-carp"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-constant"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-extutils-makemaker"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-filehandle"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-file-spec"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-io-handle"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-io-select"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-ipc-open3"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-load"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-params-check"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-posix"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-socket"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-strict"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-symbol"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-text-parsewords"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-time-hires"
+RDEPENDS_perl-module-ipc-cmd += "perl-module-vars"
+RDEPENDS_perl-module-ipc-msg += "perl-module-carp"
+RDEPENDS_perl-module-ipc-msg += "perl-module-class-struct"
+RDEPENDS_perl-module-ipc-msg += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-ipc-msg += "perl-module-strict"
+RDEPENDS_perl-module-ipc-msg += "perl-module-vars"
+RDEPENDS_perl-module-ipc-open2 += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-open2 += "perl-module-ipc-open3"
+RDEPENDS_perl-module-ipc-open2 += "perl-module-strict"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-carp"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-constant"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-fcntl"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-io-pipe"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-posix"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-strict"
+RDEPENDS_perl-module-ipc-open3 += "perl-module-symbol"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-carp"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-class-struct"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-strict"
+RDEPENDS_perl-module-ipc-semaphore += "perl-module-vars"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-carp"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-class-struct"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-strict"
+RDEPENDS_perl-module-ipc-sharedmem += "perl-module-vars"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-carp"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-config"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-dynaloader"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-exporter"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-strict"
+RDEPENDS_perl-module-ipc-sysv += "perl-module-vars"
+RDEPENDS_perl-module-json-pp-boolean += "perl-module-overload"
+RDEPENDS_perl-module-json-pp-boolean += "perl-module-strict"
+RDEPENDS_perl-module-json-pp += "perl-module-b"
+RDEPENDS_perl-module-json-pp += "perl-module-bytes"
+RDEPENDS_perl-module-json-pp += "perl-module-carp"
+RDEPENDS_perl-module-json-pp += "perl-module-constant"
+RDEPENDS_perl-module-json-pp += "perl-module-encode"
+RDEPENDS_perl-module-json-pp += "perl-module-exporter"
+RDEPENDS_perl-module-json-pp += "perl-module-json-pp-boolean"
+RDEPENDS_perl-module-json-pp += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-json-pp += "perl-module-math-bigint"
+RDEPENDS_perl-module-json-pp += "perl-module-overload"
+RDEPENDS_perl-module-json-pp += "perl-module-strict"
+RDEPENDS_perl-module-json-pp += "perl-module-subs"
+RDEPENDS_perl-module-less += "perl-module-strict"
+RDEPENDS_perl-module-less += "perl-module-warnings"
+RDEPENDS_perl-module-lib += "perl-module-carp"
+RDEPENDS_perl-module-lib += "perl-module-config"
+RDEPENDS_perl-module-lib += "perl-module-strict"
+RDEPENDS_perl-module-list-util += "perl-module-exporter"
+RDEPENDS_perl-module-list-util += "perl-module-strict"
+RDEPENDS_perl-module-list-util += "perl-module-warnings"
+RDEPENDS_perl-module-list-util += "perl-module-xsloader"
+RDEPENDS_perl-module-list-util-xs += "perl-module-list-util"
+RDEPENDS_perl-module-list-util-xs += "perl-module-strict"
+RDEPENDS_perl-module-list-util-xs += "perl-module-warnings"
+RDEPENDS_perl-module-loaded += "perl-module-carp"
+RDEPENDS_perl-module-loaded += "perl-module-strict"
+RDEPENDS_perl-module-loaded += "perl-module-vars"
+RDEPENDS_perl-module-load += "perl-module-carp"
+RDEPENDS_perl-module-load += "perl-module-config"
+RDEPENDS_perl-module-load += "perl-module-constant"
+RDEPENDS_perl-module-load += "perl-module-exporter"
+RDEPENDS_perl-module-load += "perl-module-filehandle"
+RDEPENDS_perl-module-load += "perl-module-file-spec"
+RDEPENDS_perl-module-load += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-load += "perl-module-corelist"
+RDEPENDS_perl-module-load += "perl-module-load"
+RDEPENDS_perl-module-load += "perl-module-params-check"
+RDEPENDS_perl-module-load += "perl-module-strict"
+RDEPENDS_perl-module-load += "perl-module-vars"
+RDEPENDS_perl-module-load += "perl-module-version"
+RDEPENDS_perl-module-load += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-constant"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-constants += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-country-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-country-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-country-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-country += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-country-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-country-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-country-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-currency-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-currency-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-currency-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-currency += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-currency-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-currency-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-currency-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langext-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langext-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langext-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langext += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langext-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langext-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langext-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langfam-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langfam-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langfam-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langfam += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langfam-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langfam-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-language-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-language-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-language-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-language += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-language-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-language-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-language-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langvar-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langvar-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langvar-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langvar += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-langvar-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-langvar-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-langvar-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes += "perl-module-carp"
+RDEPENDS_perl-module-locale-codes += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes += "perl-module-if"
+RDEPENDS_perl-module-locale-codes += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-script-codes += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-script-codes += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-script-codes += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-exporter"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-if"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-script += "perl-module-warnings"
+RDEPENDS_perl-module-locale-codes-script-retired += "perl-module-strict"
+RDEPENDS_perl-module-locale-codes-script-retired += "perl-module-utf8"
+RDEPENDS_perl-module-locale-codes-script-retired += "perl-module-warnings"
+RDEPENDS_perl-module-locale-country += "perl-module-exporter"
+RDEPENDS_perl-module-locale-country += "perl-module-if"
+RDEPENDS_perl-module-locale-country += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-country += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-country += "perl-module-strict"
+RDEPENDS_perl-module-locale-country += "perl-module-warnings"
+RDEPENDS_perl-module-locale-currency += "perl-module-exporter"
+RDEPENDS_perl-module-locale-currency += "perl-module-if"
+RDEPENDS_perl-module-locale-currency += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-currency += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-currency += "perl-module-strict"
+RDEPENDS_perl-module-locale-currency += "perl-module-warnings"
+RDEPENDS_perl-module-locale-language += "perl-module-exporter"
+RDEPENDS_perl-module-locale-language += "perl-module-if"
+RDEPENDS_perl-module-locale-language += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-language += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-language += "perl-module-strict"
+RDEPENDS_perl-module-locale-language += "perl-module-warnings"
+RDEPENDS_perl-module-locale-maketext-gutsloader += "perl-module-locale-maketext"
+RDEPENDS_perl-module-locale-maketext-guts += "perl-module-locale-maketext"
+RDEPENDS_perl-module-locale-maketext += "perl-module-carp"
+RDEPENDS_perl-module-locale-maketext += "perl-module-i18n-langtags"
+RDEPENDS_perl-module-locale-maketext += "perl-module-i18n-langtags-detect"
+RDEPENDS_perl-module-locale-maketext += "perl-module-integer"
+RDEPENDS_perl-module-locale-maketext += "perl-module-strict"
+RDEPENDS_perl-module-locale-maketext-simple += "perl-module-base"
+RDEPENDS_perl-module-locale-maketext-simple += "perl-module-locale-maketext-lexicon"
+RDEPENDS_perl-module-locale-maketext-simple += "perl-module-strict"
+RDEPENDS_perl-module-locale += "perl-module-carp"
+RDEPENDS_perl-module-locale += "perl-module-config"
+RDEPENDS_perl-module-locale-script += "perl-module-exporter"
+RDEPENDS_perl-module-locale-script += "perl-module-if"
+RDEPENDS_perl-module-locale-script += "perl-module-locale-codes"
+RDEPENDS_perl-module-locale-script += "perl-module-locale-codes-constants"
+RDEPENDS_perl-module-locale-script += "perl-module-strict"
+RDEPENDS_perl-module-locale-script += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-carp"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-math-bigint"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-math-complex"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-overload"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-strict"
+RDEPENDS_perl-module-math-bigfloat += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-overload"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-strict"
+RDEPENDS_perl-module-math-bigfloat-trace += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-calcemu += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-calcemu += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-carp"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-constant"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-integer"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-math-bigint-lib"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-calc += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-math-bigint-calc"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-fastcalc += "perl-module-xsloader"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-carp"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-overload"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-scalar-util"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-lib += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint += "perl-module-carp"
+RDEPENDS_perl-module-math-bigint += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigint += "perl-module-file-spec"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-complex"
+RDEPENDS_perl-module-math-bigint += "perl-module-overload"
+RDEPENDS_perl-module-math-bigint += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-exporter"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-math-bigint"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-overload"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-strict"
+RDEPENDS_perl-module-math-bigint-trace += "perl-module-warnings"
+RDEPENDS_perl-module-math-bigrat += "perl-module-carp"
+RDEPENDS_perl-module-math-bigrat += "perl-module-math-bigfloat"
+RDEPENDS_perl-module-math-bigrat += "perl-module-math-bigint"
+RDEPENDS_perl-module-math-bigrat += "perl-module-overload"
+RDEPENDS_perl-module-math-bigrat += "perl-module-strict"
+RDEPENDS_perl-module-math-bigrat += "perl-module-warnings"
+RDEPENDS_perl-module-math-complex += "perl-module-config"
+RDEPENDS_perl-module-math-complex += "perl-module-exporter"
+RDEPENDS_perl-module-math-complex += "perl-module-overload"
+RDEPENDS_perl-module-math-complex += "perl-module-scalar-util"
+RDEPENDS_perl-module-math-complex += "perl-module-strict"
+RDEPENDS_perl-module-math-complex += "perl-module-warnings"
+RDEPENDS_perl-module-math-trig += "perl-module-exporter"
+RDEPENDS_perl-module-math-trig += "perl-module-math-complex"
+RDEPENDS_perl-module-math-trig += "perl-module-strict"
+RDEPENDS_perl-module-memoize-anydbm-file += "perl-module-vars"
+RDEPENDS_perl-module-memoize-expirefile += "perl-module-carp"
+RDEPENDS_perl-module-memoize-expire += "perl-module-carp"
+RDEPENDS_perl-module-memoize += "perl-module-carp"
+RDEPENDS_perl-module-memoize += "perl-module-config"
+RDEPENDS_perl-module-memoize += "perl-module-exporter"
+RDEPENDS_perl-module-memoize += "perl-module-strict"
+RDEPENDS_perl-module-memoize += "perl-module-vars"
+RDEPENDS_perl-module-memoize-sdbm-file += "perl-module-sdbm-file"
+RDEPENDS_perl-module-memoize-storable += "perl-module-carp"
+RDEPENDS_perl-module-memoize-storable += "perl-module-storable"
+RDEPENDS_perl-module-meta-notation += "perl-module-strict"
+RDEPENDS_perl-module-meta-notation += "perl-module-warnings"
+RDEPENDS_perl-module-mime-base64 += "perl-module-exporter"
+RDEPENDS_perl-module-mime-base64 += "perl-module-strict"
+RDEPENDS_perl-module-mime-base64 += "perl-module-vars"
+RDEPENDS_perl-module-mime-base64 += "perl-module-xsloader"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-exporter"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-mime-base64"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-strict"
+RDEPENDS_perl-module-mime-quotedprint += "perl-module-vars"
+RDEPENDS_perl-module-mro += "perl-module-strict"
+RDEPENDS_perl-module-mro += "perl-module-warnings"
+RDEPENDS_perl-module-mro += "perl-module-xsloader"
+RDEPENDS_perl-module-net-cmd += "perl-module-carp"
+RDEPENDS_perl-module-net-cmd += "perl-module-constant"
+RDEPENDS_perl-module-net-cmd += "perl-module-errno"
+RDEPENDS_perl-module-net-cmd += "perl-module-exporter"
+RDEPENDS_perl-module-net-cmd += "perl-module-strict"
+RDEPENDS_perl-module-net-cmd += "perl-module-symbol"
+RDEPENDS_perl-module-net-cmd += "perl-module-warnings"
+RDEPENDS_perl-module-net-config += "perl-module-exporter"
+RDEPENDS_perl-module-net-config += "perl-module-net-localcfg"
+RDEPENDS_perl-module-net-config += "perl-module-socket"
+RDEPENDS_perl-module-net-config += "perl-module-strict"
+RDEPENDS_perl-module-net-config += "perl-module-warnings"
+RDEPENDS_perl-module-net-domain += "perl-module-carp"
+RDEPENDS_perl-module-net-domain += "perl-module-exporter"
+RDEPENDS_perl-module-net-domain += "perl-module-net-config"
+RDEPENDS_perl-module-net-domain += "perl-module-posix"
+RDEPENDS_perl-module-net-domain += "perl-module-socket"
+RDEPENDS_perl-module-net-domain += "perl-module-strict"
+RDEPENDS_perl-module-net-domain += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-carp"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-net-ftp-dataconn"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-a += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-carp"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-errno"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-dataconn += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-e += "perl-module-net-ftp-i"
+RDEPENDS_perl-module-net-ftp-e += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-e += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-carp"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-net-ftp-dataconn"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-i += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp-l += "perl-module-net-ftp-i"
+RDEPENDS_perl-module-net-ftp-l += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp-l += "perl-module-warnings"
+RDEPENDS_perl-module-net-ftp += "perl-module-carp"
+RDEPENDS_perl-module-net-ftp += "perl-module-constant"
+RDEPENDS_perl-module-net-ftp += "perl-module-fcntl"
+RDEPENDS_perl-module-net-ftp += "perl-module-file-basename"
+RDEPENDS_perl-module-net-ftp += "perl-module-io-socket"
+RDEPENDS_perl-module-net-ftp += "perl-module-io-socket-inet6"
+RDEPENDS_perl-module-net-ftp += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-ftp += "perl-module-io-socket-ssl"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-config"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-ftp-a"
+RDEPENDS_perl-module-net-ftp += "perl-module-net-netrc"
+RDEPENDS_perl-module-net-ftp += "perl-module-socket"
+RDEPENDS_perl-module-net-ftp += "perl-module-strict"
+RDEPENDS_perl-module-net-ftp += "perl-module-time-local"
+RDEPENDS_perl-module-net-ftp += "perl-module-warnings"
+RDEPENDS_perl-module-net-hostent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-hostent += "perl-module-exporter"
+RDEPENDS_perl-module-net-hostent += "perl-module-socket"
+RDEPENDS_perl-module-net-hostent += "perl-module-strict"
+RDEPENDS_perl-module-net-netent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-netent += "perl-module-exporter"
+RDEPENDS_perl-module-net-netent += "perl-module-socket"
+RDEPENDS_perl-module-net-netent += "perl-module-strict"
+RDEPENDS_perl-module-net-netrc += "perl-module-carp"
+RDEPENDS_perl-module-net-netrc += "perl-module-filehandle"
+RDEPENDS_perl-module-net-netrc += "perl-module-strict"
+RDEPENDS_perl-module-net-netrc += "perl-module-warnings"
+RDEPENDS_perl-module-net-nntp += "perl-module-carp"
+RDEPENDS_perl-module-net-nntp += "perl-module-io-socket"
+RDEPENDS_perl-module-net-nntp += "perl-module-io-socket-inet6"
+RDEPENDS_perl-module-net-nntp += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-nntp += "perl-module-io-socket-ssl"
+RDEPENDS_perl-module-net-nntp += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-nntp += "perl-module-net-config"
+RDEPENDS_perl-module-net-nntp += "perl-module-strict"
+RDEPENDS_perl-module-net-nntp += "perl-module-time-local"
+RDEPENDS_perl-module-net-nntp += "perl-module-warnings"
+RDEPENDS_perl-module-net-ping += "perl-module-carp"
+RDEPENDS_perl-module-net-ping += "perl-module-constant"
+RDEPENDS_perl-module-net-ping += "perl-module-exporter"
+RDEPENDS_perl-module-net-ping += "perl-module-fcntl"
+RDEPENDS_perl-module-net-ping += "perl-module-filehandle"
+RDEPENDS_perl-module-net-ping += "perl-module-io-socket-inet"
+RDEPENDS_perl-module-net-ping += "perl-module-net-ping-external"
+RDEPENDS_perl-module-net-ping += "perl-module-posix"
+RDEPENDS_perl-module-net-ping += "perl-module-socket"
+RDEPENDS_perl-module-net-ping += "perl-module-strict"
+RDEPENDS_perl-module-net-ping += "perl-module-time-hires"
+RDEPENDS_perl-module-net-pop3 += "perl-module-carp"
+RDEPENDS_perl-module-net-pop3 += "perl-module-io-socket"
+RDEPENDS_perl-module-net-pop3 += "perl-module-io-socket-inet6"
+RDEPENDS_perl-module-net-pop3 += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-pop3 += "perl-module-io-socket-ssl"
+RDEPENDS_perl-module-net-pop3 += "perl-module-mime-base64"
+RDEPENDS_perl-module-net-pop3 += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-pop3 += "perl-module-net-config"
+RDEPENDS_perl-module-net-pop3 += "perl-module-net-netrc"
+RDEPENDS_perl-module-net-pop3 += "perl-module-strict"
+RDEPENDS_perl-module-net-pop3 += "perl-module-warnings"
+RDEPENDS_perl-module-net-protoent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-protoent += "perl-module-exporter"
+RDEPENDS_perl-module-net-protoent += "perl-module-strict"
+RDEPENDS_perl-module-net-servent += "perl-module-class-struct"
+RDEPENDS_perl-module-net-servent += "perl-module-exporter"
+RDEPENDS_perl-module-net-servent += "perl-module-strict"
+RDEPENDS_perl-module-net-smtp += "perl-module-carp"
+RDEPENDS_perl-module-net-smtp += "perl-module-io-socket"
+RDEPENDS_perl-module-net-smtp += "perl-module-io-socket-inet6"
+RDEPENDS_perl-module-net-smtp += "perl-module-io-socket-ip"
+RDEPENDS_perl-module-net-smtp += "perl-module-io-socket-ssl"
+RDEPENDS_perl-module-net-smtp += "perl-module-mime-base64"
+RDEPENDS_perl-module-net-smtp += "perl-module-net-cmd"
+RDEPENDS_perl-module-net-smtp += "perl-module-net-config"
+RDEPENDS_perl-module-net-smtp += "perl-module-socket"
+RDEPENDS_perl-module-net-smtp += "perl-module-strict"
+RDEPENDS_perl-module-net-smtp += "perl-module-warnings"
+RDEPENDS_perl-module-net-time += "perl-module-carp"
+RDEPENDS_perl-module-net-time += "perl-module-exporter"
+RDEPENDS_perl-module-net-time += "perl-module-io-select"
+RDEPENDS_perl-module-net-time += "perl-module-io-socket"
+RDEPENDS_perl-module-net-time += "perl-module-net-config"
+RDEPENDS_perl-module-net-time += "perl-module-strict"
+RDEPENDS_perl-module-net-time += "perl-module-warnings"
+RDEPENDS_perl-module-next += "perl-module-carp"
+RDEPENDS_perl-module-next += "perl-module-overload"
+RDEPENDS_perl-module-next += "perl-module-strict"
+RDEPENDS_perl-module-next += "perl-module-warnings"
+RDEPENDS_perl-module-ok += "perl-module-strict"
+RDEPENDS_perl-module-ok += "perl-module-test-more"
+RDEPENDS_perl-module-opcode += "perl-module-carp"
+RDEPENDS_perl-module-opcode += "perl-module-exporter"
+RDEPENDS_perl-module-opcode += "perl-module-strict"
+RDEPENDS_perl-module-opcode += "perl-module-subs"
+RDEPENDS_perl-module-opcode += "perl-module-xsloader"
+RDEPENDS_perl-module-open += "perl-module-carp"
+RDEPENDS_perl-module-open += "perl-module-encode"
+RDEPENDS_perl-module-open += "perl-module-encoding"
+RDEPENDS_perl-module-open += "perl-module-warnings"
+RDEPENDS_perl-module-o += "perl-module-b"
+RDEPENDS_perl-module-o += "perl-module-carp"
+RDEPENDS_perl-module-ops += "perl-module-opcode"
+RDEPENDS_perl-module-overloading += "perl-module-overload-numbers"
+RDEPENDS_perl-module-overloading += "perl-module-warnings"
+RDEPENDS_perl-module-overload += "perl-module-mro"
+RDEPENDS_perl-module-overload += "perl-module-scalar-util"
+RDEPENDS_perl-module-overload += "perl-module-warnings-register"
+RDEPENDS_perl-module-params-check += "perl-module-carp"
+RDEPENDS_perl-module-params-check += "perl-module-exporter"
+RDEPENDS_perl-module-params-check += "perl-module-locale-maketext-simple"
+RDEPENDS_perl-module-params-check += "perl-module-strict"
+RDEPENDS_perl-module-params-check += "perl-module-vars"
+RDEPENDS_perl-module-parent += "perl-module-strict"
+RDEPENDS_perl-module-parent += "perl-module-vars"
+RDEPENDS_perl-module-perlfaq += "perl-module-strict"
+RDEPENDS_perl-module-perlfaq += "perl-module-warnings"
+RDEPENDS_perl-module-perlio-encoding += "perl-module-strict"
+RDEPENDS_perl-module-perlio-encoding += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-mmap += "perl-module-strict"
+RDEPENDS_perl-module-perlio-mmap += "perl-module-warnings"
+RDEPENDS_perl-module-perlio-mmap += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-scalar += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-via += "perl-module-xsloader"
+RDEPENDS_perl-module-perlio-via-quotedprint += "perl-module-mime-quotedprint"
+RDEPENDS_perl-module-perlio-via-quotedprint += "perl-module-strict"
+RDEPENDS_perl-module-pod-checker += "perl-module-base"
+RDEPENDS_perl-module-pod-checker += "perl-module-carp"
+RDEPENDS_perl-module-pod-checker += "perl-module-exporter"
+RDEPENDS_perl-module-pod-checker += "perl-module-strict"
+RDEPENDS_perl-module-pod-checker += "perl-module-warnings"
+RDEPENDS_perl-module-pod-escapes += "perl-module-exporter"
+RDEPENDS_perl-module-pod-escapes += "perl-module-strict"
+RDEPENDS_perl-module-pod-escapes += "perl-module-vars"
+RDEPENDS_perl-module-pod-escapes += "perl-module-warnings"
+RDEPENDS_perl-module-pod-find += "perl-module-carp"
+RDEPENDS_perl-module-pod-find += "perl-module-config"
+RDEPENDS_perl-module-pod-find += "perl-module-cwd"
+RDEPENDS_perl-module-pod-find += "perl-module-exporter"
+RDEPENDS_perl-module-pod-find += "perl-module-file-find"
+RDEPENDS_perl-module-pod-find += "perl-module-file-spec"
+RDEPENDS_perl-module-pod-find += "perl-module-strict"
+RDEPENDS_perl-module-pod-find += "perl-module-symbol"
+RDEPENDS_perl-module-pod-find += "perl-module-vars"
+RDEPENDS_perl-module-pod-functions += "perl-module-exporter"
+RDEPENDS_perl-module-pod-functions += "perl-module-strict"
+RDEPENDS_perl-module-pod-inputobjects += "perl-module-strict"
+RDEPENDS_perl-module-pod-inputobjects += "perl-module-vars"
+RDEPENDS_perl-module-pod-man += "perl-module-carp"
+RDEPENDS_perl-module-pod-man += "perl-module-file-basename"
+RDEPENDS_perl-module-pod-man += "perl-module-file-spec"
+RDEPENDS_perl-module-pod-man += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-man += "perl-module-strict"
+RDEPENDS_perl-module-pod-man += "perl-module-subs"
+RDEPENDS_perl-module-pod-man += "perl-module-vars"
+RDEPENDS_perl-module-pod-man += "perl-module-warnings"
+RDEPENDS_perl-module-pod-parselink += "perl-module-exporter"
+RDEPENDS_perl-module-pod-parselink += "perl-module-strict"
+RDEPENDS_perl-module-pod-parselink += "perl-module-vars"
+RDEPENDS_perl-module-pod-parselink += "perl-module-warnings"
+RDEPENDS_perl-module-pod-parser += "perl-module-carp"
+RDEPENDS_perl-module-pod-parser += "perl-module-exporter"
+RDEPENDS_perl-module-pod-parser += "perl-module-pod-inputobjects"
+RDEPENDS_perl-module-pod-parser += "perl-module-strict"
+RDEPENDS_perl-module-pod-parser += "perl-module-symbol"
+RDEPENDS_perl-module-pod-parser += "perl-module-vars"
+RDEPENDS_perl-module-pod-parseutils += "perl-module-carp"
+RDEPENDS_perl-module-pod-parseutils += "perl-module-strict"
+RDEPENDS_perl-module-pod-parseutils += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-carp"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-config"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-file-spec-functions"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-baseto += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-getoptsoo += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-getoptsoo += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-carp"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-config"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-encode"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-fcntl"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-file-basename"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-file-spec-functions"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-file-temp"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-pod-perldoc-getoptsoo"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-text-parsewords"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-pod-text-color"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toansi += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-pod-checker"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-tochecker += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-encode"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-file-spec-functions"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-io-handle"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-io-select"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-ipc-open3"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-pod-man"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-pod-perldoc-topod"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-symbol"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toman += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-pod-man"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-tonroff += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-topod += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-tortf += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-pod-text-termcap"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toterm += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-totext += "perl-module-warnings"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-parent"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-strict"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-vars"
+RDEPENDS_perl-module-pod-perldoc-toxml += "perl-module-warnings"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-carp"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-pod-select"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-strict"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-symbol"
+RDEPENDS_perl-module-pod-plaintext += "perl-module-vars"
+RDEPENDS_perl-module-pod-select += "perl-module-carp"
+RDEPENDS_perl-module-pod-select += "perl-module-pod-parser"
+RDEPENDS_perl-module-pod-select += "perl-module-strict"
+RDEPENDS_perl-module-pod-select += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-integer"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-pod-simple-transcode"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-blackbox += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-pod-simple-methody"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-text-wrap"
+RDEPENDS_perl-module-pod-simple-checker += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-debug += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-dumpastext += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-dumpastext += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-dumpastext += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-dumpasxml += "perl-module-text-wrap"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-overload"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-pod-simple-blackbox"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-linksection += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-methody += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-methody += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-methody += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple += "perl-module-integer"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-escapes"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-simple-blackbox"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-simple-linksection"
+RDEPENDS_perl-module-pod-simple += "perl-module-pod-simple-tiedoutfh"
+RDEPENDS_perl-module-pod-simple += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple += "perl-module-symbol"
+RDEPENDS_perl-module-pod-simple += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-progress += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserendtoken += "perl-module-pod-simple-pullparsertoken"
+RDEPENDS_perl-module-pod-simple-pullparserendtoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserendtoken += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparserendtoken"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparserstarttoken"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-pod-simple-pullparsertexttoken"
+RDEPENDS_perl-module-pod-simple-pullparser += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-pod-simple-pullparsertoken"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparserstarttoken += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-pullparsertexttoken += "perl-module-pod-simple-pullparsertoken"
+RDEPENDS_perl-module-pod-simple-pullparsertexttoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-pullparsertexttoken += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-pullparsertoken += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-integer"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-pod-simple-pullparser"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-rtf += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-config"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-cwd"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-file-basename"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-file-spec"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-search += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-simpletree += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-textcontent += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-pod-simple-methody"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-text-wrap"
+RDEPENDS_perl-module-pod-simple-text += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-symbol"
+RDEPENDS_perl-module-pod-simple-tiedoutfh += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-transcodedumb += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcodedumb += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-transcode += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcode += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-encode"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-transcodesmart += "perl-module-vars"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-carp"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-strict"
+RDEPENDS_perl-module-pod-simple-xmloutstream += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-color += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-text-color += "perl-module-strict"
+RDEPENDS_perl-module-pod-text-color += "perl-module-term-ansicolor"
+RDEPENDS_perl-module-pod-text-color += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-color += "perl-module-warnings"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-strict"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-overstrike += "perl-module-warnings"
+RDEPENDS_perl-module-pod-text += "perl-module-carp"
+RDEPENDS_perl-module-pod-text += "perl-module-encode"
+RDEPENDS_perl-module-pod-text += "perl-module-exporter"
+RDEPENDS_perl-module-pod-text += "perl-module-pod-simple"
+RDEPENDS_perl-module-pod-text += "perl-module-strict"
+RDEPENDS_perl-module-pod-text += "perl-module-vars"
+RDEPENDS_perl-module-pod-text += "perl-module-warnings"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-pod-text"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-posix"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-strict"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-term-cap"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-vars"
+RDEPENDS_perl-module-pod-text-termcap += "perl-module-warnings"
+RDEPENDS_perl-module-pod-usage += "perl-module-carp"
+RDEPENDS_perl-module-pod-usage += "perl-module-config"
+RDEPENDS_perl-module-pod-usage += "perl-module-exporter"
+RDEPENDS_perl-module-pod-usage += "perl-module-file-spec"
+RDEPENDS_perl-module-pod-usage += "perl-module-strict"
+RDEPENDS_perl-module-pod-usage += "perl-module-vars"
+RDEPENDS_perl-module-posix += "perl-module-exporter"
+RDEPENDS_perl-module-posix += "perl-module-fcntl"
+RDEPENDS_perl-module-posix += "perl-module-strict"
+RDEPENDS_perl-module-posix += "perl-module-tie-hash"
+RDEPENDS_perl-module-posix += "perl-module-warnings"
+RDEPENDS_perl-module-posix += "perl-module-xsloader"
+RDEPENDS_perl-module-re += "perl-module-carp"
+RDEPENDS_perl-module-re += "perl-module-exporter"
+RDEPENDS_perl-module-re += "perl-module-strict"
+RDEPENDS_perl-module-re += "perl-module-term-cap"
+RDEPENDS_perl-module-re += "perl-module-warnings"
+RDEPENDS_perl-module-re += "perl-module-xsloader"
+RDEPENDS_perl-module-safe += "perl-module-b"
+RDEPENDS_perl-module-safe += "perl-module-carp"
+RDEPENDS_perl-module-safe += "perl-module-carp-heavy"
+RDEPENDS_perl-module-safe += "perl-module-opcode"
+RDEPENDS_perl-module-safe += "perl-module-scalar-util"
+RDEPENDS_perl-module-safe += "perl-module-strict"
+RDEPENDS_perl-module-safe += "perl-module-utf8"
+RDEPENDS_perl-module-scalar-util += "perl-module-carp"
+RDEPENDS_perl-module-scalar-util += "perl-module-exporter"
+RDEPENDS_perl-module-scalar-util += "perl-module-list-util"
+RDEPENDS_perl-module-scalar-util += "perl-module-strict"
+RDEPENDS_perl-module-scalar-util += "perl-module-warnings"
+RDEPENDS_perl-module-sdbm-file += "perl-module-exporter"
+RDEPENDS_perl-module-sdbm-file += "perl-module-strict"
+RDEPENDS_perl-module-sdbm-file += "perl-module-tie-hash"
+RDEPENDS_perl-module-sdbm-file += "perl-module-warnings"
+RDEPENDS_perl-module-sdbm-file += "perl-module-xsloader"
+RDEPENDS_perl-module-search-dict += "perl-module-exporter"
+RDEPENDS_perl-module-search-dict += "perl-module-feature"
+RDEPENDS_perl-module-search-dict += "perl-module-strict"
+RDEPENDS_perl-module-selectsaver += "perl-module-carp"
+RDEPENDS_perl-module-selectsaver += "perl-module-symbol"
+RDEPENDS_perl-module-selfloader += "perl-module-exporter"
+RDEPENDS_perl-module-selfloader += "perl-module-io-handle"
+RDEPENDS_perl-module-selfloader += "perl-module-strict"
+RDEPENDS_perl-module-sigtrap += "perl-module-carp"
+RDEPENDS_perl-module-sigtrap += "perl-module-meta-notation.pm"
+RDEPENDS_perl-module-sigtrap += "perl-module-symbol"
+RDEPENDS_perl-module-socket += "perl-module-carp"
+RDEPENDS_perl-module-socket += "perl-module-exporter"
+RDEPENDS_perl-module-socket += "perl-module-scalar-util"
+RDEPENDS_perl-module-socket += "perl-module-strict"
+RDEPENDS_perl-module-socket += "perl-module-warnings-register"
+RDEPENDS_perl-module-socket += "perl-module-xsloader"
+RDEPENDS_perl-module-sort += "perl-module-carp"
+RDEPENDS_perl-module-sort += "perl-module-strict"
+RDEPENDS_perl-module-storable += "perl-module-carp"
+RDEPENDS_perl-module-storable += "perl-module-exporter"
+RDEPENDS_perl-module-storable += "perl-module-io-file"
+RDEPENDS_perl-module-storable += "perl-module-xsloader"
+RDEPENDS_perl-module-sub-util += "perl-module-exporter"
+RDEPENDS_perl-module-sub-util += "perl-module-list-util"
+RDEPENDS_perl-module-sub-util += "perl-module-strict"
+RDEPENDS_perl-module-sub-util += "perl-module-warnings"
+RDEPENDS_perl-module-symbol += "perl-module-exporter"
+RDEPENDS_perl-module-sys-hostname += "perl-module-carp"
+RDEPENDS_perl-module-sys-hostname += "perl-module-exporter"
+RDEPENDS_perl-module-sys-hostname += "perl-module-posix"
+RDEPENDS_perl-module-sys-hostname += "perl-module-strict"
+RDEPENDS_perl-module-sys-hostname += "perl-module-warnings"
+RDEPENDS_perl-module-sys-hostname += "perl-module-xsloader"
+RDEPENDS_perl-module-sys-syslog += "perl-module-carp"
+RDEPENDS_perl-module-sys-syslog += "perl-module-config"
+RDEPENDS_perl-module-sys-syslog += "perl-module-constant"
+RDEPENDS_perl-module-sys-syslog += "perl-module-dynaloader"
+RDEPENDS_perl-module-sys-syslog += "perl-module-exporter"
+RDEPENDS_perl-module-sys-syslog += "perl-module-fcntl"
+RDEPENDS_perl-module-sys-syslog += "perl-module-file-basename"
+RDEPENDS_perl-module-sys-syslog += "perl-module-posix"
+RDEPENDS_perl-module-sys-syslog += "perl-module-socket"
+RDEPENDS_perl-module-sys-syslog += "perl-module-strict"
+RDEPENDS_perl-module-sys-syslog += "perl-module-sys-hostname"
+RDEPENDS_perl-module-sys-syslog += "perl-module-vars"
+RDEPENDS_perl-module-sys-syslog += "perl-module-warnings"
+RDEPENDS_perl-module-sys-syslog += "perl-module-warnings-register"
+RDEPENDS_perl-module-sys-syslog += "perl-module-xsloader"
+RDEPENDS_perl-module-tap-base += "perl-module-base"
+RDEPENDS_perl-module-tap-base += "perl-module-constant"
+RDEPENDS_perl-module-tap-base += "perl-module-strict"
+RDEPENDS_perl-module-tap-base += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-posix"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-tap-formatter-color"
+RDEPENDS_perl-module-tap-formatter-base += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-constant"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-color += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-carp"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-constant"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-file-path"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-file-spec"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-console-parallelsession += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-posix"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-console += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-console-session += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-posix"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-tap-formatter-file-session"
+RDEPENDS_perl-module-tap-formatter-file += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-file-session += "perl-module-warnings"
+RDEPENDS_perl-module-tap-formatter-session += "perl-module-base"
+RDEPENDS_perl-module-tap-formatter-session += "perl-module-strict"
+RDEPENDS_perl-module-tap-formatter-session += "perl-module-warnings"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-constant"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-strict"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-tap-object"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-text-parsewords"
+RDEPENDS_perl-module-tap-harness-env += "perl-module-warnings"
+RDEPENDS_perl-module-tap-harness += "perl-module-base"
+RDEPENDS_perl-module-tap-harness += "perl-module-carp"
+RDEPENDS_perl-module-tap-harness += "perl-module-file-path"
+RDEPENDS_perl-module-tap-harness += "perl-module-file-spec"
+RDEPENDS_perl-module-tap-harness += "perl-module-io-handle"
+RDEPENDS_perl-module-tap-harness += "perl-module-strict"
+RDEPENDS_perl-module-tap-harness += "perl-module-warnings"
+RDEPENDS_perl-module-tap-object += "perl-module-carp"
+RDEPENDS_perl-module-tap-object += "perl-module-strict"
+RDEPENDS_perl-module-tap-object += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-benchmark"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-aggregator += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-parser-resultfactory"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-tap-parser-yamlish-reader"
+RDEPENDS_perl-module-tap-parser-grammar += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-array += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-file-basename"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iteratorfactory += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-config"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-io-handle"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-process += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-iterator-stream += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-io-select"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-multiplexer += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser += "perl-module-base"
+RDEPENDS_perl-module-tap-parser += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-grammar"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-iterator"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-result"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-resultfactory"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-source"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-executable"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-file"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-handle"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-perl"
+RDEPENDS_perl-module-tap-parser += "perl-module-tap-parser-sourcehandler-rawtap"
+RDEPENDS_perl-module-tap-parser += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-bailout += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-comment += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-bailout"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-comment"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-plan"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-pragma"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-test"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-unknown"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-version"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-tap-parser-result-yaml"
+RDEPENDS_perl-module-tap-parser-resultfactory += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-plan += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-pragma += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-test += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-unknown += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-version += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-result-yaml += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-scheduler-job += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-tap-parser-scheduler-job"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-tap-parser-scheduler-spinner"
+RDEPENDS_perl-module-tap-parser-scheduler += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-carp"
+RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-scheduler-spinner += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-executable += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-tap-parser-iterator-stream"
+RDEPENDS_perl-module-tap-parser-sourcehandler-file += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-tap-parser-iterator-stream"
+RDEPENDS_perl-module-tap-parser-sourcehandler-handle += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-tap-parser-iterator"
+RDEPENDS_perl-module-tap-parser-sourcehandler += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-config"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-tap-parser-iterator-process"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-text-parsewords"
+RDEPENDS_perl-module-tap-parser-sourcehandler-perl += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-iterator-array"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-tap-parser-iteratorfactory"
+RDEPENDS_perl-module-tap-parser-sourcehandler-rawtap += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-constant"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-file-basename"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-source += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-yamlish-reader += "perl-module-warnings"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-base"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-strict"
+RDEPENDS_perl-module-tap-parser-yamlish-writer += "perl-module-warnings"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-carp"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-exporter"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-strict"
+RDEPENDS_perl-module-term-ansicolor += "perl-module-warnings"
+RDEPENDS_perl-module-term-cap += "perl-module-carp"
+RDEPENDS_perl-module-term-cap += "perl-module-strict"
+RDEPENDS_perl-module-term-cap += "perl-module-vars"
+RDEPENDS_perl-module-term-complete += "perl-module-exporter"
+RDEPENDS_perl-module-term-complete += "perl-module-strict"
+RDEPENDS_perl-module-term-readline += "perl-module-strict"
+RDEPENDS_perl-module-term-readline += "perl-module-term-cap"
+RDEPENDS_perl-module-test2-api-breakage += "perl-module-strict"
+RDEPENDS_perl-module-test2-api-breakage += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-api-breakage += "perl-module-warnings"
+RDEPENDS_perl-module-test2-api-context += "perl-module-carp"
+RDEPENDS_perl-module-test2-api-context += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-api-context += "perl-module-strict"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-api)"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-eventfacet-trace)"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-util-externalmeta"
+RDEPENDS_perl-module-test2-api-context += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-api-context += "perl-module-warnings"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-carp"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-ipc-sysv"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-strict"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-test2-api-stack)"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-test2-eventfacet-trace)"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-api-instance += "perl-module-warnings"
+RDEPENDS_perl-module-test2-api += "perl-module-carp"
+RDEPENDS_perl-module-test2-api += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-api += "perl-module-strict"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-api-context"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-bail)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-diag)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-exception)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-eventfacet-trace)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-note)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-ok)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-plan)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-skip)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-subtest)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-event-waiting)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub-interceptor)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub-interceptor-terminator)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-hub-subtest)"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-api += "perl-module-test2-util-trace)"
+RDEPENDS_perl-module-test2-api += "perl-module-warnings"
+RDEPENDS_perl-module-test2-api-stack += "perl-module-carp"
+RDEPENDS_perl-module-test2-api-stack += "perl-module-strict"
+RDEPENDS_perl-module-test2-api-stack += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-api-stack += "perl-module-test2-hub)"
+RDEPENDS_perl-module-test2-api-stack += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-bail += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-bail += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-bail += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-diag += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-diag += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-diag += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-encoding += "perl-module-carp"
+RDEPENDS_perl-module-test2-event-encoding += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-encoding += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-encoding += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-exception += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-exception += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-exception += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-about += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-about += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-about += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-amnesty += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-amnesty += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-amnesty += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-assert += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-assert += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-assert += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-control += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-control += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-control += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-error += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-error += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-error += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-hub += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-hub += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-hub += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-info += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-info += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-info += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-meta += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-meta += "perl-module-vars"
+RDEPENDS_perl-module-test2-eventfacet-meta += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-parent += "perl-module-carp"
+RDEPENDS_perl-module-test2-eventfacet-parent += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-parent += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-parent += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-carp"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-plan += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-plan += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-plan += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-render += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-render += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-render += "perl-module-warnings"
+RDEPENDS_perl-module-test2-eventfacet-trace += "perl-module-carp"
+RDEPENDS_perl-module-test2-eventfacet-trace += "perl-module-strict"
+RDEPENDS_perl-module-test2-eventfacet-trace += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-eventfacet-trace += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-eventfacet-trace += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-fail += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-fail += "perl-module-test2-event"
+RDEPENDS_perl-module-test2-event-fail += "perl-module-test2-eventfacet-info"
+RDEPENDS_perl-module-test2-event-fail += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-fail += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-generic += "perl-module-carp"
+RDEPENDS_perl-module-test2-event-generic += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-event-generic += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-generic += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-generic += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-note += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-note += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-note += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-ok += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-ok += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-ok += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-pass += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-pass += "perl-module-test2-event"
+RDEPENDS_perl-module-test2-event-pass += "perl-module-test2-eventfacet-info"
+RDEPENDS_perl-module-test2-event-pass += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-pass += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event += "perl-module-carp"
+RDEPENDS_perl-module-test2-event += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-event += "perl-module-strict"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-about)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-amnesty)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-assert)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-control)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-error)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-hub)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-info)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-meta)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-parent)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-plan)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-eventfacet-trace)"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util-externalmeta"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event += "perl-module-test2-util-trace"
+RDEPENDS_perl-module-test2-event += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-plan += "perl-module-carp"
+RDEPENDS_perl-module-test2-event-plan += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-plan += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-plan += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-skip += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-skip += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-skip += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-subtest += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-subtest += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-subtest += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-tap-version += "perl-module-carp"
+RDEPENDS_perl-module-test2-event-tap-version += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-tap-version += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-tap-version += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-carp"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-test2-util-facets2legacy"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-v2 += "perl-module-warnings"
+RDEPENDS_perl-module-test2-event-waiting += "perl-module-strict"
+RDEPENDS_perl-module-test2-event-waiting += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-event-waiting += "perl-module-warnings"
+RDEPENDS_perl-module-test2-formatter += "perl-module-strict"
+RDEPENDS_perl-module-test2-formatter += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-formatter += "perl-module-warnings"
+RDEPENDS_perl-module-test2-formatter-tap += "perl-module-data-dumper"
+RDEPENDS_perl-module-test2-formatter-tap += "perl-module-strict"
+RDEPENDS_perl-module-test2-formatter-tap += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-formatter-tap += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-formatter-tap += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-formatter-tap += "perl-module-warnings"
+RDEPENDS_perl-module-test2-hub-interceptor += "perl-module-strict"
+RDEPENDS_perl-module-test2-hub-interceptor += "perl-module-test2-hub-interceptor-terminator)"
+RDEPENDS_perl-module-test2-hub-interceptor += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-hub-interceptor += "perl-module-warnings"
+RDEPENDS_perl-module-test2-hub-interceptor-terminator += "perl-module-strict"
+RDEPENDS_perl-module-test2-hub-interceptor-terminator += "perl-module-warnings"
+RDEPENDS_perl-module-test2-hub += "perl-module-carp"
+RDEPENDS_perl-module-test2-hub += "perl-module-list-util"
+RDEPENDS_perl-module-test2-hub += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-hub += "perl-module-strict"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-util-externalmeta"
+RDEPENDS_perl-module-test2-hub += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-hub += "perl-module-warnings"
+RDEPENDS_perl-module-test2-hub-subtest += "perl-module-strict"
+RDEPENDS_perl-module-test2-hub-subtest += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-hub-subtest += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-hub-subtest += "perl-module-warnings"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-file-spec)"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-file-temp)"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-posix)"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-storable)"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-strict"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-test2-event-waiting"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-ipc-driver-files += "perl-module-warnings"
+RDEPENDS_perl-module-test2-ipc-driver += "perl-module-carp"
+RDEPENDS_perl-module-test2-ipc-driver += "perl-module-strict"
+RDEPENDS_perl-module-test2-ipc-driver += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-ipc-driver += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test2-ipc-driver += "perl-module-warnings"
+RDEPENDS_perl-module-test2-ipc += "perl-module-carp"
+RDEPENDS_perl-module-test2-ipc += "perl-module-strict"
+RDEPENDS_perl-module-test2-ipc += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-ipc += "perl-module-test2-api-instance"
+RDEPENDS_perl-module-test2-ipc += "perl-module-test2-ipc-driver-files"
+RDEPENDS_perl-module-test2-ipc += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-ipc += "perl-module-warnings"
+RDEPENDS_perl-module-test2 += "perl-module-strict"
+RDEPENDS_perl-module-test2 += "perl-module-warnings"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-data-dumper"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-strict"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-test2-api"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-test2-hub-interceptor)"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-test2-hub-interceptor-terminator)"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-test2-util"
+RDEPENDS_perl-module-test2-tools-tiny += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util-externalmeta += "perl-module-carp"
+RDEPENDS_perl-module-test2-util-externalmeta += "perl-module-strict"
+RDEPENDS_perl-module-test2-util-externalmeta += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-base"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-carp"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-scalar-util"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-strict"
+RDEPENDS_perl-module-test2-util-facets2legacy += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-carp"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-strict"
+RDEPENDS_perl-module-test2-util-hashbase += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util += "perl-module-carp"
+RDEPENDS_perl-module-test2-util += "perl-module-config"
+RDEPENDS_perl-module-test2-util += "perl-module-posix)"
+RDEPENDS_perl-module-test2-util += "perl-module-strict"
+RDEPENDS_perl-module-test2-util += "perl-module-warnings"
+RDEPENDS_perl-module-test2-util-trace += "perl-module-test2-eventfacet-trace"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-test2-util-hashbase"
+RDEPENDS_perl-module-test-builder-formatter += "perl-module-warnings"
+RDEPENDS_perl-module-test-builder-module += "perl-module-exporter"
+RDEPENDS_perl-module-test-builder-module += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-module += "perl-module-test-builder"
+RDEPENDS_perl-module-test-builder += "perl-module-data-dumper"
+RDEPENDS_perl-module-test-builder += "perl-module-overload"
+RDEPENDS_perl-module-test-builder += "perl-module-scalar-util"
+RDEPENDS_perl-module-test-builder += "perl-module-strict"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-api"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-event-subtest"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-hub-subtest"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-ipc"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-ipc-driver-files"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-util"
+RDEPENDS_perl-module-test-builder += "perl-module-test-builder-formatter"
+RDEPENDS_perl-module-test-builder += "perl-module-test-builder-tododiag"
+RDEPENDS_perl-module-test-builder += "perl-module-warnings"
+RDEPENDS_perl-module-test-builder-tester-color += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-tester-color += "perl-module-test-builder-tester"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-carp"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-exporter"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-symbol"
+RDEPENDS_perl-module-test-builder-tester += "perl-module-test-builder"
+RDEPENDS_perl-module-test-builder-tododiag += "perl-module-strict"
+RDEPENDS_perl-module-test-builder-tododiag += "perl-module-warnings"
+RDEPENDS_perl-module-test-harness += "perl-module-base"
+RDEPENDS_perl-module-test-harness += "perl-module-config"
+RDEPENDS_perl-module-test-harness += "perl-module-constant"
+RDEPENDS_perl-module-test-harness += "perl-module-strict"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-harness"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-aggregator"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-source"
+RDEPENDS_perl-module-test-harness += "perl-module-tap-parser-sourcehandler-perl"
+RDEPENDS_perl-module-test-harness += "perl-module-text-parsewords"
+RDEPENDS_perl-module-test-harness += "perl-module-warnings"
+RDEPENDS_perl-module-test-more += "perl-module-scalar-util"
+RDEPENDS_perl-module-test-more += "perl-module-some-module"
+RDEPENDS_perl-module-test-more += "perl-module-strict"
+RDEPENDS_perl-module-test-more += "perl-module-test-builder-module"
+RDEPENDS_perl-module-test-more += "perl-module-warnings"
+RDEPENDS_perl-module-test += "perl-module-algorithm-diff"
+RDEPENDS_perl-module-test += "perl-module-carp"
+RDEPENDS_perl-module-test += "perl-module-exporter"
+RDEPENDS_perl-module-test += "perl-module-file-temp"
+RDEPENDS_perl-module-test += "perl-module-strict"
+RDEPENDS_perl-module-test-simple += "perl-module-strict"
+RDEPENDS_perl-module-test-simple += "perl-module-test-builder-module"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-config"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-strict"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-test-builder"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-threads-shared"
+RDEPENDS_perl-module-test-tester-capture += "perl-module-vars"
+RDEPENDS_perl-module-test-tester-capturerunner += "perl-module-exporter"
+RDEPENDS_perl-module-test-tester-capturerunner += "perl-module-strict"
+RDEPENDS_perl-module-test-tester-capturerunner += "perl-module-test-tester-capture"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-scalar-util)"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-strict"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-vars"
+RDEPENDS_perl-module-test-tester-delegate += "perl-module-warnings"
+RDEPENDS_perl-module-test-tester += "perl-module-exporter"
+RDEPENDS_perl-module-test-tester += "perl-module-strict"
+RDEPENDS_perl-module-test-tester += "perl-module-test-builder"
+RDEPENDS_perl-module-test-tester += "perl-module-test-tester-capturerunner"
+RDEPENDS_perl-module-test-tester += "perl-module-test-tester-delegate"
+RDEPENDS_perl-module-test-tester += "perl-module-vars"
+RDEPENDS_perl-module-text-abbrev += "perl-module-exporter"
+RDEPENDS_perl-module-text-balanced += "perl-module-carp"
+RDEPENDS_perl-module-text-balanced += "perl-module-exporter"
+RDEPENDS_perl-module-text-balanced += "perl-module-overload"
+RDEPENDS_perl-module-text-balanced += "perl-module-selfloader"
+RDEPENDS_perl-module-text-balanced += "perl-module-strict"
+RDEPENDS_perl-module-text-balanced += "perl-module-vars"
+RDEPENDS_perl-module-text-parsewords += "perl-module-carp"
+RDEPENDS_perl-module-text-parsewords += "perl-module-exporter"
+RDEPENDS_perl-module-text-parsewords += "perl-module-strict"
+RDEPENDS_perl-module-text-tabs += "perl-module-exporter"
+RDEPENDS_perl-module-text-tabs += "perl-module-strict"
+RDEPENDS_perl-module-text-tabs += "perl-module-vars"
+RDEPENDS_perl-module-text-wrap += "perl-module-exporter"
+RDEPENDS_perl-module-text-wrap += "perl-module-re"
+RDEPENDS_perl-module-text-wrap += "perl-module-strict"
+RDEPENDS_perl-module-text-wrap += "perl-module-text-tabs"
+RDEPENDS_perl-module-text-wrap += "perl-module-vars"
+RDEPENDS_perl-module-text-wrap += "perl-module-warnings-register"
+RDEPENDS_perl-module-thread += "perl-module-config"
+RDEPENDS_perl-module-thread += "perl-module-exporter"
+RDEPENDS_perl-module-thread += "perl-module-strict"
+RDEPENDS_perl-module-thread += "perl-module-threads"
+RDEPENDS_perl-module-thread += "perl-module-threads-shared"
+RDEPENDS_perl-module-thread += "perl-module-warnings"
+RDEPENDS_perl-module-thread-queue += "perl-module-carp"
+RDEPENDS_perl-module-thread-queue += "perl-module-scalar-util"
+RDEPENDS_perl-module-thread-queue += "perl-module-strict"
+RDEPENDS_perl-module-thread-queue += "perl-module-threads-shared"
+RDEPENDS_perl-module-thread-queue += "perl-module-warnings"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-carp"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-scalar-util"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-strict"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-threads-shared"
+RDEPENDS_perl-module-thread-semaphore += "perl-module-warnings"
+RDEPENDS_perl-module-threads += "perl-module-carp"
+RDEPENDS_perl-module-threads += "perl-module-config"
+RDEPENDS_perl-module-threads += "perl-module-overload"
+RDEPENDS_perl-module-threads += "perl-module-strict"
+RDEPENDS_perl-module-threads += "perl-module-warnings"
+RDEPENDS_perl-module-threads += "perl-module-xsloader"
+RDEPENDS_perl-module-threads-shared += "perl-module-carp"
+RDEPENDS_perl-module-threads-shared += "perl-module-scalar-util"
+RDEPENDS_perl-module-threads-shared += "perl-module-strict"
+RDEPENDS_perl-module-threads-shared += "perl-module-warnings"
+RDEPENDS_perl-module-threads-shared += "perl-module-xsloader"
+RDEPENDS_perl-module-tie-array += "perl-module-carp"
+RDEPENDS_perl-module-tie-array += "perl-module-strict"
+RDEPENDS_perl-module-tie-file += "perl-module-carp"
+RDEPENDS_perl-module-tie-file += "perl-module-fcntl"
+RDEPENDS_perl-module-tie-file += "perl-module-posix"
+RDEPENDS_perl-module-tie-file += "perl-module-strict"
+RDEPENDS_perl-module-tie-file += "perl-module-symbol"
+RDEPENDS_perl-module-tie-handle += "perl-module-carp"
+RDEPENDS_perl-module-tie-handle += "perl-module-tie-stdhandle"
+RDEPENDS_perl-module-tie-handle += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-strict"
+RDEPENDS_perl-module-tie-hash-namedcapture += "perl-module-xsloader"
+RDEPENDS_perl-module-tie-hash += "perl-module-carp"
+RDEPENDS_perl-module-tie-hash += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-memoize += "perl-module-strict"
+RDEPENDS_perl-module-tie-memoize += "perl-module-tie-hash"
+RDEPENDS_perl-module-tie-refhash += "perl-module-carp"
+RDEPENDS_perl-module-tie-refhash += "perl-module-config"
+RDEPENDS_perl-module-tie-refhash += "perl-module-overload"
+RDEPENDS_perl-module-tie-refhash += "perl-module-strict"
+RDEPENDS_perl-module-tie-refhash += "perl-module-tie-hash"
+RDEPENDS_perl-module-tie-refhash += "perl-module-vars"
+RDEPENDS_perl-module-tie-scalar += "perl-module-carp"
+RDEPENDS_perl-module-tie-scalar += "perl-module-warnings-register"
+RDEPENDS_perl-module-tie-stdhandle += "perl-module-strict"
+RDEPENDS_perl-module-tie-stdhandle += "perl-module-tie-handle"
+RDEPENDS_perl-module-tie-substrhash += "perl-module-carp"
+RDEPENDS_perl-module-tie-substrhash += "perl-module-integer"
+RDEPENDS_perl-module-time-gmtime += "perl-module-exporter"
+RDEPENDS_perl-module-time-gmtime += "perl-module-strict"
+RDEPENDS_perl-module-time-gmtime += "perl-module-time-tm"
+RDEPENDS_perl-module-time-hires += "perl-module-carp"
+RDEPENDS_perl-module-time-hires += "perl-module-exporter"
+RDEPENDS_perl-module-time-hires += "perl-module-strict"
+RDEPENDS_perl-module-time-hires += "perl-module-xsloader"
+RDEPENDS_perl-module-time-local += "perl-module-carp"
+RDEPENDS_perl-module-time-local += "perl-module-config"
+RDEPENDS_perl-module-time-local += "perl-module-constant"
+RDEPENDS_perl-module-time-local += "perl-module-exporter"
+RDEPENDS_perl-module-time-local += "perl-module-parent"
+RDEPENDS_perl-module-time-local += "perl-module-strict"
+RDEPENDS_perl-module-time-localtime += "perl-module-exporter"
+RDEPENDS_perl-module-time-localtime += "perl-module-strict"
+RDEPENDS_perl-module-time-localtime += "perl-module-time-tm"
+RDEPENDS_perl-module-time-piece += "perl-module-carp"
+RDEPENDS_perl-module-time-piece += "perl-module-constant"
+RDEPENDS_perl-module-time-piece += "perl-module-exporter"
+RDEPENDS_perl-module-time-piece += "perl-module-integer"
+RDEPENDS_perl-module-time-piece += "perl-module-overload"
+RDEPENDS_perl-module-time-piece += "perl-module-strict"
+RDEPENDS_perl-module-time-piece += "perl-module-time-local"
+RDEPENDS_perl-module-time-piece += "perl-module-time-seconds"
+RDEPENDS_perl-module-time-piece += "perl-module-xsloader"
+RDEPENDS_perl-module-time-seconds += "perl-module-constant"
+RDEPENDS_perl-module-time-seconds += "perl-module-exporter"
+RDEPENDS_perl-module-time-seconds += "perl-module-overload"
+RDEPENDS_perl-module-time-seconds += "perl-module-strict"
+RDEPENDS_perl-module-time-tm += "perl-module-class-struct"
+RDEPENDS_perl-module-time-tm += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-big5 += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-big5 += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-gb2312 += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-gb2312 += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-jisx0208 += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-jisx0208 += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-korean += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-korean += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-pinyin += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-pinyin += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-stroke += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-stroke += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-cjk-zhuyin += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-cjk-zhuyin += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-base"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-carp"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate-locale += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate += "perl-module-carp"
+RDEPENDS_perl-module-unicode-collate += "perl-module-constant"
+RDEPENDS_perl-module-unicode-collate += "perl-module-file-spec"
+RDEPENDS_perl-module-unicode-collate += "perl-module-strict"
+RDEPENDS_perl-module-unicode-collate += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-collate += "perl-module-xsloader"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-carp"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-exporter"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-strict"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-warnings"
+RDEPENDS_perl-module-unicode-normalize += "perl-module-xsloader"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-carp"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-charnames"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-exporter"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-feature"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-file-spec"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-if"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-integer"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-strict"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-unicode-normalize"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-unicore/heavy"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-unicore/ucd"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-utf8-heavy"
+RDEPENDS_perl-module-unicode-ucd += "perl-module-warnings"
+RDEPENDS_perl-module-unicore += "perl-module-integer"
+RDEPENDS_perl-module-universal += "perl-module-carp"
+RDEPENDS_perl-module-user-grent += "perl-module-class-struct"
+RDEPENDS_perl-module-user-grent += "perl-module-exporter"
+RDEPENDS_perl-module-user-grent += "perl-module-strict"
+RDEPENDS_perl-module-user-pwent += "perl-module-carp"
+RDEPENDS_perl-module-user-pwent += "perl-module-class-struct"
+RDEPENDS_perl-module-user-pwent += "perl-module-config"
+RDEPENDS_perl-module-user-pwent += "perl-module-exporter"
+RDEPENDS_perl-module-user-pwent += "perl-module-strict"
+RDEPENDS_perl-module-user-pwent += "perl-module-warnings"
+RDEPENDS_perl-module-utf8 += "perl-module-carp"
+RDEPENDS_perl-module-utf8 += "perl-module-utf8-heavy"
+RDEPENDS_perl-module-version += "perl-module-strict"
+RDEPENDS_perl-module-version += "perl-module-version-regex"
+RDEPENDS_perl-module-version += "perl-module-warnings-register"
+RDEPENDS_perl-module-version-regex += "perl-module-strict"
+RDEPENDS_perl-module-xsloader += "perl-module-carp"
+RDEPENDS_perl-module-xsloader += "perl-module-dynaloader"
diff --git a/meta/recipes-devtools/perl/perl.inc b/meta/recipes-devtools/perl/perl.inc
index 3313a9436b..1d31befd0b 100644
--- a/meta/recipes-devtools/perl/perl.inc
+++ b/meta/recipes-devtools/perl/perl.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "devel"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b \
-		    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3"
+		    file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da"
 
 SRC_URI = "http://www.cpan.org/src/5.0/${BP}.tar.xz"
 
diff --git a/meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch b/meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch
deleted file mode 100644
index a43fbba0b6..0000000000
--- a/meta/recipes-devtools/perl/perl/0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 40702abf3156fa92ef70ee5d445fe52dd6cfbc7d Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 20 Sep 2018 18:48:48 +0800
-Subject: [PATCH] ExtUtils/MM_Unix.pm: fix race issues
-
-Fixed a race issue when compile libhtml-parser-perl and others who use MakeMaker:
-[snip]
-chmod 755 blib/arch/auto/HTML/Parser/Parser.so 
-chmod 644 "Parser.bs"
-[snip]
-
-The rule INST_DYNAMIC removes '.bs' file which are generated by BOOTSTRAP, but
-the have no dependencies, so there is a race issue:
-
-BOOTSTRAP:
-    touch foo.bs
-    chmod 755 foo.bs
-
-INST_DYNAMIC:
-    rm -fr foo.bs
-
-The error would happen when INST_DYNAMIC removes foo.bs after BOOTSTRAP touched
-it but before chmod on it.
-
-Upstream-Status: Backport [https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/commit/44e95e717372abe2b0a6ee55de4b686760b65360]
-
-Note, This is not a real backport, upstream has totally refactored it in one
-patch, please see the link above, it's not a good idea to backport such a big
-patch, I just referred it to fix the problem in a simple way. I mark it as
-backport is because we can drop the patch after upgrade perl to 5.26 or 5.28.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 95d9761..9cabe2d 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -933,7 +933,7 @@ OTHERLDFLAGS = '.$ld_opt.$otherldflags.'
- INST_DYNAMIC_DEP = '.$inst_dynamic_dep.'
- INST_DYNAMIC_FIX = '.$ld_fix.'
- 
--$(INST_DYNAMIC): $(OBJECT) $(MYEXTLIB) $(INST_ARCHAUTODIR)$(DFSEP).exists $(EXPORT_LIST) $(PERL_ARCHIVEDEP) $(PERL_ARCHIVE_AFTER) $(INST_DYNAMIC_DEP)
-+$(INST_DYNAMIC): $(OBJECT) $(MYEXTLIB) $(INST_ARCHAUTODIR)$(DFSEP).exists $(EXPORT_LIST) $(PERL_ARCHIVEDEP) $(PERL_ARCHIVE_AFTER) $(INST_DYNAMIC_DEP) $(BOOTSTRAP)
- ');
-     if ($armaybe ne ':'){
- 	$ldfrom = 'tmp$(LIB_EXT)';
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch b/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
deleted file mode 100644
index c5db1b7060..0000000000
--- a/meta/recipes-devtools/perl/perl/0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch
+++ /dev/null
@@ -1,126 +0,0 @@
-From ba6733216202523a95b0b7ee2e534b8e30b6d7df Mon Sep 17 00:00:00 2001
-From: Dominic Hargreaves <dom@earth.li>
-Date: Sat, 14 Oct 2017 16:27:53 +0200
-Subject: [PATCH] Skip various tests if PERL_BUILD_PACKAGING is set
-
-These are tests which tend not to be useful for downstream packagers
-
-t/porting/customized.t change originally from Todd Rinaldo
-
-Upstream-Status: Backport[https://perl5.git.perl.org/perl.git/ba6733216202523a95b0b7ee2e534b8e30b6d7df]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- INSTALL                |  3 ++-
- MANIFEST               |  1 +
- PACKAGING              | 30 ++++++++++++++++++++++++++++++
- regen/lib_cleanup.pl   |  5 +++++
- t/porting/customized.t |  1 +
- t/test.pl              |  3 +++
- 6 files changed, 42 insertions(+), 1 deletion(-)
- create mode 100644 PACKAGING
-
-diff --git a/INSTALL b/INSTALL
-index 636f4bd52f..1285fc69a2 100644
---- a/INSTALL
-+++ b/INSTALL
-@@ -2714,4 +2714,5 @@ This document is part of the Perl package and may be distributed under
- the same terms as perl itself, with the following additional request:
- If you are distributing a modified version of perl (perhaps as part of
- a larger package) please B<do> modify these installation instructions
--and the contact information to match your distribution.
-+and the contact information to match your distribution. Additional
-+information for packagers is in F<PACKAGING>.
-diff --git a/MANIFEST b/MANIFEST
-index b3207030a9..32de824ca1 100644
---- a/MANIFEST
-+++ b/MANIFEST
-@@ -4932,6 +4932,7 @@ os2/perlrexx.c			Support perl interpreter embedded in REXX
- os2/perlrexx.cmd		Test perl interpreter embedded in REXX
- overload.h			generated overload enum (public)
- overload.inc			generated overload name table (implementation)
-+PACKAGING			notes and best practice for packaging perl 5
- packsizetables.inc		The generated packprops array used in pp_pack.c
- pad.c				Scratchpad functions
- pad.h				Scratchpad headers
-diff --git a/PACKAGING b/PACKAGING
-new file mode 100644
-index 0000000000..0c69b87ba6
---- /dev/null
-+++ b/PACKAGING
-@@ -0,0 +1,30 @@
-+If you read this file _as_is_, just ignore the funny characters you
-+see.  It is written in the POD format (see pod/perlpod.pod) which is
-+specifically designed to be readable as is.
-+
-+=head1 NAME
-+
-+PACKAGING - notes and best practice for packaging perl 5
-+
-+=head1 SYNOPSIS
-+
-+This document is aimed at anyone who is producing their own version of
-+perl for distribution to other users. It is intended as a collection
-+of useful tips, advice and best practice, rather than being a complete
-+packaging manual. The starting point for installing perl remains
-+F<INSTALL>.
-+
-+=head1 Customizing test running
-+
-+A small number of porting tests (those in t/porting) are not well suited
-+to typical distribution packaging scenarios. For example, they assume
-+they are working in a git clone of the upstream Perl repository, or
-+enforce rules which are not relevant to downstream packagers. These can
-+be skipped by setting the environment variable PERL_BUILD_PACKAGING.
-+A complete list of tests which this applied to can be found by searching
-+the codebase for this string.
-+
-+An alternative strategy would be to skip all porting tests, but many of
-+them are useful if additional patches might be applied.
-+
-+=cut
-diff --git a/regen/lib_cleanup.pl b/regen/lib_cleanup.pl
-index 5e40b405a4..6caf74a563 100644
---- a/regen/lib_cleanup.pl
-+++ b/regen/lib_cleanup.pl
-@@ -164,6 +164,11 @@ if ($TAP && !-d '.git' && !-f 'lib/.gitignore') {
-     exit 0;
- }
- 
-+if ($ENV{'PERL_BUILD_PACKAGING'}) {
-+    print "ok # skip explicitly disabled git tests by PERL_BUILD_PACKAGING\n";
-+    exit 0;
-+}
-+
- $fh = open_new('lib/.gitignore', '>',
-                { by => $0,
-                  from => 'MANIFEST and parsing files in cpan/ dist/ and ext/'});
-diff --git a/t/porting/customized.t b/t/porting/customized.t
-index 45fcafb100..5c3739198c 100644
---- a/t/porting/customized.t
-+++ b/t/porting/customized.t
-@@ -13,6 +13,7 @@ BEGIN {
-     @INC = qw(lib Porting t);
-     require 'test.pl';
-     skip_all("pre-computed SHA1 won't match under EBCDIC") if $::IS_EBCDIC;
-+    skip_all("This distro may have modified some files in cpan/. Skipping validation.") if $ENV{'PERL_BUILD_PACKAGING'};
- }
- 
- use strict;
-diff --git a/t/test.pl b/t/test.pl
-index 79e6e25e95..1782dcf73c 100644
---- a/t/test.pl
-+++ b/t/test.pl
-@@ -212,6 +212,9 @@ sub find_git_or_skip {
-     } else {
- 	$reason = 'not being run from a git checkout';
-     }
-+    if ($ENV{'PERL_BUILD_PACKAGING'}) {
-+	$reason = 'PERL_BUILD_PACKAGING is set';
-+    }
-     skip_all($reason) if $_[0] && $_[0] eq 'all';
-     skip($reason, @_);
- }
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
deleted file mode 100644
index a33deaff6a..0000000000
--- a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
-Date: Fri, 8 Jun 2018 11:45:40 +0100
-Subject: [PATCH] [PATCH] Remove existing files before overwriting them
-
-Archive should extract only the latest same-named entry.
-Extracted regular file should not be writtent into existing block
-device (or any other one).
-
-https://rt.cpan.org/Ticket/Display.html?id=125523
-
-CVE: CVE-2018-12015
-Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5]
-
-Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- lib/Archive/Tar.pm | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
-
-diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
-index 6244369..a83975f 100644
---- a/cpan/Archive-Tar/lib/Archive/Tar.pm
-+++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
-@@ -845,6 +845,20 @@ sub _extract_file {
-         return;
-     }
- 
-+    ### If a file system already contains a block device with the same name as
-+    ### the being extracted regular file, we would write the file's content
-+    ### to the block device. So remove the existing file (block device) now.
-+    ### If an archive contains multiple same-named entries, the last one
-+    ### should replace the previous ones. So remove the old file now.
-+    ### If the old entry is a symlink to a file outside of the CWD, the new
-+    ### entry would create a file there. This is CVE-2018-12015
-+    ### <https://rt.cpan.org/Ticket/Display.html?id=125523>.
-+    if (-l $full || -e _) {
-+	if (!unlink $full) {
-+	    $self->_error( qq[Could not remove old file '$full': $!] );
-+	    return;
-+	}
-+    }
-     if( length $entry->type && $entry->is_file ) {
-         my $fh = IO::File->new;
-         $fh->open( '>' . $full ) or (
--- 
-2.13.3
-
diff --git a/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch b/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
index eb92ccb678..9f65627d46 100644
--- a/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
+++ b/meta/recipes-devtools/perl/perl/MM_Unix.pm.patch
@@ -1,4 +1,4 @@
-Upstream-Status:Pending
+Upstream-Status:Inappropriate [embedded specific]
 
 The perl-native should be relocatable while re-use sstate-cache from
 another build, especially the original build was renamed/removed.
@@ -6,17 +6,20 @@ another build, especially the original build was renamed/removed.
 To get the MakeMaker.pm works in this case, we need perl wrapper here
 instead of real perl binary.
 
+Rebased to 5.28.0
+
 Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+Signed-off-by: Jens Rehsack <sno@NetBSD.org>
 ===================================================================
---- perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig	2011-08-12 16:07:30.000000000 +0800
-+++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2011-08-12 16:08:56.000000000 +0800
-@@ -1019,6 +1019,9 @@
-     }
+--- perl-5.28.0/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm.orig	2018-11-20 11:46:01.000000000 +0100
++++ perl-5.28.0/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2018-11-20 11:46:56.000000000 +0100
+@@ -1117,6 +1117,9 @@
  
      foreach my $name (@$names){
+         my ($abs, $use_dir);
 +        # Getting MakeMaker.pm use perl wrapper instead of 'perl.real' directly
 +        $name =~ s/perl\.real/perl/ if ($name =~ /perl\.real/);
 +
-         foreach my $dir (@$dirs){
-             next unless defined $dir; # $self->{PERL_SRC} may be undefined
-             my ($abs, $val);
+         if ($self->file_name_is_absolute($name)) {     # /foo/bar
+             $abs = $name;
+         } elsif ($self->canonpath($name) eq
diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
index e4c3426b7f..58c35b977f 100644
--- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
@@ -9,25 +9,16 @@ Upstream-Status:Inappropriate [embedded specific]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 ---
- Makefile.SH | 147 ++++++++++++++++++++++++++++--------------------------------
- 1 file changed, 68 insertions(+), 79 deletions(-)
-
-Index: perl-5.24.4/Makefile.SH
-===================================================================
---- perl-5.24.4.orig/Makefile.SH
-+++ perl-5.24.4/Makefile.SH
-@@ -48,10 +48,10 @@ case "$useshrplib" in
+diff --git a/Makefile.SH b/Makefile.SH
+index 123903dcb0..a3be07d31d 100755
+--- a/Makefile.SH
++++ b/Makefile.SH
+@@ -48,7 +48,7 @@
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
  	# $ldlibpth so that ./perl finds *this* shared libperl.
--	case "$LD_LIBRARY_PATH" in
--	'')  ldlibpth="LD_LIBRARY_PATH=` quote "$pwd" `" ;;
--	*)   ldlibpth="LD_LIBRARY_PATH=` quote "$pwd" `:` quote "$LD_LIBRARY_PATH" `" ;;
--	esac
-+	#case "$LD_LIBRARY_PATH" in
-+	#'')  ldlibpth="LD_LIBRARY_PATH=` quote "$pwd" `" ;;
-+	#*)   ldlibpth="LD_LIBRARY_PATH=` quote "$pwd" `:` quote "$LD_LIBRARY_PATH" `" ;;
-+	#esac
+-	ldlibpth="LD_LIBRARY_PATH=` quote "$pwd" `"'$${LD_LIBRARY_PATH:+:}$$LD_LIBRARY_PATH'
++	#ldlibpth="LD_LIBRARY_PATH=` quote "$pwd" `"'$${LD_LIBRARY_PATH:+:}$$LD_LIBRARY_PATH'
  
  	pldlflags="$cccdlflags"
  	static_ldflags=''
@@ -67,23 +58,49 @@ Index: perl-5.24.4/Makefile.SH
  	    ;;
  	os390)	test -f /bin/env && ldlibpth="/bin/env $ldlibpth"
  		;;
-@@ -596,13 +586,23 @@ splintfiles = $(c1)
+@@ -332,12 +322,26 @@ PATH_SEP = $p_
+ # Macros to invoke a copy of miniperl during the build.  Targets which
+ # are built using these macros should depend on \$(MINIPERL_EXE)
+ MINIPERL_EXE = miniperl\$(EXE_EXT)
++!GROK!THIS!
++
++
++if test "X$hostperl" != X; then
++       $spitshell >>$Makefile <<!GROK!THIS!
++MINIPERL = \$(LDLIBPTH) \$(HOST_PERL)
++
++# Macros to invoke sort the MANIFEST during build
++MANIFEST_SRT = MANIFEST.srt
++
++!GROK!THIS!
++else
++       $spitshell >>$Makefile <<!GROK!THIS!
+ MINIPERL = \$(LDLIBPTH) ./miniperl\$(EXE_EXT) -Ilib
+ 
+ # Macros to invoke sort the MANIFEST during build
+ MANIFEST_SRT = MANIFEST.srt
+ 
+ !GROK!THIS!
++fi
+ 
+ case "$usecrosscompile$perl" in
+ define?*)
+@@ -623,13 +627,23 @@ lintflags = \
  	@echo `$(CCCMDSRC)` -S $*.c
  	@`$(CCCMDSRC)` -S $*.c
  
--all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
+-all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT) common_build
 -	@echo " ";
 -	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
--
--$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
--	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
--	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 +#	@echo " ";
 +#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
 +
 +all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) miniperl $(unidatafiles)
-+
+ 
+-$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+-	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
+-	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +more: $(generated_pods) $(private) $(public)
 +
 +more2: $(dynamic_ext)
@@ -98,7 +115,7 @@ Index: perl-5.24.4/Makefile.SH
  	@touch $(MANIFEST_SRT)
  
  .PHONY: all utilities
-@@ -611,7 +611,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+@@ -638,7 +652,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
  # by make_patchnum.pl.
  git_version.h: lib/Config_git.pl
  
@@ -107,7 +124,7 @@ Index: perl-5.24.4/Makefile.SH
  	$(MINIPERL) make_patchnum.pl
  
  # make sure that we recompile perl.c if the git version changes
-@@ -624,7 +624,7 @@ perl$(OBJ_EXT): git_version.h
+@@ -651,7 +665,7 @@ perl$(OBJ_EXT): git_version.h
  # loading, we need to build perl first.
  case "$usedl$static_cwd" in
  defineundef)
@@ -116,43 +133,43 @@ Index: perl-5.24.4/Makefile.SH
      ;;
  definedefine)
      util_deps='$(PERL_EXE) $(CONFIGPM) FORCE'
-@@ -634,7 +634,7 @@ definedefine)
+@@ -661,7 +675,7 @@ definedefine)
  esac
  
  $spitshell >>$Makefile <<!GROK!THIS!
 -utils/Makefile: \$(MINIPERL_EXE) \$(CONFIGPM) utils/Makefile.PL
 +utils/Makefile: \$(CONFIGPM) utils/Makefile.PL
- 	\$(MINIPERL) -Ilib utils/Makefile.PL
+ 	\$(MINIPERL) utils/Makefile.PL
  
  utilities:	utils/Makefile $util_deps
-@@ -743,7 +743,7 @@ ext.libs: $(static_ext)
+@@ -770,7 +784,7 @@ ext.libs: $(static_ext)
  ;;
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
 -perlmain.c: $(MINIPERL_EXE) ext/ExtUtils-Miniperl/pm_to_blib
 +perlmain.c: ext/ExtUtils-Miniperl/lib/ExtUtils/Miniperl.pm
- 	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARGV)' DynaLoader $(static_ext)
+ 	$(MINIPERL) -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARGV)' DynaLoader $(static_ext)
  
  # The file ext.libs is a list of libraries that must be linked in
-@@ -806,7 +806,7 @@ PERLEXPORT		= perl.exp
+@@ -833,7 +847,7 @@ PERLEXPORT		= perl.exp
  	;;
  	esac
  	$spitshell >>$Makefile <<'!NO!SUBS!'
 -perl.exp: $(MINIPERLEXP) makedef.pl $(CONFIGPM) $(SYM) $(SYMH)
 +perl.exp: makedef.pl $(CONFIGPM) $(SYM) $(SYMH)
- 	./$(MINIPERLEXP) makedef.pl --sort-fold PLATFORM=aix CC_FLAGS="$(OPTIMIZE)" > perl.exp
+ 	$(MINIPERL) makedef.pl --sort-fold PLATFORM=aix CC_FLAGS="$(OPTIMIZE)" > perl.exp
  
  !NO!SUBS!
-@@ -815,7 +815,7 @@ os2)
+@@ -842,7 +856,7 @@ os2)
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  MINIPERLEXP		= miniperl
  
 -perl5.def: $(MINIPERLEXP) makedef.pl $(CONFIGPM) $(SYM) $(SYMH) miniperl.map
 +perl5.def: makedef.pl $(CONFIGPM) $(SYM) $(SYMH) miniperl.map
- 	./$(MINIPERLEXP) makedef.pl PLATFORM=os2 -DPERL_DLL=$(PERL_DLL) CC_FLAGS="$(OPTIMIZE)" > perl5.def
+ 	$(MINIPERL) makedef.pl PLATFORM=os2 -DPERL_DLL=$(PERL_DLL) CC_FLAGS="$(OPTIMIZE)" > perl5.def
  
  !NO!SUBS!
-@@ -878,7 +878,7 @@ $(LIBPERL): $& $(perllib_objs) $(DYNALOA
+@@ -918,7 +932,7 @@ $(LIBPERL): $& $(perllib_dep) $(DYNALOADER) $(LIBPERLEXPORT)
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
@@ -161,13 +178,11 @@ Index: perl-5.24.4/Makefile.SH
  !NO!SUBS!
  		case "$osname" in
  		aix)
-@@ -936,15 +936,19 @@ lib/buildcustomize.pl: $& $(miniperl_obj
+@@ -976,15 +990,17 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  lib/buildcustomize.pl: $& $(miniperl_objs)
  	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(miniperl_objs) $(libs)
 -	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
-+	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
 +	#$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
@@ -179,45 +194,43 @@ Index: perl-5.24.4/Makefile.SH
 -	$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
 +	$(CC) -o $(MINIPERL_EXE) $(miniperl_objs   libs)
 +	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
++	ln -s \$(HOST_PERL) miniperl
 +	#$(LDLIBPTH) ./miniperl$(HOST    _EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
  	$(MINIPERL) -f write_buildcustomize.pl    
  !NO!SUBS!
  		;;
-@@ -966,7 +970,9 @@ lib/buildcustomize.pl: $& $(miniperl_obj
+@@ -1006,7 +1022,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
  	    $(miniperl_objs) $(libs)
 -	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
 +	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
++	ln -s \$(HOST_PERL) miniperl
 +	#$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -977,7 +983,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_o
+@@ -1017,7 +1035,7 @@ lib/buildcustomize.pl: \$& \$(miniperl_dep) write_buildcustomize.pl
  	-@rm -f miniperl.xok
  	-@rm \$(MINIPERL_EXE)
  	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
 -	\$(LDLIBPTH) ./miniperl\$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
-+	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
 +	#\$(LDLIBPTH) ./miniperl\$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
  	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
  !GROK!THIS!
  		else
-@@ -986,7 +994,9 @@ lib/buildcustomize.pl: $& $(miniperl_obj
+@@ -1026,7 +1044,9 @@ lib/buildcustomize.pl: $& $(miniperl_dep) write_buildcustomize.pl
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
  	    $(miniperl_objs) $(libs)
 -	$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
 +	mv -f miniperl miniperl-target
-+	ln -s hostperl miniperl
++	ln -s \$(HOST_PERL) miniperl
 +	#$(LDLIBPTH) ./miniperl$(HOST_EXE_EXT) -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		fi
-@@ -1036,7 +1046,7 @@ case "${osname}" in
+@@ -1076,7 +1096,7 @@ case "${osname}" in
  catamount)
  $spitshell >>$Makefile <<!GROK!THIS!
  .PHONY: makeppport
@@ -226,7 +239,7 @@ Index: perl-5.24.4/Makefile.SH
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \$\$f); \
  	done
-@@ -1046,7 +1056,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
+@@ -1086,7 +1106,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
@@ -235,10 +248,10 @@ Index: perl-5.24.4/Makefile.SH
  	$(MINIPERL) mkppport
  
  !NO!SUBS!
-@@ -1056,16 +1066,16 @@ esac
+@@ -1096,16 +1116,16 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
  
- .PHONY: preplibrary
+ .PHONY: preplibrary common_build
 -preplibrary: $(MINIPERL_EXE) $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
 +preplibrary: $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
  
@@ -255,11 +268,11 @@ Index: perl-5.24.4/Makefile.SH
  	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1074,12 +1084,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
+@@ -1114,12 +1134,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
  # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
  # But also this ensures that all extensions are built before we try to scan
  # them, which picks up Devel::PPPort's documentation.
--pod/perltoc.pod: $(perltoc_pod_prereqs)  $(PERL_EXE) $(ext) pod/buildtoc
+-pod/perltoc.pod: $(perltoc_pod_prereqs) $(PERL_EXE) $(ext) pod/buildtoc
 -	$(RUN_PERL) -f pod/buildtoc -q
 +pod/perltoc.pod: $(perltoc_pod_prereqs) $(ext) pod/buildtoc
 +	$(MINIPERL) -f pod/buildtoc -q
@@ -271,65 +284,38 @@ Index: perl-5.24.4/Makefile.SH
  	$(MINIPERL) autodoc.pl
  
  pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
-@@ -1089,7 +1099,7 @@ pod/perl5244delta.pod: pod/perldelta.pod
- 	$(RMS) pod/perl5244delta.pod
- 	$(LNS) perldelta.pod pod/perl5244delta.pod
+@@ -1129,7 +1149,7 @@ pod/perl5280delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5280delta.pod
+ 	$(LNS) perldelta.pod pod/perl5280delta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
  	-@test ! -f extra.pods || rm -f `cat extra.pods`
  	-@rm -f extra.pods
  	-@for x in `grep -l '^=[a-z]' README.* | grep -v README.vms` ; do \
-@@ -1133,8 +1143,7 @@ EOT
+@@ -1185,8 +1205,8 @@ for name in all notify silent strip verbose; do
          $spitshell >>$Makefile <<EOT
  
  install_$name install-$name: \$(INSTALL_DEPENDENCE) installperl all installman
--	\$(RUN_PERL) installperl --destdir=\$(DESTDIR) $flags \$(INSTALLFLAGS) \$(STRIPFLAGS)
--	\$(RUN_PERL) installman --destdir=\$(DESTDIR) $flags
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=\$(DESTDIR) $flags  \$(INSTALLFLAGS) \$(STRIPFLAGS)
+-	\$(HOST_PERL) installperl --destdir=\$(DESTDIR) $flags \$(INSTALLFLAGS) \$(STRIPFLAGS)
+-	\$(HOST_PERL) installman --destdir=\$(DESTDIR) $flags
++	\$(HOST_PERL) -Ifake_config_library -Ilib -MConfig installperl --destdir=\$(DESTDIR) $flags \$(INSTALLFLAGS) \$(STRIPFLAGS)
++	\$(HOST_PERL) -MConfig installman --destdir=\$(DESTDIR) $flags
  EOT
-     fi
- 
-@@ -1144,11 +1153,7 @@ done
- if test "X$hostperl" != X; then
+     else
+         $spitshell >>$Makefile <<EOT
+@@ -1204,8 +1224,8 @@ if test "X$hostperl" != X; then
+ 	LOCAL_PERL='$(HOST_PERL)'
  	$spitshell >>$Makefile <<'!NO!SUBS!'
  install.perl:	$(INSTALL_DEPENDENCE) installperl
 -	$(HOST_PERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
 -	-@test ! -s extras.lst || $(MAKE) extras.install
--
--install.man:	all installman
--	$(HOST_PERL) installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
- 
- # XXX Experimental. Hardwired values, but useful for testing.
- # Eventually Configure could ask for some of these values.
-@@ -1166,24 +1171,8 @@ install.html: all installhtml
- else
- 	$spitshell >>$Makefile <<'!NO!SUBS!'
- install.perl:	$(INSTALL_DEPENDENCE) installperl
--	$(RUN_PERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
--	-@test ! -s extras.lst || PATH="`pwd`:\${PATH}" PERL5LIB="`pwd`/lib" \$(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
--
--install.man:	all installman
--	$(RUN_PERL) installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
- 
--# XXX Experimental. Hardwired values, but useful for testing.
--# Eventually Configure could ask for some of these values.
--install.html: all installhtml
--	-@test -f README.vms && cd vms && $(LNS) ../README.vms README_vms.pod && cd ..
--	$(RUN_PERL) installhtml   \
--      --podroot=. --podpath=. --recurse  \
--      --htmldir=$(privlib)/html   \
--      --htmlroot=$(privlib)/html  \
--      --splithead=pod/perlipc     \
--      --splititem=pod/perlfunc    \
--      --ignore=Porting/Maintainers.pm,Porting/pumpkin.pod,Porting/repository.pod \
--      --verbose
++	$(HOST_PERL) -Ifake_config_library -Ilib -MConfig installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
++	@test ! -s extras.lst || $(MAKE) extras.install
  !NO!SUBS!
- fi
- 
-@@ -1275,13 +1264,13 @@ manicheck:	FORCE
+ else
+ 	LOCAL_PERL='$(RUN_PERL)'
+@@ -1318,13 +1338,13 @@ manicheck:	FORCE
  #
  # DynaLoader may be needed for extensions that use Makefile.PL.
  
@@ -346,13 +332,13 @@ Index: perl-5.24.4/Makefile.SH
  	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
  
  n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
-@@ -1479,14 +1468,14 @@ test_prep_pre: preplibrary utilities $(n
+@@ -1523,14 +1543,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
  
  case "$targethost" in
  '') $spitshell >>$Makefile <<'!NO!SUBS!'
 -test_prep test-prep: test_prep_pre $(MINIPERL_EXE) $(unidatafiles) $(PERL_EXE) \
 +test_prep test-prep: test_prep_pre $(unidatafiles) $(PERL_EXE) \
- 	$(dynamic_ext) $(TEST_PERL_DLL) runtests $(generated_pods)
+ 	$(dynamic_ext) $(TEST_PERL_DLL) runtests $(generated_pods) common_build
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  
  !NO!SUBS!
@@ -361,9 +347,9 @@ Index: perl-5.24.4/Makefile.SH
 -test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE) \
 +test_prep test-prep: test_prep_pre \$(unidatafiles) \$(PERL_EXE) \
  	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
- 	\$(generated_pods)
+ 	\$(generated_pods) common_build
  	$to libperl.*
-@@ -1539,7 +1528,7 @@ test_prep test-prep: test_prep_pre \$(MI
+@@ -1583,7 +1603,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE
  esac
  
  $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -372,7 +358,7 @@ Index: perl-5.24.4/Makefile.SH
  	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  !NO!SUBS!
-@@ -1600,7 +1589,7 @@ minitest_prep:
+@@ -1644,7 +1664,7 @@ minitest_prep:
  
  MINITEST_TESTS = base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t opbasic/*.t op/*.t uni/*.t perf/*.t
  
diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index b1b5834c71..345e574928 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -14,8 +14,8 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.4 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
-config_argc=28
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.28.1 -Dusemultiplicity -Dusethreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
+config_argc=27
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
 config_arg3='-Dmyhostname=localhost'
@@ -26,24 +26,23 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
 config_arg8='-Dprefix=@EXECPREFIX@'
 config_arg9='-Dvendorprefix=@EXECPREFIX@'
 config_arg10='-Dsiteprefix=@EXECPREFIX@'
-config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.4'
-config_arg12='-Duseshrplib'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.28.1'
+config_arg12='-Dusemultiplicity'
 config_arg13='-Dusethreads'
-config_arg14='-Duseithreads'
-config_arg15='-Duselargefiles'
-config_arg16='-Ud_dosuid'
-config_arg17='-Dd_semctl_semun'
-config_arg18='-Ui_db'
-config_arg19='-Ui_ndbm'
-config_arg20='-Ui_gdbm'
-config_arg21='-Di_shadow'
-config_arg22='-Di_syslog'
-config_arg23='-Dman3ext=3pm'
-config_arg24='-Duseperlio'
-config_arg25='-Dinstallusrbinperl'
-config_arg26='-Ubincompat5005'
-config_arg27='-Uversiononly'
-config_arg28='-Dpager=@USRBIN@/less -isr'
+config_arg14='-Duselargefiles'
+config_arg15='-Ud_dosuid'
+config_arg16='-Dd_semctl_semun'
+config_arg17='-Ui_db'
+config_arg18='-Ui_ndbm'
+config_arg19='-Ui_gdbm'
+config_arg20='-Di_shadow'
+config_arg21='-Di_syslog'
+config_arg22='-Dman3ext=3pm'
+config_arg23='-Duseperlio'
+config_arg24='-Dinstallusrbinperl'
+config_arg25='-Ubincompat5005'
+config_arg26='-Uversiononly'
+config_arg27='-Dpager=@USRBIN@/less -isr'
 
 Author=''
 Date=''
@@ -62,15 +61,15 @@ afs='false'
 afsroot='/afs'
 alignbytes='8'
 ansi2knr=''
-aphostname=''
+aphostname='/bin/hostname'
 api_revision='5'
-api_subversion='4'
-api_version='24'
-api_versionstring='5.24.4'
+api_subversion='1'
+api_version='28'
+api_versionstring='5.28.1'
 ar='ar'
-archlib='@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
-archlib_exp='@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.28.1/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.28.1/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.28.1/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -88,8 +87,8 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi/CORE'
-ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.28.1/@ARCH@-thread-multi/CORE'
+ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -fstack-protector-strong -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
 ccsymbols=''
@@ -111,7 +110,7 @@ cpio=''
 cpp='cpp'
 cpp_stuff='42'
 cppccsymbols=''
-cppflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe'
+cppflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -fstack-protector-strong'
 cpplast='-'
 cppminus='-'
 cpprun='gcc  -E'
@@ -136,6 +135,7 @@ d_PRIu64='define'
 d_PRIx64='define'
 d_SCNfldbl='define'
 d__fwalk='undef'
+d_accept4='define'
 d_access='define'
 d_accessx='undef'
 d_acosh='define'
@@ -157,19 +157,18 @@ d_attribute_pure='define'
 d_attribute_unused='define'
 d_attribute_warn_unused_result='define'
 d_backtrace='define'
-d_bcmp='define'
-d_bcopy='define'
 d_bsd='undef'
 d_bsdgetpgrp='undef'
 d_bsdsetpgrp='undef'
+d_builtin_add_overflow='define'
 d_builtin_choose_expr='define'
 d_builtin_expect='define'
-d_bzero='define'
+d_builtin_mul_overflow='define'
+d_builtin_sub_overflow='define'
 d_c99_variadic_macros='define'
 d_casti32='define'
 d_castneg='define'
 d_cbrt='define'
-d_charvspr='undef'
 d_chown='define'
 d_chroot='define'
 d_chsize='undef'
@@ -189,7 +188,6 @@ d_ctermid_r='undef'
 d_ctime64='undef'
 d_ctime_r='define'
 d_cuserid='define'
-d_dbl_dig='define'
 d_dbminitproto='define'
 d_difftime64='undef'
 d_difftime='define'
@@ -201,9 +199,19 @@ d_dlerror='define'
 d_dlopen='define'
 d_dlsymun='undef'
 d_dosuid='undef'
+d_double_has_inf='define'
+d_double_has_nan='define'
+d_double_has_negative_zero='define'
+d_double_has_subnormals='define'
+d_double_style_cray='undef'
+d_double_style_ibm='undef'
+d_double_style_ieee='define'
+d_double_style_vax='undef'
 d_drand48_r='define'
 d_drand48proto='define'
 d_dup2='define'
+d_dup3='define'
+d_duplocale='define'
 d_eaccess='define'
 d_endgrent='define'
 d_endgrent_r='undef'
@@ -226,6 +234,7 @@ d_expm1='define'
 d_faststdio='undef'
 d_fchdir='define'
 d_fchmod='define'
+d_fchmodat='define'
 d_fchown='define'
 d_fcntl='define'
 d_fcntl_can_lock='define'
@@ -263,6 +272,7 @@ d_fsync='define'
 d_ftello='define'
 d_ftime='undef'
 d_futimes='define'
+d_gai_strerror='define'
 d_gdbm_ndbm_h_uses_prototypes='undef'
 d_gdbmndbm_h_uses_prototypes='define'
 d_getaddrinfo='define'
@@ -333,7 +343,6 @@ d_hypot='define'
 d_ilogb='define'
 d_ilogbl='define'
 d_inc_version_list='undef'
-d_index='undef'
 d_inetaton='define'
 d_inetntop='define'
 d_inetpton='define'
@@ -364,10 +373,12 @@ d_lgamma_r='define'
 d_libm_lib_version='undef'
 d_libname_unique='undef'
 d_link='define'
+d_linkat='define'
 d_llrint='define'
 d_llrintl='define'
 d_llround='define'
 d_llroundl='define'
+d_localeconv_l='undef'
 d_localtime64='undef'
 d_localtime_r='define'
 d_localtime_r_needs_tzset='define'
@@ -376,6 +387,11 @@ d_lockf='define'
 d_log1p='define'
 d_log2='define'
 d_logb='define'
+d_long_double_style_ieee='define'
+d_long_double_style_ieee_doubledouble='undef'
+d_long_double_style_ieee_extended='define'
+d_long_double_style_ieee_std='undef'
+d_long_double_style_vax='undef'
 d_longdbl='define'
 d_longlong='define'
 d_lrint='define'
@@ -388,23 +404,21 @@ d_madvise='define'
 d_malloc_good_size='undef'
 d_malloc_size='undef'
 d_mblen='define'
+d_mbrlen='define'
+d_mbrtowc='define'
 d_mbstowcs='define'
 d_mbtowc='define'
-d_memchr='define'
-d_memcmp='define'
-d_memcpy='define'
-d_memmove='define'
-d_memset='define'
+d_memrchr='define'
 d_mkdir='define'
 d_mkdtemp='define'
 d_mkfifo='define'
+d_mkostemp='define'
 d_mkstemp='define'
 d_mkstemps='define'
 d_mktime64='undef'
 d_mktime='define'
 d_mmap='define'
 d_modfl='define'
-d_modfl_pow32_bug='undef'
 d_modflproto='define'
 d_mprotect='define'
 d_msg='define'
@@ -429,23 +443,23 @@ d_nextafter='define'
 d_nexttoward='define'
 d_nice='define'
 d_nl_langinfo='define'
-d_nv_preserves_uv='undef'
 d_nv_zero_is_allbits_zero='define'
 d_off64_t='define'
 d_old_pthread_create_joinable='undef'
 d_oldpthreads='undef'
 d_oldsock='undef'
 d_open3='define'
+d_openat='define'
 d_pathconf='define'
 d_pause='define'
 d_perl_otherlibdirs='define'
 d_phostname='undef'
+d_pipe2='define'
 d_pipe='define'
 d_poll='define'
 d_portable='define'
 d_prctl='define'
 d_prctl_set_name='define'
-d_printf_format_null='undef'
 d_procselfexe='define'
 d_pseudofork='undef'
 d_pthread_atfork='define'
@@ -462,6 +476,7 @@ d_pwpasswd='define'
 d_pwquota='undef'
 d_qgcvt='define'
 d_quad='define'
+d_querylocale='undef'
 d_random_r='define'
 d_re_comp='undef'
 d_readdir64_r='define'
@@ -475,13 +490,11 @@ d_regcomp='define'
 d_remainder='define'
 d_remquo='define'
 d_rename='define'
+d_renameat='define'
 d_rewinddir='define'
 d_rint='define'
 d_rmdir='define'
 d_round='define'
-d_safebcpy='undef'
-d_safemcpy='undef'
-d_sanemcmp='define'
 d_sbrkproto='define'
 d_scalbn='define'
 d_scalbnl='define'
@@ -549,7 +562,6 @@ d_socket='define'
 d_socklen_t='define'
 d_sockpair='define'
 d_socks5_init='undef'
-d_sprintf_returns_strlen='define'
 d_sqrtl='define'
 d_srand48_r='define'
 d_srandom_r='define'
@@ -568,18 +580,18 @@ d_stdio_ptr_lval_sets_cnt='undef'
 d_stdio_stream_array='undef'
 d_stdiobase='undef'
 d_stdstdio='undef'
-d_strchr='define'
 d_strcoll='define'
-d_strctcpy='define'
-d_strerrm='strerror(e)'
-d_strerror='define'
+d_strerror_l='define'
 d_strerror_r='define'
 d_strftime='define'
 d_strlcat='undef'
 d_strlcpy='undef'
+d_strnlen='define'
 d_strtod='define'
+d_strtod_l='define'
 d_strtol='define'
 d_strtold='define'
+d_strtold_l='define'
 d_strtoll='define'
 d_strtoq='define'
 d_strtoul='define'
@@ -599,6 +611,7 @@ d_tcsetpgrp='define'
 d_telldir='define'
 d_telldirproto='define'
 d_tgamma='define'
+d_thread_safe_nl_langinfo_l='define'
 d_time='define'
 d_timegm='define'
 d_times='define'
@@ -610,11 +623,11 @@ d_truncate='define'
 d_truncl='define'
 d_ttyname_r='define'
 d_tzname='define'
-d_u32align='define'
 d_ualarm='define'
 d_umask='define'
 d_uname='define'
 d_union_semun='undef'
+d_unlinkat='define'
 d_unordered='undef'
 d_unsetenv='define'
 d_usleep='define'
@@ -628,8 +641,6 @@ d_vfork='undef'
 d_void_closedir='undef'
 d_voidsig='define'
 d_voidtty=''
-d_volatile='define'
-d_vprintf='define'
 d_vsnprintf='define'
 d_wait4='define'
 d_waitpid='define'
@@ -645,6 +656,7 @@ db_prefixtype='size_t'
 db_version_major=''
 db_version_minor=''
 db_version_patch=''
+default_inc_excludes_dot='define'
 direntrytype='struct dirent'
 dlext='so'
 dlsrc='dl_dlopen.xs'
@@ -657,7 +669,8 @@ drand01='Perl_drand48()'
 drand48_r_proto='REENTRANT_PROTO_I_ST'
 dtrace=''
 dtraceobject=''
-dynamic_ext='B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSIX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate XS/APItest XS/Typemap arybase attributes mro re threads threads/shared'
+dtracexnolibs=''
+dynamic_ext='arybase attributes B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel/Peek Devel/PPPort Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util Math/BigInt/FastCalc MIME/Base64 mro Opcode PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog threads threads/shared Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unicode/Normalize XS/APItest XS/Typemap'
 eagain='EAGAIN'
 ebcdic='undef'
 echo='echo'
@@ -672,7 +685,7 @@ endservent_r_proto='0'
 eunicefix=':'
 exe_ext=''
 expr='expr'
-extensions='B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel/PPPort Devel/Peek Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 Math/BigInt/FastCalc NDBM_File ODBM_File Opcode POSIX PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via SDBM_File Socket Storable Sys/Hostname Sys/Syslog Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate XS/APItest XS/Typemap arybase attributes mro re threads threads/shared Archive/Tar Attribute/Handlers AutoLoader B/Debug CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Config/Perl/V Devel/SelfStubber Digest Dumpvalue Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS File/Fetch File/Find File/Path File/Temp FileCache Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP Locale/Codes Locale/Maketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata NEXT Net/Ping Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Memoize Tie/RefHash Time/Local Unicode/Normalize XSLoader autodie autouse base bignum constant encoding/warnings experimental if lib libnet parent perlfaq podlators version'
+extensions='arybase attributes B Compress/Raw/Bzip2 Compress/Raw/Zlib Cwd Data/Dumper Devel/Peek Devel/PPPort Digest/MD5 Digest/SHA Encode Fcntl File/DosGlob File/Glob Filter/Util/Call Hash/Util Hash/Util/FieldHash I18N/Langinfo IO IPC/SysV List/Util Math/BigInt/FastCalc MIME/Base64 mro Opcode PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog threads threads/shared Tie/Hash/NamedCapture Time/HiRes Time/Piece Unicode/Collate Unicode/Normalize XS/APItest XS/Typemap Archive/Tar Attribute/Handlers autodie AutoLoader autouse base B/Debug bignum Carp Config/Perl/V constant CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Devel/SelfStubber Digest Dumpvalue encoding/warnings Env Errno experimental Exporter ExtUtils/CBuilder ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS FileCache File/Fetch File/Find File/Path File/Temp Filter/Simple Getopt/Long HTTP/Tiny I18N/Collate I18N/LangTags if IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 JSON/PP lib libnet Locale/Codes Locale/Maketext Locale/Maketext/Simple Math/BigInt Math/BigRat Math/Complex Memoize Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata Net/Ping NEXT Params/Check parent perlfaq PerlIO/via/QuotedPrint Perl/OSType Pod/Checker Pod/Escapes Pod/Functions Pod/Html podlators Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage Safe Search/Dict SelfLoader Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Memoize Tie/RefHash Time/Local version XSLoader'
 extern_C='extern'
 extras=''
 fflushNULL='define'
@@ -689,7 +702,7 @@ full_csh='csh'
 full_sed='sed'
 gccansipedantic=''
 gccosandvers=''
-gccversion='4.9.2'
+gccversion='8.2.0'
 getgrent_r_proto='REENTRANT_PROTO_I_SBWR'
 getgrgid_r_proto='REENTRANT_PROTO_I_TSBWR'
 getgrnam_r_proto='REENTRANT_PROTO_I_CSBWR'
@@ -717,7 +730,7 @@ gidtype='gid_t'
 glibpth='@EXECPREFIX@/shlib  @BASELIBDIR@ @LIBDIR@ @LIBDIR@/386 @BASELIBDIR@386 @EXECPREFIX@/ccs@BASELIBDIR@ @EXECPREFIX@/ucblib @EXECPREFIX@/local@BASELIBDIR@ @BASELIBDIR@ @LIBDIR@ @EXECPREFIX@/local@BASELIBDIR@ '
 gmake='gmake'
 gmtime_r_proto='REENTRANT_PROTO_S_TS'
-gnulibc_version='2.21'
+gnulibc_version='2.28'
 grep='grep'
 groupcat='cat /etc/group'
 groupstype='gid_t'
@@ -736,13 +749,10 @@ html3direxp=''
 i16size='2'
 i16type='short'
 i32size='4'
-i32type='int'
 i64size='8'
-i64type='long'
 i8size='1'
 i8type='signed char'
 i_arpainet='define'
-i_assert='define'
 i_bfd='define'
 i_bsdioctl=''
 i_crypt='define'
@@ -753,7 +763,6 @@ i_dlfcn='define'
 i_execinfo='define'
 i_fcntl='undef'
 i_fenv='define'
-i_float='define'
 i_fp='undef'
 i_fp_class='undef'
 i_gdbm='undef'
@@ -764,13 +773,10 @@ i_ieeefp='undef'
 i_inttypes='define'
 i_langinfo='define'
 i_libutil='undef'
-i_limits='define'
 i_locale='define'
 i_machcthr='undef'
 i_malloc='define'
 i_mallocmalloc='undef'
-i_math='define'
-i_memory='undef'
 i_mntent='define'
 i_ndbm='undef'
 i_netdb='define'
@@ -786,12 +792,9 @@ i_rpcsvcdbm='undef'
 i_sgtty='undef'
 i_shadow='define'
 i_socks='undef'
-i_stdarg='define'
 i_stdbool='define'
-i_stddef='define'
 i_stdint='define'
 i_stdlib='define'
-i_string='define'
 i_sunmath='undef'
 i_sysaccess='undef'
 i_sysdir='define'
@@ -828,50 +831,48 @@ i_time='define'
 i_unistd='define'
 i_ustat='define'
 i_utime='define'
-i_values='define'
-i_varargs='undef'
-i_varhdr='stdarg.h'
 i_vfork='undef'
+i_wchar='define'
+i_xlocale='undef'
 ignore_versioned_solibs='y'
 inc_version_list=' '
 inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='@USRBIN@'
-installarchlib='@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
+installarchlib='@LIBDIR@/perl/5.28.1/@ARCH@-thread-multi'
 installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
-installman1dir=''
-installman3dir=''
+installman1dir='@MANDIR@/man1'
+installman3dir='@MANDIR@/man3'
 installprefix='@EXECPREFIX@'
 installprefixexp='@EXECPREFIX@'
-installprivlib='@LIBDIR@/perl/5.24.4'
+installprivlib='@LIBDIR@/perl/5.28.1'
 installscript='@USRBIN@'
-installsitearch='@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
+installsitearch='@LIBDIR@/perl/site_perl/5.28.1/@ARCH@-thread-multi'
 installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@LIBDIR@/perl/site_perl/5.24.4'
-installsiteman1dir=''
-installsiteman3dir=''
+installsitelib='@LIBDIR@/perl/site_perl/5.28.1'
+installsiteman1dir='@MANDIR@/man1'
+installsiteman3dir='@MANDIR@/man3'
 installsitescript='@USRBIN@'
 installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.28.1/@ARCH@-thread-multi'
 installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.4'
-installvendorman1dir=''
-installvendorman3dir=''
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.28.1'
+installvendorman1dir='@MANDIR@/man1'
+installvendorman3dir='@MANDIR@/man3'
 installvendorscript='@USRBIN@'
 intsize='4'
 issymlink='test -h'
 ivdformat='"ld"'
-ivsize='8'
 ivtype='long'
-known_extensions='Archive/Tar Attribute/Handlers AutoLoader B B/Debug CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Carp Compress/Raw/Bzip2 Compress/Raw/Zlib Config/Perl/V Cwd DB_File Data/Dumper Devel/PPPort Devel/Peek Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode Env Errno Exporter ExtUtils/CBuilder ExtUtils/Command ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS Fcntl File/DosGlob File/Fetch File/Find File/Glob File/Path File/Temp FileCache Filter/Simple Filter/Util/Call GDBM_File Getopt/Long HTTP/Tiny Hash/Util Hash/Util/FieldHash I18N/Collate I18N/LangTags I18N/Langinfo IO IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/SysV JSON/PP List/Util Locale/Codes Locale/Maketext Locale/Maketext/Simple MIME/Base64 Math/BigInt Math/BigInt/FastCalc Math/BigRat Math/Complex Memoize Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata NDBM_File NEXT Net/Ping ODBM_File Opcode POSIX Params/Check Parse/CPAN/Meta Perl/OSType PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via PerlIO/via/QuotedPrint Pod/Checker Pod/Escapes Pod/Functions Pod/Html Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage SDBM_File Safe Search/Dict SelfLoader Socket Storable Sys/Hostname Sys/Syslog Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue Thread/Semaphore Tie/File Tie/Hash/NamedCapture Tie/Memoize Tie/RefHash Time/HiRes Time/Local Time/Piece Unicode/Collate Unicode/Normalize VMS/DCLsym VMS/Filespec VMS/Stdio Win32 Win32API/File Win32CORE XS/APItest XS/Typemap XSLoader arybase attributes autodie autouse base bignum constant encoding/warnings experimental if lib libnet mro parent perlfaq podlators re threads threads/shared version '
+known_extensions='Amiga/ARexx Amiga/Exec Archive/Tar arybase Attribute/Handlers attributes autodie AutoLoader autouse B base B/Debug bignum Carp Compress/Raw/Bzip2 Compress/Raw/Zlib Config/Perl/V constant CPAN CPAN/Meta CPAN/Meta/Requirements CPAN/Meta/YAML Cwd Data/Dumper DB_File Devel/Peek Devel/PPPort Devel/SelfStubber Digest Digest/MD5 Digest/SHA Dumpvalue Encode encoding/warnings Env Errno experimental Exporter ExtUtils/CBuilder ExtUtils/Constant ExtUtils/Install ExtUtils/MakeMaker ExtUtils/Manifest ExtUtils/Miniperl ExtUtils/ParseXS Fcntl FileCache File/DosGlob File/Fetch File/Find File/Glob File/Path File/Temp Filter/Simple Filter/Util/Call GDBM_File Getopt/Long Hash/Util Hash/Util/FieldHash HTTP/Tiny I18N/Collate I18N/Langinfo I18N/LangTags if IO IO/Compress IO/Socket/IP IO/Zlib IPC/Cmd IPC/Open3 IPC/SysV JSON/PP lib libnet List/Util Locale/Codes Locale/Maketext Locale/Maketext/Simple Math/BigInt Math/BigInt/FastCalc Math/BigRat Math/Complex Memoize MIME/Base64 Module/CoreList Module/Load Module/Load/Conditional Module/Loaded Module/Metadata mro NDBM_File Net/Ping NEXT ODBM_File Opcode Params/Check parent perlfaq PerlIO/encoding PerlIO/mmap PerlIO/scalar PerlIO/via PerlIO/via/QuotedPrint Perl/OSType Pod/Checker Pod/Escapes Pod/Functions Pod/Html podlators Pod/Parser Pod/Perldoc Pod/Simple Pod/Usage POSIX re Safe SDBM_File Search/Dict SelfLoader Socket Storable Sys/Hostname Sys/Syslog Term/ANSIColor Term/Cap Term/Complete Term/ReadLine Test Test/Harness Test/Simple Text/Abbrev Text/Balanced Text/ParseWords Text/Tabs Thread/Queue threads Thread/Semaphore threads/shared Tie/File Tie/Hash/NamedCapture Tie/Memoize Tie/RefHash Time/HiRes Time/Local Time/Piece Unicode/Collate Unicode/Normalize version VMS/DCLsym VMS/Filespec VMS/Stdio Win32 Win32API/File Win32CORE XS/APItest XSLoader XS/Typemap '
 ksh=''
 ld='gcc'
 ld_can_script='define'
@@ -881,7 +882,7 @@ ldflags_uselargefiles=''
 ldlibpthname='LD_LIBRARY_PATH'
 less='less'
 lib_ext='.a'
-libc='libc-2.21.so'
+libc='libc-2.28.so'
 libperl='libperl.so'
 libpth='@LIBDIR@ @BASELIBDIR@'
 libs='-lpthread -lnsl -lgdbm -ldb -ldl -lm -lcrypt -lutil -lc -lgdbm_compat'
@@ -905,7 +906,6 @@ longdblmantbits='64'
 longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xff, 0xff, 0x32, 0xf7'
 longdblsize='16'
 longlongsize='8'
-longsize='8'
 lp=''
 lpr=''
 ls='ls'
@@ -918,12 +918,12 @@ make_set_make='#'
 mallocobj=''
 mallocsrc=''
 malloctype='void *'
-man1dir=' '
-man1direxp=''
-man1ext='0'
-man3dir=' '
-man3direxp=''
-man3ext='0'
+man1dir='@MANDIR@/man1'
+man1direxp='@MANDIR@/man1'
+man1ext='1'
+man3dir='@MANDIR@/man3'
+man3direxp='@MANDIR@/man3'
+man3ext='3'
 mips_type=''
 mistrustnm=''
 mkdir='mkdir'
@@ -937,9 +937,9 @@ mydomain='.localdomain'
 myhostname='localhost'
 myuname='linux qemux86-64 3.19.5-yocto-standard #1 smp preempt tue jun 16 00:28:17 pdt 2015 x86_64 gnulinux '
 n='-n'
-need_va_copy='define'
+need_va_copy='undef'
 netdb_hlen_type='size_t'
-netdb_host_type='char *'
+netdb_host_type='const void *'
 netdb_name_type='const char *'
 netdb_net_type='in_addr_t'
 nm='nm'
@@ -951,7 +951,6 @@ nvEUformat='"E"'
 nvFUformat='"F"'
 nvGUformat='"G"'
 nv_overflows_integers_at='256.0*256.0*256.0*256.0*256.0*256.0*2.0*2.0*2.0*2.0*2.0'
-nv_preserves_uv_bits='53'
 nveformat='"e"'
 nvfformat='"f"'
 nvgformat='"g"'
@@ -965,11 +964,11 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='3.19.5-yocto-standard'
-otherlibdirs='@LIBDIR@/perl/5.24.4'
+otherlibdirs='@LIBDIR@/perl/5.28.1'
 package='perl'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
-patchlevel='24'
+patchlevel='28'
 path_sep=':'
 perl5='@USRBIN@/perl'
 perl='perl'
@@ -986,13 +985,9 @@ pmake=''
 pr=''
 prefix='@EXECPREFIX@'
 prefixexp='@EXECPREFIX@'
-privlib='@LIBDIR@/perl/5.24.4'
-privlibexp='@LIBDIR@/perl/5.24.4'
+privlib='@LIBDIR@/perl/5.28.1'
+privlibexp='@LIBDIR@/perl/5.28.1'
 procselfexe='"/proc/self/exe"'
-prototype='define'
-ptrsize='8'
-quadkind='2'
-quadtype='long'
 randbits='48'
 randfunc='Perl_drand48'
 random_r_proto='REENTRANT_PROTO_I_St'
@@ -1007,29 +1002,11 @@ rm_try='/bin/rm -f try try a.out .out try.[cho] try..o core core.try* try.core*'
 rmail=''
 run=''
 runnm='false'
-sGMTIME_max='67768036191676799'
-sGMTIME_min='-62167219200'
-sLOCALTIME_max='67768036191676799'
-sLOCALTIME_min='-62167219200'
-sPRIEUldbl='"LE"'
-sPRIFUldbl='"LF"'
-sPRIGUldbl='"LG"'
-sPRIXU64='"lX"'
-sPRId64='"ld"'
-sPRIeldbl='"Le"'
-sPRIfldbl='"Lf"'
-sPRIgldbl='"Lg"'
-sPRIi64='"li"'
-sPRIo64='"lo"'
-sPRIu64='"lu"'
-sPRIx64='"lx"'
-sSCNfldbl='"Lf"'
 sched_yield='sched_yield()'
 scriptdir='@USRBIN@'
 scriptdirexp='@USRBIN@'
 sed='sed'
 seedfunc='Perl_drand48_init'
-selectminbits='64'
 selecttype='fd_set *'
 sendmail=''
 setgrent_r_proto='0'
@@ -1053,26 +1030,25 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
-sitearchexp='@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
+sitearch='@LIBDIR@/perl/site_perl/5.28.1/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.28.1/@ARCH@-thread-multi'
 sitebin='@USRBIN@'
 sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='@LIBDIR@/perl/site_perl/5.24.4'
+sitelib='@LIBDIR@/perl/site_perl/5.28.1'
 sitelib_stem='@LIBDIR@/perl/site_perl'
-sitelibexp='@LIBDIR@/perl/site_perl/5.24.4'
-siteman1dir=''
-siteman1direxp=''
-siteman3dir=''
-siteman3direxp=''
+sitelibexp='@LIBDIR@/perl/site_perl/5.28.1'
+siteman1dir='@MANDIR@/man1'
+siteman1direxp='@MANDIR@/man1'
+siteman3dir='@MANDIR@/man3'
+siteman3direxp='@MANDIR@/man3'
 siteprefix='@EXECPREFIX@'
 siteprefixexp='@EXECPREFIX@'
 sitescript='@USRBIN@'
 sitescriptexp='@USRBIN@'
-sizesize='8'
 sizetype='size_t'
 sleep=''
 smail=''
@@ -1100,9 +1076,8 @@ stdio_filbuf=''
 stdio_ptr='((fp)->_IO_read_ptr)'
 stdio_stream_array=''
 strerror_r_proto='REENTRANT_PROTO_B_IBW'
-strings='@INCLUDEDIR@/string.h'
 submit=''
-subversion='4'
+subversion='0'
 sysman='@EXECPREFIX@/share/man/man1'
 sysroot=''
 tail=''
@@ -1129,18 +1104,14 @@ ttyname_r_proto='REENTRANT_PROTO_I_IBW'
 u16size='2'
 u16type='unsigned short'
 u32size='4'
-u32type='unsigned int'
 u64size='8'
-u64type='unsigned long'
 u8size='1'
 u8type='unsigned char'
-uidformat='"u"'
 uidsign='1'
 uidsize='4'
 uidtype='uid_t'
 uname='uname'
 uniq='uniq'
-uquadtype='unsigned long'
 use5005threads='undef'
 use64bitall='undef'
 use64bitint='undef'
@@ -1152,6 +1123,7 @@ usedtrace='undef'
 usefaststdio='undef'
 useithreads='define'
 usekernprocpathname='undef'
+uselanginfo='true'
 uselargefiles='define'
 uselongdouble='undef'
 usemallocwrap='define'
@@ -1177,32 +1149,31 @@ usrinc='@INCLUDEDIR@'
 uuname=''
 uvXUformat='"lX"'
 uvoformat='"lo"'
-uvsize='8'
 uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
-vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.28.1/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.28.1/@ARCH@-thread-multi'
 vendorbin='@USRBIN@'
 vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='@LIBDIR@/perl/vendor_perl/5.24.4'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.28.1'
 vendorlib_stem='@LIBDIR@/perl/vendor_perl'
-vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.4'
-vendorman1dir=' '
-vendorman1direxp=''
-vendorman3dir=' '
-vendorman3direxp=''
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.28.1'
+vendorman1dir='@MANDIR@/man1'
+vendorman1direxp='@MANDIR@/man1'
+vendorman3dir='@MANDIR@/man3'
+vendorman3direxp='@MANDIR@/man3'
 vendorprefix='@EXECPREFIX@'
 vendorprefixexp='@EXECPREFIX@'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
-version='5.24.4'
-version_patchlevel_string='version 24 subversion 4'
+version='5.28.1'
+version_patchlevel_string='version 28 subversion 1'
 versiononly='undef'
 vi=''
 xlibpth='@LIBDIR@/386 @BASELIBDIR@386'
@@ -1211,11 +1182,11 @@ yaccflags=''
 zcat=''
 zip='zip'
 PERL_REVISION=5
-PERL_VERSION=24
-PERL_SUBVERSION=4
+PERL_VERSION=28
+PERL_SUBVERSION=1
 PERL_API_REVISION=5
-PERL_API_VERSION=24
-PERL_API_SUBVERSION=4
+PERL_API_VERSION=28
+PERL_API_SUBVERSION=1
 PERL_PATCHLEVEL=''
 PERL_CONFIG_SH=true
 : Variables propagated from previous config.sh file.
@@ -1229,12 +1200,13 @@ d_clock='define'
 d_nanosleep='define'
 
 # for Signinfo
+d_siginfo_si_addr='define'
+d_siginfo_si_band='define'
 d_siginfo_si_errno='define'
+d_siginfo_si_fd='define'
 d_siginfo_si_pid='define'
-d_siginfo_si_uid='define'
-d_siginfo_si_addr='define'
 d_siginfo_si_status='define'
-d_siginfo_si_band='define'
+d_siginfo_si_uid='define'
 d_siginfo_si_value='define'
 
 # don't support fdclose
diff --git a/meta/recipes-devtools/perl/perl/config.sh-32 b/meta/recipes-devtools/perl/perl/config.sh-32
index 7259a0c6ae..270d9a522f 100644
--- a/meta/recipes-devtools/perl/perl/config.sh-32
+++ b/meta/recipes-devtools/perl/perl/config.sh-32
@@ -21,12 +21,19 @@ sGMTIME_max='2147483647'
 sGMTIME_min='-2147483648'
 sLOCALTIME_max='2147483647'
 sLOCALTIME_min='-2147483648'
+sPRIEUldbl='"E"'
+sPRIFUldbl='"F"'
+sPRIGUldbl='"G"'
 sPRIXU64='"LX"'
 sPRId64='"Ld"'
+sPRIeldbl='"e"'
+sPRIfldbl='"f"'
+sPRIgldbl='"g"'
 sPRIi64='"Li"'
 sPRIo64='"Lo"'
 sPRIu64='"Lu"'
 sPRIx64='"Lx"'
+sSCNfldbl='"f"'
 selectminbits='32'
 sizesize='4'
 u32type='unsigned long'
diff --git a/meta/recipes-devtools/perl/perl/config.sh-64 b/meta/recipes-devtools/perl/perl/config.sh-64
index 6929d3a09d..32ff355e60 100644
--- a/meta/recipes-devtools/perl/perl/config.sh-64
+++ b/meta/recipes-devtools/perl/perl/config.sh-64
@@ -23,10 +23,14 @@ sLOCALTIME_max='67768036191676799'
 sLOCALTIME_min='-62167219200'
 sPRIXU64='"lX"'
 sPRId64='"ld"'
+sPRIeldbl='"Le"'
+sPRIfldbl='"Lf"'
+sPRIgldbl='"Lg"'
 sPRIi64='"li"'
 sPRIo64='"lo"'
 sPRIu64='"lu"'
 sPRIx64='"lx"'
+sSCNfldbl='"Lf"'
 selectminbits='64'
 sizesize='8'
 u32type='unsigned int'
diff --git a/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
index c597701cad..5df228a1c9 100644
--- a/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/cpan-missing-site-dirs.diff
@@ -1,4 +1,4 @@
-From d33d46963035ef726144dc66be2ae9c00aec0333 Mon Sep 17 00:00:00 2001
+From 3c05a994e7a2f4589c0cbc580435bc28aead0c2b Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Tue, 16 Oct 2012 23:07:56 +0300
 Subject: Fix CPAN::FirstTime defaults with nonexisting site dirs if a parent
@@ -13,16 +13,15 @@ explicitly tell CPAN not to touch those with INSTALLDIRS=site.
 
 Bug-Debian: http://bugs.debian.org/688842
 Patch-Name: debian/cpan-missing-site-dirs.diff
-Upstream-Status: Pending
 ---
  cpan/CPAN/lib/CPAN/FirstTime.pm | 31 +++++++++++++++++++++++++++----
  1 file changed, 27 insertions(+), 4 deletions(-)
 
 diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstTime.pm
-index 33054cd..7b0becf 100644
+index cdf1dc220d..bdb7899bb9 100644
 --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
 +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
-@@ -2057,11 +2057,34 @@ sub _print_urllist {
+@@ -2067,11 +2067,34 @@ sub _print_urllist {
      };
  }
  
diff --git a/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
index 572f149514..571bd437fa 100644
--- a/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/cpan_definstalldirs.diff
@@ -1,4 +1,4 @@
-From 5ff1f21484aab68efe321ff4ba5d35928f72af96 Mon Sep 17 00:00:00 2001
+From d82a2fb804e409d6926b86ed22d35405dcfe5782 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Provide a sensible INSTALLDIRS default for modules installed from
@@ -9,16 +9,15 @@ explicitly in Makefile.PL or Build.PL.  This makes sense for the normal @INC
 ordering, but not ours.
 
 Patch-Name: debian/cpan_definstalldirs.diff
-Upstream-Status: Pending
 ---
  cpan/CPAN/lib/CPAN/FirstTime.pm | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cpan/CPAN/lib/CPAN/FirstTime.pm b/cpan/CPAN/lib/CPAN/FirstTime.pm
-index 918e009..33054cd 100644
+index 49fa8ab7b9..cdf1dc220d 100644
 --- a/cpan/CPAN/lib/CPAN/FirstTime.pm
 +++ b/cpan/CPAN/lib/CPAN/FirstTime.pm
-@@ -1024,7 +1024,7 @@ sub init {
+@@ -1033,7 +1033,7 @@ sub init {
      my_prompt_loop(prefer_installer => 'MB', $matcher, 'MB|EUMM|RAND');
  
      if (!$matcher or 'makepl_arg make_arg' =~ /$matcher/) {
@@ -27,7 +26,7 @@ index 918e009..33054cd 100644
          my_dflt_prompt(make_arg => "", $matcher);
          if ( $CPAN::Config->{makepl_arg} =~ /LIBS=|INC=/ ) {
              $CPAN::Frontend->mywarn(
-@@ -1056,7 +1056,7 @@ sub init {
+@@ -1065,7 +1065,7 @@ sub init {
      my_dflt_prompt(make_install_arg => $CPAN::Config->{make_arg} || "",
                     $matcher);
  
diff --git a/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
index 0861650eb6..e999e32e40 100644
--- a/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/db_file_ver.diff
@@ -1,4 +1,4 @@
-From 01421f8a80d5c623959695ba2b8167f30112d333 Mon Sep 17 00:00:00 2001
+From a8c4fb70b9168e6b910c4a3ea33cdc721528ae25 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
 Subject: Remove overly restrictive DB_File version check.
@@ -8,13 +8,12 @@ Bug-Debian: http://bugs.debian.org/340047
 Package dependencies ensure the correct library is linked at run-time.
 
 Patch-Name: debian/db_file_ver.diff
-Upstream-Status: Pending
 ---
  cpan/DB_File/version.c | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/cpan/DB_File/version.c b/cpan/DB_File/version.c
-index e01f6f6..544e6ee 100644
+index e01f6f6fa3..544e6ee8fb 100644
 --- a/cpan/DB_File/version.c
 +++ b/cpan/DB_File/version.c
 @@ -48,6 +48,7 @@ __getBerkeleyDBInfo()
diff --git a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
index c2ac4a3bdf..64ae29c7d2 100644
--- a/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
+++ b/meta/recipes-devtools/perl/perl/debian/deprecate-with-apt.diff
@@ -1,30 +1,19 @@
-From def4aa3817f98aae625e601b791ef068276f05d5 Mon Sep 17 00:00:00 2001
+From 6d9c5d63057b9a3abb6831277ac3ed8df03626c9 Mon Sep 17 00:00:00 2001
 From: Dominic Hargreaves <dom@earth.li>
 Date: Mon, 17 May 2010 13:23:07 +0300
 Subject: Point users to Debian packages of deprecated core modules
 
 Bug-Debian: http://bugs.debian.org/747628
-
-Several modules are being deprecated with perl 5.20.
-To get a clean transition, perl/perl-modules is going to recommend the
-separate Debian packages of these for one release cycle so that they will be
-pulled in by default on upgrades. This is taking place for perl 5.20/jessie.
-
-However, on systems configured to ignore recommendations the deprecation
-warnings will still be useful, so modify them slightly to point to the
-separate packages instead.
-
 Patch-Name: debian/deprecate-with-apt.diff
-Upstream-Status: Pending
 ---
- lib/deprecate.pm | 15 ++++++++++++++-
- 1 file changed, 14 insertions(+), 1 deletion(-)
+ lib/deprecate.pm | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
 
 diff --git a/lib/deprecate.pm b/lib/deprecate.pm
-index 47bc112..b0c61df 100644
+index 47bc11253e..01d48fa6cc 100644
 --- a/lib/deprecate.pm
 +++ b/lib/deprecate.pm
-@@ -7,6 +7,13 @@ our $VERSION = 0.03;
+@@ -7,6 +7,16 @@ our $VERSION = 0.03;
  our %Config;
  unless (%Config) { require Config; *Config = \%Config::Config; }
  
@@ -32,13 +21,16 @@ index 47bc112..b0c61df 100644
 +# deprecated modules where available
 +
 +our %DEBIAN_PACKAGES = (
-+    # None for the perl 5.22 cycle
++    'B::Debug'         => 'libb-debug-perl',
++    'Locale::Codes'    => 'liblocale-codes-perl',
++    'Locale::Country'  => 'liblocale-codes-perl',
++    'Locale::Language' => 'liblocale-codes-perl',
 +);
 +
  # This isn't a public API. It's internal to code maintained by the perl-porters
  # If you would like it to be a public API, please send a patch with
  # documentation and tests. Until then, it may change without warning.
-@@ -58,9 +65,15 @@ EOM
+@@ -58,9 +68,15 @@ EOM
  	if (defined $callers_bitmask
  	    && (vec($callers_bitmask, $warnings::Offsets{deprecated}, 1)
  		|| vec($callers_bitmask, $warnings::Offsets{all}, 1))) {
diff --git a/meta/recipes-devtools/perl/perl/debian/disable-stack-check.diff b/meta/recipes-devtools/perl/perl/debian/disable-stack-check.diff
new file mode 100644
index 0000000000..028482b96b
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/disable-stack-check.diff
@@ -0,0 +1,64 @@
+From de667616518666b10f9bf5eb1a34e82eacc12f70 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Mon, 16 Jul 2018 10:12:37 +0300
+Subject: Disable debugperl stack extension checks for binary compatibility
+ with perl
+
+When an XS module is built without -DDEBUGGING but the interpreter is,
+the debugging stack high-water mark checking on the interpreter side
+doesn't work properly. This makes /usr/bin/debugperl less useful than
+it could be as it can no longer use many XS module packages.
+
+Patch the check away for now. We hope upstream will provide a Configure
+option for this in the future.
+
+Bug: https://rt.perl.org/Ticket/Display.html?id=133327
+Bug-Debian: https://bugs.debian.org/902779
+Patch-Name: debian/disable-stack-check.diff
+---
+ dump.c   | 3 +++
+ pp_hot.c | 3 +++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/dump.c b/dump.c
+index 227eb996ee..4e1c594ce8 100644
+--- a/dump.c
++++ b/dump.c
+@@ -2500,6 +2500,8 @@ Perl_runops_debug(pTHX)
+         ++PL_op_exec_cnt[PL_op->op_type];
+ #endif
+ #if defined DEBUGGING && !defined DEBUGGING_RE_ONLY
++/* disabled on Debian due to https://bugs.debian.org/902779 */
++#ifndef DEBIAN
+         if (PL_curstackinfo->si_stack_hwm < PL_stack_sp - PL_stack_base)
+             Perl_croak_nocontext(
+                 "panic: previous op failed to extend arg stack: "
+@@ -2508,6 +2510,7 @@ Perl_runops_debug(pTHX)
+                     PL_stack_base + PL_curstackinfo->si_stack_hwm);
+         PL_curstackinfo->si_stack_hwm = PL_stack_sp - PL_stack_base;
+ #endif
++#endif
+ 	if (PL_debug) {
+             ENTER;
+             SAVETMPS;
+diff --git a/pp_hot.c b/pp_hot.c
+index 56e3cbe6e1..f4e1ae726d 100644
+--- a/pp_hot.c
++++ b/pp_hot.c
+@@ -5232,6 +5232,8 @@ PP(pp_entersub)
+ 	CvXSUB(cv)(aTHX_ cv);
+ 
+ #if defined DEBUGGING && !defined DEBUGGING_RE_ONLY
++/* disabled on Debian due to https://bugs.debian.org/902779 */
++#ifndef DEBIAN
+         /* This duplicates the check done in runops_debug(), but provides more
+          * information in the common case of the fault being with an XSUB.
+          *
+@@ -5246,6 +5248,7 @@ PP(pp_entersub)
+                     PL_stack_base, PL_stack_sp,
+                     PL_stack_base + PL_curstackinfo->si_stack_hwm);
+ #endif
++#endif
+ 	/* Enforce some sanity in scalar context. */
+ 	if (is_scalar) {
+             SV **svp = PL_stack_base + markix + 1;
diff --git a/meta/recipes-devtools/perl/perl/debian/doc_info.diff b/meta/recipes-devtools/perl/perl/debian/doc_info.diff
index 4662ecdaa7..2fa047b7f1 100644
--- a/meta/recipes-devtools/perl/perl/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl/debian/doc_info.diff
@@ -1,4 +1,4 @@
-From e18f81e69c55d698abd293e71063d6b6b275cc07 Mon Sep 17 00:00:00 2001
+From a4ee6a17c070dc88058b6133b0c43b8d67ffa095 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Replace generic man(1) instructions with Debian-specific information.
@@ -6,16 +6,15 @@ Subject: Replace generic man(1) instructions with Debian-specific information.
 Indicate that the user needs to install the perl-doc package.
 
 Patch-Name: debian/doc_info.diff
-Upstream-Status: Pending
 ---
  pod/perl.pod | 12 ++++++++++--
  1 file changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/pod/perl.pod b/pod/perl.pod
-index 364e957..f97e103 100644
+index fbbb952b6b..bc0f531f86 100644
 --- a/pod/perl.pod
 +++ b/pod/perl.pod
-@@ -291,8 +291,16 @@ aux c2ph h2ph h2xs perlbug pl2pm pod2html pod2man splain xsubpp
+@@ -295,8 +295,16 @@ aux h2ph h2xs perlbug pl2pm pod2html pod2man splain xsubpp
  
  =for buildtoc __END__
  
diff --git a/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
index b3bd58c1d1..c91c2b14cb 100644
--- a/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/enc2xs_inc.diff
@@ -1,4 +1,4 @@
-From 7fe59a3d0601c6d8634eae4f99dae3024cd02a92 Mon Sep 17 00:00:00 2001
+From cf3a5c34a66f3aa2c07102c1ecae3a0f9958d601 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Tweak enc2xs to follow symlinks and ignore missing @INC directories.
@@ -11,17 +11,16 @@ Bug-Debian: http://bugs.debian.org/290336
   issues with follow => 1 (see #603686 and [rt.cpan.org #64585])
 
 Patch-Name: debian/enc2xs_inc.diff
-Upstream-Status: Pending
 ---
  cpan/Encode/bin/enc2xs | 8 ++++----
  t/porting/customized.t | 3 +++
  2 files changed, 7 insertions(+), 4 deletions(-)
 
 diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
-index 19f2b2b..4d64e38 100644
+index 619b64b757..050c863ef9 100644
 --- a/cpan/Encode/bin/enc2xs
 +++ b/cpan/Encode/bin/enc2xs
-@@ -944,11 +944,11 @@ use vars qw(
+@@ -1013,11 +1013,11 @@ use vars qw(
  sub find_e2x{
      eval { require File::Find; };
      my (@inc, %e2x_dir);
@@ -35,7 +34,7 @@ index 19f2b2b..4d64e38 100644
           my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
               $atime,$mtime,$ctime,$blksize,$blocks)
               = lstat($_) or return;
-@@ -958,7 +958,7 @@ sub find_e2x{
+@@ -1027,7 +1027,7 @@ sub find_e2x{
               $e2x_dir{$File::Find::dir} ||= $mtime;
           }
           return;
@@ -44,7 +43,7 @@ index 19f2b2b..4d64e38 100644
      warn join("\n", keys %e2x_dir), "\n";
      for my $d (sort {$e2x_dir{$a} <=> $e2x_dir{$b}} keys %e2x_dir){
      $_E2X = $d;
-@@ -1025,7 +1025,7 @@ sub make_configlocal_pm {
+@@ -1091,7 +1091,7 @@ sub make_configlocal_pm {
  	    $LocalMod{$enc} ||= $mod;
  	}
      };
@@ -54,10 +53,10 @@ index 19f2b2b..4d64e38 100644
      for my $enc ( sort keys %LocalMod ) {
          $_ModLines .=
 diff --git a/t/porting/customized.t b/t/porting/customized.t
-index 45fcafb..3bd6adb 100644
+index d425e5b775..d906a82553 100644
 --- a/t/porting/customized.t
 +++ b/t/porting/customized.t
-@@ -101,8 +101,11 @@ foreach my $module ( sort keys %Modules ) {
+@@ -108,8 +108,11 @@ foreach my $module ( sort keys %Modules ) {
        print $data_fh join(' ', $module, $file, $id), "\n";
        next;
      }
diff --git a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
index a965fbeeec..1a09f063f7 100644
--- a/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl/debian/errno_ver.diff
@@ -1,8 +1,8 @@
-From 8e1efba7560d8d55524c7a0f1b0539ddce419b86 Mon Sep 17 00:00:00 2001
+From bc115c4fc6804981531156ab87ef4ab1d99d6a60 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 16 Dec 2005 01:32:14 +1100
-Subject: [PATCH 6/8] Remove Errno version check due to upgrade problems with
- long-running processes.
+Subject: Remove Errno version check due to upgrade problems with long-running
+ processes.
 
 Bug-Debian: http://bugs.debian.org/343351
 
@@ -11,27 +11,34 @@ processes embedding perl when upgrading to a newer version,
 compatible, but built on a different machine.
 
 Patch-Name: debian/errno_ver.diff
-Upstream-Status: Pending
 ---
- ext/Errno/Errno_pm.PL | 5 -----
- 1 file changed, 5 deletions(-)
+ ext/Errno/Errno_pm.PL | 16 ----------------
+ 1 file changed, 16 deletions(-)
 
 diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
-index 6251a3c..eeed445 100644
+index d565f31b2f..6a0031f0f7 100644
 --- a/ext/Errno/Errno_pm.PL
 +++ b/ext/Errno/Errno_pm.PL
-@@ -294,11 +294,6 @@ EDQ
-     # they've already declared perl doesn't need to worry about this risk.
-     if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
-         print <<"CONFIG_CHECK_END";
+@@ -288,22 +288,6 @@ package Errno;
+ require Exporter;
+ use strict;
+ 
+-EDQ
+-
+-    # Errno only needs Config to make sure it hasn't changed platforms.
+-    # If someone set $ENV{PERL_BUILD_EXPAND_CONFIG_VARS} at build time,
+-    # they've already declared perl doesn't need to worry about this risk.
+-    if(!$ENV{'PERL_BUILD_EXPAND_CONFIG_VARS'}) {
+-        print <<"CONFIG_CHECK_END";
 -use Config;
 -"\$Config{'archname'}-\$Config{'osvers'}" eq
 -"$archname-$Config{'osvers'}" or
 -	die "Errno architecture ($archname-$Config{'osvers'}) does not match executable architecture (\$Config{'archname'}-\$Config{'osvers'})";
 -
- CONFIG_CHECK_END
- }
- 
--- 
-2.1.4
-
+-CONFIG_CHECK_END
+-}
+-
+-    print <<"EDQ";
+ our \$VERSION = "$VERSION";
+ \$VERSION = eval \$VERSION;
+ our \@ISA = 'Exporter';
diff --git a/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
index e023038f04..3b9b715fbb 100644
--- a/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/extutils_set_libperl_path.diff
@@ -1,4 +1,4 @@
-From 431275078b0490d2e092442d9582be06bb95b354 Mon Sep 17 00:00:00 2001
+From 28f28de9bef2c3329b5f39eabf16f92f51dd206b Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sat, 10 May 2014 23:34:14 +0300
 Subject: EU:MM: set location of libperl.a under /usr/lib
@@ -7,17 +7,15 @@ The Debian packaging moves libperl.a a couple of levels up from the
 CORE directory to match other static libraries.
 
 Patch-Name: debian/extutils_set_libperl_path.diff
-Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
- pp.c                                            | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 5f1b87f..570a631 100644
+index dbb8651a9f..780e390cd9 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2505,7 +2505,7 @@ MAP_PRELIBS   = $Config{perllibs} $Config{cryptlib}
+@@ -2564,7 +2564,7 @@ MAP_PRELIBS   = $Config{perllibs} $Config{cryptlib}
  	($lperl = $libperl) =~ s/\$\(A\)/$self->{LIB_EXT}/;
      }
      unless ($libperl && -f $lperl) { # Ilya's code...
@@ -26,13 +24,3 @@ index 5f1b87f..570a631 100644
  	$dir = "$self->{PERL_ARCHLIB}/.." if $self->{UNINSTALLED_PERL};
  	$libperl ||= "libperl$self->{LIB_EXT}";
  	$libperl   = "$dir/$libperl";
-diff --git a/pp.c b/pp.c
-index 42f156a..77c1279 100644
---- a/pp.c
-+++ b/pp.c
-@@ -1,4 +1,4 @@
--/*    pp.c
-+ /*    pp.c
-  *
-  *    Copyright (C) 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000,
-  *    2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008 by Larry Wall and others
diff --git a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff b/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
index bdf34d1859..c99a48fcd9 100644
--- a/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fakeroot.diff
@@ -1,4 +1,4 @@
-From 27ae7b18078d801a2c943aa6de2f7e9808177251 Mon Sep 17 00:00:00 2001
+From 97d604f7848fe04662759dd7a155c447b872524e Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Postpone LD_LIBRARY_PATH evaluation to the binary targets.
@@ -11,16 +11,15 @@ since fakeroot (which now sets LD_LIBRARY_PATH) is not used for the "build"
 rule where the Makefile is created, but is for the clean/binary* targets.
 
 Patch-Name: debian/fakeroot.diff
-Upstream-Status: Pending
 ---
  Makefile.SH | 7 ++-----
  1 file changed, 2 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.SH b/Makefile.SH
-index 034d812..04dd7d5 100755
+index 5197009290..48151bce65 100755
 --- a/Makefile.SH
 +++ b/Makefile.SH
-@@ -39,10 +39,7 @@ case "$useshrplib" in
+@@ -48,10 +48,7 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
  	# $ldlibpth so that ./perl finds *this* shared libperl.
@@ -32,7 +31,7 @@ index 034d812..04dd7d5 100755
  
  	pldlflags="$cccdlflags"
  	static_ldflags=''
-@@ -113,7 +110,7 @@ true)
+@@ -122,7 +119,7 @@ true)
  	    ;;
  	esac
  	case "$ldlibpthname" in
diff --git a/meta/recipes-devtools/perl/perl/debian/find_html2text.diff b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
index 082709140d..23fce578f5 100644
--- a/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
+++ b/meta/recipes-devtools/perl/perl/debian/find_html2text.diff
@@ -1,4 +1,4 @@
-From c81dbdedff9e9b4fb75ac028aa718838c0292d2f Mon Sep 17 00:00:00 2001
+From d5f1e24fee2bdbced40a81aa84b162c576be56d1 Mon Sep 17 00:00:00 2001
 From: Andreas Marschke <andreas.marschke@googlemail.com>
 Date: Sat, 17 Sep 2011 11:38:42 +0100
 Subject: Configure CPAN::Distribution with correct name of html2text
@@ -16,16 +16,15 @@ Please see the attached patch for a quick fix of this issue.
 [Maintainer's note: html2text in Debian is not the same implementation
 as the html2text.pl which is expected, but should provide similar
 functionality].
-Upstream-Status: Pending
 ---
  cpan/CPAN/lib/CPAN/Distribution.pm | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cpan/CPAN/lib/CPAN/Distribution.pm b/cpan/CPAN/lib/CPAN/Distribution.pm
-index 092b781..5c2bae1 100644
+index 72101afc7b..9f896584d1 100644
 --- a/cpan/CPAN/lib/CPAN/Distribution.pm
 +++ b/cpan/CPAN/lib/CPAN/Distribution.pm
-@@ -4099,7 +4099,7 @@ sub _display_url {
+@@ -4149,7 +4149,7 @@ sub _display_url {
        if $CPAN::DEBUG;
  
      # should we define it in the config instead?
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/autodie-scope.diff b/meta/recipes-devtools/perl/perl/debian/fixes/autodie-scope.diff
new file mode 100644
index 0000000000..3b3c931b21
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/autodie-scope.diff
@@ -0,0 +1,99 @@
+From 0aa6de7a7db40da75a49c2320fd77b1ef6a111d9 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Mon, 21 Dec 2015 19:20:12 +0200
+Subject: Fix a scoping issue with "no autodie" and the "system" sub
+
+Don't queue nonexisting subs for reinstalling later when
+exiting the 'no autodie' scope.
+
+FIXME: if the original sub 'can be undef for "CORE::" subs', does this
+break for those? Is that the case when $symbol =~ /::/, as guarded for
+on L566?
+
+Bug: https://github.com/pjf/autodie/issues/69
+Bug-Debian: https://bugs.debian.org/798096
+Origin: upstream, https://github.com/pjf/autodie/commit/c1b4fc4a319f8139d1cd6770bfb7b72a59ae232d
+Patch-Name: fixes/autodie-scope.diff
+---
+ cpan/autodie/lib/Fatal.pm   |  7 ++++++-
+ cpan/autodie/t/no-all.t     | 22 ++++++++++++++++++++++
+ cpan/autodie/t/no-default.t | 23 +++++++++++++++++++++++
+ 3 files changed, 51 insertions(+), 1 deletion(-)
+ create mode 100755 cpan/autodie/t/no-all.t
+ create mode 100755 cpan/autodie/t/no-default.t
+
+diff --git a/cpan/autodie/lib/Fatal.pm b/cpan/autodie/lib/Fatal.pm
+index 16e1743474..2058abdab0 100644
+--- a/cpan/autodie/lib/Fatal.pm
++++ b/cpan/autodie/lib/Fatal.pm
+@@ -580,7 +580,12 @@ sub unimport {
+         # Record the current sub to be reinstalled at end of scope
+         # and then restore the original (can be undef for "CORE::"
+         # subs)
+-        $reinstall_subs{$symbol} = \&$sub;
++
++        {
++            no strict 'refs';
++            $reinstall_subs{$symbol} = \&$sub
++                if exists ${"${pkg}::"}{$symbol};
++        }
+         $uninstall_subs{$symbol} = $Original_user_sub{$sub};
+ 
+     }
+diff --git a/cpan/autodie/t/no-all.t b/cpan/autodie/t/no-all.t
+new file mode 100755
+index 0000000000..1a503f68be
+--- /dev/null
++++ b/cpan/autodie/t/no-all.t
+@@ -0,0 +1,22 @@
++#!/usr/bin/perl
++
++package foo;
++use warnings;
++use strict;
++use Test::More tests => 1;
++use autodie qw(:all);
++
++use_system();
++ok("system() works with a lexical 'no autodie' block (github issue #69");
++
++sub break_system {
++    no autodie;
++    open(my $fh, "<", 'NONEXISTENT');
++    ok("survived failing open");
++}
++
++sub use_system {
++    system($^X, '-e' , 1);
++}
++
++1;
+diff --git a/cpan/autodie/t/no-default.t b/cpan/autodie/t/no-default.t
+new file mode 100755
+index 0000000000..44d2acf27a
+--- /dev/null
++++ b/cpan/autodie/t/no-default.t
+@@ -0,0 +1,23 @@
++#!/usr/bin/perl
++
++package foo;
++use warnings;
++use strict;
++use Test::More tests => 2;
++use autodie;
++
++
++use_system();
++ok("system() works with a lexical 'no autodie' block (github issue #69");
++break_system();
++
++sub break_system {
++    no autodie;
++    open(my $fh, "<", 'NONEXISTENT');
++    ok("survived failing open");
++}
++
++sub use_system {
++    system($^X, '-e' , 1);
++}
++1;
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/caretx-fallback.diff b/meta/recipes-devtools/perl/perl/debian/fixes/caretx-fallback.diff
new file mode 100644
index 0000000000..60bad8b59d
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/caretx-fallback.diff
@@ -0,0 +1,73 @@
+From b245a2c284a1783621cc30805af295cdf27d3a24 Mon Sep 17 00:00:00 2001
+From: Aaron Crane <arc@cpan.org>
+Date: Tue, 9 Oct 2018 14:41:10 +0100
+Subject: RT#133573: $^X fallback when platform-specific technique fails
+
+Origin: upstream, https://perl5.git.perl.org/perl.git/commit/03b94aa47e981af3c7b0118bfb11facda2b95251
+Bug: https://rt.perl.org/Public/Bug/Display.html?id=133573
+Bug-Debian: https://bugs.debian.org/913347
+Patch-Name: fixes/caretx-fallback.diff
+---
+ caretx.c | 28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/caretx.c b/caretx.c
+index d758f730de..247708de8c 100644
+--- a/caretx.c
++++ b/caretx.c
+@@ -56,7 +56,19 @@ Perl_set_caret_X(pTHX) {
+     SV *const caret_x = GvSV(tmpgv);
+ #if defined(OS2)
+     sv_setpv(caret_x, os2_execname(aTHX));
+-#elif defined(USE_KERN_PROC_PATHNAME)
++    return;
++#elif defined(WIN32)
++    char *ansi;
++    WCHAR widename[MAX_PATH];
++    GetModuleFileNameW(NULL, widename, sizeof(widename)/sizeof(WCHAR));
++    ansi = win32_ansipath(widename);
++    sv_setpv(caret_x, ansi);
++    win32_free(ansi);
++    return;
++#else
++    /* We can try a platform-specific one if possible; if it fails, or we
++     * aren't running on a suitable platform, we'll fall back to argv[0]. */
++# ifdef USE_KERN_PROC_PATHNAME
+     size_t size = 0;
+     int mib[4];
+     mib[0] = CTL_KERN;
+@@ -76,7 +88,7 @@ Perl_set_caret_X(pTHX) {
+             return;
+         }
+     }
+-#elif defined(USE_NSGETEXECUTABLEPATH)
++# elif defined(USE_NSGETEXECUTABLEPATH)
+     char buf[1];
+     uint32_t size = sizeof(buf);
+ 
+@@ -95,7 +107,7 @@ Perl_set_caret_X(pTHX) {
+             return;
+         }
+     }
+-#elif defined(HAS_PROCSELFEXE)
++# elif defined(HAS_PROCSELFEXE)
+     char buf[MAXPATHLEN];
+     SSize_t len = readlink(PROCSELFEXE_PATH, buf, sizeof(buf) - 1);
+     /* NOTE: if the length returned by readlink() is sizeof(buf) - 1,
+@@ -125,15 +137,7 @@ Perl_set_caret_X(pTHX) {
+         sv_setpvn(caret_x, buf, len);
+         return;
+     }
+-#elif defined(WIN32)
+-    char *ansi;
+-    WCHAR widename[MAX_PATH];
+-    GetModuleFileNameW(NULL, widename, sizeof(widename)/sizeof(WCHAR));
+-    ansi = win32_ansipath(widename);
+-    sv_setpv(caret_x, ansi);
+-    win32_free(ansi);
+-    return;
+-#else
++# endif
+     /* Fallback to this:  */
+     sv_setpv(caret_x, PL_origargv[0]);
+ #endif
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/cpan_web_link.diff b/meta/recipes-devtools/perl/perl/debian/fixes/cpan_web_link.diff
new file mode 100644
index 0000000000..bf1874c393
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/cpan_web_link.diff
@@ -0,0 +1,26 @@
+From 6cd49e79c96c92d10788a0f029e96f171cb961c4 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 30 Apr 2016 23:13:34 +0100
+Subject: CPAN: Add link to main CPAN web site
+
+Bug: https://github.com/andk/cpanpm/pull/96
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=367291
+Patch-Name: fixes/cpan_web_link.diff
+---
+ cpan/CPAN/lib/CPAN.pm | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/cpan/CPAN/lib/CPAN.pm b/cpan/CPAN/lib/CPAN.pm
+index 1f69119e5f..c472effe18 100644
+--- a/cpan/CPAN/lib/CPAN.pm
++++ b/cpan/CPAN/lib/CPAN.pm
+@@ -3990,6 +3990,9 @@ your operating system) then typing C<cpan> in a console window will
+ work for you as well. Above that the utility provides several
+ commandline shortcuts.
+ 
++The main CPAN website, which includes general information about the
++service, is at L<http://www.cpan.org/>.
++
+ melezhik (Alexey) sent me a link where he published a chef recipe to
+ work with CPAN.pm: http://community.opscode.com/cookbooks/cpan.
+ 
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff b/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
index f3d92583e3..e2f86001b6 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/document_makemaker_ccflags.diff
@@ -1,4 +1,4 @@
-From 9faf6dcc3a5c4154484d812eb3cc3dd78b35563b Mon Sep 17 00:00:00 2001
+From 3057004f1f23f48c6c107a62b7a1087ec5aa3a69 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Mon, 30 May 2011 22:54:24 +0300
 Subject: Document that CCFLAGS should include $Config{ccflags}
@@ -10,16 +10,15 @@ Compiling XS extensions without $Config{ccflags} can break the
 binary interface on some platforms.
 
 Patch-Name: fixes/document_makemaker_ccflags.diff
-Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-index fe95b27..90403e8 100644
+index 90d9eac49c..81bdc96649 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm
-@@ -1774,6 +1774,10 @@ currently used by MakeMaker but may be handy in Makefile.PLs.
+@@ -1838,6 +1838,10 @@ currently used by MakeMaker but may be handy in Makefile.PLs.
  String that will be included in the compiler call command line between
  the arguments INC and OPTIMIZE.
  
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/errno-include-path.diff b/meta/recipes-devtools/perl/perl/debian/fixes/errno-include-path.diff
new file mode 100644
index 0000000000..bb5f58bf24
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/errno-include-path.diff
@@ -0,0 +1,77 @@
+From 97cd27c460b8050b7446dcea92f05472146c5d50 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sat, 17 Nov 2018 19:27:42 +0200
+Subject: Make Errno_pm.PL compatible with /usr/include/<ARCH>/errno.h
+
+As seen in <https://bugs.debian.org/798955>, Debian glibc
+maintainers intend to move system header files from /usr/include to
+/usr/include/<arch> at some point. This would break Errno_pm.PL, which
+has logic for asking cpp for the location of errno.h but fails earlier
+if errno.h is not on a list of known paths.
+
+Take the cpp fallback instead of dying. The behaviour should stay
+identical as long as errno.h is not moved.
+
+This will also enable multiarch (non-sysroot) cross builds.
+
+Original patch by Helmut Grohne.
+
+Bug-Debian: https://bugs.debian.org/875921
+Bug: https://rt.perl.org/Public/Bug/Display.html?id=133662
+Patch-Name: fixes/errno-include-path.diff
+Origin: upstream, https://perl5.git.perl.org/perl.git/commit/6c5080f25fa3dcede391007ffe328ea53779c52f
+---
+ ext/Errno/Errno_pm.PL | 24 ++++++++++++++----------
+ 1 file changed, 14 insertions(+), 10 deletions(-)
+
+diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
+index 6a0031f0f7..9d1454c96a 100644
+--- a/ext/Errno/Errno_pm.PL
++++ b/ext/Errno/Errno_pm.PL
+@@ -2,7 +2,7 @@ use ExtUtils::MakeMaker;
+ use Config;
+ use strict;
+ 
+-our $VERSION = "1.29";
++our $VERSION = "1.30";
+ 
+ my %err = ();
+ 
+@@ -111,6 +111,17 @@ sub default_cpp {
+ 
+ sub get_files {
+     my %file = ();
++    # When cross-compiling we may store a path for gcc's "sysroot" option:
++    my $sysroot = $Config{sysroot} || '';
++    my $linux_errno_h;
++    if ($^O eq 'linux') {
++	# Some Linuxes have weird errno.hs which generate
++	# no #file or #line directives
++	($linux_errno_h) = grep { -e $_ } map { "$_/errno.h" }
++	    "$sysroot/usr/include", "$sysroot/usr/local/include",
++	    split / / => $Config{locincpth};
++    }
++
+     # VMS keeps its include files in system libraries
+     if ($^O eq 'VMS') {
+ 	$file{'Sys$Library:DECC$RTLDEF.TLB'} = 1;
+@@ -125,17 +136,10 @@ sub get_files {
+ 	}
+     } elsif ($^O eq 'linux' &&
+ 	      $Config{gccversion} ne '' && 
+-	      $Config{gccversion} !~ /intel/i
++	      $Config{gccversion} !~ /intel/i &&
+ 	      # might be using, say, Intel's icc
++	      $linux_errno_h
+ 	     ) {
+-    # When cross-compiling we may store a path for gcc's "sysroot" option:
+-    my $sysroot = $Config{sysroot} || '';
+-	# Some Linuxes have weird errno.hs which generate
+-	# no #file or #line directives
+-	my ($linux_errno_h) = grep { -e $_ } map { "$_/errno.h" }
+-	    "$sysroot/usr/include", "$sysroot/usr/local/include",
+-	    split / / => $Config{locincpth} or
+-		die "Cannot find errno.h";
+ 	$file{$linux_errno_h} = 1;
+     } elsif ($^O eq 'haiku') {
+ 	# hidden in a special place
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.diff b/meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.diff
new file mode 100644
index 0000000000..3899675321
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/eumm-usrmerge.diff
@@ -0,0 +1,124 @@
+From 736c9f565eeb4b381acae9ac0d286e0dd83317ff Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Dagfinn=20Ilmari=20Manns=C3=A5ker?= <ilmari@ilmari.org>
+Date: Tue, 13 Nov 2018 16:00:48 +0000
+Subject: Avoid mangling /bin non-perl shebangs on merged-/usr systems
+
+If the shebang is absolute and exists in PATH, but was not the first
+one found, leave it alone if it's actually the same file as first one.
+
+This avoids packages built on merged-/usr systems with /usr/bin before
+/bin in the path breaking when installed on systems without merged
+/usr.  See e.g. https://bugs.debian.org/913637.
+
+Origin: backport, https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/commit/9766f9c5ffd1ac915d75b309cd18c9f42794b710
+Bug: https://github.com/Perl-Toolchain-Gang/ExtUtils-MakeMaker/pull/330
+Bug-Debian: https://bugs.debian.org/913637
+Patch-Name: fixes/eumm-usrmerge.diff
+---
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm    | 22 +++++++++++++--
+ cpan/ExtUtils-MakeMaker/t/fixin.t                  | 33 +++++++++++++++++++++-
+ .../t/lib/MakeMaker/Test/Setup/BFD.pm              |  3 ++
+ 3 files changed, 55 insertions(+), 3 deletions(-)
+
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+index bb41b274b3..2e33d0a8ae 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+@@ -1243,8 +1243,8 @@ sub _fixin_replace_shebang {
+     my ( $self, $file, $line ) = @_;
+ 
+     # Now figure out the interpreter name.
+-    my ( $cmd, $arg ) = split ' ', $line, 2;
+-    $cmd =~ s!^.*/!!;
++    my ( $origcmd, $arg ) = split ' ', $line, 2;
++    (my $cmd = $origcmd) =~ s!^.*/!!;
+ 
+     # Now look (in reverse) for interpreter in absolute PATH (unless perl).
+     my $interpreter;
+@@ -1270,6 +1270,24 @@ sub _fixin_replace_shebang {
+                 $interpreter = $maybefile;
+             }
+         }
++
++        # If the shebang is absolute and exists in PATH, but was not
++        # the first one found, leave it alone if it's actually the
++        # same file as first one.  This avoids packages built on
++        # merged-/usr systems with /usr/bin before /bin in the path
++        # breaking when installed on systems without merged /usr
++        if ($origcmd ne $interpreter and $self->file_name_is_absolute($origcmd)) {
++            my $origdir = dirname($origcmd);
++            if ($self->maybe_command($origcmd) && grep { $_ eq $origdir } @absdirs) {
++                my ($odev, $oino) = stat $origcmd;
++                my ($idev, $iino) = stat $interpreter;
++                if ($odev == $idev && $oino == $iino) {
++                    warn "$origcmd is the same as $interpreter, leaving alone"
++                        if $Verbose;
++                    $interpreter = $origcmd;
++                }
++            }
++        }
+     }
+ 
+     # Figure out how to invoke interpreter on this machine.
+diff --git a/cpan/ExtUtils-MakeMaker/t/fixin.t b/cpan/ExtUtils-MakeMaker/t/fixin.t
+index 061e456247..872b023c55 100644
+--- a/cpan/ExtUtils-MakeMaker/t/fixin.t
++++ b/cpan/ExtUtils-MakeMaker/t/fixin.t
+@@ -9,7 +9,7 @@ BEGIN {
+ 
+ use File::Spec;
+ 
+-use Test::More tests => 22;
++use Test::More tests => 30;
+ 
+ use Config;
+ use TieOut;
+@@ -123,3 +123,34 @@ END
+         }
+     );
+ }
++
++SKIP: {
++    eval { chmod(0755, "usrbin/interp") }
++        or skip "no chmod", 8;
++
++    my $dir = getcwd();
++    local $ENV{PATH} = join $Config{path_sep}, map "$dir/$_", qw(usrbin bin);
++
++    test_fixin(<<END,
++#!$dir/bin/interp
++
++blah blah blah
++END
++         sub {
++             is $_[0], "#!$dir/usrbin/interp\n", 'interpreter updated to one found in PATH';
++         }
++     );
++
++    eval { symlink("../usrbin/interp", "bin/interp") }
++        or skip "no symlinks", 4;
++
++    test_fixin(<<END,
++#!$dir/bin/interp
++
++blah blah blah
++END
++         sub {
++             is $_[0], "#!$dir/bin/interp\n", 'symlinked interpreter later in PATH not mangled';
++         }
++     );
++}
+diff --git a/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm b/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm
+index 3d093fcfbd..cfe49e5465 100644
+--- a/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm
++++ b/cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/Setup/BFD.pm
+@@ -54,6 +54,9 @@ program - this is a program
+ 
+ 1;
+ END
++             'Big-Dummy/usrbin/interp'       => <<'END',
++This is a dummy interpreter
++END
+ 
+              'Big-Dummy/test.pl'          => <<'END',
+ print "1..1\n";
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/fix-manifest-failures.diff b/meta/recipes-devtools/perl/perl/debian/fixes/fix-manifest-failures.diff
new file mode 100644
index 0000000000..158ba86a0d
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/fix-manifest-failures.diff
@@ -0,0 +1,44 @@
+From 428a86833a1016bd9f5e7db65e6b5aa3a6bbbabd Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sun, 2 Dec 2018 11:57:01 +0200
+Subject: Fix t/porting/manifest.t failures when run in a foreign git checkout
+
+The change at ba6733216202523a95b0b7ee2e534b8e30b6d7df didn't work
+correctly: find_git_or_skip() in t/test.pl looks at PERL_BUILD_PACKAGING
+too late, so it doesn't change the logic of skipping, only the explanation
+of why tests get skipped if they do. This was originally reported at
+<https://bugs.debian.org/914962>.
+
+Committer: update commit message for upstream context
+Bug-Debian: https://bugs.debian.org/914962
+Origin: upstream
+Patch-Name: fixes/fix-manifest-failures.diff
+---
+ t/test.pl | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/t/test.pl b/t/test.pl
+index 868911ce39..4d9af221b9 100644
+--- a/t/test.pl
++++ b/t/test.pl
+@@ -199,7 +199,9 @@ sub find_git_or_skip {
+ 	    $source_dir = '.'
+ 	}
+     }
+-    if ($source_dir) {
++    if ($ENV{'PERL_BUILD_PACKAGING'}) {
++	$reason = 'PERL_BUILD_PACKAGING is set';
++    } elsif ($source_dir) {
+ 	my $version_string = `git --version`;
+ 	if (defined $version_string
+ 	      && $version_string =~ /\Agit version (\d+\.\d+\.\d+)(.*)/) {
+@@ -212,9 +214,6 @@ sub find_git_or_skip {
+     } else {
+ 	$reason = 'not being run from a git checkout';
+     }
+-    if ($ENV{'PERL_BUILD_PACKAGING'}) {
+-	$reason = 'PERL_BUILD_PACKAGING is set';
+-    }
+     skip_all($reason) if $_[0] && $_[0] eq 'all';
+     skip($reason, @_);
+ }
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/getopt-long-4.diff b/meta/recipes-devtools/perl/perl/debian/fixes/getopt-long-4.diff
new file mode 100644
index 0000000000..f11cc82674
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/getopt-long-4.diff
@@ -0,0 +1,30 @@
+From e64ba3c28908b6b7da33658ec078ccc0db25ef19 Mon Sep 17 00:00:00 2001
+From: Johan Vromans <jvromans@squirrel.nl>
+Date: Tue, 13 Jun 2017 13:26:00 +0200
+Subject: Fix issue #122068.
+
+Origin: backport, https://github.com/sciurius/perl-Getopt-Long/commit/2d16f355e25537aa742eb2833a7d52a63051429b
+Bug: https://rt.cpan.org/Ticket/Display.html?id=122068
+Bug-Debian: https://bugs.debian.org/864544
+Patch-Name: fixes/getopt-long-4.diff
+---
+ cpan/Getopt-Long/lib/Getopt/Long.pm | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/cpan/Getopt-Long/lib/Getopt/Long.pm b/cpan/Getopt-Long/lib/Getopt/Long.pm
+index 664c8b63c9..e4e3026db6 100644
+--- a/cpan/Getopt-Long/lib/Getopt/Long.pm
++++ b/cpan/Getopt-Long/lib/Getopt/Long.pm
+@@ -1123,6 +1123,12 @@ sub FindOption ($$$$$) {
+ 	    $optargtype = 3;
+ 	}
+ 	if(($optargtype == 0) && !$mand) {
++	    if ( $type eq 'I' ) {
++		# Fake incremental type.
++		my @c = @$ctl;
++		$c[CTL_TYPE] = '+';
++		return (1, $opt, \@c, 1);
++	    }
+ 	    my $val
+ 	      = defined($ctl->[CTL_DEFAULT]) ? $ctl->[CTL_DEFAULT]
+ 	      : $type eq 's'                 ? ''
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part1.diff b/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part1.diff
new file mode 100644
index 0000000000..b4e21fefb0
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part1.diff
@@ -0,0 +1,135 @@
+From 20a7d5ad4be9e71ca9a172993c802df57f44f5fb Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 20 Nov 2018 15:30:20 +1100
+Subject: (perl #133659) move argvout cleanup to a new function
+
+Bug-Debian: https://bugs.debian.org/914651
+Origin: upstream
+Patch-Name: fixes/inplace-editing-bugfix/part1.diff
+---
+ doio.c    | 62 ++++++++++++++++++++++++++++++++++++++------------------------
+ embed.fnc |  1 +
+ embed.h   |  1 +
+ proto.h   |  3 +++
+ 4 files changed, 43 insertions(+), 24 deletions(-)
+
+diff --git a/doio.c b/doio.c
+index 309326b27a..39f0c42e7e 100644
+--- a/doio.c
++++ b/doio.c
+@@ -1526,31 +1526,14 @@ S_dir_unchanged(pTHX_ const char *orig_pv, MAGIC *mg) {
+ #define dir_unchanged(orig_psv, mg) \
+     S_dir_unchanged(aTHX_ (orig_psv), (mg))
+ 
+-/* explicit renamed to avoid C++ conflict    -- kja */
+-bool
+-Perl_do_close(pTHX_ GV *gv, bool not_implicit)
+-{
++STATIC bool
++S_argvout_final(pTHX_ MAGIC *mg, IO *io, bool not_implicit) {
+     bool retval;
+-    IO *io;
+-    MAGIC *mg;
+ 
+-    if (!gv)
+-	gv = PL_argvgv;
+-    if (!gv || !isGV_with_GP(gv)) {
+-	if (not_implicit)
+-	    SETERRNO(EBADF,SS_IVCHAN);
+-	return FALSE;
+-    }
+-    io = GvIO(gv);
+-    if (!io) {		/* never opened */
+-	if (not_implicit) {
+-	    report_evil_fh(gv);
+-	    SETERRNO(EBADF,SS_IVCHAN);
+-	}
+-	return FALSE;
+-    }
+-    if ((mg = mg_findext((SV*)io, PERL_MAGIC_uvar, &argvout_vtbl))
+-        && mg->mg_obj) {
++    /* ensure args are checked before we start using them */
++    PERL_ARGS_ASSERT_ARGVOUT_FINAL;
++
++    {
+         /* handle to an in-place edit work file */
+         SV **back_psv = av_fetch((AV*)mg->mg_obj, ARGVMG_BACKUP_NAME, FALSE);
+         SV **temp_psv = av_fetch((AV*)mg->mg_obj, ARGVMG_TEMP_NAME, FALSE);
+@@ -1717,7 +1700,38 @@ Perl_do_close(pTHX_ GV *gv, bool not_implicit)
+                            SvPVX(*temp_psv), Strerror(errno));
+             }
+         }
+-    freext:
++ freext:
++        ;
++    }
++    return retval;
++}
++
++/* explicit renamed to avoid C++ conflict    -- kja */
++bool
++Perl_do_close(pTHX_ GV *gv, bool not_implicit)
++{
++    bool retval;
++    IO *io;
++    MAGIC *mg;
++
++    if (!gv)
++	gv = PL_argvgv;
++    if (!gv || !isGV_with_GP(gv)) {
++	if (not_implicit)
++	    SETERRNO(EBADF,SS_IVCHAN);
++	return FALSE;
++    }
++    io = GvIO(gv);
++    if (!io) {		/* never opened */
++	if (not_implicit) {
++	    report_evil_fh(gv);
++	    SETERRNO(EBADF,SS_IVCHAN);
++	}
++	return FALSE;
++    }
++    if ((mg = mg_findext((SV*)io, PERL_MAGIC_uvar, &argvout_vtbl))
++        && mg->mg_obj) {
++        retval = argvout_final(mg, io, not_implicit);
+         mg_freeext((SV*)io, PERL_MAGIC_uvar, &argvout_vtbl);
+     }
+     else {
+diff --git a/embed.fnc b/embed.fnc
+index 454a380e4c..e762fe1eec 100644
+--- a/embed.fnc
++++ b/embed.fnc
+@@ -440,6 +440,7 @@ p	|bool|do_exec3	|NN const char *incmd|int fd|int do_report
+ #endif
+ #if defined(PERL_IN_DOIO_C)
+ s	|void	|exec_failed	|NN const char *cmd|int fd|int do_report
++s	|bool	|argvout_final	|NN MAGIC *mg|NN IO *io|bool not_implicit
+ #endif
+ #if defined(HAS_MSG) || defined(HAS_SEM) || defined(HAS_SHM)
+ : Defined in doio.c, used only in pp_sys.c
+diff --git a/embed.h b/embed.h
+index fb93ebc1cb..a5416a1148 100644
+--- a/embed.h
++++ b/embed.h
+@@ -1746,6 +1746,7 @@
+ #define deb_stack_n(a,b,c,d,e)	S_deb_stack_n(aTHX_ a,b,c,d,e)
+ #  endif
+ #  if defined(PERL_IN_DOIO_C)
++#define argvout_final(a,b,c)	S_argvout_final(aTHX_ a,b,c)
+ #define exec_failed(a,b,c)	S_exec_failed(aTHX_ a,b,c)
+ #define ingroup(a,b)		S_ingroup(aTHX_ a,b)
+ #define openn_cleanup(a,b,c,d,e,f,g,h,i,j,k,l,m)	S_openn_cleanup(aTHX_ a,b,c,d,e,f,g,h,i,j,k,l,m)
+diff --git a/proto.h b/proto.h
+index c91141b9e8..66bb29b132 100644
+--- a/proto.h
++++ b/proto.h
+@@ -4723,6 +4723,9 @@ STATIC void	S_deb_stack_n(pTHX_ SV** stack_base, I32 stack_min, I32 stack_max, I
+ 	assert(stack_base)
+ #endif
+ #if defined(PERL_IN_DOIO_C)
++STATIC bool	S_argvout_final(pTHX_ MAGIC *mg, IO *io, bool not_implicit);
++#define PERL_ARGS_ASSERT_ARGVOUT_FINAL	\
++	assert(mg); assert(io)
+ STATIC void	S_exec_failed(pTHX_ const char *cmd, int fd, int do_report);
+ #define PERL_ARGS_ASSERT_EXEC_FAILED	\
+ 	assert(cmd)
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part2.diff b/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part2.diff
new file mode 100644
index 0000000000..3a87cba1a3
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part2.diff
@@ -0,0 +1,56 @@
+From b8f21ea4b01d14781b0d0ce2e7ddba864b33cab0 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 20 Nov 2018 16:43:43 +1100
+Subject: (perl #133659) tests for global destruction handling of inplace
+ editing
+
+Bug-Debian: https://bugs.debian.org/914651
+Origin: upstream
+Patch-Name: fixes/inplace-editing-bugfix/part2.diff
+---
+ t/io/inplace.t | 28 +++++++++++++++++++++++++++-
+ 1 file changed, 27 insertions(+), 1 deletion(-)
+
+diff --git a/t/io/inplace.t b/t/io/inplace.t
+index 98159e06bf..ac50f1ab77 100644
+--- a/t/io/inplace.t
++++ b/t/io/inplace.t
+@@ -5,7 +5,7 @@ require './test.pl';
+ 
+ $^I = $^O eq 'VMS' ? '_bak' : '.bak';
+ 
+-plan( tests => 6 );
++plan( tests => 8 );
+ 
+ my @tfiles     = (tempfile(), tempfile(), tempfile());
+ my @tfiles_bak = map "$_$^I", @tfiles;
+@@ -91,3 +91,29 @@ SKIP:
+     
+     END { unlink_all(@ifiles); }
+ }
++
++{
++    my @tests =
++      ( # opts, code, result, name, $TODO
++       [ "-n", "die", "bar\n", "die shouldn't touch file" ],
++       [ "-n", "last", "", "last should update file", "not implemented yet" ],
++      );
++    our $file = tempfile() ;
++
++    for my $test (@tests) {
++        (my ($opts, $code, $result, $name), our $TODO) = @$test;
++        open my $fh, ">", $file or die;
++        print $fh "bar\n";
++        close $fh;
++
++        runperl( prog => $code,
++                 switches => [ grep length, "-i", $opts ],
++                 args => [ $file ],
++                 stderr => 1, # discarded
++               );
++        open $fh, "<", $file or die;
++        my $data = do { local $/; <$fh>; };
++        close $fh;
++        is($data, $result, $name);
++    }
++}
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part3.diff b/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part3.diff
new file mode 100644
index 0000000000..1e4a7745c6
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/inplace-editing-bugfix/part3.diff
@@ -0,0 +1,131 @@
+From 485dde7bb62effcc8b6575ad6f493ae09193cc3e Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Wed, 21 Nov 2018 10:05:27 +1100
+Subject: (perl #133659) make an in-place edit successful if the exit status is
+ zero
+
+during global destruction.
+
+This means that code like:
+
+  perl -i -ne '...; last'
+
+will replace the input file with the in-place edit output of the file,
+but:
+
+  perl -i -ne '...; die'
+
+or
+
+  perl -i -ne '...; exit 1'
+
+won't.
+
+Bug-Debian: https://bugs.debian.org/914651
+Origin: upstream
+Patch-Name: fixes/inplace-editing-bugfix/part3.diff
+---
+ doio.c           | 45 +++++++++++++++++++++++++--------------------
+ t/io/inplace.t   |  2 +-
+ t/run/switches.t |  4 ++--
+ 3 files changed, 28 insertions(+), 23 deletions(-)
+
+diff --git a/doio.c b/doio.c
+index 39f0c42e7e..f8be31c84a 100644
+--- a/doio.c
++++ b/doio.c
+@@ -1173,34 +1173,39 @@ S_argvout_free(pTHX_ SV *io, MAGIC *mg) {
+         dir = INT2PTR(DIR *, SvIV(*dir_psv));
+ #endif
+         if (IoIFP(io)) {
+-            SV **pid_psv;
+-            PerlIO *iop = IoIFP(io);
++            if (PL_phase == PERL_PHASE_DESTRUCT && PL_statusvalue == 0) {
++                (void)argvout_final(mg, (IO*)io, FALSE);
++            }
++            else {
++                SV **pid_psv;
++                PerlIO *iop = IoIFP(io);
+ 
+-            assert(SvTYPE(mg->mg_obj) == SVt_PVAV);
++                assert(SvTYPE(mg->mg_obj) == SVt_PVAV);
+ 
+-            pid_psv = av_fetch((AV*)mg->mg_obj, ARGVMG_ORIG_PID, FALSE);
++                pid_psv = av_fetch((AV*)mg->mg_obj, ARGVMG_ORIG_PID, FALSE);
+ 
+-            assert(pid_psv && *pid_psv);
++                assert(pid_psv && *pid_psv);
+ 
+-            if (SvIV(*pid_psv) == (IV)PerlProc_getpid()) {
+-                /* if we get here the file hasn't been closed explicitly by the
+-                   user and hadn't been closed implicitly by nextargv(), so
+-                   abandon the edit */
+-                SV **temp_psv = av_fetch((AV*)mg->mg_obj, ARGVMG_TEMP_NAME, FALSE);
+-                const char *temp_pv = SvPVX(*temp_psv);
++                if (SvIV(*pid_psv) == (IV)PerlProc_getpid()) {
++                    /* if we get here the file hasn't been closed explicitly by the
++                       user and hadn't been closed implicitly by nextargv(), so
++                       abandon the edit */
++                    SV **temp_psv = av_fetch((AV*)mg->mg_obj, ARGVMG_TEMP_NAME, FALSE);
++                    const char *temp_pv = SvPVX(*temp_psv);
+ 
+-                assert(temp_psv && *temp_psv && SvPOK(*temp_psv));
+-                (void)PerlIO_close(iop);
+-                IoIFP(io) = IoOFP(io) = NULL;
++                    assert(temp_psv && *temp_psv && SvPOK(*temp_psv));
++                    (void)PerlIO_close(iop);
++                    IoIFP(io) = IoOFP(io) = NULL;
+ #ifdef ARGV_USE_ATFUNCTIONS
+-                if (dir) {
+-                    if (unlinkat(my_dirfd(dir), temp_pv, 0) < 0 &&
+-                        NotSupported(errno))
+-                        (void)UNLINK(temp_pv);
+-                }
++                    if (dir) {
++                        if (unlinkat(my_dirfd(dir), temp_pv, 0) < 0 &&
++                            NotSupported(errno))
++                            (void)UNLINK(temp_pv);
++                    }
+ #else
+-                (void)UNLINK(temp_pv);
++                    (void)UNLINK(temp_pv);
+ #endif
++                }
+             }
+         }
+ #ifdef ARGV_USE_ATFUNCTIONS
+diff --git a/t/io/inplace.t b/t/io/inplace.t
+index ac50f1ab77..0403cd9250 100644
+--- a/t/io/inplace.t
++++ b/t/io/inplace.t
+@@ -96,7 +96,7 @@ SKIP:
+     my @tests =
+       ( # opts, code, result, name, $TODO
+        [ "-n", "die", "bar\n", "die shouldn't touch file" ],
+-       [ "-n", "last", "", "last should update file", "not implemented yet" ],
++       [ "-n", "last", "", "last should update file" ],
+       );
+     our $file = tempfile() ;
+ 
+diff --git a/t/run/switches.t b/t/run/switches.t
+index 7ccef1e063..594cad6e7f 100644
+--- a/t/run/switches.t
++++ b/t/run/switches.t
+@@ -429,7 +429,7 @@ __EOF__
+ 
+     # exit or die should leave original content in file
+     for my $inplace (qw/-i -i.bak/) {
+-        for my $prog (qw/die exit/) {
++        for my $prog ("die", "exit 1") {
+             open my $fh, ">", $work or die "$0: failed to open '$work': $!";
+             print $fh $yada;
+             close $fh or die "Failed to close: $!";
+@@ -443,7 +443,7 @@ __EOF__
+             my $data = do { local $/; <$in> };
+             close $in;
+             is ($data, $yada, "check original content still in file");
+-            unlink $work;
++            unlink $work, "$work.bak";
+         }
+     }
+ 
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_angle_units.diff b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_angle_units.diff
new file mode 100644
index 0000000000..55d40cacc4
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_angle_units.diff
@@ -0,0 +1,28 @@
+From 7e38b1a81e49bf8b3985136b5ba0bf1575333057 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 30 Apr 2016 22:56:56 +0100
+Subject: Math::Trig: document angle units
+
+Bug: https://rt.cpan.org/Ticket/Display.html?id=114106
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=731505
+Patch-Name: fixes/math_complex_doc_angle_units.diff
+---
+ cpan/Math-Complex/lib/Math/Trig.pm | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/cpan/Math-Complex/lib/Math/Trig.pm b/cpan/Math-Complex/lib/Math/Trig.pm
+index acad31ff49..bc7ac780e9 100644
+--- a/cpan/Math-Complex/lib/Math/Trig.pm
++++ b/cpan/Math-Complex/lib/Math/Trig.pm
+@@ -263,6 +263,11 @@ core Perl which defines only the C<sin()> and C<cos()>.  The constant
+ B<pi> is also defined as are a few convenience functions for angle
+ conversions, and I<great circle formulas> for spherical movement.
+ 
++=head1 ANGLES
++
++All angles are defined in radians, except where otherwise specified
++(for example in the deg/rad conversion functions).
++
+ =head1 TRIGONOMETRIC FUNCTIONS
+ 
+ The tangent
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_great_circle.diff b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_great_circle.diff
new file mode 100644
index 0000000000..0044737926
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_great_circle.diff
@@ -0,0 +1,25 @@
+From 1d8d4b083bca049a33673959059127fa3705816e Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 30 Apr 2016 22:50:52 +0100
+Subject: Math::Trig: clarify definition of great_circle_midpoint
+
+Bug: https://rt.cpan.org/Ticket/Display.html?id=114104
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697567
+Patch-Name: fixes/math_complex_doc_great_circle.diff
+---
+ cpan/Math-Complex/lib/Math/Trig.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/Math-Complex/lib/Math/Trig.pm b/cpan/Math-Complex/lib/Math/Trig.pm
+index 1d9612a41c..efc2ff80ac 100644
+--- a/cpan/Math-Complex/lib/Math/Trig.pm
++++ b/cpan/Math-Complex/lib/Math/Trig.pm
+@@ -608,7 +608,7 @@ or the midpoint if you know the end points:
+   ($thetam, $phim) =
+     great_circle_midpoint($theta0, $phi0, $theta1, $phi1);
+ 
+-The great_circle_midpoint() is just a special case of
++The great_circle_midpoint() is just a special case (with $way = 0.5) of
+ 
+ =head2 great_circle_waypoint
+ 
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_see_also.diff b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_see_also.diff
new file mode 100644
index 0000000000..a450510bec
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/math_complex_doc_see_also.diff
@@ -0,0 +1,25 @@
+From 4c4ade07c6eceb41c96bd5ab93a259eda5b94b12 Mon Sep 17 00:00:00 2001
+From: Dominic Hargreaves <dom@earth.li>
+Date: Sat, 30 Apr 2016 22:53:44 +0100
+Subject: Math::Trig: add missing SEE ALSO
+
+Bug: https://rt.cpan.org/Ticket/Display.html?id=114105
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=697568
+Patch-Name: fixes/math_complex_doc_see_also.diff
+---
+ cpan/Math-Complex/lib/Math/Trig.pm | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cpan/Math-Complex/lib/Math/Trig.pm b/cpan/Math-Complex/lib/Math/Trig.pm
+index efc2ff80ac..acad31ff49 100644
+--- a/cpan/Math-Complex/lib/Math/Trig.pm
++++ b/cpan/Math-Complex/lib/Math/Trig.pm
+@@ -743,6 +743,8 @@ an answer instead of giving a fatal runtime error.
+ 
+ Do not attempt navigation using these formulas.
+ 
++=head1 SEE ALSO
++
+ L<Math::Complex>
+ 
+ =head1 AUTHORS
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.diff b/meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.diff
new file mode 100644
index 0000000000..66fa487c39
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/memoize-pod.diff
@@ -0,0 +1,34 @@
+From 74fb9e7591d6a1e45c0dc8637c195135b2725e82 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sat, 6 Feb 2016 20:15:19 +0200
+Subject: Fix POD errors in Memoize
+
+Bug: https://rt.cpan.org/Public/Bug/Display.html?id=89441
+Author: Dominic Hargreaves <dom@cpan.org>
+Patch-Name: fixes/memoize-pod.diff
+---
+ cpan/Memoize/Memoize.pm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cpan/Memoize/Memoize.pm b/cpan/Memoize/Memoize.pm
+index f4e6522d48..2f28b361f8 100644
+--- a/cpan/Memoize/Memoize.pm
++++ b/cpan/Memoize/Memoize.pm
+@@ -752,6 +752,8 @@ cache that was populated by the first call.  C<complicated> ends up
+ being called only once, and both subsequent calls return C<3> from the
+ cache, regardless of the calling context.
+ 
++=back
++
+ =head3 List values in scalar context
+ 
+ Consider this function:
+@@ -801,8 +803,6 @@ This normalizer function will store scalar context return values in
+ the disk file under keys that begin with C<S:>, and list context
+ return values under keys that begin with C<L:>.
+ 
+-=back
+-
+ =head1 OTHER FACILITIES
+ 
+ =head2 C<unmemoize>
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
index d9b36f6d23..942ee01d70 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/memoize_storable_nstore.diff
@@ -1,4 +1,4 @@
-From 55d430eb02fc116581847304ca20321687978269 Mon Sep 17 00:00:00 2001
+From cc1af2a2f603824003c4725c33fd09e86d86f49b Mon Sep 17 00:00:00 2001
 From: Jonathan Nieder <jrnieder@gmail.com>
 Date: Fri, 27 Jul 2012 10:35:07 -0500
 Subject: Memoize::Storable: respect 'nstore' option not respected
@@ -47,14 +47,13 @@ Bug-Debian: http://bugs.debian.org/587650
 Bug: https://rt.cpan.org/Public/Bug/Display.html?id=77790
 Forwarded: https://rt.cpan.org/Public/Bug/Display.html?id=77790
 Patch-Name: fixes/memoize_storable_nstore.diff
-Upstream-Status: Pending
 ---
  cpan/Memoize/Memoize/Storable.pm |  2 +-
  cpan/Memoize/t/tie_storable.t    | 24 ++++++++++++++++++++----
  2 files changed, 21 insertions(+), 5 deletions(-)
 
 diff --git a/cpan/Memoize/Memoize/Storable.pm b/cpan/Memoize/Memoize/Storable.pm
-index 1314797..87876f2 100644
+index 1314797297..87876f227e 100644
 --- a/cpan/Memoize/Memoize/Storable.pm
 +++ b/cpan/Memoize/Memoize/Storable.pm
 @@ -55,7 +55,7 @@ sub DESTROY {
@@ -67,7 +66,7 @@ index 1314797..87876f2 100644
    } else {
      Storable::store($self->{H}, $self->{FILENAME});
 diff --git a/cpan/Memoize/t/tie_storable.t b/cpan/Memoize/t/tie_storable.t
-index de3b8dc..a624238 100644
+index de3b8dc26b..a62423850e 100644
 --- a/cpan/Memoize/t/tie_storable.t
 +++ b/cpan/Memoize/t/tie_storable.t
 @@ -31,18 +31,34 @@ if ($@) {
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff b/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
deleted file mode 100644
index afcf7fb012..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/net_smtp_docs.diff
+++ /dev/null
@@ -1,26 +0,0 @@
-From fa085fedd9c406edcd4a1a256c025d5ff7f6c6de Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Thu, 20 Sep 2007 19:47:14 +1000
-Subject: Document the Net::SMTP 'Port' option
-
-Bug-Debian: http://bugs.debian.org/100195
-Bug: http://rt.cpan.org/Public/Bug/Display.html?id=36038
-
-Patch-Name: fixes/net_smtp_docs.diff
-Upstream-Status: Pending
----
- cpan/libnet/lib/Net/SMTP.pm | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/cpan/libnet/lib/Net/SMTP.pm b/cpan/libnet/lib/Net/SMTP.pm
-index afd017a..6ae7d9e 100644
---- a/cpan/libnet/lib/Net/SMTP.pm
-+++ b/cpan/libnet/lib/Net/SMTP.pm
-@@ -738,6 +738,7 @@ Net::SMTP will attempt to extract the address from the value passed.
- 
- B<Debug> - Enable debugging information
- 
-+B<Port> - Select a port on the remote host to connect to (default is 25)
- 
- Example:
- 
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff b/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
deleted file mode 100644
index 9bdf41b47d..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/perl-Cnn.diff
+++ /dev/null
@@ -1,74 +0,0 @@
-From 0ecf83f259db09cb38cb37c9b22e72be185afa8f Mon Sep 17 00:00:00 2001
-From: Hugo van der Sanden <hv@crypt.org>
-Date: Thu, 11 Jun 2015 12:25:40 +0100
-Subject: fix -Cnn parsing
-
-Commit 22ff313068 for [perl #123814] inadvertently changed the logic when
-parsing a numeric parameter to the -C option, such that the successfully
-parsed number was not saved as the option value if it parsed to the end
-of the argument.
-
-Bug: https://rt.perl.org/Ticket/Display.html?id=125381
-Bug-Debian: https://bugs.debian.org/788636
-Origin: upstream, http://perl5.git.perl.org/perl.git/commit/89d84ff965
-Patch-Name: fixes/perl-Cnn.diff
-Upstream-Status: Pending
----
- t/run/switchC.t |  7 ++++++-
- util.c          | 17 ++++++++---------
- 2 files changed, 14 insertions(+), 10 deletions(-)
-
-diff --git a/t/run/switchC.t b/t/run/switchC.t
-index f6aa868..4f63c3b 100644
---- a/t/run/switchC.t
-+++ b/t/run/switchC.t
-@@ -11,7 +11,7 @@ BEGIN {
-     skip_all_if_miniperl('-C and $ENV{PERL_UNICODE} are disabled on miniperl');
- }
- 
--plan(tests => 13);
-+plan(tests => 14);
- 
- my $r;
- 
-@@ -25,6 +25,11 @@ $r = runperl( switches => [ '-CO', '-w' ],
-               stderr   => 1 );
- like( $r, qr/^$b(?:\r?\n)?$/s, '-CO: no warning on UTF-8 output' );
- 
-+$r = runperl( switches => [ '-C2', '-w' ],
-+	      prog     => 'print chr(256)',
-+              stderr   => 1 );
-+like( $r, qr/^$b(?:\r?\n)?$/s, '-C2: no warning on UTF-8 output' );
-+
- SKIP: {
-     if (exists $ENV{PERL_UNICODE} &&
- 	($ENV{PERL_UNICODE} eq "" || $ENV{PERL_UNICODE} =~ /[SO]/)) {
-diff --git a/util.c b/util.c
-index 8cf62f5..ee23314 100644
---- a/util.c
-+++ b/util.c
-@@ -4420,16 +4420,15 @@ Perl_parse_unicode_opts(pTHX_ const char **popt)
-        if (isDIGIT(*p)) {
-             const char* endptr;
-             UV uv;
--            if (grok_atoUV(p, &uv, &endptr)
--                && uv <= U32_MAX
--                && (p = endptr)
--                && *p && *p != '\n' && *p != '\r'
--            ) {
-+            if (grok_atoUV(p, &uv, &endptr) && uv <= U32_MAX) {
-                 opt = (U32)uv;
--                if (isSPACE(*p))
--                    goto the_end_of_the_opts_parser;
--                else
--                    Perl_croak(aTHX_ "Unknown Unicode option letter '%c'", *p);
-+                p = endptr;
-+                if (p && *p && *p != '\n' && *p != '\r') {
-+                    if (isSPACE(*p))
-+                        goto the_end_of_the_opts_parser;
-+                    else
-+                        Perl_croak(aTHX_ "Unknown Unicode option letter '%c'", *p);
-+                }
-             }
-         }
-         else {
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff b/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
deleted file mode 100644
index d23573f188..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/pod_man_reproducible_date.diff
+++ /dev/null
@@ -1,171 +0,0 @@
-From 9057adc106d6bbef53c9e706523cd94f1a7a08d4 Mon Sep 17 00:00:00 2001
-From: Russ Allbery <rra@debian.org>
-Date: Sat, 30 Aug 2014 15:10:41 -0700
-Subject: Support POD_MAN_DATE in Pod::Man for the left-hand footer
-
-Honor the environment variable POD_MAN_DATE and use its contents, if
-set, as the value of the left-hand footer if the date option is not
-set, overriding the timestamp of the input file.  This is primarily
-useful to ensure reproducible builds of the same output file given the
-same souce and Pod::Man version, even when file timestamps may not be
-consistent.  Thanks, Niko Tyni.
-
-Bug-Debian: http://bugs.debian.org/759405
-Origin: upstream
-Patch-Name: fixes/pod_man_reproducible_date.diff
-Upstream-Status: Pending
----
- cpan/podlators/lib/Pod/Man.pm  | 69 +++++++++++++++++++++++++++++++-----------
- cpan/podlators/t/devise-date.t | 29 +++++++++++++-----
- 2 files changed, 72 insertions(+), 26 deletions(-)
-
-diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
-index 72ca9ff..0536662 100644
---- a/cpan/podlators/lib/Pod/Man.pm
-+++ b/cpan/podlators/lib/Pod/Man.pm
-@@ -876,25 +876,42 @@ sub devise_title {
- }
- 
- # Determine the modification date and return that, properly formatted in ISO
--# format.  If we can't get the modification date of the input, instead use the
--# current time.  Pod::Simple returns a completely unuseful stringified file
--# handle as the source_filename for input from a file handle, so we have to
--# deal with that as well.
-+# format.
-+#
-+# If POD_MAN_DATE is set, that overrides anything else.  This can be used for
-+# reproducible generation of the same file even if the input file timestamps
-+# are unpredictable or the POD coms from standard input.
-+#
-+# Otherwise, use the modification date of the input if we can stat it.  Be
-+# aware that Pod::Simple returns the stringification of the file handle as
-+# source_filename for input from a file handle, so we'll stat some random ref
-+# string in that case.  If that fails, instead use the current time.
-+#
-+# $self - Pod::Man object, used to get the source file
-+#
-+# Returns: YYYY-MM-DD date suitable for the left-hand footer
- sub devise_date {
-     my ($self) = @_;
-+
-+    # If POD_MAN_DATE is set, always use it.
-+    if ($ENV{POD_MAN_DATE}) {
-+        return $ENV{POD_MAN_DATE};
-+    }
-+
-+    # Otherwise, get the input filename and try to stat it.  If that fails,
-+    # use the current time.
-     my $input = $self->source_filename;
-     my $time;
-     if ($input) {
--        $time = (stat $input)[9] || time;
-+        $time = (stat($input))[9] || time();
-     } else {
--        $time = time;
-+        $time = time();
-     }
- 
--    # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker
--    # uses this and it has to work in the core which can't load dynamic
--    # libraries.
--    my ($year, $month, $day) = (localtime $time)[5,4,3];
--    return sprintf ("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
-+    # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker uses
-+    # this and it has to work in the core which can't load dynamic libraries.
-+    my ($year, $month, $day) = (localtime($time))[5,4,3];
-+    return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
- }
- 
- # Print out the preamble and the title.  The meaning of the arguments to .TH
-@@ -1632,6 +1649,15 @@ argument.
- Sets the centered page header to use instead of "User Contributed Perl
- Documentation".
- 
-+=item date
-+
-+Sets the left-hand footer.  If this option is not set, the contents of the
-+environment variable POD_MAN_DATE, if set, will be used.  Failing that,
-+the modification date of the input file will be used, or the current time
-+if stat() can't find that file (which will be the case if the input is
-+from C<STDIN>).  If obtained from the file modification date or the
-+current time, he date will be formatted as C<YYYY-MM-DD>.
-+
- =item errors
- 
- How to report errors.  C<die> says to throw an exception on any POD
-@@ -1642,13 +1668,6 @@ POD errors entirely, as much as possible.
- 
- The default is C<pod>.
- 
--=item date
--
--Sets the left-hand footer.  By default, the modification date of the input
--file will be used, or the current date if stat() can't find that file (the
--case if the input is from C<STDIN>), and the date will be formatted as
--C<YYYY-MM-DD>.
--
- =item fixed
- 
- The fixed-width font to use for verbatim text and code.  Defaults to
-@@ -1810,6 +1829,20 @@ option was set to C<die>.
- 
- =back
- 
-+=head1 ENVIRONMENT
-+
-+=over 4
-+
-+=item POD_MAN_DATE
-+
-+If set, this will be used as the value of the left-hand footer unless the
-+C<date> option is explicitly set, overriding the timestamp of the input
-+file or the current time.  This is primarily useful to ensure reproducible
-+builds of the same output file given the same souce and Pod::Man version,
-+even when file timestamps may not be consistent.
-+
-+=back
-+
- =head1 BUGS
- 
- Encoding handling assumes that PerlIO is available and does not work
-diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-date.t
-index 3cce9f5..c610dd9 100644
---- a/cpan/podlators/t/devise-date.t
-+++ b/cpan/podlators/t/devise-date.t
-@@ -1,15 +1,28 @@
--#!/usr/bin/perl -w
--
--# In order for MakeMaker to build in the core, nothing can use
--# Fcntl which includes POSIX.  devise_date()'s use of strftime()
--# was replaced.  This tests that it's identical.
-+#!/usr/bin/perl
-+#
-+# In order for MakeMaker to build in the core, nothing can use Fcntl which
-+# includes POSIX.  devise_date()'s use of strftime() was replaced.  This tests
-+# that it's identical.  It also tests special handling of the POD_MAN_DATE
-+# environment variable.
- 
-+use 5.006;
- use strict;
--
--use Test::More tests => 1;
-+use warnings;
- 
- use Pod::Man;
- use POSIX qw(strftime);
- 
-+use Test::More tests => 2;
-+
-+# Check that the results of device_date matches strftime.  There is no input
-+# file name, so this will use the current time.
- my $parser = Pod::Man->new;
--is $parser->devise_date, strftime("%Y-%m-%d", localtime);
-+is(
-+    $parser->devise_date,
-+    strftime('%Y-%m-%d', localtime()),
-+    'devise_date matches strftime'
-+);
-+
-+# Set the override environment variable and ensure that it's honored.
-+local $ENV{POD_MAN_DATE} = '2014-01-01';
-+is($parser->devise_date, '2014-01-01', 'devise_date honors POD_MAN_DATE');
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
deleted file mode 100644
index 9de29b8654..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-empty-date.diff
+++ /dev/null
@@ -1,52 +0,0 @@
-From 183bb4af7ad862a2cf31d0dcb3dd45c100f76776 Mon Sep 17 00:00:00 2001
-From: Russ Allbery <rra@cpan.org>
-Date: Wed, 15 Apr 2015 22:21:25 -0700
-Subject: Support an empty POD_MAN_DATE environment variable
-
-One may want to set this to an empty string.  Handle that correctly.
-
-(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
-
-Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=e0e9fcb53e8fc954b2b1955385eea18c27f869af
-Bug-Debian: https://bugs.debian.org/780259
-Patch-Name: fixes/podman-empty-date.diff
-Upstream-Status: Pending
----
- cpan/podlators/lib/Pod/Man.pm  | 2 +-
- cpan/podlators/t/devise-date.t | 6 +++++-
- 2 files changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
-index 365892e..8997a15 100644
---- a/cpan/podlators/lib/Pod/Man.pm
-+++ b/cpan/podlators/lib/Pod/Man.pm
-@@ -894,7 +894,7 @@ sub devise_date {
-     my ($self) = @_;
- 
-     # If POD_MAN_DATE is set, always use it.
--    if ($ENV{POD_MAN_DATE}) {
-+    if (defined($ENV{POD_MAN_DATE})) {
-         return $ENV{POD_MAN_DATE};
-     }
- 
-diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-date.t
-index 9da9d1b..27271d9 100644
---- a/cpan/podlators/t/devise-date.t
-+++ b/cpan/podlators/t/devise-date.t
-@@ -12,7 +12,7 @@ use warnings;
- use Pod::Man;
- use POSIX qw(strftime);
- 
--use Test::More tests => 2;
-+use Test::More tests => 3;
- 
- # Check that the results of device_date matches strftime.  There is no input
- # file name, so this will use the current time.
-@@ -26,3 +26,7 @@ is(
- # Set the override environment variable and ensure that it's honored.
- local $ENV{POD_MAN_DATE} = '2014-01-01';
- is($parser->devise_date, '2014-01-01', 'devise_date honors POD_MAN_DATE');
-+
-+# Check that an empty environment variable is honored.
-+local $ENV{POD_MAN_DATE} = q{};
-+is($parser->devise_date, q{}, 'devise_date honors empty POD_MAN_DATE');
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
deleted file mode 100644
index d8858d8a69..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-pipe.diff
+++ /dev/null
@@ -1,110 +0,0 @@
-From 7671d101baa75d7a79bfbd8c75c1595fbb3f53ba Mon Sep 17 00:00:00 2001
-From: Russ Allbery <rra@cpan.org>
-Date: Sat, 7 Feb 2015 19:03:34 -0800
-Subject: Better errors for man pages from standard input
-
-[Pod::Man] Attempt to detect if the input came from a pipe and
-therefore has a completely unhelpful (and nonreproducible) source file
-name, and diagnose this as an error.  Document that the name option
-(--name to pod2man) is required when processing POD source from
-standard input.  (Debian Bug#777405)
-
-(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
-
-Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=d98872e46c93861b7aba14949e1258712087dc55
-Bug-Debian: https://bugs.debian.org/777405
-Patch-Name: fixes/podman-pipe.diff
-Upstream-Status: Pending
----
- cpan/podlators/lib/Pod/Man.pm     | 15 +++++++++++++++
- cpan/podlators/scripts/pod2man.PL |  4 ++++
- cpan/podlators/t/devise-title.t   | 32 ++++++++++++++++++++++++++++++++
- 3 files changed, 51 insertions(+)
- create mode 100755 cpan/podlators/t/devise-title.t
-
-diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
-index 8997a15..969eaff 100644
---- a/cpan/podlators/lib/Pod/Man.pm
-+++ b/cpan/podlators/lib/Pod/Man.pm
-@@ -828,6 +828,17 @@ sub devise_title {
-     $section = 3 if (!$$self{section} && $name =~ /\.pm\z/i);
-     $name =~ s/\.p(od|[lm])\z//i;
- 
-+    # If Pod::Parser gave us an IO::File reference as the source file name,
-+    # convert that to the empty string as well.  Then, if we don't have a
-+    # valid name, emit a warning and convert it to STDIN.
-+    if ($name =~ /^IO::File(?:=\w+)\(0x[\da-f]+\)$/i) {
-+        $name = '';
-+    }
-+    if ($name eq '') {
-+        $self->whine (1, 'No name given for document');
-+        $name = 'STDIN';
-+    }
-+
-     # If the section isn't 3, then the name defaults to just the basename of
-     # the file.  Otherwise, assume we're dealing with a module.  We want to
-     # figure out the full module name from the path to the file, but we don't
-@@ -1705,6 +1716,10 @@ module path.  If it is, a path like C<.../lib/Pod/Man.pm> is converted into
- a name like C<Pod::Man>.  This option, if given, overrides any automatic
- determination of the name.
- 
-+If generating a manual page from standard input, this option is required,
-+since there's otherwise no way for Pod::Man to know what to use for the
-+manual page name.
-+
- =item nourls
- 
- Normally, LZ<><> formatting codes with a URL but anchor text are formatted
-diff --git a/cpan/podlators/scripts/pod2man.PL b/cpan/podlators/scripts/pod2man.PL
-index 38695f8..43e35df 100644
---- a/cpan/podlators/scripts/pod2man.PL
-+++ b/cpan/podlators/scripts/pod2man.PL
-@@ -236,6 +236,10 @@ Note that this option is probably not useful when converting multiple POD
- files at once.  The convention for Unix man pages for commands is for the
- man page title to be in all-uppercase even if the command isn't.
- 
-+When converting POD source from standard input, this option is required,
-+since there's otherwise no way to know what to use as the name of the
-+manual page.
-+
- =item B<--nourls>
- 
- Normally, LZ<><> formatting codes with a URL but anchor text are formatted
-diff --git a/cpan/podlators/t/devise-title.t b/cpan/podlators/t/devise-title.t
-new file mode 100755
-index 0000000..8639441
---- /dev/null
-+++ b/cpan/podlators/t/devise-title.t
-@@ -0,0 +1,32 @@
-+#!/usr/bin/perl
-+#
-+# Tests for the automatic determination of the manual page title if not
-+# specified via options to pod2man or the Pod::Man constructor.
-+
-+use 5.006;
-+use strict;
-+use warnings;
-+
-+use File::Spec;
-+use IO::File;
-+use Test::More tests => 3;
-+
-+BEGIN {
-+    use_ok('Pod::Man');
-+}
-+
-+# Create a parser and set it up with an input source.  There isn't a way to do
-+# this in Pod::Simple without actually parsing the document, so send the
-+# output to a string that we'll ignore.
-+my $path = File::Spec->catdir('t', 'data', 'basic.pod');
-+my $handle = IO::File->new($path, 'r');
-+my $parser = Pod::Man->new(errors => 'pod');
-+my $output;
-+$parser->output_string(\$output);
-+$parser->parse_file($handle);
-+
-+# Check the results of devise_title for this.  We should get back STDIN, and
-+# we should have reported an error.
-+my ($name, $section) = $parser->devise_title;
-+is($name, 'STDIN', 'devise_title uses STDIN for file handle input');
-+ok($parser->errors_seen, '...and errors were seen');
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
deleted file mode 100644
index b6ae409ac0..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc-docs.diff
+++ /dev/null
@@ -1,87 +0,0 @@
-From 6198856b5323d6204094293f01b890472618f182 Mon Sep 17 00:00:00 2001
-From: Russ Allbery <rra@cpan.org>
-Date: Wed, 15 Apr 2015 20:49:07 -0700
-Subject: Documentation and test suite updates for UTC fix
-
-Update the Pod::Man and pod2man documentation and the test suite
-for the new UTC-based default page footer, and add a Changes
-entry.
-
-(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
-
-Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=52db93bf80e4a06f8497e4ebade0506b6ee0e70d
-Bug-Debian: https://bugs.debian.org/780259
-Patch-Name: fixes/podman-utc-docs.diff
-Upstream-Status: Pending
----
- cpan/podlators/lib/Pod/Man.pm     |  6 +++++-
- cpan/podlators/scripts/pod2man.PL | 11 ++++++-----
- cpan/podlators/t/devise-date.t    |  2 +-
- 3 files changed, 12 insertions(+), 7 deletions(-)
-
-diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
-index c3ba201..365892e 100644
---- a/cpan/podlators/lib/Pod/Man.pm
-+++ b/cpan/podlators/lib/Pod/Man.pm
-@@ -910,6 +910,8 @@ sub devise_date {
- 
-     # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker uses
-     # this and it has to work in the core which can't load dynamic libraries.
-+    # Use gmtime instead of localtime so that the generated man page does not
-+    # depend on the local time zone setting and is more reproducible
-     my ($year, $month, $day) = (gmtime($time))[5,4,3];
-     return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
- }
-@@ -1656,7 +1658,9 @@ environment variable POD_MAN_DATE, if set, will be used.  Failing that,
- the modification date of the input file will be used, or the current time
- if stat() can't find that file (which will be the case if the input is
- from C<STDIN>).  If obtained from the file modification date or the
--current time, he date will be formatted as C<YYYY-MM-DD>.
-+current time, the date will be formatted as C<YYYY-MM-DD> and will be based
-+on UTC (so that the output will be reproducible regardless of local time
-+zone).
- 
- =item errors
- 
-diff --git a/cpan/podlators/scripts/pod2man.PL b/cpan/podlators/scripts/pod2man.PL
-index 6af3474..38695f8 100644
---- a/cpan/podlators/scripts/pod2man.PL
-+++ b/cpan/podlators/scripts/pod2man.PL
-@@ -174,9 +174,10 @@ Contributed Perl Documentation", but also see B<--official> below.
- 
- =item B<-d> I<string>, B<--date>=I<string>
- 
--Set the left-hand footer string to this value.  By default, the modification
--date of the input file will be used, or the current date if input comes from
--C<STDIN>.
-+Set the left-hand footer string to this value.  By default, the
-+modification date of the input file will be used, or the current date if
-+input comes from C<STDIN>, and will be based on UTC (so that the output
-+will be reproducible regardless of local time zone).
- 
- =item B<-errors>=I<style>
- 
-@@ -383,8 +384,8 @@ B<pod2man> by Larry Wall and Tom Christiansen.
- 
- =head1 COPYRIGHT AND LICENSE
- 
--Copyright 1999, 2000, 2001, 2004, 2006, 2008, 2010, 2012, 2013 Russ
--Allbery <rra@stanford.edu>.
-+Copyright 1999, 2000, 2001, 2004, 2006, 2008, 2010, 2012, 2013, 2014,
-+2015 Russ Allbery <rra@cpan.org>.
- 
- This program is free software; you may redistribute it and/or modify it
- under the same terms as Perl itself.
-diff --git a/cpan/podlators/t/devise-date.t b/cpan/podlators/t/devise-date.t
-index c610dd9..9da9d1b 100644
---- a/cpan/podlators/t/devise-date.t
-+++ b/cpan/podlators/t/devise-date.t
-@@ -19,7 +19,7 @@ use Test::More tests => 2;
- my $parser = Pod::Man->new;
- is(
-     $parser->devise_date,
--    strftime('%Y-%m-%d', localtime()),
-+    strftime('%Y-%m-%d', gmtime()),
-     'devise_date matches strftime'
- );
- 
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff b/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
deleted file mode 100644
index 3fb7c20dde..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/fixes/podman-utc.diff
+++ /dev/null
@@ -1,34 +0,0 @@
-From c796775cdbd2cce06acbb7ac355187d4063017a2 Mon Sep 17 00:00:00 2001
-From: Chris Lamb <lamby@debian.org>
-Date: Wed, 15 Apr 2015 20:42:53 -0700
-Subject: Make the embedded date from Pod::Man reproducible
-
-While working on the "reproducible builds" effort, we have noticed
-that Pod::Man generates output that varies depending on the current
-timezone.
-
-The attached patch fixes this by using GMT (~UTC) dates instead.
-
-(backported to Perl 5.20.2 by Niko Tyni <ntyni@debian.org>)
-
-Origin: upstream, http://git.eyrie.org/?p=perl/podlators.git;a=commitdiff;h=913fbb2bd2ce071e20128629302ae2852554cad4
-Bug-Debian: https://bugs.debian.org/780259
-Patch-Name: fixes/podman-utc.diff
-Upstream-Status: Pending
----
- cpan/podlators/lib/Pod/Man.pm | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cpan/podlators/lib/Pod/Man.pm b/cpan/podlators/lib/Pod/Man.pm
-index 0536662..c3ba201 100644
---- a/cpan/podlators/lib/Pod/Man.pm
-+++ b/cpan/podlators/lib/Pod/Man.pm
-@@ -910,7 +910,7 @@ sub devise_date {
- 
-     # Can't use POSIX::strftime(), which uses Fcntl, because MakeMaker uses
-     # this and it has to work in the core which can't load dynamic libraries.
--    my ($year, $month, $day) = (localtime($time))[5,4,3];
-+    my ($year, $month, $day) = (gmtime($time))[5,4,3];
-     return sprintf("%04d-%02d-%02d", $year + 1900, $month + 1, $day);
- }
- 
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
index c8663f5357..4c315dcc2d 100644
--- a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
@@ -1,4 +1,4 @@
-From d9d535ef97f57af6e9728075944c33f3b0b5372f Mon Sep 17 00:00:00 2001
+From 552d05c7b55289a3264f66a0d1a3b668a27db811 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Respect umask during installation
@@ -7,17 +7,16 @@ This is needed to satisfy Debian policy regarding group-writable
 site directories.
 
 Patch-Name: fixes/respect_umask.diff
-Upstream-Status: Pending
 ---
  cpan/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
  2 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm b/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
-index 1e8ac4c..3e79121 100644
+index 047c007145..cd7e4f234c 100644
 --- a/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
 +++ b/cpan/ExtUtils-Install/lib/ExtUtils/Install.pm
-@@ -451,7 +451,7 @@ sub _can_write_dir {
+@@ -463,7 +463,7 @@ sub _can_write_dir {
  
  =pod
  
@@ -26,7 +25,7 @@ index 1e8ac4c..3e79121 100644
  
  Wrapper around File::Path::mkpath() to handle errors.
  
-@@ -468,13 +468,13 @@ writable.
+@@ -480,13 +480,13 @@ writable.
  =cut
  
  sub _mkpath {
@@ -43,7 +42,7 @@ index 1e8ac4c..3e79121 100644
              _choke("Can't create '$dir'","$@");
          }
  
-@@ -783,7 +783,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -799,7 +799,7 @@ sub install { #XXX OS-SPECIFIC
          _chdir($cwd);
      }
      foreach my $targetdir (sort keys %check_dirs) {
@@ -52,7 +51,7 @@ index 1e8ac4c..3e79121 100644
      }
      foreach my $found (@found_files) {
          my ($diff, $ffd, $origfile, $mode, $size, $atime, $mtime,
-@@ -797,7 +797,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -813,7 +813,7 @@ sub install { #XXX OS-SPECIFIC
                      $targetfile= _unlink_or_rename( $targetfile, 'tryhard', 'install' )
                          unless $dry_run;
                  } elsif ( ! -d $targetdir ) {
@@ -61,7 +60,7 @@ index 1e8ac4c..3e79121 100644
                  }
                  print "Installing $targetfile\n";
  
-@@ -837,7 +837,7 @@ sub install { #XXX OS-SPECIFIC
+@@ -853,7 +853,7 @@ sub install { #XXX OS-SPECIFIC
  
      if ($pack{'write'}) {
          $dir = install_rooted_dir(dirname($pack{'write'}));
@@ -70,16 +69,16 @@ index 1e8ac4c..3e79121 100644
          print "Writing $pack{'write'}\n" if $verbose;
          $packlist->write(install_rooted_file($pack{'write'})) unless $dry_run;
      }
-@@ -1180,7 +1180,7 @@ environment variable will silence this output.
+@@ -1199,7 +1199,7 @@ environment variable will silence this output.
  sub pm_to_blib {
      my($fromto,$autodir,$pm_filter) = @_;
  
--    _mkpath($autodir,0,0755);
-+    _mkpath($autodir,0);
+-    _mkpath($autodir,0,0755) if defined $autodir;
++    _mkpath($autodir,0) if defined $autodir;
      while(my($from, $to) = each %$fromto) {
          if( -f $to && -s $from == -s $to && -M $to < -M $from ) {
              print "Skip $to (unchanged)\n" unless $INSTALL_QUIET;
-@@ -1203,7 +1203,7 @@ sub pm_to_blib {
+@@ -1222,7 +1222,7 @@ sub pm_to_blib {
              # we wont try hard here. its too likely to mess things up.
              forceunlink($to);
          } else {
@@ -89,10 +88,10 @@ index 1e8ac4c..3e79121 100644
          if ($need_filtering) {
              run_filter($pm_filter, $from, $to);
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index f63145c..197f102 100644
+index fe53be12ef..274e35c6fc 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2118,7 +2118,7 @@ doc__install : doc_site_install
+@@ -2229,7 +2229,7 @@ doc__install : doc_site_install
  	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site
  
  pure_perl_install :: all
@@ -101,7 +100,7 @@ index f63145c..197f102 100644
  };
  
      push @m,
-@@ -2138,7 +2138,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
+@@ -2249,7 +2249,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
  
  
  pure_site_install :: all
@@ -110,7 +109,7 @@ index f63145c..197f102 100644
  };
      push @m,
  q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
-@@ -2156,7 +2156,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
+@@ -2267,7 +2267,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
  		"}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{"
  
  pure_vendor_install :: all
@@ -119,7 +118,7 @@ index f63145c..197f102 100644
  };
      push @m,
  q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
-@@ -2188,8 +2188,8 @@ doc_vendor_install :: all
+@@ -2299,8 +2299,8 @@ doc_vendor_install :: all
      push @m, q{
  doc_perl_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
@@ -128,9 +127,9 @@ index f63145c..197f102 100644
 +	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
 +	-$(NOECHO) umask 022; $(DOC_INSTALL) \
  		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLPRIVLIB) \
+ 		"installed into" "$(INSTALLPRIVLIB)" \
  		LINKTYPE "$(LINKTYPE)" \
-@@ -2199,8 +2199,8 @@ doc_perl_install :: all
+@@ -2310,8 +2310,8 @@ doc_perl_install :: all
  
  doc_site_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
@@ -139,9 +138,9 @@ index f63145c..197f102 100644
 +	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
 +	-$(NOECHO) umask 022; $(DOC_INSTALL) \
  		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLSITELIB) \
+ 		"installed into" "$(INSTALLSITELIB)" \
  		LINKTYPE "$(LINKTYPE)" \
-@@ -2210,8 +2210,8 @@ doc_site_install :: all
+@@ -2321,8 +2321,8 @@ doc_site_install :: all
  
  doc_vendor_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
@@ -150,5 +149,5 @@ index f63145c..197f102 100644
 +	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
 +	-$(NOECHO) umask 022; $(DOC_INSTALL) \
  		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLVENDORLIB) \
+ 		"installed into" "$(INSTALLVENDORLIB)" \
  		LINKTYPE "$(LINKTYPE)" \
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/storable-crosscompile.diff b/meta/recipes-devtools/perl/perl/debian/fixes/storable-crosscompile.diff
new file mode 100644
index 0000000000..defc8514b5
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/storable-crosscompile.diff
@@ -0,0 +1,72 @@
+From b66b0405f4b6cc045bc87910f4be54a7323e56e7 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Mon, 30 Jul 2018 21:00:52 +1000
+Subject: (perl #133411) don't try to load Storable with -Dusecrosscompile
+
+Origin: https://perl5.git.perl.org/perl.git/commit/edf639fce3e8c8852ee4179ab902b357b1deba98
+Bug: https://rt.perl.org/Public/Bug/Display.html?id=133411
+Patch-Name: fixes/storable-crosscompile.diff
+---
+ dist/Storable/Makefile.PL |  9 ++++++++-
+ dist/Storable/stacksize   | 10 +++++++---
+ 2 files changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/dist/Storable/Makefile.PL b/dist/Storable/Makefile.PL
+index 4f02132776..69efc82944 100644
+--- a/dist/Storable/Makefile.PL
++++ b/dist/Storable/Makefile.PL
+@@ -92,11 +92,18 @@ sub depend {
+         # blib.pm needs arch/lib
+         $extra_deps = ' Storable.pm';
+     }
++    my $whichperl;
++    if ($Config::Config{usecrosscompile}) {
++        $whichperl = '$(PERLRUN)';
++    }
++    else {
++        $whichperl = '$(FULLPERLRUNINST)';
++    }
+     my $linktype = uc($_[0]->{LINKTYPE});
+     "
+ $limit_pm : stacksize \$(INST_$linktype)$extra_deps
+ 	\$(MKPATH) \$(INST_LIB)
+-	\$(FULLPERLRUNINST) stacksize $options
++	$whichperl stacksize $options
+ 
+ release : dist
+ 	git tag \$(VERSION)
+diff --git a/dist/Storable/stacksize b/dist/Storable/stacksize
+index 7abd3a84cc..14e0739734 100644
+--- a/dist/Storable/stacksize
++++ b/dist/Storable/stacksize
+@@ -7,6 +7,9 @@ use Cwd;
+ use File::Spec;
+ use strict;
+ 
++-d "lib" or mkdir "lib";
++-d "lib/Storable" or mkdir "lib/Storable";
++
+ my $fn = "lib/Storable/Limit.pm";
+ my $ptrsize = $Config{ptrsize};
+ my ($bad1, $bad2) = (65001, 25000);
+@@ -29,6 +32,10 @@ sub is_miniperl {
+ }
+ 
+ if (is_miniperl()) {
++    if ($Config{usecrosscompile}) {
++        write_limits(500, 265);
++        exit;
++    }
+     die "Should not run during miniperl\n";
+ }
+ my $prefix = "";
+@@ -68,9 +75,6 @@ if ($ENV{PERL_CORE}) {
+     }
+ }
+ 
+--d "lib" or mkdir "lib";
+--d "lib/Storable" or mkdir "lib/Storable";
+-
+ if ($^O eq "MSWin32") {
+     require Win32;
+     my ($str, $major, $minor) = Win32::GetOSVersion();
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/storable-prereq.diff b/meta/recipes-devtools/perl/perl/debian/fixes/storable-prereq.diff
new file mode 100644
index 0000000000..de592ca269
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/storable-prereq.diff
@@ -0,0 +1,48 @@
+From 66cf7a04f70df89ae556be1923a801f0d47e663d Mon Sep 17 00:00:00 2001
+From: Sawyer X <xsawyerx@cpan.org>
+Date: Fri, 27 Apr 2018 20:35:42 +0300
+Subject: Storable: fix for strawberry build failures:
+
+Provided by Graham @haarg Knop.
+
+Origin: upstream, https://perl5.git.perl.org/perl.git/commit/3f4cad1bbe7c6238adba5abb2415775a74eded4d
+Patch-Name: fixes/storable-prereq.diff
+---
+ dist/Storable/Makefile.PL | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/dist/Storable/Makefile.PL b/dist/Storable/Makefile.PL
+index 697750566d..4f02132776 100644
+--- a/dist/Storable/Makefile.PL
++++ b/dist/Storable/Makefile.PL
+@@ -14,10 +14,12 @@ use File::Spec;
+ 
+ unlink "lib/Storable/Limit.pm";
+ 
++my $limit_pm = File::Spec->catfile('lib', 'Storable', 'Limit.pm');
++
+ my $pm = { 'Storable.pm' => '$(INST_ARCHLIB)/Storable.pm' };
+ unless ($ENV{PERL_CORE}) {
+     # the core Makefile takes care of this for core builds
+-    $pm->{"lib/Storable/Limit.pm"} = '$(INST_ARCHLIB)/Storable/Limit.pm';
++    $pm->{$limit_pm} = '$(INST_ARCHLIB)/Storable/Limit.pm';
+ }
+ 
+ WriteMakefile(
+@@ -91,7 +93,6 @@ sub depend {
+         $extra_deps = ' Storable.pm';
+     }
+     my $linktype = uc($_[0]->{LINKTYPE});
+-    my $limit_pm = File::Spec->catfile('lib', 'Storable', 'Limit.pm');
+     "
+ $limit_pm : stacksize \$(INST_$linktype)$extra_deps
+ 	\$(MKPATH) \$(INST_LIB)
+@@ -111,7 +112,7 @@ sub test {
+     my $out = $self->SUPER::test(%attr);
+ 
+     if ($ENV{PERL_CORE}) {
+-        $out =~ s!^(test(?:db)?_(?:static|dynamic)\b.*)!$1 lib/Storable/Limit.pm!gm;
++        $out =~ s!^(test(?:db)?_(?:static|dynamic)\b.*)!$1 $limit_pm!gm;
+     }
+ 
+     $out;
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/storable-recursion.diff b/meta/recipes-devtools/perl/perl/debian/fixes/storable-recursion.diff
new file mode 100644
index 0000000000..fa6ab4ba37
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/storable-recursion.diff
@@ -0,0 +1,292 @@
+From 8953645143f1f751bdc5e6c5f5a2dc9c2efbe7e9 Mon Sep 17 00:00:00 2001
+From: Tony Cook <tony@develop-help.com>
+Date: Tue, 7 Aug 2018 15:34:06 +1000
+Subject: (perl #133326) fix and clarify handling of recurs_sv.
+
+There were a few problems:
+
+- the purpose of recur_sv wasn't clear, I believe I understand it
+  now from looking at where recur_sv was actually being used.
+  Frankly the logic of the code itself was hard to follow, apparently
+  only counting a level if the recur_sv was equal to the current
+  SV.
+
+  Fixed by adding some documentation to recur_sv in the context
+  structure.  The logic has been re-worked (see below) to hopefully
+  make it more understandable.
+
+- the conditional checks for inc/decrementing recur_depth didn't
+  match between the beginnings and ends of the store_array() and
+  store_hash() handlers didn't match, since recur_sv was both
+  explicitly modified by those functions and implicitly modified
+  in their recursive calls to process elements.
+
+  Fixing by storing the starting value of cxt->recur_sv locally
+  testing against that instead of against the value that might be
+  modified recursively.
+
+- the checks in store_ref(), store_array(), store_l?hash() were
+  over complex, obscuring their purpose.
+
+  Fixed by:
+   - always count a recursion level in store_ref() and store the
+     RV in recur_sv
+   - only count a recursion level in the array/hash handlers if
+     the SV didn't match.
+   - skip the check against cxt->entry, if we're in this code
+     we could be recursing, so we want to detect it.
+
+- (after the other changes) the recursion checks in store_hash()/
+  store_lhash() only checked the limit if the SV didn't match the
+  recur_sv, which horribly broke things.
+
+  Fixed by:
+   - Now only make the depth increment conditional, and always
+     check against the limit if one is set.
+
+Origin: upstream, https://perl5.git.perl.org/perl.git/commit/120060c86e233cb9f588314214137f3ed1b48e2a
+Bug: https://rt.perl.org/Public/Bug/Display.html?id=133326
+Bug-Debian: https://bugs.debian.org/912900
+Patch-Name: fixes/storable-recursion.diff
+---
+ dist/Storable/Storable.xs | 98 ++++++++++++++++++++++++++++++-----------------
+ dist/Storable/t/recurse.t | 16 +++++++-
+ 2 files changed, 77 insertions(+), 37 deletions(-)
+
+diff --git a/dist/Storable/Storable.xs b/dist/Storable/Storable.xs
+index 6a90e24814..f6df32b121 100644
+--- a/dist/Storable/Storable.xs
++++ b/dist/Storable/Storable.xs
+@@ -418,6 +418,24 @@ typedef struct stcxt {
+     SV *(**retrieve_vtbl)(pTHX_ struct stcxt *, const char *);	/* retrieve dispatch table */
+     SV *prev;			/* contexts chained backwards in real recursion */
+     SV *my_sv;			/* the blessed scalar who's SvPVX() I am */
++
++    /* recur_sv:
++
++       A hashref of hashrefs or arrayref of arrayrefs is actually a
++       chain of four SVs, eg for an array ref containing an array ref:
++
++         RV -> AV (element) -> RV -> AV
++
++       To make this depth appear natural from a perl level we only
++       want to count this as two levels, so store_ref() stores it's RV
++       into recur_sv and store_array()/store_hash() will only count
++       that level if the AV/HV *isn't* recur_sv.
++
++       We can't just have store_hash()/store_array() not count that
++       level, since it's possible for XS code to store an AV or HV
++       directly as an element (though perl code trying to access such
++       an object will generally croak.)
++     */
+     SV *recur_sv;               /* check only one recursive SV */
+     int in_retrieve_overloaded; /* performance hack for retrieving overloaded objects */
+     int flags;			/* controls whether to bless or tie objects */
+@@ -431,8 +449,13 @@ typedef struct stcxt {
+ 
+ #define RECURSION_TOO_DEEP() \
+     (cxt->max_recur_depth != -1 && ++cxt->recur_depth > cxt->max_recur_depth)
++
++/* There's cases where we need to check whether the hash recursion
++   limit has been reached without bumping the recursion levels, so the
++   hash check doesn't bump the depth.
++*/
+ #define RECURSION_TOO_DEEP_HASH() \
+-    (cxt->max_recur_depth_hash != -1 && ++cxt->recur_depth > cxt->max_recur_depth_hash)
++    (cxt->max_recur_depth_hash != -1 && cxt->recur_depth > cxt->max_recur_depth_hash)
+ #define MAX_DEPTH_ERROR "Max. recursion depth with nested structures exceeded"
+ 
+ static int storable_free(pTHX_ SV *sv, MAGIC* mg);
+@@ -2360,21 +2383,20 @@ static int store_ref(pTHX_ stcxt_t *cxt, SV *sv)
+     } else
+         PUTMARK(is_weak ? SX_WEAKREF : SX_REF);
+ 
+-    TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recur_depth,
+-             PTR2UV(cxt->recur_sv)));
+-    if (cxt->entry && cxt->recur_sv == sv) {
+-        if (RECURSION_TOO_DEEP()) {
++    cxt->recur_sv = sv;
++
++    TRACEME((">ref recur_depth %" IVdf ", recur_sv (0x%" UVxf ") max %" IVdf, cxt->recur_depth,
++             PTR2UV(cxt->recur_sv), cxt->max_recur_depth));
++    if (RECURSION_TOO_DEEP()) {
+ #if PERL_VERSION < 15
+-            cleanup_recursive_data(aTHX_ (SV*)sv);
++        cleanup_recursive_data(aTHX_ (SV*)sv);
+ #endif
+-            CROAK((MAX_DEPTH_ERROR));
+-        }
++        CROAK((MAX_DEPTH_ERROR));
+     }
+-    cxt->recur_sv = sv;
+ 
+     retval = store(aTHX_ cxt, sv);
+-    if (cxt->entry && cxt->recur_sv == sv && cxt->recur_depth > 0) {
+-        TRACEME(("recur_depth --%" IVdf, cxt->recur_depth));
++    if (cxt->max_recur_depth != -1 && cxt->recur_depth > 0) {
++        TRACEME(("<ref recur_depth --%" IVdf, cxt->recur_depth));
+         --cxt->recur_depth;
+     }
+     return retval;
+@@ -2635,6 +2657,7 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
+     UV len = av_len(av) + 1;
+     UV i;
+     int ret;
++    SV *const recur_sv = cxt->recur_sv;
+ 
+     TRACEME(("store_array (0x%" UVxf ")", PTR2UV(av)));
+ 
+@@ -2659,9 +2682,9 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
+         TRACEME(("size = %d", (int)l));
+     }
+ 
+-    TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recur_depth,
+-             PTR2UV(cxt->recur_sv)));
+-    if (cxt->entry && cxt->recur_sv == (SV*)av) {
++    TRACEME((">array recur_depth %" IVdf ", recur_sv (0x%" UVxf ") max %" IVdf, cxt->recur_depth,
++             PTR2UV(cxt->recur_sv), cxt->max_recur_depth));
++    if (recur_sv != (SV*)av) {
+         if (RECURSION_TOO_DEEP()) {
+             /* with <= 5.14 it recurses in the cleanup also, needing 2x stack size */
+ #if PERL_VERSION < 15
+@@ -2670,7 +2693,6 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
+             CROAK((MAX_DEPTH_ERROR));
+         }
+     }
+-    cxt->recur_sv = (SV*)av;
+ 
+     /*
+      * Now store each item recursively.
+@@ -2701,9 +2723,12 @@ static int store_array(pTHX_ stcxt_t *cxt, AV *av)
+             return ret;
+     }
+ 
+-    if (cxt->entry && cxt->recur_sv == (SV*)av && cxt->recur_depth > 0) {
+-        TRACEME(("recur_depth --%" IVdf, cxt->recur_depth));
+-        --cxt->recur_depth;
++    if (recur_sv != (SV*)av) {
++        assert(cxt->max_recur_depth == -1 || cxt->recur_depth > 0);
++        if (cxt->max_recur_depth != -1 && cxt->recur_depth > 0) {
++            TRACEME(("<array recur_depth --%" IVdf, cxt->recur_depth));
++            --cxt->recur_depth;
++        }
+     }
+     TRACEME(("ok (array)"));
+ 
+@@ -2766,6 +2791,7 @@ static int store_hash(pTHX_ stcxt_t *cxt, HV *hv)
+ #endif
+                          ) ? 1 : 0);
+     unsigned char hash_flags = (SvREADONLY(hv) ? SHV_RESTRICTED : 0);
++    SV * const recur_sv = cxt->recur_sv;
+ 
+     /* 
+      * Signal hash by emitting SX_HASH, followed by the table length.
+@@ -2817,17 +2843,17 @@ static int store_hash(pTHX_ stcxt_t *cxt, HV *hv)
+         TRACEME(("size = %d, used = %d", (int)l, (int)HvUSEDKEYS(hv)));
+     }
+ 
+-    TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recur_depth,
+-             PTR2UV(cxt->recur_sv)));
+-    if (cxt->entry && cxt->recur_sv == (SV*)hv) {
+-        if (RECURSION_TOO_DEEP_HASH()) {
++    TRACEME((">hash recur_depth %" IVdf ", recur_sv (0x%" UVxf ") max %" IVdf, cxt->recur_depth,
++             PTR2UV(cxt->recur_sv), cxt->max_recur_depth_hash));
++    if (recur_sv != (SV*)hv && cxt->max_recur_depth_hash != -1) {
++        ++cxt->recur_depth;
++    }
++    if (RECURSION_TOO_DEEP_HASH()) {
+ #if PERL_VERSION < 15
+-            cleanup_recursive_data(aTHX_ (SV*)hv);
++        cleanup_recursive_data(aTHX_ (SV*)hv);
+ #endif
+-            CROAK((MAX_DEPTH_ERROR));
+-        }
++        CROAK((MAX_DEPTH_ERROR));
+     }
+-    cxt->recur_sv = (SV*)hv;
+ 
+     /*
+      * Save possible iteration state via each() on that table.
+@@ -3107,8 +3133,9 @@ static int store_hash(pTHX_ stcxt_t *cxt, HV *hv)
+     TRACEME(("ok (hash 0x%" UVxf ")", PTR2UV(hv)));
+ 
+  out:
+-    if (cxt->entry && cxt->recur_sv == (SV*)hv && cxt->recur_depth > 0) {
+-        TRACEME(("recur_depth --%" IVdf , cxt->recur_depth));
++    assert(cxt->max_recur_depth_hash != -1 && cxt->recur_depth > 0);
++    TRACEME(("<hash recur_depth --%" IVdf , cxt->recur_depth));
++    if (cxt->max_recur_depth_hash != -1 && recur_sv != (SV*)hv && cxt->recur_depth > 0) {
+         --cxt->recur_depth;
+     }
+     HvRITER_set(hv, riter);		/* Restore hash iterator state */
+@@ -3221,6 +3248,7 @@ static int store_lhash(pTHX_ stcxt_t *cxt, HV *hv, unsigned char hash_flags)
+ #ifdef DEBUGME
+     UV len = (UV)HvTOTALKEYS(hv);
+ #endif
++    SV * const recur_sv = cxt->recur_sv;
+     if (hash_flags) {
+         TRACEME(("store_lhash (0x%" UVxf ") (flags %x)", PTR2UV(hv),
+                  (int) hash_flags));
+@@ -3231,15 +3259,15 @@ static int store_lhash(pTHX_ stcxt_t *cxt, HV *hv, unsigned char hash_flags)
+ 
+     TRACEME(("recur_depth %" IVdf ", recur_sv (0x%" UVxf ")", cxt->recur_depth,
+              PTR2UV(cxt->recur_sv)));
+-    if (cxt->entry && cxt->recur_sv == (SV*)hv) {
+-        if (RECURSION_TOO_DEEP_HASH()) {
++    if (recur_sv != (SV*)hv && cxt->max_recur_depth_hash != -1) {
++        ++cxt->recur_depth;
++    }
++    if (RECURSION_TOO_DEEP_HASH()) {
+ #if PERL_VERSION < 15
+-            cleanup_recursive_data(aTHX_ (SV*)hv);
++        cleanup_recursive_data(aTHX_ (SV*)hv);
+ #endif
+-            CROAK((MAX_DEPTH_ERROR));
+-        }
++        CROAK((MAX_DEPTH_ERROR));
+     }
+-    cxt->recur_sv = (SV*)hv;
+ 
+     array = HvARRAY(hv);
+     for (i = 0; i <= (Size_t)HvMAX(hv); i++) {
+@@ -3252,7 +3280,7 @@ static int store_lhash(pTHX_ stcxt_t *cxt, HV *hv, unsigned char hash_flags)
+                 return ret;
+         }
+     }
+-    if (cxt->entry && cxt->recur_sv == (SV*)hv && cxt->recur_depth > 0) {
++    if (recur_sv == (SV*)hv && cxt->max_recur_depth_hash != -1 && cxt->recur_depth > 0) {
+         TRACEME(("recur_depth --%" IVdf, cxt->recur_depth));
+         --cxt->recur_depth;
+     }
+diff --git a/dist/Storable/t/recurse.t b/dist/Storable/t/recurse.t
+index fa8be0b374..63fde90fdf 100644
+--- a/dist/Storable/t/recurse.t
++++ b/dist/Storable/t/recurse.t
+@@ -20,7 +20,7 @@ use Storable qw(freeze thaw dclone);
+ 
+ $Storable::flags = Storable::FLAGS_COMPAT;
+ 
+-use Test::More tests => 38;
++use Test::More tests => 39;
+ 
+ package OBJ_REAL;
+ 
+@@ -364,5 +364,17 @@ else {
+         dclone $t;
+     };
+     like $@, qr/Max\. recursion depth with nested structures exceeded/,
+-      'Caught href stack overflow '.MAX_DEPTH*2;
++      'Caught href stack overflow '.MAX_DEPTH_HASH*2;
++}
++
++{
++    # perl #133326
++    my @tt;
++    #$Storable::DEBUGME=1;
++    for (1..16000) {
++        my $t = [[[]]];
++        push @tt, $t;
++    }
++    ok(eval { dclone \@tt; 1 },
++       "low depth structure shouldn't be treated as nested");
+ }
diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/time-local-2020.diff b/meta/recipes-devtools/perl/perl/debian/fixes/time-local-2020.diff
new file mode 100644
index 0000000000..de58fe2c0d
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/fixes/time-local-2020.diff
@@ -0,0 +1,69 @@
+From b4b37d8c6413f18e80fc3e07e70916e4bf58bb38 Mon Sep 17 00:00:00 2001
+From: "Bernhard M. Wiedemann" <bwiedemann@suse.de>
+Date: Fri, 16 Mar 2018 11:44:01 +0100
+Subject: Fix Time::Local tests
+
+in 2020, year 70 changes its meaning to 2070
+so we do what man Time::Local recommends and use 4-digit years
+
+Origin: https://rt.cpan.org/Ticket/Attachment/1776857/956088/0001-Fix-Time-Local-tests.patch
+Bug: https://rt.cpan.org/Public/Bug/Display.html?id=124787
+Bug-Debian: https://bugs.debian.org/915209
+Patch-Name: fixes/time-local-2020.diff
+---
+ cpan/Time-Local/t/Local.t | 11 +++++------
+ 1 file changed, 5 insertions(+), 6 deletions(-)
+
+diff --git a/cpan/Time-Local/t/Local.t b/cpan/Time-Local/t/Local.t
+index 634139695f..e28c6d2129 100644
+--- a/cpan/Time-Local/t/Local.t
++++ b/cpan/Time-Local/t/Local.t
+@@ -96,7 +96,7 @@ SKIP: {
+ 
+         # Test timelocal()
+         {
+-            my $year_in = $year < 70 ? $year + 1900 : $year;
++            my $year_in = $year + 1900;
+             my $time = timelocal( $sec, $min, $hour, $mday, $mon, $year_in );
+ 
+             my ( $s, $m, $h, $D, $M, $Y ) = localtime($time);
+@@ -111,7 +111,7 @@ SKIP: {
+ 
+         # Test timegm()
+         {
+-            my $year_in = $year < 70 ? $year + 1900 : $year;
++            my $year_in = $year + 1900;
+             my $time = timegm( $sec, $min, $hour, $mday, $mon, $year_in );
+ 
+             my ( $s, $m, $h, $D, $M, $Y ) = gmtime($time);
+@@ -128,7 +128,6 @@ SKIP: {
+ 
+ for (@bad_time) {
+     my ( $year, $mon, $mday, $hour, $min, $sec ) = @$_;
+-    $year -= 1900;
+     $mon--;
+ 
+     eval { timegm( $sec, $min, $hour, $mday, $mon, $year ) };
+@@ -138,19 +137,19 @@ for (@bad_time) {
+ 
+ {
+     is(
+-        timelocal( 0, 0, 1, 1, 0, 90 ) - timelocal( 0, 0, 0, 1, 0, 90 ), 3600,
++        timelocal( 0, 0, 1, 1, 0, 1990 ) - timelocal( 0, 0, 0, 1, 0, 1990 ), 3600,
+         'one hour difference between two calls to timelocal'
+     );
+ 
+     is(
+-        timelocal( 1, 2, 3, 1, 0, 100 ) - timelocal( 1, 2, 3, 31, 11, 99 ),
++        timelocal( 1, 2, 3, 1, 0, 2000 ) - timelocal( 1, 2, 3, 31, 11, 1999 ),
+         24 * 3600,
+         'one day difference between two calls to timelocal'
+     );
+ 
+     # Diff beween Jan 1, 1980 and Mar 1, 1980 = (31 + 29 = 60 days)
+     is(
+-        timegm( 0, 0, 0, 1, 2, 80 ) - timegm( 0, 0, 0, 1, 0, 80 ),
++        timegm( 0, 0, 0, 1, 2, 1980 ) - timegm( 0, 0, 0, 1, 0, 1980 ),
+         60 * 24 * 3600,
+         '60 day difference between two calls to timegm'
+     );
diff --git a/meta/recipes-devtools/perl/perl/debian/gdbm-fatal.diff b/meta/recipes-devtools/perl/perl/debian/gdbm-fatal.diff
new file mode 100644
index 0000000000..4414e4c1dd
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/gdbm-fatal.diff
@@ -0,0 +1,26 @@
+From e9ee75345de6560a5d25ca3ea7a3ce0631ab46b4 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sun, 12 Aug 2018 11:23:24 +0300
+Subject: Temporarily skip GDBM_File fatal.t for gdbm >= 1.15 compatibility
+
+Bug-Debian: https://bugs.debian.org/904005
+Bug: https://rt.perl.org/Public/Bug/Display.html?id=133295
+Patch-Name: debian/gdbm-fatal.diff
+---
+ ext/GDBM_File/t/fatal.t | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/ext/GDBM_File/t/fatal.t b/ext/GDBM_File/t/fatal.t
+index 0e426d4dbc..3df6878f8c 100644
+--- a/ext/GDBM_File/t/fatal.t
++++ b/ext/GDBM_File/t/fatal.t
+@@ -12,6 +12,9 @@ BEGIN {
+     plan(skip_all => "GDBM_File is flaky in $^O")
+         if $^O =~ /darwin/;
+ 
++    # temporary workaround for https://bugs.debian.org/904005
++    plan(skip_all => "to be revised for gdbm >= 1.15 [perl #133295]");
++
+     plan(tests => 8);
+     use_ok('GDBM_File');
+ }
diff --git a/meta/recipes-devtools/perl/perl/debian/installman-utf8.diff b/meta/recipes-devtools/perl/perl/debian/installman-utf8.diff
new file mode 100644
index 0000000000..89994c021b
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/installman-utf8.diff
@@ -0,0 +1,28 @@
+From b6adce77ceda447969a0e240e40b183063fe349d Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sat, 19 Nov 2016 21:30:46 +0200
+Subject: Generate man pages with UTF-8 characters
+
+This fixes totally incorrectly rendered manual pages like
+perlunicook and perltw.
+
+TODO: should probably be a Configure option for proper upstreaming.
+
+Bug-Debian: https://bugs.debian.org/840211
+Patch-Name: debian/installman-utf8.diff
+---
+ installman | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/installman b/installman
+index 0154be4d68..fff0ff04a7 100755
+--- a/installman
++++ b/installman
+@@ -161,6 +161,7 @@ sub pod2man {
+ 	$manpage = "${mandir}/${manpage}.${manext}";
+ 
+         my $parser = Pod::Man->new( section => $manext,
++                                    utf8    => 1,
+                                     official=> 1,
+                                     center  => 'Perl Programmers Reference Guide'
+                                   );
diff --git a/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
index 7e1fd697ca..b21b35fc55 100644
--- a/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/instmodsh_doc.diff
@@ -1,19 +1,18 @@
-From 26209b55201a1b2d25252ac3b425bc49081299de Mon Sep 17 00:00:00 2001
+From db5a9f57cb4267b74627b95911854dfcdfc35263 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Debian policy doesn't install .packlist files for core or vendor.
 
 Patch-Name: debian/instmodsh_doc.diff
-Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/bin/instmodsh | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/cpan/ExtUtils-MakeMaker/bin/instmodsh b/cpan/ExtUtils-MakeMaker/bin/instmodsh
-index 8b9aa95..e551434 100644
+index ab0f9d1ffe..b3b109f475 100644
 --- a/cpan/ExtUtils-MakeMaker/bin/instmodsh
 +++ b/cpan/ExtUtils-MakeMaker/bin/instmodsh
-@@ -18,9 +18,11 @@ instmodsh - A shell to examine installed modules
+@@ -19,9 +19,11 @@ instmodsh - A shell to examine installed modules
  
  =head1 DESCRIPTION
  
diff --git a/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
index ff0b2871f6..ee1933d336 100644
--- a/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/ld_run_path.diff
@@ -1,25 +1,23 @@
-From 53ce69085918232a1b7e26e7762c1b2f70b1eb4a Mon Sep 17 00:00:00 2001
+From 81476c84af194a88675d9fb0c431f33756cce7ac Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Remove standard libs from LD_RUN_PATH as per Debian policy.
 
 Patch-Name: debian/ld_run_path.diff
-Upstream-Status: Pending
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm | 3 +++
- 1 file changed, 3 insertions(+)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm | 2 ++
+ 1 file changed, 2 insertions(+)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-index 37bcfd4..bd66e65 100644
+index a6da855862..fb849b21ca 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-@@ -56,6 +56,9 @@ sub _unix_os2_ext {
-     my ( $pwd )   = cwd();    # from Cwd.pm
-     my ( $found ) = 0;
- 
+@@ -62,6 +62,8 @@ sub _unix_os2_ext {
+         $potential_libs =~ s/(^|\s)(-(?:weak_|reexport_|lazy_)?framework)\s+(\S+)/$1-Wl,$2 -Wl,$3/g;
+         $potential_libs =~ s/(^|\s)(-F)\s*(\S+)/$1-Wl,$2 -Wl,$3/g;
+     }
 +    # Debian-specific: don't use LD_RUN_PATH for standard dirs
 +    $ld_run_path_seen{$_}++ for @libpath;
-+
+ 
      foreach my $thislib ( split ' ', $potential_libs ) {
          my ( $custom_name ) = '';
- 
diff --git a/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
index d5347422dc..98d229f73d 100644
--- a/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl/debian/libnet_config_path.diff
@@ -1,20 +1,19 @@
-From a7f6d453e60256d329469a75b642cca854cebea1 Mon Sep 17 00:00:00 2001
+From ed03c97809c8434088b7fce69c8ebf8891c20faf Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Set location of libnet.cfg to /etc/perl/Net as /usr may not be
  writable.
 
 Patch-Name: debian/libnet_config_path.diff
-Upstream-Status: Pending
 ---
  cpan/libnet/lib/Net/Config.pm | 7 +++----
  1 file changed, 3 insertions(+), 4 deletions(-)
 
 diff --git a/cpan/libnet/lib/Net/Config.pm b/cpan/libnet/lib/Net/Config.pm
-index 953a826..61ba12a 100644
+index 4f822a40a4..4b39781134 100644
 --- a/cpan/libnet/lib/Net/Config.pm
 +++ b/cpan/libnet/lib/Net/Config.pm
-@@ -68,9 +68,8 @@ my %nc = (
+@@ -72,9 +72,8 @@ my %nc = (
  TRY_INTERNET_CONFIG
  }
  
@@ -25,7 +24,7 @@ index 953a826..61ba12a 100644
  if (-f $file) {
    $ref = eval { local $SIG{__DIE__}; do $file };
    if (ref($ref) eq 'HASH') {
-@@ -142,8 +141,8 @@ Net::Config - Local configuration data for libnet
+@@ -146,8 +145,8 @@ Net::Config - Local configuration data for libnet
  C<Net::Config> holds configuration data for the modules in the libnet
  distribution. During installation you will be asked for these values.
  
diff --git a/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
index 0cdc0d3e39..c87b68e32b 100644
--- a/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
+++ b/meta/recipes-devtools/perl/perl/debian/libperl_embed_doc.diff
@@ -1,4 +1,4 @@
-From fb8bdbb4bf56382de099e62c2564286b9dfda46d Mon Sep 17 00:00:00 2001
+From 5e9682a1872abfea37e6b7ea1e8beaf8db149014 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Note that libperl-dev package is required for embedded linking
@@ -6,16 +6,15 @@ Subject: Note that libperl-dev package is required for embedded linking
 Bug-Debian: http://bugs.debian.org/186778
 
 Patch-Name: debian/libperl_embed_doc.diff
-Upstream-Status: Pending
 ---
  lib/ExtUtils/Embed.pm | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/lib/ExtUtils/Embed.pm b/lib/ExtUtils/Embed.pm
-index 3f983c1..0ec8a67 100644
+index e75e41f8c4..985c353457 100644
 --- a/lib/ExtUtils/Embed.pm
 +++ b/lib/ExtUtils/Embed.pm
-@@ -296,6 +296,9 @@ and extensions in your C/C++ applications.
+@@ -293,6 +293,9 @@ and extensions in your C/C++ applications.
  Typically, an application F<Makefile> will invoke C<ExtUtils::Embed>
  functions while building your application.  
  
diff --git a/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff b/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
deleted file mode 100644
index 7cf1242c0a..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/locale-robustness.diff
+++ /dev/null
@@ -1,53 +0,0 @@
-From 289eaf87f8de4d9ebfd661d4e4299c2952435243 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Fri, 10 Apr 2015 10:19:51 +0300
-Subject: Make t/run/locale.t survive missing locales masked by LC_ALL
-
-If LC_ALL is set to a valid locale but another LC_* setting like LC_CTYPE
-isn't, t/run/locale.t would fail because it explicitly unsets LC_ALL,
-unmasking the problem underneath. All the other tests survive such
-a scenario.
-
-While this is clearly an error in the build environment, it's easy to make
-the test more robust by first clearing all the locale relevant variables.
-
-Bug: https://rt.perl.org/Ticket/Display.html?id=124310
-Bug-Debian: https://bugs.debian.org/782068
-Patch-Name: debian/locale-robustness.diff
-Upstream-Status: Pending
----
- t/run/locale.t | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/t/run/locale.t b/t/run/locale.t
-index bd1a034..2105339 100644
---- a/t/run/locale.t
-+++ b/t/run/locale.t
-@@ -27,6 +27,9 @@ my @locales = eval { find_locales( [ &LC_ALL, &LC_CTYPE, &LC_NUMERIC ],
-                                  ) };
- skip_all("no locales available") unless @locales;
- 
-+# reset the locale environment
-+local @ENV{'LANG', (grep /^LC_/, keys %ENV)};
-+
- plan tests => &last;
- 
- my $non_C_locale;
-@@ -58,9 +61,6 @@ EOF
- SKIP: {
-     skip("Windows stores locale defaults in the registry", 1 )
-                                                             if $^O eq 'MSWin32';
--    local $ENV{LC_NUMERIC}; # So not taken as a default
--    local $ENV{LC_ALL}; # so it never overrides LC_NUMERIC
--    local $ENV{LANG};   # So not taken as a default
-     fresh_perl_is("for (qw(@locales)) {\n" . <<'EOF',
-         use POSIX qw(locale_h);
-         use locale;
-@@ -348,7 +348,6 @@ EOF
- 
-     {
- 	local $ENV{LC_NUMERIC} = $different;
--	local $ENV{LC_ALL}; # so it never overrides LC_NUMERIC
- 	fresh_perl_is(<<"EOF",
- 	    use POSIX qw(locale_h);
- 
diff --git a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff b/meta/recipes-devtools/perl/perl/debian/makemaker-manext.diff
similarity index 10%
rename from meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
rename to meta/recipes-devtools/perl/perl/debian/makemaker-manext.diff
index b681c3e892..ae785e500a 100644
--- a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
+++ b/meta/recipes-devtools/perl/perl/debian/makemaker-manext.diff
@@ -1,119 +1,31 @@
-From 914948f026efce02cf0abff8b0312aaad96592ed Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Tue, 8 Mar 2005 19:30:38 +1100
-Subject: Fiddle with *PREFIX and variables written to the makefile
+From 13e0b918a254d33bf1966d61049e6a9f8933d66e Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Wed, 1 Jul 2015 22:23:53 +0300
+Subject: Make EU::MakeMaker honour MANnEXT settings in generated manpage
+ headers
 
-Fiddle with *PREFIX and variables written to the makefile so that
-install directories may be changed when make is run by passing
-PREFIX= to the "make install" command (used when packaging
-modules).
+This was inherited from early changes by Brendan O'Dea, previously
+(accidentally) in debian/prefix_changes.diff and before that in
+debian/extutils_hacks.diff
 
-Patch-Name: debian/prefix_changes.diff
-Upstream-Status: Pending
+Patch-Name: debian/makemaker-manext.diff
+Bug-Debian: https://bugs.debian.org/247370
 ---
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm  | 12 ++++++------
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |  3 +--
- cpan/ExtUtils-MakeMaker/t/INST.t                |  4 +---
- cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t         | 10 +++++-----
- 4 files changed, 13 insertions(+), 16 deletions(-)
+ cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
-index 4c00129..1ea2035 100644
+index 1a3893c30b..8bb0ef2ee9 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
-@@ -902,8 +902,6 @@ all POD files in MAN1PODS and MAN3PODS.
- sub manifypods_target {
-     my($self) = shift;
- 
--    my $man1pods      = '';
--    my $man3pods      = '';
-     my $dependencies  = '';
- 
-     # populate manXpods & dependencies:
-@@ -919,7 +917,7 @@ END
+@@ -1090,8 +1090,8 @@ END
+     my @man_cmds;
      foreach my $section (qw(1 3)) {
          my $pods = $self->{"MAN${section}PODS"};
-         my $p2m = sprintf <<CMD, $] > 5.008 ? " -u" : "";
--	\$(NOECHO) \$(POD2MAN) --section=$section --perm_rw=\$(PERM_RW)%s
+-        my $p2m = sprintf <<'CMD', $section, $] > 5.008 ? " -u" : "";
+-	$(NOECHO) $(POD2MAN) --section=%s --perm_rw=$(PERM_RW)%s
++        my $p2m = sprintf <<CMD, $] > 5.008 ? " -u" : "";
 +	\$(NOECHO) \$(POD2MAN) --section=\$(MAN${section}EXT) --perm_rw=\$(PERM_RW)%s
  CMD
          push @man_cmds, $self->split_command($p2m, map {($_,$pods->{$_})} sort keys %$pods);
      }
-@@ -1875,9 +1873,11 @@ sub init_INSTALL_from_PREFIX {
-         $self->{SITEPREFIX}   ||= $sprefix;
-         $self->{VENDORPREFIX} ||= $vprefix;
- 
--        # Lots of MM extension authors like to use $(PREFIX) so we
--        # put something sensible in there no matter what.
--        $self->{PREFIX} = '$('.uc $self->{INSTALLDIRS}.'PREFIX)';
-+	my $p = $self->{PREFIX} = $self->{PERLPREFIX};
-+	for my $t (qw/PERL SITE VENDOR/)
-+	{
-+	    $self->{"${t}PREFIX"} =~ s!^\Q$p\E(?=/|$)!\$(PREFIX)!;
-+	}
-     }
- 
-     my $arch    = $Config{archname};
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 391dc22..4a8e14c 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -3077,8 +3077,7 @@ sub prefixify {
-     warn "  prefixify $var => $path\n" if $Verbose >= 2;
-     warn "    from $sprefix to $rprefix\n" if $Verbose >= 2;
- 
--    if( $self->{ARGS}{PREFIX} &&
--        $path !~ s{^\Q$sprefix\E\b}{$rprefix}s )
-+    if( $path !~ s{^\Q$sprefix\E\b}{$rprefix}s && $self->{ARGS}{PREFIX} )
-     {
- 
-         warn "    cannot prefix, using default.\n" if $Verbose >= 2;
-diff --git a/cpan/ExtUtils-MakeMaker/t/INST.t b/cpan/ExtUtils-MakeMaker/t/INST.t
-index 91058bb..e399ced 100644
---- a/cpan/ExtUtils-MakeMaker/t/INST.t
-+++ b/cpan/ExtUtils-MakeMaker/t/INST.t
-@@ -65,9 +65,7 @@ isa_ok( $mm, 'ExtUtils::MakeMaker' );
- is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
- is( $mm->{VERSION}, 0.01,            'VERSION' );
- 
--my $config_prefix = $Config{installprefixexp} || $Config{installprefix} ||
--                    $Config{prefixexp}        || $Config{prefix};
--is( $mm->{PERLPREFIX}, $config_prefix,   'PERLPREFIX' );
-+is( $mm->{PERLPREFIX}, '$(PREFIX)',   'PERLPREFIX' );
- 
- is( !!$mm->{PERL_CORE}, !!$ENV{PERL_CORE}, 'PERL_CORE' );
- 
-diff --git a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t b/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
-index e8de7c6..3fb3f12 100644
---- a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
-+++ b/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
-@@ -10,7 +10,7 @@ BEGIN {
- }
- 
- use strict;
--use Test::More tests => 52;
-+use Test::More tests => 47;
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::BFD;
- use ExtUtils::MakeMaker;
-@@ -62,16 +62,16 @@ like( $stdout->read, qr{
-                         (?:Writing\ MYMETA.yml\ and\ MYMETA.json\n)?
- }x );
- 
--is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' );
-+#is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' );
- 
- isa_ok( $mm, 'ExtUtils::MakeMaker' );
- 
- is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
- is( $mm->{VERSION}, 0.01,            'VERSION' );
- 
--foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
--    unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
--}
-+#foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
-+#    unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
-+#}
- 
- 
- my $PREFIX = File::Spec->catdir('foo', 'bar');
diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
index 5f07180893..78e1451b04 100644
--- a/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
+++ b/meta/recipes-devtools/perl/perl/debian/makemaker-pasthru.diff
@@ -1,4 +1,4 @@
-From 593dd52f535b1f439dfd0afe52211ae8960e980a Mon Sep 17 00:00:00 2001
+From 49184395142c9285c8962e049f54a5ca9f411c87 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sun, 24 Aug 2014 12:56:11 -0700
 Subject: Pass LD settings through to subdirectories
@@ -11,16 +11,15 @@ the PASTHRU list fixes this.
 
 Bug-Debian: https://bugs.debian.org/758471
 Patch-Name: debian/makemaker-pasthru.diff
-Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 4a8e14c..548d98e 100644
+index 4977baa15d..bb41b274b3 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2793,7 +2793,7 @@ sub pasthru {
+@@ -2955,7 +2955,7 @@ sub pasthru {
      my($sep) = $Is{VMS} ? ',' : '';
      $sep .= "\\\n\t";
  
diff --git a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff b/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
deleted file mode 100644
index d870b608cf..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/makemaker_customized.diff
+++ /dev/null
@@ -1,43 +0,0 @@
-From 634449066a9c810e81506425d2ca925b2fd72ab2 Mon Sep 17 00:00:00 2001
-From: Dominic Hargreaves <dom@earth.li>
-Date: Sat, 23 May 2015 21:15:06 +0200
-Subject: Update t/porting/customized.dat for files patched in Debian
-
-Patch-Name: debian/makemaker_customized.diff
-Upstream-Status: Pending
----
- t/porting/customized.dat | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/t/porting/customized.dat b/t/porting/customized.dat
-index 7df398d..f857bd2 100644
---- a/t/porting/customized.dat
-+++ b/t/porting/customized.dat
-@@ -1,7 +1,7 @@
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm 7f4dfd0fe884bd42412bcf04ca80ef97b39c1d54
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm bef099988b15fb0b2a1f5ac48c01af1f7f36d329
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 8168e18f0e3ce3ece4bb7e7c72d57ec07c67c402
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 7115e97a53559cb3ec061dd6f7f344e522724c4a
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm 3493ae6f93264e967f58dedaa3dbf3dbcb249853
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 3d7abd674b15ed323f743594ef0bd09db76b1aee
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm f8db8d4245bf0684b8210c811f50d7cfb1a27d78
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 757bffb47857521311f8f3bde43ebe165f8d5191
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Locale.pm 82be06851deb84c6419ad003ce9b6d1957f395f3
-@@ -13,7 +13,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 58872d66
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm ab80029ab16d38d4f2e41dc88d2ceb9f3790e477
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 453e0abbc4bb38db4c0820ad5c4846f313b66291
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm c1b1babda8f43ae7a2caba1cb4f70f92af5a0e34
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 6f90d94ad3e7aa0045a3b1a10a1bb18391f89f57
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 21bde53290bf1a4da4457290b65bd1b0ca6f1d16
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm cab2b3ce08b71a4ce89aa630f236eb08b852439d
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm 61fced0faf518bf87c265fcb51ed330ba354623f
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm ae0ef51a7b6dd0b05aa61c779df7167dda5f5119
-@@ -22,7 +22,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 0544301f712
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm 433135eecb85b4b1d90d3027432f329436c78447
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 1fbb5605bfb47feee4083feba8aa85e659628f70
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5b66d1f485a6034d96fc24ba1665b1bad9e447f1
--ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 8cef99a9bd370ecfd07ddb0efbdcbb4101255e45
-+ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm c455c915fb7dc3eeb1200ed1cd19048e6f21e6b1
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 939572fde3d59ba77c2e677fe2df2bed4bed5898
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 09c2049bfd25b735e2a5bcf56a6cff7b4827f9c8
- ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm d65d63f8217a55c36f62e249814988974f593c79
diff --git a/meta/recipes-devtools/perl/perl/debian/mod_paths.diff b/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
index 7e22484038..4f297fbc3e 100644
--- a/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl/debian/mod_paths.diff
@@ -1,4 +1,4 @@
-From 6c6cf14e204f3c031372bfd9604ad524d5691186 Mon Sep 17 00:00:00 2001
+From 6113d33ddf611a4c33356d297232bec888dfb4ff Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Fri, 18 Mar 2005 22:22:25 +1100
 Subject: Tweak @INC ordering for Debian
@@ -16,32 +16,33 @@ The rationale being that an admin (via site), or module packager
 (vendor) can chose to shadow core modules when there is a newer
 version than is included in core.
 
+(later updates by Niko Tyni)
+
 Patch-Name: debian/mod_paths.diff
-Upstream-Status: Pending
 ---
  perl.c | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 58 insertions(+)
 
 diff --git a/perl.c b/perl.c
-index 086645b..e64f1f4 100644
+index e6dfa8dc05..c7828e69ce 100644
 --- a/perl.c
 +++ b/perl.c
-@@ -4373,6 +4373,11 @@ S_init_perllib(pTHX)
- 		      INCPUSH_ADD_SUB_DIRS|INCPUSH_CAN_RELOCATE);
- #endif
- 
+@@ -4674,6 +4674,10 @@ S_init_perllib(pTHX)
+     SITEARCH, SITELIB, VENDORARCH, VENDORLIB, ARCHLIB and PRIVLIB
+ */
+     INCPUSH_APPLLIB_EXP
 +#ifdef DEBIAN
 +    /* for configuration where /usr is mounted ro (CPAN::Config, Net::Config) */
 +    S_incpush_use_sep(aTHX_ STR_WITH_LEN("/etc/perl"), 0x0);
 +#endif
+     INCPUSH_SITEARCH_EXP
+     INCPUSH_SITELIB_EXP
+     INCPUSH_PERL_VENDORARCH_EXP
+@@ -4685,6 +4689,60 @@ S_init_perllib(pTHX)
+     INCPUSH_APPLLIB_OLD_EXP
+     INCPUSH_SITELIB_STEM
+     INCPUSH_PERL_VENDORLIB_STEM
 +
- #ifdef SITEARCH_EXP
-     /* sitearch is always relative to sitelib on Windows for
-      * DLL-based path intuition to work correctly */
-@@ -4490,6 +4495,59 @@ S_init_perllib(pTHX)
- 		      INCPUSH_ADD_OLD_VERS|INCPUSH_CAN_RELOCATE);
- #endif
- 
 +#ifdef DEBIAN
 +    /* Non-versioned site directory for local modules and for
 +       compatability with the previous packages' site dirs */
@@ -77,16 +78,16 @@ index 086645b..e64f1f4 100644
 +	   subdirectory of sitelib */
 +	for (p = vers; *p; p++)
 +	{
-+	    if (arch_vers)
++	    if (arch_vers && !strchr(*p, '/')) /* skip arch-specific subdirs */
 +	    {
-+		strcpy(arch_vers, *p);
++		my_snprintf(arch_vers, 16, "%s", *p);
 +		if (PerlLIO_stat(sitearch, &s) >= 0 && S_ISDIR(s.st_mode))
 +		    S_incpush_use_sep(aTHX_ sitearch, strlen(sitearch), 0x0);
 +	    }
 +
-+	    if (lib_vers)
++	    if (lib_vers && !strchr(*p, '/')) /* skip arch-specific subdirs */
 +	    {
-+		strcpy(lib_vers, *p);
++		my_snprintf(lib_vers, 16, "%s", *p);
 +		if (PerlLIO_stat(sitelib, &s) >= 0 && S_ISDIR(s.st_mode))
 +		    S_incpush_use_sep(aTHX_ sitelib, strlen(sitelib), 0x0);
 +	    }
@@ -95,6 +96,6 @@ index 086645b..e64f1f4 100644
 +#endif
 +#endif
 +
- #ifdef PERL_OTHERLIBDIRS
-     S_incpush_use_sep(aTHX_ STR_WITH_LEN(PERL_OTHERLIBDIRS),
- 		      INCPUSH_ADD_OLD_VERS|INCPUSH_ADD_ARCHONLY_SUB_DIRS
+     INCPUSH_PERL_OTHERLIBDIRS_ARCHONLY
+ 
+ #endif /* !PERL_IS_MINIPERL */
diff --git a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
deleted file mode 100644
index 7484bec413..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
+++ /dev/null
@@ -1,93 +0,0 @@
-From 240f2f4aeb3850bc0c5370b9fbc3909573bed9b3 Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Tue, 8 Mar 2005 19:30:38 +1100
-Subject: Don't install .packlist or perllocal.pod for perl or vendor
-
-Patch-Name: debian/no_packlist_perllocal.diff
-Upstream-Status: Pending
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 35 +++----------------------
- 1 file changed, 3 insertions(+), 32 deletions(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 570a631..391dc22 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2122,11 +2122,6 @@ pure_perl_install :: all
- };
- 
-     push @m,
--q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
--		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
--} unless $self->{NO_PACKLIST};
--
--    push @m,
- q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
- 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
- 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
-@@ -2158,10 +2153,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
- pure_vendor_install :: all
- 	$(NOECHO) umask 022; $(MOD_INSTALL) \
- };
--    push @m,
--q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
--		write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','.packlist').q{" \
--} unless $self->{NO_PACKLIST};
- 
-     push @m,
- q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
-@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
- 
-     push @m, q{
- doc_perl_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
--	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
--	-$(NOECHO) umask 022; $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" $(INSTALLPRIVLIB) \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
- 
- doc_site_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
--	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
-+	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSITEARCH)/perllocal.pod"
-+	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLSITEARCH)"
- 	-$(NOECHO) umask 02; $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLSITELIB) \
- 		LINKTYPE "$(LINKTYPE)" \
- 		VERSION "$(VERSION)" \
- 		EXE_FILES "$(EXE_FILES)" \
--		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
-+		>> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{"
- 
- doc_vendor_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
--	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
--	-$(NOECHO) umask 022; $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" $(INSTALLVENDORLIB) \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
- 
- } unless $self->{NO_PERLLOCAL};
- 
-@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
- 	$(NOECHO) $(NOOP)
- 
- uninstall_from_perldirs ::
--	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{"
- 
- uninstall_from_sitedirs ::
- 	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{"
- 
- uninstall_from_vendordirs ::
--	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{"
- };
- 
-     join("",@m);
diff --git a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff b/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
deleted file mode 100644
index 2d05ae5486..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/patchlevel.diff
+++ /dev/null
@@ -1,31 +0,0 @@
-From b517c5e15d0871e36d0f1187661fe1dd28ddf820 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Sun, 15 May 2011 19:35:58 +0300
-Subject: List packaged patches in patchlevel.h
-
-Origin: vendor
-Bug-Debian: http://bugs.debian.org/567489
-
-The list of packaged patches is in patchlevel-debian.h, which is generated
-from the debian/patches/ directory when building the package.
-
-Patch-Name: debian/patchlevel.diff
-Upstream-Status: Pending
----
- patchlevel.h | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/patchlevel.h b/patchlevel.h
-index a0ad78b..01367b7 100644
---- a/patchlevel.h
-+++ b/patchlevel.h
-@@ -137,6 +137,9 @@ static const char * const local_patches[] = {
- 	,"uncommitted-changes"
- #endif
- 	PERL_GIT_UNPUSHED_COMMITS    	/* do not remove this line */
-+#ifdef DEBIAN
-+#include "patchlevel-debian.h"
-+#endif
- 	,NULL
- };
- 
diff --git a/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
index 6f1625bb1c..bf46cea1a1 100644
--- a/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
+++ b/meta/recipes-devtools/perl/perl/debian/perl5db-x-terminal-emulator.patch
@@ -1,4 +1,4 @@
-From c99c61e8f863a508a0793168011c98dc74abbd05 Mon Sep 17 00:00:00 2001
+From f6adc94c48cca2208035a30e79ef2a23d0317808 Mon Sep 17 00:00:00 2001
 From: Dominic Hargreaves <dom@earth.li>
 Date: Sat, 14 Apr 2012 11:34:05 +0100
 Subject: Invoke x-terminal-emulator rather than xterm in perl5db.pl
@@ -10,16 +10,15 @@ Bug-Debian: http://bugs.debian.org/668490
 Forwarded: not-needed
 
 Patch-Name: debian/perl5db-x-terminal-emulator.patch
-Upstream-Status: Pending
 ---
  lib/perl5db.pl | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/lib/perl5db.pl b/lib/perl5db.pl
-index 7e7194e..c466bf3 100644
+index ecc49a814d..6eb03d7c11 100644
 --- a/lib/perl5db.pl
 +++ b/lib/perl5db.pl
-@@ -6960,7 +6960,7 @@ properly set up.
+@@ -6987,7 +6987,7 @@ properly set up.
  sub xterm_get_fork_TTY {
      ( my $name = $0 ) =~ s,^.*[/\\],,s;
      open XT,
diff --git a/meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff b/meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff
new file mode 100644
index 0000000000..97231557a3
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/perldoc-pager.diff
@@ -0,0 +1,28 @@
+From 8756f6e6ed671dac033628b4bf66d242aa6df839 Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Fri, 13 Oct 2017 11:59:34 +0300
+Subject: Fix perldoc terminal escapes when sensible-pager is less
+
+This is a temporary fix while upstream is reworking the
+pager handling.
+
+Bug: https://rt.cpan.org/Public/Bug/Display.html?id=120229
+Bug-Debian: https://bugs.debian.org/870340
+Patch-Name: debian/perldoc-pager.diff
+---
+ cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm b/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm
+index 9501d6310e..a5aedf6302 100644
+--- a/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm
++++ b/cpan/Pod-Perldoc/lib/Pod/Perldoc/ToTerm.pm
+@@ -32,7 +32,7 @@ sub pager_configuration {
+   # do not modify anything on Windows or DOS
+   return if ( $perldoc->is_mswin32 || $perldoc->is_dos );
+ 
+-  if ( $pager =~ /less/ ) {
++  if ( $pager =~ /sensible-pager|less/ ) {
+     $self->_maybe_modify_environment('LESS');
+   }
+   elsif ( $pager =~ /more/ ) {
diff --git a/meta/recipes-devtools/perl/perl/debian/perlivp.diff b/meta/recipes-devtools/perl/perl/debian/perlivp.diff
index 5c7413b965..4c85cad8fa 100644
--- a/meta/recipes-devtools/perl/perl/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl/debian/perlivp.diff
@@ -1,4 +1,4 @@
-From fbfbeb7a690d703a3cdc56f923e89eb7b7997d31 Mon Sep 17 00:00:00 2001
+From 45f4a172340c7c7f60e12d6870b8df03e8f4f636 Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Fri, 9 Jan 2009 18:54:47 +0200
 Subject: Make perlivp skip include directories in /usr/local
@@ -21,16 +21,15 @@ On Sat, Jan 10, 2009 at 12:37:18AM +1100, Brendan O'Dea wrote:
 Signed-off-by: Niko Tyni <ntyni@debian.org>
 
 Patch-Name: debian/perlivp.diff
-Upstream-Status: Pending
 ---
  utils/perlivp.PL | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/utils/perlivp.PL b/utils/perlivp.PL
-index c2f0a11..cc49f96 100644
+index 50d187a544..bd8091c548 100644
 --- a/utils/perlivp.PL
 +++ b/utils/perlivp.PL
-@@ -153,6 +153,7 @@ my $INC_total = 0;
+@@ -155,6 +155,7 @@ my $INC_total = 0;
  my $INC_there = 0;
  foreach (@INC) {
      next if $_ eq '.'; # skip -d test here
diff --git a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff b/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
deleted file mode 100644
index 47075625c6..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/pod2man-customized.diff
+++ /dev/null
@@ -1,24 +0,0 @@
-From 27a4952c2e531947dc9f2f02e2063d117e2e699a Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Sat, 18 Apr 2015 17:39:32 +0300
-Subject: Update porting/customized.dat for pod2man modifications
-
-Patch-Name: debian/pod2man-customized.diff
-Upstream-Status: Pending
----
- t/porting/customized.dat | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/t/porting/customized.dat b/t/porting/customized.dat
-index 0eed9f7..7df398d 100644
---- a/t/porting/customized.dat
-+++ b/t/porting/customized.dat
-@@ -42,7 +42,7 @@ Win32API::File cpan/Win32API-File/Makefile.PL 605d0aee31aebe84a99408f9ab5f644db5
- Win32API::File cpan/Win32API-File/t/file.t 124e64aa77e755235eb297644a87fac5388d3d78
- Win32API::File cpan/Win32API-File/t/tie.t 712ea7edd0cc805ce1c0b8172c01b03dd19b583d
- Win32API::File cpan/Win32API-File/typemap 24bff088babeadac0873e8df390d1666d9d9db4a
--podlators cpan/podlators/scripts/pod2man.PL f81acf53f3ff46cdcc5ebdd661c5d13eb35d20d6
-+podlators cpan/podlators/scripts/pod2man.PL 761f35d3fcf91c1bc2f9e024a9fa5c62fd3fc338
- podlators cpan/podlators/scripts/pod2text.PL b4693fcfe4a0a1b38a215cfb8985a65d5d025d69
- version cpan/version/lib/version.pm d0923b895d57f1d669ae36fcf85c87b16db341d1
- version vutil.c 668f17ca43e2527645674d29ba772b86330d5663
diff --git a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
deleted file mode 100644
index a2ed52ab2e..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/prune_libs.diff
+++ /dev/null
@@ -1,43 +0,0 @@
-From c4538f966c49e356599358def7d1febf61bca21f Mon Sep 17 00:00:00 2001
-From: Brendan O'Dea <bod@debian.org>
-Date: Fri, 18 Mar 2005 22:22:25 +1100
-Subject: [PATCH 15/49] Prune the list of libraries wanted to what we actually
- need.
-
-Bug-Debian: http://bugs.debian.org/128355
-
-We want to keep the dependencies on perl-base as small as possible,
-and some of the original list may be present on buildds (see Bug#128355).
-
-Patch-Name: debian/prune_libs.diff
-Upstream-Status: Pending
----
- Configure | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/Configure b/Configure
-index 5a353d6..a00df64 100755
---- a/Configure
-+++ b/Configure
-@@ -1479,8 +1479,7 @@ archname=''
- usereentrant='undef'
- : List of libraries we want.
- : If anyone needs extra -lxxx, put those in a hint file.
--libswanted="cl pthread socket bind inet nsl ndbm gdbm dbm db malloc dl ld"
--libswanted="$libswanted sun m crypt sec util c cposix posix ucb bsd BSD"
-+libswanted='gdbm gdbm_compat db dl m c crypt'
- : We probably want to search /usr/shlib before most other libraries.
- : This is only used by the lib/ExtUtils/MakeMaker.pm routine extliblist.
- glibpth=`echo " $glibpth " | sed -e 's! /usr/shlib ! !'`
-@@ -24007,7 +24006,7 @@ sunos*X4*)
-     ;;
- *) case "$usedl" in
-     $define|true|[yY]*)
--	    set X `echo " $libs " | sed -e 's@ -lndbm @ @' -e 's@ -lgdbm @ @' -e 's@ -lgdbm_compat @ @' -e 's@ -ldbm @ @' -e 's@ -ldb @ @'`
-+	    set X `echo " $libs " | sed -e 's@ -lgdbm @ @' -e 's@ -lgdbm_compat @ @' -e 's@ -ldb @ @'`
- 	    shift
- 	    perllibs="$*"
- 	    ;;
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/perl/perl/debian/regen-skip.diff b/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
deleted file mode 100644
index 5d9a7c4b46..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/regen-skip.diff
+++ /dev/null
@@ -1,28 +0,0 @@
-From cb3e98e17a666896150b109694e9eb9278620845 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Sat, 17 May 2014 14:57:01 +0300
-Subject: Skip a regeneration check in unrelated git repositories
-
-If the test is run in a git repository without lib/.gitignore,
-for instance because the repository only imported the Perl tarball,
-the regeneration check is broken because lib/.gitignore is missing.
-
-Patch-Name: debian/regen-skip.diff
-Upstream-Status: Pending
----
- regen/lib_cleanup.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/regen/lib_cleanup.pl b/regen/lib_cleanup.pl
-index c9d6e43..fece1ed 100644
---- a/regen/lib_cleanup.pl
-+++ b/regen/lib_cleanup.pl
-@@ -159,7 +159,7 @@ foreach ('win32/Makefile', 'win32/makefile.mk') {
- }
- 
- # This must come last as it can exit early:
--if ($TAP && !-d '.git' && !-f 'lib/.gitignore') {
-+if ($TAP && !-d '.git' || !-f 'lib/.gitignore') {
-     print "ok # skip not being run from a git checkout, hence no lib/.gitignore\n";
-     exit 0;
- }
diff --git a/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff b/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
deleted file mode 100644
index 3b3745238d..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/skip-kfreebsd-crash.diff
+++ /dev/null
@@ -1,41 +0,0 @@
-From 42853af65a28066b119d23d96e964e94b55a8541 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Fri, 5 Aug 2011 10:50:18 +0300
-Subject: Skip a crashing test case in t/op/threads.t on GNU/kFreeBSD
-
-Bug: http://rt.perl.org/rt3/Ticket/Display.html?id=96272
-Bug-Debian: http://bugs.debian.org/628493
-
-The crash is not a regression in 5.14, it just gets triggered there by
-a new unrelated test case.
-
-Skip the test until the culprit is found.
-
-Patch-Name: debian/skip-kfreebsd-crash.diff
-Upstream-Status: Pending
----
- t/op/threads.t | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/t/op/threads.t b/t/op/threads.t
-index e76c956..bec210b 100644
---- a/t/op/threads.t
-+++ b/t/op/threads.t
-@@ -376,6 +376,9 @@ EOF
- }
- 
- 
-+SKIP: {
-+    skip "[perl #96272] avoid crash on GNU/kFreeBSD", 1
-+        if $^O eq 'gnukfreebsd';
- # [perl #78494] Pipes shared between threads block when closed
- {
-   my $perl = which_perl;
-@@ -384,6 +387,7 @@ EOF
-   threads->create(sub { })->join;
-   ok(1, "Pipes shared between threads do not block when closed");
- }
-+}
- 
- # [perl #105208] Typeglob clones should not be cloned again during a join
- {
diff --git a/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff b/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
deleted file mode 100644
index 279f4ab76f..0000000000
--- a/meta/recipes-devtools/perl/perl/debian/skip-upstream-git-tests.diff
+++ /dev/null
@@ -1,29 +0,0 @@
-From ae9b645d6da2990fd055368eca2c67c449474e38 Mon Sep 17 00:00:00 2001
-From: Niko Tyni <ntyni@debian.org>
-Date: Fri, 22 Apr 2011 11:15:32 +0300
-Subject: Skip tests specific to the upstream Git repository
-
-These tests fail if run from a different git repository than
-upstream. This complicates things needlessly for downstream packagers.
-
-Skip the tests altogether even if the .git directory exists.
-
-Patch-Name: debian/skip-upstream-git-tests.diff
-Upstream-Status: Pending
----
- t/test.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/t/test.pl b/t/test.pl
-index cda3840..af579a2 100644
---- a/t/test.pl
-+++ b/t/test.pl
-@@ -174,7 +174,7 @@ sub skip_all_without_unicode_tables { # (but only under miniperl)
- 
- sub find_git_or_skip {
-     my ($source_dir, $reason);
--    if (-d '.git') {
-+    if (-d '.git' && ! -d 'debian') {
- 	$source_dir = '.';
-     } elsif (-l 'MANIFEST' && -l 'AUTHORS') {
- 	my $where = readlink 'MANIFEST';
diff --git a/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
index 4964e480c7..7026a5f841 100644
--- a/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
+++ b/meta/recipes-devtools/perl/perl/debian/squelch-locale-warnings.diff
@@ -1,4 +1,4 @@
-From 487a6d6ada0b08e6a7276520ebc61cd851005e7c Mon Sep 17 00:00:00 2001
+From 234ed3d7745d79e397b515edb23c75a6ff53df8f Mon Sep 17 00:00:00 2001
 From: Niko Tyni <ntyni@debian.org>
 Date: Sun, 3 Oct 2010 21:36:17 +0300
 Subject: Squelch locale warnings in Debian package maintainer scripts
@@ -14,33 +14,30 @@ Any real locale problem will show up after the system upgrade too, and
 the warning will be triggered normally again at that point.
 
 Patch-Name: debian/squelch-locale-warnings.diff
-Upstream-Status: Pending
 ---
- locale.c           | 5 ++++-
+ locale.c           | 3 +++
  pod/perllocale.pod | 8 ++++++++
- 2 files changed, 12 insertions(+), 1 deletion(-)
+ 2 files changed, 11 insertions(+)
 
 diff --git a/locale.c b/locale.c
-index 7a4a418..fdf911d 100644
+index 7653340477..aedd7da0c5 100644
 --- a/locale.c
 +++ b/locale.c
-@@ -674,7 +674,10 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
+@@ -3142,6 +3142,9 @@ Perl_init_i18nl10n(pTHX_ int printwarn)
  
      const bool locwarn = (printwarn > 1
-                           || (printwarn
--                              && (! bad_lang_use_once
+                           || (          printwarn
 +                              &&
 +                                 /* Debian specific change - see http://bugs.debian.org/508764 */
-+                                 (!PerlEnv_getenv("DPKG_RUNNING_VERSION")) &&
-+                                 (! bad_lang_use_once
++                                 (    ! PerlEnv_getenv("DPKG_RUNNING_VERSION"))
+                               && (    ! bad_lang_use_once
                                    || (
-                                     /* disallow with "" or "0" */
-                                     *bad_lang_use_once
+                                          /* disallow with "" or "0" */
 diff --git a/pod/perllocale.pod b/pod/perllocale.pod
-index 701b422..58cabaf 100644
+index a32f72c88e..e12b81cc4c 100644
 --- a/pod/perllocale.pod
 +++ b/pod/perllocale.pod
-@@ -1217,6 +1217,14 @@ B<NOTE>: C<PERL_BADLANG> only gives you a way to hide the warning message.
+@@ -1293,6 +1293,14 @@ B<NOTE>: C<PERL_BADLANG> only gives you a way to hide the warning message.
  The message tells about some problem in your system's locale support,
  and you should investigate what the problem is.
  
diff --git a/meta/recipes-devtools/perl/perl/debian/storable-disable-probing.diff b/meta/recipes-devtools/perl/perl/debian/storable-disable-probing.diff
new file mode 100644
index 0000000000..442ac4cfde
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/debian/storable-disable-probing.diff
@@ -0,0 +1,40 @@
+From 08c6582c9317ce531100e9a3f38d616aae55273d Mon Sep 17 00:00:00 2001
+From: Niko Tyni <ntyni@debian.org>
+Date: Sun, 2 Dec 2018 15:39:27 +0200
+Subject: Disable Storable stacksize probing when PERL_STORABLE_DONT_PROBE is
+ set
+
+Bug: https://rt.perl.org/Ticket/Display.html?id=133708
+Bug-Debian: https://bugs.debian.org/914133
+Patch-Name: debian/storable-disable-probing.diff
+---
+ dist/Storable/Makefile.PL | 2 +-
+ dist/Storable/stacksize   | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/dist/Storable/Makefile.PL b/dist/Storable/Makefile.PL
+index 69efc82944..0b59df1a72 100644
+--- a/dist/Storable/Makefile.PL
++++ b/dist/Storable/Makefile.PL
+@@ -93,7 +93,7 @@ sub depend {
+         $extra_deps = ' Storable.pm';
+     }
+     my $whichperl;
+-    if ($Config::Config{usecrosscompile}) {
++    if ($Config::Config{usecrosscompile} || $ENV{PERL_STORABLE_DONT_PROBE}) {
+         $whichperl = '$(PERLRUN)';
+     }
+     else {
+diff --git a/dist/Storable/stacksize b/dist/Storable/stacksize
+index 14e0739734..3db62ec672 100644
+--- a/dist/Storable/stacksize
++++ b/dist/Storable/stacksize
+@@ -32,7 +32,7 @@ sub is_miniperl {
+ }
+ 
+ if (is_miniperl()) {
+-    if ($Config{usecrosscompile}) {
++    if ($Config{usecrosscompile} || $ENV{PERL_STORABLE_DONT_PROBE}) {
+         write_limits(500, 265);
+         exit;
+     }
diff --git a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
index ab373b333c..e1b1fcdb15 100644
--- a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
+++ b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
@@ -1,4 +1,4 @@
-From 591c1f9b7d4755bfc59d9665bab1f2ca410de765 Mon Sep 17 00:00:00 2001
+From 9462321cccdf0b76a4b97df51619e965896aa553 Mon Sep 17 00:00:00 2001
 From: Brendan O'Dea <bod@debian.org>
 Date: Tue, 8 Mar 2005 19:30:38 +1100
 Subject: Set umask approproately for site install directories
@@ -6,16 +6,15 @@ Subject: Set umask approproately for site install directories
 Policy requires group writable site directories
 
 Patch-Name: debian/writable_site_dirs.diff
-Upstream-Status: Pending
 ---
  cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index 197f102..5f1b87f 100644
+index 274e35c6fc..dbb8651a9f 100644
 --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2138,7 +2138,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
+@@ -2249,7 +2249,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
  
  
  pure_site_install :: all
@@ -24,7 +23,7 @@ index 197f102..5f1b87f 100644
  };
      push @m,
  q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
-@@ -2199,8 +2199,8 @@ doc_perl_install :: all
+@@ -2310,8 +2310,8 @@ doc_perl_install :: all
  
  doc_site_install :: all
  	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
@@ -33,5 +32,5 @@ index 197f102..5f1b87f 100644
 +	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
 +	-$(NOECHO) umask 02; $(DOC_INSTALL) \
  		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLSITELIB) \
+ 		"installed into" "$(INSTALLSITELIB)" \
  		LINKTYPE "$(LINKTYPE)" \
diff --git a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
index 49efcbeefc..aee35f7381 100644
--- a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
+++ b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
@@ -10,13 +10,13 @@ This fixes this warning for perl recipe as well as libxml-parser-perl recipe.
 It is a fix to MakeMaker within perl, so all such perl recipes will get 
 fixed with this perl fix.
 
-Index: perl-5.24.1/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-===================================================================
---- perl-5.24.1.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-+++ perl-5.24.1/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-@@ -57,6 +57,7 @@ sub _unix_os2_ext {
-     my ( $found ) = 0;
- 
+diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+index fb849b21ca..a12ebf0775 100644
+--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+@@ -63,6 +63,7 @@ sub _unix_os2_ext {
+         $potential_libs =~ s/(^|\s)(-F)\s*(\S+)/$1-Wl,$2 -Wl,$3/g;
+     }
      # Debian-specific: don't use LD_RUN_PATH for standard dirs
 +    push(@libpath, "SYSROOTLIB");
      $ld_run_path_seen{$_}++ for @libpath;
diff --git a/meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.patch b/meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.patch
new file mode 100644
index 0000000000..7fe68d0cf4
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/fix_configpm_no_dot_in_INC.patch
@@ -0,0 +1,22 @@
+Avoids issues like
+Can't locate lib/Config.pm in @INC (you may need to install the lib::Config module) (@INC contains: ...) at configpm line 1145
+
+Upstream-Status:Inappropriate [embedded specific]
+
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
+
+diff --git a/configpm b/configpm
+index 09c4a3b7a7..dbe29cf40b 100755
+--- a/configpm
++++ b/configpm
+@@ -124,8 +124,8 @@ if ($Opts{chdir}) {
+ my ($Config_SH, $Config_PM, $Config_heavy, $Config_POD);
+ my $Glossary = 'Porting/Glossary';
+ 
+-$Config_PM = "lib/Config.pm";
+-$Config_POD = "lib/Config.pod";
++$Config_PM = "./lib/Config.pm";
++$Config_POD = "./lib/Config.pod";
+ $Config_SH = "config.sh";
+ 
+ ($Config_heavy = $Config_PM) =~ s/\.pm$/_heavy.pl/;
diff --git a/meta/recipes-devtools/perl/perl/perl-moreconfig.patch b/meta/recipes-devtools/perl/perl/fix_write_buildcustomize.pl_no_dot_in_INC.patch
similarity index 11%
copy from meta/recipes-devtools/perl/perl/perl-moreconfig.patch
copy to meta/recipes-devtools/perl/perl/fix_write_buildcustomize.pl_no_dot_in_INC.patch
index 59ce85a7a3..266f4235b9 100644
--- a/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
+++ b/meta/recipes-devtools/perl/perl/fix_write_buildcustomize.pl_no_dot_in_INC.patch
@@ -1,18 +1,17 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-We need ld in the fake config library, but it's not included by default. So
-expand the number of items included. While this works it indicates that the
-rest of the config items are not being picked up and/or are being picked up
-from the host. More investigation needed.
+Signed-off-by: Jens Rehsack <sno@netbsd.org>
 
---- perl-5.8.8/configpm	2007/04/20 09:48:05	1.1
-+++ perl-5.8.8/configpm	2007/04/20 09:57:12
-@@ -2,7 +2,7 @@
+diff --git a/write_buildcustomize.pl b/write_buildcustomize.pl
+index 8666a6bce2..6b4de3aeed 100644
+--- a/write_buildcustomize.pl
++++ b/write_buildcustomize.pl
+@@ -3,7 +3,7 @@
  use strict;
- use vars qw(%Config $Config_SH_expanded);
  
--my $how_many_common = 22;
-+my $how_many_common = 50;
+ my $osname = $^O;
+-my $file = 'lib/buildcustomize.pl';
++my $file = './lib/buildcustomize.pl';
  
- # commonly used names to precache (and hence lookup fastest)
- my %Common;
+ if ( @ARGV % 2 ) {
+     my $dir = shift;
diff --git a/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch b/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
index 5161e4c8b6..ab02037deb 100644
--- a/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
+++ b/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
@@ -10,12 +10,12 @@ external toolchain since perl will search in ${STAGING_INCDIR} for
 errno.h (when using gcc) and that isn't where it's located - its
 wherever the external toolchain keeps it's headers.
 
-Index: perl-5.12.3/ext/Errno/Errno_pm.PL
-===================================================================
---- perl-5.12.3.orig/ext/Errno/Errno_pm.PL
-+++ perl-5.12.3/ext/Errno/Errno_pm.PL
-@@ -17,8 +17,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
- open OUT, ">Errno.tmp" or die "Cannot open Errno.tmp: $!";
+diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
+index d565f31b2f..479a8f5c17 100644
+--- a/ext/Errno/Errno_pm.PL
++++ b/ext/Errno/Errno_pm.PL
+@@ -16,8 +16,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
+ open OUT, '>', 'Errno.tmp' or die "Cannot open Errno.tmp: $!";
  select OUT;
  my $file;
 -my @files = get_files();
@@ -35,7 +35,7 @@ Index: perl-5.12.3/ext/Errno/Errno_pm.PL
      # MinGW complains "warning: #pragma system_header ignored outside include
      # file" if the header files are processed individually, so include them
      # all in .c file and process that instead.
-@@ -53,7 +63,7 @@ sub process_file {
+@@ -52,7 +62,7 @@ sub process_file {
          chomp($file = `cygpath -w "$file"`);
      }
  
diff --git a/meta/recipes-devtools/perl/perl/native-nopacklist.patch b/meta/recipes-devtools/perl/perl/native-nopacklist.patch
deleted file mode 100644
index 5482dcb79c..0000000000
--- a/meta/recipes-devtools/perl/perl/native-nopacklist.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Upstream-Status:Inappropriate [debian patch]
-
-Part of 52_debian_extutils_hacks.patch just to exclude the installation of .packlist files
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |   35 ++---------------------
- 1 file changed, 3 insertions(+), 32 deletions(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-index f63145c..a589710 100644
---- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-@@ -2122,11 +2122,6 @@ pure_perl_install :: all
- };
- 
-     push @m,
--q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
--		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
--} unless $self->{NO_PACKLIST};
--
--    push @m,
- q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
- 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
- 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
-@@ -2158,10 +2153,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
- pure_vendor_install :: all
- 	$(NOECHO) $(MOD_INSTALL) \
- };
--    push @m,
--q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
--		write "}.$self->catfile('$(DESTINSTALLVENDORARCH)','auto','$(FULLEXT)','.packlist').q{" \
--} unless $self->{NO_PACKLIST};
- 
-     push @m,
- q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
-@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
- 
-     push @m, q{
- doc_perl_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
--	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" $(INSTALLPRIVLIB) \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
- 
- doc_site_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
--	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
-+	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSITEARCH)/perllocal.pod"
-+	-$(NOECHO) $(MKPATH) "$(DESTINSTALLSITEARCH)"
- 	-$(NOECHO) $(DOC_INSTALL) \
- 		"Module" "$(NAME)" \
- 		"installed into" $(INSTALLSITELIB) \
- 		LINKTYPE "$(LINKTYPE)" \
- 		VERSION "$(VERSION)" \
- 		EXE_FILES "$(EXE_FILES)" \
--		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
-+		>> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{"
- 
- doc_vendor_install :: all
--	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
--	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
--	-$(NOECHO) $(DOC_INSTALL) \
--		"Module" "$(NAME)" \
--		"installed into" $(INSTALLVENDORLIB) \
--		LINKTYPE "$(LINKTYPE)" \
--		VERSION "$(VERSION)" \
--		EXE_FILES "$(EXE_FILES)" \
--		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
- 
- } unless $self->{NO_PERLLOCAL};
- 
-@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
- 	$(NOECHO) $(NOOP)
- 
- uninstall_from_perldirs ::
--	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{"
- 
- uninstall_from_sitedirs ::
- 	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{"
- 
- uninstall_from_vendordirs ::
--	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{"
- };
- 
-     join("",@m);
diff --git a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch b/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
deleted file mode 100644
index ff3d6dc099..0000000000
--- a/meta/recipes-devtools/perl/perl/perl-5.26.1-guard_old_libcrypt_fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-commit 13e70b397dcb0d1bf4a869b670f041c1d7b730d0
-Author: Bjรถrn Esser <besser82@fedoraproject.org>
-Date:   Sat Jan 20 20:22:53 2018 +0100
-
-    pp: Guard fix for really old bug in glibc libcrypt
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-diff --git a/pp.c b/pp.c
-index d50ad7ddbf..6510c7b15c 100644
---- a/pp.c
-+++ b/pp.c
-@@ -3650,8 +3650,12 @@ PP(pp_crypt)
- #if defined(__GLIBC__) || defined(__EMX__)
- 	if (PL_reentrant_buffer->_crypt_struct_buffer) {
- 	    PL_reentrant_buffer->_crypt_struct_buffer->initialized = 0;
--	    /* work around glibc-2.2.5 bug */
-+#if (defined(__GLIBC__) && __GLIBC__ == 2) && \
-+    (defined(__GLIBC_MINOR__) && __GLIBC_MINOR__ >= 2 && __GLIBC_MINOR__ < 4)
-+	    /* work around glibc-2.2.5 bug, has been fixed at some
-+	     * time in glibc-2.3.X */
- 	    PL_reentrant_buffer->_crypt_struct_buffer->current_saltbits = 0;
-+#endif
- 	}
- #endif
-     }
-
diff --git a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
deleted file mode 100644
index 7dd904140a..0000000000
--- a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 2001
-From: Wenzong Fan <wenzong.fan@windriver.com>
-Date: Wed, 11 Feb 2015 15:14:40 +0800
-Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
-
-If $TOPDIR includes the string "blib", filter it out from @INC may empty
-the @INC and cause build errors like:
-
-  Can't locate ExtUtils/MakeMaker.pm in @INC \
-  (you may need to install the ExtUtils::MakeMaker module) \
-  (@INC contains: .) at Makefile.PL
-
-Upstream-Status: Pending
-
-Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
----
- dist/PathTools/Makefile.PL | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
-index 1b21de4..f562cb2 100644
---- a/dist/PathTools/Makefile.PL
-+++ b/dist/PathTools/Makefile.PL
-@@ -1,6 +1,3 @@
--
--BEGIN { @INC = grep {!/blib/} @INC }
--
- require 5.005;
- use ExtUtils::MakeMaker;
- WriteMakefile
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/perl/perl/perl-dynloader.patch b/meta/recipes-devtools/perl/perl/perl-dynloader.patch
index 2572067a6e..598117a5c2 100644
--- a/meta/recipes-devtools/perl/perl/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/perl/perl-dynloader.patch
@@ -17,14 +17,14 @@ Index: perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
  
 +    # OE: Allow env to form dynamic loader to look in a different place
 +    # This is so it finds the host .so files, not the targets
-+    if (defined $ENV{PERLHOSTLIB})
++    if (defined $ENV{PERLHOSTARCHLIB})
 +    {
-+        my $hostlib = $ENV{PERLHOSTLIB};
++        my $hostarchlib = $ENV{PERLHOSTARCHLIB};
 +        print STDERR "*** Module name IN: $modlibname\n";
 +        ($p1, $p2, $p3, $p4, $p5) = $modlibname =~ m/(^(.*lib\w*\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
 +        print STDERR "*** p1: $p1  p3: $p3  p5: $p5\n";
-+        if ( $p1 ne "" ) {
-+            $modlibname = $hostlib.$p5;
++        if ( $p1 ne "" and 0 != index($modlibname, $hostarchlib) ) {
++            $modlibname = $hostarchlib.$p5;
 +        }
 +        print STDERR "*** Module name OUT: $modlibname\n";
 +    }
diff --git a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch b/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
deleted file mode 100644
index de946dbec7..0000000000
--- a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-Some Perl tests fail when run on a cross-compiled target machine. Apply
-a slightly tweaked upstream patch to fix the problems. Notes:
-    1. as of 2 Jun 2016, the original patch has been applied to the current
-       EUMM releases, but has not made it into perl core yet.
-    2. when the base perl package is upgraded in Yocto, this patch may need
-       to be replaced by the original upstream version to correctly apply
-       to the current version of ExtUtils-MakeMaker at that time.
-
-[YOCTO #8656]
-
-Upstream-Status: Backport
-
-Signed-off-by: Bill Randle <william.c.randle@intel.com>
-
-From 4a07a3bd18363986112cf2b39dec3c2985353ffb Mon Sep 17 00:00:00 2001
-From: Francois Perrad <francois.perrad@gadz.org>
-Date: Mon, 22 Dec 2014 19:04:34 +0100
-Subject: [PATCH] fix conflict between skip_all and END section
-
-since the commit 430de781809a6be3bcd25a349dc40ce54405ab53
-the test suite fails in cross-compil environment (perl-5.21.6 & perl-5.21.7)
-like this :
-
-    $ ./perl harness -v ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
-    ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t ..
-    1..0 # SKIP cross-compiling and make not available
-    ok 1 - chdir updir
-    ok 2 - teardown
-    # Looks like you planned 0 tests but ran 2.
-    skipped: cross-compiling and make not available
-
-this commit restores the implicit call of plan() at import time of Test::More
-
-Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
----
- cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t     | 7 ++++---
- cpan/ExtUtils-MakeMaker/t/PL_FILES.t         | 4 ++--
- cpan/ExtUtils-MakeMaker/t/basic.t            | 4 ++--
- cpan/ExtUtils-MakeMaker/t/echo.t             | 6 +++---
- cpan/ExtUtils-MakeMaker/t/min_perl_version.t | 4 ++--
- cpan/ExtUtils-MakeMaker/t/pm_to_blib.t       | 4 ++--
- cpan/ExtUtils-MakeMaker/t/recurs.t           | 4 ++--
- cpan/ExtUtils-MakeMaker/t/several_authors.t  | 4 ++--
- 8 files changed, 19 insertions(+), 18 deletions(-)
-
-diff --git a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
-index f27b62c..3bbb3a6 100644
---- a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
-+++ b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
-@@ -15,12 +15,13 @@ $CLEANUP &&= 1; # so always 1 or numerically 0
- 
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::BFD;
--use Test::More;
- use Config;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
--    : (tests => 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP));
-+    : ();
-+plan tests => 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP);
- 
- my $Is_VMS = $^O eq 'VMS';
- 
-diff --git a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
-index 0779dbb..85d53a5 100644
---- a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
-+++ b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
-@@ -11,9 +11,9 @@ use File::Temp qw[tempdir];
- use MakeMaker::Test::Setup::PL_FILES;
- use MakeMaker::Test::Utils;
- use Config;
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
-     : (tests => 9);
- 
-diff --git a/cpan/ExtUtils-MakeMaker/t/basic.t b/cpan/ExtUtils-MakeMaker/t/basic.t
-index 3dd66ad..eddf2e9 100644
---- a/cpan/ExtUtils-MakeMaker/t/basic.t
-+++ b/cpan/ExtUtils-MakeMaker/t/basic.t
-@@ -20,9 +20,9 @@ use utf8;
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::BFD;
- use Config;
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
-     : (tests => 171);
- use File::Find;
-diff --git a/cpan/ExtUtils-MakeMaker/t/echo.t b/cpan/ExtUtils-MakeMaker/t/echo.t
-index 789b85f..c43bc47 100644
---- a/cpan/ExtUtils-MakeMaker/t/echo.t
-+++ b/cpan/ExtUtils-MakeMaker/t/echo.t
-@@ -14,11 +14,11 @@ use MakeMaker::Test::Utils;
- use File::Temp;
- use Cwd 'abs_path';
- 
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
--    : ();
-+    : (tests => 18);
- 
- #--------------------- Setup
- 
-diff --git a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
-index c5d78d6..2ef118d 100644
---- a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
-+++ b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
-@@ -13,9 +13,9 @@ use TieOut;
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::MPV;
- use Config;
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
-     : (tests => 36);
- use File::Path;
-diff --git a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
-index f1e348e..ebfa26c 100644
---- a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
-+++ b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
-@@ -12,9 +12,9 @@ use ExtUtils::MakeMaker;
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::BFD;
- use Config;
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
-     : 'no_plan';
- 
-diff --git a/cpan/ExtUtils-MakeMaker/t/recurs.t b/cpan/ExtUtils-MakeMaker/t/recurs.t
-index 84c09a2..661e0db 100644
---- a/cpan/ExtUtils-MakeMaker/t/recurs.t
-+++ b/cpan/ExtUtils-MakeMaker/t/recurs.t
-@@ -14,9 +14,9 @@ use File::Temp qw[tempdir];
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::Recurs;
- use Config;
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
-     : (tests => 26);
- 
-diff --git a/cpan/ExtUtils-MakeMaker/t/several_authors.t b/cpan/ExtUtils-MakeMaker/t/several_authors.t
-index 1a75a3e..869e9f0 100644
---- a/cpan/ExtUtils-MakeMaker/t/several_authors.t
-+++ b/cpan/ExtUtils-MakeMaker/t/several_authors.t
-@@ -13,9 +13,9 @@ use TieOut;
- use MakeMaker::Test::Utils;
- use MakeMaker::Test::Setup::SAS;
- use Config;
--use Test::More;
- use ExtUtils::MM;
--plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-+use Test::More
-+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
-     ? (skip_all => "cross-compiling and make not available")
-     : (tests => 20);
- use File::Path;
diff --git a/meta/recipes-devtools/perl/perl/perl-moreconfig.patch b/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
index 59ce85a7a3..e3a9588ba0 100644
--- a/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
+++ b/meta/recipes-devtools/perl/perl/perl-moreconfig.patch
@@ -5,11 +5,13 @@ expand the number of items included. While this works it indicates that the
 rest of the config items are not being picked up and/or are being picked up
 from the host. More investigation needed.
 
---- perl-5.8.8/configpm	2007/04/20 09:48:05	1.1
-+++ perl-5.8.8/configpm	2007/04/20 09:57:12
-@@ -2,7 +2,7 @@
+diff --git a/configpm b/configpm
+index 09c4a3b7a7..543be59f06 100755
+--- a/configpm
++++ b/configpm
+@@ -37,7 +37,7 @@ EOF
  use strict;
- use vars qw(%Config $Config_SH_expanded);
+ our (%Config, $Config_SH_expanded);
  
 -my $how_many_common = 22;
 +my $how_many_common = 50;
diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-devtools/perl/perl_5.28.1.bb
similarity index 39%
rename from meta/recipes-devtools/perl/perl_5.24.4.bb
rename to meta/recipes-devtools/perl/perl_5.28.1.bb
index a644970192..2f30840081 100644
--- a/meta/recipes-devtools/perl/perl_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.28.1.bb
@@ -4,35 +4,55 @@ require perl.inc
 DEPENDS = "db grep-native gdbm zlib virtual/crypt"
 
 # Pick up patches from debian
-# http://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.22.0-1.debian.tar.xz
+# https://ftp.de.debian.org/debian/pool/main/p/perl/perl_5.28.1-3.debian.tar.xz
 SRC_URI += " \
-	file://debian/cpan_definstalldirs.diff \
-	file://debian/db_file_ver.diff \
-	file://debian/doc_info.diff \
-	file://debian/enc2xs_inc.diff \
-	file://debian/errno_ver.diff \
-	file://debian/libperl_embed_doc.diff \
-	file://debian/fixes/respect_umask.diff \
-	file://debian/writable_site_dirs.diff \
-	file://debian/extutils_set_libperl_path.diff \
-	file://debian/no_packlist_perllocal.diff \
-	file://debian/prefix_changes.diff \
-	file://debian/instmodsh_doc.diff \
-	file://debian/ld_run_path.diff \
-	file://debian/libnet_config_path.diff \
-	file://debian/mod_paths.diff \
-	file://debian/prune_libs.diff \
-	file://debian/fixes/net_smtp_docs.diff \
-	file://debian/perlivp.diff \
-	file://debian/squelch-locale-warnings.diff \
-	file://debian/skip-upstream-git-tests.diff \
-	file://debian/skip-kfreebsd-crash.diff \
-	file://debian/fixes/document_makemaker_ccflags.diff \
-	file://debian/find_html2text.diff \
-	file://debian/perl5db-x-terminal-emulator.patch \
-	file://debian/cpan-missing-site-dirs.diff \
-	file://debian/fixes/memoize_storable_nstore.diff \
-	file://debian/regen-skip.diff \
+        file://debian/cpan_definstalldirs.diff \
+        file://debian/cpan-missing-site-dirs.diff \
+        file://debian/db_file_ver.diff \
+        file://debian/deprecate-with-apt.diff \
+        file://debian/disable-stack-check.diff \
+        file://debian/doc_info.diff \
+        file://debian/enc2xs_inc.diff \
+        file://debian/errno_ver.diff \
+        file://debian/extutils_set_libperl_path.diff \
+        file://debian/fakeroot.diff \
+        file://debian/find_html2text.diff \
+        file://debian/fixes/autodie-scope.diff \
+        file://debian/fixes/caretx-fallback.diff \
+        file://debian/fixes/cpan_web_link.diff \
+        file://debian/fixes/document_makemaker_ccflags.diff \
+        file://debian/fixes/errno-include-path.diff \
+        file://debian/fixes/eumm-usrmerge.diff \
+        file://debian/fixes/fix-manifest-failures.diff \
+        file://debian/fixes/getopt-long-4.diff \
+        file://debian/fixes/inplace-editing-bugfix/part1.diff \
+        file://debian/fixes/inplace-editing-bugfix/part2.diff \
+        file://debian/fixes/inplace-editing-bugfix/part3.diff \
+        file://debian/fixes/math_complex_doc_angle_units.diff \
+        file://debian/fixes/math_complex_doc_great_circle.diff \
+        file://debian/fixes/math_complex_doc_see_also.diff \
+        file://debian/fixes/memoize-pod.diff \
+        file://debian/fixes/memoize_storable_nstore.diff \
+        file://debian/fixes/respect_umask.diff \
+        file://debian/fixes/storable-prereq.diff \
+        file://debian/fixes/storable-crosscompile.diff \
+        file://debian/fixes/storable-recursion.diff \
+        file://debian/fixes/time-local-2020.diff \
+        file://debian/gdbm-fatal.diff \
+        file://debian/installman-utf8.diff \
+        file://debian/instmodsh_doc.diff \
+        file://debian/ld_run_path.diff \
+        file://debian/libnet_config_path.diff \
+        file://debian/libperl_embed_doc.diff \
+        file://debian/makemaker-manext.diff \
+        file://debian/makemaker-pasthru.diff \
+        file://debian/mod_paths.diff \
+        file://debian/perl5db-x-terminal-emulator.patch \
+        file://debian/perldoc-pager.diff \
+        file://debian/perlivp.diff \
+        file://debian/squelch-locale-warnings.diff \
+        file://debian/storable-disable-probing.diff \
+        file://debian/writable_site_dirs.diff \
 "
 
 SRC_URI += " \
@@ -59,36 +79,56 @@ SRC_URI += " \
         file://t-run-switches.t-perl5-perl.patch \
         file://ext-ODBM_File-hints-linux.pl-link-libgdbm_compat.patch \
         file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
-        file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
         file://perl-errno-generation-gcc5.patch \
-        file://perl-fix-conflict-between-skip_all-and-END.patch \
-        file://perl-5.26.1-guard_old_libcrypt_fix.patch \
-        file://CVE-2018-12015.patch \
-        file://0001-ExtUtils-MM_Unix.pm-fix-race-issues.patch \
+        file://fix_write_buildcustomize.pl_no_dot_in_INC.patch \
+        file://fix_configpm_no_dot_in_INC.patch \
 "
 
 # Fix test case issues
 SRC_URI_append_class-target = " \
             file://test/dist-threads-t-join.t-adjust-ps-option.patch \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
-            file://0001-Skip-various-tests-if-PERL_BUILD_PACKAGING-is-set.patch \
            "
 
-SRC_URI[md5sum] = "04622bc4d3941dc7eb571c52b7c02993"
-SRC_URI[sha256sum] = "7f080287ff64750270689843ae945f02159a33cb8f2fc910248c15befba5db84"
+SRC_URI[md5sum] = "fbb590c305f2f88578f448581b8cf9c4"
+SRC_URI[sha256sum] = "fea7162d4cca940a387f0587b93f6737d884bf74d8a9d7cfd978bc12cd0b202d"
+
+PACKAGECONFIG ?= ""
+usethreads = "${@["undef", "define"][bb.utils.contains('PACKAGECONFIG', 'thread', 1, 0, d)]}"
+threadmulti = "${@["", "-thread-multi"][bb.utils.contains('PACKAGECONFIG', 'thread', 1, 0, d)]}"
 
 inherit perlnative siteinfo
 
+# Determine the staged arch of perl-native from the perl configuration file
+# Assign vardepvalue, because otherwise signature is changed before and after
+# perl is built (from None to real version in config.sh).
+def get_perl_hostarch(d):
+    import re
+    cfg = d.expand('${STAGING_LIBDIR_NATIVE}/perl-native/perl/config.sh')
+    try:
+        f = open(cfg, 'r')
+    except IOError:
+        return None
+    l = f.readlines();
+    f.close();
+    r = re.compile("^archname='([^']*)'")
+    for s in l:
+        m = r.match(s)
+        if m:
+            return m.group(1)
+    return None
+
 # Where to find the native perl
 HOSTPERL = "${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
 
 # Where to find .so files - use the -native versions not those from the target build
 export PERLHOSTLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
+export PERLHOSTARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/${@get_perl_hostarch(d)}/"
 
 # Where to find perl @INC/#include files
 # - use the -native versions not those from the target build
 export PERL_LIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
-export PERL_ARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/"
+export PERL_ARCHLIB = "${STAGING_LIBDIR_NATIVE}/perl-native/perl/${PV}/${@get_perl_hostarch(d)}/"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
@@ -104,15 +144,15 @@ do_configure() {
         # Make hostperl in build directory be the native perl
         ln -sf ${HOSTPERL} hostperl
 
-	if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
-		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a -e Makefile ]; then
-			${MAKE} clean
-		fi
-		find ${S} -name *.so -delete
-	fi
-	if [ -n "${CONFIGURESTAMPFILE}" ]; then
-		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
-	fi
+        if [ -n "${CONFIGURESTAMPFILE}" -a -e "${CONFIGURESTAMPFILE}" ]; then
+                if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a -e Makefile ]; then
+                        ${MAKE} clean
+                fi
+                find ${S} -name *.so -delete
+        fi
+        if [ -n "${CONFIGURESTAMPFILE}" ]; then
+                echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
+        fi
 
         # Do our work in the cross subdir
         cd Cross
@@ -125,6 +165,9 @@ do_configure() {
             cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
         done
 
+        sed -i -e "s,\(hostperl=\)'',\1'${HOSTPERL}',g" \
+                config.sh-${TARGET_ARCH}-${TARGET_OS}
+
         # Fixups for musl
         if [ "${TARGET_OS}" = "linux-musl" -o "${TARGET_OS}" = "linux-musleabi" -o "${TARGET_OS}" = "linux-muslx32" ]; then
                 sed -i -e "s,\(d_libm_lib_version=\)'define',\1'undef',g" \
@@ -149,28 +192,47 @@ do_configure() {
                     config.sh-${TARGET_ARCH}-${TARGET_OS}
         fi
 
+        # Fixups wrt. threads
+        sed -i -e "s,\(useithreads=\)'define',\1'${usethreads}',g" \
+               -e "s,\(usemultiplicity=\)'define',\1'${usethreads}',g" \
+               -e "s,\(usethreads=\)'define',\1'${usethreads}',g" \
+            config.sh-${TARGET_ARCH}-${TARGET_OS}
+
         # Update some paths in the configuration
-        sed -i -e 's,@ARCH@-thread-multi,,g' \
+        sed -i -e 's,@ARCH@-thread-multi,${TARGET_ARCH}-${TARGET_OS}${threadmulti},g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
                -e "s,@INCLUDEDIR@,${STAGING_INCDIR},g" \
                -e "s,@LIBDIR@,${libdir},g" \
+               -e "s,@MANDIR@,${mandir},g" \
                -e "s,@BASELIBDIR@,${base_libdir},g" \
                -e "s,@EXECPREFIX@,${exec_prefix},g" \
                -e 's,@USRBIN@,${bindir},g' \
                -e "s,-lnsl,,g" \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
-	case "${TARGET_ARCH}" in
-		x86_64 | powerpc | s390)
-			sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
-				config.sh-${TARGET_ARCH}-${TARGET_OS}
-			;;
-		arm)
-			sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \
-				config.sh-${TARGET_ARCH}-${TARGET_OS}
-			;;
-	esac
+        case "${TARGET_ARCH}" in
+            x86_64 | powerpc | s390)
+                sed -i -e "s,\(need_va_copy=\)'undef',\1'define',g" \
+                        config.sh-${TARGET_ARCH}-${TARGET_OS}
+                ;;
+            arm)
+                sed -i -e "s,\(d_u32align=\)'undef',\1'define',g" \
+                       -e "s,\(castflags=\)'0',\1'1',g" \
+                       -e "s,\(d_castneg=\)'define',\1'undef',g" \
+                       -e "s,\(d_fds_bits=\)'define',\1'undef',g" \
+                       -e "s,\(d_long_double_style_ieee=\)'define',\1'undef',g" \
+                       -e "s,\(d_long_double_style_ieee_extended=\)'define',\1'undef',g" \
+                       -e "s,\(d_ustat=\)'define',\1'undef',g" \
+                       -e "s,\(i_ustat=\)'define',\1'undef',g" \
+                       -e "s:\(longdblinfbytes=\)'[^']*':\1'0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f':g" \
+                       -e "s,\(longdblkind=\)'3',\1'0',g" \
+                       -e "s,\(longdblmantbits=\)'[^']*',\1'12',g" \
+                       -e "s:\(longdblnanbytes=\)'[^']*':\1'0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x7f':g" \
+                       -e "s,\(longdblsize=\)'[^']*',\1'8',g" \
+                        config.sh-${TARGET_ARCH}-${TARGET_OS}
+                ;;
+        esac
         # These are strewn all over the source tree
         for foo in `grep -I --exclude="*.patch" --exclude="*.diff" --exclude="*.pod" --exclude="README*" --exclude="Glossary" -m1 "/usr/include/.*\.h" ${S}/* -r -l` ${S}/utils/h2xs.PL ; do
             echo Fixing: $foo
@@ -187,7 +249,11 @@ do_compile() {
         sed -i -e 's|(@libpath, ".*"|(@libpath, "${STAGING_LIBDIR}"|g' cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 
         cd Cross
-        oe_runmake perl LD="${CCLD}"
+        oe_runmake perl LD="${CCLD}" MAKE_EXT_ARGS="--verbose"
+
+        cd ..
+        sed -i -e "s,\([^=]*=\)\"\([^\"]*\)\",\1'\2',g" \
+            config.sh
 }
 
 do_compile_append_class-target() {
@@ -204,32 +270,36 @@ do_compile_append_class-target() {
 }
 
 do_install() {
-	#export hostperl="${STAGING_BINDIR_NATIVE}/perl-native/perl${PV}"
-	oe_runmake install DESTDIR=${D}
+        oe_runmake install DESTDIR=${D}
         # Add perl pointing at current version
         ln -sf perl${PV} ${D}${bindir}/perl
 
         ln -sf perl ${D}/${libdir}/perl5
 
         # Remove unwanted file and empty directories
-        rm -f ${D}/${libdir}/perl/${PV}/.packlist
-	rmdir ${D}/${libdir}/perl/site_perl/${PV}
-	rmdir ${D}/${libdir}/perl/site_perl
+        rm -f ${D}/${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/.packlist
+        rmdir ${D}/${libdir}/perl/site_perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}
+        rmdir ${D}/${libdir}/perl/site_perl/${PV}
+        rmdir ${D}/${libdir}/perl/site_perl
 
         # Fix up shared library
-        mv ${D}/${libdir}/perl/${PV}/CORE/libperl.so ${D}/${libdir}/libperl.so.${PV}
+        mv ${D}/${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/CORE/libperl.so ${D}/${libdir}/libperl.so.${PV}
         ln -sf libperl.so.${PV} ${D}/${libdir}/libperl.so.5
-        ln -sf ../../../libperl.so.${PV} ${D}/${libdir}/perl/${PV}/CORE/libperl.so
+        ln -sf ../../../libperl.so.${PV} ${D}/${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/CORE/libperl.so
 
         # target config, used by cpan.bbclass to extract version information
         install config.sh ${D}${libdir}/perl
 
-        ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/Config_heavy-target.pl
+        ln -s Config_heavy.pl ${D}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config_heavy-target.pl
 }
 
+NATIVE_SITELIB_INC   = "$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}"
+NATIVE_VENDORLIB_INC = "$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}"
+NATIVE_COREELIB_INC  = "$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}/${HOST_ARCH}-${HOST_OS}${threadmulti}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}"
+
 do_install_append_class-nativesdk () {
         create_wrapper ${D}${bindir}/perl \
-            PERL5LIB='$PERL5LIB:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/site_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/vendor_perl/${PV}:$OECORE_NATIVE_SYSROOT/${libdir_nativesdk}/perl/${PV}'
+            PERL5LIB='$PERL5LIB:${NATIVE_SITELIB_INC}:${NATIVE_VENDORLIB_INC}:${NATIVE_COREELIB_INC}'
 }
 
 PACKAGE_PREPROCESS_FUNCS += "perl_package_preprocess"
@@ -247,19 +317,19 @@ perl_package_preprocess () {
                -e "s,${STAGING_BINDIR_NATIVE}/,,g" \
                -e "s,${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREFIX},${bindir},g" \
                -e 's:${RECIPE_SYSROOT}::g' \
-            ${PKGD}${bindir}/h2xs \
-            ${PKGD}${bindir}/h2ph \
-            ${PKGD}${bindir}/pod2man \
-            ${PKGD}${bindir}/pod2text \
-            ${PKGD}${bindir}/pod2usage \
-            ${PKGD}${bindir}/podchecker \
-            ${PKGD}${bindir}/podselect \
-            ${PKGD}${libdir}/perl/${PV}/CORE/config.h \
-            ${PKGD}${libdir}/perl/${PV}/CORE/perl.h \
-            ${PKGD}${libdir}/perl/${PV}/CORE/pp.h \
-            ${PKGD}${libdir}/perl/${PV}/Config.pm \
-            ${PKGD}${libdir}/perl/${PV}/Config.pod \
-            ${PKGD}${libdir}/perl/${PV}/Config_heavy.pl \
+            ${PKGD}${bindir}/h2xs.perl \
+            ${PKGD}${bindir}/h2ph.perl \
+            ${PKGD}${bindir}/pod2man.perl \
+            ${PKGD}${bindir}/pod2text.perl \
+            ${PKGD}${bindir}/pod2usage.perl \
+            ${PKGD}${bindir}/podchecker.perl \
+            ${PKGD}${bindir}/podselect.perl \
+            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/CORE/config.h \
+            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/CORE/perl.h \
+            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/CORE/pp.h \
+            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config.pm \
+            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config.pod \
+            ${PKGD}${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config_heavy.pl \
             ${PKGD}${libdir}/perl/${PV}/ExtUtils/Liblist/Kid.pm \
             ${PKGD}${libdir}/perl/${PV}/FileCache.pm \
             ${PKGD}${libdir}/perl/${PV}/pod/*.pod \
@@ -267,9 +337,8 @@ perl_package_preprocess () {
 }
 
 PACKAGES = "perl-dbg perl perl-misc perl-dev perl-pod perl-doc perl-lib \
-            perl-module-cpan perl-module-cpanplus perl-module-unicore"
+            perl-module-cpan perl-module-cpanplus perl-module-extutils-manifest perl-module-unicore"
 FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
-               ${libdir}/perl/${PV}/Config.pm \
                ${libdir}/perl/${PV}/strict.pm \
                ${libdir}/perl/${PV}/warnings.pm \
                ${libdir}/perl/${PV}/warnings \
@@ -278,46 +347,37 @@ FILES_${PN} = "${bindir}/perl ${bindir}/perl${PV} \
 FILES_${PN}_append_class-nativesdk = " ${bindir}/perl.real"
 RPROVIDES_${PN} += "perl-module-strict perl-module-vars perl-module-config perl-module-warnings \
                     perl-module-warnings-register"
-FILES_${PN}-dev = "${libdir}/perl/${PV}/CORE"
+FILES_${PN}-dev = "${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/CORE \
+                   ${libdir}/perl/${PV}/*/*.h \
+                   ${libdir}/perl/${PV}/*/*/*.h \
+                   ${libdir}/perl/${PV}/ExtUtils/typemap \
+                   ${libdir}/perl/${PV}/ExtUtils/xsubpp "
 FILES_${PN}-lib = "${libdir}/libperl.so* \
                    ${libdir}/perl5 \
                    ${libdir}/perl/config.sh \
-		   ${libdir}/perl/${PV}/Config_git.pl \
-                   ${libdir}/perl/${PV}/Config_heavy.pl \
-                   ${libdir}/perl/${PV}/Config_heavy-target.pl"
+                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config.pm \
+                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config_git.pl \
+                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config_heavy.pl \
+                   ${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}/Config_heavy-target.pl \
+                   "
 FILES_${PN}-pod = "${libdir}/perl/${PV}/pod \
-		   ${libdir}/perl/${PV}/*.pod \
+                   ${libdir}/perl/${PV}/*.pod \
                    ${libdir}/perl/${PV}/*/*.pod \
                    ${libdir}/perl/${PV}/*/*/*.pod "
-FILES_perl-misc = "${bindir}/*"
-FILES_${PN}-doc = "${libdir}/perl/${PV}/*/*.txt \
-                   ${libdir}/perl/${PV}/*/*/*.txt \
-                   ${libdir}/perl/${PV}/auto/XS/Typemap \
-                   ${libdir}/perl/${PV}/B/assemble \
-                   ${libdir}/perl/${PV}/B/cc_harness \
-                   ${libdir}/perl/${PV}/B/disassemble \
-                   ${libdir}/perl/${PV}/B/makeliblinks \
-                   ${libdir}/perl/${PV}/CGI/eg \
-                   ${libdir}/perl/${PV}/CPAN/PAUSE2003.pub \
-                   ${libdir}/perl/${PV}/CPAN/SIGNATURE \
-		   ${libdir}/perl/${PV}/CPANPLUS/Shell/Default/Plugins/HOWTO.pod \
-                   ${libdir}/perl/${PV}/Encode/encode.h \
-                   ${libdir}/perl/${PV}/ExtUtils/MANIFEST.SKIP \
-                   ${libdir}/perl/${PV}/ExtUtils/NOTES \
-                   ${libdir}/perl/${PV}/ExtUtils/PATCHING \
-                   ${libdir}/perl/${PV}/ExtUtils/typemap \
-                   ${libdir}/perl/${PV}/ExtUtils/xsubpp \
-		   ${libdir}/perl/${PV}/ExtUtils/Changes_EU-Install \
-                   ${libdir}/perl/${PV}/Net/*.eg \
-                   ${libdir}/perl/${PV}/unicore/mktables \
-                   ${libdir}/perl/${PV}/unicore/mktables.lst \
-                   ${libdir}/perl/${PV}/unicore/version "
-
-FILES_perl-module-cpan += "${libdir}/perl/${PV}/CPAN \
+FILES_${PN}-misc = "${bindir}/*"
+FILES_${PN}-doc = "${mandir} \
+                   ${libdir}/perl/${PV}/*/*.txt \
+                   ${libdir}/perl/${PV}/*/*/*.txt "
+
+FILES_${PN}-module-cpan += "${libdir}/perl/${PV}/CPAN \
                            ${libdir}/perl/${PV}/CPAN.pm"
-FILES_perl-module-cpanplus += "${libdir}/perl/${PV}/CPANPLUS \
+FILES_${PN}-module-cpanplus += "${libdir}/perl/${PV}/CPANPLUS \
                                ${libdir}/perl/${PV}/CPANPLUS.pm"
-FILES_perl-module-unicore += "${libdir}/perl/${PV}/unicore"
+FILES_${PN}-module-extutils-manifest_append += " ${libdir}/perl/${PV}/ExtUtils/MANIFEST.SKIP"
+FILES_${PN}-module-unicore += "${libdir}/perl/${PV}/unicore"
+
+RDEPENDS_${PN}-doc += "perl-pod"
+RDEPENDS_${PN}-dev += "perl-modules"
 
 # Create a perl-modules package recommending all the other perl
 # packages (actually the non modules packages and not created too)
@@ -327,8 +387,10 @@ PACKAGES_append = " perl-modules "
 PACKAGESPLITFUNCS_prepend = "split_perl_packages "
 
 python split_perl_packages () {
-    libdir = d.expand('${libdir}/perl/${PV}')
+    libdir = d.expand('${libdir}/perl/${PV}/${TARGET_ARCH}-${TARGET_OS}${threadmulti}')
     do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'perl-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
+    do_split_packages(d, libdir, '(^(?!(auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
+    libdir = d.expand('${libdir}/perl/${PV}')
     do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
@@ -345,9 +407,92 @@ PACKAGES_DYNAMIC_class-nativesdk = "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
 
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "100"
+
+ALTERNATIVE_${PN} = "corelist cpan enc2xs encguess h2ph h2xs instmodsh json_pp libnetcfg \
+                     piconv pl2pm pod2html pod2man pod2text pod2usage podchecker podselect \
+                     prove ptar ptardiff ptargrep shasum splain xsubpp zipdetails"
+ALTERNATIVE_LINK_NAME[corelist] = "${bindir}/corelist"
+ALTERNATIVE_LINK_NAME[cpan] = "${bindir}/cpan"
+ALTERNATIVE_LINK_NAME[enc2xs] = "${bindir}/enc2xs"
+ALTERNATIVE_LINK_NAME[encguess] = "${bindir}/encguess"
+ALTERNATIVE_LINK_NAME[h2ph] = "${bindir}/h2ph"
+ALTERNATIVE_LINK_NAME[h2xs] = "${bindir}/h2xs"
+ALTERNATIVE_LINK_NAME[instmodsh] = "${bindir}/instmodsh"
+ALTERNATIVE_LINK_NAME[json_pp] = "${bindir}/json_pp"
+ALTERNATIVE_LINK_NAME[libnetcfg] = "${bindir}/libnetcfg"
+ALTERNATIVE_LINK_NAME[piconv] = "${bindir}/piconv"
+ALTERNATIVE_LINK_NAME[pl2pm] = "${bindir}/pl2pm"
+ALTERNATIVE_LINK_NAME[pod2html] = "${bindir}/pod2html"
+ALTERNATIVE_LINK_NAME[pod2man] = "${bindir}/pod2man"
+ALTERNATIVE_LINK_NAME[pod2text] = "${bindir}/pod2text"
+ALTERNATIVE_LINK_NAME[pod2usage] = "${bindir}/pod2usage"
+ALTERNATIVE_LINK_NAME[podchecker] = "${bindir}/podchecker"
+ALTERNATIVE_LINK_NAME[podselect] = "${bindir}/podselect"
+ALTERNATIVE_LINK_NAME[prove] = "${bindir}/prove"
+ALTERNATIVE_LINK_NAME[ptar] = "${bindir}/ptar"
+ALTERNATIVE_LINK_NAME[ptardiff] = "${bindir}/ptardiff"
+ALTERNATIVE_LINK_NAME[ptargrep] = "${bindir}/ptargrep"
+ALTERNATIVE_LINK_NAME[shasum] = "${bindir}/shasum"
+ALTERNATIVE_LINK_NAME[splain] = "${bindir}/splain"
+ALTERNATIVE_LINK_NAME[xsubpp] = "${bindir}/xsubpp"
+ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
+
 require perl-rdepends_${PV}.inc
 require perl-ptest.inc
 
 SSTATE_SCAN_FILES += "*.pm *.pod *.h *.pl *.sh"
 
 BBCLASSEXTEND = "nativesdk"
+
+do_create_rdepends_inc() {
+    cd ${WORKDIR}
+    cat <<'EOPREAMBLE' > ${WORKDIR}/perl-rdepends.inc
+# To create/update the perl-rdepends_${PV}.inc use this piece of ugly script (modified for your arch/paths etc):
+
+#jiahongxu:5.20.0-r1$ pwd
+#/home/jiahongxu/yocto/build-20140618-perl/tmp/work/i586-poky-linux/perl/5.20.0-r1
+
+#1 cp -r packages-split packages-split.new && cd packages-split.new
+#2 find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
+#3 egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" 
+#| sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] 
+#| awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'
+#| grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix 
+#| sort -u 
+#| sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' 
+#| egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' > /tmp/perl-rdepends
+
+RDEPENDS_perl-misc += "perl perl-modules"
+RDEPENDS_${PN}-pod += "perl"
+
+# Some additional dependencies that the above doesn't manage to figure out
+RDEPENDS_${PN}-module-file-spec += "${PN}-module-file-spec-unix"
+RDEPENDS_${PN}-module-math-bigint += "${PN}-module-math-bigint-calc"
+RDEPENDS_${PN}-module-thread-queue += "${PN}-module-attributes"
+RDEPENDS_${PN}-module-overload += "${PN}-module-overloading"
+
+# Generated depends list beyond this line
+EOPREAMBLE
+    test -e packages-split.new && rm -rf packages-split.new
+    cp -r packages-split packages-split.new && cd packages-split.new
+    find . -name \*.pm | xargs sed -i '/^=head/,/^=cut/d'
+    egrep -r "^\s*(\<use .*|\<require .*);?" perl-module-* --include="*.pm" | \
+    sed "s/\/.*\.pm: */ += /g;s/[\"\']//g;s/;.*/\"/g;s/+= .*\(require\|use\)\> */+= \"perl-module-/g;s/CPANPLUS::.*/cpanplus/g;s/CPAN::.*/cpan/g;s/::/-/g;s/ [^+\"].*//g;s/_/-/g;s/\.pl\"$/\"/;s/\"\?\$/\"/;s/(//;" | tr [:upper:] [:lower:] | \
+    awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'| \
+    grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix | \
+    sort -u | \
+    sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | \
+    egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-text-unidecode|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' >> ${WORKDIR}/perl-rdepends.inc
+    cp ${WORKDIR}/perl-rdepends.inc ${THISDIR}/perl-rdepends_${PV}.inc
+}
+
+# bitbake perl -c create_rdepends_inc
+addtask do_create_rdepends_inc
+
+# Make sure we have native python ready when we create a new manifest
+do_create_rdepends_inc[depends] += "perl:do_prepare_recipe_sysroot"
+do_create_rdepends_inc[depends] += "perl:do_package"
+do_create_rdepends_inc[depends] += "perl:do_patch"
-- 
2.17.1


