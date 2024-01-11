Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86C5CC47DA7
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 16:27:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.15728.1704990466240857930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 08:27:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dGKJnpyw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3ec3db764so23189175ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 08:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704990465; x=1705595265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8v55FYADvsIB3A0CbHO+gKIMlzcIdU0z9USy7SQaLiw=;
        b=dGKJnpywhyn/mHwOn8YIceemDNOoNxG4g9hQ0Gga+K63w7EU30rC8fd97TB23a23A0
         j4cQbUtAD4dwjorherdC8sGyHQDiO4KkmPvbDFehUGQjRG/noAp392WMneYvbZOOkeGt
         kqsuHQq5opZD/fxKO9X16kopupmoOpKr0+g+i9hKuQvTbb9VophHG8hzXKUno+bMzKBt
         JRGm46mBa4XP+w18WEyKjw+8dzeT8io1/p1n0uH1ZPagK81lV8WctuT8xI5Rd683tzZ/
         ob2M0/eRrqLQntZ3vOQTfHsN5pCinweEiz78BEqvw8q5B25hKhwWmLkYrsnebkxzn4JM
         k2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704990465; x=1705595265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8v55FYADvsIB3A0CbHO+gKIMlzcIdU0z9USy7SQaLiw=;
        b=RLG7vcYOEWvwTpGX+jtBSjaBvgXIMNHFUR9l5wmdfX13Bo/YGJIFHGMs8L+vPa+fGJ
         /KWhxOTG7zfaHPNMmaHBw6keVsrOsKCw6J4btIGTbv9bi62atsBigruGZMiZ7HvIZn1Z
         IgFgm9vSAZTpDe5SKzbjmF/yZoOQMWCr2EOIsFD5JgUqERWKJNjE47YjJm/0z4IpQ0of
         5xHqO1FdunrQYpwTb+IFPyiRPqcNxoQbv1w+vvTM/Gi8DcXg8540qwv7S4ApQbXnnEOx
         73nWgEAFZ7AVTcGykLjDZRtEGc/2ncI7YzEISi9lqUKlUaEtMYDqnFNRmj3zNKP+z9a7
         ClXw==
X-Gm-Message-State: AOJu0Ywpo2V4LNd9hP/VZ4ml20i15IaNUMool5PBCAn3A5U84ERuQrWp
	BuNBCCGbnCysEKKnpIjSQt/kqu3XiPQi6ef1cWLNPJbDbPZwAw==
X-Google-Smtp-Source: AGHT+IEOW5jHltwJimywuPt8FEPAzXaG3bHrOZR8YhXlWsrwHGTwj2150sz/x0cI0jHUWo+LDCmPZw==
X-Received: by 2002:a17:902:eb90:b0:1d4:19c6:dfff with SMTP id q16-20020a170902eb9000b001d419c6dfffmr1790766plg.20.1704990465380;
        Thu, 11 Jan 2024 08:27:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a6-20020a170902ee8600b001d04d730687sm1347577pld.103.2024.01.11.08.27.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 08:27:45 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 08/12] documentation.conf: fix do_menuconfig description
Date: Thu, 11 Jan 2024 06:27:21 -1000
Message-Id: <adf91e340d5d8121c87585fd7340f947b21396b1.1704990330.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704990330.git.steve@sakoman.com>
References: <cover.1704990330.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jan 2024 16:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193556

From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>

The current description is only pertinent to the kernel, even though
do_menuconfig task is used by other projects, such as Busybox and
U-Boot.

Replace "for the kernel" by an agnostic alternative (i.e., "in the
compilation directory").

Signed-off-by: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52e053bce5e359995ebdaa21d6899f04ad2306a0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/documentation.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index d03c497c0e..486c62b6e8 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -28,7 +28,7 @@ do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yoc
 do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
 do_kernel_link_images[doc] = "Creates a symbolic link in arch/$arch/boot for vmlinux and vmlinuz kernel images"
 do_listtasks[doc] = "Lists all defined tasks for a target"
-do_menuconfig[doc] = "Runs 'make menuconfig' for the kernel"
+do_menuconfig[doc] = "Runs 'make menuconfig' in the compilation directory"
 do_package[doc] = "Analyzes the content of the holding area and splits it into subsets based on available packages and files"
 do_package_index[doc] = "Creates or updates the index in the Package Feed area"
 do_package_qa[doc] = "Runs QA checks on packaged files"
-- 
2.34.1


