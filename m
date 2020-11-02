Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web11.1200.1604335765757729451
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dnt7yGlM;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id k9so15051897edo.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RtvyO3NZFNa3TMKL6ZJWAzUbB5SplRdFWcwJK5u07Ds=;
        b=Dnt7yGlMk0qD1F1NqzFKP6RotpvtQXkYNN6fO/M10k9h3WVTIcpzAMqQHEZaY/kxvI
         aezqKAZNEFz4Q1vH51r+8WmNaVVQmqEtwnA+dU0kULsC3LvnkcAADKKYYCT6IBfmWuyE
         sIAAVPfLipBhVTQA89Hss50SOMpsPx4njxzHPhKNs/PQc02CjhSqu558TPfwJ2UWNbOK
         VRvMbm1RdI9f8iWIrvn5BAuPw4bii+iNyvN+dIY5EGJcDucGLaH/Umfkc1nuG0HWjMn+
         BuKdaM4FX9ZaCq9N584dhbz4repqdn6SGm80MDjnf+qlCaZhG2ViYruIDfuChKl7fB+Y
         6UFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RtvyO3NZFNa3TMKL6ZJWAzUbB5SplRdFWcwJK5u07Ds=;
        b=R8mP62yvh6OLSfLa0tey5BMRVr1TbCK/otUq7SCIqP4hB7vEclChQhnG2Ecs+dFU0P
         hAmFrambRYSoQJDvf5KNwaP3kTuzkYV2zbQj9tvPACZHyTBmOEUJQF1cUfyHQjqabWs8
         9kM7BCK1cTT30lRThHzLieF4wb04UqteJ1beHkHhcrS73w78N1ekl+uMCheALiTe7eB4
         10MCOER5HHa41mFYV10bgq3ITtNFf+raVDrSEj7Q/v3JjifJZQcaObi06moX0b1JIjcl
         3g+5Zoty7Gc/A1bX9Af3N3fIx0+1RFNsu9UPzEvsp4dW0+SMcuXqW5/dDnFWwxAyv3R2
         oNoA==
X-Gm-Message-State: AOAM533AtO14nCiQovyIpf+ayNhmHYOJ+cLX6JO5NGlrfa+nYwNK4lwX
	bJODEXTE5FqWaUTB3Hgk9ocwTBj22fsLcw==
X-Google-Smtp-Source: ABdhPJzdImDj5oDt1Ape3DvWb5/doMqnuhrqhPE+qLR5898ihDMRKwDRtz72MCTVeUGl7/yMmn1z+g==
X-Received: by 2002:aa7:c6c5:: with SMTP id b5mr18208147eds.259.1604335764050;
        Mon, 02 Nov 2020 08:49:24 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:23 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/80] vulkan: update 1.2.135 -> 1.2.154
Date: Mon,  2 Nov 2020 17:47:54 +0100
Message-Id: <20201102164907.27572-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.154.0.bb} | 3 +--
 ...{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.154.1.bb} | 4 ++--
 .../{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.154.0.bb}  | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.2.135.0.bb => vulkan-headers_1.2.154.0.bb} (77%)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.135.0.bb => vulkan-loader_1.2.154.1.bb} (95%)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.2.135.0.bb => vulkan-tools_1.2.154.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
similarity index 77%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
index d21c3d62b9..0e4d260960 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.154.0.bb
@@ -5,10 +5,9 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-# was sdk-1.2.135 branch but it was removed upstream, commit is in master branch though
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master"
 
-SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
+SRCREV = "7f9879b1b1fab53f719a9ed5e6e29533b10972b2"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
index 8bab58f0b9..23bf59f8a6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.154.1.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.135"
-SRCREV = "86429d9e7f3542e88fb98ffa7d8a82c10c9828ac"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.2.154"
+SRCREV = "2aa801755eab3fab610d9676c4dd94054e30c854"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
index 085c0e27e9..0fc3494eea 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.2.135.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.2.154.0.bb
@@ -5,8 +5,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.135"
-SRCREV = "6d8197fd6c91d352a601587ffdde28f4cd7bc399"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.2.154"
+SRCREV = "10d757bb1072416ddfbe4c24b43d4cd2f808a5c7"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.0

