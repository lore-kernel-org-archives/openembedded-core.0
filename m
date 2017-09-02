Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ED06177CEC
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Sep 2017 00:24:36 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id v2so9483143wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 17:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=APHIWTsE9Ge9+/U6gYGFc/iw4ZUCFxYOOzIk5wlHzuw=;
	b=gr+7+F19is0asAxkZgiPQ2vztwt30odJ27tQ5fyLLEVY9iyJghgKh/wFzlVi+raxlW
	mksxKzLKC9fHLaBFcYjMpKYoYQGoNVVdefKkLcBEtjG9M8r8xh6esizSRUgMIDzJckD3
	4fgq94sKImnu21BZRElYqTyAi5ciRYiL4bOAW73IA0ItBLORKBIEnPaC4iY6lFc9DltF
	flkRtiKuGTm/IurPs+SaVFateA2lrRsP8UCCmH23IREEgWhSn1qrjQ9YQgayfLLhi82T
	5CZdefPycRHhQZkX+MI/8rAqHTVJaJ4CnNF0jNyd65yglxw5XJdqGMisWlx6esQU9Sfo
	/bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=APHIWTsE9Ge9+/U6gYGFc/iw4ZUCFxYOOzIk5wlHzuw=;
	b=REsLLkiUiSnVXT5SlVDo8tLcLkHHDbQLe7HGKaHXivHZZ63uWiZypS5etxd+Mbe0+h
	lXoPhvX+2iLu5fFFajeeG+BQEuig6gzpG7p6JEIuzg42saE8+yW7WltAOTbRkfH9Hrpl
	CLw3vzoAeL/1prshDZb/OxLucZrFkRBm2MSIAvZe3i/Ks4j31BbIE95YQ0Yb/d2SK0Rd
	39Z5KISEE6sy3qngYUOaLLSNqLhto49m5wvzCx0HQxC8yviO+egslJ7dpCUXLSPac0cZ
	MkjpCpUOXPWcmBiBZZJBLqPPXX2JBUkm0aaYjjphEfoR+dhTcM7nB55jJr1WqOCmcXFa
	SqLw==
X-Gm-Message-State: AHPjjUhSOqmu9O6dBIBaTu6yKPmuZqxt7kX3qRIxHEU1MUE58ylKiJ0D
	2S72PN90NW+XHCJUCUk=
X-Google-Smtp-Source: ADKCNb7mv1vHrxJ2hcR+xM2ivZ0uS1GXK9H2hAUQNrw2bzpQ/gtRifnrdtYmst2JsSW5OXdwJX0J+A==
X-Received: by 10.28.71.24 with SMTP id u24mr1177426wma.95.1504311877385;
	Fri, 01 Sep 2017 17:24:37 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o2sm1002491wmg.32.2017.09.01.17.24.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Sep 2017 17:24:36 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Sep 2017 01:24:34 +0100
Message-Id: <20170902002434.5650-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] psplash: upgrade to latest git revision
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
X-List-Received-Date: Sat, 02 Sep 2017 00:24:37 -0000

Non-housekeeping commits:

2015f70 Fix text width calculation.
5b3c1cc Add --fbdev option to psplash like --rotation.
505aeca psplash: fix remaining unused-parameter warnings
e3e0ab4 psplash: remove unused parameter length from parse_command
121720e psplash-fb: remove unused parameter from psplash_fb_text_size
9f6baa6 psplash-fb: fix sign-compare warning

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/psplash/psplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index 1339f1eec11..3b7f818fc56 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "88343ad23c90fa1dd8d79ac0d784a691aa0c6d2b"
+SRCREV = "2015f7073e98dd9562db0936a254af5ef56356cf"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
-- 
2.11.0


