Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF207757EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 08:38:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t538cKpR007200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jun 2015 01:38:20 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 3 Jun 2015 01:38:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jun 2015 01:38:17 -0700
Message-ID: <cover.1433320510.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] gtk+/cairo/libsdl: build without x11 in DISTRO_FEATURE
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
X-List-Received-Date: Wed, 03 Jun 2015 08:38:20 -0000
Content-Type: text/plain

Hello,

After the two patches, yocto's world build would be OK without x11 in
DISTRO_FEATURE.

// Robert

The following changes since commit 968973d55d4b33e1a929ed4cdf9387fcaba2d93f:

  qt4: unconditionally disable gstreamer 0.10 support in qt webkit (2015-05-30 22:25:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/nox11
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/nox11

Robert Yang (2):
  gtk+/cairo: enable x11 or directfb
  libsdl: depends on libglu when both x11 and opengl

 meta/recipes-gnome/gtk+/gtk+.inc              |    5 ++---
 meta/recipes-graphics/cairo/cairo.inc         |    8 ++++++--
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb |    3 ++-
 3 files changed, 10 insertions(+), 6 deletions(-)

-- 
1.7.9.5


