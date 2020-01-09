Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id 40E4B7FE7C
	for <openembedded-core@openembedded.org>;
	Thu,  9 Jan 2020 04:50:11 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id bg7so578267pjb.5
	for <openembedded-core@openembedded.org>;
	Wed, 08 Jan 2020 20:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nQFkLkdHl+K9cWMVMcPlK1H3uCfChL4hAzv3tsOC7QU=;
	b=D4iyNLQA9OcAsXqoAohCqZRQVh/wDRkuKga1D6qPKaR30stcGu1yzs4JOh8wr00ALU
	4NDiAA+Uk1wLjh9sK8nHjUTVgEt1OtVjJySourwsJAH/uM04g/bUF/b6Yc7vcVibnTvF
	jIHoYot5tvSQ7vQIZf0jDMAHr8zwSmRKLkHbdzviHu7s1RBgsafYMcSvX5RqGQbmS06b
	cRyqxnPrF9IJ6saMdEIMCTJcSK+/CMVa/IyrGCbEMWYHx1IyNZIVMNuiDflsWNp/3iLg
	B2bYcmLx643OUpSz/nnDnJEKUYnZ3MEN7VFZLb/IlwjZat/aujceBD9lxANKwRDhyMFB
	CZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=nQFkLkdHl+K9cWMVMcPlK1H3uCfChL4hAzv3tsOC7QU=;
	b=dbZ6kv7ttoIxv+3Kjfv65tjbBYz+4YZBYnCVWWn1FubjXSoXRVailGrUU0wv3vPKZR
	fP2pDJZ9ZdsmVGDl0PuTxrQVxB+hXC44z3BInVlecGvHnlcv9aTnkAGc8wRh/CPObyHg
	sh0teci7DJWGnhQnb//a4UhOgmO6YMGtwlPih4cRYH6ZvhYgg8hXhhVvfNgSZ12ynGej
	ZXVkeH75xeu4no/f0FTrZ2hRLLulgCmM1RZgA3sRwdDORBxUjgQy4OLED3B1/LlpQz1L
	uvT1PJdUIzoSq4MU4xUPNeHh0BHrSaYYsRl0zOwkBu8Zp3EKZ4AD4txHUrASgVpqkmze
	ZMfQ==
X-Gm-Message-State: APjAAAW+355Ts+VOyzJfP5W1rdte/meDTbOzkJe0VkoVJAn5ZXvETRe0
	pDMwMGzp4b2Hh/DxhN7F+PFT8BLS
X-Google-Smtp-Source: APXvYqx3V17EQSaMi0Dx+7+hPCbIht1DGCql7NWfmcG9HPvzMI75YPGpS2BcDGblgCperJC1rrQ7VQ==
X-Received: by 2002:a17:902:9a89:: with SMTP id
	w9mr9626976plp.19.1578545412101; 
	Wed, 08 Jan 2020 20:50:12 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:304b:2b9c:bcb7:ff1a])
	by smtp.gmail.com with ESMTPSA id l9sm5018427pgh.34.2020.01.08.20.50.11
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 08 Jan 2020 20:50:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Wed,  8 Jan 2020 20:49:37 -0800
Message-Id: <f15419842bfdf463d987ba708e6d5f9b6aabecdf.1578544698.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578544698.git.akuster808@gmail.com>
References: <cover.1578544698.git.akuster808@gmail.com>
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
X-List-Received-Date: Thu, 09 Jan 2020 04:50:12 -0000

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


