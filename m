Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 599F77BF7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 05:11:59 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a14so7241771plm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=43DeZ6b8+XqPFYGhPbHpk6QrERAi0y02ZOvXI3yd7VU=;
	b=kwpK6Yx1PlDMbP2XXkZlhkD/NMkQeboL2k2mmw9QyZP2DqDaZ5+s+BK26HfMX0hat6
	7jenOPYwKpFlUnLzSmyoeR8JH2y9tyN78NnmHZAvtAF4gjwTZO+WhGrP5rAsJyyonQdk
	ZY9CULsO9K00/eV5dYYGQOd4S4rjXMciM3eQwxt/pz2MHwYvL51GYxQgmkkHorZF2HA0
	++IIay5S9B22NgDumuTz5UOpWySsy6UKhyLdZBHabvwdZOTOlOQ3XDyoG3dOYyZ7Jtu6
	VzN8j8Q+rxqyrXcn/c3lwGTesKwNn4KtBhw39BplSNP2/3EKG0a6EMLoANPIGvm/ubua
	qtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=43DeZ6b8+XqPFYGhPbHpk6QrERAi0y02ZOvXI3yd7VU=;
	b=NaXpY8Ui4wR1VrW6285+hY59Uir5MQ19Wbr7HYUpzSQ0C1caxG4o8Yw5ehCSM+t/Fn
	ocYRIV6hVbTlyWcigW1Ovh+iyoyDtnOZuf5fwzLso/N++GhtSu22O7LIQOGX6mwD01fy
	EsETO6iFr9DyolGyqF8CXdKeOE3FvG6nBi3Ck/ldcPpstCpuWfsADtNmG7zHnETg//CV
	zRquXdmuQOPnzY1LlEyHF57STc8pQj7WzqPqfvuKkpG4D1mHsth9pD0G3kWxMlps1gzN
	nKZIzwqdEhoG75MwqVu3cwDtZk/BSN5lZKB2how0WIB+jI7Hi2rQABSxx3iPEZYYuRkk
	E6SA==
X-Gm-Message-State: AA+aEWaKKkjS9Y76xwONCCXXbamkxTaVXrmgt/r7PEC6tEhCSkU+OwO9
	0NUMti1BAPlW4hfQ5qQeRmd2AneImi8=
X-Google-Smtp-Source: AFSGD/XRQre8aG0f1TPGh+D+V+LRHLGFPhJTmis4ewr7SLxL+Wz5D56PBsD0+MKA3CePT18EdP2JxQ==
X-Received: by 2002:a17:902:1105:: with SMTP id
	d5mr14572901pla.47.1545109920195; 
	Mon, 17 Dec 2018 21:12:00 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	i193sm20421563pgc.22.2018.12.17.21.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 21:11:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 21:11:49 -0800
Message-Id: <20181218051149.33374-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218051149.33374-1-raj.khem@gmail.com>
References: <20181218051149.33374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gnupg: Upgrade to 2.2.12 release
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
X-List-Received-Date: Tue, 18 Dec 2018 05:11:59 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nfigure.ac-use-a-custom-value-for-the-location-of-.patch | 6 +++---
 meta/recipes-support/gnupg/gnupg/relocate.patch             | 2 +-
 .../gnupg/{gnupg_2.2.11.bb => gnupg_2.2.12.bb}              | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.11.bb => gnupg_2.2.12.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index ab0b6dccc4..3f1c3abaeb 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,4 +1,4 @@
-From 5f38f1276a3651c30bddc508122da2e7d2d3ca92 Mon Sep 17 00:00:00 2001
+From 8eb4d25c25a1c1323797d94e0727a3e42b7f3287 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
 Subject: [PATCH] configure.ac: use a custom value for the location of
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8c80377..a66d393 100644
+index 4d66af9..b9ef235 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1841,7 +1841,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
+@@ -1848,7 +1848,7 @@ AC_DEFINE_UNQUOTED(GPGCONF_DISP_NAME, "GPGConf",
  
  AC_DEFINE_UNQUOTED(GPGTAR_NAME, "gpgtar", [The name of the gpgtar tool])
  
diff --git a/meta/recipes-support/gnupg/gnupg/relocate.patch b/meta/recipes-support/gnupg/gnupg/relocate.patch
index 860f7f1d96..c494ef80b7 100644
--- a/meta/recipes-support/gnupg/gnupg/relocate.patch
+++ b/meta/recipes-support/gnupg/gnupg/relocate.patch
@@ -1,4 +1,4 @@
-From 1eaf630343cc77d8b5d41d0b0a3551fa193c5fcf Mon Sep 17 00:00:00 2001
+From f9fc214b0bf2f67b515ca8a5333f39c497d1b518 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 19 Sep 2018 14:44:40 +0100
 Subject: [PATCH] Allow the environment to override where gnupg looks for its
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.11.bb b/meta/recipes-support/gnupg/gnupg_2.2.12.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.11.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.12.bb
index d259ed5324..1f381c2d91 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.11.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.12.bb
@@ -19,8 +19,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "e23a896d634e8b81681314780f5158a4"
-SRC_URI[sha256sum] = "496c3e123ef53f35436ddccca58e82acaa901ca4e21174e77386c0cea0c49cd9"
+SRC_URI[md5sum] = "421b17028878b253c5acfef056bc6141"
+SRC_URI[sha256sum] = "db030f8b4c98640e91300d36d516f1f4f8fe09514a94ea9fc7411ee1a34082cb"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.20.1


