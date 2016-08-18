Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2429B7687B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:15:08 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so280478wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nKnjGTnKwXdS4D+Jlyn1GsAeR9cDxHD+esHBcC5IKzw=;
	b=Bh5fGa6VbS17hyb4rsDfHE5rPuXjQg/CYcsHd89Mbs3Zx6Y+K0O0qUARI1p8eMNuvz
	koBk2yomSwI+OWNUqK4Id+rzeJeBSUfjCODniR7NMFlUkT62oDhAxXWjkAhGyz6d1w87
	xNSeCJsCK68nqvGWnDsYGrDcTPTUXtTRv4/vwSHFgzw9UjpTF2xYXPQYVp9LHNtAyYM7
	WGGrv0oXkUZypRhPZAlIH9+pZ4YFZQBPxU0bHKFQBrncuKw0TYXbSnrA4AbYdgeIiLTd
	srfLaMNDz3UB8w79KzBuRR1YlFos9MDaOuY6jKDo5nFycN60wmz3L+4W8HcVsXWLptnl
	OnNw==
X-Gm-Message-State: AEkoousyzVrDKMuSbFwNNcoLEC9kVFfDX++ZUsNwks9lp6TY8lsKo2m96lfHtktGI/pwhg==
X-Received: by 10.194.59.77 with SMTP id x13mr2703635wjq.144.1471536908933;
	Thu, 18 Aug 2016 09:15:08 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	al10sm2921327wjc.12.2016.08.18.09.15.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Aug 2016 09:15:07 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Aug 2016 17:15:03 +0100
Message-Id: <20160818161503.20738-4-git@andred.net>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160818161503.20738-1-git@andred.net>
References: <20160818161503.20738-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 4/4] gettext_0.16.1: whitespace changes to align with v0.19.8.1
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
X-List-Received-Date: Thu, 18 Aug 2016 16:15:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This further aligns this recipe with the GPLv3 version to make
it easier to  spot differences between the two recipes.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-core/gettext/gettext_0.16.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.16.1.bb b/meta/recipes-core/gettext/gettext_0.16.1.bb
index 93f5fcd..e79f4da 100644
--- a/meta/recipes-core/gettext/gettext_0.16.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.16.1.bb
@@ -21,13 +21,13 @@ SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
            file://hardcode_macro_version.patch \
           "
 
-LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
-
 SRC_URI[md5sum] = "3d9ad24301c6d6b17ec30704a13fe127"
 SRC_URI[sha256sum] = "0bf850d1a079fb5a61f0a47b1a9efd35eb44032255375e1cedb0253bc27b376d"
 
 PARALLEL_MAKE = ""
 
+LDFLAGS_prepend_libc-uclibc = " -lrt -lpthread "
+
 inherit autotools texinfo
 
 EXTRA_OECONF += "--without-lispdir \
@@ -104,9 +104,8 @@ FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
                              ${infodir}/autosprintf.info \
                             "
 
-
 do_install_append() {
-	rm -f ${D}${libdir}/preloadable_libintl.so
+    rm -f ${D}${libdir}/preloadable_libintl.so
 }
 
 do_install_append_class-native () {
-- 
2.9.3


