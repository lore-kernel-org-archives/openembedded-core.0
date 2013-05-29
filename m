Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3CB6A42A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 11:00:53 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id c10so3387419wiw.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 04:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=QrGVQ6/1zEsC7sjBNAND5WC3l5q6DmZCIQp2xxV5QI8=;
	b=Lkp9/gx9b8JfXbZYgLpGBqeHeyZKRvojqMzb1cnIFFq9Z2LR8gZs9/3dEr6j0VDDD3
	w2hBB3m1VVDNh5ezi/r8bXUi9a+r18ZUrsoacWhORUD/+Jl6kToxhf1xT5t9Umc8HQ9i
	FGNmQs1GSQZRovmPzi+LCAHEv28cnh02GkVgxho2hlAzjzpUcrqX5KuYVwb19SvLbiXQ
	4lDvj/kkhKH1Rpf11rH3wMaiTi8gn3//0uqNfxnWGrK+mfwpD+Rr2Ai2Pt5Q3QSGzhWc
	zzC+ifia68GQI+PUL/92mYliVpdE4h3eEHsTYlCZJA4cavQbNG/iolVbXv6oO1II1QTl
	9Gog==
X-Received: by 10.180.36.147 with SMTP id q19mr1603425wij.26.1369825253504;
	Wed, 29 May 2013 04:00:53 -0700 (PDT)
Received: from melchett.burtonini.com ([81.2.106.35])
	by mx.google.com with ESMTPSA id m3sm30350942wij.5.2013.05.29.04.00.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 May 2013 04:00:52 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 11:57:33 +0100
Message-Id: <1369825053-10131-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369825053-10131-1-git-send-email-ross.burton@intel.com>
References: <1369825053-10131-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnXb9Bq53pc61Z3A2/tIIpaBmAZ7nHKH8EDw/jkgArQdoAWBIFF9cXY7TaRDjZRgbkrLn1Q
Subject: [PATCH 2/2] librsvg: add sstate dependencies so that the SVG loader works at staging time
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
X-List-Received-Date: Wed, 29 May 2013 11:00:54 -0000

Add more sstate dependencies that were missing from the merge into master.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
index 3a00369..9b1e0ec 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
@@ -54,4 +54,4 @@ FILES_librsvg-gtk-dbg += "${libdir}/gdk-pixbuf-2.0/.debug \
 PIXBUF_PACKAGES = "librsvg-gtk"
 PARALLEL_MAKE = ""
 
-PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene"
+PIXBUFCACHE_SYSROOT_DEPS_append_class-native = " harfbuzz-native:do_populate_sysroot_setscene pango-native:do_populate_sysroot_setscene icu-native:do_populate_sysroot_setscene"
-- 
1.7.10.4


