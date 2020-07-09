Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.589.1594271989708548733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 22:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=seJDO1t7;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: rehsack@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a1so868516ejg.12
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2020 22:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xgGucv2SQhPnucXiaub8WxnpMUBgCaExJLu4kp5OFCM=;
        b=seJDO1t7fUTWCV68VNiQ/DqHvpM6QkqoIUZrW4ZXN64IOKcHmWLcNdNpa/mfZSdHOB
         FeWBZXUoD9OYtOUGeXGBXFhYrMY9pZ55MvthJs/1R+pcJZO+VbuQTI1thARIysbXv6YU
         v1NqpgMqtGhjLqRvD32CjRhm4r+bW8ClvVw/ieakMrHYuMfBC0o91Ygb383mYDKw500X
         twNWHY9VMUGTPuyccCj8gba5Hi8Pr5G4yhRil6kTaUyvisj6UiTSZsK0vWrjMcb3Xf8M
         62YvSXNcEzP4QdjCzyIown8VV1GzWkdlZtCnyIDGW31ZxQYVc3oaIUcW2gE9DsiyjEd2
         nTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=xgGucv2SQhPnucXiaub8WxnpMUBgCaExJLu4kp5OFCM=;
        b=ne+TL2naNlYnqUI4o1OXeifxtzwaq9o5/BiRt4rZARRJAlsogGVONt6HlYWMHNFSXd
         bq9ozbfiqXjFhXH2IbbEbk2EAFXrKOxyc/DNN7wYSax4IqH7pcwFrd9Gnscib9c/eT3X
         dIb/qs4xYZASeAAWOcz+f2MIL8nUoc4SaPauAMogs8S/V1NfAUYVydsJXF8dsLvpx0N9
         uERVeH7rN+DBZyfb/8cOMuSOT37euoC9zBRVJ3WNyhIw3sPK+cE6VomMcX/tdacaPGJR
         rMXZVfvpZ/IDX3b+PsVdHwvgBskknNG7RyL8JpDe+Nch7KL5Ok+eFL0jMlUy/lpt1JLS
         eY0A==
X-Gm-Message-State: AOAM530buOdxbqTQgs2p/9zw3QqJ51HsjRo8fktlsD2WhAGHxTHnV4cp
	oOweBRawdrmiFZA+AAshkB1RF0dI
X-Google-Smtp-Source: ABdhPJzKxHUQ7l3DiU16TQXXdUitZpeVMw8PAspqIZVgEghzSGTk70CcntDzWIgp5kM+l1HEsJZgTg==
X-Received: by 2002:a17:906:2b04:: with SMTP id a4mr52778977ejg.199.1594271988038;
        Wed, 08 Jul 2020 22:19:48 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p4fe931fc.dip0.t-ipconnect.de. [79.233.49.252])
        by smtp.gmail.com with ESMTPSA id i7sm1121770eds.91.2020.07.08.22.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:19:47 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][PATCH 2/2] serf: extend for nativesdk
Date: Thu,  9 Jul 2020 07:19:24 +0200
Message-Id: <20200709051924.4355-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709051924.4355-1-sno@netbsd.org>
References: <20200709051924.4355-1-sno@netbsd.org>

As an unconditionally dependency of subversion, extend serf recipe for
building a nativesdk variant being usable by nativesdk-subversion.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-support/serf/serf_1.3.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index dd4133a45c..6a27f12102 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -30,4 +30,4 @@ EXTRA_OESCONS = " \
                   OPENSSL="${STAGING_EXECPREFIXDIR}" \
                   "
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

