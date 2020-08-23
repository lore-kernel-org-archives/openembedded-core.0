Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.181966.1598214093853395178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a2eqo/iN;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id l63so3212024edl.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sVW8B2Q33n+5XoOimXp3rAe7YphrsB6QI2UHepke9c4=;
        b=a2eqo/iN5Y+alwZ5Dtvgm7nMrtQ0TW+efGjkJuFpDmea6RQn3rdFgRuRdFXB95Fmvm
         bMNvS5ZZgUy6iN4pRnBLY5PI7l+Q0Pg9s7ex4eqtiIbx4RqgyFCLdwO5syxxghbl1fUM
         +jGr29P+QLudqPrUaA3Uwovxxf7v76v9aBzegna8i3dyxXAFiMjBw2qglV6DQDJ9E1cA
         JeNiPc7u8vFQCmd8uX5j0eKQrOEu73qdgx2wFLTcGnD7HXE5Br/kue0eeI/wb1CisJgp
         zetERtTWJQJUBtxrrQnT+MKTK92LssH3rbq3SaDNcxisy4WCX4ChMt4awphyBEw8MbSd
         IOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sVW8B2Q33n+5XoOimXp3rAe7YphrsB6QI2UHepke9c4=;
        b=Gg7P1J4PMNMa7SHmp5VXPlHxsA+DZcfQsPatQXotefB1sE9O54S/lbK6oBSnFamU2k
         w9xipjGcS+e5xfY51DeVs8UQOmCCwTHz0AOl8jarQX/lju53Z7UczEAVDvqWlkyac28k
         bQ12Qx1df4FByfSt4M803G/I98w+iCLfOKaz6uGelkczNoJJHMHO7/XA+L2ANkcSgWLP
         ZynSQwOFbRjviDRr0DBd+ANduL+dQ2XTe1L8BzyRIvLbRPCeZ/+rpGc7CaUhW8BWYXLN
         gSeQgWSPGoXcNXORoTI2yIS9fJDly5xEoPh7w4olDooz7u6dTw1pNgcfP466gtCPpUUP
         nZtw==
X-Gm-Message-State: AOAM533q5BeIdgMwyjYe3jkfl+9iqjIlFXRJ3MpGsBnGkoDrr97uNYUz
	zRmv0LmfdBxYTkFOXRU/YBJeM2McKwk=
X-Google-Smtp-Source: ABdhPJx5Pe2ydwari3XgarjtwKvqmaVd4IGI8EFIYLcMwI7bqiRdjtFu8ZjMpBqI4vXvPEB2ylIcmA==
X-Received: by 2002:aa7:d350:: with SMTP id m16mr2529174edr.169.1598214091883;
        Sun, 23 Aug 2020 13:21:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/37] boost: update 1.73.0 -> 1.74.0
Date: Sun, 23 Aug 2020 22:20:23 +0200
Message-Id: <20200823202031.24686-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...native_1.73.0.bb => bjam-native_1.74.0.bb} |  0
 .../{boost-1.73.0.inc => boost-1.74.0.inc}    |  3 +-
 ...h-instruction-set-flags-we-do-that-o.patch | 22 ++++++++------
 ...l-rtree-visitors-insert-base-class-p.patch | 30 -------------------
 .../{boost_1.73.0.bb => boost_1.74.0.bb}      |  1 -
 5 files changed, 14 insertions(+), 42 deletions(-)
 rename meta/recipes-support/boost/{bjam-native_1.73.0.bb => bjam-native_1.74.0.bb} (100%)
 rename meta/recipes-support/boost/{boost-1.73.0.inc => boost-1.74.0.inc} (85%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
 rename meta/recipes-support/boost/{boost_1.73.0.bb => boost_1.74.0.bb} (83%)

diff --git a/meta/recipes-support/boost/bjam-native_1.73.0.bb b/meta/recipes-support/boost/bjam-native_1.74.0.bb
similarity index 100%
rename from meta/recipes-support/boost/bjam-native_1.73.0.bb
rename to meta/recipes-support/boost/bjam-native_1.74.0.bb
diff --git a/meta/recipes-support/boost/boost-1.73.0.inc b/meta/recipes-support/boost/boost-1.74.0.inc
similarity index 85%
rename from meta/recipes-support/boost/boost-1.73.0.inc
rename to meta/recipes-support/boost/boost-1.74.0.inc
index b574757199..b47fdaf099 100644
--- a/meta/recipes-support/boost/boost-1.73.0.inc
+++ b/meta/recipes-support/boost/boost-1.74.0.inc
@@ -12,8 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[md5sum] = "9273c8c4576423562bbe84574b07b2bd"
-SRC_URI[sha256sum] = "4eb3b8d442b426dc35346235c8733b5ae35ba431690e38c6a8263dce9fcbb402"
+SRC_URI[sha256sum] = "83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 7c6b62e383..91ab53efd9 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,7 +1,8 @@
-From f4d3fad43d67808d71325ba0df1457555b9a0086 Mon Sep 17 00:00:00 2001
+From 8e1d30454afde37eaa3c593ec19d108cd5ed10d0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
+
 ourselves
 
 Upstream-Status: Inappropriate
@@ -9,14 +10,14 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- tools/build/src/tools/gcc.jam | 133 ----------------------------------
- 1 file changed, 133 deletions(-)
+ tools/build/src/tools/gcc.jam | 139 ----------------------------------
+ 1 file changed, 139 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 8910a55f2..ed7e7b20c 100644
+index ff3209f7b..70cbc39a5 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1195,136 +1195,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1217,142 +1217,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -66,7 +67,11 @@ index 8910a55f2..ed7e7b20c 100644
 -cpu-flags gcc OPTIONS : x86 : skylake : -march=skylake ;
 -cpu-flags gcc OPTIONS : x86 : skylake-avx512 : -march=skylake-avx512 ;
 -cpu-flags gcc OPTIONS : x86 : cannonlake : -march=skylake-avx512 -mavx512vbmi -mavx512ifma -msha ;
--cpu-flags gcc OPTIONS : x86 : icelake : -march=icelake ;
+-cpu-flags gcc OPTIONS : x86 : icelake-client : -march=icelake-client ;
+-cpu-flags gcc OPTIONS : x86 : icelake-server : -march=icelake-server ;
+-cpu-flags gcc OPTIONS : x86 : cascadelake : -march=skylake-avx512 -mavx512vnni ;
+-cpu-flags gcc OPTIONS : x86 : cooperlake : -march=cooperlake ;
+-cpu-flags gcc OPTIONS : x86 : tigerlake : -march=tigerlake ;
 -cpu-flags gcc OPTIONS : x86 : k6 : -march=k6 ;
 -cpu-flags gcc OPTIONS : x86 : k6-2 : -march=k6-2 ;
 -cpu-flags gcc OPTIONS : x86 : k6-3 : -march=k6-3 ;
@@ -92,10 +97,12 @@ index 8910a55f2..ed7e7b20c 100644
 -cpu-flags gcc OPTIONS : x86 : btver1 : -march=btver1 ;
 -cpu-flags gcc OPTIONS : x86 : btver2 : -march=btver2 ;
 -cpu-flags gcc OPTIONS : x86 : znver1 : -march=znver1 ;
+-cpu-flags gcc OPTIONS : x86 : znver2 : -march=znver2 ;
 -cpu-flags gcc OPTIONS : x86 : winchip-c6 : -march=winchip-c6 ;
 -cpu-flags gcc OPTIONS : x86 : winchip2 : -march=winchip2 ;
 -cpu-flags gcc OPTIONS : x86 : c3 : -march=c3 ;
 -cpu-flags gcc OPTIONS : x86 : c3-2 : -march=c3-2 ;
+-cpu-flags gcc OPTIONS : x86 : c7 : -march=c7 ;
 -##
 -cpu-flags gcc OPTIONS : x86 : atom : -march=atom ;
 -# Sparc
@@ -153,6 +160,3 @@ index 8910a55f2..ed7e7b20c 100644
 -cpu-flags gcc OPTIONS : s390x : z15 : -march=z15 ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
--- 
-2.17.1
-
diff --git a/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch b/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
deleted file mode 100644
index 1edad329ca..0000000000
--- a/meta/recipes-support/boost/boost/0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From aafbceccc76dccb75963dd4f596fd1f10ee34b03 Mon Sep 17 00:00:00 2001
-From: Jonathan Wakely <boost@kayari.org>
-Date: Fri, 5 Jun 2020 19:29:27 +0100
-Subject: [PATCH] Make index::detail::rtree::visitors::insert base class public
-
-Fixes #721
-
-Upstream-Status: Backport [https://github.com/boostorg/geometry/commit/aafbceccc76dccb75963dd4f596fd1f10ee34b03]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- boost/geometry/index/detail/rtree/visitors/insert.hpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/boost/geometry/index/detail/rtree/visitors/insert.hpp b/boost/geometry/index/detail/rtree/visitors/insert.hpp
-index 2d324cb7f..5709a930c 100644
---- a/boost/geometry/index/detail/rtree/visitors/insert.hpp
-+++ b/boost/geometry/index/detail/rtree/visitors/insert.hpp
-@@ -265,7 +265,7 @@ struct insert_traverse_data
- // Default insert visitor
- template <typename Element, typename MembersHolder>
- class insert
--    : MembersHolder::visitor
-+    : public MembersHolder::visitor
- {
- protected:
-     typedef typename MembersHolder::box_type box_type;
--- 
-2.26.2
-
diff --git a/meta/recipes-support/boost/boost_1.73.0.bb b/meta/recipes-support/boost/boost_1.74.0.bb
similarity index 83%
rename from meta/recipes-support/boost/boost_1.73.0.bb
rename to meta/recipes-support/boost/boost_1.74.0.bb
index 995c14e8cc..5e9e0d87d7 100644
--- a/meta/recipes-support/boost/boost_1.73.0.bb
+++ b/meta/recipes-support/boost/boost_1.74.0.bb
@@ -7,5 +7,4 @@ SRC_URI += "file://arm-intrinsics.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
-           file://0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch \
            "
-- 
2.28.0

