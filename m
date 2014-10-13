Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A93BD6A362
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 07:45:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9D7jLk1008048
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 00:45:22 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 13 Oct 2014 00:45:21 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Oct 2014 15:43:19 +0800
Message-ID: <cover.1413186161.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] python-smartpm: Add checking for "rpm-ignoresize" option
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
X-List-Received-Date: Mon, 13 Oct 2014 07:45:24 -0000
Content-Type: text/plain

The following changes since commit ccf5a4d2342c4fd40e4e0b332ea7e34e0bf175d4:

  build-appliance-image: Update to dizzy head revision (2014-10-11 08:11:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/smart
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/smart

Chong Lu (1):
  python-smartpm: Add checking for "rpm-ignoresize" option

 meta/lib/oe/package_manager.py                     |  1 +
 .../smart-add-for-rpm-ignoresize-check.patch       | 37 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 3 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch

-- 
1.9.1


