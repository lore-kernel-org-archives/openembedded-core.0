Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3235.1594933692509087469
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X7Pd8VmQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a6so8606912wrm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Lbb3c9YtN1xtgDuwFdo4gUbxUXRHpDY2vagvHlNVZc=;
        b=X7Pd8VmQNQe2LkecNSRE/IkwrTbsGT8Gy1IXCb8RcOf808F+OLV/42VQeWzelKsTnv
         ++deepM8ZSpbRlMr+gXNBon9PMgUeo3kDAtk8PDkoNshQOAqmcxCgEnf4OFqcbXMlgEE
         nLWGonU4vXu1dno4UweXiFVM98ulBw+prlBRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Lbb3c9YtN1xtgDuwFdo4gUbxUXRHpDY2vagvHlNVZc=;
        b=b6UR9owqs4ODEQYqLLguWRCHcn91Bv/zOzHMabFaRTN8sASecIuADQvOsmXPGfslOs
         EsWCq4uy2g59Pade+T2WPVVqfEJZIJBEb2eppPbbZdKQqQMG/01Dpgt/b7GEFx1cfUgL
         g3KyG4XxSKFzNV8bh9WRUFPTKc70nPM2p7nzNJ7qVTbP4COewxYUGitYWKhmFjsYCL/M
         U+COwmEJtnE7cszBNtFmUezKDyD7xFDZGU8M9YQt28jFlfPXxgk68m/tu8M5/UU1W9V6
         ZSd+bJj1EfGTtvGUNCf7dQPCsRG/EKXJzDHkfRMSTmoXJaOSO9hVZGXYXS0MYIdkGZYk
         QIFQ==
X-Gm-Message-State: AOAM531m4Gf9TtVJBqpaf5FrwWLNAhTZrtFVLJJRV7oiCRYCBDmgOlFE
	ONi6whmlT0wmOwAxMwNENvx+CS59cbX6sg==
X-Google-Smtp-Source: ABdhPJzAN77uoUCKhGld50lrSX2vbrcbvlHagASP9B6iede1itDpbXd2YlnlEp9yinJWg+RVp7duTA==
X-Received: by 2002:adf:8b50:: with SMTP id v16mr7119711wra.188.1594933690680;
        Thu, 16 Jul 2020 14:08:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:10 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/20] btrfs-tools: upgrade 5.6.1 -> 5.7
Date: Thu, 16 Jul 2020 22:07:50 +0100
Message-Id: <20200716210808.7438-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../btrfs-tools/{btrfs-tools_5.6.1.bb => btrfs-tools_5.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_5.6.1.bb => btrfs-tools_5.7.bb} (97%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
similarity index 97%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
index 29f14d90779..e61ea9bf89f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.6.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.7.bb
@@ -14,7 +14,7 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 DEPENDS_append_class-target = " udev"
 RDEPENDS_${PN} = "libgcc"
 
-SRCREV = "2a74d408f4b65d603e42f6e7b6b905ac81825fc9"
+SRCREV = "11acf45eea6dd81e891564967051e2bb10bd25f7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-- 
2.25.1

