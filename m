Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.31993.1609070995512450712
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Dec 2020 04:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LXA/RBKh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id q75so6881608wme.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Dec 2020 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBHURbZBwdJ3r3f5DRvhB0KvuQgbSW1gCrj2Hr3imMY=;
        b=LXA/RBKhKTv69Fjfe+9xVw24GfJ1j1+gJIMP4k907TU5+wATtOLW0q1CZT2jK2GZYD
         O8HaEofono65BspyEs/Av0aQxmEFbfeuJfAYtepvo6ZyFixdR1KjjXOlD7KHZU9qw6mx
         gS4z/qdrzTmym5UhfkeHZFuN1LPBNrtYc1edU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBHURbZBwdJ3r3f5DRvhB0KvuQgbSW1gCrj2Hr3imMY=;
        b=ZpLg0aja2E6NSP7N4PIxivOMF9rlrMo0tUjbUaeSu8c2xfewg6pBiTlUdU+zJVOCUb
         XUTPDBSW3OLGdgWiYBDBnY6NQb0oQ7rzJALX/QrZfrkzyj3WloTeNJTUt/62ivdWqzfR
         sOxlk9DJwQunOFb9HD4zK8fQtY3l29QI7EhCBgnh7Gsq9J0LgWLT3bq3IAb57acEPV5b
         BLdvcb4I2cSyeTHWLqLSvnYpcQIUKRjbNLuWRXeYguyG8glmsbV2BoXQVC1QnpPtVtSR
         ehD/lOTVBa1Hk9iHa3GY1/1TuRWy9LWVqif+CyRaqVo2H8VyQvoYm6psxTdkULn9hIYd
         MAqQ==
X-Gm-Message-State: AOAM530c2COvC0uIFRvHuqi83EOXF8NuklMVhALXYje7gihF0hzMDDSQ
	SKMT+gVA7ACwDrLhp1BygR//fTJ8q9u6jA==
X-Google-Smtp-Source: ABdhPJytLbYGwuHtqt7PcYoghmGIfE9pFxA2sSf7Y1YgVyrlOu4ui6gj56VGRofIcK7xZ7dAvb1okw==
X-Received: by 2002:a1c:3d55:: with SMTP id k82mr15938178wma.57.1609070993821;
        Sun, 27 Dec 2020 04:09:53 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (7.9.7.f.4.f.8.d.2.f.f.9.b.8.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:98b:9ff2:d8f4:f797])
        by smtp.gmail.com with ESMTPSA id x66sm14987598wmg.26.2020.12.27.04.09.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 04:09:53 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] meta-selftest/staticids: Add dhcpcd
Date: Sun, 27 Dec 2020 12:09:51 +0000
Message-Id: <20201227120952.139650-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dhcpc's uid/gid to the static configs used by meta-selftest for
testing since dhcpc was added to OE-Core.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta-selftest/files/static-group  | 2 +-
 meta-selftest/files/static-passwd | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 9213b8e9bc0..da4dab53733 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -11,4 +11,4 @@ avahi:x:509:
 avahi-autoipd:x:510:
 rpc:x:511:
 rpcuser:x:513:
-
+dhcpcd:x:514:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 412f85d469f..6ce2886ceed 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -9,3 +9,4 @@ avahi-autoipd:x:510:510::/:/bin/nologin
 rpc:x:511:511::/:/bin/nologin
 distcc:x:512:nogroup::/:/bin/nologin
 rpcuser:x:513:513::/var/lib/nfs:/bin/nologin
+dhcpcd:x:514:514::/:/bin/nologin
-- 
2.27.0

