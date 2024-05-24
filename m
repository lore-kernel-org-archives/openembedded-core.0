Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0803C25B75
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 02:52:07 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.7521.1716519121650043272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 19:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gDuaOium;
 spf=pass (domain: konsulko.com, ip: 209.85.215.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-66629f45359so2460172a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 19:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1716519120; x=1717123920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4vKymhkaPGg+3YvyYKv/PTb/twwn18btKxWMxe81MA=;
        b=gDuaOiuma8foVPDhTJLP4hd5bDad8pzQvBHapKARNa3SKKbFb1AK9+1EfAQgZmAgcQ
         rLVySBEc2N16GMVjDAwne2hRreSixvnAYuXGDNPFGMkEEBIbs6waEeJGX43Kn99D1NpB
         LonkNe3/sTpCz+WhQ/QA8gVHkjkHXii9pIgdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716519120; x=1717123920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4vKymhkaPGg+3YvyYKv/PTb/twwn18btKxWMxe81MA=;
        b=nNDOp3uc3I8tr0q/g4lUHtTR7VIUZPaJUN1QuzEQoVk72NpC691eIk9VE3Jqi3ObLT
         BEB9pE501LS3L3VGD4M6gCTZyzTiJhXaD6k4PhFWb3PBtZiFzbU0mSemHsudw/laBOK8
         E/DqVIGk3as03pQPftdU/b56czi2mczx4yzgfGUBpT1uGsgtAg+iiCQ7j0gjl0aWbVBW
         +YGkcjNf6LvMMbKMdxGU0HrLzEIu1m0ROxMXmXAUhVSJuv7XY9PUXehj6i7hXJk+hMQl
         YdSjHwYOWLi0rASyAh679R+hxJadF9glz11yZ4J4eHTtTf4mK2dctjhcWRkQuibKlYr4
         l6kg==
X-Gm-Message-State: AOJu0YzNgawTJgL5jtlQ2UH57qKrCAErhwv/SPn3Df+M7PgASGGs5Onp
	VK2OvywVZM6tzhd7VN/A4BURDe2gx5zGWU5Zfcswtdv5dwoph49S1kqgUupBlQnQ9cYdsynxRiW
	3Lhg=
X-Google-Smtp-Source: AGHT+IFpQ2W8KDrgkKsIds2cqB/lw5v4/o5x5UOwn8VZ9FGjqDhiz57UCOb5dsquLHM8bhPiYj8i9w==
X-Received: by 2002:a05:6a21:3e09:b0:1af:cbe1:8a50 with SMTP id adf61e73a8af0-1b212d5b270mr1368766637.10.1716519120296;
        Thu, 23 May 2024 19:52:00 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:d675:a2eb:1b98:4f95])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c96ccfasm2922655ad.147.2024.05.23.19.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 19:51:59 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] python3-rpds-py: upgrade 0.18.0 -> 0.18.1
Date: Thu, 23 May 2024 19:51:38 -0700
Message-ID: <20240524025137.1601126-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 02:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199823

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/crate-py/rpds/compare/v0.18.0...v0.18.1

* Refresh -crates.inc

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-rpds-py-crates.inc         | 26 ++++++++++---------
 ...py_0.18.0.bb => python3-rpds-py_0.18.1.bb} |  2 +-
 2 files changed, 15 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.18.0.bb => python3-rpds-py_0.18.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index b9048bde51a..3551bdb5f7f 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -2,7 +2,7 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/archery/1.1.0 \
+    crate://crates.io/archery/1.2.0 \
     crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/cfg-if/1.0.0 \
@@ -14,12 +14,13 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.18.0 \
     crate://crates.io/parking_lot/0.12.1 \
     crate://crates.io/parking_lot_core/0.9.8 \
+    crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.66 \
-    crate://crates.io/pyo3/0.20.2 \
-    crate://crates.io/pyo3-build-config/0.20.2 \
-    crate://crates.io/pyo3-ffi/0.20.2 \
-    crate://crates.io/pyo3-macros/0.20.2 \
-    crate://crates.io/pyo3-macros-backend/0.20.2 \
+    crate://crates.io/pyo3/0.20.3 \
+    crate://crates.io/pyo3-build-config/0.20.3 \
+    crate://crates.io/pyo3-ffi/0.20.3 \
+    crate://crates.io/pyo3-macros/0.20.3 \
+    crate://crates.io/pyo3-macros-backend/0.20.3 \
     crate://crates.io/quote/1.0.31 \
     crate://crates.io/redox_syscall/0.3.5 \
     crate://crates.io/rpds/1.1.0 \
@@ -41,7 +42,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.48.0 \
 "
 
-SRC_URI[archery-1.1.0.sha256sum] = "487955f60962765486ce000015a3492ca45c34a2ebbf12bc0aa2b5110ca6e7d2"
+SRC_URI[archery-1.2.0.sha256sum] = "8967cd1cc9e9e1954f644e14fbd6042fe9a37da96c52a67e44a2ac18261f8561"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
@@ -53,12 +54,13 @@ SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff
 SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
 SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
 SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
-SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
-SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
-SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
-SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
-SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
+SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
 SRC_URI[quote-1.0.31.sha256sum] = "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
 SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
index cece2cb8ccd..c6e88d88d76 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "42821446ee7a76f5d9f71f9e33a4fb2ffd724bb3e7f93386150b61a43115788d"
+SRC_URI[sha256sum] = "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
 
 require ${BPN}-crates.inc
 
-- 
2.45.1


