Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4991178CBB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 20:39:37 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id a11-v6so5116166pgw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2018 13:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RMNIm62dPKtDN5twZs4YDoki9FKMJB+TI41QBQZ7xc8=;
	b=ExfUWN4LGDguhpOBapmKaDEnep7pR/2Jvk64sGbuxdIYryXzoAEgDNzWhS0aTUM0xY
	jav3kny9+2goqKd2z6dzbQeKrKbTwFn/eq0eU2w86IFeY38+qPOMlOQ0jq/w49RTdY0o
	ed74A4/HJ+n13MR0wTB2sNxnO7YUPWv3xgLxU+9+ibAMWlpzohGnhdCG+CWQdp7KUCU4
	3YQYZTuPuBTMZ5cJJyPG4BO6Qk+T4SQJtRzTDeRb7r5YS/Lo+Xz0oWoI5GKVjiC8jeRg
	1ouxy/rgPGpRP176pFWZLszQhtO+v9bNXcdQazXWfVRri8OIfuCy/Ipqbs4zwNietZ0h
	4ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RMNIm62dPKtDN5twZs4YDoki9FKMJB+TI41QBQZ7xc8=;
	b=Yc/doQUufQEWo4bV6tmveg1tvxqM24tvoblxs8c7FhtaKAt3Vg12Nxi5W+xA0dmqX7
	CVn4EnMmEb8IyjfHsL1iq8XUWEfPzxPrMFV2cdl+jo+ylttrrL4Wq9MF4VTZ3TMMteMV
	Dr0yxNfCF41o251iEYrgvMgy5+SQbN7gLAKkFPY89eA0V2jxQjk51et2reTP7LpbdllA
	uY6OUlkShLJPpHBBqVPGbyky1YwYJHyNNikwfrSADwSgVhgqlfr9fXchfxpkLUU7opjq
	aSrbcLMn5GSh9ppLwbKyqh8O5FJlXWFYO8uoK9V/bx7sJqfLQry+IbYv3pb7mIVYs7ji
	u74Q==
X-Gm-Message-State: AOUpUlEXMJvsP7mjwb8tJDOvRYCgAcSVnfDX1zkI0RsIzhUbEzind6dU
	u9gwiS+uAcEIl2JWMJ45hz1CPZYM
X-Google-Smtp-Source: AAOMgpfePcu8Nx3rriwvfmEJ4uXwSitK3u+HNVczkIa1IK7q0nhFhhzEwJ1sPHpNSlpR9TXeEG1WQQ==
X-Received: by 2002:a62:41d6:: with SMTP id
	g83-v6mr11734315pfd.219.1532810378335; 
	Sat, 28 Jul 2018 13:39:38 -0700 (PDT)
Received: from e6520.gateway.sonic.net
	(173-228-90-111.dsl.dynamic.fusionbroadband.com. [173.228.90.111])
	by smtp.gmail.com with ESMTPSA id
	h4-v6sm8102393pgp.13.2018.07.28.13.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Jul 2018 13:39:37 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jul 2018 13:39:23 -0700
Message-Id: <1532810363-23110-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
References: <1532810363-23110-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 5/5] openssl_1.0: squash whitespace in CC_INFO
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
X-List-Received-Date: Sat, 28 Jul 2018 20:39:37 -0000

Squash whitespace in CC_INFO to avoid recipe whitespace changes to
CFLAG affecting the final openssl binaries (the value of CC_INFO gets
embedded in libcrypto, via buildinf.h).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index bbce14f..f5d3274 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -211,7 +211,7 @@ do_compile () {
 do_compile_class-target () {
 	sed -i 's/\((OPENSSL=\)".*"/\1"openssl"/' Makefile
 	oe_runmake depend
-	cc_sanitized=`echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g'`
+	cc_sanitized=$(echo "${CC} ${CFLAG}" | sed -e 's,--sysroot=${STAGING_DIR_TARGET},,g' -e 's|${DEBUG_PREFIX_MAP}||g' -e 's/[ \t]\+/ /g')
 	oe_runmake CC_INFO="$cc_sanitized"
 }
 
-- 
1.9.1


