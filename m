Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 83DAC7482D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:25 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id s10-v6so9790587plp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=UqXNNha0nWVWNhVXHdBcpa9UcgCPYrM0+oC5k61TW5E=;
	b=WH6GD07H1YCkS+/e7bJTeHRADLrCooUlMGZlfNesrMd/7oMjVsYEB4R94tXIZU5aF6
	lcOqCTVVn5bsVOBR63Tsdaozm9NTfeF+0oPFrLcmEsEsxZxRX1JC0BYLJOSjXhvelIo9
	UEZulif2dvCUU2vIfjiiSmqE87bJnZlvbUuyJbhx+9QiqIyVfLI6bdK9U+nf6kuV4/n1
	kEEtkETv6KW+3t7Ly6Hr2QPg2Ig+ZLm4NNJg7+yEe+VSzQu1+DMZX1idGSdR8MzkEUQp
	VLiAYAFW09IzqyxnPisIOXkuC7fCzYcjO37DkJWgDWTHUnd/3KRYGmF4DuBiQYGalutW
	FusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=UqXNNha0nWVWNhVXHdBcpa9UcgCPYrM0+oC5k61TW5E=;
	b=BVH4ZFehhHLU6J1C32+BC7sw/QBCLFaoX/9PLuouWbN5yPdzwUzBWW2JCcCj9D0QSh
	mItc3VpigGVEjLJfUDSZOCbHDauQqfoceSisADAdhQz32YLj+CbWbnQKocBqtjwe5g6T
	QvCjmAYculcA9g0TnJKrH7QlvKzg9WSmqei/t9xvkmc5ws4EFG1e9epZDQ0mETz9uxA7
	YgQi/pYp8I8vSHcgTazqpOdMKsdWw7v68yScDn9NvIO8gSaJzPEFljBJezP34CZgaZ1M
	Cj2+fSY4N/l5CADmGSC0V3Cd2sXWyfbWUhcIvOvxneW9fkNbdmci2jPMXvhlSu1abARs
	fy4g==
X-Gm-Message-State: AElRT7F8iVTrlKrUJYgNDWXA34lz4Lh6s+njmTaHljBSEkz5kcyNfcOn
	nliOWrw4dvwdzE6E0roAtNaM4g==
X-Google-Smtp-Source: AIpwx4/UTyPVV52UnIWnJ3lc5LHqZKAWSYKgyEB8WGzXwjexyx7MnIBVzaQaKIFfHwuRiACu5283Ng==
X-Received: by 2002:a17:902:a70f:: with SMTP id
	w15-v6mr16630226plq.344.1522806566988; 
	Tue, 03 Apr 2018 18:49:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:02 -0700
Message-Id: <3df26d503d4fea6a6ba7f1bb130ffe077a3176fe.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 03/21] xkeypboard-config: update to 2.23.1
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:26 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.22.bb => xkeyboard-config_2.23.1.bb} (87%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
similarity index 87%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
index 4fd894f..fb9f5d1 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.22.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.23.1.bb
@@ -14,8 +14,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "eb61fb3fd419e817df572b0c8d94a883"
-SRC_URI[sha256sum] = "deaec9989fbc443358b43864437b7b6d39caff07890a4a8055105ce9fcaa59bd"
+SRC_URI[md5sum] = "875cbd09ab8394277fd16070326abbae"
+SRC_URI[sha256sum] = "2a4bbc05fea22151b7a7c8ac2655d549aa9b0486bedc7f5a68c72716343b02f3"
 
 SECTION = "x11/libs"
 DEPENDS = "intltool-native util-macros libxslt-native"
-- 
2.7.4


