Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8A6B7FD0C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 17:25:44 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so294724wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 09:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=N22RAksOdHuTNh9s/hLor7XOThYanef1Boqu4d2JjEk=;
	b=UJchSG6vjOMT48bgzdPpCj02azzWLH5xYOP/vWNPifu1TpkZyVw5/ajLHrWfWLMo26
	/R4bWYNXNa3BedJ1oCiO7VPcQIycqkCEYtAhycd+eUOV/2LcZCySrCbbXu8R+QLT1FJf
	2JkNwVRZznmoo6X5gf7mSJdJX8ygG8AwgWtn61qPVHpR/r1GjReSiCX3U0PsOpA958Lw
	5b/juQVFt7VtDrQ7pnsQ6tev2qnFehqVC76h8Fd819sE8DoSOpmFBqiJ2v8cOiyNmhLG
	WDkIu3yX1NilVM2RNIaPpsPQlOMQXNDHbkQFHC4zQRT/n4URGVAb5WJs0Ns1pn0X0pLi
	Wjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=N22RAksOdHuTNh9s/hLor7XOThYanef1Boqu4d2JjEk=;
	b=aFy2RHqz3BLvOb858UrgFJLj/MOxnBoGcQ+RKE2ZIt6FCtQRzBGgu+xSPIpgrNWwDz
	HKAuTsArb/83gQ+cafvoZHeWN0qMINkyE9qwPS3Q14V3oO8jWnX2CjcLK8tHiFQ4gBRR
	X6o55hfntEYo5RqL94CtEjeyL3k5+7e1G/HS1Z8t6ATWR1GAhH0pttBtIkDlV3hAN0LT
	NN7ko4qYEfbP93YXYdP9S7RayH5pOu5Ro6wsMvuxof5V+EuJtDl3N4d/og6uvdUmk6ep
	TefED1t0YheGfpmKPmTtGmMvbp4Dmfu3ryecXuYO6f8rxZQMrRex48Omf7c0xegPcrHb
	zPNg==
X-Gm-Message-State: APjAAAUDSSqDd65yPPTuBrLAMULsvHKzr+2ty324cWLZUzBzg1Q+gAi6
	Y4jgCRi0bSGc1j9JnR7vIuhSLtZo
X-Google-Smtp-Source: APXvYqzZd+jxEiwGtk36oVHYtlHlh55zs7d1R6xozxs1cElG8AUildytLXRAlO/kzkxbI4YWHfWSbw==
X-Received: by 2002:a5d:6692:: with SMTP id l18mr538881wru.382.1579541144930; 
	Mon, 20 Jan 2020 09:25:44 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id x11sm31526wmg.46.2020.01.20.09.25.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 09:25:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 18:25:09 +0100
Message-Id: <20200120172510.22648-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200120172510.22648-1-alex.kanavin@gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
Subject: [PATCH 23/24] libsecret: upgrade 0.19.1 -> 0.20.0
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
X-List-Received-Date: Mon, 20 Jan 2020 17:25:45 -0000

Add a backported patch to fix musl builds.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ection-Rename-internal-functions-to-.patch | 144 ++++++++++++++++++
 ...ibsecret_0.19.1.bb => libsecret_0.20.0.bb} |   5 +-
 2 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.19.1.bb => libsecret_0.20.0.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch b/meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch
new file mode 100644
index 00000000000..269c12b0107
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-secret-file-collection-Rename-internal-functions-to-.patch
@@ -0,0 +1,144 @@
+From 59bcb169c4777bb3b1a50fee2ae20e4e8574b749 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <dueno@src.gnome.org>
+Date: Tue, 14 Jan 2020 10:09:29 +0100
+Subject: [PATCH] secret-file-collection: Rename internal functions to avoid
+ conflicts
+
+As encrypt() is a standard POSIX function, its declaration had
+conflict with our own.  Let's be more verbose about naming of the
+internal crypto functions.
+
+Fixes #35.
+
+Upstream-Status: Backport [https://github.com/GNOME/libsecret/commit/cf21ad50b62f7c8e4b22ef374f0a73290a99bdb8]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ libsecret/secret-file-collection.c | 38 +++++++++++++++---------------
+ 1 file changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/libsecret/secret-file-collection.c b/libsecret/secret-file-collection.c
+index 79863ea..8ffb542 100644
+--- a/libsecret/secret-file-collection.c
++++ b/libsecret/secret-file-collection.c
+@@ -68,7 +68,7 @@ enum {
+ };
+ 
+ static gboolean
+-derive (SecretFileCollection *self)
++do_derive_key (SecretFileCollection *self)
+ {
+ 	const gchar *password;
+ 	gsize n_password;
+@@ -93,9 +93,9 @@ derive (SecretFileCollection *self)
+ }
+ 
+ static gboolean
+-calculate_mac (SecretFileCollection *self,
+-	       const guint8 *value, gsize n_value,
+-	       guint8 *buffer)
++do_calculate_mac (SecretFileCollection *self,
++		  const guint8 *value, gsize n_value,
++		  guint8 *buffer)
+ {
+ 	gcry_mac_hd_t hd;
+ 	gcry_error_t gcry;
+@@ -130,9 +130,9 @@ calculate_mac (SecretFileCollection *self,
+ }
+ 
+ static gboolean
+-decrypt (SecretFileCollection *self,
+-	 guint8 *data,
+-	 gsize n_data)
++do_decrypt (SecretFileCollection *self,
++	    guint8 *data,
++	    gsize n_data)
+ {
+ 	gcry_cipher_hd_t hd;
+ 	gcry_error_t gcry;
+@@ -164,9 +164,9 @@ decrypt (SecretFileCollection *self,
+ }
+ 
+ static gboolean
+-encrypt (SecretFileCollection *self,
+-	 guint8 *data,
+-	 gsize n_data)
++do_encrypt (SecretFileCollection *self,
++	    guint8 *data,
++	    gsize n_data)
+ {
+ 	gcry_cipher_hd_t hd;
+ 	gcry_error_t gcry;
+@@ -311,7 +311,7 @@ on_load_contents (GObject *source_object,
+ 			self->modified = g_date_time_new_now_utc ();
+ 			self->usage_count = 0;
+ 
+-			if (!derive (self)) {
++			if (!do_derive_key (self)) {
+ 				g_task_return_new_error (task,
+ 							 SECRET_ERROR,
+ 							 SECRET_ERROR_PROTOCOL,
+@@ -375,7 +375,7 @@ on_load_contents (GObject *source_object,
+ 	g_assert (n_data == salt_size);
+ 
+ 	self->salt = g_bytes_new (data, n_data);
+-	if (!derive (self)) {
++	if (!do_derive_key (self)) {
+ 		g_task_return_new_error (task,
+ 					 SECRET_ERROR,
+ 					 SECRET_ERROR_PROTOCOL,
+@@ -442,7 +442,7 @@ hash_attributes (SecretFileCollection *self,
+ 		GVariant *variant;
+ 
+ 		value = g_hash_table_lookup (attributes, l->data);
+-		if (!calculate_mac (self, (guint8 *)value, strlen (value), buffer)) {
++		if (!do_calculate_mac (self, (guint8 *)value, strlen (value), buffer)) {
+ 			g_list_free (keys);
+ 			return NULL;
+ 		}
+@@ -485,7 +485,7 @@ hashed_attributes_match (SecretFileCollection *self,
+ 			return FALSE;
+ 		}
+ 
+-		if (!calculate_mac (self, value, strlen ((char *)value), buffer)) {
++		if (!do_calculate_mac (self, value, strlen ((char *)value), buffer)) {
+ 			g_variant_unref (hashed_attribute);
+ 			return FALSE;
+ 		}
+@@ -584,7 +584,7 @@ secret_file_collection_replace (SecretFileCollection *self,
+ 	g_variant_store (serialized_item, data);
+ 	g_variant_unref (serialized_item);
+ 	memset (data + n_data, n_padded - n_data, n_padded - n_data);
+-	if (!encrypt (self, data, n_padded)) {
++	if (!do_encrypt (self, data, n_padded)) {
+ 		egg_secure_free (data);
+ 		g_set_error (error,
+ 			     SECRET_ERROR,
+@@ -593,8 +593,8 @@ secret_file_collection_replace (SecretFileCollection *self,
+ 		return FALSE;
+ 	}
+ 
+-	if (!calculate_mac (self, data, n_padded + IV_SIZE,
+-			    data + n_padded + IV_SIZE)) {
++	if (!do_calculate_mac (self, data, n_padded + IV_SIZE,
++			       data + n_padded + IV_SIZE)) {
+ 		egg_secure_free (data);
+ 		g_set_error (error,
+ 			     SECRET_ERROR,
+@@ -681,7 +681,7 @@ _secret_file_item_decrypt (GVariant *encrypted,
+ 	}
+ 	n_padded -= IV_SIZE + MAC_SIZE;
+ 
+-	if (!calculate_mac (collection, data, n_padded + IV_SIZE, mac)) {
++	if (!do_calculate_mac (collection, data, n_padded + IV_SIZE, mac)) {
+ 		egg_secure_free (data);
+ 		g_set_error (error,
+ 			     SECRET_ERROR,
+@@ -699,7 +699,7 @@ _secret_file_item_decrypt (GVariant *encrypted,
+ 		return FALSE;
+ 	}
+ 
+-	if (!decrypt (collection, data, n_padded)) {
++	if (!do_decrypt (collection, data, n_padded)) {
+ 		egg_secure_free (data);
+ 		g_set_error (error,
+ 			     SECRET_ERROR,
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.0.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.0.bb
index 3da2a4acac1..aa3dfab581d 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.19.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.0.bb
@@ -13,8 +13,9 @@ DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
-SRC_URI[archive.md5sum] = "ea673119c00570d6434f8fd3636f1eb8"
-SRC_URI[archive.sha256sum] = "8583e10179456ae2c83075d95455f156dc08db6278b32bf4bd61819335a30e3a"
+SRC_URI += " file://0001-secret-file-collection-Rename-internal-functions-to-.patch"
+SRC_URI[archive.md5sum] = "335750caeed47f50496b3b0e6a1875ff"
+SRC_URI[archive.sha256sum] = "f1187370b453106af878e30c284a121ba0c513da8bb4170b329d66e250bdae43"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


