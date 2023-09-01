Return-Path: <michelle.linto91@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA33CA0FF8
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 23:33:08 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.9254.1693611187814997123
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 16:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TkxxPbm9;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: michelle.linto91@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1bdb7b0c8afso19452465ad.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 16:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693611187; x=1694215987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xiOUZqrJpUGpjJOduP/BD9+H+DzDEGw5QTatNnH6hMI=;
        b=TkxxPbm9yEn3ABwQdNQd4FPOi97pB2O1a6GMwGCA6nmUK6q56o1bWTfM0+mbQWOsdJ
         jbBTIg/7QAq+SLqleEXSkUnugYfCaIjg+m7RCVlLmA2M5JpFZj4BFt5j18BTxneCaTEX
         1Y9vPhEvxYXk/fMPfVKPPKE8wMOwVJP5NSCHcLdYQ5RJFJV6lQcMoY71vk1K4hCUh1BM
         FwlDHIKBb4rJwaOcrYazBvU467yoOVKCB5FOslnGKfJHNXpJVt6l3alRZZwmnd+LdVrh
         k0aqN0pDnV6c+r1/waVA11MwGk3+IWXi0Psmy6FhXgzsFCP+9VkKGFwGstIIuaZtScC4
         Z1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693611187; x=1694215987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xiOUZqrJpUGpjJOduP/BD9+H+DzDEGw5QTatNnH6hMI=;
        b=dqudqwt3YD/pBMZ9BqAyNGOm00bDqxfnDMbWOy4rO805nCymrZ2r1ERh44n/RR4l2Q
         9xBktfjK/04eMJXgvIjkLHo66m+fngES9qnISxt/FquDMuGyQeiIjCctw1cbj/ncOvXT
         woOKLOzciEBBGRDo7i+JHe+meiMWmXFyXZa0piiuX0O4EM1fVRAxo2FV+Fr+/BG1+AjP
         5QX4kJ+I2oJVARDgNP6jkYWNp1RKeEboIejKJny03BPsYXAn5JbGlJ+0cqNFrVhNlT95
         VRdR7F8YPPFzUuCWLsfRFJK0RxXZ0eL4+/G+hWu9/bTgzMgHQaKha7gGWaOuXEbcKpYU
         4BEw==
X-Gm-Message-State: AOJu0YyUINephzSMaKOBx9YZ7LLXe0YH+RlzwmLzYtFzYOkenr7IoXoB
	t4Ao3owmZbi6xICkI0yGd8nkTiz4yo4+QY/S
X-Google-Smtp-Source: AGHT+IFM3Y/r8swEcbCLLFBHLbVR2T48nF29jQUgbvtNMnPSutxQV5c0PrIAZlW8SbsoqPphn+R9iw==
X-Received: by 2002:a17:903:1210:b0:1c1:fbec:bc1c with SMTP id l16-20020a170903121000b001c1fbecbc1cmr4800606plh.42.1693611186748;
        Fri, 01 Sep 2023 16:33:06 -0700 (PDT)
Received: from t-michellin-ubuntu20-dev.lmomnpnukpourfhb2n2erxnm1c.xx.internal.cloudapp.net ([172.179.2.30])
        by smtp.gmail.com with ESMTPSA id jf10-20020a170903268a00b001bbb25dd3a7sm3488839plb.187.2023.09.01.16.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 16:33:06 -0700 (PDT)
From: Michelle Lin <michelle.linto91@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>
Subject: [RFC] uki: Example usage of uki.bbclass
Date: Fri,  1 Sep 2023 23:33:03 +0000
Message-Id: <20230901233303.1109826-1-michelle.linto91@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 23:33:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187018

This patch contains an example recipe, core-image-minimal-uki.bb, on how to use
the uki.bbclass. The recipe specifies the need for a config file to be passed to
SRC_URI if the UKI is to be signed. The config file simplifies the usage of the
class by allowing the user to organize, manage, and customize the settings for
signing the UKI (i.e. SecureBoot, PCR signing). See systemd Ukify documentation
for a detailed rundown of the syntax
(https://www.freedesktop.org/software/systemd/man/ukify.html). If the config
file is not present nor specified in the recipe, the UKI will be unsigned when
built.

Signed-off-by: Michelle Lin <michelle.linto91@gmail.com>
---
 .../core-image-minimal-uki.bb                 | 11 +++++++++++
 .../core-image-minimal-uki.conf               | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki.bb
 create mode 100644 meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki/core-image-minimal-uki.conf

diff --git a/meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki.bb b/meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki.bb
new file mode 100644
index 0000000000..5cdf46a35c
--- /dev/null
+++ b/meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Overlake UKI creation with signing"
+
+require ../../recipes-core/images/core-image-minimal.bb
+inherit uki
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/core-image-minimal-uki:"
+
+# To sign the UKI, you must specify the path to the config file containing the key/cert filepaths for signing.
+# If SRC_URI doesn't specify the path to the config file, the UKI will build but remained unsigned.
+
+# SRC_URI:append = " file://core-image-minimal-uki.conf"
diff --git a/meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki/core-image-minimal-uki.conf b/meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki/core-image-minimal-uki.conf
new file mode 100644
index 0000000000..6e331ff1ae
--- /dev/null
+++ b/meta/recipes-extended/core-image-minimal-uki/core-image-minimal-uki/core-image-minimal-uki.conf
@@ -0,0 +1,19 @@
+#
+# This file is your configuration file where settings for signing the UKI can be specified. 
+# You must specify the path to the proper paths to the key/cert files in order to sign the UKI. Otherwise, the image will be built unsigned.
+#
+# SecureBoot Signing
+#
+[UKI]
+SecureBootPrivateKey=<private-key>
+SecureBootCertificate=<certificate>
+#
+# PCR Signature
+#
+[PCRSignature:initrd]
+PCRPrivateKey=<private-key>
+PCRPublicKey=<public-key>
+
+[PCRSignature:system]
+PCRPrivateKey=<private-key>
+PCRPublicKey=<public-key>
-- 
2.34.1


