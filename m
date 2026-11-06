Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10938.1793927635016071430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 17:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HN+g/IZ+;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: ragaprasanth@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso206051eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 17:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927634; x=1794532434; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eSiyDqZ6puBrhOudc6cZu2MCSAOX3L6d7YDAP5wdeZQ=;
        b=HN+g/IZ+ohhZyyoOzBKzH28PoRjZwabsgkXhkUtXQFa22Q2xWwrnFAFkBkUOvw1HBc
         ndsKNBG2j88Lm6Nf0P/BU31O1wkN/mFnEjIQKBja/txHsv1CKv2OsD3UYrJa+SJ9987v
         WrBhnsH9JOZNDtvknt3hebwYYpuG9LZRgZ4drx4KKJwRFYyQ9ATIBZs0spP5lDQhD3bz
         6xEe+75YMNdauOzk42pKG6mKBGeGPO0Hfr+MD1BF4QlDFrRaNJGCrMq19KSW58ymE/2a
         dqCvFBBScMvM+dPnGSElIDzahnlKErtP53TnYcGF02wdnvqgd8Fr0Qi0nTX56PrrlnBt
         fdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927634; x=1794532434;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eSiyDqZ6puBrhOudc6cZu2MCSAOX3L6d7YDAP5wdeZQ=;
        b=NttqrdEUoCBFmC/nXwDhU0xwNhqR9DX2H490Dagk7qjSvtaSvcL5N+RjMFEJh9aBwK
         lK9NYtXc/8e+i4qUJ4LBLvugLy/9FejJRKx7W7SkksInPec6JSxM0acBjPW16xFsYo8h
         ij6UlpZVMVs+dRiigrX84hK2FkobFYB4QbcW4C9XLtugp3GLeuEMs3BnWP3jQB56FOwB
         DLJF7ztwH8maqGPSew7XhKPq5T99UuwOw8P2zlSMzoBdnhlLI/IC/g1ZcU7ZU2uGiPuu
         iB2JfSce0N0gdwupAHe/B0/PgWQ/Cp9oDLvMxd7J7qVMn7v7kaeu0cQfYVV1s5lgVpMb
         DMJA==
X-Gm-Message-State: APuU4Z+yfBGB5m6c6wvEkEo+HLiAKOMyjhoWztCig95jDDOCad59YGU3
	zk2VvLjBVrhY0RRd5OR1tn4XgO5fAiAgMYkzB3TUS33fvgVWhc9yKVHwPT25ow==
X-Gm-Gg: AYBFou1AVTAeoZ+kmiMUK3HSWav8FFRR3ErIS13aIj7Ej4sc4mK9CQ8ezxbj+4dBH92
	63wrVAiZwAh3s8t5/qDo+SUb1t4rRe9lal/mAWZhhbiK9/x0ZA4ZqgiC+XH+9QKK2Q/AzJDHmha
	KrfqoFFQVqScdIifgyHwjo0P4svHTKxnJBpLhhW0ZUiSkLlYczbjiWXzeJ+fd/UfuUcYzObxSQq
	fr0I2Qhz4snFFyMy5zqv5tfxnTq556M5LvjwT4BJXPvJEzkyM7CfFHSnBq8VKYoA6dsJXpHe3W1
	qrcn04jEcAs61zkoV6kFv+jNUKlBreTzbs5JmkL9/XMQ/zz205s0wnFwpYdfhLt+KPQMtXWdyW7
	v5AstKllqLCzxm427v6r84dpRfpQa+TnSRpHwLEth+yygLPRNHeKjlpGnaP+25rqqSQV7UQPulT
	f11FY2C0oQVBdf6B9BUy7pZhi58pggJZ9A8cbUqtEgIT6qmcp0YbnPeZge9ItPdZpdeQ/SEqApJ
	Vv7OQZ6sniPmUblTlQGq4OUynOA2TBqNqh5wNdrK8nuWaApt0DHZC6HPPEfY6kVLo9q9AscAX66
	NA2krAQgCMZFMPtVv4BU9ayojwPuOwqJNFikX+41XDwhAtQLwJvYJBYSWqUrtWwh
X-Received: by 2002:a05:693c:2585:b0:36e:fa91:b6e3 with SMTP id 5a478bee46e88-36f75838d8amr1099531eec.17.1793927634095;
        Thu, 05 Nov 2026 17:13:54 -0800 (PST)
Return-Path: <ragaprasanth@gmail.com>
Received: from prasanth.alps.lineo.co.jp (vpn1.lineo.co.jp. [203.141.200.204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm1166949eec.10.2026.11.05.17.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:13:53 -0800 (PST)
From: Prasanth R <ragaprasanth@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: paul@pbarker.dev,
	peter.marko@siemens.com,
	Prasanth R <ragaprasanth@gmail.com>
Subject: [PATCH v2 1/2] zlib: upgrade 1.3.2 -> 1.4
Date: Fri,  6 Nov 2026 10:13:23 +0900
Message-Id: <20261106011324.626292-1-ragaprasanth@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 01:13:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249581
Content-Type: text/plain; charset="utf-8"

Bug fix and security release. It fixes CVE-2026-85091, a heap buffer
overflow in gzwrite(), and several inflate, deflate and gzread issues.

Drop the -fuse-ld=bfd workaround. 1.4 fixes the configure test that
failed with lld 17+ (upstream commit 6ddc2d0, "Fix configure when using
zlib.map with some linkers"). PR #936, named in the old comment, is
about --zprefix builds, which we don't use.

License checksum is unchanged.

Changelog: https://github.com/madler/zlib/blob/v1.4/ChangeLog

AI-Generated: Uses Claude
Signed-off-by: Prasanth R <prasanth.r@lineo.co.jp>
---

Notes:
    v2: zlib 1.4 is out, so upgrade instead of the backport (Peter), and
    mark CVE-2026-76844 cpe-incorrect in a separate patch (Paul).
    Also drop the lld workaround: tested a 1.4 build with gcc + ld.lld,
    same exported symbols as with bfd. ptest passes on Test.

 meta/recipes-core/zlib/{zlib_1.3.2.bb => zlib_1.4.bb} | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta/recipes-core/zlib/{zlib_1.3.2.bb => zlib_1.4.bb} (85%)

diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/zlib_1.4.bb
similarity index 85%
rename from meta/recipes-core/zlib/zlib_1.3.2.bb
rename to meta/recipes-core/zlib/zlib_1.4.bb
index 8a23d98cd3..18b27df878 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.4.bb
@@ -12,16 +12,13 @@ SRC_URI = "https://zlib.net/${BP}.tar.gz \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-SRC_URI[sha256sum] = "bb329a0a2cd0274d05519d61c667c062e06990d72e125ee2dfa8de64f0119d16"
+SRC_URI[sha256sum] = "02dd159783677a749c04adbdd02b55b8a2bcc7e054f51b76b549199a916ad584"
 
 # When a new release is made the previous release is moved to fossils/, so add this
 # to PREMIRRORS so it is also searched automatically.
 PREMIRRORS:append = " https://zlib.net/ https://zlib.net/fossils/"
 
 CFLAGS += "-D_REENTRANT -fPIE"
-# zlib does not build with lld, keep it until https://github.com/madler/zlib/pull/936
-# is addressed
-LDFLAGS:append = " -fuse-ld=bfd"
 
 RDEPENDS:${PN}-ptest += "make"
 
-- 
2.34.1

