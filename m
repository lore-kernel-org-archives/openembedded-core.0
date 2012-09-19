Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TEO5P-0002jb-5p
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:29:19 +0200
Received: by bkvi18 with SMTP id i18so368943bkv.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 10:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=6qhjKwsL1I78V9WoAYlefJZu7IegJYix8SAUrEHFt3U=;
	b=X8DYv2dn0Iz7bNAS/nYFh0KMy7qTF9g3+UUPGrDRGLCxr1+gIprhXHban08ePd3/Pn
	VSfwir8CvmUrifLpHO0JfFnbaPsrsbRmIrdmhhR9mKDYpBs5nLXn+11y3X8Zci//A9op
	IV6RvPkO21ANi0WGiS46SRf2yaf4Y9mPYc2WCaXsUGXVsiyEMgVAF1VqrLGZviGVmIz7
	tKKaK1p2oteH4vBTXuUp9V1dJdpwS3MDBt9LDiPBLCAgIFc4AvWdZsxDbXpHdIsKFz53
	AXH9dwsHaCx7J919aizVQO269MR9cUSIOTwR96iPilRFc6n+G0+f3skzbLnrmyoV8AES
	Yx4Q==
Received: by 10.204.146.13 with SMTP id f13mr25514bkv.29.1348074997654;
	Wed, 19 Sep 2012 10:16:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y20sm2576517bkv.11.2012.09.19.10.16.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 10:16:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 19:16:28 +0200
Message-Id: <cover.1348074403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [PATCH 0/3] Opkg patch upstreaming and SIGSEGV fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 17:29:19 -0000

This depends on
http://patchwork.openembedded.org/patch/36893/
otherwise warning about missing SRC_URI entries will be shown

The following changes since commit f06097f4581e4c728c2950a86e025384e4bdcdf0:

  eglibc: Do not use fsqrt in libm when building for fsl ppc with fpu (2012-09-18 07:44:13 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/opkg
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/opkg

Martin Jansa (3):
  opkg: replace local patches with git patches submitted upstream
  opkg: add patch to fix SIGSEGV when printing status file
  opkg-nogpg: drop SRCREV

 meta/recipes-devtools/opkg/opkg-nogpg_svn.bb       |  2 -
 .../0001-add-opkg_compare_versions-function.patch  | 51 ++++++++++++++
 ...e-the-uname-gname-fields-when-extracting.patch} | 30 +++++---
 ...ix-dependency-issues-for-preinst-scripts.patch} | 65 ++++++++++--------
 ...nst-script-is-not-fatal-with-conf-offlin.patch} | 75 +++++++++++---------
 ...ot-read-etc-opkg-.conf-if-f-is-specified.patch} | 11 ++-
 ...tch => 0006-detect-circular-dependencies.patch} | 79 +++++++++++++---------
 ...g-provides-even-when-oldpkg-provides-exis.patch | 46 +++++++++++++
 meta/recipes-devtools/opkg/opkg/add_vercmp.patch   | 36 ----------
 meta/recipes-devtools/opkg/opkg_svn.bb             | 15 ++--
 10 files changed, 258 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-add-opkg_compare_versions-function.patch
 rename meta/recipes-devtools/opkg/opkg/{add_uname_support.patch => 0002-Ensure-we-use-the-uname-gname-fields-when-extracting.patch} (71%)
 rename meta/recipes-devtools/opkg/opkg/{fix_installorder.patch => 0003-Fix-dependency-issues-for-preinst-scripts.patch} (82%)
 rename meta/recipes-devtools/opkg/opkg/{offline_postinstall.patch => 0004-Failed-postinst-script-is-not-fatal-with-conf-offlin.patch} (52%)
 rename meta/recipes-devtools/opkg/opkg/{conf_override.patch => 0005-Do-not-read-etc-opkg-.conf-if-f-is-specified.patch} (91%)
 rename meta/recipes-devtools/opkg/opkg/{track_parents.patch => 0006-detect-circular-dependencies.patch} (59%)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0007-merge-newpkg-provides-even-when-oldpkg-provides-exis.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg/add_vercmp.patch

-- 
1.7.12



