Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36F28C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:59:03 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web08.33517.1635699542437136124
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IpayzcJY;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id r28so15137091pga.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S3MDC9F3W7l2pRkYLRwexQJQFzLhfdnKk3+05uXpuCM=;
        b=IpayzcJYGBqYO2W2iFqEMv1BXkHQPeur9Z8SVNOXyyZnMEUSxVBHuuxlgzVf6UWEXB
         DRiE557vCHAWRWqo21VFlRH9Q5XecxwmIS1H+yX9DZKs+7JFau5beGGbO8B/O+9qQxh8
         SSmEQjsHkOfauJoHm8L9f2PZiGeR090HSXRuTnb5vWdsHzX+RcMJMtujufgt+bneBT3H
         ZG5jKsppDCYUmADOBp3smrLcCofdPLOZ9PXVdOT1Mf2qVfbImk9AapgPbhhX1d8K/yc2
         e2Hid1eURkM30RYlNbASfleqqbEkvtk1Y4jMEqpF27AxPWuQA6m5T461yZ0re1ftf684
         vG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S3MDC9F3W7l2pRkYLRwexQJQFzLhfdnKk3+05uXpuCM=;
        b=sv2I/Eq2glx6ztH0mmz5HdmLGJsHJvcx3nxuBUDp6KB2j6ktvXgyj2Txq8MiEXknZz
         9QRn8b3bnkVuuA3GyNymsciYMbxNl8koYNJ+4YInhTVLcReROPExWrD/MmX3czfBsg33
         ozB1XYRLCKv5okUX1eHhEyyCGYLP5R20xsiWoRR7q55ZBYo0T05KOAY7Q80c0Wc+PusH
         oDfxY4JeCtI3przAy0X301qxecy0Ytg0bFYwuLnyDlRq/9s38NQeGaYs+Ts3n/PpFXlp
         EbNgliVSBCG8rJGsDAxEY02P7yYvh1EyXx/xaxH22d1dA/C/dunS+FN/VmDE7IY0DoaP
         9wJQ==
X-Gm-Message-State: AOAM533/22/ZBLJPwNXSu6poyloyo9TYP/vcVqdmYMDh3hwKmnWmKMxA
	CJjWy1oTrzCJzeRn8SmWB5XyKanYHY4s4gbg5FE=
X-Google-Smtp-Source: 
 ABdhPJw1YxfIlHF+pADyn9cc0riiQj2ltPNvOu8E48adhhgipCeVlJvqbeK7xS3nBFUs398hoT8yXQ==
X-Received: by 2002:a63:3d4a:: with SMTP id
 k71mr18053424pga.276.1635699541599;
        Sun, 31 Oct 2021 09:59:01 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.59.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:59:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 29/29] tzdata: update 2021d -> 2021e
Date: Sun, 31 Oct 2021 06:57:48 -1000
Message-Id: 
 <ca54b495586047c3f2a387c16a169913034008cd.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:59:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157687

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 660f932c21fed410ad092ec610749e7090b6a324)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 5c19e9a7f4..e9eb249afe 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021d"
+PV = "2021e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "ed0d02be79b54f4449ba1f239aeaf9315da490bf32f401d302dcbba4921f591d"
-SRC_URI[tzdata.sha256sum] = "d7c188a2b33d4a3c25ee4a9fdc68c1ff462bfdb302cf41343d84ca5942dbddf6"
+SRC_URI[tzcode.sha256sum] = "584666393a5424d13d27ec01183da17703273664742e049d4f62f62dab631775"
+SRC_URI[tzdata.sha256sum] = "07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1"
 
-- 
2.25.1


