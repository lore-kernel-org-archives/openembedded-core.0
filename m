Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id B6936617B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 21:56:47 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so20699339pdj.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 14:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=tvQQgWFF8l3fvS2DEOgNnh7ItI75ib5h1xu0mjffVB0=;
	b=wC+y9zfPz6eJjOz45Q0FQ8liwiH0f7Y9BgvsrkRl1h2j0rqbdOHsUw5n3Pve1WITwZ
	l6o93mPvES1cCD8NYje3hSw35ss4J+weV3l9Ft6rXxNt2jw1YhTa8bB3uuZOcixwMAck
	V14dLZK/kOZG3bTEOm82ZAUdUD/JRs6fSmMuBU9dTRImvnciV4PfJ1TZ7nBhjbcGgclA
	mCP5//o/lAlvGbA5X2EvjnFPUQeZJiEcuj1dDptuEgXJh6EbYW/6DqmVplw/8/MzBBjc
	M9RLLtf3JHjEcKz34wCnVluQwPNkG3KEpyZIzvDOEiIfRY8kmuB5pJe/gdS+UYWEx6t3
	dtrA==
X-Received: by 10.70.95.100 with SMTP id dj4mr29151246pdb.94.1409003808884;
	Mon, 25 Aug 2014 14:56:48 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id st7sm3484984pab.7.2014.08.25.14.56.47
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 14:56:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:00:29 -0700
Message-Id: <20ca5b9e346abbb3015f8a67a249858d8195df11.1409002841.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1409002841.git.raj.khem@gmail.com>
References: <cover.1409002841.git.raj.khem@gmail.com>
Subject: [PATCH 1/2] openssl: Re-add linux-uclibc tuple
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
X-List-Received-Date: Mon, 25 Aug 2014 21:56:50 -0000

With last restructuring for musl, some of uclibc targets got ignored
fsl/ppc and ARM worked ok since they use special target triplets which
were already considered but other like mips, x86 and so on failed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index b63d164..9ec884f 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -62,6 +62,7 @@ do_configure () {
 
 	os=${HOST_OS}
 	case $os in
+	linux-uclibc |\
 	linux-uclibceabi |\
 	linux-gnueabi |\
 	linux-uclibcspe |\
-- 
1.7.10.4


