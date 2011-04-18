Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBjQ0-0003uB-0m
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 10:02:48 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3288161fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 01:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=+9C5dq3x8Uv0cMcpfqBy2mxCpjTvGQdVAAHpdHiEok4=;
	b=Qe2C8GZuzlspjBWEoeWEYlxlAQU+mGdnwAyps0j20yxCw4Nzh72Zff0od9JdD1s8Lu
	xMGzpyel32TVoGaxAafR9N9XmRQROl7RGN+zavs7cCPE6l39HBzbT97XxIdvHJ3Tyqz4
	3K4Rz2fFww3scJXUL04jCUbnKH2JPJWlh04EQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ZaX++oasaExmCDPqkSkuhyCWfNgpGvrFtS6impxIafODt6+W6xVZcXa8wi+TDHMOE7
	KliOQiA4LGh0BevGz3Oni96BV5oWdyHoJA9HVEKi+foOW5jtxIlOrKG/pUTjYsXnLLAT
	hqiUaEVlSTGrtr6GQ7fencr8l7holAzqI4DGU=
Received: by 10.223.102.71 with SMTP id f7mr321258fao.9.1303113629957;
	Mon, 18 Apr 2011 01:00:29 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 23sm160608fay.28.2011.04.18.01.00.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 01:00:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Apr 2011 10:00:23 +0200
Message-Id: <722785c0fb32db53c7499ed71fd2784accf996c4.1303113405.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303113405.git.Martin.Jansa@gmail.com>
References: <cover.1303113405.git.Martin.Jansa@gmail.com>
Subject: [PATCH 2/4] xf86-video-omapfb: add SRCREV to recipe
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
X-List-Received-Date: Mon, 18 Apr 2011 08:02:48 -0000

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
1.7.5.rc1



