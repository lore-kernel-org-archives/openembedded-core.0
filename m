Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2B93B7CDBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 04:42:07 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id c207so3834790pfc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 21:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3v8Ii49FqjkOlZOkwoEK8CBVZOqHMRr/NUmLeQU0k/Q=;
	b=sVGUzN8x7I7MAr92W6RNhTy1bfg379gJ2im7dlppguwcwbjivd8128KHRwyp2wvsu2
	W7cLlTolXsU5xB/Jtb/x6cuRzF9xciYMvbLkOVEjlBpT1L2kJIiAGQaB+0zLrTQciBD9
	Dxury4UrzQRFzb03UT+5nTo4r6uG5vI9NHCecuXFnhz27v9thIFw8H3UjEQJfxPaeURn
	Rp+r9RHt8ghLC/eoSdVXc0XEtHwgcrioiE8DSwx/m0M74KJwGI4cpDwTonmvmCAR2PCh
	o37HEdWDH1MdtNzBjUmYzbycvsy7uhuK1B0cT2pnvejvweS+MypcvAYsMa0/AjfUi5Uj
	Fo6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3v8Ii49FqjkOlZOkwoEK8CBVZOqHMRr/NUmLeQU0k/Q=;
	b=nydaFsDqQof2Xg71NSCKAt++JTVnQpvrMjwXKEiQ1yEk0SFpdd7kaa7R/5yYHQuZO0
	1drmynrkDcejo4JdVs2Q9bj/QnSUSlD/nMQLY8LkLnI0FYEJDksPiVu2AYj9xvlSmki8
	xqbVyLceak2aFGpifstXcMxvT30bb/KaJh0FTkmn69u/Cx5tGVzjXRnXRUjIdgn7udFS
	yEdMT4HkLw81AFGodX2MhAqX16jP9kGbEVaVOV0PiguArnaCyKGszZ2z6rWMFlqlmq6Q
	wSEnyEwit3dTRGj/vlVm64aBsXGDZJHVmq6ZM09zkGRmV05ZK9InEdDF74LGuYQjPDzK
	qRAA==
X-Gm-Message-State: APjAAAWHtGvnDEk94+YbhGRDWKfcQvPsExgJS22fqs1L2V1z/wcUDfTa
	5WTfCBOR8kReF5qTjRx3reH+fAyy
X-Google-Smtp-Source: APXvYqyp7f6M2nObBuh8O5wjDdA6rE8Kc102AL5U7xSq/ySB1wJ9a+LbeKXFHlK8aC24nxVHqBl62g==
X-Received: by 2002:a63:2a86:: with SMTP id q128mr428105pgq.424.1552970527898; 
	Mon, 18 Mar 2019 21:42:07 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	m67sm19131742pfj.70.2019.03.18.21.42.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 21:42:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 21:41:59 -0700
Message-Id: <20190319044159.27902-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319044159.27902-1-raj.khem@gmail.com>
References: <20190319044159.27902-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gdb: Do not disable lttng-ust on risc-v
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
X-List-Received-Date: Tue, 19 Mar 2019 04:42:07 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
---
v2: Rebased

 meta/recipes-devtools/gdb/gdb-common.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 57bc0dc773..a07625bb8d 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -6,7 +6,6 @@ DEPENDS = "expat zlib ncurses virtual/libiconv ${LTTNGUST} bison-native"
 LTTNGUST = "lttng-ust"
 LTTNGUST_arc = ""
 LTTNGUST_aarch64 = ""
-LTTNGUST_riscv64 = ""
 LTTNGUST_mipsarch = ""
 LTTNGUST_sh4 = ""
 LTTNGUST_libc-musl = ""
-- 
2.21.0


