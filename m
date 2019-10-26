Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 02E007FA9A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:05 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v3so5716438wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oLOwbLMFJl9WuI3+fUkyXiky9sDE3efCYUjzOltnQnE=;
	b=s2hSPdLAghphNKZzI8Rd4YVVWLmnPjAf+oDBaytlhSEfyHTvgBAviozgNaB7573mHW
	rZB8Ujnyp0XDVzojxDmpQAudGE+/vZg4t4Q3Mgi52m66ojxtQvGx5V+VtgUXclYF1ugG
	E42xwcm5TaDK3TMByFS0W8eZR2W/LoVe5rc4zlpextKLiWmOfmKa9bNo4Ve00/OVbmB5
	kPNsn2/qMuLrR4AgEjZLgDifgEsnwGVPwJSaJuNPG3Ilt6F1rQamqmwvdeLa1jcbrpZD
	/s8SCj3nq0FYv2wbnqlbI3mq7lkXG3zK8bPK8qBoN+PaJO3inUfR0XjlaUoOwgzoDFLn
	Fl3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oLOwbLMFJl9WuI3+fUkyXiky9sDE3efCYUjzOltnQnE=;
	b=YRoIfIjSMRZCkEWtKxEr05tDMP4c/4mGruqBqbALbIL+U7ReYmNZRQZgSw/6ScAiZ6
	egPMvM+nzdc7kIKr9SboV8VGYBkyXRQCdM64yH65a3MKD7pJsSLyvvSV/0MC1h/knVcH
	U3Orr7Cs5ZI+h9gStHOc9f7wBe710dwmkUD2uKRvtNFGzLaOb2Bp2QUbsP+FSpwMstDQ
	aJOoPQtg2S45qIj0LcVaGLqvRn8DRYMkchZXHMBwAGzYuWTEDNmkeTHXRX/vH499Yc1u
	wcMFlhLLlZyW/IJXUNLLG9pV6quXhHZR4Lel+5u/xXQ+aDuhMTxWQLIu6tuEJAteYu2n
	/yIw==
X-Gm-Message-State: APjAAAWdxaQKzm8wNBr6Tz7U4QYETT6cx4qoC+HhtROrCiVhUeHJGg41
	lKTCctp9J4xjretdGP5dqAN1jfMBpTI=
X-Google-Smtp-Source: APXvYqzf792UZsuoVhA9mLGrm/yPlaxTCBJb705C+SOc2qn5L7uVeDt2ZccFHOXI+SH7aD3tXF4qBQ==
X-Received: by 2002:a1c:6702:: with SMTP id b2mr6362070wmc.107.1572072606482; 
	Fri, 25 Oct 2019 23:50:06 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:05 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:34 -0700
Message-Id: <7ed241ff1f93c623a3b3030249c09f7c3c429a46.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 02/28] aspell: fix CVE-2019-17544
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:06 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport CVE-2019-17544 fix to zeus.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-Fix-various-bugs-found-by-OSS-Fuze.patch  | 56 ++++++++++++++++++++++
 meta/recipes-support/aspell/aspell_0.60.7.bb       |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch

diff --git a/meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch b/meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch
new file mode 100644
index 0000000..259075b
--- /dev/null
+++ b/meta/recipes-support/aspell/aspell/0001-Fix-various-bugs-found-by-OSS-Fuze.patch
@@ -0,0 +1,56 @@
+From 80fa26c74279fced8d778351cff19d1d8f44fe4e Mon Sep 17 00:00:00 2001
+From: Kevin Atkinson <kevina@gnu.org>
+Date: Sun, 4 Aug 2019 04:20:29 -0400
+Subject: [PATCH] Fix various bugs found by OSS-Fuze.
+
+---
+ common/config.cpp    | 2 +-
+ common/file_util.cpp | 1 +
+ common/getdata.cpp   | 2 +-
+ 3 files changed, 3 insertions(+), 2 deletions(-)
+
+Upstream-Status: Backport [https://github.com/GNUAspell/aspell/commit/80fa26c74279fced8d778351cff19d1d8f44fe4e]
+CVE: CVE-2019-17544
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+diff --git a/common/config.cpp b/common/config.cpp
+index 017e741..e117d3c 100644
+--- a/common/config.cpp
++++ b/common/config.cpp
+@@ -763,7 +763,7 @@ namespace acommon {
+       }
+       res.append(':');
+     }
+-    if (res.back() == ':') res.pop_back();
++    if (!res.empty() && res.back() == ':') res.pop_back();
+   }
+ 
+   struct ListAddHelper : public AddableContainer 
+diff --git a/common/file_util.cpp b/common/file_util.cpp
+index 8515832..56ea501 100644
+--- a/common/file_util.cpp
++++ b/common/file_util.cpp
+@@ -181,6 +181,7 @@ namespace acommon {
+     while ( (dir = els.next()) != 0 ) 
+     {
+       path = dir;
++      if (path.empty()) continue;
+       if (path.back() != '/') path += '/';
+       unsigned dir_len = path.size();
+       path += filename;
+diff --git a/common/getdata.cpp b/common/getdata.cpp
+index 7e822c9..1b04823 100644
+--- a/common/getdata.cpp
++++ b/common/getdata.cpp
+@@ -64,7 +64,7 @@ namespace acommon {
+   char * unescape(char * dest, const char * src)
+   {
+     while (*src) {
+-      if (*src == '\\') {
++      if (*src == '\\' && src[1]) {
+ 	++src;
+ 	switch (*src) {
+ 	case 'n': *dest = '\n'; break;
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/aspell/aspell_0.60.7.bb b/meta/recipes-support/aspell/aspell_0.60.7.bb
index da99d12..b565cb3 100644
--- a/meta/recipes-support/aspell/aspell_0.60.7.bb
+++ b/meta/recipes-support/aspell/aspell_0.60.7.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 PR = "r1"
 
-SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/aspell/aspell-${PV}.tar.gz \
+           file://0001-Fix-various-bugs-found-by-OSS-Fuze.patch \
+          "
 SRC_URI[md5sum] = "8ef2252609c511cd2bb26f3a3932ef28"
 SRC_URI[sha256sum] = "5ca8fc8cb0370cc6c9eb5b64c6d1bc5d57b3750dbf17887726c3407d833b70e4"
 
-- 
2.7.4


