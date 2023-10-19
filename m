Return-Path: <marcus.folkesson@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 136B2CDB482
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 08:48:59 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.23218.1697705334037893751
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 01:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SnKuI8wO;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: marcus.folkesson@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c50ec238aeso78386351fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 01:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697705332; x=1698310132; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/v73JI5ZmK8CiWxffmJK2Tzq8P87r5UlFzVJ+35ub5I=;
        b=SnKuI8wO0OOkzrtTrwUwV5spbNnDaW7Bm98AU633cfVNzKzuZjBGq7dyM9GBigB9/s
         2x32vR39X3796b5tsYZ0XzH6eZgCejSDHzT1jaOdSU0W5QwjodB9XVay2JIaxYlqUfbB
         fCXFnwpSg+XXA8zU6Gjq4kZuFyTJiTd1P5PSRfXcRWpnMTI8rQcXXbhgXC7l0AvXa+vH
         8tsAfFeRImbhPT+STLOzTlOnvp1AISNYZiFOFzfnl8eM59do9x+ppCsBIGUH4PruRtfR
         bOacH6aQPFvj/7bhXWmYEnn2lJRnGpjiEmUET10prYekIzMwSFv6vCa+PpLs0pnktYgd
         cCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697705332; x=1698310132;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/v73JI5ZmK8CiWxffmJK2Tzq8P87r5UlFzVJ+35ub5I=;
        b=QVLkmoR6wXifgGPvYtXk3TCnGN3dTqKwGR4ChJ4JjH1N/rxa+uVSjKYQlIKMRBmqCi
         ELmsqpfVeb0fRFfiycr53zSKV93ncAdi70gqwwdCsS/726JNi9zDtgJaZFz/HXCUQG58
         AOwJp22DldFOOaPxKtq6rei6NL/lCPVQAhXD4acFmw79foeRceyiUpuwcTJCi5ZbPHEW
         TT5H0t6coythXgwrqMWuwULHds/glatJPoOkypUTSLUPmRMll+QM6ubRbz6U0UEuX/Cu
         GnsbKu9j3W5owd9Llz6xSXN68huje6qTUw2hLpT9AOmy7uO16akONbogfDy33aewRdHY
         hkoQ==
X-Gm-Message-State: AOJu0YxUxzFbUbcLRhA5FoDUXO1MChc8fLtNAwmqn10XoSH28SYgTbfs
	bEYMiGCHlgVAX6H7MZ7p6kkgmlgvIgg=
X-Google-Smtp-Source: AGHT+IHkz//Xf6kNbWF7jqUpJ095NPM2ZUrXeRn01p+bkbYb9u0rdaWYkQq0mH3k5ZZ4KOIHirolYw==
X-Received: by 2002:a2e:a58b:0:b0:2bf:7fad:229b with SMTP id m11-20020a2ea58b000000b002bf7fad229bmr925351ljp.37.1697705331504;
        Thu, 19 Oct 2023 01:48:51 -0700 (PDT)
Received: from localhost.localdomain (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id o12-20020a2e730c000000b002bba2da7955sm1018408ljc.132.2023.10.19.01.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 01:48:51 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marcus.folkesson@gmail.com
Subject: [PATCH] qemuboot.bbclass: fix typos in documentation
Date: Thu, 19 Oct 2023 10:52:50 +0200
Message-ID: <20231019085250.790787-1-marcus.folkesson@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:48:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189436

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


