Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 69F256E666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 15:19:12 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id o6so12752656qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:19:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=8W4Z1N+tuF4OYwiSVE+GrJXeQTnBauZDTdwL6bj/sJc=;
	b=Zz1+mvWqBD5R4Sjc/mndUOttPff1hPrNIBhikfhRZtGBBlg8yP4sce0FPZVDpp78uW
	nRSIIVQ7Zkknzi/AbbSbl8dGKVRDRczYaM70RyYQToILhVsaE56THjsk8rTzSdq48WJN
	UwDkQARYcX6o5N1SA/5PEU2xZkw1lcz6NoRXwHI0IAZmMyyTQjm3/KPEasn+GWrVPoys
	2tSLDwF0onow68Ahx9PgLeekUygblh9K80rmcWE5h7j2vqyuNZbWZqdWSuS7ptWWFOyM
	KwGtK8NbtxXCXTEvjwgfaKOYwdEPV7EPlWUaBy47jeE1cEStR/kSCIBBc9rGKGks8FZr
	bIBQ==
X-Gm-Message-State: ALoCoQkYrpoe96JS/jRY4JOaPmhnM1xNoXWOpdPvh1/M4TAdo3v9rnHU4YklWyXkTRMpAYm2E2dIl4ltB/77iYd9eScsUQTF3g==
X-Received: by 10.55.82.193 with SMTP id g184mr32344301qkb.65.1453130352980;
	Mon, 18 Jan 2016 07:19:12 -0800 (PST)
Received: from localhost ([177.127.4.194]) by smtp.gmail.com with ESMTPSA id
	p188sm5612683qhb.34.2016.01.18.07.19.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jan 2016 07:19:11 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 18 Jan 2016 13:18:58 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jan 2016 13:18:57 -0200
Message-Id: <1453130337-8044-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] slang: Add dependency on ncorses
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
X-List-Received-Date: Mon, 18 Jan 2016 15:19:13 -0000

Slang links over ncurses' terminal information library thus it
requires it to be available for build.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-extended/slang/slang_2.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/slang/slang_2.2.4.bb b/meta/recipes-extended/slang/slang_2.2.4.bb
index bfaa9a5..237e9f2 100644
--- a/meta/recipes-extended/slang/slang_2.2.4.bb
+++ b/meta/recipes-extended/slang/slang_2.2.4.bb
@@ -9,7 +9,7 @@ to recode S-Lang procedures in C if you need to."
 
 HOMEPAGE = "http://www.jedsoft.org/slang/"
 SECTION = "libs"
-DEPENDS = "pcre"
+DEPENDS = "pcre ncurses"
 PR = "r12"
 
 LICENSE = "GPLv2"
-- 
2.7.0


