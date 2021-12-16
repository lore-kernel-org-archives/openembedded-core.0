Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD401C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 18:00:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.148.1639677649566240523
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 10:00:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HOYNy+iy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id u17so45682982wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 10:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKrMzt+OtVjTFGRh1MBIzH28DBAlrFmCbDB6mRg8GIM=;
        b=HOYNy+iymry+Ce7xd70A5e906SxUBjVjYTDQfV9DlW/eu8Ucyicfm2TOog+/gnHCr+
         rxjMvHC/YKwmXpswOR0m/ljSrTSSbXni2Atz3w2Z+1FnNMdINciRQMj+ihRKqp7qdHdF
         AqNoge/x7hFLf4gxyCj+JOfZimzk+dTVZXxLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SKrMzt+OtVjTFGRh1MBIzH28DBAlrFmCbDB6mRg8GIM=;
        b=hQmhozMxG6vXc2GU1Pi48tt2gfO+UEbkqJvCa4T5He+YRwv3ERpPtqZ4mWLfm4ABQE
         KwWDl9XfVJ7BXjDPYjNze9kkPUuxP+1hjYYsMffQwOiRFChLKyDov/xoASAEDQKERZ01
         dXa6DtZag269MEj+LNhtrYM8Kxw4EJDwVc30KC2+h8jeZEdTBv4vX9OKdfvZOlq8jI5z
         w991qAVLSEPARsfgyRVH+gIX3VT5og4rWL1occfzNWd2eLDrmmNaeEmA7WjoySOyRDU2
         SUAnsw3idplBc6450TITpfTns3OyYAHtJm+bEZ6YFrjDKzDDkEYBTjGBH/iIzqU9P8AQ
         AS0Q==
X-Gm-Message-State: AOAM532eTduOu1aniyXerCRgD5rwc6AS5PQG6mdZws+lMnL4vRoegkka
	wEyDAMyvbI0354GSvZ0bguLkZsnIDSXIbw==
X-Google-Smtp-Source: 
 ABdhPJylwHD37x14O19jyXxf8qdlVzD682c0xE/8TZKopNRwMZTFVlV3sgnfExu6/h3Mkf/4NDKUag==
X-Received: by 2002:adf:9f02:: with SMTP id l2mr6085984wrf.617.1639677647799;
        Thu, 16 Dec 2021 10:00:47 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7bea:ecb7:80b0:2828])
        by smtp.gmail.com with ESMTPSA id
 j85sm9523850wmj.3.2021.12.16.10.00.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 10:00:47 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-idna: Update license to Unicode-TOU
Date: Thu, 16 Dec 2021 18:00:46 +0000
Message-Id: <20211216180046.867666-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 18:00:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159802

The correct SPDX license for the test data contained in this code appears
to be Unicode-TOU. Update the LICENSE field to match and avoid package
QA warnings.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-idna_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
index a0e6b79a565..ee92f44fd58 100644
--- a/meta/recipes-devtools/python/python3-idna_3.3.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
-LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
+LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
 
 SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
-- 
2.32.0


