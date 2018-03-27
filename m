Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD056E650
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 14:13:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id a11so5536256pff.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=txOQ8j2+w23h+FOj7qKFIKaPZH/+FqeW+DczYkPrrIA=;
	b=KSmarZQAJ3gUQc3z7hUgDnRMlox2SY4si2zZhvzKShwjUowjlAMyZ6wRcT1SSruQJb
	2GjP/ghau0QTTUIM0Pds/SoZ6al+y/nLMSimeDhUzOOcfhdeIOQZzX6vqIL0Hr0ZmlhA
	J7PnNY8Kg80Cm13gszuOE+gBIiZaJnSPZcEWaKHUTEjuQbViUDWaBXkWMuPs1HGkJ2QH
	jduPutkbObTSl6Md/36igeNk/NB6LEE5Jfm6nneobx2UgDeGSBY91JB+ST10dmfq23ew
	37b7PM5BZt8RQc9ZNgLsUiaGk1dU5DJtwnb9V3J0/vwgaI+wKc5eDT9bIAx+HNjeY2E+
	4GUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=txOQ8j2+w23h+FOj7qKFIKaPZH/+FqeW+DczYkPrrIA=;
	b=JXHMsC/octk9wgO7uQcXrweggyRbr92+PV5h6ykgh/M8Qmpj4iQNnaRmxGaZ8cv+W8
	TQFFjuCOGo/FqsFGanO5+55xPZHBQqRZvEBFy+S9yhsqIiy9nchUd8D2A/+UEKR7k3tg
	tUd+ub6lEQTmAf3aTGe5zCGJsf6KG1ccvzTNX+53vXJ+a6dGh+Y8xzzWGLNX7Cva96x8
	FcirmBwF3P6BDdpdyIqTo9f2oTfS/uHvCq0Rfu/cXcIlQH0tFZkm8ZOqE+NzLGxJNKeI
	Cu4ZMn/I0Klhi369TcftPidr8MpTO/cD4obn4eSNiiyKjkoeRjeNCbZao2aox92glNTG
	qeHg==
X-Gm-Message-State: AElRT7Ghz4+u6OBrXW5KLgMTJ4gUXSQ1zYGFKAdiucLS2apLFio0LVSA
	/wKg7skYeU0f3QNwZMCkpnGXMg==
X-Google-Smtp-Source: AG47ELueOq6UwB80RbgT+x5cafM8akfnZMNpBC8SM+AvZE786XlnWwwyK0zKPZz/npPzzigKLE2o6g==
X-Received: by 10.101.64.7 with SMTP id f7mr11773569pgp.216.1522159991218;
	Tue, 27 Mar 2018 07:13:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:203c:a04e:87e9:791b])
	by smtp.gmail.com with ESMTPSA id
	i86sm3859790pfi.28.2018.03.27.07.13.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Mar 2018 07:13:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster@mvista.com
Date: Tue, 27 Mar 2018 07:13:09 -0700
Message-Id: <1522159989-22111-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [V3][PATCH] libshmfence: update to 1.3
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
X-List-Received-Date: Tue, 27 Mar 2018 14:13:10 -0000

From: Armin Kuster <akuster@mvista.com>

refreshed patch

[v2]
Remove dangling space in patch

[v3]
remove patch as changes on in update

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/libxshmfence/extensions.patch              | 17 -----------------
 .../{libxshmfence_1.2.bb => libxshmfence_1.3.bb}        |  4 ++--
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.2.bb => libxshmfence_1.3.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
deleted file mode 100644
index 4cc9e05..0000000
--- a/meta/recipes-graphics/xorg-lib/libxshmfence/extensions.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-With glibc 2.27 memfd_create is behind a _GNU_SOURCE guard, so call
-AC_USE_SYSTEM_EXTENSIONS to get that defined.
-
-Upstream-Status: Submitted
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/configure.ac b/configure.ac
-index 0c98875..ebf4dee 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
- AC_CONFIG_HEADERS([config.h])
- 
-+AC_USE_SYSTEM_EXTENSIONS
-+
- # Initialize Automake
- AM_INIT_AUTOMAKE([foreign dist-bzip2])
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
index 1df068d..f6f5fb2 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb
@@ -15,5 +15,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://extensions.patch"
 
-SRC_URI[md5sum] = "66662e76899112c0f99e22f2fc775a7e"
-SRC_URI[sha256sum] = "d21b2d1fd78c1efbe1f2c16dae1cb23f8fd231dcf891465b8debe636a9054b0c"
+SRC_URI[md5sum] = "42dda8016943dc12aff2c03a036e0937"
+SRC_URI[sha256sum] = "b884300d26a14961a076fbebc762a39831cb75f92bed5ccf9836345b459220c7"
-- 
2.7.4


