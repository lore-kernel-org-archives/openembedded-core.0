Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 687D577DC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 16:04:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s66so9580984pfs.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wu88WV9IrzUiSshi7RI6V17GvK5x9pqwacP8Eoo6Gtw=;
	b=FTICJYhg4gxrSPdwLV8FHOiD5f+LGedLgOziOJmoFoXaWSvUd0rxDfYtGoHKT0CNgs
	D6t6a4CYFgrOgFehyw+p1ejLl8KGGwAGNIfPXc1ZxIsXAh6abXO97JgV3FiGzbjBexRj
	nlZpRsaQRHTdWDCpNjjS+5yxb+B5EvtYswyrX84RjHEWQjXKlnQSbGRK0k7Vfol20mMS
	Q4Xic6dI8Q7Ee/X//aS6fXkzC0XP4ALU5mBmFS60H4MtB7/di/QLY5HfL1Zs72yMGjfp
	hLmtmKdEqszkoLUnsVF6ssRHa9itZVuyigbd3JkXfrxNqYtV/HdMThCbSaQsNaAE0sr6
	V3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wu88WV9IrzUiSshi7RI6V17GvK5x9pqwacP8Eoo6Gtw=;
	b=q+gurBWiXrFqOgp8v0eS/7liZSoEOPHZXYKaFSFD1qCKzRQouqmKND1BhGWiqH3Xw6
	X2EOC8ayivmVchm6ggNnSY3WRA90xBdu9V1fUiqXVmotg0L7X46jJUM1C9ByCMDEHeqG
	F/BA/ziw17nK92dXoms3SCAtlM8lKGAZ1Byi45ulJmiwEJ/pnCagH0sKiy5ULqraOWe3
	Da9zY/RZW/5LE1Dms8cE7zmacWuQPtSuQM9HJ75TkepZMR0ZSisvi+Si+l4nYbMqd1pI
	RivGzYhVN9OoUy3l3e/kVDwFEk3wix8jzSVrixxmLl3rGAVLDSnYnjbcK2tIxhmEM+DF
	8mqA==
X-Gm-Message-State: AKS2vOxYjiC2OXovWuwByinJI224yFCN8PCUzxmucc0NshEmcbDTycgO
	+AektjJde+T+ss2r
X-Received: by 10.99.177.78 with SMTP id g14mr11402603pgp.131.1498665880058;
	Wed, 28 Jun 2017 09:04:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	v62sm5243608pfb.124.2017.06.28.09.04.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jun 2017 09:04:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jun 2017 09:04:16 -0700
Message-Id: <6d3bee81e7ddaa5548ea4588e87c14b2799ba1fd.1498665211.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498665211.git.raj.khem@gmail.com>
References: <cover.1498665211.git.raj.khem@gmail.com>
Subject: [PATCH 03/10] distutils, setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Wed, 28 Jun 2017 16:04:40 -0000

gcc can handle PIE in gcc driver

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-common-base.bbclass | 2 --
 meta/classes/setuptools.bbclass            | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index fa733c672c..824a1b68b1 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,5 +11,3 @@ FILES_${PN}-dev += "\
   ${libdir}/pkgconfig \
   ${PYTHON_SITEPACKAGES_DIR}/*.la \
 "
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
diff --git a/meta/classes/setuptools.bbclass b/meta/classes/setuptools.bbclass
index 7d0c5267d7..56343b1c73 100644
--- a/meta/classes/setuptools.bbclass
+++ b/meta/classes/setuptools.bbclass
@@ -6,5 +6,3 @@ DISTUTILS_INSTALL_ARGS = "--root=${D} \
     --prefix=${prefix} \
     --install-lib=${PYTHON_SITEPACKAGES_DIR} \
     --install-data=${datadir}"
-
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.13.2


