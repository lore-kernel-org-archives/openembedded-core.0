Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E53ACCA485
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:29 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web12.4026.1657773387265456261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c4MHIU9p;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id q82so494286pgq.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NOtq/gM/h21Kde6fhezNbdJviAcdFcVnA40YhW4vz6o=;
        b=c4MHIU9paLzC31kQxYVI1W8OvS1MW9x5B1fPEnUe9p6JQSruwY/5IEMYsllnTpUxWD
         oPcnt/ieg0y3JzekWrxzjEH+9Kyb7LyGDuS7G7xICaStgBS6q23s2PnttqTe3+/CwUep
         u6oWKR0O1jMmjXD8kEzhDE/ldMsUqyun6IY81Se5DE8vLYs3TyuamP1H+BSWhRO/LF7T
         v8/NCNZlv+7g6X5a6/Rj1D/sCQo8ij4cpMkPnF098w+zZX9tAjEXxxqJTr9ZGcDR34mV
         Y4w0dWLNAgtOFupa1QZoOXUGQBDHOCdiyDicqCH7mknt1r5/u2ZeY73E/J1ZNXNdT3wz
         QrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NOtq/gM/h21Kde6fhezNbdJviAcdFcVnA40YhW4vz6o=;
        b=DlwUod9K30qnk6PwZfihZTCZOHGxQ0AdcD2kzgdcfgVRQH1HpuERkcOmYlVEPB+tFZ
         3HgYy8V36nFFZ5vscIKu92+1ry+i97wl1KDq/wY4ZEUptBwAkozLSxiyb+1I64ulZ5FX
         ZW+pCPbvTJ1wC0A87oQGpfHE3bblsejqMM4CktVuOf5RRH+hoEksT+WdnUFCPnk6tQ6q
         HqZiFG75m8xZI05zoWZLHrYd84PrbrF6Qr/M02+DaoGdtURq1YDqCg2YDy5dc59jcOgY
         peAuAmb+pYSFAV+f6JFzWy2jo/Iwswd6EJ7BQzXqjQzG9OOZrYEaUPFvfYpSjKIUBJMZ
         S+IQ==
X-Gm-Message-State: AJIora+Qh/CUxRVOLPa6z3k2yRVeSxEsQQvceh4zp8YEokotUu7eW3gF
	8Su5nK010/yKW2d+5Xw8k2wtfGccYY+E5Y2v
X-Google-Smtp-Source: 
 AGRyM1sSGE5DfOwa5utZumXql1oHGnbLKD0n3Vb3RCyGLY9X5cgjWJ0me4l0rPkz8M/pZLVmBi5MFQ==
X-Received: by 2002:aa7:8d54:0:b0:52a:c718:ff1 with SMTP id
 s20-20020aa78d54000000b0052ac7180ff1mr6369028pfe.29.1657773385959;
        Wed, 13 Jul 2022 21:36:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/27] vim: upgrade to 9.0.0021
Date: Wed, 13 Jul 2022 18:35:28 -1000
Message-Id: 
 <640ccea3110408985ef5cf76fbe8dc9f4c3fd22c.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168005

From: Ross Burton <ross.burton@arm.com>

This fixes the following CVEs:
- CVE-2022-2257
- CVE-2022-2264
- CVE-2022-2284
- CVE-2022-2285
- CVE-2022-2286
- CVE-2022-2287

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03c044a81a76b7505b9d5bf0d936dde75b51905e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b85f34d6c8..7e2c624bc1 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".0005"
-SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
+PV .= ".0021"
+SRCREV = "5e59ea54c0c37c2f84770f068d95280069828774"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


