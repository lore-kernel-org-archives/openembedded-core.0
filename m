Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id DCF3B7E150
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 13:50:44 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r22so1670252pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2wqvwq3dkRQI7eSsUMtmmRRnwN+YXHoRFtr9vNy2Nv8=;
	b=ntKUazr3IKE2mTnaJf2SZIP/COJTKkjWbFZqyj944Y8UR2PShTaPvoqd4s4cG0Z1Lt
	wUP5rH/pHsxZ4hVliLafcMYu34JrG8COvjR/8JN4HO9svclh6TcQ7EfAGlq56TSMOzPf
	5Bit3JE6ryYQT6FwH5yr7p+Qm7PAuiP0wmQXLFgQ3z8pK4SdZhMzZ4vpHOuRV+q6q5A2
	sY9BtpCU61bXgjUZzMjaRWSJd/1WpHR5MoHjnjfFkOjOC4hH8skCrUkCWf084zS65XKw
	roQTDECY/ZkRBkZAEcoqFkqqYtrCdrE+EA1yW4PVTU7ge86P045jixCZ9ryjIVCne+MW
	214Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2wqvwq3dkRQI7eSsUMtmmRRnwN+YXHoRFtr9vNy2Nv8=;
	b=r/cI5g0DModpu7UgBorKf654uCV+NobugZ9rYpwtu0W8W54ed0WTqNkh3vL9qltSlE
	4AWCOFipN1ymUigeOBFWxpf1sUX8OvkdCncZ7frj7H2wvGOJmEZJOBB7MBJa7tOKCGEO
	NU73offL4o1Iyg6hhgcsWyCnGNRUtoZfDQ5Zzd2RBkMwm3jNMd6jTT75Y2uXSMrgJztR
	7Y89f46iBSW08OuQHeOejUuer1ejAQ0pcEY1CwtnsadIvvy6JZYXFTxxoUKrKI6uhPLd
	fM8haqJCM9YRsisTBrFJYJfYKwy5TX+TAaxRI7ZLzFSJgpvoj8mn3SGKcSyeqEym0woj
	myOw==
X-Gm-Message-State: APjAAAWHdG4gxMoscpUda+ThfH85Vl7kbWP6wj6mWmwCyT4cvpormxTh
	441LVQ53GMFeXi9etwz7O/YQsow2
X-Google-Smtp-Source: APXvYqzMbbyHigQgTixW72q/9/WwYXWwiBIDGeQ02lL3bbreiyQVaVPGMQ1Gt2LIq+Lw4hOO/PnMNA==
X-Received: by 2002:a17:90a:65c2:: with SMTP id
	i2mr12029665pjs.54.1559137845934; 
	Wed, 29 May 2019 06:50:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id r7sm5976891pjb.8.2019.05.29.06.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 May 2019 06:50:45 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2019 06:50:34 -0700
Message-Id: <1559137838-8972-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
References: <1559137838-8972-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>, Adrian Bunk <bunk@stusta.de>
Subject: [thud][PATCH 5/9] gnutls: upgrade 3.6.5 -> 3.6.7
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
X-List-Received-Date: Wed, 29 May 2019 13:50:45 -0000

From: Adrian Bunk <bunk@stusta.de>

Source: Openembedded.org
MR: 97367, 97377
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-support/gnutls?h=warrior&id=93993fe8ffd31e3e94946023b2cd8927ae595fc3
ChangeID: e47c21374c83d7bbb8ec48a7c4fe14040457ea45
Description:

This is a new upstream release from the same stable branch
bringing new features and bugfixes (including CVE fixes).

COPYING changed http -> https.

configure no longer has a --without-libunistring-prefix option.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[includes: CVE-2019-3836 CVE-2019-3829]
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
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


