Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id C78EC60800
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 03:52:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id y18-v6so440209pge.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 20:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EngV8foCPmDSwy7ll9lbypUUMDS3hOjGd37gh62is8A=;
	b=HH9F3IYBv0iV/yzGmDBSGEKouf7j/BlFJLbSxt7+joRdWf+SQa+2bcYrKQY2uuqOEq
	utVT99kotyW6WjpLsIHWUF0M/yXeAPzK5xtBlyN6gaTZncQghSB8hDOwnQO7trqFdmPV
	HkB97BBaefdn9Rv+GiaHFloCD8TJd5mXMKshApkoM7p2TM6tdv/hK4slp9d7kLHmuKhO
	s6ru+jKxxC95mMKo6Nece3NMIL7FWucYMMAQD+wPRuiZ+bZa/a8H1OwGImVUicmPD/e6
	QU4ogdv9K/JEShROw7mL7vmm5IzuYsncvek9UCzywV/nKQT5k51L0h4THf6g8qns+4I6
	OsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EngV8foCPmDSwy7ll9lbypUUMDS3hOjGd37gh62is8A=;
	b=eF3Mg3BRvcf1WlJHzJotHjjcwEGxtrp/7OiVrUP1cbjQP3C46TTds4K6A0KVEtdrNO
	GdC21zr0LizMLoo0WDpg/NYGhkqoclMO4c9MpjxwBxE4rrT4+rSbH5agl54094anTg8Y
	GCo84Md/2Suj/0/yQrb4/ouucPmmTYFEJo7leAFCWJr5pZ4k/yTgHxBBBwVBauqj6faw
	l3hTfzebCwLrPew4uomq+VAUx/S+zqi5hSQ5TLzLZMTivt1jX8aTWFUSNGP8TDXOpNug
	J86bC8kt892NnTphRwfjRzoD2Mjn1UJNqw9jWI1GhfUxECmTOZaFr6dXiDeSm8C1yCak
	YGZg==
X-Gm-Message-State: APzg51CEUoHff1A2i7y/Ob3I78ZO4slnwg5QfY1Vajs9RiDH8mx7qn2+
	RxgokqQXZVqeItWavnDPIPnof9nYrjI=
X-Google-Smtp-Source: ANB0VdYLBd0WIOGzR6wHZw2z6pMUwxY22xapcLkrxMhdP/WA5B9WSn0Tq/OUB8MnQKPacCaNp/aE+A==
X-Received: by 2002:aa7:831b:: with SMTP id
	t27-v6mr39063782pfm.81.1537415575221; 
	Wed, 19 Sep 2018 20:52:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b1b1])
	by smtp.gmail.com with ESMTPSA id
	a20-v6sm52640309pfc.14.2018.09.19.20.52.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Sep 2018 20:52:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 20:52:42 -0700
Message-Id: <20180920035242.983-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180920035242.983-1-raj.khem@gmail.com>
References: <20180920035242.983-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V3 2/2] musl: Add aliases for glibc provided libraries
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
X-List-Received-Date: Thu, 20 Sep 2018 03:52:54 -0000
Content-Transfer-Encoding: 8bit

This is a step towards running pebuilt applications for glibc  on musl
There are many realworld applications which are not always built from
source, especially provided by third party

Package the glibc symlinks into new package musl-glibc-compat

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V3: Inherit linuxloader for glibc ldso

 meta/recipes-core/musl/musl_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index be31718e3a..f0556533b5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -2,6 +2,7 @@
 # Released under the MIT license (see COPYING.MIT for the terms)
 
 require musl.inc
+inherit linuxloader
 
 SRCREV = "0fa1e638e87cf257e9f96b4019b2076afd674a19"
 
@@ -26,6 +27,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            bsd-headers \
            libssp-nonshared \
           "
+GLIBC_LDSO = "${@get_glibc_loader(d)}"
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
 
@@ -62,12 +64,26 @@ do_install() {
 	install -d ${D}${bindir}
 	rm -f ${D}${bindir}/ldd
 	lnr ${D}${libdir}/libc.so ${D}${bindir}/ldd
+	lnr ${D}${libdir}/libc.so ${D}${GLIBC_LDSO}
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
+                ${GLIBC_LDSO} \
+                "
+
 RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
-- 
2.19.0


