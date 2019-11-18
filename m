Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DDD157F9B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:31:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f3so19084540wmc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=T+TWollnVngE00srvRa41IbAUwIVqoyzKyBrVm50wLI=;
	b=r9ZMozXt2B/HAAv+Esl5t0wxjyGop8a9O0tvEtISqRhXBHddnhepPhtKezHFnuz8Mi
	+T/xNZVZiOL6CIQ9bSAQjBo87USseRoyORjhPQB0LI3N87OeTsy+OZ1M1XVc19eHeBpt
	fhKf6Pi39Ugo6H7l8TzAYyTZCnkAKWtdbS8dGGu2aHqEHWo0NKxT2Fclr4C0YxVtDaG0
	hb8i+1JgtMflPL3mSkND8qIf8PvMTHlffxhm7lUkXiGEjD0b4KBqJXC+f98eSsx/46LD
	4Fa/lZ35TlGT5iRDu7RR2IsFhJ+OEI+oMlXkX0Vsq7FK5/L0s0113EYnp5sifM4+8YrQ
	IoDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=T+TWollnVngE00srvRa41IbAUwIVqoyzKyBrVm50wLI=;
	b=UucqiD0CQjxjTl0p/1hQIxtUwCUm5ropY7igWeHsRmOxD3XzkpFXNH7fpyPseGcBed
	eXI38/e35GD3WOS27orSQWXi5VGOOOPcX2By2VnNu/HgAc02iWfx7PFo2vSfxe19jCPM
	oJzRIU657QBH/qv95Yl+zse/WHrp4Ca/id3hBzmoI4bqv1gH7+Sy8jF1K1GU5E9rnxXK
	V91HktGc2sy2WRdGGGJ5qmTvWlGbCfNi+fYaEvoLcFoixOXe0/AVmZiTTFvXBVhhm0cU
	coyVu1bKdN0Yo3sx6XLeH4OcdN8VURBKK8fmhx9p4ymMzgfShaJisEwZh2CtZGQ822wc
	/vSw==
X-Gm-Message-State: APjAAAUHCR45ryiw4dGUElcoMuk5r94bYOyjXrDHyvXyLaUHCApMg6av
	AuDgiR2fZmWTvsuMzRk9ghmPOwRI
X-Google-Smtp-Source: APXvYqygvGhhmxVVCmR7qoDHOrObnfunZQ+qTmwfUm+QcwzbN4hxgQK0B70e2ENQ1/X/Tm0HMChXag==
X-Received: by 2002:a1c:5f04:: with SMTP id t4mr27599577wmb.23.1574087508441; 
	Mon, 18 Nov 2019 06:31:48 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.31.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:31:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:46 +0100
Message-Id: <20191118142852.22981-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2019 14:31:48 -0000
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


