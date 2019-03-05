Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C4A07C707
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Mar 2019 16:30:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id d17so10167457wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2019 08:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QI01iJM05/Pn/RM2EjuNK+THl/mdDGYwnktYcGNUeQ4=;
	b=PUbQHfF5phrymyelB+uSscrKk9Qs5v4Vw8Td9ur01w3/NUDniOmcmKsrvbv/NCN/Az
	34aMKEclAR50tL15eROZGt6mWTpNfmyP987ywGqyY09CIX45V3qqtuT3o322Px0Ayb6n
	sGFybyqJ3MonmQgWJHDUm1zVwrFOwfTENKaLBPAB9GisxBoZFzOU3UxsEodlqes7g0nP
	uBqPcSTWT8OaP/pYWTME7S/pX9dVRJtRoSEojCCNnVcg58nqm9II2S/UVyNeB21xJ5w1
	7dF5/lfI0/7sM9ZwOsJE8A2ErbmqwDy3l10BtQld1TBjWemUTRLXvO3hxHw/ijvZ4x2P
	VYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QI01iJM05/Pn/RM2EjuNK+THl/mdDGYwnktYcGNUeQ4=;
	b=RnhF9uHlYJR+2aBdzSBFiJX8N6C2g2d4Lx2ni45cXh16f21EkaDPR91WolCcvIu0H0
	xhwXuEJWLlHkhYwnNxv8mhp7lBbWaQiRcBY2RHJKOsZMzwtmvR5VHCaFKB7KTiXJ4Ze1
	WbLtxIKb9Y3XOKNBfVc0brmuRRgik7XCwUp46OA7QdicZH5FzH+wkLtHMEOYWzeJt53Z
	BNerU5Te+CmvGfKWdKNVpdA2ra3mR6ejS7cpAhL5CwvY6k4Udv2C7XsqUV5Y0HTwBQbF
	4eQn3vWFNBDAts4Yn9Hkb6coj8BCDe+IZch10S3XLoHU67WcGKmBfTXzHu97nkU0upqf
	O8Kg==
X-Gm-Message-State: APjAAAWuPZs4LjX/yhvmwhHx41vhhy6se1dg6P2iUAanpKtUV9tKKUV+
	dSmVoYIpo6KZg/0hwxyR3mytz7ym7/c=
X-Google-Smtp-Source: APXvYqzJUDj66aBab62OU0CFQdqVfaZrIXNV+u9mZfRm23f3yoxJS3Mfq5rv7xgIRn3CNR6fh+7qXw==
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr18457861wrp.6.1551803413035;
	Tue, 05 Mar 2019 08:30:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e6sm10511265wrt.14.2019.03.05.08.30.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Mar 2019 08:30:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Mar 2019 16:30:03 +0000
Message-Id: <20190305163003.16745-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190305163003.16745-1-ross.burton@intel.com>
References: <20190305163003.16745-1-ross.burton@intel.com>
Subject: [PATCH 5/5] libpng: fix CVE-2019-7317
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
X-List-Received-Date: Tue, 05 Mar 2019 16:30:12 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpng/libpng/CVE-2019-7317.patch                | 20 ++++++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.6.36.bb      |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch

diff --git a/meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch b/meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
new file mode 100644
index 00000000000..6ee1f8da303
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng/CVE-2019-7317.patch
@@ -0,0 +1,20 @@
+Use-after-free detected with static analysis.
+
+CVE: CVE-2019-7317
+Upstream-Status: Submitted [https://github.com/glennrp/libpng/issues/275]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/png.c b/png.c
+index 9d9926f638..efd1aecfbd 100644
+--- a/png.c
++++ b/png.c
+@@ -4588,8 +4588,7 @@ png_image_free(png_imagep image)
+    if (image != NULL && image->opaque != NULL &&
+       image->opaque->error_buf == NULL)
+    {
+-      /* Ignore errors here: */
+-      (void)png_safe_execute(image, png_image_free_function, image);
++      png_image_free_function(image);
+       image->opaque = NULL;
+    }
+ }
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.36.bb b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
index 3cf4f7249cb..a5862378884 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.36.bb
@@ -9,7 +9,8 @@ DEPENDS = "zlib"
 
 LIBV = "16"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/${BP}.tar.xz \
+           file://CVE-2019-7317.patch"
 SRC_URI[md5sum] = "df2be2d29c40937fe1f5349b16bc2826"
 SRC_URI[sha256sum] = "eceb924c1fa6b79172fdfd008d335f0e59172a86a66481e09d4089df872aa319"
 
-- 
2.11.0


