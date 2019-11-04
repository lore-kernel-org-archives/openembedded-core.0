Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2E667F8C1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 16:09:12 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id r7so9573428ljg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Nov 2019 08:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=eAE3HTgLK2cWSoXvK8IGRu+Ej466MPDsUMDu0S3ADUA=;
	b=vhL2xZozVG67+pbpWS/G8R0dVW/TWGlgNMTUwwBysxZsGiAAoWWNccwV6hW2UzVShe
	KHVWJ+C9zl8xTlUfSrD4O+LJtv96C0GAN6w1snzIPaZvegrQV+hb7hHinRCw1U9o7VPd
	hbfmOpn2m1+RcJUyKwKcaRSdJouBiqgvTH1EM0vmCl0v9XkODFIxLpfJseMymleIwbxG
	UuaZSw0pyV9ckV/goJReg1c36EUyfMk2Z90SXglAP8zYLtICQqoB1LdbVfpuNMsTZdLn
	9oPLwr61LwLyYg1zFlxI/IJnQu8wzAb7DnPO5Bz4hWeoToXCY2Kdo0ls+85owVbNlo/M
	tpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eAE3HTgLK2cWSoXvK8IGRu+Ej466MPDsUMDu0S3ADUA=;
	b=cIKsScW9ZWWPfoDoVzKVIYZhZsTQUDYgpOTDPNSpLNGXyeCM0mEw1lM9Fjy49/5W9c
	VV2cu1zAs/jvl79XV7F4X8cXRF8pOJRWprJDWQjtmNcs4YzkDxIF5YSIR0fI0KhRwvbv
	2hlUyZ8Gyk0p11xXLqiEdwAQJs4vOiwlZzEzZGpLU6PcPNtz4MWrIhjfoR7sXaOZv7Gg
	Tu766MNU2/Fu9o4kbrbH/JZVWUQVCmAQhqbTz2TIymizlxJ/LiwhiWQcYDePXGCkUcHK
	bRWdzgOiRnDqDq3/k6+WYrGfsyWPpnunBAOcvtXdOlXcAtZkGhyuJsMN7WBk+BzFOYwT
	RJPg==
X-Gm-Message-State: APjAAAWCCAWC44StRPsnJBHpqry6x5sdBSpPWj8jF0siY83KvZzdflGd
	mKW8hgLZawk9dnE3lna01CTwkxTtCbs=
X-Google-Smtp-Source: APXvYqzpitFlrhedkW4YOJm7iKtZt8105U3ZbCpjixTEjbNtzbuV7S+qumAw3g7JdFkkEe/fmAQ0LQ==
X-Received: by 2002:a2e:91ca:: with SMTP id u10mr17842698ljg.208.1572883752708;
	Mon, 04 Nov 2019 08:09:12 -0800 (PST)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	k68sm9497897lje.86.2019.11.04.08.09.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 08:09:12 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Nov 2019 17:09:09 +0100
Message-Id: <20191104160909.11332-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] git: update to 2.24.0
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
X-List-Received-Date: Mon, 04 Nov 2019 16:09:13 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-devtools/git/git_2.23.0.bb | 11 -----------
 meta/recipes-devtools/git/git_2.24.0.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.23.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.24.0.bb

diff --git a/meta/recipes-devtools/git/git_2.23.0.bb b/meta/recipes-devtools/git/git_2.23.0.bb
deleted file mode 100644
index 1539182a90..0000000000
--- a/meta/recipes-devtools/git/git_2.23.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "203c238ffdcef76f9bd6c67cfbaf949f"
-SRC_URI[tarball.sha256sum] = "e3396c90888111a01bf607346db09b0fbf49a95bc83faf9506b61195936f0cfe"
-SRC_URI[manpages.md5sum] = "90a72e553de712d798d68b15b57bc928"
-SRC_URI[manpages.sha256sum] = "a5b0998f95c2290386d191d34780d145ea67e527fac98541e0350749bf76be75"
diff --git a/meta/recipes-devtools/git/git_2.24.0.bb b/meta/recipes-devtools/git/git_2.24.0.bb
new file mode 100644
index 0000000000..e9cb382f69
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.24.0.bb
@@ -0,0 +1,11 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.md5sum] = "ed39361a3ae362c8af852d1a06992bc2"
+SRC_URI[tarball.sha256sum] = "ad11030d2eac656ee9e8862f56d1610550f7867181beff814c7712a99192e99d"
+SRC_URI[manpages.md5sum] = "57465e83f13ba910a178b717d93958c0"
+SRC_URI[manpages.sha256sum] = "ce995f86f441b56ab1fd0788a94786904ae2e2989e7191fd68060003011366d7"
-- 
2.17.1


