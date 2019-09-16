Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4F96F7F29A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 19:24:42 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id n190so567586pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ROhnnspWtKF5rEwQ5koPMCd+8z6E3PTdCmTdI/Z19tc=;
	b=fIQnC9Zr9moa8QncCSrP9YE9Ki+X1BXgPu+cAz75x/g/XaXW8tUvy67tBFhX33HcDc
	sq+Y33m+UN4Zn5r148uIxSzBqyVHTCHoFrCBKbnozHUlx8k/bCtyF3uDddQOSlhhIf7H
	1YbRpjTrGaT6TUQXa8nMfH58U5Z6nAlV+eEn3NGobD9/6lynFHSJV4swsyLC7qoCXcHJ
	VwoLl0ds88HgNhY909+JgKhnScsm1zNLsd93CpyOLJu4IRkM4+AYzjlTsYrnJKBudWQ5
	NW19PNpzRHetKEwwZGrak7lZa8bZ2vhRAENwljHpN6i+7keosAQ+L3uH9Zc/8OSIOuvN
	3ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ROhnnspWtKF5rEwQ5koPMCd+8z6E3PTdCmTdI/Z19tc=;
	b=gmAc22yi+6c7rQzoZRYrCF+dmPF1og/F+TVH4bifJwhaECkMOE3zOINX8r3BtzTgri
	/Zf900FKI3DZ15hcg20gm8q7/Sd+VaF3PDyZOmd40GXrMvRS+TD2opuYDab8cNFBjSdF
	lyEz50aOiVexrO+9UqwMz6SrwjR6jvh5GlHere+J5rn+aR9cyQ5zw14MLDc2hy0y4Fpp
	VEpagonmqKTXekW6uSotk6WILMFhTr8YlMnmVZzM+8VKVnO87xA8MVUMEo65+F/+0lPE
	Na3JdIATN2pObmMbkLhIKIXJks9IkEvSKJTa9AvLFOIb0Z9zSpb2S8Vi3fN5+aELKqJs
	lOcw==
X-Gm-Message-State: APjAAAXm9qyYAfxbF7S2GdtC8U8SLKZ2rhVWrx61Gf77f28Z+Vwu0bZ9
	3NE9u69W/EWrhuJX0qTs5YhQpEEn
X-Google-Smtp-Source: APXvYqwshuPtScn+eQvrOrpSYsiI9BLCB3NFPw2aNnKjU6nDs3ksbledlScNur297seVFm0rpUI33A==
X-Received: by 2002:a63:69ca:: with SMTP id e193mr691818pgc.107.1568661883239; 
	Mon, 16 Sep 2019 12:24:43 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id d7sm5490494pfr.7.2019.09.16.12.24.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Sep 2019 12:24:42 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2019 12:24:27 -0700
Message-Id: <20190916192429.27294-6-armccurdy@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190916192429.27294-1-armccurdy@gmail.com>
References: <20190916192429.27294-1-armccurdy@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] libwebp: apply ARM specific config options to big endian ARM
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
X-List-Received-Date: Mon, 16 Sep 2019 19:24:42 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/webp/libwebp_1.0.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/webp/libwebp_1.0.3.bb b/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
index 01fc02d23b..a4d1ae43d9 100644
--- a/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
+++ b/meta/recipes-multimedia/webp/libwebp_1.0.3.bb
@@ -25,11 +25,14 @@ EXTRA_OECONF = " \
     --enable-libwebpdemux \
     --enable-threading \
 "
+
 # Do not trust configure to determine if neon is available.
 #
-EXTRA_OECONF_append_arm = " \
+EXTRA_OECONF_ARM = " \
     ${@bb.utils.contains("TUNE_FEATURES","neon","--enable-neon","--disable-neon",d)} \
 "
+EXTRA_OECONF_append_arm = " ${EXTRA_OECONF_ARM}"
+EXTRA_OECONF_append_armeb = " ${EXTRA_OECONF_ARM}"
 
 inherit autotools lib_package
 
-- 
2.23.0


