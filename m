Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web11.5360.1605279201375364507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mtYjN/FI;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id k7so4653293plk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xvpT3MkqmLnot7jXkomlpATDrPK8vHaZ59+KcVS9rzU=;
        b=mtYjN/FImn7IGIuJusmiFaNOB8WuISzqVLMPW25Q8rogFtCgu+WT9RSo7+LLwZQ9UW
         wCtRpCGrLaHedTltU2EidVD+xHPuHg3ZQSBXrGIKLlIEGMMdmFBmg1DYjBboFX6v+xSu
         440t5sE2u+P6k5LfY2MBb2nx5q4uQNqL9MKuQvjdcFxBsvDEbgRZu0dSIRwZG1B1/f9k
         hHz3FLcoLW1wq1L65jT5jO4vTvbrCwTxzW8Dlj/sJAy1TPtco4DA0rV1mFQhH/9q+cWv
         C2c1OcyYk/K68BSkZsmqoHH8KIWbGFnUZWk/JHAQiTn7vaOciNHE6hUy+Q9i36bEbeHx
         wPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xvpT3MkqmLnot7jXkomlpATDrPK8vHaZ59+KcVS9rzU=;
        b=eHwSG2/2he57wRY19NhhyRQgmoDzZ1wzCD0he05h5ZMRzq9seeUrIIEoAMmsb24gdX
         R9IeaImyEKXNgCDKECh7/FwYsZYrz9eYYuFGcherttAqBgH5T6jywYQeSpA85CQxxsr2
         tGD5PyW/7k9f9PD/RJO/lHXYz6ewu5TncT7T3/XSuytdx7y9Y6lErheCv6QoxomqQHyi
         iEst90WzphF4e/FGKcxatjjt+qV8vqu2jTi4nDs28999+c6IK0wW2r5relZbBMJJhiPI
         qeqsgOK4g7kgBMzxe8nAA3TnQaVfQZ+2x12pSUQHgViAPwMCQnO5xGZZMLEeOfNR23+2
         3LyQ==
X-Gm-Message-State: AOAM532R4NHXyieDe0SqBa5EsWJ/q/yAID3WN2fDGmSjJLIfBO+aXPFM
	9JWZnuOaBS+H9zbWjhuaaMZPRUb9JQP/fPr1
X-Google-Smtp-Source: ABdhPJyg5G6aRCwFYEfAeR+RYQt+z0MjJ0jYJLNNUYtLYAH2AQsPxZqdGW08baXEHpVWRVWly5q1aw==
X-Received: by 2002:a17:902:a9c6:b029:d8:b34e:cca4 with SMTP id b6-20020a170902a9c6b02900d8b34ecca4mr2532395plr.28.1605279200495;
        Fri, 13 Nov 2020 06:53:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.53.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:53:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/18] openssh: whitelist CVE-2014-9278
Date: Fri, 13 Nov 2020 04:52:21 -1000
Message-Id: <0b30695f720d8598dfc77a42a1dabc522c0d3924.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

The OpenSSH server, as used in Fedora and Red Hat Enterprise
Linux 7 and when running in a Kerberos environment, allows remote
authenticated users to log in as another user when they are listed
in the .k5users file of that user, which might bypass intended
authentication requirements that would force a local login.

Whitelist the CVE since this issue is Redhat specific.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 309132e50d23b1e3f15ef8db1a101166b35f7ca4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.4p1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index 720b238e71..676a8a6533 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -27,6 +27,10 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            "
 SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
 
+# This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
+# and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
+CVE_CHECK_WHITELIST += "CVE-2014-9278"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.17.1

