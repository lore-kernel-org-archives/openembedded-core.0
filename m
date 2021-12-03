Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D511AC433EF
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:22:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.15514.1638555745818391665
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=I+AVv42Q;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id i12so3655374pfd.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BFj/Fo3QQ9lSV8fr1Ki6jfue0YJi0KwaWWkmE0xUF7E=;
        b=I+AVv42Qfw5pePVjVppoaf6AV6SoIxjzl4RiRSrA6uyZpZH8mxsNM+0nLXlJdyCS6B
         +7RMzgPhteLsOj5Iv9wyifezn3HXOugypR2Fwdl8Ld4h0cYyhYtCF9ZR53XLAQdw5vI4
         frYsU8I9N3piHLPrmDWcdIcUDGb+pDNrBQG4Ozf2BwUXr/eIkfDrJuLXhYL+ds6cbnb3
         9voxaBDPG9UKmqVpUwEQ0d7KqoLtmfDlbZjcKASPukDVsKayrUsdXV618bo2OlD1d3gi
         5gZckWb2iiIsvi5Zo/O60lboAVBt7u3q4jnoExiq1Nzg8trv12AiTxeP/xtLGe2aTT5n
         WrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BFj/Fo3QQ9lSV8fr1Ki6jfue0YJi0KwaWWkmE0xUF7E=;
        b=ULgQRpaWC+NKKwv1joYoAcIAxhngkRyvd9/VdQl6FPqo/9/9IKL+U9cwNe8BORD63z
         pGBwza0oVvutQjR3TH8H/kuybdl6GPI87j5OheUSQUEBta7sMzp5xOEvzDBiun/6Qq1k
         rTVwHPC3cbxP+j0CIAXhdigVTbupyfubHigHk+V7ib+fB9jb5ahjTQVLYCdYHG2XLYiN
         vxIjWiO6nRsY+YF5jwTESbKyAgtGEkv5CyHY7hYH7HUJZhFm52x+RwBiOB0gqtq0+KQm
         O3rJK9rJ293p7nkmQXUfwNuBg3rjaIBc6BPDLeB5TY+QS4gRNqUhcHPilo/ALBfF1Miq
         4nkA==
X-Gm-Message-State: AOAM533odeF5Hv+MyPxiue2jGRxhq8W1Zm7j7vaeiP4f92ofRJaqeB1P
	FU1ycUfHLSUMFwh/3dDD3DY8klUMQKJVUF2ATvg=
X-Google-Smtp-Source: 
 ABdhPJwpZg8YI3dOIIsrIE4s6cq/VTKI/qr9nI/CMsdnnGXqxRK65nKtpYS2jqTOCXmI7zUsJj4JZw==
X-Received: by 2002:a05:6a00:2405:b0:4a8:3294:743e with SMTP id
 z5-20020a056a00240500b004a83294743emr20349567pfh.61.1638555744897;
        Fri, 03 Dec 2021 10:22:24 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.22.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:22:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 18/18] README.OE-Core.md: update URLs
Date: Fri,  3 Dec 2021 08:19:05 -1000
Message-Id: 
 <220e17952ac42a9be5a8c807a5507b04c86317d1.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:22:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159145

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

Update URLs to what they actually redirect to.

Cc: Quentin Schulz <foss+yocto@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec2131070cae6c3933e5b08986e8245fcd9deb99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 README.OE-Core | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/README.OE-Core b/README.OE-Core
index 521916cd4f..2f2127fb03 100644
--- a/README.OE-Core
+++ b/README.OE-Core
@@ -6,24 +6,24 @@ of OpenEmbedded. It is distro-less (can build a functional image with
 DISTRO = "nodistro") and contains only emulated machine support.
 
 For information about OpenEmbedded, see the OpenEmbedded website:
-    http://www.openembedded.org/
+    https://www.openembedded.org/
 
 The Yocto Project has extensive documentation about OE including a reference manual
 which can be found at:
-    http://yoctoproject.org/documentation
+    https://docs.yoctoproject.org/
 
 
 Contributing
 ------------
 
 Please refer to
-http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
+https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
 for guidelines on how to submit patches.
 
 Mailing list:
 
-    http://lists.openembedded.org/mailman/listinfo/openembedded-core
+    https://lists.openembedded.org/g/openembedded-core
 
 Source code:
 
-    http://git.openembedded.org/openembedded-core/
+    https://git.openembedded.org/openembedded-core/
-- 
2.25.1


