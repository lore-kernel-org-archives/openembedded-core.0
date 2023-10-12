Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB136CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 06:05:49 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.5295.1697090740596772555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Oct 2023 23:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J7FYttcH;
 spf=pass (domain: mvista.com, ip: 209.85.167.178, mailfrom: sdoshi@mvista.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ae214a077cso404541b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Oct 2023 23:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697090739; x=1697695539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnCr4lD+FwvpNWEpUZqP7ad/1RWuiszw6QrtP8+zJrM=;
        b=J7FYttcH/mzgBH+ywD8lmc7gdKnXcWhUU6cuSusinVrYtSeUMMsGM8BtNhf+Uv2MWc
         UwdMAowDh5r225sL09xzF6kG7hbmj1HjjEIbZJ735xX8wJo+SF2nWNMNajPkH3hvwtHE
         2VeWnVEgt+DjkljDbGrLPDJ4WAiOnZEMGSxPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697090739; x=1697695539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnCr4lD+FwvpNWEpUZqP7ad/1RWuiszw6QrtP8+zJrM=;
        b=r4+ST9SyQkUtftkMfWySp+yfEezKfON8Qjw8qiZ0dqT4G3+FPYFIxNmfji+EzfRoTl
         dB89ns33RgXwB2KfMPyi0pPqHPNuehhKLfZfb90cXPJz4TALV7oWqyhmXlr/FyolU5nP
         EYUwQjFtVI2O01ySXV1jvjjpZGzUgcTIzSp6AfZUHECihMqXi4+lnKxU5WOHNmfSfmD1
         uPaHjKIidpIQWSW5v7mICVpnpOmJtNo+M+JTr3znObOgKKtW+fFVpbTxNtzH/yIN+HhW
         bLahIujGdB2eChCDCKNdip5Pe3uK+SWQbYHAttXUthN9HV8QsHT+UuzdKe2xocGFnuQe
         Ha2w==
X-Gm-Message-State: AOJu0YyfBJd27Rlb2G8C0N93PQdZz9LrxQyM2uycSJFwCTD3BjRVEJ13
	SYZ+v0egSeWmMxnLUThr87RGC7TRRjfGdD1s88A=
X-Google-Smtp-Source: AGHT+IFP3Xybb0R5KGzsGfWgns7YbyagcPEWU2wf13srqKbwRWolN33R5cmlykvI1IcNoxTZDPy5hg==
X-Received: by 2002:a05:6808:bcc:b0:3ab:8295:f2f1 with SMTP id o12-20020a0568080bcc00b003ab8295f2f1mr29103823oik.45.1697090739460;
        Wed, 11 Oct 2023 23:05:39 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([49.34.58.87])
        by smtp.gmail.com with ESMTPSA id i9-20020a636d09000000b00563590be25esm862775pgc.29.2023.10.11.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:05:39 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][mickledore][PATCH] vim: Upgrade 9.0.1894 -> 9.0.2009
Date: Thu, 12 Oct 2023 11:35:31 +0530
Message-Id: <20231012060531.12787-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 06:05:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188979

From: Siddharth Doshi <sdoshi@mvista.com>

This includes CVE fix for CVE-2023-5441.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f55f590e6..5e06866692 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1894"
-SRCREV = "e5f7cd0a60d0eeab84f7aeb35c13d3af7e50072e"
+PV .= ".2009"
+SRCREV = "54844857fd6933fa4f6678e47610c4b9c9f7a091"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.34.1


