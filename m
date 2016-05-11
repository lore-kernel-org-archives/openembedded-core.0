Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 60E95770DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:29 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id zy2so4801761pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=OcNxR1lOzjX/yzXC8c3lrAtoIZHmvUse40rcBfV6hcY=;
	b=qMIHxel+XxSEcXo5NlB2wkOZRU0ad/B6rxgXzuL/wCtG4VIc1nfs2qw6RdsEWIBI6A
	lACbBzaI2bqJpkxAEhUzN/oKPK2Xr/OovtXF1WkQHUVUlgkMnL3RhGYZsnUbgg8hg6Ln
	XlVqeUTmCOaIgTWOxCXcTtvptme0ChCANG9AGKJlT9gczJFZMSM0vyldp5xE4RH1Q6Kz
	cC6Uuu8yj9o+UYtIAUzTfe6MinHusBQ8j8GRYKHIHem+nA+EzjfvbOTPR2biA/Cbx5Cs
	TmAZpEHYBzk8vnytvAI5ia9vGlYoop5XCXNvmSzDXgpp2gn8l1e0f5DwETYSjsMeaEXf
	UV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=OcNxR1lOzjX/yzXC8c3lrAtoIZHmvUse40rcBfV6hcY=;
	b=EJEdzuNcL4TvBjeGoykPw3TQyzgn9JOsolWEmEv8JuBKgLdA/ukQgkPzQ/Gduc9qFP
	Z503bZ+dwAA8aSgN8VvIwZXlzE0+E1NM9kk9ewTU/TbP86cpTuCQrqEbzuf3ubUIzVc0
	kDDeuFmiGf1KRQwGsOUrE/+zcoxmpAn7H2CsjCnv1EJjCR8v6S8lweOxhPDSVZBMA5vt
	PekzyGrkNuPQBK3SJFIaLQSlx6mVjHrtNp+qhgzTV77Xd7dBNUF27wEEaNZOD94tsfVb
	//0hnpg45M6yFKsM1qSF6Q3Rz6HPiv2TJXL+5jj75XOILXYB20V2mSvreyFuQ5jcsOat
	J3WQ==
X-Gm-Message-State: AOPr4FUphY0oIsN0wofuJ3tTrql7dF2Mo/EAPhGHYqm3RzohdzbP8zNdqc/lorMKOvsNxQ==
X-Received: by 10.66.14.198 with SMTP id r6mr6876473pac.48.1462988190438;
	Wed, 11 May 2016 10:36:30 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:43 -0700
Message-Id: <1a7be143b7ae34c13cd0d917c0e8edce07192246.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 40/42] ruby: Upgrade to 2.2.5
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
X-List-Received-Date: Wed, 11 May 2016 17:36:29 -0000

This is latest in 2.2 series, helps with compile
using clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.2.5.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/ruby/{ruby_2.2.2.bb => ruby_2.2.5.bb} (86%)

diff --git a/meta/recipes-devtools/ruby/ruby_2.2.2.bb b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
similarity index 86%
rename from meta/recipes-devtools/ruby/ruby_2.2.2.bb
rename to meta/recipes-devtools/ruby/ruby_2.2.5.bb
index 6715023..5a64582 100644
--- a/meta/recipes-devtools/ruby/ruby_2.2.2.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.2.5.bb
@@ -1,7 +1,7 @@
 require ruby.inc
 
-SRC_URI[md5sum] = "326e99ddc75381c7b50c85f7089f3260"
-SRC_URI[sha256sum] = "5ffc0f317e429e6b29d4a98ac521c3ce65481bfd22a8cf845fa02a7b113d9b44"
+SRC_URI[md5sum] = "bd8e349d4fb2c75d90817649674f94be"
+SRC_URI[sha256sum] = "30c4b31697a4ca4ea0c8db8ad30cf45e6690a0f09687e5d483c933c03ca335e3"
 
 # it's unknown to configure script, but then passed to extconf.rb
 # maybe it's not really needed as we're hardcoding the result with
@@ -23,10 +23,6 @@ EXTRA_OECONF = "\
     --enable-load-relative \
 "
 
-EXTRA_OEMAKE = " \
-    LIBRUBYARG='-lruby-static' \
-"
-
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.8.2


