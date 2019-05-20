Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id CE71D7DF85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r4so14764151wro.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JZcO0BwK3t23xoOeLjfj9k/OZ6UK+SCICkpQi9jQ4IM=;
	b=T1QZ1oSrRlymlBGxM3/be5fMa92OakI21UUhz0LcZegzPHU9G8NgxpG8TXYQ5/mY7y
	9QUBCVUJVcVBbJiUqpM0255ASZYMjPPNBpwCijg2Izw2HPv6RuNK252Tv04hOYgMjed/
	RcSWrYe/v63FtxdzM/6co9NX7Lop59R2y8rdaog6GQYL6yrjUb/XE1CercoSbXUhLTRn
	PFA4cRMUEPUZwAeHeL/vBTGwSB0UyyyNplupHARjwniSyfx+jPJth/N98TDZeBnxSe+S
	6ViUli5Oit5TM6sWhwLYR7xF13R2LfxqeX0ihh6zGWvX+aCK7gVnINs3Ftf2jGjsEv9G
	XUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JZcO0BwK3t23xoOeLjfj9k/OZ6UK+SCICkpQi9jQ4IM=;
	b=O3CazkP18Rm0SEB5uodfYdkoS9f2Rwa2WXu2Iw7d6BMZ9jjQH9VGYdSWXTtYfYSUO0
	pdHsKf5N5LS3sBKcSCxkNKketyxx+PSlF9QeexViSzmMqJimXtfS6NWXSlKfipGSSJd3
	w967HXtINXrSWk7Y/ScnGpLfjxrEFf4Z0MCxR3O3XuUaw+uf7aUa7PTp4aFpb+B9rrlK
	xKuviOSQAxLUNnWYQ98nuJLCoHBsAV1J/VIQcWTGZbIf5X3so5eJY7xSntlAG8trmX3j
	8kY0cJJXIYSbQzOlBOsfXsKL2MMGpf0wELG0mJvExd+0weZFv99SP2E3alei6HJdNZHd
	OOVg==
X-Gm-Message-State: APjAAAWRhRj3S9biELGgOh9JmHtJblH+WY1jAnEiShEzLiBswBFg3lmZ
	2MaIe+KDKCpt3XAVkWDMCyLnB2Q/
X-Google-Smtp-Source: APXvYqyyZn07Xx5EGKVOYZdxMJ8I1nZWnhgUl4YaeB2ALfZypgdsYiOIZb1TXp0IgU1qrqoxAGewSQ==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr17709159wrn.198.1558361503483;
	Mon, 20 May 2019 07:11:43 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:54 +0200
Message-Id: <20190520141125.10805-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/42] nss: upgrade 3.43 -> 3.44
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
X-List-Received-Date: Mon, 20 May 2019 14:11:43 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/nss/{nss_3.43.bb => nss_3.44.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/nss/{nss_3.43.bb => nss_3.44.bb} (98%)

diff --git a/meta/recipes-support/nss/nss_3.43.bb b/meta/recipes-support/nss/nss_3.44.bb
similarity index 98%
rename from meta/recipes-support/nss/nss_3.43.bb
rename to meta/recipes-support/nss/nss_3.44.bb
index f8cf5a46afb..4205d79485e 100644
--- a/meta/recipes-support/nss/nss_3.43.bb
+++ b/meta/recipes-support/nss/nss_3.44.bb
@@ -33,8 +33,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://system-pkcs11.txt \
            "
 
-SRC_URI[md5sum] = "67c8fa282c32cb56117fdd530dd77001"
-SRC_URI[sha256sum] = "f30bc1b7330887b75de9fec37dbc173001758dc43fb095ffbc45dac4093fe2ca"
+SRC_URI[md5sum] = "e9222b9573452b9f4e6ff4915d6407c2"
+SRC_URI[sha256sum] = "a5620e59b6eeedfd5a12c9298b50ad92e9898b223e214eb675e36f4ffb5b6aff"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.17.1


