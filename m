Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5583.1794387811270436077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=b9DQDYgF;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso19975655e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387809; x=1794992609; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RkLB38soqeHUvFOxU4a8VMAsI0/sITWngKYEjxBLg90=;
        b=b9DQDYgFzwlJrbxsRODy9aOSHOMWt/eu8Z6Lj+ZWhlvNyuDvXQb0FkkR0lejjQQ4JR
         3zX6gwJBa5mjzuvwHpAeZbNcHJDhU/BYN6HbGiirFUBHrlHVFT4i1IWuhbIovFL0QzUQ
         Rb2o8frZwzD6iLJrwG3wHXZZWHpc7CIiNqrR1UPr137KQiNxNJADotuaDZqqClVxTTXZ
         ZP3XhjygaiQa37LqIuk1Ya44YbR36bhSlG+P9NyIuS3j4aN5C9c7VsV3WaR9qvT7WrSE
         cpN81ySjThHuIuuC2VH6btzJZ1xAhfsdSOjHC3Qy6qhnyERdNWIUWXPSbW5QKPpobYo6
         dHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387809; x=1794992609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RkLB38soqeHUvFOxU4a8VMAsI0/sITWngKYEjxBLg90=;
        b=zlXZNOedMh6ngRDV6ivqikDcbq2nNSYX9qIaOZtheowgwQYoDrivlQtT6ixyxse2jO
         icDoc6q5C1leUfuk1ruFIN0DZe12I2C0eEB/EW/Uv2IsqK+QujydlUCgY2hntnaaz5Rz
         iAJtn6PM9BlqZIWV0qOrJS6bzbhmxcNav76ppJuzz2dfKG317UUAnxGVBVhTfOVRgm6L
         oNn3Lqkl7VW0bpcLFzzH3WVS0AGRLS3FNvhNoA6nUkzzTlY6ew6GXvJwifTW4RkXl9CR
         NeXO5lRL0BQHSQs2GCaTSfIjV6EMMXipz30qW5md/E/OhDKEUk1g9uxymVhpOZsF8CZu
         yw8w==
X-Gm-Message-State: APuU4Z8xc9wlYM41rs9ygPiUsydN/dMAhPZgTqvCvl3bubx3nwffaEAD
	BALYwnQrx7HqX70EQfmtxyFyRcDWiOAZvsOMi8bmAnfFqovVo5yAqJwuzpxnzLvmEbxkVmzCD4G
	rbLmepfY=
X-Gm-Gg: AYBFou05vPX2zPYNnVHl/Mdz8uVqmREv/bEA9Lb8Gm7iPQax7+uO6lqZ+32zPW5TFjn
	IdGADoKa08mWqRPxx1dDBmVqTjTex81Xiq+QIz9FRkxt4HQ6JUPj3ci8hRxG5akB5PPn8I/0NH7
	sNzsCrOzyfCMdg9V6tkeK0Mxbk7Aj+ekYPGNRqlL+U6Q8QxUXBSlEq2OwNqYzwrFMtUy0Gmy2Db
	Eybk+ybA9ZkDKS14dY5B5d5uxTfDFNvtwN0QzUZC3ifG7xw5NbULuQ77zwDpJ5wiLtSIrsgz0ph
	+O8euX6RwK5mGhoIYzeg01FQXn3Z/lE3R9D+krKe+wbcah0wf1RmtMSX84ohRQmzM+T4zXrP+Wp
	FTi20Xsf5bbNs1aR3Zx0h61hdEAi4iklScOmKuZogp8PWkI7hS/3ZjXrrfb7vV5naPRnp9Pdesf
	hYBPNBkpTCvcBZ/rlHgEQla1ldFBOIyB9V1m8pETwPXUD6rT++dfs/Xlio6ATzxrqTAyIz4ZM5d
	YTRjsafMvtlwiIlWGmPqY7Br/HC2ZXWCRm7D8gSoeBTBwVLCGmeuGYokWtX+qm5KSNg3br5DhjP
	1doEwUN5Te1IuIdr0EJKoBS2ZU8iA2mPswt/fpFWgfqmxx652TuzmX5xl752JtfHy7RbV0gPwAt
	S2h4rTbHVDzJxZd1QXOPvUTaG+lLXjCewlKg0DRlM7cEi06R6cg==
X-Received: by 2002:a05:600c:3486:b0:4ba:6d8:dfaa with SMTP id 5b1f17b1804b1-4ba0936e95bmr31835265e9.12.1794387809428;
        Wed, 11 Nov 2026 01:03:29 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/35] boost: patch CVE-2023-34399
Date: Wed, 11 Nov 2026 10:02:39 +0100
Message-ID: <5c95f8552caaf86ea1047b0e5ce96202f2d0435f.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249985
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
 meta/recipes-support/boost/boost_1.90.0.bb    |  1 +
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
diff --git a/meta/recipes-support/boost/boost_1.90.0.bb b/meta/recipes-support/boost/boost_1.90.0.bb
index 4b580d078be..c66f182384d 100644
--- a/meta/recipes-support/boost/boost_1.90.0.bb
+++ b/meta/recipes-support/boost/boost_1.90.0.bb
@@ -4,4 +4,5 @@ require boost.inc
 SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
+           file://CVE-2023-34399.patch \
            "
