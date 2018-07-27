Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C699660064
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:00:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6R80xbe012146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 01:00:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Fri, 27 Jul 2018 01:00:40 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2018 16:04:31 +0800
Message-ID: <cover.1532669923.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Package Upgrade: cups, coreutils, shadow
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
X-List-Received-Date: Fri, 27 Jul 2018 08:00:58 -0000
Content-Type: text/plain

The following changes since commit 1b56227d77d3113c9c17ec35cb7849a768078c4e:

  classes/package: fix variable name in comment (2018-07-26 17:14:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/PU
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/PU

Chen Qi (3):
  cups: upgrade 2.2.6 -> 2.2.8
  coreutils: upgrade 8.29 -> 8.30
  shadow: upgrade 4.2.1 -> 4.6

 ...need_charset_alias-when-building-for-musl.patch |  33 ----
 .../{coreutils_8.29.bb => coreutils_8.30.bb}       |   7 +-
 .../cups/{cups_2.2.6.bb => cups_2.2.8.bb}          |   4 +-
 .../0001-Disable-use-of-syslog-for-sysroot.patch   |  21 +--
 ...o-not-read-login.defs-before-doing-chroot.patch |  46 ------
 .../shadow/files/0001-shadow-CVE-2017-12424        |  46 ------
 ...-useradd-copy-extended-attributes-of-home.patch |  28 ++--
 ...-create-parent-directories-when-necessary.patch |  83 +++++-----
 .../shadow/files/CVE-2017-2616.patch               |  64 --------
 .../allow-for-setting-password-in-clear-text.patch | 181 ++++++++++++++++-----
 ..._of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch |  41 -----
 ...installation-failure-with-subids-disabled.patch |  28 ----
 ...-compilation-failure-with-subids-disabled.patch |  33 ----
 ...-securetty_4.2.1.bb => shadow-securetty_4.6.bb} |   0
 ...adow-sysroot_4.2.1.bb => shadow-sysroot_4.6.bb} |   0
 meta/recipes-extended/shadow/shadow.inc            |  13 +-
 .../shadow/{shadow_4.2.1.bb => shadow_4.6.bb}      |   0
 17 files changed, 214 insertions(+), 414 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-Unset-need_charset_alias-when-building-for-musl.patch
 rename meta/recipes-core/coreutils/{coreutils_8.29.bb => coreutils_8.30.bb} (94%)
 rename meta/recipes-extended/cups/{cups_2.2.6.bb => cups_2.2.8.bb} (40%)
 delete mode 100644 meta/recipes-extended/shadow/files/0001-Do-not-read-login.defs-before-doing-chroot.patch
 delete mode 100644 meta/recipes-extended/shadow/files/0001-shadow-CVE-2017-12424
 delete mode 100644 meta/recipes-extended/shadow/files/CVE-2017-2616.patch
 delete mode 100644 meta/recipes-extended/shadow/files/check_size_of_uid_t_and_gid_t_using_AC_CHECK_SIZEOF.patch
 delete mode 100644 meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
 delete mode 100644 meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
 rename meta/recipes-extended/shadow/{shadow-securetty_4.2.1.bb => shadow-securetty_4.6.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow-sysroot_4.2.1.bb => shadow-sysroot_4.6.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow_4.2.1.bb => shadow_4.6.bb} (100%)

-- 
1.9.1


