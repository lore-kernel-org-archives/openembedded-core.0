Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC9D67708A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 06:45:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0P6jojc023595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 22:45:50 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 24 Jan 2016 22:45:49 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 14:44:04 +0800
Message-ID: <cover.1453703961.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Add dependency perl-native for wget
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
X-List-Received-Date: Mon, 25 Jan 2016 06:45:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit a304b820b87ad4ba90a3e121cf864c445fee710c:

  weston: Add missing DEPENDS on wayland-native (2016-01-24 10:55:50 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/wget
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/wget

Kai Kang (1):
  wget: inherit perlnative

 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.6.1


