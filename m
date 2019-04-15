Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id ED4477D9B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 10:55:10 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id t17so21261306wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 03:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=K2sSpVdcJgmR6Fn09x2dy/8xxNU6mj8RcJwAVMDe//g=;
	b=TGB0zV2kMNpc2Cjkp94CiA4S9u/Of56sKHnah0imNphr7ba5ExNqnDK1KoIpfXnQHB
	UwEFcIDCQTdCF/5CcWGfI0Qz9ncGaqH5BOojOJtB8xMjxPFQV0hADuGrFXSLBcH6kEqb
	+5anzGbDiJcPP2DuJwoI28RH43EYQZA2uoTz5hmAb83V0/r5mTYh8Wqq4u1qteIMmLAq
	5a3Y7WPKYElke1cq8J+pgbQP45zNJsQw6c1aOxEEyCHfuPGjPBTO9KbvjN/NU6NOk2Ld
	BPhFZyfGz921ZHoLZA+KcrunwdIHPG9cVWQX9VHUW1Aa7J1vFfENl1vGoT4iPg9wOplx
	2Gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=K2sSpVdcJgmR6Fn09x2dy/8xxNU6mj8RcJwAVMDe//g=;
	b=FYGtODbiFXnZwnCGNxfZVm/0kHN+SkaOsAhmIy7DYCTEhEN5DHLKhaGW51+ITIxnx1
	obTCID85NQO8ZJ19aO4DbiMMBH5/xEXUW744BPtbcQi+QKHxZQTBsxUPxVcoNsnFmz0l
	ykj9cTaDMDcinapJgR4Zx5rbRAVcNPe6Xjhy+RL2gMWox7EdlGezPa79Zu8tothkS2lb
	4HqPo9moQzCeWyWnOYoknMkJNyduJky1ucEvkIv2n41J68fIN5F+aU0JOmeMcevfIxR8
	uP0q4I9Ldxu2JA8ECD51Z1+RynbvCvcmld8QW3rn6qZaPEISWWIl2S9BMS0AS3uWg/HL
	7jWw==
X-Gm-Message-State: APjAAAUSOqpBC0MJEQwSa4KfoiQSWK+oU38eTgE3F9kvS3hU/1doxAo9
	Q1e4xmr2wHJU07OZQhtvXg24ZwxCsy8=
X-Google-Smtp-Source: APXvYqz+cJDA8hvQGjY8IELMeseqsUE5D2lfGgCcUy8izfxcER3wX9Aj9iz5hBXcca2Ke9Za3K+VzQ==
X-Received: by 2002:a5d:6681:: with SMTP id l1mr16532956wru.186.1555325711676; 
	Mon, 15 Apr 2019 03:55:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o10sm75468400wru.54.2019.04.15.03.55.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Apr 2019 03:55:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 12:54:47 +0200
Message-Id: <20190415105457.57067-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190415105457.57067-1-alex.kanavin@gmail.com>
References: <20190415105457.57067-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/19] dnf: upgrade 4.1.0 -> 4.2.2
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
X-List-Received-Date: Mon, 15 Apr 2019 10:55:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/dnf/{dnf_4.1.0.bb => dnf_4.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.1.0.bb => dnf_4.2.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.1.0.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.1.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.2.2.bb
index d45023eb0c0..3970b411217 100644
--- a/meta/recipes-devtools/dnf/dnf_4.1.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0030-Run-python-scripts-using-env.patch \
            "
 
-SRCREV = "ad9b2175517c896c898cf9c8660e9b9b688ac5c7"
+SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


