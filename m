Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFF07DF46
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id y3so13497965wmm.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=025G51MF9QDvO0idZFPwxclL6HxAGRdn6e8ltjaqy/g=;
	b=oLXOh4AuUscBN41q8HULgJdfqxwutlpKqpO5EE6KmUD231ZJTniJLEkUEbh6mkq9As
	AdbD7awF+m6VGiY9YiLkqq1AmyVHncYbgF+b3Abllafx43C760xwEjMhIs/kCoMJeeLY
	wsP91RLL9WaUEWfM1RU9G2/PQ3/5jq4UKZ4MAKiwbzmYNze8sUI5wIQq3/dY4cCSyJ9q
	i9nEiKhsVHv6KNKvMOrx9OlOzrpDoNP5RP5nhui4Gdro+7h1okyzzE7CuCiMYQC//Wlj
	D/jhXQhAVhN7b0SVpgWFjMoaoPCXNxxT6myAsC/m7/yOsHBuereEb521BUjVC2XLhpd3
	g/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=025G51MF9QDvO0idZFPwxclL6HxAGRdn6e8ltjaqy/g=;
	b=ZN0plN2Ujb0FgicKXa+MFfe8fPogbP9gK9uu88diqSL2sMn1TMULvQEzyGHPHA7rx9
	ZzG/wExTI/KgWnoDeRiAF7pljojBRSLsxuU2FVGTJpHZ4f4yruanoBPGHs0tNh+0KQKY
	7QocrEeQcChrKMedyiGEscmKWlVtCi7TjYrpDkqq563Go6f4OV/umAdVGtGloAT+7U3H
	2wmGQUEt6GJN+Ak3haq64OhHkQBuW1ayf8FY9/UoP0VD5TOYAoC/8vEaKHVLtHWS02Q2
	kPWLH/FBg1YEBdD6A9+1YpruZ8QnAP0hiNn8FX28RUHcc+W5av4oFyt1rD7T7XzqXkdx
	hZBg==
X-Gm-Message-State: APjAAAVmxt9JGz9kFQLs2DIaClBdoXb1xg59P7/bp1Z6BCXPW8wriw5/
	idl0q9asTiGM7Dgxcv3PvLxRntzm
X-Google-Smtp-Source: APXvYqxn0CQe3+eaiDfjjXiusQONPkEVkgUsfApCZbVP6DF42JLjg4SIFlmmjgGqCjEVz390fraYgw==
X-Received: by 2002:a7b:c4d1:: with SMTP id g17mr12549771wmk.103.1558361520223;
	Mon, 20 May 2019 07:12:00 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:11 +0200
Message-Id: <20190520141125.10805-28-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 28/42] x264: upgrade to latest revision
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
X-List-Received-Date: Mon, 20 May 2019 14:11:59 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 34c7dc4f789..f22930a0ee2 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "0a84d986e7020f8344f00752e3600b9769cc1e85"
+SRCREV = "72db437770fd1ce3961f624dd57a8e75ff65ae0b"
 
 PV = "r2917+git${SRCPV}"
 
-- 
2.17.1


