Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 41D2F7894A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jan 2018 09:32:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w089WuZW009473
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jan 2018 01:32:57 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 8 Jan 2018 01:32:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jan 2018 17:32:57 +0800
Message-ID: <cover.1515403603.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 00/12 V2] Fixes for multilib and eSDK
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
X-List-Received-Date: Mon, 08 Jan 2018 09:32:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* V2
  + Drop already merged patches

  + Fix RP's comments:
    - deltask populate_sdk and populate_sdk_ext for multilib
    - Drop "image.bbclass: remove depmodwrapper-cross from DEPENDS"
    - sstate.bbclass: sstate_hardcode_path(): fix for multilib
      > fix the grep command

* V1
  - Initial version

// Robert

The following changes since commit e9dfe7eb7f61b909ae7d034e80cfbebc1fad018b:

  icu-dbg: improve reproducibility (2018-01-08 08:45:33 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib oem1
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=oem1

Robert Yang (12):
  staging.bbclass: fix for multilib
  populate_sdk_ext.bbclass: fix for multilib
  sstate.bbclass: sstate_hardcode_path(): fix for multilib
  staging.bbclass: staging_populate_sysroot_dir(): fix for multilib
  staging.bbclass: print searched manifest when not found
  staging.bbclass: extend_recipe_sysroot(): search multilib manifest
  package_manager.py: reverse archs correctly
  multilib.bbclass: remove invalid PACKAGE_INSTALL
  multilib.bbclass: extend allarch recipes
  toolchain-scripts.bbclass: only install all MULTILIB_VARIANTS for
    image
  multilib.bbclass: deltask populate_sdk and populate_sdk_ext
  populate_sdk_ext.bbclass: remove the try...finally

 meta/classes/allarch.bbclass           |   3 -
 meta/classes/multilib.bbclass          |   8 +-
 meta/classes/multilib_global.bbclass   |   4 +-
 meta/classes/package.bbclass           |   9 ---
 meta/classes/populate_sdk_ext.bbclass  | 142 +++++++++++++++++++--------------
 meta/classes/sstate.bbclass            |   8 +-
 meta/classes/staging.bbclass           |  40 +++++++++-
 meta/classes/toolchain-scripts.bbclass |   6 ++
 meta/lib/oe/package_manager.py         |  57 +++++++++++--
 9 files changed, 186 insertions(+), 91 deletions(-)

-- 
2.7.4


