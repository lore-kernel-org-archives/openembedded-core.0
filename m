Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBF2B782A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:09:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L69x1W005599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Aug 2017 23:09:59 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:09:58 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 02:09:56 -0400
Message-ID: <cover.1503295544.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] gdk-pixbuf: fix ptest RDEPENDS for multilib build
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
X-List-Received-Date: Mon, 21 Aug 2017 06:09:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:
* rebase patch for gdk-pixbuf 2.36.8
* add a short commit message

The following changes since commit 04dc76713b57f28457742dd863caa663591d4866:

  devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation. (2017-08-19 22:15:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/gdk-pixbuf-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/gdk-pixbuf-v2

Wenzong Fan (1):
  gdk-pixbuf: fix ptest RDEPENDS for multilib build

 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.1


