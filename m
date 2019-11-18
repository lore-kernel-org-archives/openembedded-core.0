Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 921B47F939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i12so19400535wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T+TWollnVngE00srvRa41IbAUwIVqoyzKyBrVm50wLI=;
	b=GAMs7Vcb9XhAB6OBXe/h2PzFaaRuFDIYD7wByrns+PE4QA1YkpOM2GUBDMwepayuBI
	7t4oYKT4IbEQdrf2EBGbR+VjIE8HVDO0XrrYRaYyN5u5YRqhCOvWgUYq+tPzXaIQDkEh
	eUKEOjrhnoaHrLij72gzuVJhPaQrf3aZ+EmXkM9VL8ahjSm4vk1JOyKxwB0yw01t5wxZ
	orstWaWpXLvGr7xvVvpywwtty1ELFhk/mN9xAaqtqxyQDDEpOgTNRtWJUii90gw0PC0s
	2T3wxaH1jp7wIFzsLnDVp+fKMEDt8JQIMu7P0bxTfWKN3HRdDA1Mz9jEmUk3ufjVoD1r
	b+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T+TWollnVngE00srvRa41IbAUwIVqoyzKyBrVm50wLI=;
	b=IPCV1V9z0LvY6WDjnk0HJGPYNArQ5owKBNICYNcAO9eSIFzvmk0EO5E19jZlt1RjB8
	FSrlYwP7rNXbk0oVOaSzxN3RgRhnsiCsJessB4cGW7Mh53Mct+cFIXzWQ/xmsXvqR9zh
	67tx8T6CNS5TvuaG9RQ4XLt/B/pXwSWxXjx5t+w4B+wjhte5IZubsrFPp6FRQ+0Uttkk
	NjkNsbEMoa0I1r/lY5YCCCS3aoKS0hrLQRGISVeD5xN/IO6i/48yNl+SliFTWsy8zmZ2
	uX/w/GBQr1keMv09lZNW2D4/SVG3GcXbR68B3ohUJjOesqVNWQlsuRCVxILndqA3p01/
	LV/Q==
X-Gm-Message-State: APjAAAWEi0v4nB4hyXstlEW+VS4pLS1PqSVyyKDYuECbupy9w5piYGBB
	fxajd7VDZIUD7rPvVyh09wc3YJlq
X-Google-Smtp-Source: APXvYqzBjV/oEmtKXsCX4d434NVLpKrAPn6PATN31p23dZKAIW2nsxrwACA76qk9ZpzZ7ptGWxlLtg==
X-Received: by 2002:adf:81e5:: with SMTP id 92mr29593282wra.41.1574082509041; 
	Mon, 18 Nov 2019 05:08:29 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:55 +0100
Message-Id: <20191118130801.21860-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] psmisc: update to 23.3
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...am-create-src-directory-before-attempting-t.patch | 12 +++++-------
 .../psmisc/{psmisc_23.2.bb => psmisc_23.3.bb}        |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_23.2.bb => psmisc_23.3.bb} (87%)

diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
index 4d44495fd3f..9451303dd7b 100644
--- a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
@@ -1,4 +1,4 @@
-From 285877b7761d74736aca2687ed9bef2f78b82c33 Mon Sep 17 00:00:00 2001
+From dac375f640fecd45e6254a8d870ee37ec8f41670 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 2 Nov 2017 16:21:22 +0200
 Subject: [PATCH] Makefile.am: create src directory before attempting to write
@@ -8,23 +8,21 @@ Otherwise out of tree builds will fail.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 9f61ab4..b4ced7f 100644
+index 441ae94..882969d 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -79,7 +79,7 @@ EXTRA_DIST = src/signames.c README.md
+@@ -86,7 +86,7 @@ EXTRA_DIST = src/signames.c README.md misc/git-version-gen
  CLEANFILES = src/signames.h
  
- src/signames.h: src/signames.c Makefile
+ src/signames.h: src/signames.c Makefile src/$(am__dirstamp)
 -		export LC_ALL=C ; \
 +		export LC_ALL=C ; mkdir -p src ; \
  		@CPP@ -dM $< |\
  		tr -s '\t ' ' ' | sort -n -k 3 | sed \
  	's:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9][0-9]*\).*$\:{\ \2,"\1" },:p;d' | \
--- 
-2.14.2
-
diff --git a/meta/recipes-extended/psmisc/psmisc_23.2.bb b/meta/recipes-extended/psmisc/psmisc_23.3.bb
similarity index 87%
rename from meta/recipes-extended/psmisc/psmisc_23.2.bb
rename to meta/recipes-extended/psmisc/psmisc_23.3.bb
index 38e0a440587..b3c3c7e5a84 100644
--- a/meta/recipes-extended/psmisc/psmisc_23.2.bb
+++ b/meta/recipes-extended/psmisc/psmisc_23.3.bb
@@ -6,5 +6,5 @@ SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
            file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
 	   file://0001-Makefile.am-create-src-directory-before-attempting-t.patch \
            "
-SRCREV = "44eab9a3a63394eae6b79a7ef0a042f57e0c8a8f"
+SRCREV = "78bde849041e6c914a2a517ebe1255b86dc98772"
 S = "${WORKDIR}/git"
-- 
2.17.1


