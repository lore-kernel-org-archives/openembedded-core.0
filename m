Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 54B767964F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 00:44:10 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a28so4973849lfo.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Mar 2019 17:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fZ5kD0dKMIMfjqGraZQQwYLmERR/bVvlRab0twMin9Q=;
	b=hUk0lgpeXEua4fdFaebJB13jlzGWj4GC4gjLxH3okDoV0ajQmizw50klDUW4sGVE39
	/acRqgqqsdlrGX+wD91o1GMNE2BfoIW2Vd/IHLPvNmaz1vMcSppbKtCySNidAHSOYXT8
	SaEXnNrQuGLD7GA5hyyLA891QGFdOqfuyAVA2l+gT3zdpMpHwUzvaIEEZ6jpAfJ+ZH6k
	get0pgwdu+1BLO7W5ztd39qmigl1YwZWN6AtJ0MG3GrH1MqfnVViptVNKmtmqEr09FnT
	kjOe/5ja1txMFLhLLnxuSrYmZL/qEem6xz8bjR1r3IrAjPtRG4P3RJWBp+GYg9onzfqb
	Hhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fZ5kD0dKMIMfjqGraZQQwYLmERR/bVvlRab0twMin9Q=;
	b=NFNRo01INCpLkW+42YsK52cHsK+pRFB0ftnSTDfberbA2runHZwaSMakaPbnudxHqf
	3ge7xCF29u4fMB1wNktkyZeODH7+AQOTyXJDfrNFqX6dXlZ6ZUlWqvEI1B3Z3wOEeG8J
	KjkVYWDTYHsP5XvtLCulaJrye5ZwDdExy818fZXIZ9O7SPHgwaJzKSLs5u6C89ew0UZ4
	Cnel53CRFP02o6DCid+Pn3SgW0UwQa5sihFsRRFcpXJLksrtaxHylw4iHRjA4NiR/X3D
	BYt8c9KlS0XrM8NehTfzqGu9zAOhQr1dTQvLQdvlwbiwi6XJQMCaDLY1jwL+94cNeNtt
	eD6A==
X-Gm-Message-State: APjAAAVh2f5gm4r6BnYwX2dLvwKdSlGJR8wa5laZQTNquAakI+kdIfnh
	A9fVI0bWBm03+qGZbtyWB4bCA+IH4N0=
X-Google-Smtp-Source: APXvYqzZ1buVHjpiXsFT1bKEYNqWhTeHG+TIIbLI46zot+sJHE6pVTv0qad4ycvm3xueLULWGumJpw==
X-Received: by 2002:a19:81c9:: with SMTP id
	c192mr32475196lfd.108.1554079450791; 
	Sun, 31 Mar 2019 17:44:10 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id n5sm1548661lfh.6.2019.03.31.17.44.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 31 Mar 2019 17:44:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 02:44:07 +0200
Message-Id: <20190401004407.5061-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libxkbfile: update 1.1.0
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
X-List-Received-Date: Mon, 01 Apr 2019 00:44:10 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-lib/{libxkbfile_1.0.9.bb => libxkbfile_1.1.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxkbfile_1.0.9.bb => libxkbfile_1.1.0.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
rename to meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
index f5c18607ac..3a6c50ca21 100644
--- a/meta/recipes-graphics/xorg-lib/libxkbfile_1.0.9.bb
+++ b/meta/recipes-graphics/xorg-lib/libxkbfile_1.1.0.bb
@@ -14,5 +14,5 @@ PE = "1"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "4a4cfeaf24dab1b991903455d6d7d404"
-SRC_URI[sha256sum] = "51817e0530961975d9513b773960b4edd275f7d5c72293d5a151ed4f42aeb16a"
+SRC_URI[md5sum] = "dd7e1e946def674e78c0efbc5c7d5b3b"
+SRC_URI[sha256sum] = "758dbdaa20add2db4902df0b1b7c936564b7376c02a0acd1f2a331bd334b38c7"
-- 
2.17.1


