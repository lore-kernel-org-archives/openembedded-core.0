Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1E169606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 03:02:12 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id w63so13342423ita.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 19:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4ImSPFixO1/ZsNNoB4xWKncb9X9ZW5TNG3Hpu+2DzPU=;
	b=QdH/HdxfQJZ66r2P+WQxY4y0OWZjjZO5OO567VtsL+oP2MA7RZO8+6SrpOpfFVO1iE
	J2VWIABhCKEaLajYEcgxA9Wx07pXMReRDM9RALQ9Lz/pddzT1Qi6reD/+MtFNOPbtsIO
	9kwnKH7X3QLqTxePbQCwXMCbgeuubxxKJCF+MjzFGCnPhGN6htb4/aThSlDk2RJo9c1k
	ZgJlzjPrRIyDidjULJw7eXekKJa6Hg5nNyLefogzoJR6o5Q5Y01JFwgDDqSnO+lfNmnU
	T1f1LkFUZaMBH4D18/YfFmzmlmge1FltrNuyEfQUuElXHhY3G94/yMxw+bWCdTbEMNPP
	S70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4ImSPFixO1/ZsNNoB4xWKncb9X9ZW5TNG3Hpu+2DzPU=;
	b=m1WbY3MPMw4A41Ha2PiBjU+h59XSi0GSsWermaczER0iDBdg2bVOMtHYodkY59UdNG
	v0Aq07gbsNuHCW258idLhWbn/sKsICRC2jA59SpJLMxN3t/wTd5o/SMuvQR9ZaOdXTry
	fFvRCwUEOvALadGYE4qjX3//tgc1UHK+jpQh0qNsSv/iBSA8/DGn7kGKaPRmKS7yn8a6
	Cuth0/japI134Dj5Ai8BKyQWPE7Fs4poWbaIREozRMHneQWN2DUa+ujpxP95jZttTjBG
	pcctWnxhGCjeQ1srba38yvOeeRdN8qIFMBtWQZPUE/ujbxZSPj0oHePn+MJW/mqW83hr
	xawg==
X-Gm-Message-State: APf1xPDJK6JqU/exOT7otAtsfbckNKD4qxKnd5laQF5kKruFUGhYFcAv
	UmOi7g25SzUToUeldPxVjI3gyV7H
X-Google-Smtp-Source: AG47ELsvGGKIi+M9syCX92KJIVq0Hh9egBF0bxQepMz1DCGZfIZ44I+G5TLCaQF2c/nLbABMLQ/Xug==
X-Received: by 10.36.111.4 with SMTP id x4mr2542814itb.51.1519700533759;
	Mon, 26 Feb 2018 19:02:13 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id m5sm6301932iti.2.2018.02.26.19.02.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Feb 2018 19:02:13 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 21:01:34 -0600
Message-Id: <20180227030135.3120-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226223054.5687-1-JPEWhacker@gmail.com>
References: <20180226223054.5687-1-JPEWhacker@gmail.com>
Subject: [PATCH v2 1/2] icecc.bbclass: Ignore more icecream vars in hashes
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
X-List-Received-Date: Tue, 27 Feb 2018 03:02:13 -0000

Changing ICECC_ENV_VERSION or ICECC_SCHEDULER_HOST should not cause
recipes to rebuild

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 36dcfbe6048..6e35e3be486 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -30,7 +30,7 @@
 
 BB_HASHBASE_WHITELIST += "ICECC_PARALLEL_MAKE ICECC_DISABLED ICECC_USER_PACKAGE_BL \
     ICECC_USER_CLASS_BL ICECC_USER_PACKAGE_WL ICECC_PATH ICECC_ENV_EXEC \
-    ICECC_CARET_WORKAROUND ICECC_CFLAGS"
+    ICECC_CARET_WORKAROUND ICECC_CFLAGS ICECC_ENV_VERSION ICECC_SCHEDULER_HOST"
 
 ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
-- 
2.14.3


