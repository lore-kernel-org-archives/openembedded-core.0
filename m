Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 556E5621BB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:18:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2J9IZj7018958
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 02:18:35 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 02:18:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Mar 2014 17:23:52 +0800
Message-ID: <cover.1395220982.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] image_types.bbclass: use 4096 instead of 8192 bytes-per-inode
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
X-List-Received-Date: Wed, 19 Mar 2014 09:18:39 -0000
Content-Type: text/plain

The following changes since commit 33fa7c8f28d343ecec354a551d45f23643becd59:

  pixbufcache: Fix librsvg-native build (2014-03-18 23:05:23 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/inode
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/inode

Robert Yang (1):
  image_types.bbclass: use 4096 instead of 8192 bytes-per-inode

 meta/classes/image_types.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
1.8.3.1


