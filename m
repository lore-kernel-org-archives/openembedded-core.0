Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 879247391A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:31 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id oj9so2022886obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s20VMv1xijifNTNDApViAw2o2VtwBGbORoQ04iyV1LU=;
	b=CczhhUmMtnrzpcu1A4l4IVKqe++lqDoWEf9vbkrDFR11h8/0U9R/02plBycMqX2DK3
	N2yWRJUjS1ldnvNUDaNCqNIvM3aVars1W3Ih7hJXsws1J/TOAQxUY8cwZoEiBmq6MBdN
	vflBWrLIrIgB0uoH22j0MzBfQRdJQHt9aXlbiXRYffEeCySaLeWJ2lF4n8KZi/2T2lO2
	RxKydrAfJGxXZQhjyNWMcURtZuUKUK0Ytr8khGSFdzVak1D/MSt7bRWQwle0UTXQIgBq
	G3zx1H4/SHiM9dYDjBgNMrJ3MMyZ9cJNTHyz7L6Q/fdwz1tvNM+067VIz7QgFPmh0gLg
	+tzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s20VMv1xijifNTNDApViAw2o2VtwBGbORoQ04iyV1LU=;
	b=I8MIHO/F52p/EqmofN2d0DHhwEc/E1FutuQCvm+bS5VDcMsN0Xuhj5Gr/aF3KZR8bY
	NQnSw+lpLlNTBhlwFsz27zOpsLNoukGsDoDvOZGjxu+L/V3W14UF1+28mJRHmV1Orhdz
	JxeC8GO+N05Frm/vS/jkhXcKX5G1aEscya/zwNh3yvFrJDehcb7YVyrXM2mAcgC8cTUL
	B2OXgZ/w1oVvkYJJOvd+dcK8Lq90CJu5BjbLPjZhZkSB546N9keQ6gOfJDuy3H2L6OvB
	+d5YOUp13tQeMRL2vwXO3/MLgvkVgL4FrJ4waQim6CEFM6pJMkcWWVYhcMEvMtayKKhD
	DeUw==
X-Gm-Message-State: ALoCoQkmn3zzRvKKLLR9hC/NdySMYGjONABgpTLgY9vc2OW5WBF0vJm6zwlgCbsurATYTJUAUHYtEIJq27ebmRvolkyspU0MwQ==
X-Received: by 10.60.246.43 with SMTP id xt11mr30483427oec.48.1453354652252;
	Wed, 20 Jan 2016 21:37:32 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:31 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:32 -0800
Message-Id: <1453354610-19218-15-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 14/32] gstreamer1.0-plugins.inc: convert GSTREAMER_1_0_DEBUG to a PACKAGECONFIG
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:31 -0000

gstreamer1.0.inc has been updated to contol debug via a PACKAGECONFIG
option, so apply the same change to gstreamer1.0-plugins.inc as well.
Control valgrind support via a PACKAGECONFIG option too.

  http://git.openembedded.org/openembedded-core/commit/?id=81636555fa7f18407efc172c0d5b9f466b2d4014

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index d8532ac..a552653 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -7,18 +7,21 @@ DEPENDS = "gstreamer1.0 glib-2.0-native"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-GSTREAMER_1_0_DEBUG ?= "--disable-debug"
-EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_1_0_DEBUG} --disable-examples "
-
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 LIBV = "1.0"
 require gst-plugins-package.inc
 
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc orc-native"
+PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 
 export ORCC = "${STAGING_DIR_NATIVE}${bindir}/orcc"
 
+EXTRA_OECONF = " \
+    --disable-examples \
+"
+
 PACKAGES_DYNAMIC = "^${PN}-.*"
 
 # apply gstreamer hack after Makefile.in.in in source is replaced by our version from
-- 
1.9.1


