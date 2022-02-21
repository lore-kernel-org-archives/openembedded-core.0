Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30273C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:46 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.4769.1645478685373180725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WCIGH8ap;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id v4so16352378pjh.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Q/+sRbp5Jd5d3N64AVCykOfAPlyxMrIh2P21lbDqUP4=;
        b=WCIGH8apV9I8G/8DOFMKdO511Oon9GRIo4NrDOt/0+cAVZU9sc5ntJLdKpPRzW/Yqk
         Hz4DkTnJqNi1Urkq7L/hWI4QE1/WmLSCg+HKGz6mS/2CZAifIhAx4m4VmwriQfgNxiGi
         i3Ib09nBpSkUzmoKYH9GSu6rJjM3lr7/133CpAr9TUhXzoCuv8A5xAVnKMbAN1Ock9NX
         RsnFaZKvB5XySCyZTCUozcDE5XL854NfM5VAB257C3/ZReKVnt82gj6xjWenPNAs38ut
         yjsFlWmnwJ9l5jjECe5bLsMNBl5UNl69ndkbRGJl3feKMOT2s3u+08nKD031m7/TC+vV
         9u6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q/+sRbp5Jd5d3N64AVCykOfAPlyxMrIh2P21lbDqUP4=;
        b=o8LVX7dqwNHGa0gVM0DkTIJd9YS6tptyZoK6GHQ3hirtWS7T0OU4bC7JTSWwB8z2pl
         Rg1PO6JS3hIjYH243sWco6LFizcnlAVDM8kPxh1FXKYORn1+P2VuJRGmAyFIsGYALgor
         ACW3ikQrFbFcoVathzHzhH/nLBVYDLQQfhxB4JtfJjl8jOmABC7l5q8DyRdTkkWrz43I
         KsOs0DaQIdN47q+B50hV2qKsox3Qjrn6ujMJtWMmDC+efWWdUw+d9Tl3yY6wxEB9wWtK
         LnXWd75y5NerD9DOVEjnmw/uCH7O9v2UvJJfttXKTvf9OC9rXPtJ9SeNvk1Y+SFTIMLx
         hldA==
X-Gm-Message-State: AOAM532dUQuajVoGQOHhzZB3Vb+L7YfpRGzmQ91bmtXh7lsAulgLCZeW
	Yr7R7dG/o9oG3Nc4EoCyNcTQCCiSWPDrZA==
X-Google-Smtp-Source: 
 ABdhPJy7nqkGno7GnNmMo5C9u8FwMsgId6KnrtCcoNrFTQlf+QpoPyMAWKSoRPCp8TzLNP/1pxxxrg==
X-Received: by 2002:a17:90b:1c8c:b0:1b8:5adb:fd84 with SMTP id
 oo12-20020a17090b1c8c00b001b85adbfd84mr823820pjb.238.1645478684478;
        Mon, 21 Feb 2022 13:24:44 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:43 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 26/32] asciidoc: set PIP_INSTALL_PACKAGE
Date: Mon, 21 Feb 2022 13:23:41 -0800
Message-Id: 
 <064ebbc36093344cd97bca2eb510631f49bb8620.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162102

This recipe does not inherit pypi and therefor we need to manually set
PIP_INSTALL_PACKAGE to reflect the wheel built by bdist_wheel.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
index 8de827f09e8..60640d7a0f8 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.1.1.bb
@@ -20,6 +20,7 @@ S = "${WORKDIR}/git"
 export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
 
 inherit setuptools3
+PIP_INSTALL_PACKAGE = "asciidoc"
 CLEANBROKEN = "1"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


