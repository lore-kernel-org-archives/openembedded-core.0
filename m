Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1F4A07E5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 15:56:23 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id m3so6877150wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ND+BLJ4ScZj/4Y5d7u1VO1liK+zul77wEn3Rra1vQ90=;
	b=XwJEXkGk9mN6KvS390EGwhYO/iJ5b6SGp6GGb5uPbtsA5sYIirRneNRGrWux7NRq5H
	391f5aE73mgIFX1bnVXNrkL4P3JLJe0Mqd85QCcJ+RRU513LPWY2UxBe0jZm4iKov3Qh
	bJoGNAvTx3xLPrJbg3BKcBC6Y7j8DHMn/kU90KobPGIe3PQ0Hfj1MfKc2kNFDzK8eqTC
	mq+RSfGiA0ujx/MTQuOvbY2H1nuJxoPGk2HeVwivDCSX8MF+MrOX1//f33uwr7RNKuYv
	e6M0qcFE+MNEilEoHDtqQqi1YGeIDKhwFt64N1rnoFfi6GslhtLh3asrOz7MovG7XCs4
	yiPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ND+BLJ4ScZj/4Y5d7u1VO1liK+zul77wEn3Rra1vQ90=;
	b=eK9BRp9Htwri/M2gZS3jqdwkAl9b6B9Ri0oO1JdrVrL/uOHA9cT2e/SSHXTy03X8RP
	zG7mCEEkz9Fs3d1mVHqmbSmOYNOgHT8Q/KRLclWOSnRFYW7cI4HmHgFdoc+QxCGwskJN
	j7QrbNoNbEc6pXkSrGT9lh4nRP8Gce+6aMTs+oLJfvffpbGb9G5KBq112tukiLEwOJlp
	M+Yoekz0YP6UXMmnelEMFk1DXUyDgK4PjmD6iHt0WBUsJvb9elMXY+FAtF1GZRVL3Jhy
	FgeHKWwAKsr8noO25g0p/8fkOrSgT43oMsydIU3+GNI44vSWgugDVTDGNkeD0hzOeMJT
	DYbA==
X-Gm-Message-State: APjAAAW1eQFzUjfaK7VHwUjs4HuvBkDYbTEruqXHBYbf1UzyZJ7J9iHv
	AWCczoV3nHeLeSFwzYfHjjoqB8Vuf6k8Pg==
X-Google-Smtp-Source: APXvYqwF8XYDk7i+zwmkz0CUc+FZwROqtEepN8/fvEWEcUA1Jzo6qP8W76qlGgLfqvzfavslKh886Q==
X-Received: by 2002:adf:9e89:: with SMTP id a9mr7184044wrf.78.1559318183643;
	Fri, 31 May 2019 08:56:23 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	u19sm16496445wmu.41.2019.05.31.08.56.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:56:22 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:56:08 +0200
Message-Id: <20190531155612.75663-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531155612.75663-1-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] gtk-doc: upgrade 1.29 -> 1.30
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
X-List-Received-Date: Fri, 31 May 2019 15:56:23 -0000

Source-highlight support has been replaced upstream with python3-pygments.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch    | 6 +++---
 .../gtk-doc/{gtk-doc_1.29.bb => gtk-doc_1.30.bb}            | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.29.bb => gtk-doc_1.30.bb} (87%)

diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 9b128e1ce12..3e973a16eb0 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 04af15322f677db42ecc2acc465334a04de9a871 Mon Sep 17 00:00:00 2001
+From a3f69f2ed45efbdaee47c2dde4df3d78323300e5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
@@ -7,10 +7,10 @@ Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- gtk-doc.m4 | 7 ++++++-
+ buildsystems/autotools/gtk-doc.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/gtk-doc.m4 b/gtk-doc.m4
+diff --git a/buildsystems/autotools/gtk-doc.m4 b/buildsystems/autotools/gtk-doc.m4
 index 2d12f01..e5afc3f 100644
 --- a/buildsystems/autotools/gtk-doc.m4
 +++ b/buildsystems/autotools/gtk-doc.m4
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
similarity index 87%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
index 2c4ee175a95..f16847e40c1 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
@@ -15,11 +15,11 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 # into its scripts. This means that target gtk-doc package is broken;
 # hopefully no one minds because its scripts are not used for anything during build
 # and shouldn't be used on targets.
-PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native python3-six"
+PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "df26a38c209b3d7358f26268fcbdb9e3"
-SRC_URI[archive.sha256sum] = "14578e002496567276d310a62c9ffd6c56ee8806ce5079ffb0b81c4111f586b1"
+SRC_URI[archive.md5sum] = "1045ba29ca0693ced2045523407aae4c"
+SRC_URI[archive.sha256sum] = "a4f6448eb838ccd30d76a33b1fd095f81aea361f03b12c7b23df181d21b7069e"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.17.1


