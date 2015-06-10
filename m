Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 630426AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:25:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7P32e017454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:25:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 10 Jun 2015 00:25:03 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 15:25:21 +0800
Message-ID: <cover.1433920984.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/3] Extensible SDK: 3 fixes
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
X-List-Received-Date: Wed, 10 Jun 2015 07:25:05 -0000
Content-Type: text/plain

Changes since V1:
*) Make use of bb.utils.edit_metadata.
*) Introduce a whitelist mechanism to allow exceptions.

The following changes since commit de6a26b95a7f7bd8f9dc47ab35d8b07ba671f4eb:

  x264: use x86 over-ride instead of i586 (2015-06-08 17:32:46 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/ext-sdk-3-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/ext-sdk-3-fixes

Chen Qi (3):
  populate_sdk_ext: install the latest buildtools-tarball
  copy_buildsystem: make sure bitbake directory is copied
  populate_sdk_ext: consider custom configuration in local.conf

 meta/classes/populate_sdk_ext.bbclass | 21 ++++++++++++++++++++-
 meta/lib/oe/copy_buildsystem.py       |  7 +++----
 2 files changed, 23 insertions(+), 5 deletions(-)

-- 
1.9.1


