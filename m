Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA059C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 06:56:42 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.3385.1639724202444292872
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 22:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khqT8akw;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id f125so1307896pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 22:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=mVB2j9A5NHnxh4D/UmafWqNUf48s+CyW/Tji0dQONDw=;
        b=khqT8akw3WIgCrpv1q6x5FVu/oPgB7QLBoOecyDG0qUGLvr+zu2iJCSnq1yQxWZxct
         7nFxmvlFwylZDxEbvK0RBc/9MjDA0g+a4dqa4uW8JrvTpAy+nHhx3b7JdOx2JH0eDmP8
         bKVDdIYsNdySadgZYzVyRbYJsHrykEr7O4acIpNb0kcLOogfTfnqJR4Vsu+S5HAB8htk
         myHUIx/Z3L5i214kPYtm0yQk0ugD6Ay6QJAiO5nQBes42MK1KAoxTzFjkzDSrkl9p+kQ
         4IyflQdgiLC83rFoY0ArxJoBHV6+3KrJRae76OnAHtXagUN5PZHabZQh/oQoC88ZL34R
         a+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mVB2j9A5NHnxh4D/UmafWqNUf48s+CyW/Tji0dQONDw=;
        b=0kWTuQP1Q63cvtU2BzSxxpxXf5jAMfWcr+Nw0TlqK7qaS+jdD4iGkzGYT3uZnKsG3j
         segiAoQ69vXAllzP/sGiPdwCGkogBEeGFhDapxl7xS2r7U/gIjZfArnC3b/mGyESgw40
         eYCw9SCz0NHD/KBz6c8QcMVZs45+vqCVh5PdM1pka7Imxdx97+DmKD4Rtod3WuQoNCYW
         EgnDpyMx30RDWIFKdUjaQW3QvzISFmusBr1Pmme905oVK/ZQthl1QVzsVhOFkp/Awe/L
         5e6RVjTKwKSIqVepdQrWVpl4qPfrOExeT+i3JlPHPT5+540OW4HPfDAbNRE18f3gQcXY
         FbcQ==
X-Gm-Message-State: AOAM531jbl15NDBqYqPhGUOA7qk23OMdo6tG1BX/gnnEgDBsX5Yb3SPp
	8ZMUTDLWQYxvHblbGeCzhwWc4fWxiH9oMA==
X-Google-Smtp-Source: 
 ABdhPJzEj4DqY7Yc6SG+a7892J6pfNDAVIuHSj6YSBuxxMhS5abFvaYauApxhw7gSnZ5gtPHJRc4yA==
X-Received: by 2002:a05:6a00:1308:b0:4a2:75cd:883a with SMTP id
 j8-20020a056a00130800b004a275cd883amr1671514pfu.84.1639724201688;
        Thu, 16 Dec 2021 22:56:41 -0800 (PST)
Received: from localhost.localdomain
 ([2401:4900:502b:4528:10a5:44f4:647b:9622])
        by smtp.gmail.com with ESMTPSA id
 u6sm8534651pfg.157.2021.12.16.22.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 22:56:41 -0800 (PST)
From: Sana Kazi <sanakazisk19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sana Kazi <sanakazisk19@gmail.com>
Subject: [poky][dunfell][PATCH 2/2] openssh: Whitelist CVE-2016-20012
Date: Fri, 17 Dec 2021 12:26:29 +0530
Message-Id: <20211217065629.7178-1-sanakazisk19@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 06:56:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159818

Whitelist CVE-2016-20012 as the upstream OpenSSH developers
see this as an important security feature and do not intend to
'fix' it.
Link: https://security-tracker.debian.org/tracker/CVE-2016-20012
https://ubuntu.com/security/CVE-2016-20012

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index e903ec487d..ddc9ed0b32 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -51,6 +51,15 @@ CVE_CHECK_WHITELIST += "CVE-2020-15778"
 # https://www.securityfocus.com/bid/30794
 CVE_CHECK_WHITELIST += "CVE-2008-3844"
 
+# openssh-ssh1 is provided for compatibility with old devices that
+# cannot be upgraded to modern protocols. Thus they may not provide security
+# support for this package because doing so would prevent access to equipment.
+# The upstream OpenSSH developers see this as an important
+# security feature and do not intend to 'fix' it.
+# https://security-tracker.debian.org/tracker/CVE-2016-20012
+# https://ubuntu.com/security/CVE-2016-20012
+CVE_CHECK_WHITELIST += "CVE-2016-20012"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.17.1


