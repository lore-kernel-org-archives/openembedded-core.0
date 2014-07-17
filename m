Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46F3570602
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:53:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H7rWdb024188
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 00:53:33 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 17 Jul 2014 00:53:32 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 15:53:33 +0800
Message-ID: <cover.1405583236.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V5 0/2] shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Thu, 17 Jul 2014 07:53:32 -0000
Content-Type: text/plain

The following changes since commit 846bc50fde11bbb36c8eb5b2e3ae6bb644c037f3:

  ltp: use "foreign" automake strictness (2014-07-16 10:27:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/shadow-4.2.1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/shadow-4.2.1

Chen Qi (2):
  shadow: upgrade from 4.1.4.3 to 4.2.1
  oeqa: fix return status in pam.py to match shadow-4.2.1

 meta/lib/oeqa/runtime/pam.py                       |    6 +-
 ...-create-parent-directories-when-necessary.patch |  109 ++
 .../shadow/files/add_root_cmd_groupmems.patch      |   75 --
 .../shadow/files/add_root_cmd_options.patch        | 1384 --------------------
 .../allow-for-setting-password-in-clear-text.patch |  215 ++-
 ...fix-unexpected-open-failure-in-chroot-env.patch |   46 +
 .../shadow/files/fix-etc-gshadow-reading.patch     |   36 -
 ...installation-failure-with-subids-disabled.patch |   28 +
 .../shadow-4.1.4.2-env-reset-keep-locale.patch     |   31 -
 .../files/shadow-4.1.4.2-groupmod-pam-check.patch  |   36 -
 .../files/shadow-4.1.4.2-su_no_sanitize_env.patch  |   31 -
 .../shadow/files/shadow.automake-1.11.patch        |  106 --
 .../files/shadow_fix_for_automake-1.12.patch       |   23 -
 .../files/slackware_fix_for_glib-2.17_crypt.patch  |   63 -
 meta/recipes-extended/shadow/files/useradd.patch   |   17 -
 ...-compilation-failure-with-subids-disabled.patch |   33 +
 ...uretty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} |    0
 ...-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} |    0
 meta/recipes-extended/shadow/shadow.inc            |   36 +-
 .../shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb}  |    0
 20 files changed, 336 insertions(+), 1939 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/0001-useradd.c-create-parent-directories-when-necessary.patch
 delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_groupmems.patch
 delete mode 100644 meta/recipes-extended/shadow/files/add_root_cmd_options.patch
 create mode 100644 meta/recipes-extended/shadow/files/commonio.c-fix-unexpected-open-failure-in-chroot-env.patch
 delete mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
 create mode 100644 meta/recipes-extended/shadow/files/fix-installation-failure-with-subids-disabled.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-env-reset-keep-locale.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-groupmod-pam-check.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow-4.1.4.2-su_no_sanitize_env.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow.automake-1.11.patch
 delete mode 100644 meta/recipes-extended/shadow/files/shadow_fix_for_automake-1.12.patch
 delete mode 100644 meta/recipes-extended/shadow/files/slackware_fix_for_glib-2.17_crypt.patch
 delete mode 100644 meta/recipes-extended/shadow/files/useradd.patch
 create mode 100644 meta/recipes-extended/shadow/files/usermod-fix-compilation-failure-with-subids-disabled.patch
 rename meta/recipes-extended/shadow/{shadow-securetty_4.1.4.3.bb => shadow-securetty_4.2.1.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow-sysroot_4.1.4.3.bb => shadow-sysroot_4.2.1.bb} (100%)
 rename meta/recipes-extended/shadow/{shadow_4.1.4.3.bb => shadow_4.2.1.bb} (100%)

-- 
1.7.9.5


