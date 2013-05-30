Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id D01576A4D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:16 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hr14so5317211wib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=CbwimwGxDzWzuTem3u8zH5MWs99if7CCbU88JkQ0Uxc=;
	b=XCLkQ1JhkmxdKyAzaSPFHwuCU0/vvQJrZdp7whmFJqYVGMd8iigeQu0bllyOHU/V3C
	qRQDwfiF7eGQ68a1QajyeVikY7nSwVv7qFH0XskX4yUHS1aLWYBc35fSI5gyz7xsphmu
	vNSfU/umbks4ToPdvd4cn5XP7lasx2mahBZo7fA1a0Pt/Gsjl6rbV6PxOhvyWxoeS/TM
	OlPPpwe4Aq5r1Zwi+aMzPXgBz7EvRDWLSTDwoew4ukZOZQ01KFspj00i5jfV4x+kjCVy
	mW5Sq8aVlhaaDmcioqDjHrTnZkq+NSNi+QCZkT3cjZ4KI2wrHN6FNNRErRZsFNDQxA+2
	fBlg==
X-Received: by 10.180.76.103 with SMTP id j7mr4874439wiw.21.1369922177437;
	Thu, 30 May 2013 06:56:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:39 +0100
Message-Id: <82109947b6a79766ed47000d898c1f1affecbf63.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmXIQXW0wYLykHhPq9As5khB/ZR4KUdNfazc6lLrl9Y44Qv5XGsFTQsrPM5qHyuginHSW1c
Subject: [PATCH 05/14] atk: upgrade to 2.8
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
X-List-Received-Date: Thu, 30 May 2013 13:56:17 -0000

Upgrade to the latest upstream, and future-proof the SRC_URI using
trim_version().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.8.0.bb} |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-support/atk/{atk_2.6.0.bb => atk_2.8.0.bb} (70%)

diff --git a/meta/recipes-support/atk/atk_2.6.0.bb b/meta/recipes-support/atk/atk_2.8.0.bb
similarity index 70%
rename from meta/recipes-support/atk/atk_2.6.0.bb
rename to meta/recipes-support/atk/atk_2.8.0.bb
index be797c7..a190c0a 100644
--- a/meta/recipes-support/atk/atk_2.6.0.bb
+++ b/meta/recipes-support/atk/atk_2.8.0.bb
@@ -7,15 +7,16 @@ LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://atk/atkutil.c;endline=20;md5=db21b0bdbef9da4dc6eb122debc9f9bc \
                     file://atk/atk.h;endline=20;md5=c58238d688c24387376d6c69d06248a7"
-PR = "r0"
 
 DEPENDS = "glib-2.0"
 
 inherit autotools gtk-doc pkgconfig
 
-SRC_URI = "http://download.gnome.org/sources/atk/2.6/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "6b34e2a63dda4429b5692be7ca3aa5bf"
-SRC_URI[sha256sum] = "eff663f90847620bb68c9c2cbaaf7f45e2ff44163b9ab3f10d15be763680491f"
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "c652bd25530825d604dae1c1ebd2da02"
+SRC_URI[sha256sum] = "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.10.4


