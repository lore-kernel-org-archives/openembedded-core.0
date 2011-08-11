Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Qra0j-0005kh-5w
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:29:41 +0200
Received: by gyg4 with SMTP id 4so1518653gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 11:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GygbPWHTh6hEdgpiVUtNxRJpBMy7e353WphrEJkJZpw=;
	b=lFPkbcmyrGm3IB9s7jrfG3xSMFXeVaD9aIrcJhq3DGYA3HVBRRijZrh7ishjesYhpJ
	tuOJADRGLbsR+oNdIFcqr21iKyF5UubBZx6IF7EfXcW0QOSYih3R5Tgh0VLrxcL3UZzM
	YPKMt94lgZr1wIeXBH0ZEIG01KxVB2gTbqwCk=
Received: by 10.150.92.17 with SMTP id p17mr984356ybb.440.1313087107067;
	Thu, 11 Aug 2011 11:25:07 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-173-232.ph.ph.cox.net
	[24.251.173.232])
	by mx.google.com with ESMTPS id f5sm1281063ybd.13.2011.08.11.11.25.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Aug 2011 11:25:06 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 11:23:47 -0700
Message-Id: <cover.1313086806.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/7] Miscellaneous fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 18:29:41 -0000

From: Chris Larson <chris_larson@mentor.com>

A variety of unrelated fixes I've had local for a while.

The following changes since commit a752b23767189f2678367e47ca0b41f49c56a631:

  sstate: Add level 2 debug so its possible to see what sstate is doing (2011-08-11 17:19:51 +0100)

are available in the git repository at:
  github:kergoth/oe-core misc-fixes

go here for github's branch comparison interface:
  https://github.com/kergoth/oe-core/compare/master...misc-fixes

Chris Larson (7):
  busybox: don't strip the main binary
  insane: add linux-gnu to the platform data
  nativesdk: inherit relocatable
  sanity: shift the required utils into a variable
  package: include SECTION in the pkgdata
  package: allow setting a section for locale packages
  cross: also empty PACKAGES_DYNAMIC

 meta/classes/cross.bbclass                  |    2 ++
 meta/classes/insane.bbclass                 |    3 +++
 meta/classes/nativesdk.bbclass              |    2 ++
 meta/classes/package.bbclass                |    6 ++++++
 meta/classes/sanity.bbclass                 |    4 +++-
 meta/recipes-core/busybox/busybox.inc       |    3 ++-
 meta/recipes-core/busybox/busybox_1.18.4.bb |    2 +-
 7 files changed, 19 insertions(+), 3 deletions(-)

-- 
1.7.4.1



