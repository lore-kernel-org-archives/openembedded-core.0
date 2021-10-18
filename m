Return-Path: <daiane.angolini@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C98C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 18:45:08 +0000 (UTC)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
 [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.40664.1634582707434887280
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 11:45:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=ZQOe6eWo;
 spf=pass (domain: foundries.io, ip: 209.85.221.171,
 mailfrom: daiane.angolini@foundries.io)
Received: by mail-vk1-f171.google.com with SMTP id l39so9082000vkd.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 11:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLHoo0MHX02rr9OyMMRDiNl630HrC64o1l+7qU84A2Y=;
        b=ZQOe6eWoNfhOVruCD5bfz1SSve7iORQVuKVh47fgspmGT1YlYuO8nhcyfiQd28ypjh
         zywIc0kKeyZ8r7Fx1U7/XBA5VYFXj9oUQwg7F39A6Lr3LjRfQXEiTnNUY8T2ZHGgLpwi
         CCmT7vDM7Dr+TfUG0ipp6W/OV7sOGUBAowsGsd9C/O9LrTRN1NNVjjaBe3tSWRMFFAEc
         Wz9/xY9w96x1ysgitMiGRJ674rN/+OaE5xD3jgp9csT+I2qa+jJp08dmx3iBI1y3HFG6
         DFA3rr5vGtQ0a1VxUPP3jg1/07o2pezKtbbdZmcCceK/z644Z4o996j1gYlSgzCSQaNg
         CSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oLHoo0MHX02rr9OyMMRDiNl630HrC64o1l+7qU84A2Y=;
        b=q3kkFUyRciIqJ0NMHGL6n9/V+E8MYPHqpYgcWJiyuzqJ9wXb3MRmP8uH+zpSoArqiu
         a91SXE3IJZL2xtNePUwDzmWUI4eVcFF0+EL3Xe+LTLvoqhkG5Jnwt9jkQiM4qYIZPkVU
         xH4IT6q9c9Md2Uh93sv9iGi8vxH2wsYX6q2yEnzVcdOtu5oRdzcwQO3fbJOqYDwFXlwZ
         s/fsrBbNBUgfcpp1nKAIjc7AEksMvbNfv7JVVocDT9AsSyXvJI0JGkEXRIq1MEp9u3qt
         Xq+5c9Utli2PJypEuY2D5VU2rBCQTSwvIz2icUQ277WkW2synYzMGTavSsI7fOPJwY1h
         0AKw==
X-Gm-Message-State: AOAM533dkdPWcY3dJP6uNgznDbo46EuAhr8Bfwy1aWcDEqRTd+JocAIg
	ihLVIFjAA3PExwMPAAaZWNdpPTCWkqLYRg==
X-Google-Smtp-Source: 
 ABdhPJxU9fE1trbco42uNI/X6oxq8ueRRdFR0TDSyOrgmP/retd8/K8gr1+O4V+ovnE9EgOamNSkGw==
X-Received: by 2002:a1f:6047:: with SMTP id u68mr26366152vkb.15.1634582706220;
        Mon, 18 Oct 2021 11:45:06 -0700 (PDT)
Received: from localhost.localdomain
 ([2804:14c:3bac:19c0:f2ea:220b:6c75:81cd])
        by smtp.gmail.com with ESMTPSA id 33sm2354049vkn.2.2021.10.18.11.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 11:45:05 -0700 (PDT)
From: Daiane Angolini <daiane.angolini@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Daiane Angolini <daiane.angolini@foundries.io>
Subject: [OE-core] classes/lib/useradd: The option -P is deprecated
Date: Mon, 18 Oct 2021 15:44:55 -0300
Message-Id: <20211018184455.437741-1-daiane.angolini@foundries.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 18:45:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157090

Since [1] the option -P is not available, so remove it from parsing lib.

This is a partial fix for [YOCTO #14605].

During the do_rootfs, the error message when using -P is:

  useradd: unrecognized option '--clear-password'

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
---
 meta/lib/oe/useradd.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
index 8fc77568ff..63768311ee 100644
--- a/meta/lib/oe/useradd.py
+++ b/meta/lib/oe/useradd.py
@@ -45,7 +45,6 @@ def build_useradd_parser():
     parser.add_argument("-N", "--no-user-group", dest="user_group", help="do not create a group with the same name as the user", action="store_const", const=False)
     parser.add_argument("-o", "--non-unique", help="allow to create users with duplicate (non-unique UID)", action="store_true")
     parser.add_argument("-p", "--password", metavar="PASSWORD", help="encrypted password of the new account")
-    parser.add_argument("-P", "--clear-password", metavar="CLEAR_PASSWORD", help="use this clear password for the new account")
     parser.add_argument("-R", "--root", metavar="CHROOT_DIR", help="directory to chroot into")
     parser.add_argument("-r", "--system", help="create a system account", action="store_true")
     parser.add_argument("-s", "--shell", metavar="SHELL", help="login shell of the new account")
-- 
2.30.2


