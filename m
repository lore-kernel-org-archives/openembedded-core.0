Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A98C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:50:36 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.6106.1639137035052426815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fP1ekC9t;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id a9so14464258wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=I4idqnW/TYwYOWQCVJv928jk9dIIkPOXyCnEJijf0tc=;
        b=fP1ekC9tDyys5rPtjEtghNiQEuD7M14KZYJKsS82n0hAxu9GHC2jMOwon8W/fxCB6G
         EbqlA4Eby3MaJuYkdzKunOYSUzVKaOqj5RfcJc2LNok7MCAZE1JbmaceVGPG1dFChIAh
         iuSDxP+s20o8AkpusNm0MIsTI4q2ECM+EMRCbD+ME0tD+RBLTa2zH/mNZsh/nF5jlF8S
         8rKbvdlRXHlyIy7lEN84UvagPUr1aoAlaaiyP9soKrcH9bwsu2PVpnuNmHS3vBaRGUDs
         OVXMgLzjOPB7Y6ubdM2K8KnZSGXe+o9NcYK4lDyZDWQLb/s8PeOAX8jyXr0WZZimBgHD
         qRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4idqnW/TYwYOWQCVJv928jk9dIIkPOXyCnEJijf0tc=;
        b=5LlkGTSO8+c3OLJs6bCYZFqpuQqctO2YACu6Ua/oKhmFsm+ABxw+px+9iSWqnIiFBm
         GGFYMyChp6ngdq8wvRdc8nDWKdkahdpJOszcx9u/bHh429UIWcg0wxgDAV8554iCOfSz
         Uj2MR5K60EswlQuQidP8g3dzCuO9cfsEgBCWN2NwF9IFIVEnvYpzz8F7A7sHeic21lk8
         HDdaUVQsvBT3Kij7mRuD+86Izk5kyiCuWgiRHeQhPk36sbGYJLkA2SI/o+8iOXl/pfNS
         4ZR3bypqge1RhjsmLw/YGm4Vm2P0BD9zspGtH2Exke/hJEG8sxVizWxgJwxGQCfueBVF
         kV3Q==
X-Gm-Message-State: AOAM532SD89gFQNOozRXgL5Q+xI6GqPBz+6gFNZwQ4yTYx5buP+d5gfx
	ihs3Z0WF9LaCgf6LTuBSmQKt8oykpVJK+Q==
X-Google-Smtp-Source: 
 ABdhPJzs2+2d+wsqngvouA7xWDut0k4j2S7IkKP2T9w88n92QHVFzVC7ZS+FcEbTsBb20hs+2maBnQ==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr13667522wry.238.1639137033410;
        Fri, 10 Dec 2021 03:50:33 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-123.002.205.pools.vodafone-ip.de. [2.205.7.123])
        by smtp.gmail.com with ESMTPSA id
 y6sm11496662wma.37.2021.12.10.03.50.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 03:50:32 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] wic: image for overlayfs-etc tests
Date: Fri, 10 Dec 2021 12:50:22 +0100
Message-Id: 
 <be21ecc8264adcc28461d12c504f69c4ff6d88e5.1639136706.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1639136706.git.uvv.mail@gmail.com>
References: <cover.1639136706.git.uvv.mail@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:50:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159501

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


