Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413ECC52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 04:19:10 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.64897.1723522738850582663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 21:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kUINWVhF;
 spf=pass (domain: konsulko.com, ip: 209.85.210.177, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-710dc3015bfso2341908b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723522738; x=1724127538; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFGsC0nD6K9IL3PTpOixQGQ46oYnEaMBBZ1zhfqtzbo=;
        b=kUINWVhFFu+BUG5pQwMfJ34lYYtXbielwPsdOxBZVSWPavtf4+GORrYBBEamMf1ugh
         pAcJWtw0Ei04CAG0TVU4dmzR0xpYuP2ZmoaHmJLcUfJtdmrpeAV7YbzJzuO76K+sqtef
         A5rPhwkEXwY5+OxRuteddiH0A0VUR21Kv0eRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723522738; x=1724127538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFGsC0nD6K9IL3PTpOixQGQ46oYnEaMBBZ1zhfqtzbo=;
        b=eR8onqJCzI2ucrdx1nD2JDIWGL8/fSvFLsXAATdRYfCJteMG+tem6R+dEPy5dIJx0m
         szCItugVSOpyzurt/WcTJzVNqiFywW5XgAaoA03NOMCvKDxc/kXUs3a/EageG+BPZKFD
         n7cWhbC8onwGhJfw97C9NwgZMBl7AH1uKkmTBA3AF8n7A1oh3Rl/Y+kft8m5M/mMPtTm
         ERtCX69DyRbrSp/dayuj4twDD9EA1uyDmmDZCVx6qX7PLyE/J6NNIE3CbGdYjbOpyvBs
         JXwie9WN30ghzzncrn69YFgsrMez+NkK4bbMseD9VIVB56ZHOmyE+ueoTxTWTb+vVM4E
         A6Sw==
X-Gm-Message-State: AOJu0YxYdtY33Lic6TeLrPecKTUXRh2Qf004lxjpTCg8KHcYcH1B2k7r
	3frKv+t9kGpdjzWFE9YTvI74C0T5tCpqXyLIQHvV0wDwWDvlJRCm/yeVGDDF6hGH/KKtjyYug2B
	WCPs=
X-Google-Smtp-Source: AGHT+IEOfaZEvSVy+XFI2zUQhMS341dgCWOW6yv/5jvOR0YgeLcDUFEme+8fBI6pRrtla4068UwRPA==
X-Received: by 2002:a05:6a00:3e07:b0:707:fa61:1c6a with SMTP id d2e1a72fcca58-71256fbff2bmr2454036b3a.10.1723522737705;
        Mon, 12 Aug 2024 21:18:57 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5ac46edsm4761513b3a.220.2024.08.12.21.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 21:18:56 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cffi: upgrade 1.16.0 -> 1.17.0
Date: Mon, 12 Aug 2024 21:18:52 -0700
Message-ID: <20240813041852.1156097-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 04:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203244

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/python-cffi/cffi/compare/v1.17.0...v1.16.0

https://cffi.readthedocs.io/en/latest/whatsnew.html#v1-17

v1.17
  * In API mode, when you get a function from a C library by writing
  fn = lib.myfunc, you get an object of a special type for performance
  reasons, instead of a <cdata ‘C-function-type’>. Before version 1.17 you
  could only call such objects. You could write ffi.addressof(lib, “myfunc”)
  in order to get a real <cdata> object, based on the idea that in these cases
  in C you’d usually write &myfunc instead of myfunc. In version 1.17, the
  special object lib.myfunc can now be passed in many places where CFFI expects
  a regular <cdata> object. For example, you can now pass it as a callback to a
  C function call, or write it inside a C structure field of the correct
  pointer-to-function type, or use ffi.cast() or ffi.typeof() on it.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-cffi_1.16.0.bb => python3-cffi_1.17.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cffi_1.16.0.bb => python3-cffi_1.17.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb b/meta/recipes-devtools/python/python3-cffi_1.17.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-cffi_1.16.0.bb
rename to meta/recipes-devtools/python/python3-cffi_1.17.0.bb
index e740ef45be6..28200f9b431 100644
--- a/meta/recipes-devtools/python/python3-cffi_1.16.0.bb
+++ b/meta/recipes-devtools/python/python3-cffi_1.17.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5677e2fdbf7cdda61d6dd2b57df547bf"
 DEPENDS += "libffi python3-pycparser"
 
-SRC_URI[sha256sum] = "bcb3ef43e58665bbda2fb198698fcae6776483e0c4a631aa5647806c25e02cc0"
+SRC_URI[sha256sum] = "f3157624b7558b914cb039fd1af735e5e8049a87c817cc215109ad1c8779df76"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.46.0


