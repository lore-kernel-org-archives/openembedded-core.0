Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id CCD3678704
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 00:51:31 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id n7so11417167wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 16:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ox6hNXnfIe/vXl7ifBv29hssp+rZbvnUDTMOX9vY1pU=;
	b=ExQxM2J0cr6HDxzBRjA5nwNOhmoR0X0e/rXttnxk1qaeUFk3uxUgJW0p8oIzI7Jk+K
	nzsKMMjV7jNr69Tmh8TwjbjL3aqzL9LXceBfloN+1m3A8PteB2d1XAQjKTfvf8L5vtle
	NrAdf/kXtlh1d0PV2X/SibW3gMsHPKHDPGtY2QDc9c6OD22hmTGvocpFf3gJRh+4c4LJ
	PuhDATaB9JFoFJt+XdKZPYN777ku1FqxbVF9Tc3iW8vIpdYDgG5kaGvNRJZLiBQxKRYK
	KlS8MymUdVmiHCK/ZdDvhLV96bI7V9C1i+iGPfn9Rxq33ArrjJmJwimWzHl2KBbGydwa
	tlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ox6hNXnfIe/vXl7ifBv29hssp+rZbvnUDTMOX9vY1pU=;
	b=O/kJypB3BMJ/H7Cl1a9U5ruRkR641Sx/BT0PDs9bQRpfQ98tA+qPh4Uv4PakyDrVCC
	4eKU/1LrCysbrLFx7hfeQUIrFaEJ8Lnx+XMSE5k3CjGtCfeysDPbxkagpnMGeCVSWzOj
	vajeJKYHfCJfB4TaJoc/yVJ0/Ei4n/5EVMFoGwQrHG3L2pRaKmL1fXvN3SAwtQ5J2qLi
	FOpAQevdnr3s/5vWgoEApEs3fJ5qYaG0n7JZCyrxrXRUAYRaICVLxx6lWahVQxEMX5T8
	6i83x2O/Xx2WFTMFmk5BuSIMQ0ozQ5Calbr+jvqgVHKHYpkeaSoCKr3Rb9c5jBQntXSB
	ED1g==
X-Gm-Message-State: APf1xPBb2ycDxsEMZ4RDEc5ANvlxlV5Fay0efEnBoHtDewbX6PfoTtOH
	WKnNlMWYozDJOqeXJYyuosel6013
X-Google-Smtp-Source: AH8x227zARfMfXtaXMy/oPS/tB0dDQScU0bK6JTz1s9T51nzlO3pyjQp5pdTA0b7J/yG3h8lTpEwDQ==
X-Received: by 10.223.176.171 with SMTP id i40mr14414170wra.57.1519087891894; 
	Mon, 19 Feb 2018 16:51:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c14sm18606211wmh.2.2018.02.19.16.51.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Feb 2018 16:51:31 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2018 00:51:23 +0000
Message-Id: <20180220005123.12127-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180220005123.12127-1-ross.burton@intel.com>
References: <20180220005123.12127-1-ross.burton@intel.com>
Subject: [PATCH 2/2] libtirpc: refresh patches
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
X-List-Received-Date: Tue, 20 Feb 2018 00:51:32 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-include-stdint.h-for-uintptr_t.patch      | 23 ++++-----
 .../0001-replace-__bzero-with-memset-API.patch     | 58 +++++++++++++++++-----
 .../libtirpc/export_key_secretkey_is_set.patch     | 29 +++++++----
 3 files changed, 74 insertions(+), 36 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
index 1fe9833afed..7e3e2f86ad4 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
@@ -1,17 +1,15 @@
-From b80d3b573c1dade2b29b22f8acc3b9e2c7ddefd7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 20 May 2017 13:36:43 -0700
-Subject: [PATCH] include stdint.h for uintptr_t
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-Fixes
-| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
-|   if (len < (uintptr_t)xdrs->x_base) {
-|              ^~~~~~~~~
+From acb9a37977cf0a9630eac74af9adebf35e38e719 Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@thkukuk.de>
+Date: Tue, 14 Nov 2017 10:39:08 -0500
+Subject: [PATCH] Include stdint.h from xdr_sizeof.c to avoid missing
+ declaration errors.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Thorsten Kukuk <kukuk@suse.de>
+Signed-off-by: Steve Dickson <steved@redhat.com>
 ---
-Upstream-Status: Pending
-
  src/xdr_sizeof.c | 1 +
  1 file changed, 1 insertion(+)
 
@@ -28,5 +26,4 @@ index d23fbd1..79d6707 100644
  
  /* ARGSUSED */
 -- 
-2.13.0
-
+1.8.3.1
diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
index d2b4da6ae2c..7ae19cb3196 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
@@ -1,17 +1,39 @@
-From 20badc3e3608953fb5b36bb2e16fa51bd731aebc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 18 Apr 2017 09:35:35 -0700
-Subject: [PATCH] replace __bzero() with memset() API
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-memset is available across all libc implementation
+From 5356b63005e9d8169e0399cb76f26fbd29a78dee Mon Sep 17 00:00:00 2001
+From: Joshua Kinard <kumba@gentoo.org>
+Date: Wed, 23 Aug 2017 14:31:36 -0400
+Subject: [PATCH] Replace bzero() calls with equivalent memset() calls
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
+As annotated in the bzero(3) man page, bzero() was marked as LEGACY in
+POSIX.1-2001 and removed in POSIX.1-2008, and should be replaced with
+memset() calls to write zeros to a memory region.  The attached patch
+replaces two bzero() calls and one __bzero() call in libtirpc with
+equivalent memset() calls.  The latter replacement fixes a compile error
+under uclibc-ng, which lacks a definition for __bzero()
 
- src/des_impl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Signed-off-by: Joshua Kinard <kumba@gentoo.org>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+---
+ src/auth_time.c    | 2 +-
+ src/des_impl.c     | 2 +-
+ src/svc_auth_des.c | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
 
+diff --git a/src/auth_time.c b/src/auth_time.c
+index 7f83ab4..69400bc 100644
+--- a/src/auth_time.c
++++ b/src/auth_time.c
+@@ -317,7 +317,7 @@ __rpc_get_time_offset(td, srv, thost, uaddr, netid)
+ 	sprintf(ipuaddr, "%d.%d.%d.%d.0.111", a1, a2, a3, a4);
+ 	useua = &ipuaddr[0];
+ 
+-	bzero((char *)&sin, sizeof(sin));
++	memset(&sin, 0, sizeof(sin));
+ 	if (uaddr_to_sockaddr(useua, &sin)) {
+ 		msg("unable to translate uaddr to sockaddr.");
+ 		if (needfree)
 diff --git a/src/des_impl.c b/src/des_impl.c
 index 9dbccaf..15bec2a 100644
 --- a/src/des_impl.c
@@ -25,6 +47,18 @@ index 9dbccaf..15bec2a 100644
  
    return (1);
  }
+diff --git a/src/svc_auth_des.c b/src/svc_auth_des.c
+index 2e90146..19a7c60 100644
+--- a/src/svc_auth_des.c
++++ b/src/svc_auth_des.c
+@@ -356,7 +356,7 @@ cache_init()
+ 
+ 	authdes_cache = (struct cache_entry *)
+ 		mem_alloc(sizeof(struct cache_entry) * AUTHDES_CACHESZ);	
+-	bzero((char *)authdes_cache, 
++	memset(authdes_cache, 0,
+ 		sizeof(struct cache_entry) * AUTHDES_CACHESZ);
+ 
+ 	authdes_lru = (short *)mem_alloc(sizeof(short) * AUTHDES_CACHESZ);
 -- 
-2.12.2
-
+1.8.3.1
diff --git a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
index a276ba27a59..d7f49686696 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
@@ -1,18 +1,23 @@
-Add key_secretkey_is_set to exported symbols map
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-key_secret_is_set is a typo in libtirpc map
-Patch taken from
+From e51d67549b516b2dac6c71d92c8499f6e67125ad Mon Sep 17 00:00:00 2001
+From: Thorsten Kukuk <kukuk@thkukuk.de>
+Date: Tue, 14 Nov 2017 10:43:53 -0500
+Subject: [PATCH] Fix typo in src/libtirpc.map
 
-https://sourceforge.net/p/libtirpc/discussion/637321/thread/fd73d431/
+Which prevents that key_secretkey_is_set will be exported.
 
-Upstream-Status: Pending
+Signed-off-by: Thorsten Kukuk <kukuk@suse.de>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+---
+ src/libtirpc.map | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: libtirpc-1.0.1/src/libtirpc.map
-===================================================================
---- libtirpc-1.0.1.orig/src/libtirpc.map
-+++ libtirpc-1.0.1/src/libtirpc.map
+diff --git a/src/libtirpc.map b/src/libtirpc.map
+index f385de5..21d6065 100644
+--- a/src/libtirpc.map
++++ b/src/libtirpc.map
 @@ -298,7 +298,7 @@ TIRPC_0.3.2 {
      key_gendes;
      key_get_conv;
@@ -22,3 +27,5 @@ Index: libtirpc-1.0.1/src/libtirpc.map
      key_setnet;
      netname2host;
      netname2user;
+-- 
+1.8.3.1
-- 
2.11.0


