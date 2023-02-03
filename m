Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59EB7C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:50:51 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.17945.1675446650640375787
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:50:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kHAUbm4u;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id e6so5969628plg.12
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Vpjxek9ql+/NH9NU87iup1Mrujxf3iFV/yxdHERdaA=;
        b=kHAUbm4uZhgd7EKBBlwkjQKKZLqwLmECyrbqK9C5PvgdDlD+eM2eOVrPApQkKpm9T0
         egB0ejVQc923vZnLndsHgi7BIISuBS8n//O51OcrQsbYnkPq7EhFwwDobEgnwmh7CJqk
         lZvj1gS20Q+/K7qvjHo0D1wwVxBS4MipTsHFZef4fKrBq0hcpRCEJ7bSmTRv8xJT4a/5
         YVvKcuXcMkQIIGxcT4+hZ954qk9pxhto8WmLL9ZCc8pFLipF0r9IYbHvUYY7kbpoBzHP
         e9YC9h9M7lrvu9HceYJY9UgtEnwQEV9QYtgRrFkwqUZLdAOLT2rAtB63z06x+gSul9Qr
         u7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Vpjxek9ql+/NH9NU87iup1Mrujxf3iFV/yxdHERdaA=;
        b=Kd34wFCzWZidHdndbUOnjYw3P6eyhTK4Rn2aUXgigQtcPF2EVW1VjaoSfQfhbK+ue8
         EzB9rknhMNOxC1ZKReE3ZZQp77g630zFepBBNPEAoxw2b477qfo65mWvuxx1ssirRhAF
         SKDgHd1nrT1wTWsVCEM2LAvfCKS8wi4W/bYlYGZCGit3RBV1KcnIwuxOvpzOineGBcSP
         JqzjQ8GkWu1CowKmuebRQ5zTF41XRkqNRkFXbB8nZDznlBzjY9OFoIz3/LKxxzzNATnU
         pGsvX155i8KOtZGbQPKsw7JhE+epeF1i7SVeysKH9vYs6Af5KocVbYBpgiqn1FSWLwUS
         GzUQ==
X-Gm-Message-State: AO0yUKXcw5nQvn3gDbYjnJNrOsCbI/lk3ae9CikDBvLHSRSHRESoVJxg
	tYhBlBKjt/o0X36daQVrycJKkpe1d1w=
X-Google-Smtp-Source: AK7set92tr+htdVSrib4D8ssm3ZwXPyijXzni3t6G54Q2c1ZNiNu5Oh5DmMLOeumIRt+FIbABB5Zkw==
X-Received: by 2002:a05:6a20:1455:b0:be:d4d:81bb with SMTP id a21-20020a056a20145500b000be0d4d81bbmr6303318pzi.53.1675446649691;
        Fri, 03 Feb 2023 09:50:49 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.50.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:50:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/14] libtest-needs-perl: upgrade 0.002009 -> 0.002010
Date: Fri,  3 Feb 2023 09:50:22 -0800
Message-Id: <dbf52c87f469dda8625e1993915eec586dbb4ef2.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176735

0.002010 - 2023-01-22
  - split main test into three separate scripts
  - avoid outputting multiple plans if used with no_plan

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...t-needs-perl_0.002009.bb => libtest-needs-perl_0.002010.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{libtest-needs-perl_0.002009.bb => libtest-needs-perl_0.002010.bb} (86%)

diff --git a/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb b/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
similarity index 86%
rename from meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
rename to meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
index 43a9a6b7d32..79a06170e02 100644
--- a/meta/recipes-devtools/perl/libtest-needs-perl_0.002009.bb
+++ b/meta/recipes-devtools/perl/libtest-needs-perl_0.002010.bb
@@ -17,8 +17,7 @@ DEPENDS += "perl"
 
 SRC_URI = "https://cpan.metacpan.org/authors/id/H/HA/${CPAN_AUTHOR}/${CPAN_NAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "5643cd323afb77d20363acbaf9b12bcc"
-SRC_URI[sha256sum] = "571c21193ad16195df58b06b268798796a391b398c443271721d2cc0fb7c4ac3"
+SRC_URI[sha256sum] = "923ffdc78fcba96609753e4bae26b0ba0186893de4a63cd5236e012c7c90e208"
 
 S = "${WORKDIR}/${CPAN_NAME}-${PV}"
 
-- 
2.30.2


