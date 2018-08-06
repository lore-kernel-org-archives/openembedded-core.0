Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3B68078A85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:37 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i26-v6so7531412pfo.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fR2ZAFZTWtAVw1vebWIv7pyIs48pjIK8IGW130Cswqw=;
	b=G2RSGRS1Ij1tDfm3y7CfyHHcHzJ5QPQIPd7gnj9wXpLeA8m08MAFbAHLI/rBcfi7RJ
	zXVBp0ba7IyUoUvDnJp41McvFeIv0SOio6dCu77L1wcdBh+71xdxD70nqC6XHHN2j9R2
	VNvC0YqcHzJf8n/hjHYbRVsHq5cUbiI5Rza57Mz6A7wIy8vuCxmWJkXCTTY7WNljeyHH
	1cshlWi2irrla8Ne7n3hTu4aDlxqGKCP0S2XMSHvepG7/92zt5TdgC2sKxniA7AfnZ1T
	Tg0djdwo9339DTvQ0Ctxua7b5cvFn8Crp/0Ei4ve427CsHiLW7UcmPOjYMeIa+il/WJ4
	1WrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fR2ZAFZTWtAVw1vebWIv7pyIs48pjIK8IGW130Cswqw=;
	b=gtQVRX8kmhAGGfBnqWAjZ+q/xa8Xac7sf1/P7kdOoLWY+IMfl6HhL8oyEUtnDzn8da
	tt6HX00ZkIxeKx+DdDbvMEgQbUq7od6vJqL+Arb0kzM7xJ+7TUcjgoywH7SeZHWoW26O
	nrjgmxyTVaDZ4NarL+N1KJ3OrYDuceOp4XbGA1ZAd0vgKayqkdFn15J+RM/9Dkwjjht/
	XFFvW1Ny+qwV5O3kf5qZfEgYzKm92kB5USqBwCiu1rvVo+eBpYpomZMg+dIeRtcEtZY6
	s+K9z2zKWYPFARD1RG/4Ixk75Ds9v/DYzye07HxTwzrDxxo06Jwe4kxZ8UOqK83jE+zi
	yolw==
X-Gm-Message-State: AOUpUlG51p15Z/GEKlNW3/KJjNy9qAcs0RLDM5YGDTlgObaFS4Ni6m+v
	4w7CiOlrHxxc64b4i6kNTw28qalg
X-Google-Smtp-Source: AAOMgpdUaBOB3YWjFe54QoM2fCq56CgVBXb0zt6C7oZjnlVw2DWI4gDtjnGBOtyE5LxEprqv3g2RmQ==
X-Received: by 2002:a62:20d8:: with SMTP id
	m85-v6mr19280515pfj.74.1533596258010; 
	Mon, 06 Aug 2018 15:57:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:08 -0700
Message-Id: <bf1b4204e045a850ea8e91e19778ea12ffc0ef90.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 11/18] glibc: Drop packaging libcrypt from 2.28+ onwards
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 meta/recipes-core/glibc/glibc.inc         | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

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
 
-- 
2.18.0


