Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12907.1794282762646217211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=IvjMTrqh;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso908705a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282762; x=1794887562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IDJ03+FHgBMUnJQPPli1WJHNROOHupsqXif2NhN79dA=;
        b=IvjMTrqhkco1BScW3jSiDIRta8d2IJuqw16uB+K94otL1Bi6YQ7d02y0NRgPyxKi2y
         4dSD0skzo+55lbs32qUj13bt7XC10x8H9nep7ECFfEy+yoK3dUJyMOcgaU+nHRGvz7BR
         LzsgBdUFCMp/ZoHUpuu7s9fgJJ8LMYo/dQSzSDYlC2RsujXLM8uRQ5+NktV6aht4FNev
         lI08yIIlRsc0i8LwFSopoXUbWrz7qqyP9FSCm64GnSHHY3VLdlKR8XWGpm35Sc5xUlEP
         3OmZOmlBOe3KQYylY9x5ndvG4NLy6DwRsyzT/Inm4x3SUstKn9yCMFfqSL7GNzE1ni8d
         +y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282762; x=1794887562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IDJ03+FHgBMUnJQPPli1WJHNROOHupsqXif2NhN79dA=;
        b=l0Rwbx2w6uN+jBy+mTAANbbPicK6Kx3ZSAJg9Y1MuFF6mKudC5RYauut7ygHt22yDK
         1rwQXSXExuM4m1ikDq8gh8rgEOS9FmVEaKrt7p+iKfHrAqIAB01B5yY+9b69zrtV9NMl
         gOnoUuPyAyqUMqoQoOPddcmZ0+Hn8Bkm+Swx2bSU0isX8bsdYuTcY9TTi4tNv0yWxUdo
         PgWVI5wCn6KT1OASdaOduuVVcd6fbd1F5rqs8Dgxzb9Awy6hTvIFLHJVrLHUci7b7WhD
         SQtCK7Rs6kjCugDFLH3UFidEUXAarfAA5cLtWQqL7GM6uBlXhjrsWMMaHqxytBUytOhZ
         ZzXg==
X-Gm-Message-State: APuU4Z8+Sc4a4PZSnahkcqD6RhrOcdKfBVAuO56aVmQnbYBIQDpIF0SC
	RljRmTzCKJ1RME16t9vKm9qGh0VQ+QZGE/5qpdQaUUlmLnj2sXvoUBRqwKXA4ZzB
X-Gm-Gg: AYBFou2L9UeJCykdvrlfUp5YkM3o7A//Whx7pdkC7jchlOSB3LoT9H7qSGk7ATIZ7TP
	6WozQpJPNMUMwdU1Vlu52jgL6MXTOoRk0QP6j6dC1MmAGcWFEle+iFEaLn30/YOq6/p37cyCHvz
	W/RcxLPDSTxOzuQEMCZu+8He9PecFu5zIoKwFGdYvNkYYo6VFb82DtLufRuxGI9qS2l4UEgZh5V
	k/EpGgBKuieJUfWrAp8/Z4edARvGOjLAYUG5nbbuiLld3DEsq0NmFBQDZ6mfkTfK1Us+0+b0fS5
	I6K1kicshovK6bDe+6mKO3RFSl/yvUXVwOEoQoAK0E0HEoF8w+hwyy+AjtnnRNYkpy8BBJPGYLP
	R43OzbmlsS6E8TYTC21OnxfWokwsB80DPx/aNzCR6I+lCP6pqeiUiXesvpAU0+JDfqcVqSGqDgz
	qgxqG9Xxd4bRR1SaE9dS84UKYz3uMNoB/7gjR4hP+JX2aJYXVkirPrLTkJtPppQV20K1pfIreCh
	iW0pkYhBACiV6rL4dPX0hewF6XTGbMBKQZMXpGuTVjCzcNMDhoduo2hI1pWn3NVFpwBS3aXOvdJ
	taxYWa/1lLVmweYUZOHZjRJGBlaIq62uB+/IrZ3qSBJjccUAzlS5y+L3FRDOzQ==
X-Received: by 2002:a17:90b:17cd:b0:3ad:f949:667b with SMTP id 98e67ed59e1d1-3b166d37183mr1730536a91.57.1794282761875;
        Mon, 09 Nov 2026 19:52:41 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:41 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 3/7] apt: upgrade 3.0.3 -> 3.0.4
Date: Tue, 10 Nov 2026 16:52:25 +1300
Message-ID: <20261110035229.2940188-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249890
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.4_changelog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_3.0.3.bb => apt_3.0.4.bb} (98%)

diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtools/apt/apt_3.0.4.bb
similarity index 98%
rename from meta/recipes-devtools/apt/apt_3.0.3.bb
rename to meta/recipes-devtools/apt/apt_3.0.4.bb
index 393008f05e5..c56819f0990 100644
--- a/meta/recipes-devtools/apt/apt_3.0.3.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.4.bb
@@ -23,7 +23,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
+SRC_URI[sha256sum] = "e853aec49afbe520ebcd4dbcbc98e1c55262c6bf1c119cf43e6aec69752443c6"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
