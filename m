Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17782.1795793194768454732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 07:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=TG7LSKG0;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386ab9ab619so11335954eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 07:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795793194; x=1796397994; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YJ0ZugE1BZHLwcET2KIi/+OBoo5FlZUV05q6LKfIDQ=;
        b=TG7LSKG0Yg/3JXmI8rPSn+OBKtlr0WxK9Hi9Hy/bnbcJ0I+YIVFE8IllhYCHAJS5ca
         LNIUmV/xPI0NYLujvjeJ5ac5EqRUrvm5Ozdp6byURFUX6Vk1b4v0sS1pEdVajiMTbXnW
         gT483m85ng1RcYB8AdY52Hrf+FHMplXu8Kw0alR2YKTAv44aWv/WnhnCqV1RBcdM4Qzq
         m1XW9AVbKAzBYSJ7g4wLI0cTwkQzAEf1fcdxS7VVniMxhlIYEZyyUNvIElQiqEIScsek
         hyXN4LHnnv6KizmWH9+DWGxgLmkYRgFuZi2NLcy1VP3Jny1/wehPwfuQgpcvuAEmevCn
         nyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795793194; x=1796397994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7YJ0ZugE1BZHLwcET2KIi/+OBoo5FlZUV05q6LKfIDQ=;
        b=lilUagEx1PfMWvf0/1oAF//6+ishwrOxX8wc64xS0/4IYs4TYFUuBGfcP9HKO3Rbaz
         wMOQ/O46RrR2ybLqj5eicMcYt5K5Mh6urFCYwimejzEzxnlkz+4MxpKuWAzAvFYVP3Nd
         V1jwtTgg3I+2u4my80l6sxU+qYOyJWF8e5aTpplm0E7X02UVUBLyATSAzEuW6oEnMJuL
         3CReRpW5uFg+9G8kN7xn3cytdcFYM0ERIiv3ZBqfznUuBsrsj7aKqICiak9YX+nOewiJ
         pfAPzkloc7BMRmTs7SjEhazkpeo/czn9HyW2BjAxtDxnffgMRuwxcAiaqxEbBSnaAkZG
         lpQw==
X-Gm-Message-State: APuU4Z9Z8Eryv0yt5oj5Cssqnks1QS/+r6akI5KA6Z52YT+d/JU03Jz3
	DQ8xPr+VV23WCbncAuZavrZggXsSSG6rESp+/K7e0PJ6DzNDJv361tltjZeTHgax
X-Gm-Gg: AZFdTZfI3cs2s/uPJtVy8vy0K27nuWWyESnC6ms5jwbA14ZOjrblM4x4w8NFyr3hsN3
	I8NEF+3bMOFUSL4JMGAlfvrr6I3q/aHnP/AMiwtyw+S9uat5FJw8tBUfNIzks6ykE/SjYxVUSxz
	PaRy/mUkbtCGEF+imB3l3GoDTiGFh/yFDJTWowyboShr87tkjCUcfgEdsFfWFiRGc7Ecg+LpKac
	W8Ugh6pEFygPz/KknHHJkkUWpsO7PUxt0gZrgXMY1i31BQ85TSkX5aMgI7+uEGEutaOz4dorav7
	cTQE5h52UifOS1G/nPQBkWc8+m8sTU+wXqSmiIapKWtk/9ByQvlVYzBGSY2rkx6biPKfhgleJ5+
	4Z2S9C8v/9JA6G3fJS6LvkiUtNIXdjHM2QUKK9XWSxvCRMguQTUG+ZM+XZjT/DqgdTzEanaJgiY
	48YGTzPC6145Cq72tm7hsVBH/JxZjMct++YueDB9s0koCyk8CC4QeOq7zQEQvrA3L3uK7kYa6kF
	28IvDEawhckTZl9nq39IO3wUYIXnlrW5qZdy5j0E0mLTgWwDAXuNEe/uShGDDJPECGeTEa8QrgS
	qiPlHRFvX/1Im4bSE+ay5TSNoVfhmYSfobHbx7NnMqslMw/mgFInf/Th5RxCuXLF5dZiodPi3Re
	v5hl9uE1yr7/BDxW82jdmmd9xc4gbyXOWOAV1pkwTbbmqIOoATUNb5F8L05d9UXgApaHljYUMUE
	XUONzVsFZMq9pkjP8oAHvOnv4QIWK2Ow/fqxLI/l6aIIFpZv20ySDideK1B99agtly6eSXzM7Ri
	8O/n+BaVv/EneN8gsGQ+1MpJLrfAyi2fqRynAmerjOUUpVIaGcS4gjTbJfyPfyOfZOIWXMwZ71K
	v8LZ
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr27373317eec.5.1795793193735;
        Fri, 27 Nov 2026 07:26:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b1965c02sm40115730eec.27.2026.11.27.07.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:26:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Peter Marko <peter.marko@siemens.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: [PATCH v2] sqlite3: Enable unlock-notify for native builds
Date: Fri, 27 Nov 2026 07:26:01 -0800
Message-ID: <20261127152601.2851647-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126212957.2477520-1-khem.raj@oss.qualcomm.com>
References: <20261126212957.2477520-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 15:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251399
Content-Type: text/plain; charset="utf-8"

Rust crates that use sqlx with the system SQLite build their sqlx
proc macros for the build host, and those link sqlite3-native. sqlx
needs sqlite3_unlock_notify(), so without it the macros fail to load,
e.g. for influxdb3 in meta-oe:

  libsqlx_macros-<hash>.so: undefined symbol: sqlite3_unlock_notify

Drop the native PACKAGECONFIG override, so native uses the same
defaults as target, which include unlock-notify.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
v2: Drop the :class-native override instead of adding unlock-notify to it,
    as suggested by Peter Marko and Peter Kjellerstedt.

 meta/recipes-support/sqlite/sqlite3_3.54.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
index 681b8e1e20..af8158ed2d 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.54.1.bb
@@ -32,7 +32,6 @@ CVE_PRODUCT = "sqlite"
 inherit pkgconfig siteinfo upstream-stable-release-point
 
 PACKAGECONFIG ?= "fts4 fts5 rtree dyn_ext unlock-notify"
-PACKAGECONFIG:class-native ?= "fts4 fts5 rtree dyn_ext"
 
 PACKAGECONFIG[editline] = "--enable-editline --with-readline-header=${STAGING_INCDIR}/editline/readline.h,--disable-editline,libedit ncurses"
 PACKAGECONFIG[readline] = "--enable-readline --with-readline-header=${STAGING_INCDIR}/readline/readline.h,--disable-readline,readline ncurses"
