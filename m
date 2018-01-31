Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3502F7886A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:48:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0V7mNpW001978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 23:48:23 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 23:48:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 02:48:11 -0500
Message-ID: <cover.1517383469.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/7] upgrade 7 recipes
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
X-List-Received-Date: Wed, 31 Jan 2018 07:48:23 -0000
Content-Type: text/plain

The following changes since commit e5e89cfb7bc2231ac4fcc16f4cb4f74d806136c4:

  pulseaudio: improve glibc 2.27 patch (2018-01-30 12:53:16 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/upgrade-20180131
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/upgrade-20180131

Hongxu Jia (7):
  help2man-native: 1.47.4 -> 1.47.5
  pigz: 2.3.4 -> 2.4
  ncurses: 6.0+20170715 -> 6.0+20171125
  gpgme: 1.9.0 -> 1.10.0
  ghostscript: 9.21 -> 9.22
  apr-util: 1.6.0 -> 1.6.1
  apr: 1.6.2 -> 1.6.3

 ...-2017-13729-CVE-2017-13728-CVE-2017-13731.patch | 541 ---------------------
 ...ses_6.0+20170715.bb => ncurses_6.0+20171125.bb} |   3 +-
 ...-native_1.47.4.bb => help2man-native_1.47.5.bb} |   4 +-
 .../0001-contrib.mak-fix-for-parallel-build.patch} |  28 +-
 ...base-gendev.c-fix-for-Werror-return-type.patch} |   8 +-
 ...nfigure.ac-do-not-check-local-png-source.patch} |  10 +-
 .../0004-avoid-host-contamination.patch}           |  18 +-
 ...allow-directories-to-be-created-more-tha.patch} |  16 +-
 .../0006-prevent-recompiling.patch}                |  74 ++-
 .../0007-genarch.patch}                            |  34 +-
 .../0008-cups-no-gcrypt.patch}                     |  14 +-
 ...script-native-fix-disable-system-libtiff.patch} |  21 +-
 ...-add-a-preprocessor-define-to-allow-fope.patch} |  16 +-
 .../ghostscript/ghostscript/CVE-2016-7977.patch    |  33 --
 .../ghostscript/ghostscript/CVE-2017-11714.patch   |  61 ---
 .../ghostscript/ghostscript/CVE-2017-5951.patch    |  44 --
 .../ghostscript/ghostscript/CVE-2017-7207.patch    |  39 --
 .../ghostscript/ghostscript/CVE-2017-7975.patch    |  37 --
 .../ghostscript/ghostscript/CVE-2017-9216.patch    |  36 --
 .../ghostscript/ghostscript/CVE-2017-9611.patch    |  34 --
 .../ghostscript/ghostscript/CVE-2017-9612.patch    |  35 --
 .../ghostscript/ghostscript/CVE-2017-9726.patch    |  33 --
 .../ghostscript/ghostscript/CVE-2017-9727.patch    |  35 --
 .../ghostscript/ghostscript/CVE-2017-9739.patch    |  37 --
 .../ghostscript/ghostscript/CVE-2017-9835.patch    | 125 -----
 .../{ghostscript_9.21.bb => ghostscript_9.22.bb}   |  54 +-
 .../pigz/{pigz_2.3.4.bb => pigz_2.4.bb}            |   6 +-
 .../apr/{apr-util_1.6.0.bb => apr-util_1.6.1.bb}   |   6 +-
 ...gure_fixes.patch => 0001-configure-fixes.patch} |  28 +-
 meta/recipes-support/apr/apr/0002-cleanup.patch    |  59 +++
 .../apr/{configfix.patch => 0003-configfix.patch}  |  27 +-
 ...4-Makefile.in-fix-cross-compiling-failed.patch} |  13 +-
 ...> 0005-Fix-packet-discards-HTTP-redirect.patch} |  15 +-
 ...-fix-LTFLAGS-to-make-it-work-with-ccache.patch} |  10 +-
 ...t-size-doesn-t-match-in-glibc-when-cross.patch} |  16 +-
 ...ink-libapr-against-phtread-to-make-gold-.patch} |  12 +-
 meta/recipes-support/apr/apr/cleanup.patch         |  43 --
 .../apr/{apr_1.6.2.bb => apr_1.6.3.bb}             |  23 +-
 .../gpgme/gpgme/0001-pkgconfig.patch               |  10 +-
 ...python-gpg-error-config-should-not-be-use.patch |  66 +--
 .../0003-Correctly-install-python-modules.patch    |  27 +-
 .../gpgme/gpgme/0004-python-import.patch           |   6 +-
 ...g-skip-all-lib-or-usr-lib-directories-in-.patch |   6 +-
 .../gpgme/gpgme/0006-fix-build-path-issue.patch    |  38 ++
 .../gpgme/{gpgme_1.9.0.bb => gpgme_1.10.0.bb}      |  12 +-
 45 files changed, 419 insertions(+), 1394 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/CVE-2017-13732-CVE-2017-13734-CVE-2017-13730-CVE-2017-13729-CVE-2017-13728-CVE-2017-13731.patch
 rename meta/recipes-core/ncurses/{ncurses_6.0+20170715.bb => ncurses_6.0+20171125.bb} (66%)
 rename meta/recipes-devtools/help2man/{help2man-native_1.47.4.bb => help2man-native_1.47.5.bb} (79%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.15-parallel-make.patch => files/0001-contrib.mak-fix-for-parallel-build.patch} (55%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.16-Werror-return-type.patch => files/0002-base-gendev.c-fix-for-Werror-return-type.patch} (79%)
 rename meta/recipes-extended/ghostscript/files/{do-not-check-local-libpng-source.patch => 0003-configure.ac-do-not-check-local-png-source.patch} (81%)
 rename meta/recipes-extended/ghostscript/{ghostscript/avoid-host-contamination.patch => files/0004-avoid-host-contamination.patch} (61%)
 rename meta/recipes-extended/ghostscript/{ghostscript/mkdir-p.patch => files/0005-ghostscript-allow-directories-to-be-created-more-tha.patch} (80%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.21-prevent_recompiling.patch => files/0006-prevent-recompiling.patch} (51%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.02-genarch.patch => files/0007-genarch.patch} (41%)
 rename meta/recipes-extended/ghostscript/{ghostscript/cups-no-gcrypt.patch => files/0008-cups-no-gcrypt.patch} (67%)
 rename meta/recipes-extended/ghostscript/{ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patch => files/0009-ghostscript-native-fix-disable-system-libtiff.patch} (66%)
 rename meta/recipes-extended/ghostscript/{ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.patch => files/0010-base-genht.c-add-a-preprocessor-define-to-allow-fope.patch} (65%)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2016-7977.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-11714.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-5951.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7207.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-7975.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9216.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9611.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9612.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9726.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9727.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9739.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2017-9835.patch
 rename meta/recipes-extended/ghostscript/{ghostscript_9.21.bb => ghostscript_9.22.bb} (66%)
 rename meta/recipes-extended/pigz/{pigz_2.3.4.bb => pigz_2.4.bb} (86%)
 rename meta/recipes-support/apr/{apr-util_1.6.0.bb => apr-util_1.6.1.bb} (95%)
 rename meta/recipes-support/apr/apr/{configure_fixes.patch => 0001-configure-fixes.patch} (69%)
 create mode 100644 meta/recipes-support/apr/apr/0002-cleanup.patch
 rename meta/recipes-support/apr/apr/{configfix.patch => 0003-configfix.patch} (75%)
 rename meta/recipes-support/apr/apr/{upgrade-and-fix-1.5.1.patch => 0004-Makefile.in-fix-cross-compiling-failed.patch} (81%)
 rename meta/recipes-support/apr/apr/{Fix-packet-discards-HTTP-redirect.patch => 0005-Fix-packet-discards-HTTP-redirect.patch} (71%)
 rename meta/recipes-support/apr/apr/{configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch => 0006-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch} (81%)
 rename meta/recipes-support/apr/apr/{0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch => 0007-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch} (85%)
 rename meta/recipes-support/apr/apr/{0002-explicitly-link-libapr-against-phtread-to-make-gold-.patch => 0008-explicitly-link-libapr-against-phtread-to-make-gold-.patch} (90%)
 delete mode 100644 meta/recipes-support/apr/apr/cleanup.patch
 rename meta/recipes-support/apr/{apr_1.6.2.bb => apr_1.6.3.bb} (81%)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0006-fix-build-path-issue.patch
 rename meta/recipes-support/gpgme/{gpgme_1.9.0.bb => gpgme_1.10.0.bb} (88%)

-- 
2.8.1


