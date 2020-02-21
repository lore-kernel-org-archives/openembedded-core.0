Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4ADA96176A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:45:36 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id 185so2036301pfv.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=olFqAq60OmtrSWK75TWIzYFoSV9fx/xensXtqVSwGUc=;
	b=sYFNjNsxZvSlXkCkMtB47jL7y8F+gzCrqu1fr54hk5ZHYbRyTHvvpABnLIGn9MN/6i
	NqIlO8m/MvojU+DpTQAkoBNcee+5oxRPlZTapjs+jRlPuLWmGjj8ROKWiE0+z4CIMxGJ
	bC+/kFHwhU8vsqqgqmCDZDkfqN1nDUdqGUwdjgpHL1i0BAcwHDGYBLzNlBJrfaMRrQ2G
	PcwH0kusxFCoihtql+bJfKVCwc5ILvA2qUkykCgeYynA0Ez7cIcSa8N91Y6F29mVsyBy
	Es4G6EXwwhJWQ+oRvPo4cDQLHPXQ/NcTTZF0SbeXOsuoR61OTNaLzmrxPJn15WwEssWV
	w4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=olFqAq60OmtrSWK75TWIzYFoSV9fx/xensXtqVSwGUc=;
	b=slt1FfPOXRycAHvYF6vzFM5YLcSM1jTqFVzdTrhkqG7+iFMD+LlFCH9147+5E20XSI
	ixgQqD1uULiKB8FhvG96yJO5xOJSwG2QcIOaETTzF4ix6xaW0/VQQ7mGRkc+SGgsN1Gv
	+sqZ09nD1+dx5LP6jI9ZZb00QjpUU2kUZephEnFD3Kzmv6AD575ejXR7urWu0uZ1IwFS
	R82wKEIlads+Dov+wzzuKy+hbP6Qgsss/Dihj+7658W2XvOXsBMBrk9QeJ5RGuW4toy7
	WFaouq2DnanS/wRwcWVp7sI+laJyFGD18GwXfkc29kE2ZXAjWcqbL9cRCJrACC0WmY81
	RFzQ==
X-Gm-Message-State: APjAAAUnEH+MZK0gTf5Rq+TLEWEs1NQXq+o6+DhBbbEGiZkLxFlLF/ty
	/z3lD65Maq1LAgbZUBS/VCSc60vsRBM=
X-Google-Smtp-Source: APXvYqxDPP6szAtjU8DRVnix/PwZ6EyAK4zYl4Ecv+hqtmcuJgUfVAou0A+Y4chQohgWxW9eeZQpRQ==
X-Received: by 2002:aa7:934a:: with SMTP id 10mr41450534pfn.233.1582325136739; 
	Fri, 21 Feb 2020 14:45:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id
	m12sm3830284pfh.37.2020.02.21.14.45.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 14:45:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2020 14:45:34 -0800
Message-Id: <20200221224537.4052134-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200221224537.4052134-1-raj.khem@gmail.com>
References: <20200221224537.4052134-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] libxcrypt: Upgrade to 4.4.14 release
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
X-List-Received-Date: Fri, 21 Feb 2020 22:45:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{libxcrypt-compat_4.4.12.bb => libxcrypt-compat_4.4.14.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.12.bb => libxcrypt_4.4.14.bb}      | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.12.bb => libxcrypt-compat_4.4.14.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.12.bb => libxcrypt_4.4.14.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.12.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.14.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.12.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.14.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 59744c0cf8..416205cd5c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM ?= "file://LICENSING;md5=3bb6614cf5880cbf1b9dbd9e3d145e2c \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH}"
-SRCREV = "21f93470aad8634fcf39f72db0b62642c7073a0c"
+SRCREV = "5c43f7d56a31667bcdaa334bbb4edafb75672872"
 SRCBRANCH ?= "develop"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.12.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.14.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.12.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.14.bb
-- 
2.25.1


