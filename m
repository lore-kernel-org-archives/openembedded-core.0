Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 033957D957
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:05 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z6so5912946wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+H/uVvInwUpJHvJlm5Pcf15Qxai1PyMdXoeRMRfkHw0=;
	b=NhocYB6k1xd46UZmR36xz1+XAINKxFbWrULF5wfqj7bu7dzvUjWml+NM//FR24P6kx
	I2NV9wznusb3n8FVCSpKYD5Ao+yNyjkUABKI57fCkUQ5t+ds2tenJTfN7nsHDBcPAjhx
	I5x2UCZ+BH9DveM9nNE6fS5dTeCs1bJQX8XMGTPXa3aOaX2kSJ3bpYVWsim+pPbJkxnl
	7J/CAVY+Kd3bogCKVrOdTKDdZsy0/7HJup3kGgJIu4eS63yZu9Bh5gfO0HLogXlNtY0l
	4+RPaHdV2xN5WSr5Sax4urYvZVTFCDGh9L2eeAjgO5xwomWMqP5B3KdJKPEb7r+tbEXp
	DEAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+H/uVvInwUpJHvJlm5Pcf15Qxai1PyMdXoeRMRfkHw0=;
	b=rp92sT/LqUo4PE8dQ4iQp0zAiIdT/88BazavYpQ3cpmxl8vFn9acXV3yDRNUUWSv90
	J+9eDqiHyaJdQZAT4fH1KIq7QzKif/WzFAjOmFjEYJtNnctPUlqGW4Don3dJ0/bBl5Q+
	oDnvP9us4oYdKfrgy2QtK3MuA8gXOJzWh/JGVFAwaGMXEaxqE7FxOjCvuwmVcTMyJPP4
	hjwVeNxey+E8OdHWD3lNLcAhYofv5tuoec5mdDtO69KTfQDGc0pFVQkVaDJDU4idV0iT
	1P3v5JmAPULoWuO//9vA3mblNIOP+v2zH+R6Phi7JIyWljlDCiyi5BpHABuVX+VAnBtY
	+7dQ==
X-Gm-Message-State: APjAAAWk+jtQpqSfq3f3apPxqbpsSTsvdwMERuT/LyccinURHlpK9AVU
	P25BBCLZxAmAaGUjiJ8po/gIQ8O90wY=
X-Google-Smtp-Source: APXvYqyCrbMrBsIZqY/eV1BBqHWNkv0Hm+WTX1l1sfyEuTES+PJ9bVX3gTXxy2yIemmy7NmNhW/TRw==
X-Received: by 2002:a1c:9691:: with SMTP id y139mr21601986wmd.64.1555325706539;
	Mon, 15 Apr 2019 03:55:06 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:42 +0200
Message-Id: <20190415105457.57067-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/19] libdazzle: update to 3.32.1
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:06 -0000

Remove a patch as the problem was fixed upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ine-so-that-gir-compilation-succeeds.patch | 26 -------------------
 ...ibdazzle_3.30.2.bb => libdazzle_3.32.1.bb} |  5 ++--
 2 files changed, 2 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
 rename meta/recipes-gnome/libdazzle/{libdazzle_3.30.2.bb => libdazzle_3.32.1.bb} (64%)

diff --git a/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch b/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
deleted file mode 100644
index c959d43972f..00000000000
--- a/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 546d53c3515e8a488a204763437d1fa0917097e5 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 11 Dec 2018 12:39:30 +0100
-Subject: [PATCH] Add a define so that gir compilation succeeds
-
-For some reason meson 0.49.0 does not anymore pass global arguments to gir compiler.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/meson.build b/src/meson.build
-index 6ff8a6a..f0b2887 100644
---- a/src/meson.build
-+++ b/src/meson.build
-@@ -132,7 +132,7 @@ if get_option('with_introspection')
-         install_dir_gir: girdir,
-     install_dir_typelib: typelibdir,
-         export_packages: libdazzle_package,
--             extra_args: [ '--c-include=dazzle.h', '--quiet' ],
-+             extra_args: [ '--c-include=dazzle.h', '--quiet', '-DDAZZLE_COMPILATION' ],
-   )
- 
-   if get_option('with_vapi')
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.32.1.bb
similarity index 64%
rename from meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
rename to meta/recipes-gnome/libdazzle/libdazzle_3.32.1.bb
index c112857f2c8..dac59f86b31 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.32.1.bb
@@ -7,9 +7,8 @@ inherit gnomebase upstream-version-is-even vala distro_features_check gobject-in
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
-SRC_URI += " file://0001-Add-a-define-so-that-gir-compilation-succeeds.patch"
-SRC_URI[archive.md5sum] = "24e2e1b914a34f5b8868a9507d1f3c4c"
-SRC_URI[archive.sha256sum] = "78770eae9fa15ac5acb9c733d29459330b2540affbf72933119e36dbd90b36d5"
+SRC_URI[archive.md5sum] = "5f6455ebc47e86f63b9579997137f391"
+SRC_URI[archive.sha256sum] = "238da19fdcc3ae9bb0c2d781d099fb8c6ec70c4dd3dffad80d230344ecc3f972"
 
 GIR_MESON_OPTION = 'with_introspection'
 
-- 
2.17.1


