Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 555A878CEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 23:28:23 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id k21-v6so2217119pff.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wOkzQ2gGmGvHZH4S+wUB5OOcMNAhc8OlkNT/uRSi71E=;
	b=EEhr9PomchSJ0Vdn88X0dru/aT/uBX6P4Bj7owifISh7IE8DrmQJARlNroYadyBa64
	QvRGwIqy8h6Nx8tdIlB5J//qX21CN6B7medI2wSlWWQjs5ZeFBuLLhPBCH8Tc2wtEpRJ
	WYeY+ptZ60o6/VX+NHPGEqO6bv8FvPvetFGT7T7rdTLxzULjtcYCqiVgcTnSnUHksRW2
	tA8UGMjNJSXUGeO9CLoEm4dhJPEAkba9UYrfxuB01D7fGOcFojP9bnUGZs/J+btLRtJc
	YGGm8PVyka7oJu66TnEJuZrsume8V/XyMHla3vX1+s6e76yRuWSXkvkFWgJY6EPn2hwz
	wOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wOkzQ2gGmGvHZH4S+wUB5OOcMNAhc8OlkNT/uRSi71E=;
	b=G2jfD2XxF8PV5kpSRHQdEe24cVUAF/KwyIFJ8mEobPqUe/08szHjlYkAS23l4q+pkG
	tzvOYOGGTzo0mP/mOw4dxZYE6s9OlVccz0AWz/0tLDN+RSPGgi7QSQ0+VTNaCJ4YO7Lo
	7d2PWcZwRDbcRuU0kyFWoeGMruD1PIgPpPjMDLeoflbi6df8NDgGdM5l52Vpc0GGA/X1
	oW5LDZHsQV2cB/jb/6POlc15XfjnMelyl9tJK14+Zwa0JPgyLuuUlkaqs3eAuKrw6985
	MFjhaKigjIubqev9GK4fgnPV2wAzX9hfieineIAe9G5Q9+thRa6H2glAEvypXe9X5aKl
	kyog==
X-Gm-Message-State: AOUpUlHPJQB/loZFKA8GqOVLFCVShLZ9UKeXDBdyE6pZXIH7nPTJae44
	pl5+E/rQ8BNWdRNKz7QlmRluxvcn
X-Google-Smtp-Source: AAOMgpcxP4RU6jS2vYdI9LCIoETkaZELRdMfEmZkLKzqkaaoYjkrUrN5PmIeAVYLll7nGysx2pCAug==
X-Received: by 2002:a62:3a5b:: with SMTP id
	h88-v6mr8506706pfa.61.1532734104452; 
	Fri, 27 Jul 2018 16:28:24 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm7086923pfm.119.2018.07.27.16.28.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 16:28:24 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:27:59 -0700
Message-Id: <1532734081-24485-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/5] openssl_1.0: drop unmaintained darwin support
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
X-List-Received-Date: Fri, 27 Jul 2018 23:28:23 -0000

The fact that the darwin support only appears to consider x86 (and
not x86_64) suggests that it's not maintained or tested. In general
oe-core doesn't support building on darwin.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index c2d9264..2804203 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -89,10 +89,6 @@ CFLAG += "-Wa,--noexecstack"
 
 CFLAG_append_class-native = " -fPIC"
 
-do_configure_prepend_darwin () {
-	sed -i -e '/version-script=openssl\.ld/d' Configure
-}
-
 do_configure () {
 	# The crypto_use_bigint patch means that perl's bignum module needs to be
 	# installed, but some distributions (for example Fedora 23) don't ship it by
@@ -190,9 +186,6 @@ do_configure () {
 	linux-sparc)
 		target=linux-sparcv8
 		;;
-	darwin-i386)
-		target=darwin-i386-cc
-		;;
 	esac
 
 	# inject machine-specific flags
-- 
1.9.1


