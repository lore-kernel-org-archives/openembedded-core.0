Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6967570D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:06 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so15284182pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sPJjXiK8W9+uQYUKFkxZh3mFRjoQaTwk83EiYxmWqmc=;
	b=wtQ6a3JLSSJH2UJM9ZppEQKe2bAPVybsm5VdLFVSaRJT34S/tw1GD2tFdYjHxLF4Bu
	enGp9VFi5MEEkBCUtLmL1lKILlbNZjtVh4inHqrOrufiiQCYsCauhHImLpBCr2ZI15K0
	qse1cIz6tA1f2a/ea6w6bhxaSrFN8h2N5QcIgnPYlrt/v5Au6wC03D+4HnCTKzvpjGDI
	zN3jMP9emNirR4cNex/kExtv7za31blUvOtzr9aq2F6NKaXqQu3mW3DqgaqVx3Tgff2i
	CZXGFjm3Le3vy+N5V44YvLfs/TsiaekWEdrRjH6Wz7svK4alYcqDrq5gIWLX6GnWI9U8
	pbiQ==
X-Received: by 10.68.178.131 with SMTP id cy3mr14704259pbc.52.1444982406896;
	Fri, 16 Oct 2015 01:00:06 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 00:59:56 -0700
Message-Id: <21220ea71fe4b6c07babfa3c5581391f5c439d1d.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 2/9] libtirpc: Refresh uclibc patches
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:08 -0000

patch fails to apply otherwise

Change-Id: Ic16912e6e0e8ba75253a4aa0b357b91cabefbf5c
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libtirpc/libtirpc/remove-des-uclibc.patch      | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch b/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
index d003348..553b1ff 100644
--- a/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc/remove-des-uclibc.patch
@@ -3,11 +3,11 @@ uclibc does not provide des functionality unlike eglibc so lets disable ssl supp
 Upstream-Status: Inappropriate [uclibc specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: libtirpc-0.2.3/src/rpc_soc.c
+Index: libtirpc-0.2.5/src/rpc_soc.c
 ===================================================================
---- libtirpc-0.2.3.orig/src/rpc_soc.c	2013-03-10 16:00:51.355282153 -0700
-+++ libtirpc-0.2.3/src/rpc_soc.c	2013-03-10 16:00:51.703282148 -0700
-@@ -520,6 +520,7 @@
+--- libtirpc-0.2.5.orig/src/rpc_soc.c
++++ libtirpc-0.2.5/src/rpc_soc.c
+@@ -520,6 +520,7 @@ clnt_broadcast(prog, vers, proc, xargs,
  	    (resultproc_t) rpc_wrap_bcast, "udp");
  }
  
@@ -15,7 +15,7 @@ Index: libtirpc-0.2.3/src/rpc_soc.c
  /*
   * Create the client des authentication object. Obsoleted by
   * authdes_seccreate().
-@@ -551,6 +552,7 @@
+@@ -551,6 +552,7 @@ fallback:
  	dummy = authdes_seccreate(servername, window, NULL, ckey);
  	return (dummy);
  }
@@ -23,16 +23,16 @@ Index: libtirpc-0.2.3/src/rpc_soc.c
  
  /*
   * Create a client handle for a unix connection. Obsoleted by clnt_vc_create()
-Index: libtirpc-0.2.3/src/Makefile.am
+Index: libtirpc-0.2.5/src/Makefile.am
 ===================================================================
---- libtirpc-0.2.3.orig/src/Makefile.am	2013-03-10 16:00:51.355282153 -0700
-+++ libtirpc-0.2.3/src/Makefile.am	2013-03-10 16:00:51.703282148 -0700
-@@ -50,7 +50,7 @@
+--- libtirpc-0.2.5.orig/src/Makefile.am
++++ libtirpc-0.2.5/src/Makefile.am
+@@ -51,7 +51,7 @@ libtirpc_la_SOURCES = auth_none.c auth_u
          rpc_callmsg.c rpc_generic.c rpc_soc.c rpcb_clnt.c rpcb_prot.c \
          rpcb_st_xdr.c svc.c svc_auth.c svc_dg.c svc_auth_unix.c svc_auth_none.c \
          svc_generic.c svc_raw.c svc_run.c svc_simple.c svc_vc.c getpeereid.c \
--        auth_time.c auth_des.c authdes_prot.c
-+        auth_time.c
+-        auth_time.c auth_des.c authdes_prot.c debug.c
++        auth_time.c debug.c
  
  ## XDR
  libtirpc_la_SOURCES += xdr.c xdr_rec.c xdr_array.c xdr_float.c xdr_mem.c xdr_reference.c xdr_stdio.c
-- 
2.6.1


