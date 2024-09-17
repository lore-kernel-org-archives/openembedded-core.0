Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C474C36014
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 11:25:28 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.18668.1726572321784511536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 04:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I6YNbBdL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42cbc22e1c4so35185285e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726572320; x=1727177120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6yjtqoSmjTO0uADWy29DSDxM4DsgRi1gDGUeLLPFQBU=;
        b=I6YNbBdL/nT+a67WjXUXZ8sou2l6iiCCZ2q5CWJo83rWsKXP7BgV2dPKrsBRgxr/18
         6PTBNMIkbcVirJtzF55w9fWamEwPZis7DKUaDZkIUiG04j7aS4lkqmkqEc1xUoDEsjGW
         PwPYkMwEVAUrXGL+6GV33DjWaW5G1IUu5QH2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726572320; x=1727177120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yjtqoSmjTO0uADWy29DSDxM4DsgRi1gDGUeLLPFQBU=;
        b=tqsurlrV/kkQMe20oH9hpDSToL+aRZpnPh1ACypVTAsPDyNPOPvvRvkVLk0QLi+Ijb
         AG+HAQxzrYQCI5iOh0D0wQPBXgKOF2h/5RWori9XwLA8iFq1cPsmNOgilzhnfAXMrSVw
         ddaHf59OnTS4FW6PxFsJ868BNENPS4Vk7JqzoPLrBScnWEK0aWSKShfiIe4myxqSLzEw
         PENFRkukwRSFmPJGOm0qtgx17BJ1Q0ae1/4aWJGx3wXKuevirj98cTxF04Ll5Eldjlqe
         dOPvdJPAxzSBLY32JZGgeNjPO2ToXCyxSsyCntIV23G0oBpNyBjhFAOMROp5eudJCBV8
         63HQ==
X-Gm-Message-State: AOJu0YwIMyYduOiFX1UFfJtT+bFZ4TIelvZN+FsPRtVniq9RAwNKG4o9
	uCE2yOv4aj0Xu3oFqby8f7ml/tMum6T+185aAGQER/ZftCELNnHIamU7d8mccC299LdebUGbK8H
	9
X-Google-Smtp-Source: AGHT+IGvJT0rV7cqKPAnQTyKu1YKeHdzhbP1e26FNWeUw6nSAGk7j4QdF+hWA7+j29dm73ACA/qkaw==
X-Received: by 2002:adf:f045:0:b0:374:c101:32 with SMTP id ffacd0b85a97d-378d623c027mr7957279f8f.46.1726572319534;
        Tue, 17 Sep 2024 04:25:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7c97:abb4:726a:74dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e71f06a4sm9193879f8f.23.2024.09.17.04.25.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 04:25:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scripts/install-buildtools: Update to 5.0.3
Date: Tue, 17 Sep 2024 12:25:18 +0100
Message-ID: <20240917112518.3602944-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204622

Update to the 5.0.3 release of the 5.0 series for buildtools.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 5b86c130776..92a4c9dfb1a 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.0.1'
-DEFAULT_INSTALLER_VERSION = '5.0.1'
+DEFAULT_RELEASE = 'yocto-5.0.3'
+DEFAULT_INSTALLER_VERSION = '5.0.3'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

