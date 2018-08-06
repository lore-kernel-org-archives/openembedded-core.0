Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BA10E6025E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 16:20:08 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id b16-v6so9852994oic.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Guajl4FvBAuvbgEitSQKUFxBFYxtrwxSlq/fx5r0YqU=;
	b=Dx+8zf8kD5OmdntR47OzRjccWZeJnNO2abCO600maGCNBEz/tS/q9serLkVP488gkU
	O9Tv27H0CtXnyzx7c9A4INkSsZsaVmYHeHzJlo0wEMYmIfiOodlSwBhXbwRAn6W0QIqu
	v2jN6RervJCqxsjoVtJ5AJY537GLaqnyZZbJsEbMyvAfR6CnMdMi1GVCHBuTsx8tBsA6
	iM4o3/St1wS/X/fi2YvaKIYswA0NXjldObtM/mDEX9G038oN4wFBRjxRwB2kK45qHxUP
	aQr0njl4XDqH9o4/cYHkX5r9i+NyOH4xoMCQVuKK2HwEMfLASxBI0dBr2+oF0seXb+ic
	DnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Guajl4FvBAuvbgEitSQKUFxBFYxtrwxSlq/fx5r0YqU=;
	b=Z1KjQoEXY71LH+aGd19puNC6MPJxUbWtJMISFD9H9XMXS1jP4yex/2BH9GDYQr4Uzt
	BVlmZ6R6F2ogg0jHer/jpHtgwRvJV5kprWyrbJRzzAwBIK9KeuTQeBZhglpxz9K6FVWV
	WUVzmRt1TCYKZiIa6m8cnItFV8XiJ7J0S9RkSN/SGyuzxIi/LgtoXjfC8g2dKvsXPMpb
	hvOYUnP3AFgy3+PrUIL55/EXz2jygCYHQ9QYBLwvIWWtSehVgfPZ8XUZG2lLTwHCsLcx
	aSqY32gA72hHtEPdisSNkBkuR4YjfuTI34NlZmzG/CJ1ZKR+2eXLotPwo/nk18PUCPpD
	V/VA==
X-Gm-Message-State: AOUpUlFMUpxhkizT0LXJ7TzOyk4wT8rsxC3L8j6CzBKoDG2u45oRUXlM
	hY4VG1SkclhiFkHIVRQ+HSo=
X-Google-Smtp-Source: AA+uWPyM6lES131c8QlGUOWJCRVmSnN/wFavNTW7DEklOvWRpEcDlXIGsGfKIS6ysJqsyeNA+ucgbw==
X-Received: by 2002:aca:2e86:: with SMTP id
	u128-v6mr14181102oiu.132.1533572409671; 
	Mon, 06 Aug 2018 09:20:09 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:ac25:fc33:9f90:b6d1])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm11896374oia.31.2018.08.06.09.20.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 09:20:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 09:20:00 -0700
Message-Id: <1533572407-3066-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/8] yocto-uninative: Update to version 2.1
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
X-List-Received-Date: Mon, 06 Aug 2018 16:20:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This fixes issues with fontforge-native.

(From OE-Core rev: cec85a6fcadc24fd266fa34631cb095e0a773c1a)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index a8e82cb..dcd59f8 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -8,6 +8,6 @@
 
 UNINATIVE_MAXGLIBCVERSION = "2.27"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/1.9/"
-UNINATIVE_CHECKSUM[i686] ?= "83a4f927da81d9889ef0cbe5c12cb782e21c6cc11e6155600b94ff0c99576dce"
-UNINATIVE_CHECKSUM[x86_64] ?= "c26622a1f27dbf5b25de986b11584b5c5b2f322d9eb367f705a744f58a5561ec"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/2.1/"
+UNINATIVE_CHECKSUM[i686] ?= "a90db17d8845ece764aaac19348cd78504c0e554cb998da39ebad03aeef76185"
+UNINATIVE_CHECKSUM[x86_64] ?= "d43555df8d5a056ef5b20c7d8e0287207974e09df1e969a3e19302c8b4ea6b4b"
-- 
2.7.4


