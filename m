Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id BBD7D71C7D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:33:37 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id z6so522984pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wu88WV9IrzUiSshi7RI6V17GvK5x9pqwacP8Eoo6Gtw=;
	b=BZ3yLUFsWYPaDyO1kdtFnZUhQahPxPr7/YC+a5AyYikHCO2v3clIML2D6eEzd4+FsJ
	6l0lH1LEDKFIXmYFn1EzKjbsk25qm4XkGcJhta6BN34iEIQkd3xoHWpTX8MyXVnVCHGO
	cbz/AnMRN2RxwpKdb2nmMt9Um+3a+OUK+JGEG6IrTz+HokisLds4rNxH3N8m1WoKQU3Z
	RsZJHXbkUf/lx66CBr5cYjprobgtA36OsuaO3J1cwV65opGFFGX0W58MrOtpIsaqKyVH
	5K9yXM/z0h9cXuLQUHwGRZJ9hKUtybUI4j/V1d2sqDNHYAcYGaUMGEFttTbgT8EHjast
	Mddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wu88WV9IrzUiSshi7RI6V17GvK5x9pqwacP8Eoo6Gtw=;
	b=hJ2hSjdD12HEUUx40O50n09xSRbvO/jEiCsoJPrhXxRpgZXb91D3844IZsSZIBApN3
	7Qe4aVPdziJbQb/HU+nL/P9OVfCY76aTDt+EYSFa6v0vzxmwPBnnn56ZXL15UM3kQccy
	u3MoK2SXtWsNCPrRZZYL9QFNJs9tv8HkwXTn8vFk3V4nPGzaMiw+h3TfYCSjadZ7nVH8
	O3J3bSJS8+iYsLvdSxdy0y/whlzGmlvL65in51xG7VtImtVhEdAo6QJK84RLLfoBlu4i
	GH51jW0KWGXeRmbTKu9jveaKsT5X71BKRn2/jJ45qxwxBn1BM+JZLOa8ZklZANtCKXmx
	RDHw==
X-Gm-Message-State: AIVw111ItPz99p4dk7SQZXv0TdY3ho9O844wRFgaG2BzZgTJbZgEfs8V
	fVzpx/1jOdZ2iQnA
X-Received: by 10.98.1.3 with SMTP id 3mr25141826pfb.238.1499351618681;
	Thu, 06 Jul 2017 07:33:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.33.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:33:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:04 -0700
Message-Id: <4838a9eeb506b54da306b701f904d05933163762.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
Subject: [PATCH 03/22] distutils, setuptools: Delete use of SECURITY_NO_PIE_CFLAGS
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
X-List-Received-Date: Thu, 06 Jul 2017 14:33:37 -0000

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


