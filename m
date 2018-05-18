Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 64F8D7481C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 May 2018 04:35:42 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id w19-v6so3828484plq.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 21:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=njY9rT04taAnH1Tpswd/ewb5F/Jtfa0pS6oQzMdMDX4=;
	b=l68YAcvjVqctEGWnSyfhe/2NzDPLLlQf7JwZcfonCSEfYiKcjObuEcyWWa79yxiO1B
	3GFGE11Mh7Y8TgC5+pJSLmE8gq1IbL/Ra1pFrN08Uqs9H8N8XHeaUOE1bdcLV8/Dp3lK
	tgpoMQqs0OlzQsPhM01PrbnCo6MqAhwZ4v26VDL1AP/wmc0EpGIA2rHuwvQMdcrsoduC
	5kFVKXj6hbKyCVmpniJcPl5NQMA3gszFyJhsXQ81/K8WTmHewBPJIULvFyQGMZZik9uz
	p4saaQEU1POoGQSjS5kjvQO3PN6YaRHmcJEixeB4OX9QwgYR7KhuTutX8EFJq9zn19V5
	aa7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=njY9rT04taAnH1Tpswd/ewb5F/Jtfa0pS6oQzMdMDX4=;
	b=g5xMlC2bfyu85n4fzWa5LtBsR0HeKvNwJUtARMPnJAmzqdfdaBU/voUltCsZr3LLM2
	+yyGIpIepLbIdXlNo+6vWT7oUgpMrnRRaUQ4gquhp8lkh0Aqlgf2Oxvd9QMsoU9m5kGc
	SeO8IxGjxsATlAHZSRpLVNq9wTCLtetYF6eJxx6ANpkopxM3Iat3oFnvGbCWVmrft/XA
	6n/a2SbAlKxm6wg/P6ZF1kYsWSAuNP3QYkbii4Jg818l0ADNlIzR3c0N4EBhbmGSUMjR
	1AYp4KTQzIAEwr0jFqU7a2hK5S+eBflqKQcbPtikoZrb4yntYgiI4EvjiUwSQRjGQVYh
	Ox9g==
X-Gm-Message-State: ALKqPweFhsSjlVR5PICLSb231TTjFQkY8wfI6nKQiJfWTh3kb8o7pxri
	gD1sRuWJ1yK8b4r//G8YkW19DA==
X-Google-Smtp-Source: AB8JxZryBE6tfKPI0+C/0lzd1wFrkelXGjwGADW7aCb/Dugl+SyBWbsZ5rgIJL/hoBSIrqQk5BffjA==
X-Received: by 2002:a17:902:a714:: with SMTP id
	w20-v6mr7725240plq.374.1526618143867; 
	Thu, 17 May 2018 21:35:43 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	q64-v6sm10235801pfg.180.2018.05.17.21.35.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 17 May 2018 21:35:43 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2018 21:35:34 -0700
Message-Id: <1526618135-7513-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1526618135-7513-1-git-send-email-armccurdy@gmail.com>
References: <1526618135-7513-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] pinentry: let autotools.bbclass handle --disable-dependency-tracking
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
X-List-Received-Date: Fri, 18 May 2018 04:35:43 -0000

autotools.bbclass adds --disable-dependency-tracking to the configure
command line by default, so there's no need for individual recipes to
do so.

Also make some minor recipe formatting cleanups.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/pinentry/pinentry_1.1.0.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/pinentry/pinentry_1.1.0.bb b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
index 1eaa261..4116efc 100644
--- a/meta/recipes-support/pinentry/pinentry_1.1.0.bb
+++ b/meta/recipes-support/pinentry/pinentry_1.1.0.bb
@@ -8,8 +8,6 @@ HOMEPAGE = "http://www.gnupg.org/related_software/pinentry/index.en.html"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
-inherit autotools pkgconfig
-
 DEPENDS = "gettext-native libassuan libgpg-error"
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
@@ -21,9 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "3829315cb0a1e9cedc05ffe6def7a2c6"
 SRC_URI[sha256sum] = "68076686fa724a290ea49cdf0d1c0c1500907d1b759a3bcbfbec0293e8f56570"
 
-EXTRA_OECONF = "--disable-rpath --disable-dependency-tracking \
-                --disable-pinentry-qt5  \
-"
+inherit autotools pkgconfig
 
 PACKAGECONFIG ??= "ncurses libcap"
 
@@ -35,4 +31,9 @@ PACKAGECONFIG[gtk2] = "--enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ gli
 #To use libsecret, add meta-gnome
 PACKAGECONFIG[secret] = "--enable-libsecret, --disable-libsecret, libsecret"
 
+EXTRA_OECONF = " \
+    --disable-rpath \
+    --disable-pinentry-qt5 \
+"
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


