Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC377C4DB
	for <openembedded-core@openembedded.org>;
	Tue,  7 Jan 2020 02:34:55 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id s64so27744890pgb.9
	for <openembedded-core@openembedded.org>;
	Mon, 06 Jan 2020 18:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nQFkLkdHl+K9cWMVMcPlK1H3uCfChL4hAzv3tsOC7QU=;
	b=NZfoqCqkdeRqOWkQWK+0j0h3QDDPh9Q8xxqu9Ol9l3v9dhC2uc14FWgWv8+lTlbPwy
	pRhgCLPIW9ln/6uM81Qtm+dig5Q0j+Xxefl711bRUBLMqhoDAL9A+jSuw/uk29mXLcie
	fXIYQC+5UWD2w+WtnVA9uySWN/2p5sUqIFVVaUCVKSzdkF0IYswXGfymRra5Xig65Phc
	PSD1WYA/Tqo/144QaWWTLhENaDMRg7NKUzdoy8S4oNItJdQxnaVeOGBCK14CFstr2cOB
	OHKtGdZ4rN8zri1wBa8Z6+MrORy9rxHl+BrbRG+7XyrQd46IL1ipRJSTXToEr1BoQiF1
	ms3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nQFkLkdHl+K9cWMVMcPlK1H3uCfChL4hAzv3tsOC7QU=;
	b=WcniSnre+VxpdDLbJ+5ajZWr+361Y7Wyd+h6By81rC6Bt0606z+cAvXUDDKolhQ98S
	Agf/1Weuau3uyA+zm4LL3kpNkVqD9Cf3czZe0kTHWQhXObaimwk3pH+/wHUkSDb17bbo
	zVeUsc+DpJPi60z7m02SfxFr0HEM70tAFxiR+fr5qKoK3hFhMW0CrwXyJa0nN7Acs/tq
	rsHLXeOOrcPB7fn+MUh15MIBgod4gDmHtHPKk1/vOMh8SvdcIGFXkqKL2A6MYPrf8zqm
	8U83Ime/wx55GH2v8WBHGhOFDizeQVyr4JrgZ+olmFnIzICeZSo9hL8zCKFjML8tDJ2Z
	Qlbg==
X-Gm-Message-State: APjAAAUIQTH6LgXPXWQ0NYjbHnNJKwzHAnvXdfLLXwB/y2jFtrf8R5wi
	zhFajwv6DYaIrG8vrKQq6JVjl7/j
X-Google-Smtp-Source: APXvYqwUIRN6Dm348Rt8LgGlpk1Z1CNYFna2v0keVlW++DXYt5QEfgBzW3bqK0NkkSN1m2jBXbyHdQ==
X-Received: by 2002:a63:4850:: with SMTP id
	x16mr117789427pgk.334.1578364496390; 
	Mon, 06 Jan 2020 18:34:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:6832:e19c:36b9:d5e])
	by smtp.gmail.com with ESMTPSA id
	d23sm77806193pfo.176.2020.01.06.18.34.55
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 18:34:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon,  6 Jan 2020 18:34:23 -0800
Message-Id: <0c3e39f33c57fd3a024bccbd90e1ee5066342ae0.1578364301.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578364301.git.akuster808@gmail.com>
References: <cover.1578364301.git.akuster808@gmail.com>
Subject: [zeus 18/28] liberror-perl: update 0.17027 -> 0.17028
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
X-List-Received-Date: Tue, 07 Jan 2020 02:34:56 -0000

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


