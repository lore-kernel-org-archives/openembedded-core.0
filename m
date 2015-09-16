Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1694C76E04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 02:28:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G2Smuj007219
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 19:28:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 19:28:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Sep 2015 19:28:44 -0700
Message-ID: <cover.1442370259.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] meta: resend patches
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
X-List-Received-Date: Wed, 16 Sep 2015 02:28:51 -0000
Content-Type: text/plain

Hi RP and Ross,

I had sent these patches before, but didn't get any feedback, now send
again, would you please take a look at them ?

The following two patches would make oe-core can do world build well
without x11 in DISTRO_FEATURES:
gtk+/cairo: enable x11 or directfb
libsdl: depends on libglu when both x11 and opengl

And the patches for insane.bbclass will make package_qa_check_buildpaths
actually useful.

// Robert

The following changes since commit f0189829498e30231d826c9f55aad73e622d076e:

  qemu: Update to upstream patches (2015-09-14 11:22:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/resend
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/resend

Robert Yang (4):
  gtk+/cairo: enable x11 or directfb
  libsdl: depends on libglu when both x11 and opengl
  insane.bbclass: fix package_qa_check_buildpaths
  insane.bbclass: make package_qa_clean_path return a relative path

 meta/classes/insane.bbclass                   |   14 ++++++++++----
 meta/recipes-gnome/gtk+/gtk+.inc              |    5 ++---
 meta/recipes-graphics/cairo/cairo.inc         |    8 ++++++--
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb |    3 ++-
 4 files changed, 20 insertions(+), 10 deletions(-)

-- 
1.7.9.5


