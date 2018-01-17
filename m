Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5371B78741
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 16:05:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id c2so23126612qtn.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=nmP5ekUiBsyvFh52TV6CzVsPsi4IbThMONG1CuFns0U=;
	b=EbfrLy2e9jzCne/HAMW6uZOkc5etXTP/ChxBPo8T/kKIyMxhKnugrDP1gxVachxpPM
	+6sgZgZeo+E9yiBjJEcAd9Qv6c05GBOra9ErNzO1cmYAV/LdfipXrEsGFGYqxx9urMVq
	ECQROmd4VXhoWkmZ73gXSXuPfC4gG8itSucMd19Hlh8RKJiG8XwKcsMZyoNK23ViVEW2
	zrLAoTaRbqDXfcHS1L4uYMkWIJueR3UaY5w6tltQnDOrztoGoU6wCZupbIpnDC8rXJN0
	N4gGfBqDaWlM5dwRqbEiFlWPboG6NWrapTNyZ+mGurczKggOvxQU9THJ2fVZGjZVydrZ
	vXRQ==
X-Gm-Message-State: AKwxytfK75ERFQKnPh/WO9jRWivL2okvLzg02QJywOK9ovSePJ2Ul9PJ
	dUm7oeyl+pGZBCQMGYDGnox83g==
X-Google-Smtp-Source: ACJfBosS23mE7EMohqNz36LCO/Sj8w7qGdpDlh770mrIHrtuio/bctpZhllVyXE/2mmEQxqSfj1g6Q==
X-Received: by 10.200.17.25 with SMTP id c25mr13056940qtj.97.1516205114867;
	Wed, 17 Jan 2018 08:05:14 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d123sm3058691qkf.67.2018.01.17.08.05.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 08:05:14 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 17 Jan 2018 14:05:07 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 14:05:03 -0200
Message-Id: <20180117160503.30794-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] libarchive: Enable xz and lzo by default
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
X-List-Received-Date: Wed, 17 Jan 2018 16:05:14 -0000

The XZ format is widely used and multiple recipes inside OE-Core
already use it, so making the XZ enabled by default align the
expectation of users. The LZO, on the other side, is commonly used in
embedded systems due its performance so it makes sense to be available
by default.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-extended/libarchive/libarchive_3.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
index 5eded35c64..5daca2731e 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.3.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ed99aca006bc346974bb745a35336425"
 
 DEPENDS = "e2fsprogs-native"
 
-PACKAGECONFIG ?= "zlib bz2"
+PACKAGECONFIG ?= "zlib bz2 xz lzo"
 
 PACKAGECONFIG_append_class-target = "\
 	libxml2 \
-- 
2.15.1


