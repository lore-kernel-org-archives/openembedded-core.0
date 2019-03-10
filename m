Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4447CE79
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 18:07:52 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q17so1966099pfh.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 11:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nqJBgL+eDFWL7OI8SNIEqzMSULg9PkJM82Wvo0jfxeM=;
	b=Abe1u3IZ3xIXa3XR5re4VmEG/RqV5MVMAfADqH03QuWi3wUEiH+ZrIRSxEiFkOoLgB
	ZlmDSgPO9PvXUbj+N+VUJGqkNF4M2WNIqXLTTDSTjm9BrQUivs96g3nwdvBpUrY6EtJQ
	jmAm6unXEAk7zZyd2lpZTczPvohrJ+dsUCB81ALf/BCApE/FsdEqWgZ+Dw0h/S6r6K/a
	nZj7M32N4sfTn+a+MmDXvhsjIN3OrGsGLJkomsxB8g6D2xh/OdfwGHvQUO+ihnUxXwCw
	2XO9RbgGsLqw36zf2U8Bu5vYCH0iD61H8N+kd/HRWdUw03+tiX48LU60qFXXjgIz9RsA
	uoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nqJBgL+eDFWL7OI8SNIEqzMSULg9PkJM82Wvo0jfxeM=;
	b=TG/El6g2R8z1Z/02VosDa/TbrEWT2w8PIjOvSUZGpWHi40mh355OFehKZdP1k2rrA5
	pq6+MBCAHfWG3T3jianDiM1sOnPEDkeFMe+UblF8DkJv4UzmjDABxx7VNNKuiaSSD9fB
	oVlT2NIEO8QklR55zSfbb3gyWhWFbTByizGxCvy3cbCYvQ5KGbQabX5jp0J7xf6J9KnM
	KFFmoDVsgkT0Yu4xc9+M8wyiN1xr4+3ugtGf+wkB2UErNSRISEzF3oP4vgBOnjxgGbFn
	3N0uiiTm5wAIuJRyDwgHPHz+0oI4YIKASE8DPlmfsEl1/h3zGPgM/uH9ZozVCdd8rXlz
	1drA==
X-Gm-Message-State: APjAAAVkFvzSzBMs4e7Yo2Bs+O3L8c2sO2e+suKvwr1vpX36gGj0yCss
	G9NrmFBUFl7At0B5lvYMekuJGBf/
X-Google-Smtp-Source: APXvYqzzpA3SdsaqZtksFFR9GopnK8coTTXbZJNEXZRYVFira0tGYIyVMWkASz7fKKx8iMvWhp69cQ==
X-Received: by 2002:a62:f20d:: with SMTP id m13mr28833998pfh.174.1552241273140;
	Sun, 10 Mar 2019 11:07:53 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:18fc:c150:6496:1a0d])
	by smtp.gmail.com with ESMTPSA id y6sm5999607pfy.87.2019.03.10.11.07.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 10 Mar 2019 11:07:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Mar 2019 11:07:42 -0700
Message-Id: <1552241263-26116-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
References: <1552241263-26116-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 11/12] gnutls: update 3.6.6
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
X-List-Received-Date: Sun, 10 Mar 2019 18:07:52 -0000

WARNING: gnutls-3.6.6-r0 do_configure: QA Issue: gnutls: configure was passed unrecognised options: --without-libunistring-prefix [unknown-configure-option]

drop --without-libunistring-prefix

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.6.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.6.5.bb => gnutls_3.6.6.bb} (91%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.5.bb b/meta/recipes-support/gnutls/gnutls_3.6.6.bb
similarity index 91%
rename from meta/recipes-support/gnutls/gnutls_3.6.5.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.6.bb
index dfc3507..3cad896 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.6.bb
@@ -21,8 +21,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
 "
 
-SRC_URI[md5sum] = "3474849e1bbd4d16403b82ab2579000b"
-SRC_URI[sha256sum] = "073eced3acef49a3883e69ffd5f0f0b5f46e2760ad86eddc6c0866df4e7abb35"
+SRC_URI[md5sum] = "30c5b63686edcd260d87d8fb8a06977f"
+SRC_URI[sha256sum] = "bb9acab8af2ac430edf45faaaa4ed2c51f86e57cb57689be6701aceef4732ca7"
 
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


