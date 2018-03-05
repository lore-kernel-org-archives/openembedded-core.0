Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BCCC278AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 17:21:19 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x7so17039123wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 09:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=33mFhc5rLmVgYUgGmb/aJUuSsUU1S+6e8oH5WRTHdao=;
	b=VL137B9tnRXK8kg0FYnVf5oPR+b2hStUjF8NyeErMxZWWQ+2mRJQA0Nlpp907vknW2
	jHI0Bai1d+zbbqZ20a1P53zgir5vaXXkHSzs80I3b6Op5VKMRytK4xyp/pKbrbRGKv8L
	UFb2Nvb99tUECF5Zevckzmm6fjUma02AX85uywvsQZpLMtemYec+nLwzDyZC99cXL9TM
	77yLgjAKRpEiocRU5iH5i+GYysaJEcic5FTgNr0SdbsLYUTgH5pYx1OsGXC1r2slQ6j2
	gZVfMbVC2KrJH98p3wrzIspNNYdlCXXVvciLiaaeTyJyCRae5KtqabAvqanZTx0sCO5e
	j4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=33mFhc5rLmVgYUgGmb/aJUuSsUU1S+6e8oH5WRTHdao=;
	b=sCmaWzl16HPF3or+nC7qyuZa468f0mf8csYRFtqyWyl9t2RtLmXVT5w+SIzRVNQhBq
	uVj12AkQz5j5DPzqFxDoiz7sxLkkmJnK484usp9cbC65cwxygXQJ9TKsuP9m2WWAv0Ii
	EA8wOz5x38V8znt4fecmc8k9vCLMpzCfq7glEY+lerSxi+wJr8Cad/03aIhgF+oXN1gB
	exMfVXJOgD9kzagyXfb+vU3B82pBYvU06M+9B0K1vs743ijtxBq3O/jeMqp6X+HkaQJj
	hagt9oRTnwYnlmvWdvzyAAgOz3DtV6H3bqz7eDiwwbOe3MkS9jOEKJasL6lRpxAtwi5b
	4jSg==
X-Gm-Message-State: AElRT7HZz6nJKFejiu27LxhLsIJzYjs20LYsYHnYTLJX8SQUF4P6vKp8
	c0niRdDMpfODsOnnAc5zynExoBnr
X-Google-Smtp-Source: AG47ELsu5al+GY3ukZZYc0h0u1MTpCB6zGk0tgYSa6M8aNI/ywfEwLEXKYp4uaFBmSk3JaKw0LzbBQ==
X-Received: by 10.28.12.14 with SMTP id 14mr8800971wmm.107.1520270480679;
	Mon, 05 Mar 2018 09:21:20 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	m190sm10082047wmb.6.2018.03.05.09.21.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Mar 2018 09:21:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:20:45 +0000
Message-Id: <20180305172046.21729-28-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180305172046.21729-1-ross.burton@intel.com>
References: <20180305172046.21729-1-ross.burton@intel.com>
Subject: [PATCH 28/29] libpcre: refresh patches
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
X-List-Received-Date: Mon, 05 Mar 2018 17:21:20 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libpcre/libpcre2/pcre-cross.patch              | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch b/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
index 9516caf51aa..871cdfcb7db 100644
--- a/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
+++ b/meta/recipes-support/libpcre/libpcre2/pcre-cross.patch
@@ -9,11 +9,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
-diff --git a/Makefile.am b/Makefile.am
-index 38f1d41..2bde083 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -298,9 +298,21 @@ bin_SCRIPTS = pcre2-config
+Index: pcre2-10.30/Makefile.am
+===================================================================
+--- pcre2-10.30.orig/Makefile.am
++++ pcre2-10.30/Makefile.am
+@@ -325,9 +325,21 @@ bin_SCRIPTS = pcre2-config
  ## to copy a distributed set of tables that are defined for ASCII code. In this
  ## case, dftables is not needed.
  
@@ -35,13 +35,13 @@ index 38f1d41..2bde083 100644
  src/pcre2_chartables.c: dftables$(EXEEXT)
  	rm -f $@
  	./dftables$(EXEEXT) $@
-diff --git a/configure.ac b/configure.ac
-index d7c57aa..d6eb0aa 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -59,6 +59,23 @@ then
-   fi
- fi
+Index: pcre2-10.30/configure.ac
+===================================================================
+--- pcre2-10.30.orig/configure.ac
++++ pcre2-10.30/configure.ac
+@@ -60,6 +60,23 @@ fi
+ # This is a new thing required to stop a warning from automake 1.12
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
  
 +if test x"$cross_compiling" = xyes; then
 +    CC_FOR_BUILD="${CC_FOR_BUILD-gcc}"
-- 
2.11.0


