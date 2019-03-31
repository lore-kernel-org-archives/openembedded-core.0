Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9847CFDE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 16:42:39 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id p14so5941260ljg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 09:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cHQ2TWLfkP435N2hIVZLqE7hZOszQmJ8FZ1JWKsjIFg=;
	b=a+IUkb+Xf5hrB4mdGmFbZ0Q2ogcHDyYTpVOVbrCZ8b1egf+j3OuOXaawQiy/LWAxLF
	TXQ/CLmlzFWdKj/5OEvcOA2oT4wEL8gpDSK82pV4euh6w5u/FQ9F5CphoNvd8dVn5TeE
	ihRrwKsukdFhjWKXwVhjNTR+YBlu2fSRC/dfvtnSCe0x2DWa7BbZ82Zj7soKReysJFWK
	Da32ufojw4j8OaFvBhaySzaMRnTqJl84M7ifXw+K0T55ieMDfItc0slB2EbHKjQ260eM
	J5aoqRBv+orijnMHtyc1pHdLXVprZHhKJoIf+rf2wY2Mvr5g9E5ztaLGonyMsaupbMg6
	ZsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cHQ2TWLfkP435N2hIVZLqE7hZOszQmJ8FZ1JWKsjIFg=;
	b=HZqd6X7gED8x3ldiM4e68jGAgnVYa7ndqgrQumzX2Eh7VXllaRUmljXRLdXJWe3cIT
	0TbAHimdNh2f+to0VyMTjoKdW+PMwvnU2GcDrObTOW+ar+vfiM63TZUAlRpqPGWmM3mL
	PeKu8oQmLSlOVtahMbxZedcb/2JRbz7mcdlWDGtIwY7ZmvqtA50pe2z99udu9Nfc71pm
	dua+iE8G++OqAljCoDqoYLlw3BPpCn4RPNlbKpfv2/zsaGYdPY5+bTbN3HGaDTre2ISm
	CUH2mlNZ+TefUt03TAvxyvErrCBo9M7ax33Dif279W1e9GOuWsvUeKJ9j9e48LymHV7C
	yYfQ==
X-Gm-Message-State: APjAAAWxZPiOCMHyjTCd4oW1sEd4WRvmxRQhEP4BgPK1tqUn7RH/V9fm
	yJu+eovfnw2H+s0dvLYjK31NGeky5uM=
X-Google-Smtp-Source: APXvYqzNfzl3SyQZS09XayvYMJAj6uszvCDHyg+Jp9RjkjH109gM+EqM8e/cwvBuhrJNphiH6GXl8g==
X-Received: by 2002:a2e:1510:: with SMTP id s16mr17190528ljd.196.1554050559169;
	Sun, 31 Mar 2019 09:42:39 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	p15sm1364765lfc.48.2019.03.31.09.42.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 09:42:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Mar 2019 18:42:36 +0200
Message-Id: <20190331164236.6948-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] gnupg: update to 2.2.15
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
X-List-Received-Date: Sun, 31 Mar 2019 16:42:39 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.2.13.bb b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.13.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.15.bb
index 3ce2a38c0e..06a257333d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.13.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "563b959d0c3856e34526e9ca51c80d7b"
-SRC_URI[sha256sum] = "76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8"
+SRC_URI[md5sum] = "3ab87e377aa0af2f463649515bf66508"
+SRC_URI[sha256sum] = "cb8ce298d7b36558ffc48aec961b14c830ff1783eef7a623411188b5e0f5d454"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


