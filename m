Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 676D06F509
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 03:29:55 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y13so4095595pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 20:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gUZ98g30eFZR1ut3V1655GMEq35ld/bWvnN1H5xpsrQ=;
	b=k7GQ1/DaWWoeVtI9zUcT8VAO+5Lc3eHPnWSIWztLTKF900Tlufe5abI6/Oe7b/Q7TM
	mJcCj6XSA5HIPJFwVas5WLhksW1acFlzPPpXgS8Vx9gPbz+33ftLTqBwdTHVvrt7a1yF
	0yQhExqHL++kKnVpS4c4RsxM7vyn7zGG3qbFmliAswov1sUAjzem+b2Nl+Vc0YaAwwiV
	r4RNo/eFSPOGavc+QaVFf4HXzGAardVc8jJ4p/YZd6mB4xI9O7asOtrIiVFfsRXNeE96
	dWyxwKYDkgpa9qZ0RiVfq8p05OE5c1wF7tvO/PXbyw+xuVTFJbcg8mq4EaDb6OhOnIFL
	/KlA==
X-Received: by 10.66.132.70 with SMTP id os6mr45457314pab.110.1401766196858;
	Mon, 02 Jun 2014 20:29:56 -0700 (PDT)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150]) by mx.google.com with ESMTPSA id
	py7sm22947478pbb.78.2014.06.02.20.29.55 for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 20:29:56 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:33:12 -0700
Message-Id: <1401766394-8680-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/2] cogl/clutter update to 1.18
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
X-List-Received-Date: Tue, 03 Jun 2014 03:29:58 -0000

From: Tim Orling <TicoTimo@gmail.com>

The following changes since commit 6433f5d68eba1ce7306fbfb19265ea6786715d7c:

  diffstat: patches have now been submitted upstream

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/cogl-clutter-1.18
  http://git.openembedded.org/openembedded-core-contrib/log/?h=timo/cogl-clutter-1.18

Tim Orling (2):
  cogl: update to 1.18.0
  clutter: update to 1.18.2

 .../clutter/clutter-1.0/install-examples.patch     | 14 ++-------
 .../recipes-graphics/clutter/clutter-1.0_1.16.2.bb |  8 ------
 .../recipes-graphics/clutter/clutter-1.0_1.18.2.bb |  8 ++++++
 meta/recipes-graphics/cogl/cogl-1.0.inc            |  2 +-
 .../kms-include-stddef.h-before-drm.h.patch        | 33 ----------------------
 meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb      |  8 ------
 meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb      |  6 ++++
 7 files changed, 17 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.16.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-1.0_1.18.2.bb
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/kms-include-stddef.h-before-drm.h.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.16.2.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.18.0.bb

-- 
1.8.3.2


