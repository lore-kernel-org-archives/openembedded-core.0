Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CFA3F788F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 03:20:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2D3KLoG028957
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 20:20:22 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 20:19:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Mar 2018 11:24:42 +0800
Message-ID: <cover.1520911259.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/8] [rebase and resend] fixes for multilib
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
X-List-Received-Date: Tue, 13 Mar 2018 03:20:20 -0000
Content-Type: text/plain

Hi RP,

The multilib is still broken without these patches, I'd like to add oeqa test
cases for them after it works.

// Robert

The following changes since commit 073d8d001033471d7fe44f52212c72a6c3541313:

  dbus-test-ptest: improve reproducibility (2018-03-12 15:05:58 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/mlib
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/mlib

Robert Yang (8):
  populate_sdk_ext.bbclass: fix for multilib
  staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
  staging.bbclass: print searched manifest when not found
  package_manager.py: reverse archs correctly
  multilib.bbclass: extend allarch recipes
  toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
    image
  populate_sdk_ext.bbclass: remove the try...finally
  staging.bbclass: extend_recipe_sysroot: fix multilib manifest

 meta/classes/allarch.bbclass           |   3 -
 meta/classes/multilib.bbclass          |   4 -
 meta/classes/multilib_global.bbclass   |   4 +-
 meta/classes/package.bbclass           |   9 ---
 meta/classes/populate_sdk_ext.bbclass  | 142 +++++++++++++++++++--------------
 meta/classes/staging.bbclass           |  25 ++++++
 meta/classes/toolchain-scripts.bbclass |   6 ++
 meta/lib/oe/package_manager.py         |  57 +++++++++++--
 meta/lib/oe/sstatesig.py               |   3 +
 9 files changed, 168 insertions(+), 85 deletions(-)

-- 
2.7.4


