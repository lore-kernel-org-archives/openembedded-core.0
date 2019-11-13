Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 947BE7F7B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:32:31 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x28so1892845pfo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PkCqd4vEtfmaLVosU4E2Xl4LLtcqtEf+LHwEd8MjHPI=;
	b=BIHFP2P4lCajvI3mdr4x8RrJy0Q4s5hlNRyQQuG4trkn7DHJKFNZGsPmNHFnj01FKO
	YmdlWy2u0E03rDZrAuG2EaYOS+2S8PvAZ56vrZ7jEue+SAiG+8ljQ7ZcPt5tIrGaMrrI
	D+YWVEIBXeE/etSK06CCgLu61h2A6OSjCuS52496D/J/kwR0i/KvZM+xWPfptWGD/WhH
	YIqyT5HMbnHCj5qMYCIXYc0nWiGqrDDcRJrbOOa2Fys+ECLAMrtmqkLoS9sCXLt2Rmlq
	/oyz7wqZesNsWpfmg4h9/PzvIBe4oMefuMt2PE+0ikwI8CXtCTol1LCo7hs4zeaHtZyB
	4vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PkCqd4vEtfmaLVosU4E2Xl4LLtcqtEf+LHwEd8MjHPI=;
	b=IwBVtVH3qzGYfUV/uOKZWYugKxZPix34vKwz+ELLf+tPvhRwo3TTNawtD5XNND1x2l
	7/dpiQ/eFQgo8GFV2tA7C5Y5USGkgtU5m+sTTV7AB5JJqjbna5DZo6xYUNMXC/TMQ2E1
	zfttT4gVeCj/5Gqkb2FjsJYaBU10Tc4HhDfGuxI/qUJ1dC7Hvf/AW49FS1JO5unuRVKs
	Bg6Udn8K6+L+c3Rw05xzwm0fvMoOasM2iB3/ifXzoTHORbSabNYfwRRiq9+q0RCbEMjj
	CslVZsUEgGwVdpWQanafqJx2hJwrQug/wFLeVdYw7LTTzuExoumqhA98/vVlBEaatp4j
	/i0Q==
X-Gm-Message-State: APjAAAVWtnp/3nXW3XagA5Mwqixrl6jA0kFHG0zIn29hHCvFS5qiPnB8
	CgCWGL8/cToMHDFwWB2hl1sj2xss
X-Google-Smtp-Source: APXvYqyu/gQCHfaxY2/wZJjl7/8a2TUqXlikg3+/q+Al4wj6WZXtHGVw6wponqftn+/j0XASSuJxdQ==
X-Received: by 2002:a62:fb02:: with SMTP id x2mr5293414pfm.254.1573659152324; 
	Wed, 13 Nov 2019 07:32:32 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	s18sm3713613pfm.27.2019.11.13.07.32.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:32:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:31:49 -0800
Message-Id: <541ec2f0590ab1f2c0667bf36df7c4c1bb0b6a25.1573658916.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658915.git.akuster808@gmail.com>
References: <cover.1573658915.git.akuster808@gmail.com>
Subject: [zeus 07/31] libsndfile1: whitelist CVE-2018-13419
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
X-List-Received-Date: Wed, 13 Nov 2019 15:32:31 -0000

From: Ross Burton <ross.burton@intel.com>

This is a memory leak that nobody else can replicate and has been rejected by
upstream.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index ffb4585..7855008 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -33,3 +33,7 @@ PACKAGECONFIG[alsa] = "--enable-alsa,--disable-alsa,alsa-lib"
 PACKAGECONFIG[regtest] = "--enable-sqlite,--disable-sqlite,sqlite3"
 
 inherit autotools lib_package pkgconfig
+
+# This can't be replicated and is just a memory leak.
+# https://github.com/erikd/libsndfile/issues/398
+CVE_CHECK_WHITELIST += "CVE-2018-13419"
-- 
2.7.4


