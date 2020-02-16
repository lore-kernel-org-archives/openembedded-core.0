Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id D5AFE60632
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:03 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id k11so16660705wrd.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7iiFkSBbREThyIGIcv9pl4RCyq+h1r3pIIqwQ2fJGn8=;
	b=EEyuNix+WNnb4S20DHnSuDT9gPa5iuwBbvdWw+qj9vKEjb1dyjDOkWv4ia9bBXD2dh
	AeCS9IR0R+o0kw4eSv8fmzWuYJjr32/eJW9yX1FVCGbXMVSIFEz68ukKbWWjxshsIp9l
	dw+NOqeT0awCOFRu1nLNENrU4MavwhwVZQ+ynTreyAao3f9ra3VF9zupM55PYuY3H2wg
	DTIFiTq3j8uePHjUoYpN+GyIc/iOITND6j7yzL9S3W6eCUtjsZgmeBSuvDr/qIFhAMRm
	GHdya7eZKJWkXNUY6ag3x7M2M0giA6tYfycDtO0e+Udc3jX4b4VefvLl1BZcm1Wn9r32
	c7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7iiFkSBbREThyIGIcv9pl4RCyq+h1r3pIIqwQ2fJGn8=;
	b=R66kYAyjWUj1m1Dtt+xeFYQG90SjBnLIJpxuH25ghk9cdspeiTwPhSDKNEre6U6jjG
	KpumV9O4Nr+8kfg9Ndl6EnX+0v3Rc/SNqd5evLASw3jWtO/NoJ12RqXxsGiQfYgOkvAq
	QBxRo/Bx0RoJxFbv1Z+wMRamXv/PN2jHmInTNEIt+Z8YzcXHyhHsENNiDXOjolZag1Ug
	sBVhQm6klvwzwQ/Fxuzhdn6WnwXe5AN8n7FK0MABdn7iYihAJpqU9hQlP/HcH1a7dMg6
	2KgeqBk33AFRuO0K34pJOXirCJjeDxQq0MF2LMXfrU2xRJHZR3ok0nLLb1ydpheRqtGf
	IsJg==
X-Gm-Message-State: APjAAAUp2YlpFCUZxCOV8QiZb+lszMzplmwtmd0p7u/q46ZJmkWbElCH
	7L1GwufqzPa0bxd5pUC1CC0j50ON
X-Google-Smtp-Source: APXvYqypnS92vcP87nHKKoQYo5aT2adJNcuX2MquGaud/6O3NOJcQkHBC/xQQ/GHWKdMn4FETFzysw==
X-Received: by 2002:a05:6000:10c:: with SMTP id
	o12mr16676452wrx.106.1581868263967; 
	Sun, 16 Feb 2020 07:51:03 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:06 +0100
Message-Id: <20200216155015.21738-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] procps: upstream has switched to gitlab
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:04 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-extended/procps/procps_3.3.16.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.16.bb b/meta/recipes-extended/procps/procps_3.3.16.bb
index 60f90976bb..2810ebd285 100644
--- a/meta/recipes-extended/procps/procps_3.3.16.bb
+++ b/meta/recipes-extended/procps/procps_3.3.16.bb
@@ -12,14 +12,19 @@ DEPENDS = "ncurses"
 
 inherit autotools gettext pkgconfig update-alternatives
 
-SRC_URI = "http://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${PV}.tar.xz \
+SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https \
            file://sysctl.conf \
            "
+SRCREV = "59c88e18f29000ceaf7e5f98181b07be443cf12f"
 
-SRC_URI[md5sum] = "e8dc8455e573bdc40b8381d572bbb89b"
-SRC_URI[sha256sum] = "925eacd65dedcf9c98eb94e8978bbfb63f5de37294cc1047d81462ed477a20af"
+S = "${WORKDIR}/git"
 
-S = "${WORKDIR}/procps-ng-${PV}"
+# Upstream has a custom autogen.sh which invokes po/update-potfiles as they
+# don't ship a po/POTFILES.in (which is silly).  Without that file gettext
+# doesn't believe po/ is a gettext directory and won't generate po/Makefile.
+do_configure_prepend() {
+    ( cd ${S} && po/update-potfiles )
+}
 
 EXTRA_OECONF = "--enable-skill --disable-modern-top"
 
-- 
2.25.0


