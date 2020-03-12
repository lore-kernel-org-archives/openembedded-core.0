Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A193B601D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 23:02:25 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c19so3998318pfo.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 16:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dLOnRP2S+h+waGHTR6uq0Afofrc9B3d8wPmzRJInoEE=;
	b=ryYGUvzcxEftlHXyM65Vri5dt9guM4+Z6wqyVGh4pv5O/LpKKakLqgkGvZulrHu9T2
	dnX7Egp6bAR/kzKxTf04y43iNZSm72ZDR0NszhsOW8GPiWt9xGv8K0aJlIr8TlM95T6T
	AHPItrtFFNqvv4dVJ0AkZEWcLVKQUHRBjJoWOR31TOuivAlufrmq+xEie3E/o/0Kwnga
	QtuTSZXwkfcUaJBj3bB16XhBRWz2kymXr/hTs6/Vd/whliJISukRMXoMrNm49jqTBzAs
	iX7YE4xOqUeo/XRoG5aGw+MhRRInSe+0vAQIZ7Ijaoae3YIXVvAvIK8Cen280d5Z0gvq
	kd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dLOnRP2S+h+waGHTR6uq0Afofrc9B3d8wPmzRJInoEE=;
	b=b7VkCyGjWPP8JsoIVnOLw4cd31ZTehNrFKKTUO5jhhwYVH9qk/OOpr7UXCuZaBPlco
	vH6QYMHPGZMI0TGLmYKEyJ1t5IVrvvz/AVe2pcfMzaoEnb1Sml9rGMBsAirfkk9L+f6B
	AYpcrR4PmqelA3HeeRjHfy19FBIrza/STAPlPyylIH6WQDJ5xysrdFE88q15kZUD1aMg
	EtujlY9INZXz0fXX276sbsfAqULiDfDy92zgubiuSAUXNxoAJJlc+Lrm4vvhtJnP5srJ
	nYBHpi0vehB2DARCQgF7F0iDaLRml3cIjYy8ICY3pCrpmzn7cPxKJ5pSV/CKyXbsMn0s
	Ug1w==
X-Gm-Message-State: ANhLgQ1Zm2hbamW8uYC/lr8AUpDxCvOXlGOmcCsZRCFGK8yd0UnQm6vt
	dWp0UnMbkFCz1dqf1igrJofGL6AssKI=
X-Google-Smtp-Source: ADFU+vvmpCGaPj8y/e4hK/CvhBPAuWFho4nC5i5oLDQcZOPCsR04J+2i4BfNSMZ6ViZpuqtwQDQFIQ==
X-Received: by 2002:a05:6a00:48:: with SMTP id i8mr8889229pfk.20.1584054146054;
	Thu, 12 Mar 2020 16:02:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::94a8])
	by smtp.gmail.com with ESMTPSA id
	j12sm39474864pga.78.2020.03.12.16.02.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Mar 2020 16:02:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2020 16:02:37 -0700
Message-Id: <20200312230238.413509-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] musl: removes aliases for glibc provided libraries
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
X-List-Received-Date: Thu, 12 Mar 2020 23:02:25 -0000
Content-Transfer-Encoding: 8bit

From: Jan Kaisrlik <ja.kaisrlik@gmail.com>

Based on the recommendation in musl mailing list[1] All symlinks have
been removed from musl recipe.

[1]: https://www.openwall.com/lists/musl/2020/03/10/11

Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index afc8446547..f4fbb03092 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -66,24 +66,11 @@ do_install() {
 	rm -f ${D}${bindir}/ldd ${D}${GLIBC_LDSO}
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
-	for l in crypt dl m pthread resolv rt util xnet
-	do
-		ln -sf libc.so ${D}${libdir}/lib$l.so
-	done
-	for i in libc.so.6 libcrypt.so.1 libdl.so.2 libm.so.6 libpthread.so.0 libresolv.so.2 librt.so.1 libutil.so.1; do
-		ln -sf libc.so ${D}${libdir}/$i
-	done
 }
 
 PACKAGES =+ "${PN}-glibc-compat"
 
-FILES_${PN}-glibc-compat += "\
-                ${libdir}/libc.so.6 ${libdir}/libcrypt.so.1 \
-                ${libdir}/libdl.so.2 ${libdir}/libm.so.6 \
-                ${libdir}/libpthread.so.0 ${libdir}/libresolv.so.2 \
-                ${libdir}/librt.so.1 ${libdir}/libutil.so.1 \
-                ${GLIBC_LDSO} \
-                "
+FILES_${PN}-glibc-compat += "${GLIBC_LDSO}"
 
 RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
-- 
2.25.1


