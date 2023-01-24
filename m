Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169E6C54E94
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 22:00:02 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web11.29637.1674597593024782552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 13:59:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eRCsvqzN;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id s4so14421452qtx.6
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIME74k1izMz1dvfGMBlGVqegv7gCmDOCkX1TATd20w=;
        b=eRCsvqzNYtAPiLMgQGAOSUSpPTN9b5K0rmNXsbmoYMxC496v/5DIjEFiL3NK0J7PNv
         eoOeRM8C880tUa9Y3R+QWLMhRsZdtmMcOf/3LEBjmUtqKHit30Iu8XlYK74xGBAH8ume
         oUPsXMHwZJUkpkmmh7/wzt0UGRdN+c3VJwVVScOLfB88EYfDv2JvUN0oW2sqwPtqfS2N
         7awDuyxqIM/wLtXsQ2iVauryNayRBJQam5y/aK/wLeactVBEBGBSjr07HElWc3gx3Ccg
         0oDpPrbp6/E/wpbGNezf3MxnbPijyHyDrh05vZHF4m7HHoHdKYUStMMCJIRDjTwvqkHr
         EGUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZIME74k1izMz1dvfGMBlGVqegv7gCmDOCkX1TATd20w=;
        b=uZzu4zsNfQRyyAI5q41cIL+eZb/husRiJhRL8Rg4zfFNbBGvImQV16YgixWVtLecWK
         sagfDMY6mcHEuJ9xXtnyJTTtAUJXnI4HNCrr2mfh/PtP+jFpveZ87Fbxhcj/n2vNm9wX
         FbDZpZtLX1Ab3FG4iTNYR8somX0R+SiC8BAXEGBTgp1YTMwCGaHZ2mWpNmfjw/+E9vdG
         vbv7+J4ft+Fm/W8iBP0ixrrTsnuVaMxYdKd39bMA/kIXoPhcpqWPz9MGNmB58upMJOte
         lZnIIOLBZwZQpltDfRKZA5FbDb4q0eItqA3N7ZWdA3v6v3Vfa/2KJNIwqlYT14bJwNgI
         UUZw==
X-Gm-Message-State: AO0yUKXcbkRkcNOZjPxWnUL3Qcf6fMtK5HswtxO2kdiKp6tgLjUPDYav
	azOrBGi9X6wbj6oIQU9d8ZMZCHxF7nf/6Q==
X-Google-Smtp-Source: AK7set9MBCgdvFxWrQt6W98/WT95D58OCnwYat6wU5coO6gXhRrsXyCu8HRAfSG+VpEk6UqTjlGNmw==
X-Received: by 2002:ac8:594a:0:b0:3b6:98c7:48fd with SMTP id 10-20020ac8594a000000b003b698c748fdmr40267qtz.15.1674597592022;
        Tue, 24 Jan 2023 13:59:52 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id f12-20020ac8014c000000b003b0766cd169sm2049813qtg.2.2023.01.24.13.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 13:59:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] conf/qemu: bump preferred kernel version to 6.1
Date: Tue, 24 Jan 2023 16:59:47 -0500
Message-Id: <07a9d894ab394e0e5946f75fad16c8d96b5df4fb.1674597466.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674597466.git.bruce.ashfield@gmail.com>
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 22:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176334

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.1 has been soaking for a while now, so it is time to bump the
default qemu version to 6.1 and prepare to remove 5.19.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
index 4052eacdb5..c3cc0dbff6 100644
--- a/meta/conf/machine/include/x86/x86-base.inc
+++ b/meta/conf/machine/include/x86/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.19%"
+PREFERRED_VERSION_linux-yocto ??= "6.1%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index fe6c0117a8..6e59e42c3a 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,5 +17,5 @@ QB_GRAPHICS = "-device virtio-gpu-pci"
 QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-PREFERRED_VERSION_linux-yocto ??= "5.19%"
+PREFERRED_VERSION_linux-yocto ??= "6.1%"
 KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
-- 
2.34.1


