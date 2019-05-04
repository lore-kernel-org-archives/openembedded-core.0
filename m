Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7267D8DC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:26 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id cb4so242175plb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O11FNlCQXsFV4eXssJBAZxj0Rt/KO5LS/IiZ2/71/mM=;
	b=PpM4iKhl/71wmZlw/0ZUtZAa4Jf2uzVSgqWxF1BsLob8yBCAbKZtj+9bYcDC/GmdA1
	Od49Vu6/cX+ZIX2d0fzs4GjJ0jooMgoYfSzmF+iuur88gUmzld+ZN/25qlulfoYhwXLz
	bmupT5EqDYjzhwbHPxYY+32rAmQuHu7wLRbWrqUFk/Lyk544nk6yE10s67+77DxXdbJV
	hA6LzrOGXPfkSJQ7/5GZrN6Z40l0FLSrJzNSJmNpcPDfkWgGige+FOqmPA81b1QLCWij
	roj+beIbxrAEISWc8dTXwQKPVx9DT52XEtZm8rUMsWFUJX8lrkmt9vTVN2VJ/GXSktgr
	kUMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=O11FNlCQXsFV4eXssJBAZxj0Rt/KO5LS/IiZ2/71/mM=;
	b=qWauoL5SjBz1lPon3AT4WoAiWuEbjUAxXERFYcV4uwOPCbCOpiRrQ3VGx9/zzKK2TP
	D/csH/9/19GcIPVuGz4uUV1ITWLdHLuWr/K0rmV7xSQS9qCsSLJqc5lZoFd8G0jpSyB2
	1OSMmLEr84gAnjIccjTZPCWyzHOhf8it9GAjXOgk3Kxv2YTwDIiCzFizhfO2GV1STyDz
	oXTeHLmIyCP7+mDGsw0GNFYriGNpbErqt5YzXYUy9SDhTSdFKH3QkgBx7Po0mr/9QrMc
	4KmuwHYdsVqwSqUWM32q82vXVGj3YIOlgayzX1SqBnqywlceRU4jVExa6C7cu57zwKzV
	Q+Vg==
X-Gm-Message-State: APjAAAW9Z3dFF9V5qaO06uiGL5OLa7JPkVDvztVbpDurzFvWeSZvYlIx
	nvVITqmZ+lKDFEO+XA9Dg5naLMbx
X-Google-Smtp-Source: APXvYqwwfNkUwSWQZ4IIGVW8cp6tYi2qsAF/IQym0L4UIH5ZMzsYce+yKc6ehCH3s4x3BD+tyk5Bdw==
X-Received: by 2002:a17:902:b617:: with SMTP id
	b23mr18478083pls.73.1556983647422; 
	Sat, 04 May 2019 08:27:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:38 -0700
Message-Id: <93993fe8ffd31e3e94946023b2cd8927ae595fc3.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 02/43] gnutls: upgrade 3.6.5 -> 3.6.7
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
X-List-Received-Date: Sat, 04 May 2019 15:27:26 -0000

From: Adrian Bunk <bunk@stusta.de>

This is a new upstream release from the same stable branch
bringing new features and bugfixes (including CVE fixes).

COPYING changed http -> https.

configure no longer has a --without-libunistring-prefix option.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[includes: CVE-2019-3836 CVE-2019-3829]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.7.bb} (88%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.5.bb b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
similarity index 88%
rename from meta/recipes-support/gnutls/gnutls_3.6.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.7.bb
index dfc3507..e05dc2b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.7.bb
@@ -9,7 +9,7 @@ LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN}-openssl = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
-                    file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://doc/COPYING;md5=c678957b0c8e964aa6c70fd77641a71e \
                     file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
-SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
+SRC_URI[md5sum] = "c4ac669c500df939d4fbfea722367929"
+SRC_URI[sha256sum] = "5b3409ad5aaf239808730d1ee12fdcd148c0be00262c7edf157af655a8a188e2"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
@@ -44,7 +44,6 @@ EXTRA_OECONF = " \
     --enable-local-libopts \
     --enable-openssl-compatibility \
     --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-    --without-libunistring-prefix \
 "
 
 LDFLAGS_append_libc-musl = " -largp"
-- 
2.7.4


