Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304A0C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 23:03:29 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.4278.1651532603107347481
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=3+gjEerv;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so602705pjh.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 16:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ph4h93yco5nTOZoNgIN/oFnfNyqiMHzRE+weSH0Qnvs=;
        b=3+gjEerviWgEbJGCSrSjyi5M1N2zNiywAAKWzNFEAIRXNh9xqbjlf+eTKRZhOLe7yH
         muuls2FAbTFLGUObOcqxuIGGKirbu0tVKBfcFL52lr6tYI9ZnWXF202oFeMAAiwHvY9h
         KtzqqQzupEtInBnOEHRUE78KaK658ePMgr28973Qq2RyUtqcGqF0XiQNaRH43P2ou3ei
         QzTHtxAYxTAUh6EvgUsj8H7nEyQqg8rW7KhZc7CpDFhbPZUi5pHRvh7Es9yRgHGiH2dW
         bsZI+QEAOwvzRquXpojGSXgkpytJhDRdDYFdr5Qm3T88iZWlJfnuUfsCQB+CcAborzpj
         moXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ph4h93yco5nTOZoNgIN/oFnfNyqiMHzRE+weSH0Qnvs=;
        b=iLNVIXPIzMd798iSXDV6bCw+JcU4XK1Ne6TTqB68ROuZ7r+aIsN18MsRaOaYMtUXAQ
         dnVed9vTT5I4F4XT7gEYq/F7yb4+YGY0lnPoYaX0GaC8jsIkqx6qpZ2IsF4oQAq8pNc7
         OnC0UHgcO9gBpWY1xRKoAADsx48MFcoRPSEKEYKkoEea/t/3jK0u6F0PgdtMRDlC92mN
         FQ1Myi71RUXpFkJc6dhf1AIHxFf1VNOLkIZEMxuNJ9e7d+eKfO7cREVsQMKIg9WOSBeD
         vXdVSVQTy22PAWkpAc37K56xqHX41f0FRCwdQ6bjB4luT6tVFP24beB2sKYz9YnOJDLM
         ULOA==
X-Gm-Message-State: AOAM530Z/dHysLo+f5SYeHbTYhNXT88UoGWRXV5OWSKwzmzSlMDhtlpo
	oY3nobjD1nnnTiuCdcUBO6FJUUZcNrypwdIG/Tg=
X-Google-Smtp-Source: 
 ABdhPJzzVVwjaivgTc2CNDp8mg2tY+amwzR+zrIb7vfgqA1lRN/jC2SF/RcRF7WGBAzAABYJs4norA==
X-Received: by 2002:a17:90b:3442:b0:1d9:8af8:28ff with SMTP id
 lj2-20020a17090b344200b001d98af828ffmr1564223pjb.201.1651532602016;
        Mon, 02 May 2022 16:03:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a170902988700b0015eaa9aee50sm2002945plp.202.2022.05.02.16.03.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 16:03:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] base: Drop git intercept
Date: Mon,  2 May 2022 13:02:51 -1000
Message-Id: 
 <57d92ba2fbb657df611607e0eb38c005a219bea3.1651531749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651531749.git.steve@sakoman.com>
References: <cover.1651531749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 23:03:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165185

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We're going to use the environment approach for solving this issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0982977dc052ad4e65608f6853f930121d08837a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 398b098651..9ed736b0e1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -335,7 +335,6 @@ addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
-PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
 
 base_do_install() {
 	:
-- 
2.25.1


