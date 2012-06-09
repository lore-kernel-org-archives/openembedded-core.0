Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SdOwK-000460-LU
	for openembedded-core@lists.openembedded.org;
	Sat, 09 Jun 2012 18:55:05 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so3401882dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jun 2012 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/UzlNy4iaUbF4UofmHbcHc8cF4bHqwllUJTJD2Py1p0=;
	b=tKXeg2602qGesfdKa+d81EaUXip6FfIosZHYSoIpqdVnkb72FM2SuSVzzliupda4cT
	5/XKyfgQz3Lh65vuW86PpTukHVa0c98harKD+b9TtUCjDsuMI1Rgevur+DR/8uz2hlBg
	5w/vWqSfmUm0IrwQs42Fs4V7oJDxqRcGUljBVCFuLYrUGYtZHEC6Ung4I9XWB33VoFJT
	1LNLZa4BQ7UYmzWFQ/Kt0PvP1EYR+SQAG9ww3IybCgKBznEkzGQkEp5G68hZpWeL/hNy
	fxYlyGtlE+suTvnmz1WtU1rt30IreRm0GAj6fmys2wvF+gWu/hAdoHqlmCUDE5o8uhpV
	zKDQ==
Received: by 10.68.225.101 with SMTP id rj5mr7886524pbc.103.1339260275465;
	Sat, 09 Jun 2012 09:44:35 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id hc7sm11897651pbc.54.2012.06.09.09.44.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 09 Jun 2012 09:44:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jun 2012 09:43:13 -0700
Message-Id: <b684ff05ea54908affd40062aabef5b8edbc7dfc.1339259893.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
References: <c8b84221a903fa86e1ba3df402166720c7ca9b16.1339259893.git.raj.khem@gmail.com>
In-Reply-To: <cover.1339259893.git.raj.khem@gmail.com>
References: <cover.1339259893.git.raj.khem@gmail.com>
Subject: [PATCH 15/16] gpgme: Depend on npth for uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Jun 2012 16:55:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.3.1.bb |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.3.1.bb b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
index 4bcb57a..43d8aad 100644
--- a/meta/recipes-support/gpgme/gpgme_1.3.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.3.1.bb
@@ -13,8 +13,11 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gpgme/gpgme-${PV}.tar.bz2 \
 
 SRC_URI[md5sum] = "90afa8436ce2b2683c001c824bd22601"
 SRC_URI[sha256sum] = "15ef27a875ae0d79d7446fd931deda11438e724ffbeac74449ed19cba23df4d4"
-DEPENDS = "libgpg-error libassuan pth"
-PR = "r1"
+DEPENDS = "libgpg-error libassuan ${PTH}"
+PTH_libc-uclibc = "npth"
+PTH = "pth"
+
+PR = "r2"
 
 EXTRA_OECONF = "--with-pth=${STAGING_DIR_HOST} --without-pth-test \
                 --with-gpg=${bindir}/gpg --without-gpgsm"
-- 
1.7.5.4



