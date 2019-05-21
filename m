Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4836A7E146
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:43:32 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 145so7666302pgg.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 18:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=jrrvmbokfUjmaAMuk3AnYgnkH65B2BkeBzJ0s7XK0dI=;
	b=C6k07WVYGwrKe+Z6YgN4er84gYu0rHysvevzTuYYYHC+tuGYEmXkVa3pqcsjR9a0xy
	DbJx4otmfXFkJBvkrYMZYbQ8Jy3TczRtyA1q/GNFvf47j0alOy5xhxhRes8tMIq5eY9A
	T+LIWIVRXZAVKtg4sIXB0v/ENxe1MokBeZfKu/vQXY/6hPv0qLaokhLViTzxpI3zcTGt
	kZsUNE18l47XneAjKQuM9sO4NhGNDq8EMdoXCc3FFEJDwuyPyl9Vu4xqHGopCZlPYlsw
	gyLoTkREUkxVW3OcWzxRJ5c21gVSjYMymxPoEE1WGhr5E2nxi8um1WjBJReGC0L2eW6h
	2ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=jrrvmbokfUjmaAMuk3AnYgnkH65B2BkeBzJ0s7XK0dI=;
	b=iocY+01tVcaIBEBGOXRmWFzQMcE5MJurAmez//VRnOaHYLWkXhtHKlrL8DMk3KDLbV
	k+KtuuCBwW7HKawUCXDZOMM1OiK1l0bovBhC0i72BkgVnaqYdXitn5+YD8WP/RdyimnB
	q8G+Vhr+y0R519Fh3Pv1Gtg3AtDdcIDNE0FdchDi+MOeXApISCen8YLV4Ry6diDcU40K
	ogO0ubU/O+rpOlvSPc76Y55t68GRUQkB/gyckGZrCzgLDorXltC1qhWNMq/4AATruZRi
	a4chMiFz9KkITnuEoBu8m4nZUjV3j+BJXqXT3SOQEzHRDdno3EWDNDSUATFKNAI7D4rs
	VEcw==
X-Gm-Message-State: APjAAAVBnHPosre4bASbWRd1kegr/KQZb8ISfYKKW54HRmwKeFxppgVC
	rVuz+RbdF5baczV7PnK0iIgtXNfm
X-Google-Smtp-Source: APXvYqxqGlY36H4CLEYMsn7D0TtDZBnhkIztUFyB+f5dGWbMA6/sPphaZICF5v8cvx8XSUP2RWjomw==
X-Received: by 2002:a63:f44b:: with SMTP id p11mr76660495pgk.225.1558403013301;
	Mon, 20 May 2019 18:43:33 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:503:adbf:6ea3:61d2])
	by smtp.gmail.com with ESMTPSA id
	q5sm23079547pfb.51.2019.05.20.18.43.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 18:43:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 18:43:15 -0700
Message-Id: <bf91c5f02aa0ace2ceecdce40ab95bbdb7c3f46b.1558402534.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558402534.git.akuster808@gmail.com>
References: <cover.1558402534.git.akuster808@gmail.com>
Subject: [PATCH 13/15] perf: make sure that the tools/include/uapi/asm-generic directory exists
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
X-List-Received-Date: Tue, 21 May 2019 01:43:32 -0000

From: Martin Jansa <martin.jansa@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 546076f..4e603f1 100644
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
2.7.4


