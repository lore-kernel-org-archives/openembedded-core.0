Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7D78C613ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 19:48:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u6so2040384wrt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 11:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=a+cyPGzFQrSe2RctjlUNwbbhzwYKInLntCRrUCfhHhs=;
	b=bKxMSINnVvtRlZGMDOZmtiLBa3sfuxYQglStrLmWPK4rqVp0WqCVJIxzvlaQAvZktA
	ySPNAgozl70Q1bYdQuvjRgT4DBDmJ2z81Dd0peqyJrqoqAd6ofoXaZ4dFKp5cuoiZKCa
	BIdNwYpUvdlN8kdMqsHm76ViGbSGjsRXWkIvJY6aqDcIke5ilLGZsXE0XC6tY6lBvsRm
	cLmsT1bE0pEoiHroQxUR8OEPEOj/CWrunTwO6fXo6nVsqOzhCHIZDf9n3JdpXMHGXgfB
	SIjhTNjlHXcqfZiPFGBhsbQz9nxVHggxyLJddgWdXarZUQoC0pZowHkPUQc5FQw5AFMU
	O2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=a+cyPGzFQrSe2RctjlUNwbbhzwYKInLntCRrUCfhHhs=;
	b=NqTYYRX9dBdez9diw6sI5P4zRD0nSvik3BBfGMrzoTtXozjs2pIZKCiqvOjR3h5Lkc
	orxukZoVcdv9fDLrUZYkQ3QtrSIOI7g/n85geJLkyPHVHCPzbu2Tvy3b/fGcFyYSpJX2
	4RWewkHaleH9+r9Gz9hww0zdLQkb1hLWasKSUA73oTxDq/H+t38WlIvaFLtXUtyl2Sxs
	+iB2+vDYpANyiVa3Zt9hcYUKh03yW3ifhV70PmS6l6I+7OmheIYiMWlV+NsXCEPLvjJb
	90Jv5XJT1NWCIAES7DA3kqI5slwKML771mmBSQLrf5H8edxjA/bjsvG8S8BkRYGY0yoD
	3Grg==
X-Gm-Message-State: APjAAAWvoWuR13d+sMlgI2SQp3K9X2876pQt6DTyU0Ti0z4PReJb/+lX
	VlfFN/yYcVi8w8kuA3XEy+WIoquy
X-Google-Smtp-Source: APXvYqyI0iF446/O1dt0klmxi3Zgw/z4i7fPcjOpoxnvvfC8E1BjIqUxBiRFufoCkjvdcNCsKtnXKA==
X-Received: by 2002:adf:fe50:: with SMTP id m16mr39519838wrs.217.1582141703886;
	Wed, 19 Feb 2020 11:48:23 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	y185sm1204049wmg.2.2020.02.19.11.48.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 11:48:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 20:47:48 +0100
Message-Id: <20200219194752.7967-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200219194752.7967-1-alex.kanavin@gmail.com>
References: <20200219194752.7967-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/13] libsecret: upgrade 0.20.0 -> 0.20.1
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
X-List-Received-Date: Wed, 19 Feb 2020 19:48:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ection-Rename-internal-functions-to-.patch | 144 ------------------
 ...ibsecret_0.20.0.bb => libsecret_0.20.1.bb} |   5 +-
 2 files changed, 2 insertions(+), 147 deletions(-)
 delete mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.0.bb => libsecret_0.20.1.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch b/meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch
deleted file mode 100644
index 269c12b010..0000000000
--- a/meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 59bcb169c4777bb3b1a50fee2ae20e4e8574b749 Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <dueno@src.gnome.org>
-Date: Tue, 14 Jan 2020 10:09:29 +0100
-Subject: [PATCH] secret-file-collection: Rename internal functions to avoid
- conflicts
-
-As encrypt() is a standard POSIX function, its declaration had
-conflict with our own.  Let's be more verbose about naming of the
-internal crypto functions.
-
-Fixes #35.
-
-Upstream-Status: Backport [https://github.com/GNOME/libsecret/commit/cf21ad50b62f7c8e4b22ef374f0a73290a99bdb8]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libsecret/secret-file-collection.c | 38 +++++++++++++++---------------
- 1 file changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/libsecret/secret-file-collection.c b/libsecret/secret-file-collection.c
-index 79863ea..8ffb542 100644
---- a/libsecret/secret-file-collection.c
-+++ b/libsecret/secret-file-collection.c
-@@ -68,7 +68,7 @@ enum {
- };
- 
- static gboolean
--derive (SecretFileCollection *self)
-+do_derive_key (SecretFileCollection *self)
- {
- 	const gchar *password;
- 	gsize n_password;
-@@ -93,9 +93,9 @@ derive (SecretFileCollection *self)
- }
- 
- static gboolean
--calculate_mac (SecretFileCollection *self,
--	       const guint8 *value, gsize n_value,
--	       guint8 *buffer)
-+do_calculate_mac (SecretFileCollection *self,
-+		  const guint8 *value, gsize n_value,
-+		  guint8 *buffer)
- {
- 	gcry_mac_hd_t hd;
- 	gcry_error_t gcry;
-@@ -130,9 +130,9 @@ calculate_mac (SecretFileCollection *self,
- }
- 
- static gboolean
--decrypt (SecretFileCollection *self,
--	 guint8 *data,
--	 gsize n_data)
-+do_decrypt (SecretFileCollection *self,
-+	    guint8 *data,
-+	    gsize n_data)
- {
- 	gcry_cipher_hd_t hd;
- 	gcry_error_t gcry;
-@@ -164,9 +164,9 @@ decrypt (SecretFileCollection *self,
- }
- 
- static gboolean
--encrypt (SecretFileCollection *self,
--	 guint8 *data,
--	 gsize n_data)
-+do_encrypt (SecretFileCollection *self,
-+	    guint8 *data,
-+	    gsize n_data)
- {
- 	gcry_cipher_hd_t hd;
- 	gcry_error_t gcry;
-@@ -311,7 +311,7 @@ on_load_contents (GObject *source_object,
- 			self->modified = g_date_time_new_now_utc ();
- 			self->usage_count = 0;
- 
--			if (!derive (self)) {
-+			if (!do_derive_key (self)) {
- 				g_task_return_new_error (task,
- 							 SECRET_ERROR,
- 							 SECRET_ERROR_PROTOCOL,
-@@ -375,7 +375,7 @@ on_load_contents (GObject *source_object,
- 	g_assert (n_data == salt_size);
- 
- 	self->salt = g_bytes_new (data, n_data);
--	if (!derive (self)) {
-+	if (!do_derive_key (self)) {
- 		g_task_return_new_error (task,
- 					 SECRET_ERROR,
- 					 SECRET_ERROR_PROTOCOL,
-@@ -442,7 +442,7 @@ hash_attributes (SecretFileCollection *self,
- 		GVariant *variant;
- 
- 		value = g_hash_table_lookup (attributes, l->data);
--		if (!calculate_mac (self, (guint8 *)value, strlen (value), buffer)) {
-+		if (!do_calculate_mac (self, (guint8 *)value, strlen (value), buffer)) {
- 			g_list_free (keys);
- 			return NULL;
- 		}
-@@ -485,7 +485,7 @@ hashed_attributes_match (SecretFileCollection *self,
- 			return FALSE;
- 		}
- 
--		if (!calculate_mac (self, value, strlen ((char *)value), buffer)) {
-+		if (!do_calculate_mac (self, value, strlen ((char *)value), buffer)) {
- 			g_variant_unref (hashed_attribute);
- 			return FALSE;
- 		}
-@@ -584,7 +584,7 @@ secret_file_collection_replace (SecretFileCollection *self,
- 	g_variant_store (serialized_item, data);
- 	g_variant_unref (serialized_item);
- 	memset (data + n_data, n_padded - n_data, n_padded - n_data);
--	if (!encrypt (self, data, n_padded)) {
-+	if (!do_encrypt (self, data, n_padded)) {
- 		egg_secure_free (data);
- 		g_set_error (error,
- 			     SECRET_ERROR,
-@@ -593,8 +593,8 @@ secret_file_collection_replace (SecretFileCollection *self,
- 		return FALSE;
- 	}
- 
--	if (!calculate_mac (self, data, n_padded + IV_SIZE,
--			    data + n_padded + IV_SIZE)) {
-+	if (!do_calculate_mac (self, data, n_padded + IV_SIZE,
-+			       data + n_padded + IV_SIZE)) {
- 		egg_secure_free (data);
- 		g_set_error (error,
- 			     SECRET_ERROR,
-@@ -681,7 +681,7 @@ _secret_file_item_decrypt (GVariant *encrypted,
- 	}
- 	n_padded -= IV_SIZE + MAC_SIZE;
- 
--	if (!calculate_mac (collection, data, n_padded + IV_SIZE, mac)) {
-+	if (!do_calculate_mac (collection, data, n_padded + IV_SIZE, mac)) {
- 		egg_secure_free (data);
- 		g_set_error (error,
- 			     SECRET_ERROR,
-@@ -699,7 +699,7 @@ _secret_file_item_decrypt (GVariant *encrypted,
- 		return FALSE;
- 	}
- 
--	if (!decrypt (collection, data, n_padded)) {
-+	if (!do_decrypt (collection, data, n_padded)) {
- 		egg_secure_free (data);
- 		g_set_error (error,
- 			     SECRET_ERROR,
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.0.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.0.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
index aa3dfab581..72511af02d 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.0.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
@@ -13,9 +13,8 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI += " file://0001-secret-file-collection-Rename-internal-functions-to-.patch"
-SRC_URI[archive.md5sum] = "335750caeed47f50496b3b0e6a1875ff"
-SRC_URI[archive.sha256sum] = "f1187370b453106af878e30c284a121ba0c513da8bb4170b329d66e250bdae43"
+SRC_URI[archive.md5sum] = "d2dd660a8d502099317bc8af9f30302e"
+SRC_URI[archive.sha256sum] = "57f73e94ec6263a17a077fb809cf8cf424637a897a7f15b4eec42ce4aef52447"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.25.0


