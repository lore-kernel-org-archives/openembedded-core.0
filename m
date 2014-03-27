Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 299EF6B8BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 08:11:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2R8BQfL006710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 01:11:26 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 27 Mar 2014 01:11:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Mar 2014 04:11:20 -0400
Message-ID: <cover.1395906475.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/4] fixes for gummiboot and gnu-efi
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
X-List-Received-Date: Thu, 27 Mar 2014 08:11:28 -0000
Content-Type: text/plain

The following changes since commit 109f6731210053ac6c490fc49956d0f65078f0ef:

  util-linux-native: fix qsort_r for CentOS 5.10 (2014-03-27 03:45:56 -0400)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/gummiboot
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/gummiboot

Robert Yang (4):
  gnu-efi: fix the LIBDIR
  gummiboot: add COMPATIBLE_HOST
  gummiboot: use objcopy from the env
  gummiboot: fix the installed but not shipped warning

 meta/recipes-bsp/gnu-efi/gnu-efi_3.0u.bb           |    2 +-
 .../gummiboot/gummiboot/fix-objcopy.patch          |   39 ++++++++++++++++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |    8 +++-
 3 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/fix-objcopy.patch

-- 
1.7.10.4


