Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id AEDCC77F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:10 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id n23so17288137pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=G03xFQ07IDJFvKD3/2ew68olH6xBK0bROKPYhWvciDc=;
	b=kioQkiQD91gduiRl2moD8brxz1LxYgAY4lDt06IdpbqfdNijIf4YfDoHNYq58dPmSS
	yrdDe6cXoCFi+Ed/elCIwwsYMIB9/KZRC/HaF5nId68ggpM7wLHH8jKAfRURPLSnPYFa
	rqFktASTvJL7cyqYnL6pNXC+pkjUX5wwUmhPJrT+B2lcMHZe0AmHDxu2ksIFIqihYD65
	0TQ06fPBA8UKwBK+ymDWSB3p9+iTlNJosdkBJHfnwlQIk/vCKgsjWK9ftJ763nwSuKoV
	Ue83130mk63xw0MPQU8Cg6V0Rq5m/IP0bQ7bIabnlveZGVhJGZKwsiD2QcP+tG205rJa
	5QzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=G03xFQ07IDJFvKD3/2ew68olH6xBK0bROKPYhWvciDc=;
	b=Y3NMM/XYF+pCjdE6Y+UgjfAfgiKJlzpkxIxbSyyEE7w/UAoESpHci5lpryBPioxvBP
	k7IUzWb+FT3Wzh0xC/yJJ6o54SB8BzwiPfNaVnJipD4n5zjGqTXSWazG7BstomzlNoHL
	5vEbU+kZh8S8Xj0G1skdEYTHFJJIfnZANDg3EXIsdFuyUSizEPsUWPhBpE+YPTsOWAk/
	itVpDVGNpb/fpUlIwdC1q6N1lQPaWNedaW2PDPC08Xmp+gLtPEn2Oa5gEcYSvmpGt+3h
	khn9B9njdIwMxGdhg9RtPLuWYkS7lERrJ6MFlJOL+fieYguBpc/w6ooi3ZxQPI1g6oDX
	c1OQ==
X-Gm-Message-State: AODbwcCGKaWCg21OWhdJZ0o93VBM4lDSnkDUgKDVX8lrpt4FG/AofH0T
	Oc49YrHjXfDoxg==
X-Received: by 10.98.111.133 with SMTP id k127mr23185472pfc.215.1495429272038; 
	Sun, 21 May 2017 22:01:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:37 -0700
Message-Id: <20170522050042.42403-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 10/15] db: Add --tag=CC to cross libtool invocation
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
X-List-Received-Date: Mon, 22 May 2017 05:01:10 -0000

Fixes errors like

libtool: compile: unable to infer tagged configuration
libtool: compile: specify a tag with `--tag'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 26065bbb0b..bbf52605f8 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -72,7 +72,7 @@ MUTEX = ""
 MUTEX_arm = "${ARM_MUTEX}"
 MUTEX_armeb = "${ARM_MUTEX}"
 EXTRA_OECONF += "${MUTEX} STRIP=true"
-EXTRA_OEMAKE_append_class-target = " LIBTOOL=${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool"
+EXTRA_OEMAKE_append_class-target = " LIBTOOL='${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool --tag=CC'"
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/dist"
 
-- 
2.13.0


