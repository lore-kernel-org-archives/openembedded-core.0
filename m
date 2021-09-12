Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.17815.1631464055244045742
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 09:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ioq3ogzE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id j16so6617387pfc.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ZSQhBAL28eeHSl6dtH+ccRmcpWNR5fQ/+Ucr0yZGyw=;
        b=ioq3ogzEZIoUoqebkbXDNUFJJII60+BNKfvsqTI3tjpcDhbOUa/rBiqx6n0gPPH+8b
         macigo7iSrl+08yJz9rfdoUIcxYuxM8zXGFHiXua6mbZZMg1wXTgM6ZTiL/DAmAhkbKg
         2Q9sniK1HzdDZML/fRW14POUqM60eey3nAQb+0J8WOArlcolSvsaF+U1xnO1RDFPfqb4
         jlG71IiC+4Y//TxqJGq1wjvTbN6O3saaTzMigomPoU8Tce+HQ8u5pLR+EfM0EFdh65yL
         +cXEteTY2Qes3jGlS7IcZ1Y+iJzluozeLnC+/VKoIYPk9LpuuEzZu68cn68esQevinI1
         Xfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9ZSQhBAL28eeHSl6dtH+ccRmcpWNR5fQ/+Ucr0yZGyw=;
        b=1ND/QRilVEZ7cU4Iy/VrllOtH3D5pNpvSZ4jX23BiN6wDDeu35RNzngX0fgxDy4K+W
         tcq4MQPyjOmH0bfmJ7rFd+wLbGHdmLdL/6Lq2F4BVNEDWoxqVtI/PaDYq+6goEx4H31J
         kEIPbf2zx1kSXCwfadlQFOTvas9sNozOkVh/9MPDihBWOhEsKzH5JXjcKufxlxyzFbaT
         wVtzkwLBh8YNF/LxzdIGamMTFSTPct11odY6BMaW8VrzE9J88dBgsevj/qtaKcl2ye07
         DbpY10dNzZp1lB/HbIPk35wk7M49y0efWqnzswIEDMGnwRdD+igBq5H0gqd78E7YyiIy
         2fYw==
X-Gm-Message-State: AOAM533gx4FE4sTzAG4xbJMGd5b7YUsCF69i1TbAZyo9RD1e5hmx0uT6
	jXK7WInT/A8K/Rhnm8B3CIvX8VVAimM=
X-Google-Smtp-Source: ABdhPJxvFHKxJD60/rlaQ1YbL9Uv6aJJQl9b8xD2pOPn2b0zQsZ4Xbt1nEtl5fZ0YnoAaU2XYF5Hkw==
X-Received: by 2002:a05:6a00:21c7:b0:412:bb0b:850d with SMTP id t7-20020a056a0021c700b00412bb0b850dmr7306783pfj.33.1631464054411;
        Sun, 12 Sep 2021 09:27:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:b27c:7a4e:d59f:d7eb])
        by smtp.gmail.com with ESMTPSA id f2sm5140531pga.60.2021.09.12.09.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 09:27:33 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [master][honister][hardknott][dunfell][PATCH] tar: ignore node-tar CVEs
Date: Sun, 12 Sep 2021 09:27:32 -0700
Message-Id: <20210912162732.1573351-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These three CVEs are specific to the Node package node-tar.

exclude: CVE-2021-37701 CVE-2021-37712 CVE-2021-37713

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/tar/tar_1.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index a6a417a1a5..3488a6c955 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -65,3 +65,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 # These are both specific to the NPM package node-tar
 CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
+CVE_CHECK_WHITELIST += "CVE-2021-37701 CVE-2021-37712 CVE-2021-37713"
-- 
2.25.1

