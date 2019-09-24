Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 27F577E507
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 02:49:35 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w10so275863plq.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 19:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1Su/5nV7II3Jkg0RaUvRENr7KKJ3ROXXmUd3eBh3R4w=;
	b=UsepqsJNDcIHPaA+hO/yyrEMGLj5jC4p7XCA59mH9B099W1O+PZFQpkBAbhJvww/Vd
	0WXznmmWRYva+RB5hhfJrV/3ma/wUK25AMJyW8YhJ+sPVDQz9xf3XZ35jHZ6Ib3vEJlh
	jqbD8FwW1vUykpf2Z49zr9kjh1qbcTklox+173pcJtd5OuqFvRm4edTG7u+yzFK98dtk
	iF1wPY2g7cHWXONCYFZLspz7FWyYs7y+dAkSZJuygIQZAaCmFrUgogOE7TJYJAsmjzAS
	UQ7yLMbFTR6zBozGOIiv+k4/qVWhPv+OcIM72KQTLjB1xkFDcpsNj3na1ROhCGvlV56c
	wwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1Su/5nV7II3Jkg0RaUvRENr7KKJ3ROXXmUd3eBh3R4w=;
	b=dOWFYmbsalcE/bH8mS74nBIg17WzhpN1ngLb/1C4jbPhYqTz1HMeQEeNYeGNAypkxy
	222fksUi29/8OFnxwge88es56EAdWjqZ1DVeyAD1SdYpV/Rsx83OWs6macBeNeZUQHsL
	KmqNX292cNkb/jvuj1RAOz8dCgn3sxqnPZbt+3Aiz1RlmkiyGDcgKyTZLBibmpYUNhSk
	DftMyc5QjDpGYsjFh+QckSHAm38sJTtynMo0yBpQ3ZHwd2Zx5yG0/qnAnSIcJ2BQ1gv/
	2p63nk0u8t//viBaTPmYgK5FujPV0qr6GEcTm9rRIPv6Iao349aPfVqxt/I8p8RqqK+G
	LC1g==
X-Gm-Message-State: APjAAAWuOifh9VJLVsU80Gb5FYiJO9BfPk4bse/22SFg8QEFJ+I7VlMj
	EUVgkE3icJoUX8P7gQPEIVOKeobhNxw=
X-Google-Smtp-Source: APXvYqxhB+47OxrQnGL1XpDlOBtNw/X+lN3Kk9RHrzTKeEz8JrQrea6vILM5xskdTnznow//NfqEiA==
X-Received: by 2002:a17:902:23:: with SMTP id 32mr498495pla.214.1569293375976; 
	Mon, 23 Sep 2019 19:49:35 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ec07:55c0:9c8c:b3de])
	by smtp.gmail.com with ESMTPSA id
	q204sm146791pfc.11.2019.09.23.19.49.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Sep 2019 19:49:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2019 19:48:42 -0700
Message-Id: <4f115b2495339f8cb24b922a83e69cfc0795b8ea.1569292053.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569292053.git.akuster808@gmail.com>
References: <cover.1569292053.git.akuster808@gmail.com>
Subject: [warrior][ 02/50] binutils: CVE-2019-9070 is same as CVE-2019-9071
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
X-List-Received-Date: Tue, 24 Sep 2019 02:49:35 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

See:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89395

(From OE-Core rev: cef180de3684491f1ac4180ddbcc102121222181)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
index 26f4809..f025399 100644
--- a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
@@ -16,6 +16,7 @@ Subject: [PATCH] Pull in patch for libiberty that fixes a stack exhaustion bug
 	reached.
 
 CVE: CVE-2019-9071
+CVE: CVE-2019-9070
 Upstream-Status: Backport
 Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
 ---
-- 
2.7.4


