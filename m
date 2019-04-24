Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id EEB8660069
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 06:49:39 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d1so14839770edd.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 23:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=GjeDJ9cWD4VHsybLPvuK6tMWB7sv0+0Eco2SHX9pLFk=;
	b=zrAmJ/LpC+bHvpRMvbGUDkZ/JxSCoZBc07KE2GAIVFxrBEt4mZyPasd6xpHA1SxB1x
	955oSQ7nz5NDVaABEQidghN+tMm81IDe/NC1+C/xhxmPQRUf+eUpURUIr9xiAIXcSzsc
	X/2Gqy0I9jr6g7dQUOioQ8rIrmXPu+Zy7SwG3FcYq9q+blrDT2cKhiuOaLFDJuVBebFn
	LDr3qLfat8B78k6zPlfQuSIZmX6MUfVeoWLtTp98TrzFAdyTj6cSOYjWAoUNY1VpFwpp
	iIiilujrXdUTXCqGZzdLAVqQ4uXPVGcMB4PpJi6Q/Fa/DKnv8mCcsEYgqZ+SdgEMWmDs
	blyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GjeDJ9cWD4VHsybLPvuK6tMWB7sv0+0Eco2SHX9pLFk=;
	b=fJMgEuQg2v7ZSRnqcGdhxmfc+DRA7QAJMp1jQg2K2uNjIXJFLGcGjIstr0JqEL/jwd
	y6eUaSlUXuxUqKc4+gruiDsLFhBXkE4I+VG3t0A/UQlFcazUw6QQnJI54jjknqiW/UxO
	Dnz0ele+5t/HsAq3RkvolouJbHtjI7jBxRC3wgpb/So85OF66IzNDovH2XmUbaPHDEOG
	KLU0pDPinQMP6Fjn3C+rlMjiV8NG0/yOQ8cOVWXRK+kCG5Q+vrDtywMg7vzdZOgOoMPG
	vimmbgmjDeHjrGrPEJHQGqZS7vF+Zqg1g400UmtKj4Ulo2EWzjZm9EjZ2sIRQSFIM1wp
	5LQA==
X-Gm-Message-State: APjAAAXEH3UuQgfB3/Q3ZWFh9BoTaGfP/ykdDdN7bux3npRDCYtNv3sh
	XzK7RnHVZuAb9i229Rp0oTZMWp9Ht0U=
X-Google-Smtp-Source: APXvYqxbmjcgKy88TqKkgQMVVFMtbIYBIvNV6IAIAulC3q4hgX7peo5ejU5OGKOyvUI+iQvPiM6SeQ==
X-Received: by 2002:a50:a915:: with SMTP id l21mr19280250edc.164.1556088580370;
	Tue, 23 Apr 2019 23:49:40 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	jp24sm1527421ejb.51.2019.04.23.23.49.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 23:49:39 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2019 08:49:37 +0200
Message-Id: <20190424064937.2941-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] python3-pygobject: update to 3.32.1
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
X-List-Received-Date: Wed, 24 Apr 2019 06:49:40 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../python3-pygobject/0001-Do-not-build-tests.patch    | 10 +++++++---
 ...pygobject_3.32.0.bb => python3-pygobject_3.32.1.bb} |  4 ++--
 2 files changed, 9 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.32.0.bb => python3-pygobject_3.32.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch b/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
index 626a82cb09..0f2465bb52 100644
--- a/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
+++ b/meta/recipes-devtools/python/python3-pygobject/0001-Do-not-build-tests.patch
@@ -12,15 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index a63d771..b3925d0 100644
+index 278fa16f..aacbd4a2 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -174,4 +174,4 @@ configure_file(input : 'PKG-INFO.in',
- 
+@@ -175,6 +175,6 @@ configure_file(input : 'PKG-INFO.in',
  subdir('gi')
  subdir('pygtkcompat')
+ with_tests = get_option('tests')
+-if with_tests
 -subdir('tests')
+-endif
++#if with_tests
 +#subdir('tests')
++#endif
 -- 
 2.17.1
 
diff --git a/meta/recipes-devtools/python/python3-pygobject_3.32.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.32.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pygobject_3.32.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.32.1.bb
index c2676b3502..8eda06e9e1 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.32.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.32.1.bb
@@ -16,8 +16,8 @@ SRC_URI = " \
 
 UNKNOWN_CONFIGURE_WHITELIST = "introspection"
 
-SRC_URI[md5sum] = "6e39bca1d19a27cde4435061dd59578a"
-SRC_URI[sha256sum] = "83f4d7e59fde6bc6b0d39c5e5208574802f759bc525a4cb8e7265dfcba45ef29"
+SRC_URI[md5sum] = "9d5dbca10162dd9b0d03fed0c6cf865d"
+SRC_URI[sha256sum] = "32c99def94b8dea5ce9e4bc99576ef87591ea779b4db77cfdca7af81b76d04d8"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.17.1


