Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id EF91D7BDAD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:43 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id p86so4907547lfg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i5nEqflQSDB1V2C5OIDmXZACGVGGMj6GDWjbpSYeYq8=;
	b=dlufNeMSalwl4KmC/1+x98OQBoFW4uRp9KMbHWmg0ifVC1hwgq5vk8ETzRGL27XU+b
	B0wCi10tjhwg4jsSnXdf+Im9LLD2OWTw9TmYCjnpR5YFoUBFOU+MRwjq2rsslgnNPpEx
	YLYLkvFijt9FmNxz8L81I0nYEqXnee80FDvMVNH5iHg5iIAN1t2JNzAy+bbF8oq5b9wP
	SoOSU1e/FDZ1nnY5ZKp4Hr0dQpP8eXoDhQ1Iq0Br9agXOYxCtqzcf8LPuCLqvj6Oblk8
	GDDkkL2AOixVbdwUaNsJ/HKR8x6A4r7W7N7B81Ls+BeWA2dcnPdX07wBJOHy0EZccGqR
	Hxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i5nEqflQSDB1V2C5OIDmXZACGVGGMj6GDWjbpSYeYq8=;
	b=hbm/bMm/LSJKJKzGsO5AOiNIf+UNtjYLX+CzMwty6Uvhg/fuLPA0Uz4RGxlwLGtm8T
	B7JnOGHF62PoZ9EG/k7FgYK/O7ASQ/+f+mJGfaAdVp7UWnz+/67qTx2KEcQKGTNJfFAq
	JPkqHL6fXyft73adOiAzSZbA11goSzr7ko7IrxuUUMFJtT68CtWmy+ZhTeaceDU+UN5Q
	GeytEjinAadiihUev4jeA8jJ5KM3n8PhxGEDm4ofbVhY4i54052XCsDbK+ccfxngsWdb
	c5yYvQMrvWr4mZkFKCLvcJdW4vcnlluq/GyBqe2gJNaSoxwJLTYCsPET6s5ecTB1Z877
	ahgA==
X-Gm-Message-State: AA+aEWaN+pc3xqOzw0+Pa7PfAqBeKSRmuBjCrRqk22vssPsv3VnEM1Gv
	AbxV79rM79tvTJX4IDkYkctJC/b7
X-Google-Smtp-Source: AFSGD/VlUClCu1IIRm9y/xtUnjjsEQgMPnb7UsSwMfJiYSHGowWhYD4l6+Ct7Hv/jBQpvb1HqG5yCQ==
X-Received: by 2002:a19:9904:: with SMTP id b4mr2294689lfe.95.1544810144257;
	Fri, 14 Dec 2018 09:55:44 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:43 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:30 +0200
Message-Id: <1544810082-22164-2-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 01/13] lib/oe/elf.py: Add powerpc64 architecture definition for musl
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:44 -0000

Add the ELF definition for the powerpc64 architecture when building
with musl as libc.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/lib/oe/elf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/elf.py b/meta/lib/oe/elf.py
index 0ed59ae..4cc9a9a 100644
--- a/meta/lib/oe/elf.py
+++ b/meta/lib/oe/elf.py
@@ -63,6 +63,7 @@ def machine_dict(d):
                         "arm" :       (  40,    97,    0,          True,          32),
                         "armeb":      (  40,    97,    0,          False,         32),
                         "powerpc":    (  20,     0,    0,          False,         32),
+                        "powerpc64":  (  21,     0,    0,          False,         64),
                         "i386":       (   3,     0,    0,          True,          32),
                         "i486":       (   3,     0,    0,          True,          32),
                         "i586":       (   3,     0,    0,          True,          32),
-- 
2.7.4


