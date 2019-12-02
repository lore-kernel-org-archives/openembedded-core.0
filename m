Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6607EC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:20 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id p9so251879wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UpFykkhQ4a5K6AhnEan7Gj5csS0ud4P8lVNoaKiBZ/I=;
	b=LunE6m0E16vtxyxm7xHuxfGsdIK+0IT2hCw4HAyi9qHRH6uOr+8Dcn+vj2ELiQpY0F
	L6ujCXZJvQwOeyk1BLQCM8IXZUgvraaCQSxwICEGjWwTAGGWiRpxjkBz6ewu7FxZGJn4
	Thx34+ZK3nF2/biDigW2L0KG+NzAHsStukxAXYD/c1R7+TUjdu6OlP4Y2dgBioW+BUtt
	8n2N3j2gtEXBhwfLdqczTi8P8PxmvxWGsd7fSCzMbBcWGPFTbyb+0zVupYqw+QZU39EZ
	PG3z7r6CNmbjrp548ww5lait6LlHt3YNTfv4W1bPXL4k1m+JAw+x4UJzWoxLPynXdfM+
	SSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UpFykkhQ4a5K6AhnEan7Gj5csS0ud4P8lVNoaKiBZ/I=;
	b=sc2JWoqpg471OxBZXlV0h28559rKOLsPogvbzwyGxVo/XSj7+YqbI/Mncn8I6yJ/3d
	QwEXHJ3dhRid/bwBn+5cj2sxqepAMVFujJW98XxuzAVvz71sDVa4nm6vmxKt3ndAJbpP
	h8qa09RjhCAQKc74yLsaVQr1enNKRkc9koJ2JgGkQz72eZKLdNjqlpadAkqzp2K98Nyc
	sLSE23s0H5QmUFsMHCiTReEjOWu3Oxl7sVsclo0zJRKINWLbZlq7Vnf1HNhpD6Gc4zor
	1PZdzWjtu7dlony9PNY96kw4goXDQKwMgMiupLb2ennd9+HCeUP11x1wrNMm1xvIAysI
	vB5Q==
X-Gm-Message-State: APjAAAWo+uvyp7q+ZcJKQ+kz7C0ohhl+MLU34VkohvPxfB0T1JTaddGZ
	ZEYIHgcn5n/fDtNyOTX3XbmB+iu6
X-Google-Smtp-Source: APXvYqxvy4eubm3pKpjFehH3RkVHXLN4sE2Tc5mibEzRcuCWE1N/IjDJrgwB3wa7NFAPU2q8MQXMgA==
X-Received: by 2002:a05:600c:54c:: with SMTP id
	k12mr29761662wmc.124.1575309321004; 
	Mon, 02 Dec 2019 09:55:21 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:58 +0100
Message-Id: <20191202175459.112655-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 17/18] gstreamer1.0-python: switch to meson
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:20 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gstreamer/gstreamer1.0-python_1.16.1.bb                 | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index c722f028b3c..b770ec060e1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -18,11 +18,9 @@ S = "${WORKDIR}/${PNREAL}-${PV}"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
-
-EXTRA_OECONF += "--with-libpython-dir=${libdir}"
+inherit meson pkgconfig distutils3-base upstream-version-is-even gobject-introspection features_check
 
 do_install_append() {
 
-- 
2.17.1


