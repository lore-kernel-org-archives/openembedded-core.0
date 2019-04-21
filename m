Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id B46356B50B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 17:57:13 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id u57so7982637edm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Apr 2019 10:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dC+ushDDG7Tjd8IYoayYWIerUxljKklY/G687HfRpcE=;
	b=QDbN/7Z+kTOCiCUeqYHHd1Mcg5ra0yPzd/Ufpb8LDQXMkMK45oMDQmzZxh48smY/Hn
	f/5RpChNivzSKR/4K0jeG/PWvnWNbKRwr1k+h20+pW3J1uEXT22E/X7JlWYWvo/J68k7
	krvwFnSgfQlYqTFUHhVJG1aCBWkZIl+wXEXnDahyXiWUb8OtWujId7oalklg47RXPSMa
	T9/ez4rOAJyeQAqAKTtnypXJgNHo2UDZb8ZFFX4oIVoQgiRkVBnivUxD7YTv8M07l2mT
	e1V1fN1QnEOrp2iq4aM0l7Yz4kBD3/fYf+CE9LVsUYtDfPA2XShODSvrn+tHfvOtvXzr
	ifmg==
X-Gm-Message-State: APjAAAV7cFp/3U54DoK6RO+SZmQ6UW6iBEwbdNZH/Yq+quHh3JPxCNBG
	MJaiZm3nQMLINXzaRjpl1XNPQc8=
X-Google-Smtp-Source: APXvYqzaNDwKUH83JS6rXGrPtDGovV3lX1ycYhlLcp8xOqU6B1ZhVWOw4s82IZPV6pUPCDg8+0P/UQ==
X-Received: by 2002:a50:89b9:: with SMTP id g54mr8633963edg.37.1555869434012; 
	Sun, 21 Apr 2019 10:57:14 -0700 (PDT)
Received: from bill-the-cat.local (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105])
	by smtp.gmail.com with ESMTPSA id b42sm755559edd.83.2019.04.21.10.57.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Apr 2019 10:57:13 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Apr 2019 13:57:05 -0400
Message-Id: <1555869425-7613-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555869425-7613-1-git-send-email-trini@konsulko.com>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
Subject: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Sun, 21 Apr 2019 17:57:14 -0000

This brings us to the current version of vim.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1198.bb} | 0
 meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1198.bb}           | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-tiny_8.1.1198.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1198.bb} (98%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1017.bb b/meta/recipes-support/vim/vim-tiny_8.1.1198.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.1.1017.bb
rename to meta/recipes-support/vim/vim-tiny_8.1.1198.bb
diff --git a/meta/recipes-support/vim/vim_8.1.1017.bb b/meta/recipes-support/vim/vim_8.1.1198.bb
similarity index 98%
rename from meta/recipes-support/vim/vim_8.1.1017.bb
rename to meta/recipes-support/vim/vim_8.1.1198.bb
index 4e3e663c5429..d7b864ee8b94 100644
--- a/meta/recipes-support/vim/vim_8.1.1017.bb
+++ b/meta/recipes-support/vim/vim_8.1.1198.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
 "
-SRCREV = "493fbe4abee660d30b4f2aef87b754b0a720213c"
+SRCREV = "958eabe5e53673fc39186432ff98b3656663beeb"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


