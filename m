Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2614210A3D9C
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:26 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47398.1774529485317044531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AJyyB0s0;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso10573015e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529483; x=1775134283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=AJyyB0s0EvZI5xwZArXD/D5nh3tTS0LvlFRjqWXDMj637/4ciyg2lgQgbIFSkVqm4g
         4zUEZIKcCQYc2zpLLuV6wV8t27neoM9D10ckrdcEH5cBjeQkFzaak2odIbKagTrElazF
         u8Yo91tpTT9bgTePIhYxs5w14sssUNP4GoUMN80HzQqCgfstb0kfJ+88tqDBK4Z7jfmo
         irNq6q6dMJrfhFw9Gt9mzpw/J3Vdb4GncZGEtQDQYWQ+hE1fdHyHetMF/fhmWPYIIHx/
         02J/lmYxnolm3QkqkKvdAvGzp29XpZk3D3iS8sOFU7wmf3AnNDtiBrhDNgAcgSaNhHmf
         4UGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529483; x=1775134283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W37jxDeKhJdnDMjkiIqawKbedRIk5n0T8eSpeZwjKyo=;
        b=nyQy9McqD8r5JIKr7Z7riYZBqCSV+X8A/5ngudFALyFo3RXgHS6ZnmFV+qnFSiBckQ
         PoSaiXR2fsYLcBO/v7ftSixdJAPu9IYsvqgpnrSFjnpwxaSL0F2YAuqucAZQk92tfHit
         RmceUKomwZqfMmz2ILDGuQQvcPfXQ6D2FClM5yMLBxQQU2GLcDp+blfT8hdk6NsqE15l
         x/+eYBW4QopSPDpuXdCAVBL9mPdfr5oaKEnv4VTTAXJBTXznHpHWk0xeyajM74BeD9bu
         3CWwS25G7ptkzmkc7v/AsXcpwFUbIaJE1gqbNyRy8BH6I19mTxaIr89xa2OCS4pNyS78
         7cgg==
X-Gm-Message-State: AOJu0YyiqY8t25jCXhstP3vYXQqd3nPL1jjFhSGnd7JPGaz5jquFW2NE
	wwn3ueTGg7zX0IQzG/p1LtcI9p79+vKk+0z9WUAZcEIL3aZu+5mpOmHBJQKCfw==
X-Gm-Gg: ATEYQzx9iqe68q32TC2N4uF4aemR1tiNtRWGgiGuWfrwPcKNzL68beRzSz9eQdWEwiI
	JnNMFw21Ud5tbmuFnnt2/YqjbC9Vdb0oLQA/EEgIj8eMYDbCU77sc6rRkv01dg3z4hZvziPT7Lv
	nqFRrb5vx+N0YP6WtFktanxjfwLqAAQUYc4UGBlaJcIE6B8VKUxpkekCmHUgdmfPcMvGr5U4YaL
	DNca5sTSBEA2okDPSGspu52dSMx54sQnEUNGZXM6pWK9HVFXQqL6cy/hmD+X9rt3hrH0Ee0Dpqr
	4vxV5ugCH+SIVXx3t3GhArqHdTeKrRCrz/VBoA0U5U3irI2gyaj6D/BX27f8Zlu4Ji6FfpEIFTv
	9MucpooWd4NYPgxlgskx4htjKcgK82BFih77j+/GTuWnNFzKE+MLnUO/bQZ+FkfIz7grSf/qgNj
	45EApKX697KT/GaakKobzfIkrl
X-Received: by 2002:a05:600c:4e4f:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48722ad3f0fmr25296455e9.0.1774529483225;
        Thu, 26 Mar 2026 05:51:23 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:22 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 05/13] python_pyo3.bbclass: Pass ABI flag and use PYTHON_MAINVERSION
Date: Thu, 26 Mar 2026 13:42:26 +0100
Message-ID: <20260326125113.1853869-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233989

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


