Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 202D47865C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 16:58:24 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id 17so7053262pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 08:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=LLDkit1dFtpOANXpGZz63jf9JvA1W75ePh6nqIfMEXg=;
	b=hceFmIr61g21sscqooWY4ikKo0dTcVJyNRfnqWBRN1n/pQ2ssi2vPQl2OOdvoR8Zg4
	cRBwD/BC1YnyNRjRF/7cztw4yk1Me4aFtNet0MgxmDrBVv4mr5U1OJSVhcbN0M4IUNyq
	50ykP+imgp1TmPI9XtstxQQ1sqxS7JgFBKrq3WTwd6hHrAAmVBBwlfxx6m2fImf/a9FS
	R8Gbegeqc9aFu7yriPrE9VtBr3qpnm+8EFpTKVmTlMQikmxXAoFk6Bm3IPR6kDQ84MJL
	tRQqeAHuQud2a9B/KOdqYEjjTTFzDkzMl54Zh4gtSzzY2OpOoTbbQbn2UBp+AI4shc4p
	6UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=LLDkit1dFtpOANXpGZz63jf9JvA1W75ePh6nqIfMEXg=;
	b=WSwFuagAQLMkuOuiWGpeX1aC9HJzUlqAxYEol+MsUtNua2BU1UoM9cV8+YgQqX4iBK
	AZllZ6Ow75XhYGxMP7CsijH8JrtD8ybXI7MIOzKNei8mFKfHK/B/dVmybpNh2DZsTwq5
	JFlZWiGYkOArhs+T22XQe00+tU2CzRTzwHFR+X4n8pvkmSjGXTPuog/JrJnUf+ayMPMB
	9Podx9OTrBYsj7tWJLJkGIt7p28ogiZNsS8rcKGhyvldAeQEQdIjzRnEzCUDfnyiz0W0
	L5qEvT0JAWnf7TS9L0EryXFKlN/ieiAF3GqfewlP+FM6XNnhZSg4+YnkBrPfT7txhkhq
	YImw==
X-Gm-Message-State: AJaThX43tt/z9IaaX0MZ77H6lt3fgvCxuPPWDbT2HtplGYttMR6rCOEd
	pTVxJ2PuL9Ap5fRujV7Cb0q8cmtRGpY=
X-Google-Smtp-Source: AGs4zMbjW6N3twXXJUYnjxi9/sLkc/xq2e5JLfG8ehnD9rkR8JSah/pJfzehvPsr8fLzelmhApQZXA==
X-Received: by 10.99.119.79 with SMTP id s76mr943240pgc.192.1510333105881;
	Fri, 10 Nov 2017 08:58:25 -0800 (PST)
Received: from [127.0.1.1] (CPE-121-222-32-11.lnse1.cha.bigpond.net.au.
	[121.222.32.11]) by smtp.gmail.com with ESMTPSA id
	i8sm15447014pgq.67.2017.11.10.08.58.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Nov 2017 08:58:25 -0800 (PST)
Date: Sat, 11 Nov 2017 02:58:16 +1000
Message-Id: <20171110165816.24385-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] insane.bbclass: add microblaze-*-elf to machine dictionary
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
X-List-Received-Date: Fri, 10 Nov 2017 16:58:25 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add the definitions for microblaze-*-elf targets to the machine
dictionary.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index def9c707a4..535d41077e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -68,6 +68,9 @@ def package_qa_get_machine_dict(d):
                         "epiphany":   (4643,   0,    0,          True,          32),
                         "mips":       ( 8,     0,    0,          False,         32),
                         "mipsel":     ( 8,     0,    0,          True,          32),
+                        "microblaze":  (189,   0,    0,          False,         32),
+                        "microblazeeb":(189,   0,    0,          False,         32),
+                        "microblazeel":(189,   0,    0,          True,          32),
                       },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
-- 
2.15.0



