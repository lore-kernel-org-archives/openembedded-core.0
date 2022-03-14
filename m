Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD97C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 22:49:10 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.3349.1647298149077521508
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PjT4sR+y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso426611wms.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 15:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bU/qR15oF5u98IgxxuwobtpggJCWeUd9QBrkf7mT7AI=;
        b=PjT4sR+yMpU+yx2nZXchPN4yGMsx4uEEvGlI4C1IDYKQEHSMuHiH0jYaQFWtBGGWzz
         HC9cYr3FtXFHVS0pkZ0gTqgmilfCLjkTcZMbp/LA3saWa1904oOQC74Pt8lg9asHOaE2
         k8g5bKr5HxN7b8A/KkOKfZULbLtOLw9M0u1TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bU/qR15oF5u98IgxxuwobtpggJCWeUd9QBrkf7mT7AI=;
        b=qS2r9XIG9yRpvok+EaMqK+DZsz7ks6TxD3dNR2TF5sTxfYE4v7C9Mm697Rjsw063cT
         K//yAIQ+9Azr+C89i2QniefkU/KCbGnN+xpVF3QJkXOqeKhxhPIjLfRTxKpCBvUhTOPs
         q1DzZ4f6JvTVXo+qxAGM7/oPRrzGVuehfq+3tN0GiCctSs0vfNpW4vGPN2W49yCn46OK
         sNfTLwWT8Qunu9LWgKbTE+T5KzxFfXx6+hyUU9caho8VpbmXq+JQsrhix2URTghdx0No
         TMVCZnQFc8eGT6SQ3uoeLY9oPkePBfiQjA0hdYtFGgaYf179MhBbl0skqTACvLKZkH5M
         z0pA==
X-Gm-Message-State: AOAM532zgvjddFSJWXC1SQmXa8O22oWCQYqb1Hdw/ur1d/KXxWrd0RB0
	xiXJizaDWe217CT5PrmzNvtosf5P8mqzvA8H
X-Google-Smtp-Source: 
 ABdhPJyT03xHalE6pWFNsVG9W8TWrAkOnjFO1XXm/duV4dFNKhR+oaOENYTte1Da/f2K0w8MTj2NFg==
X-Received: by 2002:a05:600c:4e94:b0:389:e8f5:642f with SMTP id
 f20-20020a05600c4e9400b00389e8f5642fmr992049wmq.96.1647298147424;
        Mon, 14 Mar 2022 15:49:07 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 bg18-20020a05600c3c9200b0037c2ef07493sm788599wmb.3.2022.03.14.15.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 15:49:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 28/33] ptest-packagelists: add python3-bcrypt and -pytz
Date: Mon, 14 Mar 2022 22:48:32 +0000
Message-Id: <20220314224837.834776-28-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
References: <20220314224837.834776-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 22:49:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163194

From: Tim Orling <ticotimo@gmail.com>

python3-bcrypt and python3-pytz both run in just a few seconds, so add
them to the fast list.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index af8a57bec4f..715a8f6f70b 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -49,12 +49,14 @@ PTESTS_FAST = "\
     pango-ptest \
     parted-ptest \
     python3-atomicwrites-ptest \
+    python3-bcrypt-ptest \
     python3-hypothesis-ptest \
     python3-jinja2-ptest \
     python3-jsonpointer-ptest \
     python3-markupsafe-ptest \
     python3-more-itertools-ptest \
     python3-pluggy-ptest \
+    python3-pytz-ptest \
     python3-wcwidth-ptest \
     python3-webcolors-ptest \
     qemu-ptest \
-- 
2.32.0


