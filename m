Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id C847D78DD1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:36 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d4-v6so1455239pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DBmC8ou89+m0ZJlQ7MZ9eNMkVgtSUXtmApSSrrcSVuY=;
	b=u0BXdyKitv/iIGdTdQ8rwxZ7NIZ33Q4B5VmgfvxxSSJunsvOSpgy+vHM3aTPyw9vKJ
	O10Eu5or0q7dVchgFhIHYoyMLfLnX9DYuZNHyzJY+TTpeOGv7E7yZnwfiraJH0ef/KSi
	azwmJUuTOxpw+MCg4FO0dDOnpkXlewcoCcfTgXzvWSOjyTLqhEo3rAdlrU/X8Yn70bzj
	Ae3POuT95khotNpU8eyE4uTsMyuKebpndb3CAr1dcmsbX4VTJwsgOuy0LCicUZ1ecakz
	RiC9WWNIElvNl/bJ+3DSKpW//acrgHyObvYH4SV/NCQEWMZmjzd7PN0PbyB5LMZwIcW6
	l9lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DBmC8ou89+m0ZJlQ7MZ9eNMkVgtSUXtmApSSrrcSVuY=;
	b=oyZTHohSEk/axudocUNwnDo8Wu0ofcZUpN8JktV/sIX2hF2viWz0whu2sQBN6MSNhy
	nKsoDg3RYrt3oc023UdGi0sm//7E7BSuyy4F0vFljCYZh+7P8uoLIUOSm1q++9tnPWgb
	F1OtNBDAqceMYtSde19DQerLM/cJ/nE6lD0ea7igwMycwH/7bgpX/Mief39Ah20Np89M
	B22e/KCyNFDO90X7dpOOsY5hQAvbMQ3jq8OncpjIHRiosVynOIQdbuuoiKlOnSEHR6Hf
	OT+FIIr6WcL1yRO7r52SA5vDyJZsBUt+MtaaB4Cfdti4a9tRu71ZxK7/0viY8yk5b91x
	aLjw==
X-Gm-Message-State: AOUpUlFgDz88HOhVW7LdWEqR4TFzulpCp5cBAeFoPEEqs8kaY54RUx1c
	AdPlTlhtLjxnLBBsJRQY9GmNqb/D
X-Google-Smtp-Source: AA+uWPyeO0a3WvZI6mq0TV29xb1pvEYPb995xXwv8gqhccCtgv19cA/t28RlweCoSPkuw5sGsjIuew==
X-Received: by 2002:a62:8d7:: with SMTP id 84-v6mr3863157pfi.172.1533747877535;
	Wed, 08 Aug 2018 10:04:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:21 -0700
Message-Id: <e4ab7ba5a5842d82ac26ca7a61a30c68d4d0395a.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 4/8] libxcrypt: Upgrade to 4.1.1
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:37 -0000

license update: Remove CDDL code with Public Domain pieces

https://github.com/besser82/libxcrypt/commit/c76847e3be40c4ac0d78bc8518502418c6207144#diff-fdcb2380ff1eeea2e5795ec115ba1c0d

inherit pkgconfig as it uses pkg-config during build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libxcrypt/{libxcrypt_4.0.1.bb => libxcrypt_4.1.1.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.0.1.bb => libxcrypt_4.1.1.bb} (81%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
similarity index 81%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
index f21029cdad..61ea22e4ea 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
@@ -3,13 +3,13 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=d1cc18f512ded3bd6000f3729f31be08 \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=cb3ca4cabd2447a37bf186fad6f79852 \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-inherit autotools
+inherit autotools pkgconfig
 
-SRCREV ?= "089479bb24acd168613757a6f12d63caa95416b4"
+SRCREV ?= "21b455b68baad279e6a3936faced16c5e5634376"
 SRCBRANCH ?= "master"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
-- 
2.18.0


