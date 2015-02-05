Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 699AC7325F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:56 +0000 (UTC)
Received: by pdbft15 with SMTP id ft15so8557185pdb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QetAWkvDGh+XqhmG2z8lGI1VfExUCRSXboTx0ppnNHA=;
	b=0Fs63eNT3lixVoH3X/kEiXvz6t3kQ3/aQBF6SWbxY2dOxa+SDfO5OOYvdIDLHREfe6
	D1gwWkUG2ediksrLBb8hkgS/g6qar0kvRD0PBOpcjq4hycwE8yptQ0lsbzD9yOp01Y5a
	swSElssbG6X48WqnyZLMYMblaA/zTSs7H4HiHrZy9AuuUelxnz/2teXZGNb2WW9SA0g6
	SMYUKiRZlRtjqJ+0CXolw6P+FMZL38BusBUmxaWv5ha236OQua8ni6n4tY2QBDEINg+s
	8FXh6rUzSSoYPHqNrXLz4pPF2vpGWwqZlJeRSpzVrN5JU7bCSb5OR3D4KZPxvhs7x01P
	9rEg==
X-Received: by 10.66.235.137 with SMTP id um9mr6634286pac.89.1423152357721;
	Thu, 05 Feb 2015 08:05:57 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:00 -0800
Message-Id: <72a0d14dd9dbe04a858533affb05a7f700832a32.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 52/61] python: remove spurious nativesdk dependency
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:56 -0000

From: Ross Burton <ross.burton@intel.com>

There's no need to add a dependency on python-crypt_class-native to
nativesdk-openssl as the general dependency there is transformed appropriately.

Presumably this is cruft from back when SDK packages were suffixed instead of
prefixed, and there were mapping problems.

(From OE-Core rev: f0b1eab1ef24fabac98609eb9d314f618dca713a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python_2.7.3.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-devtools/python/python_2.7.3.bb
index bada39b..efaa4a7 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -162,7 +162,6 @@ RPROVIDES_${PN}-core = "${PN}"
 RRECOMMENDS_${PN}-core = "${PN}-readline"
 RRECOMMENDS_${PN}-core_append_class-nativesdk = " nativesdk-python-modules"
 RRECOMMENDS_${PN}-crypt = "openssl"
-RRECOMMENDS_${PN}-crypt_class-nativesdk = "nativesdk-openssl"
 
 # package libpython2
 PACKAGES =+ "lib${BPN}2"
-- 
1.9.1


