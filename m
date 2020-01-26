Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3CF95916D2
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:10 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id q13so2870211pls.1
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=efXC+8QLdDE8bP0Qi4Au5dGKyq4R//3u3OncyFq0Wd8=;
	b=OFs2gb29XUblevc0MsakFwVQoiDHdEu6QpsR/6SAd9R0dge5BIEBiz13TwjN48lWyl
	4NjkEpSJ/2sOypNZodnMkPUCX/2fAOdnlwfXr5iCUpvt/48dHA1TLo/2gmLmJyzBP1Nx
	QzeGl1j/kOG5ZuI22uSPNhVuCGFSHn4RZBoWKM8TiUXfCAXYA7xE9XcmlTOpBb7z/s/I
	j35hAXNtURuhD4X0lzb10XciIHrDRc7+LDFdRn6gRvIyEagGcyW+B69bGQZOjrfD5UNP
	uIbCfvVcCeIfnZYEU3M18S+hxAMlsJiOgq1QeLKgylGAA00rSaKzdO9YecuGYf8jZe1c
	zBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=efXC+8QLdDE8bP0Qi4Au5dGKyq4R//3u3OncyFq0Wd8=;
	b=JThy1xGHcvNuuk2aG1aKwCGn1TnOZqhxIYSSDCp9MmGf3cClwjP8TzfqPQXVt3Goxb
	zefn5OwPwwQ3ldhD8GUI0fVVI5xvM1QQ9hLzigc6Ly6tKWGnJlxSzRFBuFCYuembChYz
	c+o2SL30FQ+Bgi9gsOvUA8Dl+oBLqTQI+OHjPW3jb7KpVf2i1o0pdWrpWVXgYrGnQCvd
	QnvAIXNo4MglST+qaU3cVep6pu5K5zeJbsjuDo9pEIOsnhCa9ePDPacW7qUseR+FHag6
	x9MIcqTYleEmFvKRqUHNh/xToySrtxAWTttuJPrgrqM6xK/da2QjGv6yYF+eaFjAGTAq
	KF9A==
X-Gm-Message-State: APjAAAV5N5XvpCT6hYr1i/rXPlWNYLOcBs+dx28RjoQWTaJbmiIQ4ZvO
	O3uWGQiQfzy4x6HdDgU44cL2Pf8Z
X-Google-Smtp-Source: APXvYqzchYXzqB/lNLzilG8w8SRVO2NWzXUVba03kEBD8HkheI+AyaNmOHTsrk8vMEK/KDdSyJkEnQ==
X-Received: by 2002:a17:902:44d:: with SMTP id
	71mr13383220ple.95.1580055911258; 
	Sun, 26 Jan 2020 08:25:11 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.10
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:43 -0800
Message-Id: <7f8f018ea5ef6ecb80c5b5250df90a8b690e6f47.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 18/29] sysstat: fix CVE-2019-19725
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:10 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../sysstat/sysstat/CVE-2019-19725.patch      | 28 +++++++++++++++++++
 .../sysstat/sysstat_12.1.3.bb                 |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
new file mode 100644
index 0000000000..2aa12724f8
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
@@ -0,0 +1,28 @@
+From a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed Mon Sep 17 00:00:00 2001
+From: Sebastien GODARD <sysstat@users.noreply.github.com>
+Date: Mon, 9 Dec 2019 17:54:07 +0100
+Subject: [PATCH] Fix #242: Double free in check_file_actlst()
+
+Avoid freeing buffer() twice.
+
+Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/a5c8abd4a481ee6e27a3acf00e6d9b0f023e20ed]
+CVE: CVE-2019-19725
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ sa_common.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sa_common.c b/sa_common.c
+index cf52aefe..856a3715 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -2153,6 +2153,7 @@ void check_file_actlst(int *ifd, char *dfile, struct activity *act[], uint64_t f
+ 	}
+ 
+ 	free(buffer);
++	buffer = NULL;
+ 
+ 	/* Check that at least one activity selected by the user is available in file */
+ 	for (i = 0; i < NR_ACT; i++) {
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb b/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
index 5daf3f45f5..1b552166b0 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.3.bb
@@ -2,7 +2,9 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
+            file://CVE-2019-19725.patch \
+"
 
 SRC_URI[md5sum] = "0f9b73f60aba6fd49de346bc384902c3"
 SRC_URI[sha256sum] = "55498bf82755ba9fed3e7df61fd26f8f50dd3e7b3b229c731029a4c8ab51a1aa"
-- 
2.17.1


