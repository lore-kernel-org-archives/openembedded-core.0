Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6E23D78CBD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 20:39:33 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l9-v6so2903327pff.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wOkzQ2gGmGvHZH4S+wUB5OOcMNAhc8OlkNT/uRSi71E=;
	b=H1/w5xDprJB/pSWHAsDO7A2oWGG2++hSiNYeWWgftzvcU9cmedYRr0BlTKLqlg88Jj
	8GGjBKFc+cGrIP5stYouk5LgcWOo5oH4QL8BAlXvQ3gRDNj5Sv8y14kfUTi/g7gUobv2
	OlW436/MvYaj22oc8ZxvaHZIlZfL4U2e8e52gzySbvVqcr3oUBsCyZvs4siws5KVUhM8
	wx5T67MpMPUF6kB9KFa58K+8HKcMKxqrmY9cE6rJZFfDkgdz7HK2WMXR+sag9bXj2cFC
	oWajX9iExiT2EgGWwDkgub06sEwbF4dzzBJv1sYP/5ACefgPtjZhcTyVcQZ7SDqhnPS1
	0ZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wOkzQ2gGmGvHZH4S+wUB5OOcMNAhc8OlkNT/uRSi71E=;
	b=GlE5Ow5jw4yfikr8keaJ3gVBCGCgppPr6GMG6U/gP80Ha/08vcenqIl2IEfWp2rKNn
	mNZeLQT1/kepbvM+NPO0Swj+Lpr69BXq897tGSM49/Uq5zvQA+HwnMyA1+gbFp/wVWEE
	HKwqKz9KrLlycXnv2iji8wnL+DEVtSq0okTPqyEwqSN2WWdbAgZg0goXeXU5lbbe/zC/
	rnBnu3DbIo3SRjhOiScNM0Q+7nSclV1620S19qpEo7+QVXJGIxoMjfbUxWYNxS4qrB4f
	JGnBeWnQ8AdR1fSisYtihYri9GeaK+PRf5SqCgZSzXuFdiCB6zEKtu8Jd+0YhmFXbPGP
	yxFw==
X-Gm-Message-State: AOUpUlHMAl9lfAKi6/0c5cflEQvV9hXPnQBzTs7tzxq1RHeRc2rCYqEo
	xFlSRBvP0Y67mXTw4ftMAkLxf+hC
X-Google-Smtp-Source: AAOMgpcHRCsThjNsR0HgeV9DAvDOKeWCNP2SosA4EPXh1XGZOS5Y2NuvDHQp6ThVivSIh+NQV3If0g==
X-Received: by 2002:a65:5cc5:: with SMTP id
	b5-v6mr10681548pgt.425.1532810374517; 
	Sat, 28 Jul 2018 13:39:34 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-111.dsl.dynamic.fusionbroadband.com. [173.228.90.111])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm8102393pgp.13.2018.07.28.13.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 13:39:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 13:39:21 -0700
Message-Id: <1532810363-23110-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
References: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/5] openssl_1.0: drop unmaintained darwin support
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
X-List-Received-Date: Sat, 28 Jul 2018 20:39:33 -0000

The fact that the darwin support only appears to consider x86 (and
not x86_64) suggests that it's not maintained or tested. In general
oe-core doesn't support building on darwin.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index c2d9264..2804203 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -89,10 +89,6 @@ CFLAG += "-Wa,--noexecstack"
 
 CFLAG_append_class-native = " -fPIC"
 
-do_configure_prepend_darwin () {
-	sed -i -e '/version-script=openssl\.ld/d' Configure
-}
-
 do_configure () {
 	# The crypto_use_bigint patch means that perl's bignum module needs to be
 	# installed, but some distributions (for example Fedora 23) don't ship it by
@@ -190,9 +186,6 @@ do_configure () {
 	linux-sparc)
 		target=linux-sparcv8
 		;;
-	darwin-i386)
-		target=darwin-i386-cc
-		;;
 	esac
 
 	# inject machine-specific flags
-- 
1.9.1


