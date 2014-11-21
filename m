Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 924A16A9FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 08:50:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAL8oE5x006827
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 00:50:14 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 21 Nov 2014 00:50:14 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Nov 2014 16:50:18 +0800
Message-ID: <cover.1416559751.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] opkg-utils: fix double slash problem in update-alternatives
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
X-List-Received-Date: Fri, 21 Nov 2014 08:50:17 -0000
Content-Type: text/plain

The following changes since commit 4a888b2ab61662c7f749b5d1e64af92ed613d8eb:

  gtk+: drop part of patch adding useless file (2014-11-20 14:08:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/update-alternatives-double-slash
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/update-alternatives-double-slash

Chen Qi (1):
  opkg-utils: fix double slash problem in update-alternatives

 ...-update-alternatives-avoid-double-slashes.patch | 25 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-avoid-double-slashes.patch

-- 
1.9.1


