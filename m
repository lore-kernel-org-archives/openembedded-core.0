Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63589C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:58 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.4511.1661294208200281254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=G8ladylQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso18646158pjk.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=XEwOobBbqzHGEqGoq/zM61tbT2qzcPUcvn0btHEEEiA=;
        b=G8ladylQvrEkfKCXOslzg242JhPXE6rARQLm4Kc038Im92obVc+I6JWGCMYAd1flZT
         y/czaSF1e/7AruUZhEI+INDAn9lBW0H8HB21TsLMhPRYLzdfbVdvT4BdP6FQkFI89MuJ
         jnFjI6c/I4OPdux3DrCp5gkObNrv8GZyuZwL+F+fc5AM8qfaLeEHvpP33HgXFoBIuxdU
         q94SiVWvo4SFC+T4UPdsRV+oZFFwOTGIqJyInXJtMMOlor+JqkB+KiS58UQD3G1Bld2g
         EE96BvQrsBWmNY7EgiWMthUc05hkEYq0wKyXvxUKPjIKgcj3XFN79TKokEwg0/4gf5Ac
         orBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=XEwOobBbqzHGEqGoq/zM61tbT2qzcPUcvn0btHEEEiA=;
        b=up49PRl4XQXUewOFw3OymJFUJbkSP1bdZi9UT9cB2Kg6Ef4Ql90sZutt+JB03pdmB+
         zNrBXfjbRT06U/jywxYg/3zGuiIOldUyjseQpsZqDUJbwiWJxDrvdtti0O1MGp/lcu6O
         H0Y+vLmdtT9MzsnBZMGWh93aQ/QwYCxOiEHVF7ISK2TKElHUTJ6cm8YvRBGY3xcILGjX
         sQdqC6xFPRJBRteI1LqJAl/1BdPbzSW26Gz1QucfbKFd9bD6+SyYbTVDrqNpCZUXt1Ap
         eaT53Fo+uQ3BPtFfeNswFsvWoW71iqPLXyqmBOjeD/fbam4jSdMDIIoxvMAtQn9gWaYK
         AbjQ==
X-Gm-Message-State: ACgBeo074ofR7OIYlEsRaig8Es4XPsMdDsczVSSgv9SQtLVJzUNuOHiA
	+qlXW1xdXHXUZteBd52pDmeDwCwmIYveTfwO
X-Google-Smtp-Source: 
 AA6agR6aOmv4eM6/8MOdu9Zs5etRWFNKi/8jK+JF5AcAtpeNuDJ3gRaPay3KhdbYyHaStAGexW+3XA==
X-Received: by 2002:a17:903:22d1:b0:172:f11f:de35 with SMTP id
 y17-20020a17090322d100b00172f11fde35mr9112377plg.150.1661294207283;
        Tue, 23 Aug 2022 15:36:47 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/28] packagegroup-self-hosted: update for
 strace
Date: Tue, 23 Aug 2022 12:35:40 -1000
Message-Id: 
 <7709a8c1c1b2dcf05678f1a2a1fd579a95e492f2.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169760

From: Kai Kang <kai.kang@windriver.com>

strace has been set imcompatible with riscv32, so update in
packagegroup-self-hosted.bb accordingly.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d326c561f90666f292d55b029e358c86b765b7c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 9523aadd15..e62567894b 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -98,11 +98,14 @@ RDEPENDS:packagegroup-self-hosted-sdk:append:libc-glibc = "\
     glibc-utils \
     rpcsvc-proto \
     "
+
+STRACE = "strace"
+STRACE:riscv32 = ""
 RDEPENDS:packagegroup-self-hosted-debug = " \
     gdb \
     gdbserver \
     rsync \
-    strace \
+    ${STRACE} \
     tcf-agent"
 
 
-- 
2.25.1


