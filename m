Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 22E2174D40
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:27 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 82-v6so16445999pge.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f1CUzw2V3Rnb2rsCTHsIcyWrQZao6r+c4hEKZhbeft0=;
	b=kaS1ljEF2FXuMI2mlz/EdeIzvE/o2edvyAUxlp13ceAsunjLSW6APjJrARq+2M9upx
	N0ay0R5U7ptHddHaYR6aAWQQAkHpk+Xjgxa4KaQLCPqVmbKHr6IsbGdhe7Nf0ukQhh06
	j80PPjlSXdx+nXhJGFn33rlPliT5/KSTuulvhIGQLTq8IKXfFE+fZ6UO7nCpk7qEbdF2
	WYAHS5ywQthNQYTDwCdjR7W5Wsm6bXR38tUD0oNoDat0Aej0WglmtI/aXfFPnnZlpJo6
	wf0RiBQRjg7nJP+wCPwsGG/jiX6XqcwJHSYnUFbaezIQV0PDKBHnLsI4Aa1tG63qjP8x
	a5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f1CUzw2V3Rnb2rsCTHsIcyWrQZao6r+c4hEKZhbeft0=;
	b=EEubDQyRE8tifIVFiUciPbANszd7ABwlgE7SVvb28AQP5q9qGo0MiCOVxKEAPTDnTb
	STcCIsWRLjkR6lkVEgvL8zmI7oQYfqnNz4LntsvPl7FtBWVtDaPvpziqRWXUS+eUdegR
	XtvUyUMJxbWxKzvvcapD0uBwD8CMX5i2wt1zid6tXDmgIQu2dI7AA0wFzcArIOsTgzlk
	17c5nc/2XB1J/hTf17bc7K7dBfu37A6Dlx34OFwNwxsTv7TUECZpECxk7N2mgcsuWAoM
	tQYcJ5P9dkrYveyGdNg/rIyULNKqJvN87jOEZZcL5JEMPdg17x5AAxWXm+4cq9rR57Jc
	mMYw==
X-Gm-Message-State: ALQs6tBsCtkyi87lO9Ut34GvInb+b7H8YftogHwH5mBsj1EI5RNv9ZAM
	QIwZEI4LPIO3NwMD2D2wYjIEZQ==
X-Google-Smtp-Source: AB8JxZrDCHuLKfhEqBxARmUH2LqFsM+RnOFYKBUneL4gY18EcSYlo51QwYd3XdB1t+rNU0mQWGy4VQ==
X-Received: by 10.98.10.72 with SMTP id s69mr28752207pfi.134.1525479268869;
	Fri, 04 May 2018 17:14:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:13:59 -0700
Message-Id: <87e08c2b1c32706ab2a2fffeb947c7ec1d684970.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 05/27] musl: Upgrade to latest
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
X-List-Received-Date: Sat, 05 May 2018 00:14:28 -0000

Changes are here
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=618b18c78e33acfe54a4434e91aa57b8e171df89..941bd884cc0221d051840ce6d21650339e711863

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 01fec69aeb..a0a098f5b4 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "618b18c78e33acfe54a4434e91aa57b8e171df89"
+SRCREV = "941bd884cc0221d051840ce6d21650339e711863"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.17.0


