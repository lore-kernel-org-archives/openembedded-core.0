Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UdOUM-0008JF-96
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 19:30:50 +0200
Received: by mail-ee0-f41.google.com with SMTP id d4so2779150eek.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=kvHXcs3EndV467INjLbLC8KY5zp6a290alfYa4WM8Kw=;
	b=YRV+yaV5Sp7gRzKJQJhyi3cZrvLFRya5ho1ZAHdgmn1zmTWnoNThA4jz0fQlo6CRZo
	i/AwVLhQk/cpP3COXmJ2rdFCD/rgJtzs/aPj7/IQY7rAFNyjIK/xEuP2cBV2j5Tmi7ol
	EcBUBb0ERyQHBZ+rIEtkqxnKf3C5IgNx5UnUd3cARYdPuMNgIQ2sJD8KPdG9oxlfJ4Xb
	xZLab0D5WJiDrlxkFNNJf3aU8nh6ZiJyfOesss4cjJSRxW/DMdz+194GM1io35zATYrC
	wAVtek25of0rBeb5k4u5uPeqr3RcNdbQiRZnokvTMGet1+nUAiC2UBUfP6hiNU/GiHPL
	dTUw==
X-Received: by 10.14.3.4 with SMTP id 4mr72430416eeg.8.1368810746609;
	Fri, 17 May 2013 10:12:26 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D55.dip0.t-ipconnect.de.
	[91.10.61.85]) by mx.google.com with ESMTPSA id
	bj12sm20069257eeb.8.2013.05.17.10.12.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 17 May 2013 10:12:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 19:12:12 +0200
Message-Id: <1368810732-29468-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368810732-29468-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368810732-29468-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] glib-networking: update to 2.36.2
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
X-List-Received-Date: Fri, 17 May 2013 17:30:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...working_2.36.0.bb => glib-networking_2.36.2.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.36.0.bb => glib-networking_2.36.2.bb} (85%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.36.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
similarity index 85%
rename from meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
index 2cc69ef..863a4eb 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.36.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.36.2.bb
@@ -10,8 +10,8 @@ DEPENDS = "glib-2.0 gnutls intltool-native"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.36/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "062dafdb939510e7b38eea3d3b367be0"
-SRC_URI[sha256sum] = "190d66fbaeb023ba4f43c315f23c5372c43be6cbe857596e00990211514650d9"
+SRC_URI[md5sum] = "fb9121742ed36d1723f296eea19dbb3c"
+SRC_URI[sha256sum] = "2108d55b0af3eea56ce256830bcaf1519d6337e0054ef2eff80f2c0ef0eb23f9"
 
 EXTRA_OECONF = "--without-ca-certificates --without-gnome-proxy --without-libproxy"
 
-- 
1.7.4.4



