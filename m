Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DA93A61BB2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 18:13:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48gSGY50Vjz3w
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 19:13:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584295989;
	bh=ztDOXCUBtZ08eopnuw9sbl9mm+11fEwobWzdzLCXWJI=;
	h=From:To:Subject:Date:From;
	b=LqcLwQ+tQCuCAuFopmO+MmdYq0/K3dZJ2S7NWrqnMbjY9vB2qnmQPSQn1SPhQI+b0
	gE3yZLeW3J+bhN5ddTQJMHxwB3xXdZY/oIzbo3a9aDyBSPZZiqBebzc2Jnctg1dwJR
	gDGfiCokCSijvBfPFuchJBZTHqI1kGJGp3a7RNAt+dJYEyMbAuQxoQsiH1Bs0ZWMbE
	EG4U+hMta88HuEhMCQYBwPKkIMZPAAmfKXi/iDtJAAdR86zaZvHe8mDhZKbUN/FNpO
	+rrWeaPDqNjm2MPW2m39rubHku5z6bHckyR3KHlNWyq2KtVpx/Zb38nfCKbpshXxtx
	hhwrEmFfH+b75t6GWfTh5AVIuUKvlbAcUtUoh1Ao0GqSlaXLRhoEHcDVP4St2AjS5Q
	RCv/ukIUT79jwxIrIxQbfUIlixU5GH8iCAqFV1EQGd1XT9L9zGQbjGlCgEdJJpkUQO
	kYxi9Yz+XOXBNIV2Rx8xOY9KqjoHN3fJYhnMHzqNJREX+TmXd6oBhKiDFdoORD1y2l
	4jC/Gh1W9cG5v5E5GmNfIxTDM34x3hXUH2NRNm3KXRrF47ai2ZjDidXTD9xPLmVDAh
	oGS+/EVPnmUUzxayYkeRqVZb+3coj1WciVQ/2LeNfapGN3s3lKGCxHZ+NFRCLMQ25y
	lH4nPi7LIIpEy/PTZXISqvEI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Mar 2020 20:13:06 +0200
Message-Id: <20200315181308.12792-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH 1/3] gnupg: update to 2.2.15
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
X-List-Received-Date: Sun, 15 Mar 2020 18:13:10 -0000

From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>

(From OE-Core rev: e60b3994d4bc282191302e1fd9b7d2106ee2f6cb)

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...01-Woverride-init-is-not-needed-with-gcc-9.patch | 13 ++++++++-----
 .../gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb}      |  4 ++--
 2 files changed, 10 insertions(+), 7 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.13.bb => gnupg_2.2.15.bb} (93%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
index 4a280f9d5c..83195b5bd4 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-Woverride-init-is-not-needed-with-gcc-9.patch
@@ -1,4 +1,4 @@
-From 0df5800cc2e720aad883a517f7d24a9722fe5845 Mon Sep 17 00:00:00 2001
+From e3adc816d2d56dd929016073937ba24e01e03cb8 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Dec 2018 17:37:48 -0800
 Subject: [PATCH] Woverride-init is not needed with gcc 9
@@ -17,15 +17,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/dirmngr/dns.h b/dirmngr/dns.h
-index 30d0b45..98fe412 100644
+index 024d6dcc8..c6e141e16 100644
 --- a/dirmngr/dns.h
 +++ b/dirmngr/dns.h
-@@ -154,7 +154,7 @@ DNS_PUBLIC int *dns_debug_p(void);
+@@ -139,7 +139,7 @@ DNS_PUBLIC int *dns_debug_p(void);
+ #define DNS_PRAGMA_QUIET _Pragma("clang diagnostic ignored \"-Winitializer-overrides\"")
+ #define DNS_PRAGMA_POP _Pragma("clang diagnostic pop")
  
- #define dns_quietinit(...) \
- 	DNS_PRAGMA_PUSH DNS_PRAGMA_QUIET __VA_ARGS__ DNS_PRAGMA_POP
 -#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || __GNUC__ > 4
 +#elif (__GNUC__ == 4 && __GNUC_MINOR__ >= 6) || (__GNUC__ > 4 && __GNUC__ < 9)
  #define DNS_PRAGMA_PUSH _Pragma("GCC diagnostic push")
  #define DNS_PRAGMA_QUIET _Pragma("GCC diagnostic ignored \"-Woverride-init\"")
  #define DNS_PRAGMA_POP _Pragma("GCC diagnostic pop")
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.13.bb b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
similarity index 93%
rename from meta/recipes-support/gnupg/gnupg_2.2.13.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.15.bb
index 3ce2a38c0e..06a257333d 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.13.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.15.bb
@@ -20,8 +20,8 @@ SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 
 
-SRC_URI[md5sum] = "563b959d0c3856e34526e9ca51c80d7b"
-SRC_URI[sha256sum] = "76c787a955f9e6e0ead47c9be700bfb9d454f955a7b7c7e697aa719bac7b11d8"
+SRC_URI[md5sum] = "3ab87e377aa0af2f463649515bf66508"
+SRC_URI[sha256sum] = "cb8ce298d7b36558ffc48aec961b14c830ff1783eef7a623411188b5e0f5d454"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.17.1


