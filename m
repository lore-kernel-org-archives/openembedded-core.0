Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 16FBD74891
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 02:27:33 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id d5-v6so256355oib.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 19:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vDLnKpSfJrnnsuphdj5dZeqzRAiIQntrnr9fDCm4uho=;
	b=u0mvGQF52n48CEZt46iUY7Vu+0YPlUa0wsOU6EvkD+WzUSWb9rOdVoBhCBBsfnAjTb
	ixGgmK8eoO7U/+5JQ2p1YDTcoGebUg7C9rRBg0gbim9mLQEJZtVpr3vxpmTRoUcFNiSQ
	BN7Ao8RQxZi/56xynuJnLvpLPJc8ngXPF8kxz5RzxgDndjR5XN7QucdbxFj9sKERLhQ9
	qvrXRcQYRKZgiHG/6JReN0Fn0mBPXkat7HRyz2fBLSxxEL4Cpk+4uGW4luuWUr8dYoC5
	ZPvauAS5EIJ1jSakSji6Yvfe3YYFHEKwxCl8WzArcy2WM5p6OwTph8QpEilLXtdit+ZG
	3v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vDLnKpSfJrnnsuphdj5dZeqzRAiIQntrnr9fDCm4uho=;
	b=cTl5tN0OnUBR0urMKKf7g7QFIezQicmvyecyWf+aZAXOdu2gjpHMtuJDIY6Tq80n60
	bbFQBnCYRdB+zJuZbR+GSV+0XQOzM5KvvYbIyTuX8r2zwhrg0jtmISOYFkkJIbWDnLEb
	94JEMGvlKRDuV8T+jf751cLl7mgdea/DCo/atg+gjZwXPDgrr0m/N44PEZwoILaAtqm8
	eOowapo5DFlco65WUYPguBHXzrKqoaGYWQJn2CssvJwZQ+wUR4b2L/yYcWcnL3+9cuiB
	3swMedHMeSBBNltxAMNCYMSZnLr1oUxyHp5UCYEJQ4mbdWLj3LAUO5MqJEY7HVux8st5
	aHcQ==
X-Gm-Message-State: ALKqPwcXYx4ITwA1CYCtT9LVJX0iU7VSlQ1byBKF5/aza6paltJFsxrl
	09LIna4E5WkO8GMJeTc30NvDZA==
X-Google-Smtp-Source: ADUXVKKEFLvFGOgOAnPROD8M+UzZ2DLG/JeGiZBhKjC42x93Rfj9X1RD6U/FqyreTF7xoo1108sGIw==
X-Received: by 2002:aca:df54:: with SMTP id
	w81-v6mr250159oig.129.1527215254746; 
	Thu, 24 May 2018 19:27:34 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r31-v6sm14963233otc.11.2018.05.24.19.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 19:27:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 19:27:28 -0700
Message-Id: <1527215248-7224-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dropbear: drop obsolete patch 0004-fix-2kb-keys.patch
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
X-List-Received-Date: Fri, 25 May 2018 02:27:34 -0000

This patch has been obsolete since 2005:

  https://github.com/mkj/dropbear/commit/736f370dce614b717193f45d084e9e009de723ce

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear.inc               |  1 -
 .../dropbear/dropbear/0004-fix-2kb-keys.patch         | 19 -------------------
 2 files changed, 20 deletions(-)
 delete mode 100644 meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 16ac644..a5dcab8 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -14,7 +14,6 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-urandom-xauth-changes-to-options.h.patch \
-           file://0004-fix-2kb-keys.patch \
            file://0007-fix-localoptions-search-path.patch \
            file://init \
            file://dropbearkey.service \
diff --git a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch b/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
deleted file mode 100644
index 60c6a29..0000000
--- a/meta/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Subject: [PATCH 4/6] fix 2kb keys
-
-Upstream-Status: Inappropriate [configuration]
----
- kex.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: dropbear-2017.75/kex.h
-===================================================================
---- dropbear-2017.75.orig/kex.h
-+++ dropbear-2017.75/kex.h
-@@ -106,6 +106,6 @@ int curve25519_donna(unsigned char *out,
- #endif
- 
- 
--#define MAX_KEXHASHBUF 2000
-+#define MAX_KEXHASHBUF 3000
- 
- #endif /* DROPBEAR_KEX_H_ */
-- 
1.9.1


