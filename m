Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9340610BA44C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68448.1774600272097845064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Uzho6To7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-486fb439299so17118935e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600270; x=1775205070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=Uzho6To7wrbdcZaydAUje9O1fuTaMgqh9SyI9cdP5mwSlRjy1412QTbIUm3XsMgvLm
         sLPjohp80Awtnep4IW09S7t/jlPSscD3cxajKqAGqfk/bVZ8mbz4IE7mRjdcx49JZYU1
         SbpgSpNqmLcnuxWbxaDXA356tRFYspPYzpho+0xAahit29AZPZnwTOh7QLSl2wmkIDWF
         7e2qGxSTNz/MOSaEeZ324Zllabyv0ssOutgpsFrTJwyQ1wc0B6X78+JrXEEGVOmsia2g
         xwZBRgMkYvs9wsMdP01nGZQFuAVOZmkaswg5LtphmBkUoosuFnCPjRfi3bBIqTHtZsP9
         PcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600270; x=1775205070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=Oa4f+GDBQVf0sGfKRFjs1MuTuvXY4sSJ9SIMXIvTyfUC+v/+PuA/uPLOD6B2OB9e05
         E3Hi3dlvFS8yV8VUxQHO642bheyEriGkxMWKFArFhlDb9+LoETcS1OWNhXgVGLjQwYPT
         2P9SRXIGSO2oo/EMKm8W3APetEdVZImcwBiln01jwpfJfo5sl6NlKwAibjgnQNzPWe8O
         QBpN/eroaPJik0jltZWdRE4zOu9TNYDhXrgFCMCjmhTc1x6OPJBx+UKDD0H5jk0UJr2m
         C/s+T8UmHPCm9BsqUi5Kj41Ps61O6wYRKdg35lgRWY4qxz/vgc8/5CFFxQIAL+WYGQgJ
         82xA==
X-Gm-Message-State: AOJu0YyGeAspXATLxmm1HyCtwLdPe93okc657bkEhXBQQyF1oJylBsI4
	QmE+4o+Ly803G8Tu0jIDR0qZ4JySDNBWmhJ1rTTaDlh7zTTsqK4cF6R7ulStiA==
X-Gm-Gg: ATEYQzyaj7U+yRH0C2/X3mmEyJJPZx/xV3doPDCP49cI/96a0bj6krlHGDTrpWrkIyL
	KGRF0TemR9g2A2E6Ef6tibc4KjRLacaMrlzRJqCdUim/2EZPQbR4Rhe6lT6hy8ScbhUClK/kvni
	2Ma67BgA2VPCM84UlDA6GisUl6Nq3xAwf1/+Abf+9CF8OLaulWQKqwfojGNkjegIN0wuHt15s+x
	u0AtvyXjI/veAQ4nhp3y3Ig4OkKY6eEZ5eEtnOBikX1QDMB9j/QZt4wuRTnt9lANJrg4gEZ956A
	pVTwBsJE/rQZeMI45aycFjTYuwHyqYj7JyNQ159W7Ozo5wkMwwh+lqzGwHqiv33WhPZaWy7emQW
	UDRymrxgpddHg9D+IOE5PdjIqQrTXv0a9n7/7Lf/jvJZls74msfy1Ac/6pcFiSFHBKSsXNT8QgM
	2uHz8N3HVPabQZu9Cwh3aGFNv4
X-Received: by 2002:a05:600c:8489:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-4872809fdb3mr25277015e9.25.1774600269929;
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:09 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 05/12] python_pyo3.bbclass: Pass ABI flag and use PYTHON_MAINVERSION
Date: Fri, 27 Mar 2026 09:30:48 +0100
Message-ID: <20260327083055.12571-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327083055.12571-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260327083055.12571-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 08:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234060

Setting the ABI flag correctly is necessary for modules using
python_maturin.bbclass and others based on pyo3.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/python_pyo3.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pyo3.bbclass b/meta/classes-recipe/python_pyo3.bbclass
index 7f5a00f584..c618d711ac 100644
--- a/meta/classes-recipe/python_pyo3.bbclass
+++ b/meta/classes-recipe/python_pyo3.bbclass
@@ -12,7 +12,8 @@
 inherit cargo python3-dir siteinfo
 
 export PYO3_CROSS = "1"
-export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_BASEVERSION}"
+export PYO3_CROSS_PYTHON_VERSION = "${PYTHON_MAINVERSION}"
+export ABIFLAGS = "${PYTHON_ABI}"
 export PYO3_CROSS_LIB_DIR = "${STAGING_LIBDIR}"
 export CARGO_BUILD_TARGET = "${RUST_HOST_SYS}"
 export RUSTFLAGS
@@ -25,6 +26,7 @@ implementation=CPython
 version=${PYTHON_BASEVERSION}
 shared=true
 abi3=false
+abiflags=${PYTHON_ABI}
 lib_name=${PYTHON_DIR}
 lib_dir=${STAGING_LIBDIR}
 pointer_width=${SITEINFO_BITS}
-- 
2.53.0


