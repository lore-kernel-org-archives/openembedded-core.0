Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3703.1795810330318996393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xvCSJ4zJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4a42b34e930so7410096f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810328; x=1796415128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtAg+rh2o8y7a0bXOUUnAiyA9aDB+WrwpRpq8D4W490=;
        b=xvCSJ4zJEdhAFNAmBz2xc3H1PzYMbkZUyWRCmE9+siuCN8eTVsPQ9yNQYcg91ulHSd
         MN9SD7NGUTUWNAmtLbxkitJ4T8WcfxrOTL6nCu8SO6ZWpLwLeq/VbdtYx8y5wzIBro+n
         3LFaJyiTpBW6mL0kLzS8F/Hh1qyR/c/LUIksoOSty+Y6n19E/nwiPl7WI9yL58thFzie
         mB/QgfNRTpX966C2OwfKB8sXf12C/6tkgxg6vysWUM5ULJTnZfiSzTHSgr4cdBnxwO2z
         RKFS+WiYRTO0+0WhzjA4zAs1a9oNMARAheGEC8h8aWuQl3n/VyzG/v1JMkOA0QGIcHNf
         SWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810328; x=1796415128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UtAg+rh2o8y7a0bXOUUnAiyA9aDB+WrwpRpq8D4W490=;
        b=BRVjeleW7X8IAybI6T4DRZ5lCBR9MHBX5Iq7hKIJiPhIXnef2V/4zKqBIdbyyr9Cmc
         uAuqGTFtbAOG+5uDryPFvNw2ycMcthAVeNK3alRjpEcmMyXSo03BlLJcwbddio2OM+83
         0h04mO5Kb7Db7sk/JDwLjXF3mj862ZLsomBY9Wt79GS3yCTx2TuLOE5HCS9eam/JADoI
         Lpo+fqDZr29M5SpC8VcQ0ziioT1rd0SarpVhkdnKkMzzOeJkARdoE5f5ObnUvU+JuUxH
         JJB9JArjEUYhwLAmBv0mnH3SOjxUoD4VqTWLx4KTZjhZLxHZ3dnEneNUS5j9t1Cq16kU
         8jcw==
X-Gm-Message-State: APuU4Z/OrPrTjHCjf3mgL6k2O3V0sBbZy09+W98sNrA00xxtRey+UGEa
	WdAP1e2u8QFviqTIw2T/v9ASdMtZi9YbKM7C9tHy46T7WVQ84xtu7XUSfUqv2Q==
X-Gm-Gg: AZFdTZfbtW6q1APh5cBPr8LQoyigWpJsoViKV63S3vQckuROkWSoRXjhQYb9K9kX8Y3
	/YVTjU0MXKG9VDiFIyR25XFDUuJnW71MnxyYaJJem37ldVeqtabJ5bet+O0fmGu6jRREc2Rzsnj
	s/YfnYIL3pYMSZYwAqlupgmKUbErOqGNzYcaZzf9NV+ZSXW3a9GJJa4cdrWnuMl1vDdqkG5BdWX
	ib6zViU4Fxfcj5NNqjPT7QomjjOebDkLAoQ+4+3TkraU/EhcD6l/QC/SgN21ttiYc1fA0abfWQu
	dW6H7xhMsXEs/dj7TY4Bu+wftRpOXnCwXMSHLzcXIflKL0UBjwFYA6JEYwHjqgJtqXXw5u51P1g
	kqUqiLtPgr05U+TKvCPDRaNAQNVjWaqc7a7Ns74UiZU+aTygFBz/Z6iQUm9AK7OjqJUJxKn/4c0
	0wJZeY72NDHEYtUrMwmrjer1qdiotpOyM0uM9HgUcF4IFvW84p09ZrtfN768QgESHw7KrMUkgXQ
	S3KLbT+w89YBKZhYcH+h9i3kAugs3QXxCB6VB2f5V3t/uGJPyK6Xmtm3wO8qsF3Mqf4vYwHHubq
	FCSLoE/4meGU/4K6R4mmgsHshf5tdkjn7pmjeubQ6GHInsxTlAYvYac8Z9VAkjjEVg==
X-Received: by 2002:a05:600c:46d3:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb88812c9dmr532512715e9.25.1795810328415;
        Fri, 27 Nov 2026 12:12:08 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm994530835e9.11.2026.11.27.12.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/6] default-distrovars.inc: replace pulseaudio with pipewire in DISTRO_FEATURES
Date: Fri, 27 Nov 2026 21:11:58 +0100
Message-ID: <20261127201159.914833-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201159.914833-1-alex.kanavin@gmail.com>
References: <20261127201159.914833-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251452
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

This has an effect of configuring recipes to use pipewire instead of pulseaudio
(or newly enable pipewire if pulseaudio isn't supported).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index 69c6db589b7..22b91d29280 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -27,7 +27,7 @@ DISTRO_FEATURES_OPTED_OUT:append:loongarch64 = " seccomp"
 
 DISTRO_FEATURES_DEFAULTS ?= " \
     acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
-    wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
+    wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pipewire \
     gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
     "
 IMAGE_FEATURES ?= ""
-- 
2.47.3

