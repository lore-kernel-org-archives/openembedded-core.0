Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 00B0B7FDC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 21:58:52 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z7so13513035wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wdLUJh/1oFlDoL1OpThBe7bBdqn89kq08rUHihZeBF4=;
	b=tizI5/wIzWV7DbXi0xHlr5JlmEIeptrqgrDIKSZBnsakSwJx5iT8zdiyTOjL4J3Okh
	FhB7eOkL/isboDmExAk9G8HvHqqwTmRoGWC7T1+JhLCUhCN2YSpxgQQ34toYIIq/Xlf6
	BiUQYiuS6bIOSucEZzNaTd65UucCLpUdh5g2ImPVrQeIiN980zkh8JW9ZplTPo2IHMzK
	sOPdc+VkxigkhHNu5CkQE49UVNKWVSxCRLuiKx6H93pklcHM3IrJogWg46MpUtzNpWeQ
	3uS26oX1d76T6kQ/ZyzVwHiYcrLn3zNkQLVsbqVZa1o5EhpuflixekNVV+dJkMYfFRul
	m2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wdLUJh/1oFlDoL1OpThBe7bBdqn89kq08rUHihZeBF4=;
	b=hWNNxHX5jNqmhUiVwl7kmYKG4kzjoy4p7YguYWDzxqZx+2BUlOy9XbTZIhCGV7C1ad
	RUXD+O1lV5KJYU4YPTipLgccYkUiO82UXj60mzNHy6MjXCp6uvMdlRjrrUQmo42skT5y
	npFV3RRw4n3rBbRuvpOUXa968krDh7ECl6LM/KYqzl1VwdIQUfdUU1jtjP2ZsKU9LZaV
	LwcGnHSd9AlWQ3yQeRTKcmS2in7FVqdOCOWMcn+Iyb9U5HF23l0RpfqOXZ/Sz3tMyVYF
	RcGzhdLBDe/DfiokI5qi7xGqvpwqiLsjKkt0bETIo5WBmuAnGh7qe1LoaZO97BNuJibY
	BFqg==
X-Gm-Message-State: APjAAAUcGY9r6AaE2z9NxFvPu+UfMjea2YaRlDK5aYRs8TkPjFnNN99o
	GgWpIHWhm5fjrhlm+FWHpL7Vk+TG
X-Google-Smtp-Source: APXvYqykrgi1FEuQwoZEkcwsrnYqc/QciLBGUNY01Yc/UBuYa8JLDK3X5T29MTVPN+5SE+tNmb7jQA==
X-Received: by 2002:a05:6000:160d:: with SMTP id
	u13mr23256853wrb.22.1580162333261; 
	Mon, 27 Jan 2020 13:58:53 -0800 (PST)
Received: from cmtcleu60844809.rd.corpintra.net
	([2a02:8109:b5c0:3fe0:dc62:8512:95d7:1c04])
	by smtp.gmail.com with ESMTPSA id b16sm194198wmj.39.2020.01.27.13.58.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 13:58:52 -0800 (PST)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jan 2020 22:59:26 +0100
Message-Id: <20200127215927.19826-2-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200127215927.19826-1-changhyeok.bae@gmail.com>
References: <20200127215927.19826-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] iw: upgrade 5.3 -> 5.4
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
X-List-Received-Date: Mon, 27 Jan 2020 21:58:53 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../iw/iw/separate-objdir.patch               | 24 ++++++++++++-------
 .../iw/{iw_5.3.bb => iw_5.4.bb}               |  4 ++--
 2 files changed, 18 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.3.bb => iw_5.4.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw/separate-objdir.patch b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
index eb01a5a14e..179fd90124 100644
--- a/meta/recipes-connectivity/iw/iw/separate-objdir.patch
+++ b/meta/recipes-connectivity/iw/iw/separate-objdir.patch
@@ -1,3 +1,6 @@
+From ff9f0a631c99fb6e2677c02bf572a5e69c70f5cf Mon Sep 17 00:00:00 2001
+From: Changhyeok Bae <changhyeok.bae@gmail.com>
+Date: Mon, 27 Jan 2020 22:48:03 +0100
 Subject: [PATCH] Support separation of SRCDIR and OBJDIR
 
 Typical use of VPATH to locate the sources.
@@ -11,12 +14,12 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 6 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index 33aaf6a..9030796 100644
+index 90f2251..714cdb9 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,5 +1,9 @@
  MAKEFLAGS += --no-print-directory
-
+ 
 +SRCDIR ?= $(dir $(lastword $(MAKEFILE_LIST)))
 +OBJDIR ?= $(PWD)
 +VPATH = $(SRCDIR)
@@ -24,19 +27,24 @@ index 33aaf6a..9030796 100644
  PREFIX ?= /usr
  SBINDIR ?= $(PREFIX)/sbin
  MANDIR ?= $(PREFIX)/share/man
-@@ -103,11 +107,11 @@ VERSION_OBJS := $(filter-out version.o, $(OBJS))
+@@ -92,7 +96,7 @@ all: $(ALL)
  version.c: version.sh $(patsubst %.o,%.c,$(VERSION_OBJS)) nl80211.h iw.h Makefile \
  		$(wildcard .git/index .git/refs/tags)
  	@$(NQ) ' GEN ' $@
 -	$(Q)./version.sh $@
 +	$(Q)cd $(SRCDIR) && ./version.sh $(OBJDIR)/$@
-
- %.o: %.c iw.h nl80211.h
+ 
+ nl80211-commands.inc: nl80211.h
+ 	@$(NQ) ' GEN ' $@
+@@ -100,7 +104,7 @@ nl80211-commands.inc: nl80211.h
+ 
+ %.o: %.c iw.h nl80211.h nl80211-commands.inc
  	@$(NQ) ' CC  ' $@
 -	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
 +	$(Q)$(CC) -I$(SRCDIR) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
-
+ 
  ifeq ($(IW_ANDROID_BUILD),)
  iw:	$(OBJS)
---
-2.20.1 (Apple Git-117)
+-- 
+2.23.0
+
diff --git a/meta/recipes-connectivity/iw/iw_5.3.bb b/meta/recipes-connectivity/iw/iw_5.4.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.3.bb
rename to meta/recipes-connectivity/iw/iw_5.4.bb
index f7f13f5a30..9f58e49709 100644
--- a/meta/recipes-connectivity/iw/iw_5.3.bb
+++ b/meta/recipes-connectivity/iw/iw_5.4.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "6d4d1c0ee34f3a7bda0e6aafcd7aaf31"
-SRC_URI[sha256sum] = "175abbfce86348c0b70e778c13a94c0bfc9abc7a506d2bd608261583aeedf64a"
+SRC_URI[md5sum] = "08a4f581a39dc62fa85d3af796d844b6"
+SRC_URI[sha256sum] = "943cd2446a6c7242fded3766d054ab2a214a3514b9a8b7e942fed8fb13c1370c"
 
 inherit pkgconfig
 
-- 
2.23.0


