Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3DC7E75A60
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 22:02:37 +0000 (UTC)
Received: by igbij6 with SMTP id ij6so104304691igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TbyLwb9QJtAtnSr05bMh4F/3CSBMtEpI3Tw7vSP2gAg=;
	b=fOMZMQdrzSKaNufPwqgmAx76vchh/Db9Gymm5YLqqmvD8o4pBXoFT2KRLPy+I+27Ag
	/iF07J0u1DwBN9+5qtOQG0dT3qUHikJz1D2hmGllLeHfUUltsvP5ufrxmQXhGrTAXTkG
	LknK89A/Wr1B+sT5MhZWZ4jc6oqH6v1VlRe7Y9vlHWNtrjY7nBk76E8URV8+tFR4D5uh
	3ZVDR/+VTLCmNlQRa8UOZbiIEnqPytoiIGintTQDdrHsFGhCY2OjTQYXhsT6N8ugHxdP
	3rJYjkfthYE3YSXDsG1Cuy/W6pjidzP/adXqTGGsFO7hawEaX+jm+BKbTnG82omKuDeZ
	P6mQ==
X-Received: by 10.50.43.196 with SMTP id y4mr239174igl.14.1438812158080;
	Wed, 05 Aug 2015 15:02:38 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79]) by smtp.gmail.com with ESMTPSA id
	j83sm3061052iod.25.2015.08.05.15.02.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Aug 2015 15:02:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Aug 2015 15:02:29 -0700
Message-Id: <287dd6c8d8a91a1dd46981ae15dbd5554f0a4f70.1438811921.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a55617e9e7b172b8d2fbb77ea6d37f97fb35be00.1438811921.git.raj.khem@gmail.com>
References: <a55617e9e7b172b8d2fbb77ea6d37f97fb35be00.1438811921.git.raj.khem@gmail.com>
In-Reply-To: <cover.1438811921.git.raj.khem@gmail.com>
References: <cover.1438811921.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] glibc: Package libmvec when built
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
X-List-Received-Date: Wed, 05 Aug 2015 22:02:41 -0000

libmvec is new library in glibc 2.22 and currently turned on by default
on x86_64. this helps in packaging it properly when its generated

Fixes warning like
WARNING: QA Issue: nativesdk-glibc: Files/directories were installed but
not shipped in any package:
  /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/libmvec-2.21.90.so
  Please set FILES such that these items are packaged. Alternatively if
  they are unneeded, avoid installing them or delete them within
  do_install. [installed-vs-shipped]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 8ea5915..def0e0c 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -33,7 +33,7 @@ RPROVIDES_glibc-extra-nss = "eglibc-extra-nss"
 RPROVIDES_glibc-thread-db = "eglibc-thread-db"
 RPROVIDES_${PN}-pcprofile = "eglibc-pcprofile"
 RPROVIDES_${PN}-dbg = "eglibc-dbg"
-libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
+libc_baselibs = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so ${base_libdir}/libmvec-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so ${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
 libc_baselibs_append_aarch64 = " /lib/ld-linux-aarch64*.so.1"
 INSANE_SKIP_glibc_append_aarch64 = " libdir"
 
-- 
2.1.4


