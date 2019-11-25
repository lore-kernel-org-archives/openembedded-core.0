Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9B81B6A441
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 08:45:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c184so7050060pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 00:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Bkz4VIX/ggSs0sRMK9DuXeRS0K+R7uKxrrew1vzbBuQ=;
	b=lv1zJbTlQwA7ujYJI3aeHRoYPZIXQ2dyzd28InuBoY9JmmhLuOnfK8UmR81Al1Ahu/
	lA4bUqbyq97YZxw4vrprfNKRJXu541ywWxbtNJSAUOwF9vxux885O58yY0LdMx5/YZ7v
	JBDuTbCDUHk93MkSE1Gnp1Ze7eat8+GjqijjPSXTx0AVgmpIQH711oIZXmeujn5orLK0
	CkCxDwpjEqDVK7GfVcPuRQNKk1lzWJIsz2hXlCbscLKyHWN6r2pdP1yVFQbfNpzz7FId
	xB9M3E7AoA37RCoClzbWMAYePpKvj+8ZbDiKAF8XDnpRNYwiW9Vx2TrVLxbYgp/eTSe8
	0VmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Bkz4VIX/ggSs0sRMK9DuXeRS0K+R7uKxrrew1vzbBuQ=;
	b=AZHQVvaEU98XlqOfdNU8TkCVftyB+nKs69/ogJoouRQ6FsgIOM9O2mbo7b5z9VcW/M
	ZlrOcgtESK6G9w0y+/2erbyNhu4GSQz6mosEwK82y9Jv3PEYcdTYzclI11KTunJ8aNcR
	YLoO5WXvjR1dm/+YBJCjSqfX58vrl24hAIZIx0u70BwTmjpHbMGYas4Cx6kaxdwvqaRT
	86xbsbCAvEzXETcxijm8U07+7+GCNka7zlQWTqVfAZKC+4XvzWN8PlucnXobPwiVbab8
	urVheEUNzIvWeWjDo06/fnb//X1z+9tw7e3j5A0axh1xCJPWI0FZ6QHqf3NjClKSln4J
	rrUQ==
X-Gm-Message-State: APjAAAUbV8q2ezCCXHAQUI7mXNWgmaN21c3GgDR3e1JE9PUL3lyQq6nR
	xFdzwMWc4ACPf9EV4vTfm8iyUyL6jFc=
X-Google-Smtp-Source: APXvYqwA0twY+NmyrBYBvVjA4TV5Nnaydb9pM/LrQWosexQfnVvPjlyrBUHUMxEzEjEvKbBCvrApiA==
X-Received: by 2002:a63:1014:: with SMTP id f20mr29980321pgl.279.1574671519071;
	Mon, 25 Nov 2019 00:45:19 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::d61])
	by smtp.gmail.com with ESMTPSA id
	136sm7472257pfb.49.2019.11.25.00.45.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 00:45:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 00:44:52 -0800
Message-Id: <20191125084452.1515325-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125084452.1515325-1-raj.khem@gmail.com>
References: <20191125084452.1515325-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gcc-runtime: Package libstdc++.a-gdb.py
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
X-List-Received-Date: Mon, 25 Nov 2019 08:45:18 -0000
Content-Transfer-Encoding: 8bit

There is python gdb script for static libstdc++ archives as well
fixes
ERROR: gcc-runtime-9.2.0-r0 do_package: QA Issue: gcc-runtime: Files/directories were installed but not shipped in any package:
/usr/lib/libstdc++.a-gdb.py

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 2da3c02ef0..437a9df08a 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -179,7 +179,7 @@ RRECOMMENDS_${PN}-dbg = ""
 
 # include python debugging scripts
 FILES_${PN}-dbg += "\
-    ${libdir}/libstdc++.so.*-gdb.py \
+    ${libdir}/libstdc++.*-gdb.py \
     ${datadir}/gcc-${BINV}/python/libstdcxx \
 "
 
-- 
2.24.0


