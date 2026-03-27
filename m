Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE23C10BA453
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:21 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67450.1774600274772398134
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 01:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NS2fiC82;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so16229835e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774600273; x=1775205073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=NS2fiC82yrsa0h1k/gQKtZ3zeZTowK2vFwWJap2E6TLEEKIfzDnJ2FiHzPNnXaC0ke
         YTowKZRDVnHaP5uOZnu9fJ1DalafppocfB0FpfMJbY5xbKWvyuion29lm2KOOwsDRuhk
         7O3HT7reT4I1e+oByvse80xVoNw8mF5fGiE+G8+7khcNaQHSKz4mqSimVi65QQIF4X+I
         Wop1SvaLTLNdoLdDwRZjmsqMGlhT0Z9+f41/oMPYC/60iaog8I5/qbW5CXmiWYSZM5RU
         +kp+8uNtebthKA+3YytUw2W7/E1hy2SSqBjWvOk/z/SBKslQMbrNpuwUv/lRgyHHctir
         KztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600273; x=1775205073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B8062W+tk5yitffmG+nAyIkAqhP9TiXC+GzUEZs+RJw=;
        b=IZuS9vdjug62Fpk3vnRnEvBct4Q8YnWnepZNL3VxMPp+ZfnWiIR2d1qKrlHQHXsTZV
         xc82HkV/eNrYl0UqvGyXEWyoobsdhcKBMdzGixuy9LcQ2fpdsYLYtG78UgXDE2y0NN/W
         5InbI4gqOgWwUljHpYq0KQlmY9qdsMSA8NgdaiMpF59qIyTDZNL/DCDoHcP+nXjRW7XQ
         LBD2RBvUHCE4FUYMvj0NRUMAMT6mmaFx4Lw4H0gI5EO+Ur7bHLLGszUtM3khnePE/HHt
         O2qg8mF9F4H99ubxCPeU4quN7oRWt+JAbraguiPdHLMDrYIZ6zMze5baN9zloYtjTAcg
         mWBA==
X-Gm-Message-State: AOJu0YxwZ45wNzmmy9PAZ/1893x5hi148KfWu77rdFk9SeI12+hTHDr3
	WoZYaV0KZLVYc49gGSVR4qbaoDsNwUIdgI+je89pGiqeS/M1uhn3Va/TzKH7Wg==
X-Gm-Gg: ATEYQzxwtJA8fNjV6v7dVmRCNcPC8vAnUI3B1hK0dVdGQIENyTysDVU/rgqBscfCExg
	0vgDXwTMqj0Q6Y7kBkJvInyxOlr4OZfZsAfsM7otnKzFlwdaqaBIEau+wINXCdXZbj9C/4xLfOF
	LaYPE6knrCcxT8hlQQiqWktmH/pdV1zsogHNK+ShacHVqJp2gBE1QopbsI32WI9zsvhbHDOwb4h
	ebjW9LHCRGpm4uTnxVJS/7b26ip2PzUaLI73qhHUE1dj3URFatB84TVRHofWgv2Nwc/qRwSapl/
	hKy9de59VySCsRozPeB4cISeGnUgzrJViq9jNBEFg6/Eotz58WzQg9+kLDr+a45GS6jRWqnr3DR
	pv5pWw8x4Jvt6Qeg7FNGxvMpA7yVaYEp5zMvL8Olv0lTj2Qe9B0E9RoQzsy0iEgqwXi9bA4y41t
	ZFBOQkbtFletbfRw==
X-Received: by 2002:a05:600c:8107:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-487290c2402mr16267355e9.5.1774600272781;
        Fri, 27 Mar 2026 01:31:12 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c95041sm76411485e9.6.2026.03.27.01.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:12 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 09/12] lttng-tools: Stop using PYTHON_ABI
Date: Fri, 27 Mar 2026 09:30:52 +0100
Message-ID: <20260327083055.12571-9-zboszor@gmail.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234064

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
index 3a3f2cff2c..ef80c53e9c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.1.bb
@@ -35,7 +35,7 @@ INSANE_SKIP:${PN}-ptest += "dev-deps"
 
 PYTHON_OPTION = "am_cv_python_pyexecdir='${PYTHON_SITEPACKAGES_DIR}' \
                  am_cv_python_pythondir='${PYTHON_SITEPACKAGES_DIR}' \
-                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}' \
+                 PYTHON_INCLUDE='-I${STAGING_INCDIR}/${PYTHON_DIR}' \
 "
 PACKAGECONFIG ??= "${LTTNGUST} kmod"
 PACKAGECONFIG[python] = "--enable-python-bindings ${PYTHON_OPTION},,python3 swig-native"
-- 
2.53.0


