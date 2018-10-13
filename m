Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B24BB79B65
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 21:17:05 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n1-v6so16962306wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 14:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yKBSeqR0o4TMyr5u2Mz7MkQgxCk9HXOXBxbIxm+rvrY=;
	b=UzULqBxBuiG4WCpE50ApWASIWM/zlNzRx5Nwkq6xVv6z3ePCRcTBldb6r0wKITFOpX
	JEcqzO5AQ2gxWQakQfefAPxRzcfUx1zbbyidqrxhGWdWDCTUZ5K2903Yk/CvidWQAKrB
	lysqGCLWYqmCZL6P2ipOz0intH8EOF+cxK068wZ9Rxobyi9cp4Eptk6OTErwXi0w4Qbc
	BPuBo57jlO5J3cQPzJnQCEe2Dp/zK54GodVkrDUDMXnGVbDNuD24c1y1EUx0HYHh3KEr
	fLBDcquxq7v5haLJmHuo43c4nvrR8g+unwSvH9E+UE846gnV0fxu8Gxki9t1ca4xVmiR
	THyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yKBSeqR0o4TMyr5u2Mz7MkQgxCk9HXOXBxbIxm+rvrY=;
	b=iHogE8i5or+Xz05wh2ZKH8RJuwdKNypw0vj+BghapiAamsGhYBiiC4WlLZNw1G6IEC
	M8z/BR2/yqKn+ZGDLpDQnbrPv1PX8qEqnww3S9mtrfZr70jhsPeZvvHcM+4KmyIRkGGL
	eVGYOqdyw8/4qeoxirK0VuTjWbuI7DdO8K4YHBpKDRDIK6dSS0sQ+dO4ZlWCmLKs4xKh
	M45jMUC8V+IJ3NIId/zk5AfQ1j2EEGkV+6n3BpU8OfSgtqGyyBgPVi8R6a1UYkBAfMse
	rbvBhFy8OXBQZJuRLjcqg3epZ251no1uJhw1CFEiNkCUQ85HmOXN9Juilr9f1wWXDrNd
	BTCw==
X-Gm-Message-State: ABuFfoiOcAJvA8jUsnpTH4pkZMi9ZccdBTlPiwzvcaQUJxCOqgdFMXGA
	ozhQcIHa8dUmDw+ZKJZCbAgkBPLE
X-Google-Smtp-Source: ACcGV61W5BB0Z07NLrxaP76QCwczrplWXOgqUWZ+P/LEKkmlIx8BuhEW7qxNZugMdAACkWDFI8koxA==
X-Received: by 2002:adf:9bcf:: with SMTP id
	e15-v6mr8866039wrc.240.1539465426303; 
	Sat, 13 Oct 2018 14:17:06 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	x8-v6sm13328744wrd.54.2018.10.13.14.17.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Oct 2018 14:17:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Oct 2018 21:17:02 +0000
Message-Id: <20181013211703.1224-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] local.conf.sample.extended: add another warning to comment about GLIBC_GENERATE_LOCALES
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
X-List-Received-Date: Sat, 13 Oct 2018 21:17:06 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/local.conf.sample.extended | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 2b2d3279f1..7670347d53 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -59,6 +59,11 @@
 # NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
 # appropriate value for IMAGE_LINGUAS.
 # WARNING: this may break localisation!
+# WARNING: some recipes expect certain localizations to be enabled, e.g.
+# bash-ptest: fr-fr, de-de
+# glib-2.0-ptest: tr-tr, lt-lt, ja-jp.euc-jp, fa-ir, ru-ru, de-de, hr-hr, el-gr, fr-fr, es-es, en-gb
+# if you remove some of these and enable ptest, you'll get QA warning like:
+# ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]
 #GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
 #IMAGE_LINGUAS ?= "en-gb"
 
-- 
2.17.1


