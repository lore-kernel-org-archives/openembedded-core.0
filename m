Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB10C4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 17:24:16 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.15.1699723447195381722
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 09:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZPs4ph2/;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-507cd62472dso4617520e87.0
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 09:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699723445; x=1700328245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/v73JI5ZmK8CiWxffmJK2Tzq8P87r5UlFzVJ+35ub5I=;
        b=ZPs4ph2/kF9gXbWTLSCG/cDTtZqbHn8YFXP+jKv6rPiP5A9wGpJkBp8WQdgGuscesc
         3d1QdzcXFjfG1K+n6NQ123460R50r/vZNCsiwz84hsOoqk9eURFxTtmUr95yvzl2itPm
         DSsUk+zj90e7bT4e8xnOaNfWxC61L2KF47I9sWz+o752ArsHgr6zWeUqy1Z+GS/qkCnW
         H55rtqJbjWcwP18Fn3mLk8RDRoU3g7a/flvV1u9HK48K16KwrrVp2C1hBPuoX1GTTpAk
         Kb6PS3EsVmEcNboNgvw+IDXPVqA+VC+XGjPgaZlfUVAACzf+iyhfVKzCNQq+6Z6oyLZ+
         XP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699723445; x=1700328245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v73JI5ZmK8CiWxffmJK2Tzq8P87r5UlFzVJ+35ub5I=;
        b=VGJHBLp2a00K/3jddsBgSoS7AogYhsI6OVR9/loBeHt6S5WxfA2LAlXtAsRrfDYeuE
         CljqiOk2JpJrc/LdxJtzj+bO1XMAZ9FZSYUED9YTpRGtRhghcoJnZjRBOOOoLUxzSP30
         BH70NqtgB8ZtXUg18XFxXBZgzWpgib2ZIjR/Ko8yV9XarslGHM/GtzAWHt3af7xnhPnC
         xpnk0OJVYZEucRtQE85WKdRnHw2qscCHYQo0VN2A326WpD7JIBlasW0JRRcFdbppUKma
         Xxh6jdKIf/Stct5EOozhQtZBjWgMFmVLrJtbVpm3qkrtitdPqL3kTQu9vNzZv+twhVmh
         003A==
X-Gm-Message-State: AOJu0Ywojnk5AoJfB5343K84mRgtgsM0l66VYDt4LS4x34FlSxaWfrzr
	Io92GriCl/Cd8BGJKb0usv6A8+Jmvl0=
X-Google-Smtp-Source: AGHT+IGIdxF4rx4bGgf0OQ27S+EX86FA/GaNy54WxxDBUNuIzTELJjE9roRoYNvy4/y0Nh0UnvoFGw==
X-Received: by 2002:a05:6512:3e09:b0:509:4792:25eb with SMTP id i9-20020a0565123e0900b00509479225ebmr1074334lfv.17.1699723444493;
        Sat, 11 Nov 2023 09:24:04 -0800 (PST)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id c13-20020a056512238d00b0050089b26ea1sm330927lfv.276.2023.11.11.09.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 09:24:03 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marcus.folkesson@gmail.com
Subject: [RESEND PATCH] qemuboot.bbclass: fix typos in documentation
Date: Sat, 11 Nov 2023 18:28:10 +0100
Message-ID: <20231111172810.1880050-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190433

comand -> command
docuemntation -> documentation

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 meta/classes-recipe/qemuboot.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/qemuboot.bbclass b/meta/classes-recipe/qemuboot.bbclass
index 5c4bbd6737..ff32aac902 100644
--- a/meta/classes-recipe/qemuboot.bbclass
+++ b/meta/classes-recipe/qemuboot.bbclass
@@ -62,8 +62,8 @@
 # QB_SLIRP_OPT: network option for SLIRP mode, e.g., -netdev user,id=net0"
 #
 # QB_CMDLINE_IP_SLIRP: If QB_NETWORK_DEVICE adds more than one network interface to qemu, usually the
-#                      ip= kernel comand line argument needs to be changed accordingly. Details are documented
-#                      in the kernel docuemntation https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
+#                      ip= kernel command line argument needs to be changed accordingly. Details are documented
+#                      in the kernel documentation https://www.kernel.org/doc/Documentation/filesystems/nfs/nfsroot.txt
 #                      Example to configure only the first interface: "ip=eth0:dhcp"
 # QB_CMDLINE_IP_TAP: This parameter is similar to the QB_CMDLINE_IP_SLIRP parameter. Since the tap interface requires
 #                    static IP configuration @CLIENT@ and @GATEWAY@ place holders are replaced by the IP and the gateway
-- 
2.41.0


