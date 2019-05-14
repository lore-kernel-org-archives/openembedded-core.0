Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id E5C4C7DF0B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 07:30:32 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 7so1639186wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 00:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MlbUE161WhrudfO5pVmfpramT6giB3aGM+9Pc0iDaFs=;
	b=lGX7Uqrpix6GF8LPfBFldRReO/YbWVymosRlQjij+scOT3eoOCyQyvK0QYwTi15eqv
	UrucxbHMrreKpcqiwyrjJlDq//s1h2RhFzvR+gCWjONcvSreVejea0McQFwxR+ORoFbb
	2AQzq64PzZcVleYcYXGuBDTD5mH6TKPeI9lFFetj40VSi0l/MRNUf6jQhYHjh9nNFBJa
	3SWkUn1N1LP2WZHv8g7ebRCNTT5UZETiAyRCpQTHQTTKEkIctSJM5LW6Cs4J/cU5ZwO4
	rYDFuHCC2H0UzqzbIRRq1f8zoZm9A+POHpvsfLnNx7dMKqnWQzAq5RXEYq5Wg1a8C3XG
	6AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MlbUE161WhrudfO5pVmfpramT6giB3aGM+9Pc0iDaFs=;
	b=YGGyJLWzLH/B/6V0U9C/6SBppkXOqxFRZdwHtRXIMh1+uCqULe2ZLiNNAamAACqA6Z
	wzYy2raJoggJFrEKiB7UDBa0INn1pZXq+NbuUV25gMnH4Lo+hmHETBzfb34yyYZ8gt5i
	K7KwC0PtVzQU95YjBnNfbJxaIzeoKr2FHm+G0q+FRS2kiuiW0h2pGS74tk2a0HPzuKAb
	XmlfCOIevXJdU3MhBwrWEU4U6TYSuE2O65PtaZ1p+TXdDjMzetiToLkhofj4H6xTnj0U
	kyCp8fSuLFHaPf8AOLoSdv795hiAND8jTsbCU7O30HpaomErtJsaI2FvQKriHHUHxo0r
	CGug==
X-Gm-Message-State: APjAAAXNNCcqxZ3sn+MfvBkhtdLp81pSHY3NG5mUeNAMGRMMB5U6m71U
	XltPqrv0aChp6DGN4/znYfvW1g4t
X-Google-Smtp-Source: APXvYqy97xATdOMz8ts5MVQYIxATHIC1Y+cvJpUxHMPKQAYwFXtvaxLM2o3db5FATpOkhows/ZnmFA==
X-Received: by 2002:a1c:9d0f:: with SMTP id g15mr18787539wme.97.1557819033543; 
	Tue, 14 May 2019 00:30:33 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	t13sm23092076wra.81.2019.05.14.00.30.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 May 2019 00:30:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 May 2019 07:30:30 +0000
Message-Id: <20190514073030.30203-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CA+chaQe1LaMWsVVyyC9CGjGBAT2BGrcc+fjvdCEaThP7WGzN_Q@mail.gmail.com>
References: <CA+chaQe1LaMWsVVyyC9CGjGBAT2BGrcc+fjvdCEaThP7WGzN_Q@mail.gmail.com>
Subject: [PATCHv3] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Tue, 14 May 2019 07:30:34 -0000

* before trying to copy unistd.h into it

* older kernels don't have uapi in tools/include and do_configure fails
  with:
  DEBUG: Executing shell function do_configure
  cp: cannot create regular file '.../perf/1.0-r9/perf-1.0/tools/include/uapi/asm-generic/unistd.h':
  No such file or directory
  WARNING: exit code 1 from a shell command.

* tools/include/uapi was added in kernel 4.8 with
  https://github.com/torvalds/linux/commit/c4b6014e8bb0c8d47fe5c71ebc604f31091e5d3f
  tools: Add copy of perf_event.h to tools/include/linux/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 546076f84b..4e603f1a32 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -238,7 +238,7 @@ do_configure_prepend () {
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
     # so we copy it from the sysroot unistd.h to the perf unistd.h
-    cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
+    install -D -m0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
 }
 
 python do_package_prepend() {
-- 
2.17.1


