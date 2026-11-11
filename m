Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5600.1794387843948047892
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=CafyIaml;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so1879458f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387842; x=1794992642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U+yNf/4v7RSY6SMYGIY5LGyO1XOiGiLjESzag45ZgP4=;
        b=CafyIamliYrZ3ZpV9kZnI2J9rgKpYBS8NeIEy2CpBqmOQ+Hw4azcUjk3QZmCp97K+Q
         p2HuoHzmHjrf/Yx3IZ4L7uG8d/LORMqK28FXRsXoUv+94S2DwNuGhD0rEF0MThY3BTOO
         aUQcso0ZzYlL5MJWTidNYnrQb8fUG2sPjhEnbJWl2EtryXEw5QhBuZQ791MSgtlinjwp
         ywCgtKHm3yBK76Uk+HI+WalTiss92UKMiCuLPPtfU7oj6TGEaEhr6LeVh1186/2MZo02
         9kC93LVggqB00k8+URRoL2bbNCcKiPfbT6PdWtfOl0BHnbbrUmPI5TLzLmNR+3LTIRqP
         HiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387842; x=1794992642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U+yNf/4v7RSY6SMYGIY5LGyO1XOiGiLjESzag45ZgP4=;
        b=jfMxIQtsuAl2LdXzW8i8TgQ5A5k9kLDKuj0bFDOxQMhHSKFpOTFx6NzX+YNwGnLRGD
         QN3x5IQQzaG7ou38HLEBRnnvoQSXh7Zc1rdmHwebyIFqUlUWM2clnyc+rYX8433A3uMN
         VKq7eBDNXPQC/YDD72QSFs/ffzSwhVfnQfXN+F0LHwbdjRhKcZsZXgIVrIRI+ouH+JjQ
         ukRawJRJpw7X9DOFNw/Q8PEdIbuV1u2mJZlYqJdvNFL08bnhsS9AvebLzwu9tW14f6BS
         RD1uqXwDjwpUl517NKhUNHkpZF9sirdVb7SGXqeuUbSn4DQQ9hY8vbzlTyzWlP+NTIQU
         Ha4Q==
X-Gm-Message-State: APuU4Z/1MMLSgLeUn3g8xHMaN/JFX5NKealB7ybXkc0dhk+7ePBSFKkQ
	LCmXsD8o/5mFix2Y6e04NVKhzETsc8+C9vXNdMY8WSeGFn4lAciVb2zxbR4Ig2LRiKG/eYUoOtY
	asb1su9s=
X-Gm-Gg: AYBFou0cqSQXmxMzuJtgw1jYfiA8UM/CdXEZAqi6n9T6oP/zgnCmUjIFlWPDxZ/fmom
	txBpYryLhvtf+FeFjKHQM1GNcL/tMysFpYoABZUJDVzBY1RJjLjNHZBhE3f/yBWXj2MdXvtWIrY
	G/8iJEWZpq5fs8ic7f7IJZ99+jOCTgYgYIqjxTC+1pbk3Lyl+n2V3hIFAB421Z1GqOkM5bU/KXO
	NvyapcHUsgAsKHc+iGgNEsJuWtsJOYyJIjMPM8cuuzUpe6tsnhUTuYLeyLUULPnZXoIobgRr/Ki
	HDq6OETkoebdLQFk29qDQJJbUcu9O6MnZktaDOZvkqnd0Q/ozGAFKgJ9MnmPkkoC0fyeH69mmOd
	FPDjlOpIU7RWF+Sq2R4yFHyn1rPGThVyfQp6zkq5UUiheAeKZd/QBtfdDzeOmsCgZz8rqi9jC9j
	CHYMRYtxKTtqvcpp/qzdo45ImSydr57Dv9Ysja5Srgjt+HDoaRuww4kG4eL1lFncGW8CA/x+3ul
	pw/8ygh/hmQHvffQ113DPCB+3EcN4T+euMv+SsUU+x5Mzo78LNIBTVH8k0v6eg08hhUuPev50To
	sKEPP4ZP+6sSuWb/PGhpqJ4Utsqsc6IBQKTcYExICfVkqazfe+vgM2uT/Q3Rii3jDyQuv4itBGa
	Y6eOV9Y8j8iNtKluR6jX9UbA6iPul
X-Received: by 2002:a05:600c:4e41:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4ba0939db52mr29096295e9.22.1794387842064;
        Wed, 11 Nov 2026 01:04:02 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.04.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:04:01 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 35/35] populate_sdk_ext: Fix locale error handling in SDK
Date: Wed, 11 Nov 2026 10:03:01 +0100
Message-ID: <33a6bd6cc8a9a976902081642414bd67adc74879.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:04:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250006
Content-Type: text/plain; charset="utf-8"

From: Richard Purdie <richard.purdie@linuxfoundation.org>

During automated testing we occasionally we see the error:

"ERROR: the installer requires the en_US.UTF-8 locale to be installed (but not selected), please install it first"

This is puzzling as the locale *is* installed. The use of -q with grep in
a pipeline is potentially problematic as grep can exit early and cause a
pipefail/SIGPIPE.

Tweak the code to avoid it and a few other issues (add quoting, handle the
"." correctly, match a whole line).

[YOCTO #16198]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f290e76eef3bd175f71414b7f78aafd0af5e0ce2)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/populate_sdk_ext.bbclass b/meta/classes-recipe/populate_sdk_ext.bbclass
index 071cf959e7e..990113d1798 100644
--- a/meta/classes-recipe/populate_sdk_ext.bbclass
+++ b/meta/classes-recipe/populate_sdk_ext.bbclass
@@ -678,7 +678,7 @@ sdk_ext_preinst() {
 	fi
         # Check setting of LC_ALL set above
 	canonicalised_locale=`echo $LC_ALL | sed 's/UTF-8/utf8/'`
-	if ! locale -a | grep -q $canonicalised_locale ; then
+	if ! locale -a | grep -Fx "$canonicalised_locale" > /dev/null ; then
 		echo "ERROR: the installer requires the $LC_ALL locale to be installed (but not selected), please install it first"
 		exit 1
 	fi
