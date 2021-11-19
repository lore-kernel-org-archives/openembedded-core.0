Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB11EC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.5204.1637302528592752569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WfChZ3Hp;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id n29so16137283wra.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I4idqnW/TYwYOWQCVJv928jk9dIIkPOXyCnEJijf0tc=;
        b=WfChZ3Hp4balTEQUkdn12tb0fmrcDsZFbBl2pygNuCTNn+FOdMTlcTc5uIckwEaXY3
         D3HiW2FuqkNto0NfAwa5qIbQYNG/FGLKZzCZnWCgAvdJ/SkldupyDN/AKLV+JOVNC3Ew
         DkWDzM2rSmMaHrjR5laWPOm1kQsPMEjllVbAvGIDgVjg/0ZE0bfZ10HIscqGMXOuzHxl
         qpD1n7n8VYMQlujilDCky0ms3z/tE9ny1v9YR57UvJASest89X4bO6To6t/EyNeoAH1n
         F+sG6hnewaXtqwQB7URt9bXJw629n9iBNH9c/Z35gyGoa7Q/V+FCFfRKgxTueRIioZpo
         Tx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4idqnW/TYwYOWQCVJv928jk9dIIkPOXyCnEJijf0tc=;
        b=UOOwdQGqYp3Dijd+aTdNjnOHFZ8y3pr+RIrEFPdY9Q+5xDzayeTaP32ufqGTLbKzuz
         xbhjyLbpdH+IVhx9YWn+PhlDxK5JwGsYeQdh/DOfIqY7NbmIntlpnKlLPf3fgF+hqMyP
         aGcjocBnOAnD/zlVLgbym1Obc953y1f7zTWyxlPZ+dd4xNhMit7ARCCYJa4JxjydnqSP
         o1suUMRX21oj6cUJKcwJwZoftNP/uq/MCcpF0F7mL3bCkafC9d+bwNThp0LXiakBPM+u
         y63pBGD4R8Vir62nZ7Wdrdexc+yCqZMKAQfd2UEMXNnHfobhjNe1T/ePQSrDmCfZaO7q
         Ha4g==
X-Gm-Message-State: AOAM531rzYtlzNIq7rLlpMW6Nj/uipsQRpE0RNow3595f4I7Tpth8OMX
	OpBXkio5UPYr1vVtYoGa9csaSTdkoXVL5w==
X-Google-Smtp-Source: 
 ABdhPJxM9MEmZav+TbGgjJSScQWih3xBxDZ2KjtXb7t68xEpfoone8kKcwuMeQ+KhUEZfK+96WBrVg==
X-Received: by 2002:adf:ce08:: with SMTP id p8mr4252593wrn.154.1637302526824;
        Thu, 18 Nov 2021 22:15:26 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:26 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] wic: image for overlayfs-etc tests
Date: Fri, 19 Nov 2021 07:15:03 +0100
Message-Id: 
 <08bae4440a8de2f4c678c304bc3841ca300548e6.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1637301667.git.uvv.mail@gmail.com>
References: <cover.1637301667.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158494

Introduce wic image for overlayfs-etc tests with a dedicated /data
partition and configurable kernel parameters

Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 meta-selftest/wic/overlayfs_etc.wks.in | 4 ++++
 1 file changed, 4 insertions(+)
 create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in

diff --git a/meta-selftest/wic/overlayfs_etc.wks.in b/meta-selftest/wic/overlayfs_etc.wks.in
new file mode 100644
index 0000000000..1e1e5836e7
--- /dev/null
+++ b/meta-selftest/wic/overlayfs_etc.wks.in
@@ -0,0 +1,4 @@
+part /boot --active --source bootimg-biosplusefi --ondisk sda --sourceparams="loader=grub-efi" --align 1024
+part / --source rootfs --ondisk sda --fstype=ext4 --use-uuid --align 1024
+part --ondisk sda --fstype=ext4 --size=5 --align 1024
+bootloader --ptable gpt --timeout=1 --append="rootfstype=ext4 console=ttyS0,115200 console=tty0 ${OVERLAYFS_INIT_OPTION}"
-- 
2.28.0


