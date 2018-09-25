Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id CC74179368
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 13:43:59 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m16so6951013wrx.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=z6cdj3Cl5aZG1SICXpLgK4pWSgvfrLADceILLXszT/M=;
	b=w7uNQ6fw7DQ2smR9Y/No7bMAEjhuVzu0vbQEvESWcKnQcosFNyrKV6w5hEq33sZBIA
	dVElm2GXmIoqwdOwuQIHRop+F8pI6bYDFL3BPK1VpV+PgLUl6LIN7NHb/oTTfFp2zMJH
	q9GlIeZZlymTihAOfwt/NGpEkpvNAouGJtIFp1tqpNQYxlQG5VEh2EaaGQia+Yt130gk
	y3EtjSF2VJ8ei/JLOlmODs4kJPlZmRG4U5KMiHyg5ciJJ1Jtubzh+q7zMEd91bDcymOj
	ftayUF9Wa+G8+2AqhVaRIHu4kC7nKZWhQXH28OcKd99qadCttPPN4Z6q5LrjN5crB18l
	pLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=z6cdj3Cl5aZG1SICXpLgK4pWSgvfrLADceILLXszT/M=;
	b=dQ+DHzP5TDPn1meMpozJcYUFu8vO7hXaJhSw5ljZIzkLekCc6hnRZ+BC6ykO5NOyqv
	J2E7WK3vR/tTFF9W+AV4J2oF3Kd5PTqcz4yFvKNdhOMzPY+y9hK8GgYa0C11/vsKqefd
	/xVY20Y+So6nWl7vF620JPPhYpIrbpQ1sNakKxInOUbE4AI9rSkg4fJl94yiBIihiRms
	GrDybbWkKvbbBi658zfSTHzXXjwqP+Jgdox7K7Uhwvb8aQ66Ue3AwRSTOm5CnXHpToZo
	JA4Skjof9dTj5rHCCfNvpG5IMslhm498V3GHtONIkiwusYp0kLxdbAbl6B8W0Ov32HhN
	cO9Q==
X-Gm-Message-State: ABuFfohDT82H/VIdH1n5w3eX4UAW2yScHSLIcuYFtwQgDSnMeb8QFQfl
	N6+RQgKEpeJ6UGVe6s6PRyRF9sMyfBo=
X-Google-Smtp-Source: ACcGV63o0tylYnQPW5mBvoRopWm2xYMhOxbaT/ci6a1WKEeiwUPAIgGBm53QUODid/5b9yQLgFbGTg==
X-Received: by 2002:adf:93a5:: with SMTP id
	34-v6mr1084310wrp.244.1537883040158; 
	Tue, 25 Sep 2018 06:44:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b21-v6sm1852340wmj.28.2018.09.25.06.43.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Sep 2018 06:43:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 14:43:48 +0100
Message-Id: <20180925134348.5562-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180925134348.5562-1-ross.burton@intel.com>
References: <20180925134348.5562-1-ross.burton@intel.com>
Subject: [PATCH 6/6] meson: make native-specific patches native-specific
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
X-List-Received-Date: Tue, 25 Sep 2018 13:44:00 -0000

These two patches are only relevant for builds inside OpenEmbedded, so make them
native-specific.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/meson/meson.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 205d2a4abd7..b7fb3e698a1 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -9,14 +9,16 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch \
            file://0001-Linker-rules-move-cross_args-in-front-of-output_args.patch \
            file://0003-native_bindir.patch \
-           file://0002-Make-CPU-family-warnings-fatal.patch \
-           file://0001-Support-building-allarch-recipes-again.patch \
            file://gi-flags.patch \
            file://gtkdoc-flags.patch \
            "
 SRC_URI[sha256sum] = "92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb"
 SRC_URI[md5sum] = "31bda3519d8c0eb3438267268a78085e"
 
+SRC_URI_append_class-native = "file://0002-Make-CPU-family-warnings-fatal.patch \
+                               file://0001-Support-building-allarch-recipes-again.patch \
+                               "
+
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 
 inherit setuptools3
-- 
2.11.0


