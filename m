Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A080377BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:55 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id d28so2939518pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S3LnWyiRqe0vEXyWk+ezugYFIb+47A6pKQ3J25WMS6g=;
	b=auG/aUxxHZSAgdWBgEJzNRrkQ1nq3rVhCHgR6Q2Pmwe+J9z6YTSP0UytykNnxB5ml6
	yanDs2KVKc2ERBVtBA98GF3WgEf6oXBHOuQNngYEKdi1XEz3Z5oo8a1JYMdjc7GOa3YE
	h+FgzMwVrgYLPVQkpr+pL9Qr2eJx7GAOeRK3Rkawji+WpCcBfkYFnHKouhLM94aegRGO
	dAN63MTOZQf6+NBB8LzN3nb6w9KQBfCFT2M5UOAMAaSWJxJKRWYXF6oC+Imf4nTYy90K
	8Wsj4dltabq1ImDpADq+GGGkZee5lt/IDBxRPO1/5bWTIy61tbpL47ugyacoAjqhwjvC
	b9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S3LnWyiRqe0vEXyWk+ezugYFIb+47A6pKQ3J25WMS6g=;
	b=HPFPTfnHdgiCVECe2XDOVvXz/EmH+GkovSL4N+/6xn6Yv7wnEgtjdViR4PtJAOQlnM
	qOQBqRSQMhUxWNWWxLOia6zo7COXgTkTr9cZ27cmUKunM1dU06wCwzqrq0eBQDZmU0D4
	GPbh3+Kt64IC9tqULFz49YizLSFW88ihKznyEvOn6JUjzDRXCw2JtYLmoPrG9+0PhsxO
	3KY0h3k6CpkhmOKJbqA+nYM8oiPaejmNopGf7JncIJncL5kHOWZ5iGEG2kajv4V0kdWd
	99/OIHeg8LEKiZebHY9ExN33CawZGYEnVuq23ikPt8nLbFs8TE7H9PSZHzmtUOrONSLS
	zDpQ==
X-Gm-Message-State: AMCzsaWN6UAKvXMaDex2+syspoLy2Vf0vxHxvS5c2Jnx0LkUF6LdfUvP
	V6JFd4/ZM1DRncvvjGk2CwjB7A==
X-Google-Smtp-Source: ABhQp+R508GKXwXSRrr5OZXtJhHn68QoH026lyBrmx5dcfwcyXhnfbEjmjJQI3ijIwNi8CfCPT5GVQ==
X-Received: by 10.84.133.69 with SMTP id 63mr7722770plf.203.1509738896981;
	Fri, 03 Nov 2017 12:54:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:38 -0700
Message-Id: <7f0f21d9054b2a57b98689e321b48c54bd3436b8.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 04/15] xkeyboard-config: upgrade to 2.22
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:55 -0000

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{xkeyboard-config_2.21.bb => xkeyboard-config_2.22.bb}  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.21.bb => xkeyboard-config_2.22.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.21.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.21.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
index 01a51ad..4fd894f 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.21.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
@@ -13,8 +13,9 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "af9498e8954907d0a47f0f7b3d21e1ef"
-SRC_URI[sha256sum] = "30c17049fae129fc14875656da9aa3099e3031d6ce0ee1d77aae190fd9edcec5"
+
+SRC_URI[md5sum] = "eb61fb3fd419e817df572b0c8d94a883"
+SRC_URI[sha256sum] = "deaec9989fbc443358b43864437b7b6d39caff07890a4a8055105ce9fcaa59bd"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.7.4


