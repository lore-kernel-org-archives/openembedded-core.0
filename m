Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D56CC38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:29:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.730.1662604175838809041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rfZjmckq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id x1so12080123plv.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=trsyN7hGD3fEyGreyItTxPZCQKNgWP702WHxPaxcAMY=;
        b=rfZjmckqmqLYC6cbGnz1uacNcDfaHpPh5hSFON/YwBU5pIOtAog4G/cGY2YwBTnuKm
         EZq950AoCpUMVaUcRIUV7vVwL3QWszt8GubNXC8Bar4bw4kssT3GiZmBnvMfNo19SktA
         nxC4PZMewxcUPYTqrU8K++804ikBRSvZVwAIGWG6cp7YHcbO+JdBcoJAV9Gmct1u4RBG
         sogegxGoWaplIJAS54woaSKilcPiQ3kIA6+fOWs8PGsIaj+S3QIuSlUXAg8cuqxdbc43
         QImj/zD23blAD/IPXuG4aLUjggfpAFBOx9KMvuAotTRfOP/pMncmo4hdEjMTBDZ4mqk/
         pTVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=trsyN7hGD3fEyGreyItTxPZCQKNgWP702WHxPaxcAMY=;
        b=0phHv2t25FRIzA1O+INKXHwZ+nggsA5VRYTl5bKRBz2+fTFqZhJcZrtStdhnkJ8cb0
         H2YNNxgLOoeO5LGCp8LTyGBmTlNWAw1JR5lV0I3/LOBTMvfYa1NiHrcZwKMldqp2jJNy
         FGskBpr6KB2LLCvRGOliPu3UsZQfgVbJdjb+8JsPIA9KVq61/39BzSv+aFZ73FjKxdFt
         74kCMyH97PctsJmpuPmxKYSoIUF/dFBfSWJv5oPSAe31MD1AKtwL14wvDTO39NYFPWIJ
         j0fUBpZCQB4uI8MG/kJN7ONuUquLQM3NDFQm+gz5Eh1sZtdlROTiFSX+rzCw8mo9cOAB
         6K2A==
X-Gm-Message-State: ACgBeo100Nk4ODrUqaUomZ8K7xswe9vE+MGecA3kB8W7tSGAuyp38YbI
	5Z6uZeSjXiigHaaOk1+0qLRbvOaq1buu5dOK
X-Google-Smtp-Source: 
 AA6agR415TBeCHt/CUredb5eOZstv+dxwk0tdVB0qWZuDrqlnhKZ8xaC/++Rf0zd0LJfl5Nv3axLrQ==
X-Received: by 2002:a17:902:ea0c:b0:176:75a2:625d with SMTP id
 s12-20020a170902ea0c00b0017675a2625dmr6870128plg.21.1662604174977;
        Wed, 07 Sep 2022 19:29:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.29.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:29:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] vim: Upgrade 9.0.0242 -> 9.0.0341
Date: Wed,  7 Sep 2022 16:28:32 -1000
Message-Id: 
 <c9a9d5a1f7fbe88422ccee542a89afbc4c5336e4.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:29:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170446

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Addresses CVE-2022-2980, CVE-2022-2946 and CVE-2022-2982.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 01c08d47ecfcc7aefacc8280e0055c75b13795b2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8f89699560..d885847fb1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0242"
-SRCREV = "171c683237149262665135c7d5841a89bb156f53"
+PV .= ".0341"
+SRCREV = "92a3d20682d46359bb50a452b4f831659e799155"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


