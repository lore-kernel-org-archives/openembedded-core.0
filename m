Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2053C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 17:36:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.14245.1647365788443846445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:36:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BNvQ+bzu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id x15so30052657wru.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 10:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Q5P2TNF1502wlnEoq8NbHeUYP4ZGrlerTi56Bg7ArU=;
        b=BNvQ+bzuivD92VD/IQN0/VBY8lg/IuJ0E7JPZEjtgIqttvi8yo8dw1rwpHEbgPXqeX
         nOtVzoaUqrU4GL0aZHXAjnbUly32+4oMSZ3CtV6P8Yc8HiAANDwWVaXw6sm+cJwvEGdR
         8iIiYEy90KQuoXtMip73Xz2C1vbDpnToLE3K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Q5P2TNF1502wlnEoq8NbHeUYP4ZGrlerTi56Bg7ArU=;
        b=a7Gf+JG56H/vj8jWla/i0dyOWNn0V4KMMaVwLDwCXOAXnh5nxJDzDfQqA2ERzqQZ4c
         6wquzTBiR+YxSdpflkRKi0IIFWGPTgd0gHgMbhUgwvlSxcvzFDVOaltiCzoqQ/TUCa9N
         L04kLKBkzGD+8+2x3C4dkV1gVFfMWZ5DuyaPMEjFii7fq7lEPCKlirlwAx9UMZr3tKBD
         N6S6IlDQxOSFHQh6yRgq85ma65WX5GJUPIPphTWGXAiikpGHJl1dQqpddFj/SGuH/D9R
         tXDOZVaMruQwOTL3BPWtrLNAHN54Zyzuex5i9/ijM8Hpzu+U+iTGLfvYa3yOKm2CCIm4
         rquw==
X-Gm-Message-State: AOAM532PQRGPieFQCx5XmwSutDzbp2TciO0VJnO5VTFlkAI5TZipOQn7
	+9/Ny+vHer4kIEBBszvacQrMwWUgKvPYadID
X-Google-Smtp-Source: 
 ABdhPJzHHOWTs3n9fTdy6q7+EPQyQIzgS7jUby+wCNy+ROEt6qJWgfDt8sO6fWfbI/zgqe5CHeyf/A==
X-Received: by 2002:a5d:4b87:0:b0:1f0:68b1:5741 with SMTP id
 b7-20020a5d4b87000000b001f068b15741mr21009998wrt.69.1647365786652;
        Tue, 15 Mar 2022 10:36:26 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9098:b3d5:8fee:ea58])
        by smtp.gmail.com with ESMTPSA id
 189-20020a1c02c6000000b0038c57df82aasm714540wmc.20.2022.03.15.10.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 10:36:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license: Drop AVAILABLE_LICENSES
Date: Tue, 15 Mar 2022 17:36:25 +0000
Message-Id: <20220315173625.890140-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 17:36:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163313

This variable is a performance liability and is highly dependent on which
layers are added to the configuration which can cause signature issues
for users. We have no users left in OE-Coreso remove it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 4 ----
 meta/conf/documentation.conf | 1 -
 2 files changed, 5 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 94338be90a4..813e1ea4f5a 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -271,10 +271,6 @@ def available_licenses(d):
     licenses = sorted(licenses)
     return licenses
 
-# Only determine the list of all available licenses once. This assumes that any
-# additions to LICENSE_PATH have been done before this file is parsed.
-AVAILABLE_LICENSES := "${@' '.join(available_licenses(d))}"
-
 def expand_wildcard_licenses(d, wildcard_licenses):
     """
     There are some common wildcard values users may want to use. Support them
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index feb23a666bf..ab2addb321a 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -72,7 +72,6 @@ ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib p
 AUTHOR[doc] = "Email address used to contact the original author(s) in order to send patches and forward bugs."
 AUTO_SYSLINUXMENU[doc] = "Enables creating an automatic menu for the syslinux bootloader."
 AUTOREV[doc] = "When SRCREV is set to the value of this variable, it specifies to use the latest source revision in the repository."
-AVAILABLE_LICENSES[doc] = "List of licenses found in the directories specified by COMMON_LICENSE_DIR and LICENSE_PATH."
 
 #B
 
-- 
2.32.0


