Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D995C41513
	for <webhook@archiver.kernel.org>; Sun, 30 Jun 2024 20:08:08 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.4346.1719778080445096467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jun 2024 13:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AcZUhVKC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-70abb539f41so418905b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 13:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719778080; x=1720382880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R5zjB7XX0WoVe6vCdNf2LcV2gZfYaHHnZV9ZUP+EMJQ=;
        b=AcZUhVKCsLycx/8gaz9Nb1Aqqv3gSfOWCA6Va4NP2Q+7AC1kN1PYIfCRr65laorb1c
         sdfGQtDW5BvOLihY3Y+poMEHV0YLSNnpbm9nm6rJaFD+Ko5d3bdyVwq70icuNc9t1oC2
         T/pUxO5rbVjGKHU155FNEllYNM1KxzVw8gPrhIaHg69+N4yitTmgjJSheIVY5x5P59br
         caXuSZCYHKClYMnjG3azgENX3oH3YEaKLH+WYv4zYZVsD8jz8pyUkjXygGHcSOhYNuhN
         nYhVGpN8cEKZXTyV+sMHMUrQGsq4oX6RIxbie7PVkPWdhSUA8nLo+dPE/a97QfIFeUXD
         dyaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719778080; x=1720382880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R5zjB7XX0WoVe6vCdNf2LcV2gZfYaHHnZV9ZUP+EMJQ=;
        b=tog4eTE3A101v2UZUaYYIdYsHvUvRhfr8vGuqz2FJGDzjz8QmCCbbStcy0kkpmOSOm
         Gij/yazugH0xh1IuFsYZWvBss064EmPfsnaPZTamcIO0ZkcA1exif7Z/OPFGgAb1IulL
         eBgzLusc+fV9B1p7AXfZUVGDognlGtgYfxCfZRlpxpCashgUBcaBA63eaZakTucNq/h7
         V3ofa3bEH5v0d9dwrsiqYoN+9tdoD3Fxedp0OUdInXxA7wL7/0X4Fizb6V009N6Gg2IP
         NqTp6x8anaXC9+CAulaeVMqKr5+3AFaegmKw/NMf5TYHB9PFs+XNM14EroKshyMK2M/n
         rDhQ==
X-Gm-Message-State: AOJu0Yz/nQ6Lru3QuLrZ5bGGloi99ewFerc751LRafkzstA9nJNUuUCZ
	tIkVo90IuqoyvgnrfJoXny+n8l/jVjzpZl+6kFAzq9ekf+io6bP8CWjTsGLGgEfddL+URaQThiM
	zK3k=
X-Google-Smtp-Source: AGHT+IHdt/WvFMjdQFrdrfhbLSk+kg2O/IIgdIE2IuQG/QwyO33tb/lbHcP0OmGu8yRaUq9m8twqaQ==
X-Received: by 2002:a05:6a00:1482:b0:706:9030:895c with SMTP id d2e1a72fcca58-70aaad2c109mr5586959b3a.3.1719778079649;
        Sun, 30 Jun 2024 13:07:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6a6f0817sm3340835a12.27.2024.06.30.13.07.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 13:07:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/35] python3: upgrade 3.12.3 -> 3.12.4
Date: Sun, 30 Jun 2024 13:07:16 -0700
Message-Id: <621b0298e1829a86002ebb57d99850907e775b43.1719777887.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719777887.git.steve@sakoman.com>
References: <cover.1719777887.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jun 2024 20:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201240

From: Trevor Gamblin <tgamblin@baylibre.com>

This release contains numerous security updates and fixes to
regressions. Changelog:

https://docs.python.org/release/3.12.4/whatsnew/changelog.html#python-3-12-4-final

Results of ptests in core-image-ptest-python3 (qemux86-64):

== Tests result: SUCCESS ==

26 tests skipped:
    test.test_asyncio.test_windows_events
    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
    test.test_gdb.test_misc test.test_gdb.test_pretty_print
    test_asdl_parser test_clinic test_devpoll test_idle test_ioctl
    test_kqueue test_launcher test_msilib test_startfile test_tcl
    test_tix test_tkinter test_ttk test_ttk_textonly test_turtle
    test_winapi test_winconsoleio test_winreg test_wmi

9 tests skipped (resource denied):
    test_curses test_ossaudiodev test_smtpnet test_socketserver
    test_urllib2net test_urllibnet test_winsound test_xmlrpc_net
    test_zipfile64

454 tests OK.

Total duration: 2 min 45 sec
Total tests: run=41,470 skipped=1,548
Total test files: run=480/489 skipped=26 resource_denied=9
Result: SUCCESS
DURATION: 165
END: /usr/lib/python3/ptest
2024-06-10T17:03
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 012aeee398af4d4cce4012f71007cfb31266dd6c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.12.3.bb => python3_3.12.4.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.3.bb => python3_3.12.4.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.4.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.3.bb
rename to meta/recipes-devtools/python/python3_3.12.4.bb
index 9f41cd1e6b..0cb84b91b4 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.4.bb
@@ -37,7 +37,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "56bfef1fdfc1221ce6720e43a661e3eb41785dd914ce99698d8c7896af4bdaa1"
+SRC_URI[sha256sum] = "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31b32de2b0e79554"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


