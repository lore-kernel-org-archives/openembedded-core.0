Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3B54560DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 18:38:32 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id f8so6392600wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 11:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Uell87m/Fr+MNK8DlG/sqwfTI4h60/sqsYTtJrwR/cM=;
	b=m+nc81Ylr+cfJwvJFqJDQsYWEQlY6+EHjN6x4CeJZdFgoRbrgQT8pKRHHm7eExdqyo
	yh951/qNaVnXbU68pvp5Xy8OZ7pf3py5zYHcRG0ExkOgcKodatmudkxxvrkqqa0jdMOh
	yvCkcIb5QIJTPNRt6hWyFamBtI9/kvUCxb6TmMlwd70QD2Fc6k1NaYS0PXD0OPIbmT+b
	sdDPaWtIpSHGicpaSSbB0KLlfgXJqQ2/zWkiLcYAmKYfhyw/P397tw/ZAYc3AzesuunN
	mmMniu3DIaR1lq5nPT6984+urzs5gxPcsn8lyWAK9cYyj3v/BVix2gPSizxFhpff7sKa
	RLlw==
X-Gm-Message-State: ALoCoQnpQHXDxm4Q72bclRTe77OeWy+bIMp87t4KW+ALdIkCyFOpleBYu19HYJmoHyov/ry5j6an
X-Received: by 10.180.19.35 with SMTP id b3mr17107590wie.52.1406054313570;
	Tue, 22 Jul 2014 11:38:33 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jy8sm2847638wjc.7.2014.07.22.11.38.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 11:38:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jul 2014 19:38:14 +0100
Message-Id: <1406054301-9027-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
References: <1406054301-9027-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 04/11] at-spi2-atk: upgrade to 2.12.1
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
X-List-Received-Date: Tue, 22 Jul 2014 18:38:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../atk/{at-spi2-atk_2.12.0.bb => at-spi2-atk_2.12.1.bb}           |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-atk_2.12.0.bb => at-spi2-atk_2.12.1.bb} (79%)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.12.1.bb
similarity index 79%
rename from meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
rename to meta/recipes-support/atk/at-spi2-atk_2.12.1.bb
index db6dc90..4431c3d 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.12.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.12.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "aafc5e1bb17cd3ad440f6350e7a021c1"
-SRC_URI[sha256sum] = "3b5467c9f169812bc36a4245355b7deedea0a62eb22153df96ced88dcd1c3633"
+SRC_URI[md5sum] = "ae11df528f1f038987797f39c8357f81"
+SRC_URI[sha256sum] = "5fa9c527bdec028e06797563cd52d49bcf06f638549df983424d88db89bb1336"
 
 DEPENDS = "dbus glib-2.0 atk at-spi2-core"
 
-- 
1.7.10.4


