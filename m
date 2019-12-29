Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 19E787F884
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:34 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id b137so16998556pga.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0Y5vhabqW7djdwHdjCEPXH1majAzei6DlaJNMt3R/PY=;
	b=cph9TJvHKq4J6Wz3DBBxU4KLbK0CWP+aYapHvr8+z6m9zkJV4BfmBauODKmyFD62Xc
	CfNNXJxjhsSlV5jKgopXW30GZy9DsCpGfKLhH86R0HcWmyRyvl8VDHPty0YYgquC5Y+X
	TpC9HoApHLp8x0h4s7OBHtn2unONNfbXguzZ9C6D9RpBKLxV8QO2It3zUnIafv5ov++Q
	DAArMzuKgGjCiyTCDbEzZqmTEdnlP0Nyz1sMG8hRxZv98TvB8zMpAqsD3BFGsaEk/5Ok
	EN/3HS51WFariA2xGaLpHcQG1cnOs9IUEDpWw06B1b8iuxtNonCyvBvE5u1oyQLs0zqK
	6o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0Y5vhabqW7djdwHdjCEPXH1majAzei6DlaJNMt3R/PY=;
	b=twjsMsSy5UvdbC0bwP9023SM4pOG3U0KL8hbE0gubxDsj++Ti4hQn+s/gC7ugc0wA6
	HiVJU8NYuqpMN1tcWSNDbFGee0XJZj8Lws/5d/7OZEsiz4u/C2T3UGMbnJLnnjG97rZb
	1BnzcXELyE+DcXNGfVavKG7SQLDZu/nw6TnzTkaWVvMY65QSSqlwGm9ZgvlthpI1AAO4
	rVifUYG4wStoQp89CYbOdZljFREeZwDOvLseg3EA12e5BXA+KbxlxNldzDLyH4RKFK9z
	sWXzLWB1PQAvGfJdQ4w7ek2VgSPSbTFIJRHGgfxGzMV6X37gGLs4UERO4Pswb9vtIaYb
	tJdg==
X-Gm-Message-State: APjAAAXJiGAa0r3IgpQVQr3H6CvAh6ZSGrJeY0awhlSXPr0Nk1KpIxvI
	HaDmEFTDFzoKCEioKaLvHG72fmM9wgE=
X-Google-Smtp-Source: APXvYqw+rI6tWKbGY2v7xwZOogrs/gn+DWlcJiAwTK1G9DUVLyT/kdAqQI73drb0KgEFlV8bYfx9qw==
X-Received: by 2002:a63:1807:: with SMTP id y7mr64170064pgl.94.1577645075693; 
	Sun, 29 Dec 2019 10:44:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:44:04 -0800
Message-Id: <20191229184415.19514-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/19] tune-power9: Add power9 tunings
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:35 -0000
Content-Transfer-Encoding: 8bit

Add Little/big Endian, 32bit/64bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/tune-power9.inc | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-power9.inc

diff --git a/meta/conf/machine/include/tune-power9.inc b/meta/conf/machine/include/tune-power9.inc
new file mode 100644
index 0000000000..81d6e8e9bf
--- /dev/null
+++ b/meta/conf/machine/include/tune-power9.inc
@@ -0,0 +1,35 @@
+DEFAULTTUNE ?= "ppc64p9le"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[power9] = "Enable IBM Power9 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'power9', ' -mcpu=power9', '', d)}"
+
+AVAILTUNES += "ppcp9 ppc64p9 ppcp9le ppc64p9le"
+
+TUNE_FEATURES_tune-ppcp9 = "m32 fpu-hard power9 altivec bigendian"
+BASE_LIB_tune-ppcp9 = "lib"
+TUNE_PKGARCH_tune-ppcp9 = "ppcp9"
+PACKAGE_EXTRA_ARCHS_tune-ppcp9 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp9"
+
+TUNE_FEATURES_tune-ppc64p9 = "m64 fpu-hard power9 altivec bigendian"
+BASE_LIB_tune-ppc64p9 = "lib64"
+TUNE_PKGARCH_tune-ppc64p9 = "ppc64p9"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p9 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p9"
+
+TUNE_FEATURES_tune-ppcp9le = "m32 fpu-hard power9 altivec"
+BASE_LIB_tune-ppcp9le = "lib"
+TUNE_PKGARCH_tune-ppcp9le = "ppcp9le"
+PACKAGE_EXTRA_ARCHS_tune-ppcp9le = "${PACKAGE_EXTRA_ARCHS_tune-powerpcle} ppcp9le"
+
+TUNE_FEATURES_tune-ppc64p9le = "m64 fpu-hard power9 altivec"
+BASE_LIB_tune-ppc64p9le = "lib64"
+TUNE_PKGARCH_tune-ppc64p9le = "ppc64p9le"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p9le = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64le} ppc64p9le"
+
+# glibc configure options to get power9 specific library
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'power9', '--with-cpu=power9', '', d)}"
+
+# QEMU usermode fails with invalid instruction error
+MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "${@bb.utils.contains('TUNE_FEATURES', 'power9', ' qemu-usermode', '', d)}"
-- 
2.24.1


