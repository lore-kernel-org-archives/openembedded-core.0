Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 911586B11A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 May 2019 06:44:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x476i4FH028183
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 May 2019 23:44:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Mon, 6 May 2019 23:44:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 May 2019 14:55:02 +0800
Message-ID: <cover.1557212052.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] flac & squashfs-tools: set CVE_PRODUCT
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
X-List-Received-Date: Tue, 07 May 2019 06:44:03 -0000
Content-Type: text/plain

The following changes since commit eb8c7b5e1ff3a474ddaa5ebffecef963b225df6d:

  bitbake: HEADER: Drop it (2019-05-04 10:44:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cve_products
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cve_products

Chen Qi (2):
  flac: also add flac to CVE_PRODUCT
  squashfs-tools: set CVE_PRODUCT

 meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 2 ++
 meta/recipes-multimedia/flac/flac_1.3.2.bb                 | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
1.9.1


