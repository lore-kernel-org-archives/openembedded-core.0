Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60747C83F1A
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 05:57:11 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.5745.1753336625310533527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 22:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QPVK/kyS;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-235ea292956so4946575ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 22:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753336624; x=1753941424; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TLLqENqTAHgo8oS+H4M5eSI5/iHXQHgY3LpFnN3l0t0=;
        b=QPVK/kySI/n/myXlopqQU5qXYftzINzBGnCEk1K57QuPUnRakb/XDj8hSNlX1MXNv/
         /ciDFNx8wipPop3Kpto93PFsGUKCaRXLg7xVpf2gd5RNloL5QJQu9x9bRIDAMB4h9PTa
         riJGf/1tujgGgwVo9dvyRUyM0ki6b8Iq7tBETDTpF6Igojw45wSDoDSQvrW15p34ZSzF
         uHl7HuVz8fJY+gqUuLzhZmb31P0BrKPkinqjXwEclK2wS3yqIJ179jAZeq7qiRrV2KyP
         sMdjXPpIr2fggVdgcSa69jUz5pUWpMZ7PdomzQveB9nCbap4Jbl/9NJjw3KB4ZLLdPtx
         AzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753336624; x=1753941424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TLLqENqTAHgo8oS+H4M5eSI5/iHXQHgY3LpFnN3l0t0=;
        b=Rx9wqVNv/7pyMufSFKK03lIe4e4yUFPySXaCRl2ehv6EBbyfHjZozQ+iKVZ7UErGEl
         Y/tClqZZcDcy0jVk8/9CCC8G0in3BZo+o7Q1hKiGO+MSTMwkoP1cLgDQc75CvBs7nR9X
         inIUe44pXsQ4YG0S1Tco7OscTwaLfzqN2Fsix9M34SlMDhcrRtQW5WpqK9zmXz5fe8mW
         Thhqa25/L/CoGi9df5mfUekPLaSiT0eyyp8j2jDUF+ygBZYe4ICr9cyegOb8E5/pQ8GH
         WHW8k6Hzg2DN7FrDMmOKjaI+ri+o1bb+hSLg1us6o4ykD6M4UyrypfAc1wJ7klqlVfGr
         Y23w==
X-Gm-Message-State: AOJu0Yy+WstJWdSoEqWskvWZzzoS6BNT0hZ8AiqgeQXVxAmqMh0FtUy2
	6POZdJiXYG/b3U/z3uwlIZUGePj2YJJVx5xg06APdV6K9fG/DpKOQ6ZT10RcPP0IeDw=
X-Gm-Gg: ASbGncsM3gk82aTe3DBQYwF8/m1A4y+Z6To5C6XqzaxaJOYtrUbTMY/seWdH3Kevr10
	8bXjI4fheSby0DZGZcYLtURwl7KomzkQKDVYuWrcJxtwoBRcj+MoSBmfj8dpPJ6VCTUXCcTNaHY
	TzlgQSx19DCEOCXln4XzXKlKf6FIuByf2DYjrvkNo2/1Dk32Yc1z49dsDoqZYfGPnAfhDcoh/iS
	jd0ZXhz++VH9S+HsGzKlyiGsY8ba/mGLlUZfvqmII0A5AWTYMTaF010f2lvEp5d8TWpbX1A6VQq
	l8aT9kchAFC/nfP2ysixW7bVIxHqDyWRXCTLi0exRZp84jVntCB2kHSk0kTrdCC3BWaGPEbqSLa
	OeiJGunNkOmNSvCcioRK1YOPm
X-Google-Smtp-Source: AGHT+IFtZPukq/+yDAsIdvO/aHDsCiifRuGpQWpTcaz3eJpMLEUPs20HaXHuHobqtm8gUw9o7aY1QQ==
X-Received: by 2002:a17:903:8c3:b0:23c:8f17:644c with SMTP id d9443c01a7336-23f981cc1b9mr79031915ad.35.1753336624299;
        Wed, 23 Jul 2025 22:57:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48f0bc5sm6602765ad.165.2025.07.23.22.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 22:57:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v6] bluez: Fix invalid-pp-token warning found with clang
Date: Wed, 23 Jul 2025 22:57:01 -0700
Message-ID: <20250724055701.726413-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 05:57:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220820

We add FIRMWARE_DIR via CFLAGS using escapes for string and clang
option parser flags it

<command line>:4:23: warning: missing terminating '"' character [-Winvalid-pp-token]
    4 | #define FIRMWARE_DIR \"/usr/lib/firmware\"
      |                       ^

emitting this warning during configure means some tests fail wrongly. e.g.
test for enable -fPIC -DPIC, which results in textrels in libbbluetooth.so

Pass the string definition using single quotes to avoid the shell
"eating" the quotes and other characters

This works well across gcc and clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v6: Use single quotes instead of escapes

 meta/recipes-connectivity/bluez5/bluez5.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 3b414433cf3..48aeff0aeea 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -81,7 +81,7 @@ EXTRA_OECONF = "\
   --without-zsh-completion-dir \
 "
 
-CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
+CFLAGS += "-DFIRMWARE_DIR='"${nonarch_base_libdir}/firmware"'"
 
 # bluez5 builds a large number of useful utilities but does not
 # install them.  Specify which ones we want put into ${PN}-noinst-tools.

