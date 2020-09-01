Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.8668.1599000771738266134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2020 15:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kdp2unNv;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id d26so3980152ejr.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Sep 2020 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xfbvTCZc61VvYuJJW1Ye+fNXRFjiwXxTCRwD3JA3qIs=;
        b=Kdp2unNvgbhNfsQfdfHseLV/MBZPFN2KzK5LkUmlz0tLxpjvyg4tS7j+//OJyC+pCf
         LZJx1u1b6JfztCEAF14wldCZim9pz1QuhiaYIAxjMeLwI8r+eDmvQWUww77wvGjDWCy7
         h4wF8hh5MJYGQB9lcXKAs3E5m8rOeQhNdhv/iL1lSQpAbCs+OQV3f5Pt76Dcl27zeKCP
         5McuY8N2/ti+Yr68NN5g/ji7CswoAkcFnSB4teSEPfGcR1lPYSZgccdGPROvCDKnXyAL
         2eRmZi0Rcb64U2rSX0yibkqEqB1vtXsbUG6ALcYi8pFOM/Nf36zBlDc5GDcg+tksJdh5
         m9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xfbvTCZc61VvYuJJW1Ye+fNXRFjiwXxTCRwD3JA3qIs=;
        b=bA+LofkxW0i/fpougkd1FVg5VlaIM68fXGEVK7aoHmYxZttfKtuQKHVBWC6ywr2Xg4
         5FKLFc1/I6tKVFAlyUP0zg/98ak15lU3bzLCcn72gY8O52jQ7ugVkX0Z8UhbwytiEhO7
         MysZygXxocbVSNV2RjxXfF69NJby9L6HexapAqBS9vdVqyhhLG6momViXE4iYK3d+z8R
         erWUs+MPMLZyUg2jZB9Y39ihKXTjl6a2RdR2jyWeiLbYjnXvhDQmSdXndkyR9UovXwZ9
         NOrajZ0pxpqqnKXGGXqG4IR53SurDdFeIyqbFTUBFT+PDLKV0lkmU+GvXRjmCpsBxAQM
         ccvA==
X-Gm-Message-State: AOAM530Z1sgTfFhH/7lTIQYuDeDdtSMONq7ecYZqtuhkqd0d4mW2A9YS
	qKSOetWUksDNLC6rQUwEedCjVqsTVcg=
X-Google-Smtp-Source: ABdhPJx7STFLOogsy30+DufxQ9Y0g/mLrRNdjaPKb0ctkYAj7ySe5pseOayBVy8aJkI2E81N1vTplg==
X-Received: by 2002:a17:906:874f:: with SMTP id hj15mr3821329ejb.539.1599000769972;
        Tue, 01 Sep 2020 15:52:49 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:b114:707f:d9f1:179])
        by smtp.gmail.com with ESMTPSA id v5sm2417333ejv.114.2020.09.01.15.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 15:52:49 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH v2 3/3] packagegroup-core-full-cmdline: remove iputils
Date: Wed,  2 Sep 2020 00:53:24 +0200
Message-Id: <20200901225324.17870-3-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200901225324.17870-1-changhyeok.bae@gmail.com>
References: <20200901225324.17870-1-changhyeok.bae@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iputils package doesn't have anything.

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../packagegroups/packagegroup-core-full-cmdline.bb              | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 16c2f9f2aa..f38577b043 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -101,7 +101,6 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
 
 RDEPENDS_packagegroup-core-full-cmdline-extended = "\
     iproute2 \
-    iputils \
     iptables \
     module-init-tools \
     openssl \
-- 
2.23.0

