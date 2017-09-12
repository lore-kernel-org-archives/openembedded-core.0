Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DBDDD78475
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 01:20:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8C1KBml024289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Sep 2017 18:20:11 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 11 Sep 2017 18:20:10 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 21:20:08 -0400
Message-ID: <cover.1505178922.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V2 0/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 01:20:11 -0000
Content-Type: text/plain

Changed in V2:
	Add the MAX_LONG_FILE_PATH to 1023.

The following changes since commit 8b4f16a9cbbaf521461f699b7264fac2ac872581:

  mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (2017-09-05 15:01:02 +0100)

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


