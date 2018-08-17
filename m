Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8334792E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:52 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s15-v6so272558pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cMka7ccxSoWZixsaDKCDkZbVnMhrmItvtWh9We0ub7Q=;
	b=Djofuf9Af/KY5ddV1hCdDycgrZZvP+O3bjHWK+mTDaTHKQjkN3I3E7e4SRGAAK5UIH
	eV6HDIPgEmOg29yy+M/9R2q//GyeBKa5nakZlBfUAiY6NIYDL7qgWEnrJoVcwgkpimEz
	/To8juM9WqR/KfsCK5WgWq8KFJ1nFSPt2UXmyHfckKzgnHeyAN0TgnoMoCEV6L8OUeUZ
	ZPtBK0oSsOwki+9rFBq8lnZ+/SGo6+p6827aAEIfNqpasda0HWJ1+BZwoHHpDx1GTnjI
	Q4elVzB/5VfGa+KnMMV7PF7mnJ+4PhN7gxLR9YoMKrqMD4ZnfosHQk6zcrDdoZPmKyL/
	buEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cMka7ccxSoWZixsaDKCDkZbVnMhrmItvtWh9We0ub7Q=;
	b=YBsInOL0otltXGX5l+BkQ+bSccz6M0lUL5k0d1fuUTzYIJbJHHTQhCCJbQ9byN+HBl
	RtWbwtKERkXVOPA+CRQLRd1XDZ7l/7GNttIsa8Mqmm3tex18yyqWZl1FxO17JrLm+6+m
	r51vuW1yzL/61vnBdF9Db4HDhmjvnZdBu/1d5DZCBp7OQ7mLQUFp2xFLhod5UG1ZvHUG
	wsrsMLrHr+gM59BOWZ98dYa/jNomxUNHn6hDybumUTJc+s5UJZCSnI5xuFBJd04JuOpU
	KGKgcoAkYorKUEpYlSTu5G5YDyyECXtBXxg9HuVWIDdDpgLAWMxghGtwyHaPS0wQEApq
	bR4A==
X-Gm-Message-State: AOUpUlE6dApYD1SsbpQUzad0W7QUKwNdp+x4LfIZ+fz1BoNQx9COjhl0
	3xH89DlRkWnjfZNExujgH+hJTIiN
X-Google-Smtp-Source: AA+uWPwctmjqXcyTxvqTda8FhbSBoIBn1HK/HZ7oO489etoDq2g2vIpA8lMLruv1cqOuaIbYZweQdg==
X-Received: by 2002:a62:954:: with SMTP id
	e81-v6mr35109914pfd.231.1534481033987; 
	Thu, 16 Aug 2018 21:43:53 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:37 -0700
Message-Id: <1534481017-17310-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/7] openssl: drop obsolete no-afalgeng workaround for aarch64
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:53 -0000

The aarch64 build issue in the afalg engine appears to have been
fixed upstream since openssl 1.1.0g:

  https://github.com/openssl/openssl/commit/a0c262644eab897b51faf1fa013008052c3754c2

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 92f3059..507f8f8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -25,12 +25,6 @@ SRC_URI[sha256sum] = "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c17b2cdadc1182
 
 inherit lib_package multilib_header ptest relative_symlinks
 
-#| engines/afalg/e_afalg.c: In function 'eventfd':
-#| engines/afalg/e_afalg.c:110:20: error: '__NR_eventfd' undeclared (first use in this function)
-#|      return syscall(__NR_eventfd, n);
-#|                     ^~~~~~~~~~~~
-EXTRA_OECONF_append_aarch64 = " no-afalgeng"
-
 #| ./libcrypto.so: undefined reference to `getcontext'
 #| ./libcrypto.so: undefined reference to `setcontext'
 #| ./libcrypto.so: undefined reference to `makecontext'
-- 
1.9.1


