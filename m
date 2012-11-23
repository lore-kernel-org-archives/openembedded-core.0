Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tbhe6-0005el-6t
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 02:01:30 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4771205eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 16:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=zaI5xqjbG8Rucsg/6i/lhOKcNErEuWsVeX0tSbkMyLM=;
	b=qmRUPVkO1G6+SkPFRKXciMo+LdzjvrH/TFF88EN5JtKxjHzYXM6b8U5L62e/ZjMysd
	Ot8Z2imL2OOZSwMSa4JyOUAfzYOQD9Rm6skSPuMnx8aQVH0jDPKMrF3HldJDLtczxNrM
	CkqL9TpKwdoz7IDTN0pYcxXzCYK3FN8mzX76C9LfOtB6IMW5YjzIRh/oK/A9scbfY52c
	p2oct+fVCR2cEwKmUqE4Nvo8apMqC1IAiiVuGnAl0atfipsS9tpavemRPFGBimvW42GO
	WykRsTdD7P7+VcjyfJ004pky39VeKXIhk3tC4LhMKrA4DEUdK+h+spDt5M+t2qbnZH0a
	uHRA==
Received: by 10.14.221.8 with SMTP id q8mr7003695eep.28.1353631643213;
	Thu, 22 Nov 2012 16:47:23 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm10249084eep.15.2012.11.22.16.47.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 16:47:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 01:47:14 +0100
Message-Id: <cover.1353631583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 0/4] Fixes for xserver and omap* drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 01:01:30 -0000

The following changes since commit 4bbe7a5067452b43bf3258b17e2a653a2273b476:

  Revert "kern-tools: report missing config fragments by name" (2012-11-22 08:58:56 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/xorg
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/xorg

Martin Jansa (4):
  xf86-video-omap: add xf86driproto dependency, drop --enable-neon and
    improve DESCRIPTION
  xserver-xorg: disable dri2 too when building without glx
    PACKAGECONFIG
  xf86-video-omapfb: revive driver which actually works and is tested
    on real devices
  xf86-video-omap: drop RPROVIDES/RREPLACES/RCONFLICTS

 .../xorg-driver/xf86-video-omap_git.bb             |  28 +-
 ...a-large-CRTC-upper-limit-to-not-prune-lar.patch |  41 +++
 ...virtual-size-when-configuring-framebuffer.patch |  32 ++
 .../xf86-video-omapfb/0003-force-plain-mode.patch  |  31 ++
 .../xf86-video-omapfb/0004-blacklist-tv-out.patch  |  33 +++
 .../0005-Attempt-to-fix-VRFB.patch                 | 325 +++++++++++++++++++++
 ...0006-omapfb-port-to-new-xserver-video-API.patch | 272 +++++++++++++++++
 .../xorg-driver/xf86-video-omapfb_git.bb           |  33 +++
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   4 +-
 9 files changed, 788 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb

-- 
1.8.0



