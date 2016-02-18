Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5551C62134
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 05:28:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1I5SVBu019545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 21:28:31 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 17 Feb 2016 21:28:31 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Feb 2016 13:28:59 +0800
Message-ID: <cover.1455772181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/5] Package Upgrade -- 20160218
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
X-List-Received-Date: Thu, 18 Feb 2016 05:28:32 -0000
Content-Type: text/plain

The following changes since commit 31af4a37c429bb1db8bfc64242b2963220f9a0e1:

  oeqa/parselogs: Whitelist dmi firmware failure message in 4.4 kernels (2016-02-16 23:53:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/PU20160218
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/PU20160218

Chen Qi (5):
  grep: upgrade to 2.23
  diffstat: upgrade to 1.61
  findutils: upgrade to 4.5.19
  coreutils: upgrade to 8.25
  cups: upgrade to 2.1.3

 .../0001-Unset-need_charset_alias-when-building-for-musl.patch    | 0
 .../{coreutils-8.24 => coreutils-8.25}/fix-selinux-flask.patch    | 0
 .../man-decouple-manpages-from-build.patch                        | 0
 .../remove-usr-local-lib-from-m4.patch                            | 0
 .../coreutils/{coreutils_8.24.bb => coreutils_8.25.bb}            | 8 ++++----
 .../diffstat/{diffstat_1.60.bb => diffstat_1.61.bb}               | 4 ++--
 meta/recipes-extended/cups/cups.inc                               | 2 +-
 meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.3.bb}       | 4 ++--
 .../findutils/{findutils_4.5.14.bb => findutils_4.5.19.bb}        | 4 ++--
 meta/recipes-extended/grep/{grep_2.22.bb => grep_2.23.bb}         | 4 ++--
 10 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/man-decouple-manpages-from-build.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.24 => coreutils-8.25}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.24.bb => coreutils_8.25.bb} (94%)
 rename meta/recipes-devtools/diffstat/{diffstat_1.60.bb => diffstat_1.61.bb} (85%)
 rename meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.3.bb} (40%)
 rename meta/recipes-extended/findutils/{findutils_4.5.14.bb => findutils_4.5.19.bb} (77%)
 rename meta/recipes-extended/grep/{grep_2.22.bb => grep_2.23.bb} (88%)

-- 
1.9.1


