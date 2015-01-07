Return-Path: <max.oss.09@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id C8167728C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 22:30:31 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w61so1997454wes.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 14:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=h7PyTk4+5F6yWJvskCEckTjJDmTY9h8VkWituVpRmNE=;
	b=vUQOL16quWqbpz0DGNrz4ULdZocKNdrfr027daOiR3gq7Fu2JutdAwABk+IHvXxbMT
	YFmYS55FT6LscNuUsDrh55TD1qDOmKR7FRid4vfvFickk8xsUbHN+4+HH1tfokh05fuH
	gtHpNQyoZaxUCDMxe3ZNKJugHBqFSBpTPPhLr0hx32LAlO9Azn/7HLCkJyRwC1pS+8ef
	1oN/YlnL9ce50X7wO+4+mCV0khC3UdVMR5+4Hn70KMMnqZshtGXdetAux3JPlXUGKmUR
	ryIniUU4GxtyPleKWzyrtVdW5ab0lWImr/31c+IrywAqZPrhXyf6KUpZGl4C7BGl97PS
	8dEw==
X-Received: by 10.180.90.81 with SMTP id bu17mr11857511wib.23.1420669831411;
	Wed, 07 Jan 2015 14:30:31 -0800 (PST)
Received: from Saturn.local.all (212-41-121-234.adsl.solnet.ch.
	[212.41.121.234])
	by mx.google.com with ESMTPSA id lg7sm4204690wic.0.2015.01.07.14.30.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 14:30:30 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 23:29:54 +0100
Message-Id: <1420669797-17688-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 1.8.4.5
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [oe][PATCH v2 0/3] pcmanfm: update to 1.2.3
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
X-List-Received-Date: Wed, 07 Jan 2015 22:30:32 -0000

From: Max Krummenacher <max.oss.09@gmail.com>

v2:
Changes according to Ross's review:
libfm: replace absolute paths with ${libdir} ${includedir}
menu-cache: replace ${PN} in download path
pcmanfm: unchanged

---

This updates pcmanfm and its supporting libraries libfm and menu-cache to
the latest version.

Tested with core-image-sato on a qemux86-64 machine and a custom image on
armv7 hardware.

Due to a circular dependency between menu-cache and libfm the menu-cache patch
requires the libfm patch.

This obsoletes the following two patches which have not (yet) been applied:
http://patchwork.openembedded.org/patch/79087/
http://patchwork.openembedded.org/patch/79089/


Max Krummenacher (3):
  libfm: update to 1.2.3
  menu-cache: update to 1.0.0
  pcmanfm: update to 1.2.3

 .../menu-cache/files/Fix-segfault.patch            | 31 -------------------
 .../menu-cache/menu-cache_0.4.1.bb                 | 21 -------------
 .../menu-cache/menu-cache_1.0.0.bb                 | 16 ++++++++++
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb         | 33 --------------------
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         | 35 +++++++++++++++++++++
 .../libfm-1.1.2.2/fix-make-parallelism-issue.patch | 31 -------------------
 .../libfm-1.1.2.2/ignore_automake_warnings.patch   | 14 ---------
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    | 21 +++++++++++++
 meta/recipes-support/libfm/libfm_1.1.2.2.bb        | 25 ---------------
 meta/recipes-support/libfm/libfm_1.2.3.bb          | 36 ++++++++++++++++++++++
 10 files changed, 108 insertions(+), 155 deletions(-)
 delete mode 100644 meta/recipes-graphics/menu-cache/files/Fix-segfault.patch
 delete mode 100644 meta/recipes-graphics/menu-cache/menu-cache_0.4.1.bb
 create mode 100644 meta/recipes-graphics/menu-cache/menu-cache_1.0.0.bb
 delete mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
 create mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
 delete mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/fix-make-parallelism-issue.patch
 delete mode 100644 meta/recipes-support/libfm/libfm-1.1.2.2/ignore_automake_warnings.patch
 create mode 100644 meta/recipes-support/libfm/libfm-extra_1.2.3.bb
 delete mode 100644 meta/recipes-support/libfm/libfm_1.1.2.2.bb
 create mode 100644 meta/recipes-support/libfm/libfm_1.2.3.bb

-- 
1.8.4.5


