Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8BAD660557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:15:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7LAFLwb012002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:15:21 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 21 Aug 2015 03:15:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2015 03:15:15 -0700
Message-ID: <cover.1440145857.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/5] Packages Upgrade
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
X-List-Received-Date: Fri, 21 Aug 2015 10:15:21 -0000
Content-Type: text/plain

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/PU
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/PU

Robert Yang (5):
  gnupg: 2.1.6 -> 2.1.7
  man-pages: 4.01 -> 4.02
  gnu-efi: 3.0.2 -> 3.0.3
  btrfs-tools: 4.1.1 -> 4.1.2
  oprofile: 1.0.0 -> 1.1.0

 .../gnu-efi/{gnu-efi_3.0.2.bb => gnu-efi_3.0.3.bb} |    5 ++-
 .../btrfs-tools/btrfs-tools_git.bb                 |    2 +-
 .../{man-pages_4.01.bb => man-pages_4.02.bb}       |    4 +-
 meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
 .../oprofile/oprofile/filemode-fix.patch           |   41 --------------------
 .../{oprofile_1.0.0.bb => oprofile_1.1.0.bb}       |    5 +--
 .../gnupg/{gnupg_2.1.6.bb => gnupg_2.1.7.bb}       |    4 +-
 7 files changed, 11 insertions(+), 53 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.2.bb => gnu-efi_3.0.3.bb} (93%)
 rename meta/recipes-extended/man-pages/{man-pages_4.01.bb => man-pages_4.02.bb} (86%)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile/filemode-fix.patch
 rename meta/recipes-kernel/oprofile/{oprofile_1.0.0.bb => oprofile_1.1.0.bb} (44%)
 rename meta/recipes-support/gnupg/{gnupg_2.1.6.bb => gnupg_2.1.7.bb} (89%)

-- 
1.7.9.5


