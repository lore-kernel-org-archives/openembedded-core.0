Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE4E73DA7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 20:08:00 +0000 (UTC)
Received: by wgck11 with SMTP id k11so205610286wgc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jul 2015 13:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Z+ddTTGt5aACLA3Viv65fxF8DV7yglfToWTzKQQPeOw=;
	b=MSov7GPvLpZvVg/UOe18K/mRD+V7cIqa1AK2MMyVzFuCksXVj0jlJO89BQUN51SOgF
	3zNWDLOPwQFqkxsHSWbTIaNc4iuQqSfoC0GfZGn56kfxG1/MWiD+gE1MVLtGSlp4uEcB
	vuwP1yphrJnoTQLxLD+V+7xumSRQn/z/vPQY8joSBSsTXV6cCVaTS5M1stIbOTa3f3pT
	aAfYuv3nYdJzTFWRagfVIP8oqXT/+YdZncACaxSGG52mJNCuzvdW+uMNc6Enge87A6Gr
	vZ4jsgz3EUMz19axiim9Q7YDELMft/CjrnWHbaCPDG+a21BMRgUjdahlbKxJIELTINvo
	P6ow==
X-Gm-Message-State: ALoCoQkurNFRC0qanUsWREdmP9ckhavzfYLkSMDnXADL1nnVSx6LwwGMbo/LXKu+X4vYsuVrhTHk
X-Received: by 10.194.112.3 with SMTP id im3mr23383975wjb.54.1436386080867;
	Wed, 08 Jul 2015 13:08:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id k16sm5119870wjr.7.2015.07.08.13.07.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jul 2015 13:07:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jul 2015 21:02:31 +0100
Message-Id: <1436385751-17757-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] gnome-icon-theme: inherit allarch
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
X-List-Received-Date: Wed, 08 Jul 2015 20:08:04 -0000

The intltool 0.51 doesn't do compile tests in the autoconf macros, so this
recipe can be allarch again.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
index fde2bc0..988ba21 100644
--- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
@@ -10,7 +10,7 @@ PR = "r5"
 
 DEPENDS = "icon-naming-utils-native glib-2.0 intltool-native libxml-simple-perl-native"
 
-inherit autotools perlnative gtk-icon-cache pkgconfig gettext
+inherit allarch autotools perlnative gtk-icon-cache pkgconfig gettext
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/2.31/${BPN}-${PV}.tar.bz2 \
            file://iconpath-option.patch"
-- 
2.1.4


