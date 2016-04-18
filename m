Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08EA560722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 09:29:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3I9TS43006019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:29:28 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 02:29:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Apr 2016 02:29:25 -0700
Message-ID: <cover.1460971725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/2] fix xf86-video-omapfb and grub_git for armv7a
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
X-List-Received-Date: Mon, 18 Apr 2016 09:29:29 -0000
Content-Type: text/plain

The following changes since commit 37aac647d510557323083c77c3114476440a325d:

  fs-perms.txt: fix ROOT_HOME's permission (2016-04-15 06:58:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/arm
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/arm

Robert Yang (2):
  xf86-video-omapfb: remove EXTRA_OECONF_armv7a
  grub_git: set COMPATIBLE_HOST_armv7a to null

 meta/recipes-bsp/grub/grub_git.bb                          | 1 +
 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

-- 
2.8.0


