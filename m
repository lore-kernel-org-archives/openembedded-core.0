Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA0C678DD1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:37 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id l9-v6so1433680pff.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jIiW/NeOAQfu8cmYPkktTghVOEd6Fn90L5F/tITadj8=;
	b=FrqbdGbeEBLrIB7njWqS1IUIxdhe/tunvbENjUpK740ffXcxsg49c4E4x1pvGwL3RK
	oIj+o21zWxEYSj3FqR3Qrd0bhH3Xp0ObIlUpBQV75ZFXaw7gmF3zkk9c3XsB6OWttUBO
	j5e6u2cVcpcvZiCFI8UwAH6do4LBNbJIzVEHuTmLWj/GfA5X09FmSVshkE6pEE4hCXPF
	wysmrkOzdilLLynHh4Tz+K/Sezw51+D0TczitLo4SWDZPgRd6Ygg4XYEBtgXiEKzkIOw
	ShYduaAPmmsdm10nNFsw5P9Cws0tyuV8O38xMRNMApUwgSaLivzgrTv1pEBJjgkkcxmI
	RIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jIiW/NeOAQfu8cmYPkktTghVOEd6Fn90L5F/tITadj8=;
	b=d6+Yj8wyXTY0LKf/2gRrFIcZS6D2jq1EpKE195140wRk1c2VJw8bD7fmi/ag+GB65N
	IQlt1uH6Dmkgn4NV8E9JYVy+t05Msv2TME64uDmNAeMEyKjxGJ7Eem5ZOaoJSfbjSAQG
	e8GsnEaMH05adKEm6NWNkja0ErqN2ZUincgucmI5+3HkFBpMD7kEXR2IECDOPeBVoB4y
	earExzCi8pP9tgY+ckXJjgEY0/LJp/FMoXEoNDf0IvtX/DVIg1DAmA7lJOTafcDZKzkz
	TfuUEfvJh1aapClo6du2FbXSyTVDqKb7DYmnHPdiGqIwrnFa0p1FiHLmxZCpgZ0Baohx
	XoyQ==
X-Gm-Message-State: AOUpUlGzmJU2BZ+gNEohvDx+vP2Mm+HSlX7DrGS3ZepHVTiyYSeRscbu
	AhHH4LavTB1vPSCDZUXNELh534Re
X-Google-Smtp-Source: AA+uWPzeW/cq+MOW9pDlFt4+zKhDbz06k0TdiF5iJ8ZSMXWuvb9ALCAT/SCubvajGbxCWe4ZyQJ6/w==
X-Received: by 2002:a62:5d55:: with SMTP id
	r82-v6mr3841755pfb.150.1533747878549; 
	Wed, 08 Aug 2018 10:04:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:22 -0700
Message-Id: <80cceb6eaf536be55bd311ed1c30cb8753d0e05b.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 5/8] glibc: Disable crypt support in glibc
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:38 -0000

Drop packaging libcrypt from 2.28+ onwards
We have independent crypt implementation coming from libxcrypt

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 meta/recipes-core/glibc/glibc.inc         | 4 +---
 meta/recipes-core/glibc/glibc_2.28.bb     | 1 +
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index a4f61f8e87..0e0dacec95 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -14,7 +14,7 @@ RPROVIDES_glibc-extra-nss = "eglibc-extra-nss"
 RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
-libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+libc_baselibs = "${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
 INSANE_SKIP_${PN}_append_aarch64 = " libdir"
 
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 3db55f926f..91491a35f0 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -34,9 +34,7 @@ siteconfig_do_siteconfig_gencache_prepend = " \
 # nptl needs unwind support in gcc, which can't be built without glibc.
 DEPENDS = "virtual/${TARGET_PREFIX}gcc-initial libgcc-initial linux-libc-headers virtual/${TARGET_PREFIX}libc-initial"
 
-CRYPTPROVIDES = "virtual/crypt"
-CRYPTPROVIDES_class-nativesdk = ""
-PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc ${CRYPTPROVIDES}"
+PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools texinfo distro_features_check systemd
 
diff --git a/meta/recipes-core/glibc/glibc_2.28.bb b/meta/recipes-core/glibc/glibc_2.28.bb
index 086daed04c..906e6c2b62 100644
--- a/meta/recipes-core/glibc/glibc_2.28.bb
+++ b/meta/recipes-core/glibc/glibc_2.28.bb
@@ -83,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --enable-stackguard-randomization \
+                --disable-crypt \
                 ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
-- 
2.18.0


