Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8B7103A9B8
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20282.1774438306347400940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HU7I35JH;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so53701985e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438304; x=1775043104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=HU7I35JHp+ReOD2mOdLmrGjGWSINvOacJ9e9rPFmwJjDVkM1UQu0WkRQlx2C8noEsG
         sO+oKXJwFdbu9yf3lH6QJ6yvtzkfcMWYUtJ55JoXFzMIQ0jvsyS3qzNwor+doApkFqvo
         Zcf5UJosffTp3Ly2kwSaQLu1rf0HxAWiVdK2NqD93ABLy+q0jDT5x/SGNTwWctqJhAMv
         HpuiyY9Y/LcwF0g83fW0wK7qcaRBXxhE/OlB/nGFhpKib+ZRtDk6YY2NmLioeRrRieqq
         YnyRktM+XKKdEbe7vogGZRtTGVRWY8jtPOoz5hs6F/HJIOSDEnkbG514zjBoADPG5bVL
         c6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438304; x=1775043104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDLuo+1DNT28AZt2wNtI4uovK6MgckoVedKbetkEv/k=;
        b=cSB2T6WMqnyjYkjPueCTifEVH+65iwos0ZNBgB9kfr/T0W0htPagJNh/2dPpgA6qT1
         Y8+qmb7lg9Ya/aRkGkWf588W8a21TiouoFlzZ5coVuGKvozPsyGq8LQVSadvbrcEVnYA
         kf+jaEpKhtSM3yuSXDt93CoQ0eZu1WYTY0WpgDvAs+XMPeF4bgS9PIOQxXVPAyZxqgTv
         /Wih00RU5TV5Wo7FtwPRAMTM+aIh6f5fTLHwoAxpjFxXXwsX5mLhCci2HSpPLDfX2buD
         VnKSyy6i7tbTRlsYPIv3Oo+/Fa3bXqidANmHPVQydZHVj3M/xMGNnnbpVH98RgSmShnq
         MlPw==
X-Gm-Message-State: AOJu0YxT0V8VsgXTzTN+XcvEhYyxkLw/EEBEAJfCy/m4EOQ1ZbW2EewE
	fufqFazTSdOYyHXm8P01g0IBsl0u28sY+6fXDNKxY5K/QUcn2VsgivP+zfKOtA==
X-Gm-Gg: ATEYQzzzPKOkOM7CD83fqu6ZP5BNexf5+XSvukupB8PMZJkBhFWo7XYAbiYN1nNkwMd
	1q3QLY1tV9yxvysv0PrmRhhoD3hCVTJMiZRMrJzr/jdbnQXTUrRafNgD509PZlvmypWfD4MxiCI
	uOnHXX0QNhlUmYg3gdFJzmPQ6vxxuZodtrYVNYrwmvY6Z8VDM4O2qcjvLjRv8T5nZHib/ZDf98+
	SZrSJcNq6Mr83fETtpcAaDjuSolkCfVkrgbNZ+Hp9VN0HWRGKKUnvCUYMiIXwwnM3PiBXGnvaRQ
	X6UvPzF4KWbe43PZA9opFZ8G83BD+caCkNTcPWlVIzwd2pf/ulg1kpRCeM7TDiF7oZNLb3HJEuG
	zbcFEnHrD2Vv3aQaAmf1bDoTHBHV/b5kPU7DaPFsQ8KWZqHl98kedS75PPB/ohjZ5iyisvivXZ3
	W0q/nkiQOjC38vYQ==
X-Received: by 2002:a05:600c:a413:b0:487:288:119a with SMTP id 5b1f17b1804b1-4871608902bmr36975965e9.28.1774438304197;
        Wed, 25 Mar 2026 04:31:44 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:42 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 09/14] lttng-ust: Simplify setting PYTHON_INCLUDE
Date: Wed, 25 Mar 2026 12:24:19 +0100
Message-ID: <20260325113112.1163632-10-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233883

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
index 1a15c5b420..5c1c74b7a8 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b04e8f34dbcf08198c6618d05e8fe7b"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 
 inherit autotools lib_package manpages python3native pkgconfig
-- 
2.53.0


