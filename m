Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 271997E024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:12:03 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j187so13223642wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7XRNsv6MHh6DXeMAwnQ52XAAZaKTLlRUKirWmxR9hJI=;
	b=XDfPcTIwwIr2jhyqX0cAsa1N+2Eghx2l6nKJyuRVnXlLkoJyU5iJQ1IPxGWOBGlRrQ
	4bJrHdqQZ6PTA3Q5iYLPU8Cx4xUdrMBkfsJUgdbKdM3OoTv7ZEO7qRO0k1OLxcYTD9A6
	QI0shD4laGr+wZ59+J4bnAFGvyKngD0+j7BRgaVltEtNRjLLAT/4JmnKnpxcjRr7Luio
	LYLqzma8VM52lc1HQABpO1S5UJ8g373lkbua9wxFfIeP2x1b/wapwm36zWmZDi6Wflvq
	h5qXaTgH2UJ6mup8KvY9m9seK8jE0mK3iymxsqKtl7JMMrtxTIW/w3gfi/ZQwdXLtkyz
	LsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7XRNsv6MHh6DXeMAwnQ52XAAZaKTLlRUKirWmxR9hJI=;
	b=Bco7hNlunXokaPsux7jUThk5SQ4X3xts6C2MS4Gt1seyZN/Vwxm68OjRCsAiY3Wb/8
	HZQ0QY/FAXBSaT/xwqFcwdFwvq8VAhwl3RhJTJ/fWjHn73Gem4eFCulrUcVPE9sonzlI
	i7RSQCFa4ymJRfgmhgD6qdcHESwjTcly+oF4DwjOuQuWQo5fJOzEcNJ+9VTrF8IUqUeG
	xwvdPmbv0L4f0yS+nS9DivnBoWoowpQSeo94sHGABD7N395Nl+OIanK38FZ6NhYp/mmQ
	gD+L7bm7QHxmW46qss/hSeOm+QEEMB3puwAlQkQ9pszwDbg80tXca/zSzRkR87fvfPKt
	1i9w==
X-Gm-Message-State: APjAAAUv4FEa7EP2xpfSPwxGuIq8zHk+UTGOvkuf7EBPkyG2zOwF7vc6
	EivQ04iiqbwbZVdiXZsNlp3oZd16
X-Google-Smtp-Source: APXvYqyVdh28z7APZcR4tbeoLca99SjflQCikbC7/I6FAhhQDHncaRCTeQ24sHxc/70i3+misOYhBQ==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr40388672wmc.137.1558361523764;
	Mon, 20 May 2019 07:12:03 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.12.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:12:03 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:11:15 +0200
Message-Id: <20190520141125.10805-32-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 32/42] libdnf: upgrade 0.28.1 -> 0.33.0
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
X-List-Received-Date: Mon, 20 May 2019 14:12:03 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/{libdnf_0.28.1.bb => libdnf_0.33.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb => libdnf_0.33.0.bb} (95%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.33.0.bb
similarity index 95%
rename from meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.33.0.bb
index 4ff294c32cb..8915ba69164 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.33.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Add-WITH_TESTS-option.patch \
            "
 
-SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
+SRCREV = "51c7a70833a0f2e5ce7623fa0c7c10adc73bc4b4"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


