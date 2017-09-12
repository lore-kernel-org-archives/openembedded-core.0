Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D3AB783EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 08:05:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8C85B5h017681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 12 Sep 2017 01:05:11 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 12 Sep 2017 01:05:09 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <patrick.ohly@intel.com>
Date: Tue, 12 Sep 2017 04:05:08 -0400
Message-ID: <cover.1505203270.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 0/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 08:05:11 -0000
Content-Type: text/plain

Changed in V2:
	Add the MAX_LONG_FILE_PATH to 1023 suggested by ross.

Changed in V3:
	Let the patch Upstream-Status be Inappropriate suggested by patrick.

The following changes since commit e3a69364eb1fdbf1dcb98a04b3ddfc8f9841a7fa:

  staging: gracefully abort if two recipes conflict in the sysroot (2017-09-11 17:30:30 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/fix-ovmf-do-compile-error-when-enable-long-file-path
  https://github.com//tree/dengke/fix-ovmf-do-compile-error-when-enable-long-file-path

Dengke Du (1):
  ovmf: fix do_compile error when len(tmp)=410

 .../ovmf/0004-ovmf-enable-long-path-file.patch     | 28 ++++++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb                 |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-file.patch

-- 
2.8.1


