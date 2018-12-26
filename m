Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id BBA166BB13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:21 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b5so7886062plr.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=43DeZ6b8+XqPFYGhPbHpk6QrERAi0y02ZOvXI3yd7VU=;
	b=ZaMbyh+B5idNistAUmSEhe5xtaNhbxGocp+VoD82ZMUM1qZkuDkkRwBGc0RGdQ6FV1
	r/NiURoVffPyAzlENdtKtemRuMFNO5WlwDKeanA5RXO85sqw0rAv1ffRZqg0kuCeUdH+
	Djjgw37nPzK8azYAC4NqKgK2pro81+g3LJHvtpVVExQulZbi5LummXXOrvzA/izItlLM
	Sm2XKzN6EqD1+dU9/oaFVBqHCSfAEsUobtHIdwK7uE7OwyuAMlGoSqWysFfyQ7r/XAKH
	5Vq1fR8bNu5zlvHyEgMDsoyvSjIVlqLsxYlFS2xqKCxRt1bC4aHTllHI94IpyiIek9S7
	2wHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=43DeZ6b8+XqPFYGhPbHpk6QrERAi0y02ZOvXI3yd7VU=;
	b=iWskpZRZCwXZ289ntq/irRfH99WovG0tupT2S9SrnCV3ol7cc2SfOk/BZqfsS4OcVh
	BFyciaX40rEqsFETali8CUlydoqtFsIVIdIz3ELzQhEYqnGyvmDh3cpQIbho+ucEZdHP
	CdEuUAL9RN+F+/HmEzHS2Df9XxQafXQ8BwgBkCO4d+Ya+47ua7RHK6AMWgmvW3sW7YZ7
	EWwrXk0k0XYiKSUS4mNCahKAjl9QC40W1lm5s2PgCINVptZ5wDDgBrQnIVA0jvnVTxaB
	jDrdAfOXQA+IF8Jxiy4Y/8p86UE4DBqaEQ8TD49p9vz7D9+ddfeb2UYsrF2jGN3QqEpa
	rXdw==
X-Gm-Message-State: AJcUukdfrjgDyvBbQ41nUgMPMTPFNVK+9IrUDJQEDAAKyzvdvVKWHIKQ
	2fs2j2xoE3nZbyXrG4Yxg684rDbthBA=
X-Google-Smtp-Source: ALg8bN6F4vyRTaIzZeF5BP1xvZbKAasYgPXSX0SpZaNmXXTWHhYaxbHHw8HCIIuRQ16JwZab0iC7oA==
X-Received: by 2002:a17:902:6113:: with SMTP id
	t19mr20485669plj.248.1545855022324; 
	Wed, 26 Dec 2018 12:10:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:46 -0800
Message-Id: <20181226200954.5267-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] gnupg: Upgrade to 2.2.12 release
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:21 -0000
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


