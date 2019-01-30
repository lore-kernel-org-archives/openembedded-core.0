Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 95DE17C322
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:04 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id q18so25506490wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=IKMsO6JLLdw6Ri6FCzMWRHqLuANqSN8Qncm/eOKZM9QfpPWxobWys9OPYW0t7JesL2
	NJKNhR5nj0BPaDr7dDhgs7oym1zlwvN8jmlicDgO1VphmBNLCmVhG0jtx5PeanWFhG5I
	GHTAXDegUO/reUyw1FxZkkzwgKAYwxOgV790RMfftOn0dnHlMcc6vRiKbZZ2YVIvR7dv
	2YaWuGqWXMoeMAekC32rRIAtna9d93FCRhLb2yCYKLcqjLEuze2Dt5B7rhFhmDbTpK26
	BsRRAeuBJqvN4R3yB9jkQ6iKLXWFAOMKw99iRwdLAiaZUeGO7GsvQ1+DFakVfyQFEI9k
	ouyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+mV7qq0RnYfXCrxHPYE8hQD1oUcwIoHz4Zvov8/vK8s=;
	b=lC+9Fh7dT/SckjmGT2/jmeU/BUROuZKDAW/h22zn7otr6u2KLHBF5FN3nvVwVE7jIh
	iYBGrzmmGaMjihLb81CZx6UHEQXpx2YuLYxF28MN/g/ilqSD3MhI/4nhhv40c63PCK2P
	uRDecmThhTOxk+YU7SDbUngM0lBo/DZHd6YM+9zPnL3NVW8sarjbPf6AfWF/IpgEEYWm
	kMioWRH4OBUmz6rHTupU1TeIfoI8i/IVX8NRZv6plJNdJNKmMt/J1fuH3XcY00yuGrgn
	ktzxZkx5/SaKgPnVu2nEXp41UkwjB1xz3HnfBteReeSlGGJG+vqwZLzTwHGVxj2oSyb4
	fjgw==
X-Gm-Message-State: AJcUukdIxoJItIWxmE2txslcJEsKtr/YeYo33tIksB7cGgrqHFpGhiGX
	N4vBleowhpfjPKZpgI6zv5gq003X
X-Google-Smtp-Source: ALg8bN6bge79PkS35lHHeijjMS9ezL/Xps6rbN85uW8EaOjNNqc9i3ujbY2HS0w7Xa7ZRPV73cUe5A==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr28902758wrr.271.1548846004873;
	Wed, 30 Jan 2019 03:00:04 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:36 +0100
Message-Id: <8273e52c115b843d0339795da3b5639db5751174.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 13/20] libjpeg-turbo: fix nativesdk build in same way as native builds are
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:05 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
index d9d877dc0df..029847ff5f4 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.1.bb
@@ -31,6 +31,7 @@ inherit cmake pkgconfig
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE_append_class-native = " -DWITH_SIMD=False"
+EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_SIMD=False"
 
 # Work around missing x32 ABI support
 EXTRA_OECMAKE_append_class-target = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", "-DWITH_SIMD=False", "", d)}"
-- 
2.17.1


