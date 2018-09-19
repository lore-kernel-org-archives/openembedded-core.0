Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id D9A2974AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 18:55:53 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id f6-v6so3098434plo.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3QumaT3vJl+TFq2x6e9xein3ZzHAIAqbTZWlpOIpmrw=;
	b=N1/WqyfaWqz10feEDIGyNnWM2QU8+I8dDrY5wrCqslUGcpn9sXWucYjxzQ2CwZIG/f
	gDcfESu1jZn8t4vOEWTs7c/hL4MTDRdLieAaIc/I9/eOyK1VIx+krfvkTpM509xlP9/U
	ywt/LEHnQMhQHt6uOBaViEnOl/2oGAFHL85akRjrvtVV8ZPfSfL1JWtMrVyzYJqi43uC
	7jbohLh8gzQK5rY0FyDAB8t61IRiFHePDBUMXESNUfrM96X1q2R/TPXPAaeZafGbFnJi
	RhBoGp9qN6T83oGI+GfNWFF1v3EAAYe7GTPJ51UvN9rN+CZMW9lfl+mzsdQrOpX3Ipc5
	6Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3QumaT3vJl+TFq2x6e9xein3ZzHAIAqbTZWlpOIpmrw=;
	b=T/7YqY3F8Vg2nLZICOJW1TmiVUKIKSOmmepz3SGHvptfOLtC7VpEkcoaqKGlO202QK
	2cMAxX8y6lrdAbb6Yz3npHeTqMONDb64a4jYDuyGXs3fW7XdFrfZT6lZazeUR2kriLlZ
	94TERDGTEzuHlhTxX5GYAuJTjrnTGS0dAls3gP6xS78TAdcnSb8fAN9+MzXLIlzv6LeM
	dlEYfkJKH2NGqK9YdMM3GDNpljBDVw3f2fh3xAJYqc5a96aicvTy/ZjeMW9Y18dDnFuI
	POm6iA9FmLCcclWo0bGP6bUUEsSrm7bIaSqv89z+RAjHnO8EXFnPP5oFgCKfmKsLgFoM
	3X3A==
X-Gm-Message-State: APzg51DFsd9bedoRbG92WjacagsJp6SbO/9YLkGN0/ffflRw/50QzJNf
	GyNtGTOuK1Xh/iOsv/LC3cRFxqL0G7A=
X-Google-Smtp-Source: ANB0VdY8nB3OFGH5DMilvNDok2i14EHxiC4wZWZLh0ecKcopf/Eh5NcBDuncX0W204CAay9wAEifsQ==
X-Received: by 2002:a17:902:b189:: with SMTP id
	s9-v6mr35558446plr.188.1537383354450; 
	Wed, 19 Sep 2018 11:55:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	y3-v6sm35687083pfi.24.2018.09.19.11.55.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 11:55:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 11:55:42 -0700
Message-Id: <20180919185542.2329-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180919185542.2329-1-raj.khem@gmail.com>
References: <20180919185542.2329-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2 2/2] musl: Add aliases for glibc provided libraries
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
X-List-Received-Date: Wed, 19 Sep 2018 18:55:54 -0000
Content-Transfer-Encoding: 8bit

This is a step towards running pebuilt applications for glibc  on musl
There are many realworld applications which are not always built from
source, especially provided by third party

Package the glibc symlinks into new package musl-glibc-compat

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2 - Package new symlinks into separate compat package

 meta/recipes-core/musl/musl_git.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index be31718e3a..efdf620c6c 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -26,6 +26,14 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            bsd-headers \
            libssp-nonshared \
           "
+GLIBC_LDSO ?= "ld.so.1"
+GLIBC_LDSO_arm = "${@ bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ld-linux-armhf.so.3', 'ld-linux.so.3', d)}"
+GLIBC_LDSO_aarch64 = "ld-linux-aarch64.so.1"
+GLIBC_LDSO_x86 = "ld-linux.so.2"
+GLIBC_LDSO_x86_64 = "ld-linux-x86-64.so.2"
+GLIBC_LDSO_x32 = "ld-linux-x32.so.2"
+GLIBC_LDSO_powerpc64 = "ld64.so.1"
+GLIBC_LDSO_mips64 = "ld64.so.1"
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
 
@@ -62,12 +70,26 @@ do_install() {
 	install -d ${D}${bindir}
 	rm -f ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	lnr ${D}${libdir}/libc.so ${D}${base_libdir}/${GLIBC_LDSO}
 	for l in crypt dl m pthread resolv rt util xnet
 	do
 		ln -sf libc.so ${D}${libdir}/lib$l.so
 	done
+	for i in libc.so.6 libcrypt.so.1 libdl.so.2 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
+		ln -sf libc.so ${D}${libdir}/$i
+	done
 }
 
+PACKAGES =+ "${PN}-glibc-compat"
+
+FILES_${PN}-glibc-compat += "\
+                ${libdir}/libc.so.6 ${libdir}/libcrypt.so.1 \
+                ${libdir}/libdl.so.2 ${libdir}/libm.so.6 \
+                ${libdir}/libpthread.so.0 ${libdir}/libresolv.so.2 \
+                ${libdir}/librt.so.1 ${libdir}/libutil.so.1 \
+                ${base_libdir}/${GLIBC_LDSO} \
+                "
+
 RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
-- 
2.19.0


