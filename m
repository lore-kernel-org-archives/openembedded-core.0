Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B48C83F15
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 14:15:43 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.15075.1693404933556691856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 07:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=goRgZj7d;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9936b3d0286so767864166b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 07:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693404932; x=1694009732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JOAdKWjYFCehMe03oRqwKJt/7Q9dkJQbt8q64NYThd4=;
        b=goRgZj7dvvMlkxDLAuxFcglTxaoVuv00B8dn5bWJji1JRp26EFM0e6Wl/0NnPiRdz/
         K4Bc9GJ4WkyKAVPUIKtLCTAVYzokE49VmhJh7gFv7RTBSJCVuX5u6vFq+zIbiAxPzimy
         ugGk/RfR5IGYUwbfrlhosiFZiPFfWK6E47hJiRlRcVg1ivQ9phLjZKlOAFkv2M9qcye7
         tozsPzCPtBOLJcoPtTIT6hFun4oNmd9c2SqXFmSeRFycD5FNvb5lK0X7YAtW7CoYy0Nd
         96dLR2X1ko0mhDYTpru8MnnK0nAITq4Jo06R9DXBFBJhrBXmcDooQR9YFggdZcVnS5GS
         wBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693404932; x=1694009732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOAdKWjYFCehMe03oRqwKJt/7Q9dkJQbt8q64NYThd4=;
        b=TFSB326KkDatoi/nk0ZJ15Zkb0a/2NuYrMJzbmdoSrcbDUfY3xcvtu6Wrh7vk1VZKM
         swaV1eE3UfQC/WcAzWxPaJNtpxIqvRUhiXDznlYqiqkpwc4xJ4/rupM8I453bZuRC/GF
         o/yGBuMlc/zcQDKR0BWI03TxQoZPWwemf60LiG9HPamT6+TjFokHefZbd23EW10A5hTj
         g16JXukrOxKbWpxE0mjU4fiJvjb4cOkAQEUMqZQkOiGgqX8AghWwznBMftvvQiAEbEIL
         PTtsTbpVvM1MW7uIY0ttc8DhZHdbwYMmeoyhfbmMYNwtn0jIheateldWHZ/MMB7IwlkO
         STQA==
X-Gm-Message-State: AOJu0Ywb2F3jjZiyyhHeox7YQkf6+ApKkJxFkRYXV7weUaF/btygurBs
	fSmU3Qrd5M5d0NLdLWQq1Acy8w4EfI4=
X-Google-Smtp-Source: AGHT+IH0o4ztU7K5Gh7p9eOnFchesHPOlffTkvx3JDlv+VHfHqYNF6ENFijuM+uG6bCYaU1oJN2bkA==
X-Received: by 2002:a17:906:9be8:b0:9a2:1bd8:a6a with SMTP id de40-20020a1709069be800b009a21bd80a6amr1980134ejc.41.1693404931587;
        Wed, 30 Aug 2023 07:15:31 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l19-20020a170906a41300b0098ce63e36e9sm7359181ejz.16.2023.08.30.07.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 07:15:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] meta/conf/templates/default/conf-description.txt: add a template description
Date: Wed, 30 Aug 2023 16:15:12 +0200
Message-Id: <20230830141512.656130-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 14:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186891

There is a need to separate the template notes (which are lengthy
instructions about how to use the template) and template description
(which is a short explanation of what the template is for).

This patch adds such a description for the default oe-core template,
and updates to the tools will follow.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/templates/default/conf-description.txt | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 meta/conf/templates/default/conf-description.txt

diff --git a/meta/conf/templates/default/conf-description.txt b/meta/conf/templates/default/conf-description.txt
new file mode 100644
index 00000000000..e49172fa0ce
--- /dev/null
+++ b/meta/conf/templates/default/conf-description.txt
@@ -0,0 +1 @@
+This is the default build configuration for the openembedded-core layer.
-- 
2.30.2


