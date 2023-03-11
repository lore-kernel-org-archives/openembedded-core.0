Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04519C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Mar 2023 22:42:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.55945.1678574520266846384
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Mar 2023 14:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aS4c7C1G;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id j3so5630309wms.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 14:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678574518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EtPldRtReupVv2Lpq23wF+tQDxiMdBhaxLJswll+Fk4=;
        b=aS4c7C1GlDIv0hivtVwSkZW91BpUTce1Au5lcCxVuMPsHbksCbir/XLNBAEEdpGBzv
         MQ+AN0CHK5GPbjKPlyn4TG3IjjLGYFzKxJP5O5+Ut9r/MtZX8EEaPN/Ftj0zToM9WD2g
         f+P3H7F5p202voWUcPxFCe4e/q6wSx+1+1Uhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678574518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtPldRtReupVv2Lpq23wF+tQDxiMdBhaxLJswll+Fk4=;
        b=ZIcSkkskvrXOQD4UbDTMf4GqE5mDiEvXu7JOE6D8CVe/sjgHN0/0t0XHTN8E4jYolE
         eZ9DtoMKQQkoIpz1KVdn80LxFBjS5gJVVgih+jGEI5AF/UhPgH8Wg/DZzRfeXLy7ysgv
         ecxnS6bk/ht492QDrfW4AmyZ9PnLTo5NBhXMOXQYvSJc7QqsS4wtCoZK68mbwg23dbJn
         FahkyBdMsQIHcrd+Maxyt5aIt4J1MXTe376upnc531Tq6x8MyLojwPRVEL3Ev0655lvz
         dtBIDYoyg/xONgkKYj4USWFaHTrbr8kWlBoyHYK7BisVGF0Ix9hUYcWJzU5IYzYH1xhs
         Nw3Q==
X-Gm-Message-State: AO0yUKWVVmLVet4TdEWSpFRify1VySYBI2MU0pbgxs1ZHX+aM2nYNkeL
	lugtslQ5MAD87dzdCnleqH0xhUhhmL80j6Xnnt0=
X-Google-Smtp-Source: AK7set9963CFi0hdrYP8LZAoPnk7LUnLEAnK+za0Xdc6P3qAdcnq/HmsIqk8Iq2sFXGt3CbqS3V2ig==
X-Received: by 2002:a05:600c:4752:b0:3ea:e834:d0d1 with SMTP id w18-20020a05600c475200b003eae834d0d1mr6429000wmo.36.1678574518498;
        Sat, 11 Mar 2023 14:41:58 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9dd5:bdbf:ef9d:c118])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003dc5b59ed7asm3933164wmz.11.2023.03.11.14.41.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 14:41:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] libxml-perl: Add missing perl module ptest dependencies
Date: Sat, 11 Mar 2023 22:41:51 +0000
Message-Id: <20230311224155.3442306-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
References: <20230311224155.3442306-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Mar 2023 22:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178370

Add dependencies on missing perl modules to fix execution in minimal images.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl/libxml-perl_0.08.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 323853cc2f3..1b03e63a824 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -27,4 +27,4 @@ do_compile() {
 }
 
 RDEPENDS:${PN} += "perl-module-carp perl-module-overload perl-module-universal perl-module-io-handle"
-RDEPENDS:${PN}-ptest += "libxml-parser-perl perl-module-file-glob"
+RDEPENDS:${PN}-ptest += "libxml-parser-perl perl-module-file-glob perl-module-cwd perl-module-constant"
-- 
2.38.1


