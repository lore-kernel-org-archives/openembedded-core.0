Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98BB7780ED
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 04:35:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7B4ZU5S003694
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 21:35:30 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 10 Aug 2017 21:35:29 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2017 00:35:27 -0400
Message-ID: <cover.1502425947.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] expat: Upgrade to 2.2.3
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
X-List-Received-Date: Fri, 11 Aug 2017 04:35:29 -0000
Content-Type: text/plain

The following changes since commit 5e4bd86130866d4a92fa7b0fa6d3628126dfdf91:

  libinput: Upgrade 1.7.3 -> 1.8.1 (2017-08-09 09:38:25 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/expat-upgrade-to-2.2.3
  https://github.com//tree/dengke/expat-upgrade-to-2.2.3

Khem Raj (1):
  expat: Upgrade to 2.2.3

 meta/recipes-core/expat/expat.inc               |  1 +
 meta/recipes-core/expat/expat/libtool-tag.patch | 18 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.1.bb          |  5 -----
 meta/recipes-core/expat/expat_2.2.3.bb          |  4 ++++
 4 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/libtool-tag.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.3.bb

-- 
2.8.1


