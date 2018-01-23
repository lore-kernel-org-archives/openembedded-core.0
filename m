Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id D4362787C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:56:58 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id f4so3005176qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:57:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=FMQhkhiaya/7AAiDsqhycv+lfzSXWVOwntQwVBKAXzM=;
	b=T/y89ycLkdJI9fzii3miNP2uSPYFWjsjO9sfAIrQS27d/irn5jFuEqIY9bT1uoRnZx
	dkHzp7QoucOPEhqm519KPXwBXtFnLutlgczrt3YwXNq50vtymaU5MxLWAUkeg+4BUBlB
	3T8KEMLdCkJan7yYwh3Ulx1ppXWi6M9GwuTohMXSzgUFClzC9M4932whJ5T7bW5laFiK
	6GSdiyzbUiw1ZIu1KpcaS1cOI/ADHRtSkGrSZEt6YjqaeE9fIzYnxiv5AVnVyZQZh0Ih
	/CjL0g3kpMGlIgMQ8owqOQ1lW/8INRqMe458IoFi6tOTx2SggjYAFtdkKG7VHeilZCS2
	mfhw==
X-Gm-Message-State: AKwxytftLRUFFmsYilS8EYMLfK5dm/m/gmYFvdx9AF84Uz/xMeEhPQni
	9YRldFGIVWcB1RVMqMKVblS+pQ==
X-Google-Smtp-Source: AH8x226TMDoFeztddB7vtQT5QV9zwl58AsVz5uWrtZ/uM4827pY8eqWUTSbHgd7apbDIOHqgzhwMAg==
X-Received: by 10.55.157.8 with SMTP id g8mr4494901qke.159.1516726619558;
	Tue, 23 Jan 2018 08:56:59 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m69sm13317097qkm.56.2018.01.23.08.56.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Jan 2018 08:56:58 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 23 Jan 2018 14:56:53 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Jan 2018 14:56:21 -0200
Message-Id: <20180123165625.7352-5-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180123165625.7352-1-otavio@ossystems.com.br>
References: <20180123165625.7352-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko-backport PATCH 4/8] libarchive: Enable xz and lzo by default
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
X-List-Received-Date: Tue, 23 Jan 2018 16:56:59 -0000

The XZ format is widely used and multiple recipes inside OE-Core
already use it, so making the XZ enabled by default align the
expectation of users. The LZO, on the other side, is commonly used in
embedded systems due its performance so it makes sense to be available
by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d24b0bc7ebddd10de5ad8f210b8ed85fc6ae769)
---

 meta/recipes-extended/libarchive/libarchive_3.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 5eded35c64..5daca2731e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed99aca006bc346974bb745a35336425"
 
 DEPENDS = "e2fsprogs-native"
 
-PACKAGECONFIG ?= "zlib bz2"
+PACKAGECONFIG ?= "zlib bz2 xz lzo"
 
 PACKAGECONFIG_append_class-target = "\
 	libxml2 \
-- 
2.16.1


