Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 851B67F8AD
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:49 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id l35so1735856pje.3
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PgxQqI9tu4k4Kt9E5aB9v2ur7JJAUyVAlPGBBxXrLhw=;
	b=nVQhBv8m+pXMDUMOG1rQsj75DNABgco1PT4EroR2gQQOq47pOqN7aB9o56dcrRXzrG
	c5padBT9CF9aG57+l1nQ7PpAawABJWt0WCQ8RwxYCMavCTOEVmZfJfb8AZYZGjDVE1dZ
	emdbxF8DkAHRqIv+i74ogDy7MIA3g29Rb98HvPzIcCglH0ufIxU/Ah9bugWMQNfFAea+
	a1ssgTV3afFvqRFGKaMjxnijDfZFrmUp16jSoA7p4+HnU3mLlNP/+58KuVZAeAtGnvzx
	COmkFe91Q1WNxAsDx4Jfj20JL1yQyaOgSL5IfQXwUwsQRxWIA2B8s355tw/HfMGdyP2R
	dvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PgxQqI9tu4k4Kt9E5aB9v2ur7JJAUyVAlPGBBxXrLhw=;
	b=AI6Q7/zmsihpgpS87aaRDZ/FBEsoOAfcnKSiVdYnQDqlSif186INDss6sxvA6CKi+N
	WMv0yHAB8Ah5FU+/vvBq4KIV/BlCu3u4SZognLwXeontbyME8Gcs3Xy/9+BRa/KkBJaO
	OCW/EIXuOp6lNhgbBUCsZN/hb7xK5uVKQwuilJJ3iAMQ1N6nlm3oKgkg+Lb1a5ynxEgR
	6Er/WvVQ/gT/4KYvqHd6avcH4OeyuVE64fMcgVsnUHLsDFk2TWZ/W+n46krMfqHxdTWs
	1xbeC+NmcYZJwEOfECPOut7JcNlqse9+LJVmSwGiame1vmce/E9n61XfJuGbXO2UTrdf
	hhUQ==
X-Gm-Message-State: APjAAAU/AH+fCynfodcXC5kuD3QF0SFb4JpbU0Wlh7Xw40wP09jqr8JB
	HKhpTMfrBhCUv0hlcHQGlhWAK997
X-Google-Smtp-Source: APXvYqyMyXvH3qIl15o7pEYn6GXt+oHJ+XXKPgPYV84fmFDn9WzAq4bu8GJ//t8bOSFnFGJcEhelxQ==
X-Received: by 2002:a17:90a:b30b:: with SMTP id
	d11mr7426172pjr.22.1579188050513; 
	Thu, 16 Jan 2020 07:20:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.49
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:14 -0800
Message-Id: <925482bef72e80622e904ce437c5ebe8e78be338.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 05/32] openssl: set CVE vendor to openssl
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:49 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Differentiate it from openssl gem for Ruby.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index 9e36df807c..13e6ad4db7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -204,3 +204,5 @@ RREPLACES_openssl-conf = "openssl10-conf"
 RCONFLICTS_openssl-conf = "openssl10-conf"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "openssl:openssl"
-- 
2.17.1


