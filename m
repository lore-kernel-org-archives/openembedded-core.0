Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 20BCF78741
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 06:51:35 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id 60-v6so3716612ple.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Aug 2018 23:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G27y9opvAnVJrtKfskCz0TDKWfwTBxfYX20OfxTeEL8=;
	b=qFVDR+oQO9IejYqVKfSu5VDW8wdUNkLvfDRhTUbuypA14lXYuKSYq5OxBVmiT27FKA
	IHplbLXs4Jwj4oS+/bRh+faOWsEYGrsdADSwM3aY1lgqPzQxIVvbuEn056kjYK0L4kow
	2d0aumSDqYgFMG60uMfoMyZf6qkb1GdQnrHFYDK/b+ny7jSUru0myJjsMNnoa3nbSVQc
	2V/XL5E721lKiukeywWZJ1L0nO6QiwgsXEaohfiVYjjr6ZSjFjivL3h0LYT38hNDT5us
	D/9R8RcUOXHOyNWBh/3pf+Ct5fPJB1iguRWDNyOdpT2pGv0U04Rk5p3Es8LY0Wjg9v+k
	fIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G27y9opvAnVJrtKfskCz0TDKWfwTBxfYX20OfxTeEL8=;
	b=dBXF4IjsAkw9BkSPFO6LTNsL19R9pnZiNpYbwOhymqaf+rJ0JCmGftBWapsODniNBG
	v4j7YlTi7wX07vbbKOP+2zWrvVZFxfrcpsyzVufRRwDtiiMqHVnc4R470O2qXEvT6CXz
	ByWvJW5436Vf+MhMHFASroojAOG9TP3L/83OkC5cVZOcjzZcwUdUJ+cQoMpz8l2PGOU8
	LeOIQKUCrATmeOBf7+fEhqmeqnyNpz5XPDFwcGBqqy+2Bkby5UhgB7fEr2ReVCjwQcMu
	2ig+kFeRpxao+vo1IGg6Dq+VH0Xs8OlxfT4YjZpxKK62LAY8Su21/5X9mdPhO8pxBc6M
	2Wgg==
X-Gm-Message-State: APzg51BUtmaJ95Lu/XkIrBw3U348fBP0Yf0xOIoPk9u5tp237s67G8EO
	orhx/l9c2RZkHpczhwDfuqj4gvN6
X-Google-Smtp-Source: ANB0VdaLX7vzC5wY6qVLV/t/uhY3rlP3tlSrevVyhVLkDfhvQtZxGuCT7CvlgzclNh0kxU0wVMmHMQ==
X-Received: by 2002:a17:902:bd84:: with SMTP id
	q4-v6mr11867768pls.145.1535352695958; 
	Sun, 26 Aug 2018 23:51:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	l84-v6sm27437315pfg.3.2018.08.26.23.51.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 26 Aug 2018 23:51:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Aug 2018 23:51:25 -0700
Message-Id: <f2afa90d2dbd18dcc10cada72a795337240bdc90.1535352523.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1535352523.git.raj.khem@gmail.com>
References: <cover.1535352523.git.raj.khem@gmail.com>
Subject: [PATCH 1/3] distutils-common-base.bbclass: Define commonly used compiler variables
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
X-List-Received-Date: Mon, 27 Aug 2018 06:51:35 -0000

This is inspired from
https://github.com/python/cpython/blob/master/configure.ac

Helps cross compiling python C modules in some cases where they do
not respect normal CFLAGS

Errors like using gcc to link when compiler is clang is fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distutils-common-base.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 824a1b68b1..94b5fd426d 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -1,6 +1,18 @@
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
+# LDSHARED is the ld *command* used to create shared library
+export LDSHARED  = "${CCLD} -shared"
+# LDXXSHARED is the ld *command* used to create shared library of C++
+# objects
+export LDCXXSHARED  = "${CXX} -shared"
+# CCSHARED are the C *flags* used to create objects to go into a shared
+# library (module)
+export CCSHARED  = "-fPIC -DPIC"
+# LINKFORSHARED are the flags passed to the $(CC) command that links
+# the python executable
+export LINKFORSHARED = "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
+
 FILES_${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 FILES_${PN}-staticdev += "\
-- 
2.18.0


