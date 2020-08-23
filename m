Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.181962.1598214088713422587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gxbZfedl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id j25so106945ejk.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ff7/tfHuD/LN3I1nzDluCXz4mjNkAMZHeP8G2jb786A=;
        b=gxbZfedlHuGVb+6Enfu5h44uNHtCWOC60U0/nmsBe5aW0wuhgG1MB4wL7rruFoBNao
         dqhjhqm+K+ky+9WR2p6+zm58yveuYvzqXJToX+WvunJdtGNxABtl05Itq+mUOG+3I3S5
         5Wuy8Eh8G7ETHv33B77PP/weL7sBnvYw5y4OFunHOrxw4JnuQViqOAoPwaI6pdjcRaZf
         hh/2384rYt1VAD78+J3k+3gv8/RzQ+fJ3EAoX6Of9KjKl/ZYpnP3rTXbKX+5aYNv1BUP
         2smqwRPReRzSQu19L4lJ6+pra5f8K8npvRXAK2SxZKQh5arAgmSresjTEn63WzPjgMXb
         kcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ff7/tfHuD/LN3I1nzDluCXz4mjNkAMZHeP8G2jb786A=;
        b=ZYziGNvDpCwsMJEtbnp8VRphNkTqBEf2p0C549egDJCrCuAwOT0ENg54i34wmLxxjW
         z9zwhd/tVm67g/gsArlxIh9kR7eT++ZrrUEBVa53QaeqK+L4ZjK/BQUSHCX1fRGOuruq
         Muv5w93kiopiONXBKRsBkUP0FP+GHi3RZ+1MDrn5P3aSFGJeziLR9CJCMYuXHyr2jTKc
         h71zi4plG5GK4oXM/GO/ikCAdCa9q7BAPnanBTh8zDwwxmRic7QCHZMI/Fw44SpzEh+N
         oGZmeyW6vq0ZECE1wiK3CIRegxUQbD7kXK0vcMEk4ibrkFaP5CeEzXQ4kbEAXYktrHtN
         bGrQ==
X-Gm-Message-State: AOAM532w3TUCnC6MMUO/Ng9jbYVEvq5CfTMYTPyJS3B3PHwz4TzUAQhg
	mk1NsrMsxxkyZfgPu/2TDVwf7Gvm2M0=
X-Google-Smtp-Source: ABdhPJysFjqfLirCzN9A6n4cNF6L5WMVjiS+dCejoJ75cU3yKmanoOjQEWD3InADgxilF8JflHvWdQ==
X-Received: by 2002:a17:906:698:: with SMTP id u24mr2596866ejb.57.1598214086958;
        Sun, 23 Aug 2020 13:21:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 23/37] re2c: upgrade 2.0 -> 2.0.2
Date: Sun, 23 Aug 2020 22:20:17 +0200
Message-Id: <20200823202031.24686-23-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/re2c/{re2c_2.0.bb => re2c_2.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_2.0.bb => re2c_2.0.2.bb} (84%)

diff --git a/meta/recipes-support/re2c/re2c_2.0.bb b/meta/recipes-support/re2c/re2c_2.0.2.bb
similarity index 84%
rename from meta/recipes-support/re2c/re2c_2.0.bb
rename to meta/recipes-support/re2c/re2c_2.0.2.bb
index b73b024072..db26b02b84 100644
--- a/meta/recipes-support/re2c/re2c_2.0.bb
+++ b/meta/recipes-support/re2c/re2c_2.0.2.bb
@@ -6,7 +6,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "89a9d7ee14be10e3779ea7b2c8ea4a964afce6e76b8dbcd5479940681db46d20"
+SRC_URI[sha256sum] = "6cddbb558dbfd697a729cb4fd3f095524480283b89911ca5221835d8a67ae5e0"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

