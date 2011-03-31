Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q5FL9-0001jE-Fg
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 12:42:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id 5so1711285bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 03:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=v5SEe6kLxCeHi2RPwqLCVCSOnmWfGcb4ELVr8zmQ6bo=;
	b=vX43wqhXogaKRyc7Dg4rllcrhJ6uK62Fk5Vmqy7D92RQhgVlfI8RUq4CJsjkRDv1C9
	itqXRjkffSVCpenvWEC4fmXpkw6imOkPnMWAO7NQj/j0paFfhRmeP1WMBBlP7gdVWmMQ
	2JA7p7NuQAcVBsbRBtBy1vuFkOckVvrXqz61A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=blvuoPaYY6f6Gri6nxyW2T1SWdcyQ3mVG5pd64/5ZtAjnNhu7lIUzgUHkrLz0aMAAe
	rhRUamfJ4CwbmfGvGRAkYjBnhwP2G56CtmR9LkHrpBEmpczCnfnp5UL9gBzkRYk9bKRp
	7noGwJ81J7nFEume42QfxNsHgIddLE06xgmos=
Received: by 10.204.16.72 with SMTP id n8mr2182825bka.8.1301568060780;
	Thu, 31 Mar 2011 03:41:00 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id z18sm646564bkf.20.2011.03.31.03.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 03:41:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2011 12:40:58 +0200
Message-Id: <5beeeef8dc370f7238938edb4fcf0b617b856daa.1301567822.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301567822.git.Martin.Jansa@gmail.com>
References: <cover.1301567822.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] xf86-video-omapfb: add SRCREV to recipe
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
X-List-Received-Date: Thu, 31 Mar 2011 10:42:59 -0000

* taken from meta/conf/distro/include/poky-default-revisions.inc for
  those who want xf86-video-omapfb and are not using poky

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xf86-video-omapfb_git.bb           |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 2714786..5281665 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -13,6 +13,7 @@ PE = "1"
 PR = "r1"
 PV = "0.1.1+git${SRCPV}"
 
+SRCREV = "044617665d6737f4909aab96f91b06261dff05d2"
 SRC_URI = "git://git.pingu.fi/xf86-video-omapfb.git;protocol=http \
             file://omap-revert-set-CRTC-limit.patch \
             file://omap-revert-set-virtual-size.patch \
-- 
1.7.4.1



