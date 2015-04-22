Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id AD06873D90
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 07:50:08 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so35666093igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=qKR2T9EeaInl8vGztH8DoPJnJfCaPyIUg+q7A3cyauI=;
	b=XundxOzR6nB0APM5lCVrgQRsKFnIx1KnyRl1HnPYWN2xDxHBK2z3e7l0fGYD4nRdJb
	BHDC8Pk02mvCInGaeuskclOHqrr56YQdOA1nMyKY2g+4z+vfFl6ENEv0MXfQs7kv+4RO
	9aB2EgbAUE1pyAvCxUqZDbR+sOdUKlBg6sEfPztnqAIQxhGVlusAHz6PLkpw/VDSmUQP
	MA2Zbl6dB01K3rK9kGTWBnyOwhUoRg1Dm8SwNlRX47LIsRitAeg3OIbcqhJFp9to4bCc
	oZj2ACdjlOez3K2NIJK2fb2cQrrWmclqy4el3dBOeMomaQaoDAaD7HIYPPEkY5YSwN5W
	lg2w==
X-Received: by 10.107.16.140 with SMTP id 12mr33334854ioq.35.1429689009584;
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id l1sm2686434ioe.32.2015.04.22.00.50.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Apr 2015 00:50:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Apr 2015 07:49:58 +0000
Message-Id: <d92f59b16667f31d6ee2793d52b75dc0c002606f.1429688786.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
References: <42999018b09a752082a381b1c595f0bd7411e305.1429688786.git.raj.khem@gmail.com>
In-Reply-To: <cover.1429688786.git.raj.khem@gmail.com>
References: <cover.1429688786.git.raj.khem@gmail.com>
Subject: [PATCH 09/10] gnome-icon-theme: Needs nls.m4
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
X-List-Received-Date: Wed, 22 Apr 2015 07:50:09 -0000

it really needs nls, so lets add proper dependencies
and options

Change-Id: Ib01f066e9dadf2784686cbe28578d2784dfcba88
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index ee018bd..fde2bc0 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -10,7 +10,7 @@ PR = "r5"
 
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 
-inherit autotools perlnative gtk-icon-cache pkgconfig
+inherit autotools perlnative gtk-icon-cache pkgconfig gettext
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
            file://iconpath-option.patch"
-- 
2.1.4


