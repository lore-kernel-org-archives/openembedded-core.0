Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE1E46C8BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 09:18:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s259Ia7P018292
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Mar 2014 01:18:36 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 5 Mar 2014 01:18:35 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Mar 2014 17:18:33 +0800
Message-ID: <cover.1394010463.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] flex: not to build shared libraries
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
X-List-Received-Date: Wed, 05 Mar 2014 09:18:35 -0000
Content-Type: text/plain

The following changes since commit f03955041d0e44d377ca1c4def630982f24f1e8b:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:55:27 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/flex
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/flex

Chong Lu (1):
  flex: not to build shared libraries

 .../files/flex-not-to-build-shared-libraries.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex.inc                |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/files/flex-not-to-build-shared-libraries.patch

-- 
1.8.1.2


