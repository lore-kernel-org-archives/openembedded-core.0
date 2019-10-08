Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 67ED77F36C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 11:02:25 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id r19so2671842wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 04:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RDgVSS+5WFSVqPAO6Ey2BsnH+JEjMtQCnhyi10uTytY=;
	b=Zw+styRLJypWm2e6YoQp2ap6wLQ34NMb707VHcpNNwD0MMBahm0IRjz/eeGCt5Fjom
	OHX1nkyQ7M3tT5/izDLlg+GiSvvWPdKRP+acgHjEv2rH9aOgzrkaR6fvsgecByew3hVi
	kSJ9dMzZxV85gcvXU7zU3ye/Ifhdi/sPoEvamLxyy950yhiR6TCGo5sNgi3k8XaqdstD
	obaY12LZT95CQdOrZMvqMu9NrAaJpsHLA1cj9OEMBRcKB/Suc6olF+BZaOUt0/E4CmWl
	ZCtuXT4kaeuFEQy+KA/vMHX1gIs8yfiyQqHfkYYuZn27bqk6Aj+It0EJGSu8eHXjQfEI
	KWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RDgVSS+5WFSVqPAO6Ey2BsnH+JEjMtQCnhyi10uTytY=;
	b=Oa1Y9MB99y9U2oP4T2+VywmpvEEtFmyEFvVvdiSH4A00ONo7/h+BToVvnUC7N1EkQ8
	sGdU22Upm+0K7WBcA3SxHcHKu0B4ESz3DJQRJIUelgHM/MzvRqpQrdF16CWubQ29ugpY
	jS9LrAiqs9QHW3Bsg92msnhRZ6/ICERe7Yj/61OlL+djRNtxBLH1zh6kob9wd0rI7Avj
	aEsp7l9VHxl1U49bq+ODl10r554kT2c+iSG3S9syr2u3xJ+ZZJhOo3dne45wZNBX37VR
	5TNOlNRQlqLH5I+QPaxqTNP6wlimGhmVgCZouEs9jKdQWJadbTL8ep3KnYukblzEkTs8
	0nmg==
X-Gm-Message-State: APjAAAXbSh6AWLeVeyaP+j6eDrl3v6cDitMohFQdjBgKI2BTN52hAEPB
	B3KoH+YqL0BB5ztHCa3TEjcy+k8jnUs=
X-Google-Smtp-Source: APXvYqyM2i/s7mjUGd7O7Nlmxjm3aXiTQB+kgyNvTK3qfy2aEtUYlCXW65agI7uFungyIH7frw5Stg==
X-Received: by 2002:a1c:48c6:: with SMTP id v189mr3245349wma.20.1570532545490; 
	Tue, 08 Oct 2019 04:02:25 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y186sm6096985wmd.26.2019.10.08.04.02.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 04:02:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 12:02:21 +0100
Message-Id: <20191008110221.16349-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] harfbuzz: add PACKAGECONFIGs for all the optional dependencies
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
X-List-Received-Date: Tue, 08 Oct 2019 11:02:25 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../harfbuzz/harfbuzz_2.6.1.bb                | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
index b0f565b9b07..99cd4cd7087 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.1.bb
@@ -7,29 +7,30 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
-DEPENDS = "glib-2.0 cairo fontconfig freetype"
-
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
 SRC_URI[md5sum] = "89b758a2eb14d56a94406cf914b62388"
 SRC_URI[sha256sum] = "c651fb3faaa338aeb280726837c2384064cdc17ef40539228d88a1260960844f"
 
 inherit autotools pkgconfig lib_package gtk-doc
 
-PACKAGECONFIG ??= "icu"
-PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
+PACKAGECONFIG ??= "cairo fontconfig freetype glib icu"
+PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo"
+PACKAGECONFIG[fontconfig] = "--with-fontconfig,--without-fontconfig,fontconfig"
+PACKAGECONFIG[freetype] = "--with-freetype,--without-freetype,freetype"
+PACKAGECONFIG[glib] = "--with-glib,--without-glib,glib-2.0"
 PACKAGECONFIG[graphite] = "--with-graphite2,--without-graphite2,graphite2"
-
-EXTRA_OECONF = " \
-    --with-cairo \
-    --with-fontconfig \
-    --with-freetype \
-    --with-glib \
-"
+PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dev"
 
 LEAD_SONAME = "libharfbuzz.so"
 
+do_install_append() {
+    # If no tools are installed due to PACKAGECONFIG then this directory is
+    #still installed, so remove it to stop packaging wanings.
+    rmdir --ignore-fail-on-non-empty ${D}${bindir}
+}
+
 FILES_${PN}-icu = "${libdir}/libharfbuzz-icu.so.*"
 FILES_${PN}-icu-dev = "${libdir}/libharfbuzz-icu.la \
                        ${libdir}/libharfbuzz-icu.so \
-- 
2.20.1


