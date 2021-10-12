Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432ACC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Oct 2021 02:09:12 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.8008.1634004551432756595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BxKmj46a;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id y1so12456399plk.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uv4C4JZsGseZtKQKe52bMNIz5eXejyCUucoz4Lsb5+g=;
        b=BxKmj46aD5hKmmRjM8kHxVYJZTuEYuqx+LcwJIA9pRHTwNd9N0EkCv9MZlXyLT7X18
         ewJ37jNudW5PDZ87rhIdoCUp+HbemlDS6VtMBWpkbJ3eD8PEMHtbl7faUMdGYxf1fG7T
         R7EMWWqgi0zL3SgkhN26DrJYG3OV6+/58dTr3kxDUHt7X7mNKEayvpEgCjK+6mzlP+Uv
         bW7CHh6Wduatl5jLSSOR0JCB+7uNy5c+7vHrcQezGBfw7YlpsyTFLzvv5yu9hZYzBCpH
         Gpfaeri3cjVFI0CbzWL9CJ1vfoPj1fn7FFhwYUEfPl3fFcOmqw0GWTR2bkmPJc0hhCl0
         dgfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uv4C4JZsGseZtKQKe52bMNIz5eXejyCUucoz4Lsb5+g=;
        b=5DHxGgn5IBPIA30zaTgNUb9RhBWwKwR9DMqOqakZc9o/tW/+qK2k8E02CPxutcmojJ
         rpsy1ywj+LYC//ltFZa5aOJm9q3HFdXFbbjD7cdm+ngQOpNcW/MPHjnTMgkjdzKuT20W
         jory5cVCUqacKFkh5s1o9xt+CjDSx97g+3cjukxro1ElRcWTVy4rnPUTjiGcwOdkEVQQ
         pU8oa1bl7mMawNbOb3m490X+tiwFztXEup2jkRa7+WPVpIx9i0hoyxuuvDdcrvlgSrrD
         76Rtp4O02DergwJevUFTSQPiFlpIqCYx8s/gBklNwcRABOr3QbQ46IQcmy5TTUm+NulS
         togg==
X-Gm-Message-State: AOAM5334gpolClIycyz6oDGfooMjn1VBvX7Her2nJp/Fx/BUqrLBbawj
	5Hk57jzDGf5LZMKPVMDBFkVCDUBPZPf39g==
X-Google-Smtp-Source: 
 ABdhPJy3Y7pEL54GvFD/A3mXkOwrwQOX1Ihznltq1jzuf/ImZGyu6K2GRDfD2DUI3x4zLNJouzvd7A==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr2884652pjb.135.1634004550722;
        Mon, 11 Oct 2021 19:09:10 -0700 (PDT)
Received: from thetis.hsd1.or.comcast.net ([2601:1c0:6000:1830::17e1])
        by smtp.gmail.com with ESMTPSA id
 l207sm8949601pfd.199.2021.10.11.19.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 19:09:10 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH 5/7] libconvert-asn1-perl: upgrade 0.31 -> 0.33
Date: Tue, 12 Oct 2021 02:08:52 +0000
Message-Id: <20211012020854.2073998-5-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012020854.2073998-1-timothy.t.orling@intel.com>
References: <20211012020854.2073998-1-timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Oct 2021 02:09:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156856

0.33 -- Wed Sep 22 19:49:53 ADT 2021
  * Official CPAN release of 0.33

0.32 -- Tue Sep 21 18:45:20 ADT 2021
  * examples/x509decode: parameters are optional for AlgorithmIdentifier
    when using [ec]dsa algorithms
  * t/19issue14.t: issue with warnings
  * Fixes #44 Redundant argument in printf warning
  * examples/x509decode: fix prototype error
  * examples/ldap: fix asn1_dump not working

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...bconvert-asn1-perl_0.31.bb => libconvert-asn1-perl_0.33.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.31.bb => libconvert-asn1-perl_0.33.bb} (86%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
similarity index 86%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
index 1848ef67e10..4f5a78df142 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.33.bb
@@ -7,8 +7,7 @@ LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1e12b263a5042804bb1c59ddce899876"
-SRC_URI[sha256sum] = "6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb"
+SRC_URI[sha256sum] = "1fdf004520c79e3a244cf9688616293516c11793d746c761f367496eb3d06076"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
2.30.2


