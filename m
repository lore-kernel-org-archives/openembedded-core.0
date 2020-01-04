Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 371377F844
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Jan 2020 16:26:29 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z124so24787468pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Jan 2020 08:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nQFkLkdHl+K9cWMVMcPlK1H3uCfChL4hAzv3tsOC7QU=;
	b=M8F0QGF4FXdY2dMWe1JtIy4w5ZeUEBSHxIe6SmqVUNxCtf/yO75O5T3q/RnjdzEifL
	RGZ4qoh0EFalcVuX7q6+NOs5R6f0NHJaDvWzZgyp3CBWX2ONjCgBEEkNMenvUdhaHTqt
	jUB5CwJ7f9FHbffNwUQKxwzgUqEWhJG8KKweYjWyP7p8F+g0WQl+5GVraJgLW3PU4S6I
	3X4aIbQRar2qIPLwLCk88QIOpoS33Tuo1l6XAz75b8PZMKeYY3pqXdc12ad02oqIb3kr
	uLLIbm2sowwzTGOmj2xxSJclNCZFowRwFkTV+ypV48pcAYuPwSAlIWCzK1QnN8BOGO9Q
	2cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nQFkLkdHl+K9cWMVMcPlK1H3uCfChL4hAzv3tsOC7QU=;
	b=PIbwNGpx0/C+zLnANzFUkylSsuTXqJnMZNtJg5jWPSG0Fbl3oXggPACSoRTTwIu9qs
	aCbVQWGQa7vjSG2pN5WOZOr/I68r5NC8qEl6rpFWr6LD1acXOGVKPgGI/L6XvA92Y75Y
	5q1lNB4gsuUJK/CJ/dIFFoOmNUKavBu92xkSG+skJ0RiU3dKrIfUU2m1KQYfgNHB+j3q
	qaFaznUPNTMHQKbODbH7JxAw6HxlT2tVK2op/FxGLFDntVJU/j0MLDVlirePhdeSq1RA
	SRrSweTYxNvzV63W3WNw18XhoraaST3nTRbxjsDBuHLrmhGiETJwjLPZZfOhmdY5+hFP
	5/gQ==
X-Gm-Message-State: APjAAAXss/c4SZZhAicJWjIf+XXBr69Rs+Y4fa/p4RUCcsvvG83iAxlH
	kyGSg5vPj/GMccU7RfeAeS3RtvZhbFg=
X-Google-Smtp-Source: APXvYqwnmdr0Bj/2HYumlBXmCyJKOt8+MWPwO9WdHLM3MeTF9r5Zdh2VRjQYTWMoImuI7Ctocb+/HA==
X-Received: by 2002:a63:a357:: with SMTP id
	v23mr103065982pgn.223.1578155189892; 
	Sat, 04 Jan 2020 08:26:29 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e812:6764:3882:fa62])
	by smtp.gmail.com with ESMTPSA id
	u23sm71589976pfm.29.2020.01.04.08.26.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 04 Jan 2020 08:26:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 Jan 2020 08:25:59 -0800
Message-Id: <0c3e39f33c57fd3a024bccbd90e1ee5066342ae0.1578155074.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578155074.git.akuster808@gmail.com>
References: <cover.1578155074.git.akuster808@gmail.com>
Subject: [zeus 18/29] liberror-perl: update 0.17027 -> 0.17028
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
X-List-Received-Date: Sat, 04 Jan 2020 16:26:29 -0000

From: Tim Orling <timothy.t.orling@linux.intel.com>

HOMEPAGE change from bitbucket to github

Upstream release notes:
  - Moved the VCS repo to https://github.com/shlomif/perl-error.pm
  - No other significant changes.

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 488680f45fbe28e32391e2a1a66ab350706abe93)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{liberror-perl_0.17027.bb => liberror-perl_0.17028.bb} (85%)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17027.bb b/meta/recipes-devtools/perl/liberror-perl_0.17028.bb
similarity index 85%
rename from meta/recipes-devtools/perl/liberror-perl_0.17027.bb
rename to meta/recipes-devtools/perl/liberror-perl_0.17028.bb
index cf1f6d685f..8c6bbcba94 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17027.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17028.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "The Error package provides two interfaces. Firstly \
 Error provides a procedural interface to exception handling. \
 Secondly Error is a base class for errors/exceptions that can \
 either be thrown, for subsequent catch, or can simply be recorded."
-HOMEPAGE = "https://bitbucket.org/shlomif/perl-error.pm"
+HOMEPAGE = "https://github.com/shlomif/perl-error.pm"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 
@@ -32,8 +32,8 @@ RDEPENDS_${PN}-ptest += " \
 
 SRC_URI = "http://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4ef9b2890fb144d804527ba32573dd56"
-SRC_URI[sha256sum] = "07b2ac8275dfa04144745a6c1900a596280f862b97d22bab0c5ce02682ebd3be"
+SRC_URI[md5sum] = "ec3522c60a43a368f19c0f89e2205cb1"
+SRC_URI[sha256sum] = "3ad85c5e58b31c8903006298424a51bba39f1840e324f5ae612eabc8b935e960"
 
 S = "${WORKDIR}/Error-${PV}"
 
-- 
2.17.1


