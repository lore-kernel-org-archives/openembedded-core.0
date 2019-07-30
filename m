Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id EC7E27F332
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 15:54:42 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id n9so41266256wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9z/9kGMshOlFDMD+VZ+odiSzwWbQcJphRkNyLxFxTHc=;
	b=PHRk0gz8bSS349Hlj07FtX2Stp0LW8MaqcRRxMfLk4rwXImXTca/5zmpzxBQUW3YcN
	mWXVr1mT9pqShBik87J4FhvxtTPL/LhQKAw/goWENRHR8dkkdBeQ+cQKYp4JW8aIvGkT
	1Ne+UJfIuRZADKmsUAsLaSkimA6pgT2lEl5EenxySHRdL//4BWl4slDlJ1Rgv1lII9Qw
	ggToOi74JvLQsIae1TjGba5SIG0jzUSKpJxw4JMlu2R0f4APGGl2LGT6zgcvRSF0Ni/C
	ZOIis9cAugt1g+pxNafxmfZlxgzmBcEmuzjYgRZOi1L0zrYVuln5K9gRepqrqjjOBlE8
	aTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9z/9kGMshOlFDMD+VZ+odiSzwWbQcJphRkNyLxFxTHc=;
	b=Qbz7+4E4L5uzBd+LrYPpdxHIJaNO/goHRGPzYYzGf4itlV3vcYUymtvEmWTEL5iG9M
	aH7oCTBTU5ymAdO1frKogWEAyFlwlbVL5C5s4XV+wwLsmyCmnxh7WvcL0O1vlvpyK7AK
	gClk6ucoZ+0sxIL/KLRIDG6+THcVV9A2HzBlr/fwXKYkCJJSuaGNvC8I1eTDyPhEQDWc
	5cMawDSxPxtrXitbR34Zc+T0NkMZF8W4Cu3fR3mcxKsB0JwsMst2KYztPn1R9jaSQdP7
	UP/ah3MjC/lzUKnI+IwpV+AV5kSUmkpLTdBzWuAGHeE911j0sTGm5A4OlUG9vstxWnku
	vZMA==
X-Gm-Message-State: APjAAAW8Yj/NWsMJl/Ml1ZZEZnQG4CtVMhJsLepCYmcsNnj2Q7o9ByUr
	gNrpF02a5KSyZFbwci2/K4F4KXHn1bg=
X-Google-Smtp-Source: APXvYqxc8fuGKdVMMfdnNH+WQC936Phz6raiYfrl+yYIYLKhAOTBXTvYt7qjAG8XuqjHnbwkWgsDug==
X-Received: by 2002:adf:ef08:: with SMTP id e8mr39167762wro.209.1564502083398; 
	Tue, 30 Jul 2019 08:54:43 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c3sm70781403wrx.19.2019.07.30.08.54.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 08:54:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 17:54:28 +0200
Message-Id: <20190730155432.96611-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190730155432.96611-1-alex.kanavin@gmail.com>
References: <20190730155432.96611-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/8] libmodulemd: update to 2.6.0
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
X-List-Received-Date: Tue, 30 Jul 2019 15:54:43 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...n.build-do-not-generate-gir-or-gtkdo.patch | 26 +++++++++++--------
 .../libmodulemd/libmodulemd_git.bb            |  4 +--
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
index a3e62bf52ca..0b7535624c9 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-modulemd-v1-meson.build-do-not-generate-gir-or-gtkdo.patch
@@ -1,4 +1,4 @@
-From b77c9c3d07430b014b2d1bff42027f483c81f15a Mon Sep 17 00:00:00 2001
+From 4a2a592c5a3898df37ff231d9c410f0fd32f5d5d Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:43:00 +0100
 Subject: [PATCH] modulemd/v[12]/meson.build: do not generate gtkdoc or python
@@ -10,13 +10,13 @@ Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- meson.build             | 3 +--
- modulemd/v1/meson.build | 8 --------
- modulemd/v2/meson.build | 8 --------
- 3 files changed, 1 insertion(+), 18 deletions(-)
+ meson.build             |  3 +--
+ modulemd/v1/meson.build |  8 --------
+ modulemd/v2/meson.build | 12 ------------
+ 3 files changed, 1 insertion(+), 22 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 228bd34..a1e60bb 100644
+index 5a0cd3d..f51b16e 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -52,7 +52,6 @@ gnome = import('gnome')
@@ -27,17 +27,17 @@ index 228bd34..a1e60bb 100644
  
  sh = find_program('sh')
  sed = find_program('sed')
-@@ -110,4 +109,4 @@ configure_file(
+@@ -127,4 +126,4 @@ configure_file(
  )
  
  subdir('modulemd')
 -subdir('bindings/python')
 +
 diff --git a/modulemd/v1/meson.build b/modulemd/v1/meson.build
-index 74db89a..4d54e69 100644
+index ddc95a1..e85fafd 100644
 --- a/modulemd/v1/meson.build
 +++ b/modulemd/v1/meson.build
-@@ -341,11 +341,3 @@ configure_file(
+@@ -356,11 +356,3 @@ configure_file(
    configuration : xcdata
  )
  
@@ -50,10 +50,10 @@ index 74db89a..4d54e69 100644
 -)
 -
 diff --git a/modulemd/v2/meson.build b/modulemd/v2/meson.build
-index 7b94e0c..c5f72b9 100644
+index 93c7fbd..0d9ed24 100644
 --- a/modulemd/v2/meson.build
 +++ b/modulemd/v2/meson.build
-@@ -530,11 +530,3 @@ configure_file(
+@@ -285,15 +285,3 @@ configure_file(
    configuration : xcdata
  )
  
@@ -62,6 +62,10 @@ index 7b94e0c..c5f72b9 100644
 -    install_dir: 'modulemd-2.0',
 -    src_dir : './modulemd/v2',
 -    main_xml : 'modulemd-v2-docs.xml',
+-    gobject_typesfile : join_paths(meson.current_build_dir(), 'modulemd-2.0.types'),
+-    dependencies : [
+-        modulemd_v2_dep,
+-    ],
 -    install : true,
 -)
 -
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index 7e8aea7be3a..9ac7e140ab6 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -8,8 +8,8 @@ SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0001-v1-meson.build-explicitly-specify-the-v1-library-in-.patch \
            "
 
-PV = "2.5.0"
-SRCREV = "8d9a99ddf037df7c032119cdd3a87238a3cc9090"
+PV = "2.6.0"
+SRCREV = "7c7f88258491866cdb86d26cadfce37a78f242ec"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


