Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 63AFA7DADF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 16:36:13 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id b18so900157wrq.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 09:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Gm/z7LxNvSI3Pj1W6v57CDnQFHVMvcB0JcMX0DHUNWQ=;
	b=IX+mzpuWmLAMwy2ky5h9XzrQ1R7OWEX8ReOSA74a85KKSd2JQxRACed52uoNsav26W
	N6U+bw0z21to+qBjskgL6RDpMEKr54Ni6kN3VexLFT5aZOY7QKC6wEwKl3L3r+oQbRc/
	jcOk4BIsExCiBOoCno6vQDcqr4oPGGbOW5G5JSnsWmp4SYiXSSvrUwQqvlWC5tOADN86
	c0RtOFKiHUDXYsskLJi0ofMKvMd/177DTuYpX3KGs0+4QUGJqAiwiMa75F9Y8YVwvxw9
	9o91tQp11Is3zgQEAQnU0BiF2MaGHGB8Uvyq7GqsdmPkXGHRg1ikyc9jOGMOAiZpwPWj
	RebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Gm/z7LxNvSI3Pj1W6v57CDnQFHVMvcB0JcMX0DHUNWQ=;
	b=lcEt2ZDSWZl2RuYTVe4+sXpX9BXZqGSF6gNW6GB2BMOnXDl7FEm5cnsqK8b8YYN0An
	RO1v6oFZmZP431DqwaHev9exrg1Ztq0xwJbBgUyHiGg4dDXmZ9JW/3MBmowK+PHQfpZi
	YCQPdtkP6vIGdNM6xub0/PTqfFwp+ijL94Of1kqRIGhyfEa5SGfVBCawRT4BRWXiAGiJ
	Jksl6jJp/7LRtwqouMfZie+BE+BUE5Z1QQUW7SPgOfJKCMDTdAAeMBD74tvIn2Cb9BX3
	F4Q0EoAx++7fC7LCud4DTpbjl9c7V2bAXK2+CK4f49cWrfNgPITKiALIw0BuJybCPern
	4OEQ==
X-Gm-Message-State: APjAAAWZyuH8FHUB79xEgsBT6lQLX60JaZQ/laO8O6rAbHkFRTnRQkHY
	wJIqcxjbsQ1bvUu5jvBBTqs4I5ML
X-Google-Smtp-Source: APXvYqzhCkS9I9vl8AQt+ZTKBE0MAchwOxigr0itPm8X6ihAKY3g7ChlrHxVVnxN/dZWmehlnbxPkw==
X-Received: by 2002:adf:ebd2:: with SMTP id v18mr11112398wrn.108.1557592573760;
	Sat, 11 May 2019 09:36:13 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b2sm6878781wma.41.2019.05.11.09.36.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 11 May 2019 09:36:13 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 May 2019 16:36:18 +0000
Message-Id: <20190511163618.11829-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1spT7=rt=JrAqT44h7KjqAHr342Ew5SxrcPJB0EA3bXJPA@mail.gmail.com>
References: <CAMKF1spT7=rt=JrAqT44h7KjqAHr342Ew5SxrcPJB0EA3bXJPA@mail.gmail.com>
Subject: [PATCHv2] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Sat, 11 May 2019 16:36:13 -0000

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
index 546076f84b..774894166c 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -238,7 +238,7 @@ do_configure_prepend () {
 
     # unistd.h can be out of sync between libc-headers and the captured version in the perf source
     # so we copy it from the sysroot unistd.h to the perf unistd.h
-    cp ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
+    install -D 0644 ${STAGING_INCDIR}/asm-generic/unistd.h ${S}/tools/include/uapi/asm-generic/unistd.h
 }
 
 python do_package_prepend() {
-- 
2.17.1


