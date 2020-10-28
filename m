Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.3906.1603919181935385190
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cWfxV0oa;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id dg9so899505edb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZxIMw0Xq4l+BABO9HrqWftIad43+bsAqtxqt3Ck789o=;
        b=cWfxV0oaUXo7cY4EHX6jZZ4IJ08kymFYxXs5h2t2a7Gz/HHXoxS1+6Ax72J0ZzBMhM
         JqcJZKhZcresH9aly5JZ01PmaJVQ9hWg8Ipk83RDqR1QmuhIqfdDo0y1K7IWzQhIDDvz
         yMjHcrz59ZP1foFnOvyL60VnuU5oLLJ5LTgaP6ix2jYWNTFy6a263zAg6t/5mI8f7QEP
         /afVSui6G6yU4ZHVwW2Nfg7pbxJHE+zRSuforarazHRAHhKfrxBqzPPz9LOSJqNKn+/Q
         gzN6++K9g9Z+EFPMgtHRoF4Le1jm2vyMwn4QS2CUJIn+oLZVrD1UlsG7BwMPaSMkLbIh
         V2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZxIMw0Xq4l+BABO9HrqWftIad43+bsAqtxqt3Ck789o=;
        b=UZAlgwVShoHZml0XcrbMw8EoJ0+mtWrJxb8rL8mgKmHBtuM6Kjj7ejloDxafnnAZHT
         1Q//PYKgEMN6S3huz7ZJi2X0wCi0E/zCyAvI6uYY6bvy0nJ8rBJmeDICnkg2tLOYo2FV
         piv7XG7Hmc5xfBOysUC1amt8N6NHxim0Rp09t+P0+lAynIiMQ/8cgBw2bFKTPshirhe4
         UvK4PYPUa9qKwhwJlliKAOrzZfstxU8vCA7FC7yfPJEg+zEVt+paHIkTD6vzOzIk8XgK
         Ng4BNi49kRAqnP9D1cgVh26HkwRertmC0HFkMKdc9Owe0aFyj1Ih13WWNllZhbblP7fr
         j36w==
X-Gm-Message-State: AOAM530MW5bkP24HCYBCmAE/38tKwCz5cMrfnH20+uPQfXhRGnPEu8O+
	9Jr9OHcRY4Er74p+bPd1YhHpnDINsNtWKQ==
X-Google-Smtp-Source: ABdhPJw1PqNnTm2fyVUtXjbIqbGG5DjIEAdwj6FlFioYxVzgxIzySIBAEF+iqO4BGUabcg05UH0x3A==
X-Received: by 2002:aa7:c58f:: with SMTP id g15mr802480edq.99.1603919180160;
        Wed, 28 Oct 2020 14:06:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/33] libsecret: update 0.20.3 -> 0.20.4
Date: Wed, 28 Oct 2020 22:05:41 +0100
Message-Id: <20201028210558.21070-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the patch as it is merged upstream.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-meson-add-option-introspection.patch | 137 ------------------
 ...ibsecret_0.20.3.bb => libsecret_0.20.4.bb} |   5 +-
 2 files changed, 1 insertion(+), 141 deletions(-)
 delete mode 100644 meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.3.bb => libsecret_0.20.4.bb} (81%)

diff --git a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch b/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
deleted file mode 100644
index 51ee66f42b..0000000000
--- a/meta/recipes-gnome/libsecret/files/0001-meson-add-option-introspection.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-meson: add option introspection
-
-Add an option 'introspection' for meson which could control whether
-build GIR files or not.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/53]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- libsecret/meson.build | 86 ++++++++++++++++++++++---------------------
- meson.build           |  1 +
- meson_options.txt     |  1 +
- 3 files changed, 46 insertions(+), 42 deletions(-)
-
-diff --git a/libsecret/meson.build b/libsecret/meson.build
-index 759b5ef..2ee8850 100644
---- a/libsecret/meson.build
-+++ b/libsecret/meson.build
-@@ -104,50 +104,52 @@ libsecret_dep = declare_dependency(
- )
- 
- # GObject Introspection
--libsecret_gir_sources = [
--  'secret-attributes.c',
--  'secret-attributes.h',
--  'secret-backend.c',
--  'secret-backend.h',
--  'secret-collection.c',
--  'secret-collection.h',
--  'secret-item.c',
--  'secret-item.h',
--  'secret-methods.c',
--  'secret-password.c',
--  'secret-password.h',
--  'secret-paths.c',
--  'secret-paths.h',
--  'secret-prompt.c',
--  'secret-prompt.h',
--  'secret-retrievable.c',
--  'secret-retrievable.h',
--  'secret-schema.c',
--  'secret-schema.h',
--  'secret-schemas.c',
--  'secret-schemas.h',
--  'secret-service.c',
--  'secret-service.h',
--  'secret-types.h',
--  'secret-value.c',
--  'secret-value.h',
--]
--libsecret_gir_sources += version_h
--libsecret_gir_sources += _enums_generated
--
--libsecret_gir = gnome.generate_gir(libsecret,
--  sources: libsecret_gir_sources,
--  namespace: 'Secret',
--  nsversion: api_version_major,
--  export_packages: 'libsecret-@0@'.format(api_version_major),
--  includes: [ 'GObject-2.0', 'Gio-2.0' ],
--  header: 'libsecret/secret.h',
--  extra_args: [ '-D SECRET_COMPILATION'],
--  install: true,
--)
-+if with_gir
-+  libsecret_gir_sources = [
-+    'secret-attributes.c',
-+    'secret-attributes.h',
-+    'secret-backend.c',
-+    'secret-backend.h',
-+    'secret-collection.c',
-+    'secret-collection.h',
-+    'secret-item.c',
-+    'secret-item.h',
-+    'secret-methods.c',
-+    'secret-password.c',
-+    'secret-password.h',
-+    'secret-paths.c',
-+    'secret-paths.h',
-+    'secret-prompt.c',
-+    'secret-prompt.h',
-+    'secret-retrievable.c',
-+    'secret-retrievable.h',
-+    'secret-schema.c',
-+    'secret-schema.h',
-+    'secret-schemas.c',
-+    'secret-schemas.h',
-+    'secret-service.c',
-+    'secret-service.h',
-+    'secret-types.h',
-+    'secret-value.c',
-+    'secret-value.h',
-+  ]
-+  libsecret_gir_sources += version_h
-+  libsecret_gir_sources += _enums_generated
-+
-+  libsecret_gir = gnome.generate_gir(libsecret,
-+    sources: libsecret_gir_sources,
-+    namespace: 'Secret',
-+    nsversion: api_version_major,
-+    export_packages: 'libsecret-@0@'.format(api_version_major),
-+    includes: [ 'GObject-2.0', 'Gio-2.0' ],
-+    header: 'libsecret/secret.h',
-+    extra_args: [ '-D SECRET_COMPILATION'],
-+    install: true,
-+  )
-+endif
- 
- # Vapi
--if with_vapi
-+if with_vapi and with_gir
-   libsecret_vapi = gnome.generate_vapi('libsecret-@0@'.format(api_version_major),
-     sources: libsecret_gir[0],
-     metadata_dirs: meson.source_root() / 'libsecret',
-diff --git a/meson.build b/meson.build
-index a26d046..d22e008 100644
---- a/meson.build
-+++ b/meson.build
-@@ -22,6 +22,7 @@ with_gcrypt = get_option('gcrypt')
- enable_debug = get_option('debugging')
- with_vapi = get_option('vapi')
- with_gtkdoc = get_option('gtk_doc')
-+with_gir = get_option('introspection')
- 
- # Some variables
- config_h_dir = include_directories('.')
-diff --git a/meson_options.txt b/meson_options.txt
-index c1fda5d..445aeb0 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -3,3 +3,4 @@ option('gcrypt', type: 'boolean', value: true, description: 'With gcrypt and tra
- option('debugging', type: 'boolean', value: false, description: 'Turn debugging on/off')
- option('vapi', type: 'boolean', value: true, description: 'Create VAPI file.')
- option('gtk_doc', type: 'boolean', value: true, description: 'Build reference documentation using gtk-doc')
-+option('introspection', type: 'boolean', value: true, description: 'Create GIR file.')
--- 
-2.17.1
-
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
similarity index 81%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
index 533015a1e4..96f6460181 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
@@ -13,10 +13,7 @@ inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI += "file://0001-meson-add-option-introspection.patch"
-
-SRC_URI[archive.md5sum] = "47c3fdfeb111a87b509ad271e4a6f496"
-SRC_URI[archive.sha256sum] = "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
+SRC_URI[archive.sha256sum] = "325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
 
-- 
2.29.0

