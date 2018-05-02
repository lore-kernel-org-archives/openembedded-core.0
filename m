Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2AAEE745D9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 13:32:14 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x22so11175980qkb.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 06:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=2S6jhP+2Yqtayz5W/icIJlPOnc1EiP3CpmRW1mOu0Q4=;
	b=l7MX7xDi+YSerR11DikvQKRO1zMSvtG8fxqBfnQT0pgxWZVdEBRCAQmuNzGC+C3kCQ
	FHL8Yn34KEwidojYB1FeBAz1rvvxti3xZMSRIhYAbokC54zupvoMdscchif1FwKZjhae
	i9wAtPRh1ZS3LzmMWQZGAym6emu/8JCEeB7Wd+5sK7+dlK2cxDUIIkgEIvBzdNvBAsuF
	6T7OuWsAoHxdL/ayeHhRI6qzh2KjMH/ZNpQ9G6ZJhWdGLZG1KpfSN46O/V6JYuq470s6
	CqFx/5qaDqEw5jm5NTepQOfTKGs8xcgQKOox4Yz1qxiHnfl9yw87ySDfmOQPGk1hQHU2
	+0Aw==
X-Gm-Message-State: ALQs6tBXeQnPbvS0ncDJvo+oYnRfTgz6eZdNEPVBqKYjy3/QBOxtINyr
	L1rMfrfITTEubKob54v01adgpQ==
X-Google-Smtp-Source: AB8JxZr+LxBE9Xi8deo81aT5bSAIpt+eie7IzhFqx+QU+lYVx6vY6Mi7le9W9xExF0sSF85DWXY4Iw==
X-Received: by 10.55.141.70 with SMTP id p67mr15252710qkd.227.1525267935467;
	Wed, 02 May 2018 06:32:15 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	q33sm11461650qkq.72.2018.05.02.06.32.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 06:32:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 02 May 2018 10:32:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  2 May 2018 10:31:59 -0300
Message-Id: <20180502133159.9544-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180502133159.9544-1-otavio@ossystems.com.br>
References: <20180502133159.9544-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] go: Update 1.9.4 -> 1.9.6
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
X-List-Received-Date: Wed, 02 May 2018 13:32:15 -0000

The 1.9.6 fixes a number of issues since 1.9.4 release, mainly:

go1.9.5 (released 2018/03/28) includes fixes to the compiler, go
command, and net/http/pprof package.

go1.9.6 (released 2018/05/01) includes fixes to the compiler and go
command.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.9.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 2823304b7ce..a942f6d8ab9 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.9"
-GO_MINOR = ".4"
+GO_MINOR = ".6"
 PV .= "${GO_MINOR}"
 
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
@@ -22,5 +22,5 @@ SRC_URI += "\
 "
 SRC_URI_append_libc-musl = " file://set-external-linker.patch"
 
-SRC_URI[main.md5sum] = "6816441fd6680c63865cdd5cb8bc1960"
-SRC_URI[main.sha256sum] = "0573a8df33168977185aa44173305e5a0450f55213600e94541604b75d46dc06"
+SRC_URI[main.md5sum] = "52c1a3063291036597552d3fed0b2917"
+SRC_URI[main.sha256sum] = "36f4059be658f7f07091e27fe04bb9e97a0c4836eb446e4c5bac3c90ff9e5828"
-- 
2.17.0


