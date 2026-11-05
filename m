Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30055.1793868222411843166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QLMtzeWc;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3961525e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868221; x=1794473021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AKRPeSSxIrUfhMTK7/9I1hL9KJWkIoFDBHNKXTpHlwY=;
        b=QLMtzeWcw1sRPqZKqagkxSg5V5u+OK2R9ll+7BmRP7dfv72Nluny/vGW2lpJqgi3Rx
         ft8qtbZD9zUYUbnBwD2DW/FvkD77iI6mmBEFaX2pAbIrIVjhweEgD75FpfA0G26ktcDN
         qIQusW4tuv/Smb2O6yWt4XVSe0xsG1Wwf9Qb1Q7CZrCFg2PeGlDw5sHhkm2WS56yAVz2
         fTMb1y+l26N/3gpUH2t7N8dXELFihYn/6drJsvFfRL6MmogQ6SQ3+L8/myQQbShOJOHi
         I5EJPh3e42FzHPs8sNTdPRJnJ53en5v545Vu1p0SH6buZ2VnTzUODb18ukn2UBXKaobK
         Kxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868221; x=1794473021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AKRPeSSxIrUfhMTK7/9I1hL9KJWkIoFDBHNKXTpHlwY=;
        b=hnhCR+FgvBI0gNm2WQ15gH8vkJvsH5fJIzgmrUwEbFu5LhwS/hUlh/fu5/Y3cuLmFy
         Vm8kI2A5CdM/i7rw6XmQcmAI1q1nTFdya54FHmt43ReTtx9XTgGbErOuwbD1lzcGM3bq
         /yqYKWMSjbkM3y2Sc90Ek8aCV4xjgGbM2rG1rD4KAzSZHYzloX43iW0+L4S2bjblE3sk
         9CDkb3fuMo/hvFd4+xjw6D4nCAqfiZKhS1Tn17p5MUmTN48t2k5y11YuyOqbgnC8nDax
         V9zYDTqaPhXXLDAMWMsqrHvUgHmTSPGx8pQ4lD793ZRi4TX+5aOnry0R9jAAVRvqh0eT
         LN7g==
X-Gm-Message-State: APuU4Z+NN1HFs6Q468b4wK+afczPPpE3415QGfZbIJQuP8uv3qUpzt//
	+T/qOIhJAKMTj0dFbq6gmuuRYmmjnod/BzVhL5T59d4S9ToU0oiIyb0yOzx1SYVP0xgGP5FRk2q
	AIZ3O6Ag=
X-Gm-Gg: AYBFou1X9k1CibBxWdxgs0jASzjqhtx0QCxBsJAzpAwVpRbQOxbw/i7pbb0dBh7yuUs
	wjzZF2Udsd7IyeZz+99Es1/kvGCSopK0fWJ4ShJWRXxK9nqXmK1DuIKFvi5ip6VxayuUi7UahYA
	oRjZ6e73G+Dfvkt7C4qAkq3wMpKaywqGM2qxaNWSre1wvis7ZIC8KmA+dxuzX5U5MAi9ZXk3/PR
	5URizVcRhMkBWUyAKvOMX+MniqW8A7ViR3mipBlAgFBSDvypJXZnn3EvUO42rfUczwGvFuoLakE
	cPCkd46Q4YmxlyzeMmxwtTPa+6wCCy2yuPLGRXsbxd+DYSTnN/gv1vRAxl6RanOPhtSMJG4yHL3
	jEAREB2JLA+sdS1KVmmB4We41KPlLBVPPIOmRdTLCfiWdPjcPc2Rdd+nmGUtCYRErfs+ViQdioq
	RyH4TvqE4aGUROawBKW/flsLfUvEmF4smET9WC3Ue7O68wHBJ+f/UuaGCHbgd1MmFCUTAQwI2Xt
	F9FYZs89LrLm4yJT4T+UkiLPmXFT3sNek2fOMQPoxKD8GSqa8TItIu+hOnYyJmwmZZFQmB8IUBW
	NuM7RBo+AnMkaTsztpu7bdSrdsKJ4jkEjTOt40XlLlf5FkXiJXhfkzXxKSMPC52x9vyAtOisR3q
	SzED5YmSEd+rTsReUUl8u3UJJN+Fm
X-Received: by 2002:a05:600c:1507:b0:4a2:1002:223e with SMTP id 5b1f17b1804b1-4b5603f9c78mr19749185e9.7.1793868220651;
        Thu, 05 Nov 2026 00:43:40 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 07/60] boost: patch CVE-2023-34399
Date: Thu,  5 Nov 2026 09:42:26 +0100
Message-ID: <c0b9d588b2c6f2681a4f5fdf3874c440f43a24ad.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249466
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ba56fd3e9258e2351c31a402d63ac470d43c8d54)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../boost/boost/CVE-2023-34399.patch          | 35 +++++++++++++++++++
 meta/recipes-support/boost/boost_1.92.0.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/CVE-2023-34399.patch

diff --git a/meta/recipes-support/boost/boost/CVE-2023-34399.patch b/meta/recipes-support/boost/boost/CVE-2023-34399.patch
new file mode 100644
index 00000000000..f2dbccd67e9
--- /dev/null
+++ b/meta/recipes-support/boost/boost/CVE-2023-34399.patch
@@ -0,0 +1,35 @@
+From d772add4873bb2501d67554190c4272294d659f9 Mon Sep 17 00:00:00 2001
+From: Johnathan <39648915+TrebledJ@users.noreply.github.com>
+Date: Wed, 19 Aug 2026 16:50:08 +0200
+Subject: [PATCH] Reject a negative class id when loading a pointer (#332)
+
+A pointer carries the class id of what it points at, and a null pointer
+carries -1.  On the way back in, only -1 was recognised as the null tag,
+and the id then indexed the class table with an upper bound check but no
+lower bound one, so an archive carrying any other negative id read that
+table at an offset of its own choosing.  This is CVE-2023-34399.
+
+Treat every negative id as the null tag.  No archive a released version
+ever wrote carries one other than -1, so nothing that used to load stops
+loading.
+
+CVE: CVE-2023-34399
+Upstream-Status: Backport [https://github.com/boostorg/serialization/commit/d772add4873bb2501d67554190c4272294d659f9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libs/serialization/src/basic_iarchive.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libs/serialization/src/basic_iarchive.cpp b/libs/serialization/src/basic_iarchive.cpp
+index 1c6eb2047..b5c63c9ad 100644
+--- a/libs/serialization/src/basic_iarchive.cpp
++++ b/libs/serialization/src/basic_iarchive.cpp
+@@ -427,7 +427,7 @@ basic_iarchive_impl::load_pointer(
+     class_id_type cid;
+     load(ar, cid);
+ 
+-    if(BOOST_SERIALIZATION_NULL_POINTER_TAG == cid){
++    if(/* BOOST_SERIALIZATION_NULL_POINTER_TAG */ cid < 0){
+         t = NULL;
+         return bpis_ptr;
+     }
diff --git a/meta/recipes-support/boost/boost_1.92.0.bb b/meta/recipes-support/boost/boost_1.92.0.bb
index 01fc6bea665..5fa67a9da7e 100644
--- a/meta/recipes-support/boost/boost_1.92.0.bb
+++ b/meta/recipes-support/boost/boost_1.92.0.bb
@@ -5,4 +5,5 @@ SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-histogram-move-b2-project-requirements-out-of-build.patch \
+           file://CVE-2023-34399.patch \
            "
