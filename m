Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3F6C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Apr 2022 16:02:39 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web12.12076.1651248154608851539
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1q1Tw4Tr;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id s14so7512521plk.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Apr 2022 09:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ImgRqEdWIE+hk5SE1NRcTf1O7a2mQk1YxM+tcDLMcBo=;
        b=1q1Tw4TranI9kPn2yIHGpb/tHAdiyCE9hqsTbXIWM+fcM7J4QASKTeaqGFVqhnrwyD
         rluXj5cCU2snXmqa0aO0omlr9T+FhoD+uBL3+QQJdXdqJ4++w5qNBRHNC6153cn5dX03
         qbb1iRlZLCsAPZbSXSEHvpsqBtvhFNQqX+m/LcDwMFLEkuAxGbdgHBFn0zK+33cSt5DS
         A3+myZyUXu5gm1jcmJ+QB63DLu9tER66VdJJMYkPGI2Ji5RuQb8f2tvQSI6gwxHYzMPM
         RhhoNkjZCTa4Vm8PQAGrtq8PKCrRFz51VrNrTmPtGr6oK0dacJia9O7fzFSC9khdhPtb
         XQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ImgRqEdWIE+hk5SE1NRcTf1O7a2mQk1YxM+tcDLMcBo=;
        b=dmzFbv7V6Vis/G3OgMdK5YYeFobjk0LbXAoVEY2Xgb5BFE0rYgCo15kk3uZpopqlLE
         GyQDfhAmGbFHfUUR9xR9NR9g+hYMg1RUowa3bFVI7eHBrIMzNVPVrUVi64njXakNEuTm
         ObkAojUeUwZr76w0xWheaK57X4fcWKS4Ve+P8k8w8qVvLjImxNav/yre71eZuQ83Hhhv
         f1CxNZD0qF6X3N/foun4CWwmYM/XL1+bgwc7xHSdQtpUaMTk8OQhrlTOtyd0gYhgLSb2
         K/e3tyz7TwwOcOJsVFk220UWIp0OlhC8gFFE2j+J9rLaKS1vs9XvkZonuZQ53U4KKc8C
         m2Ug==
X-Gm-Message-State: AOAM5335PUtAr5GE5wHMNaty2jSADIsgo/zlZcvm3mwGFB58t242DZfa
	H9txXWHDBCCU04KzEQ/fjPaU+hS3ztfRgpx2faM=
X-Google-Smtp-Source: 
 ABdhPJzn39PgVFOHIpevCoHwX8fRBEx9u3aiJHsY2tqlTCbsdBdWvBbKXiNkfmiKCem3nnVd69/Yuw==
X-Received: by 2002:a17:903:2352:b0:15d:5c2f:85ab with SMTP id
 c18-20020a170903235200b0015d5c2f85abmr85225plh.47.1651248153325;
        Fri, 29 Apr 2022 09:02:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i3-20020a056a00224300b0050d32f838e1sm3486125pfu.21.2022.04.29.09.02.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 09:02:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 29/34] bitbake.conf: mark all directories as safe
 for git to read
Date: Fri, 29 Apr 2022 06:00:48 -1000
Message-Id: 
 <204cc2fdd75631ab0a84a3a090f5cd7dcfc13856.1651246310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651246310.git.steve@sakoman.com>
References: <cover.1651246310.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Apr 2022 16:02:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165048

From: Ross Burton <ross.burton@arm.com>

Recent git releases containing [1] have an ownership check when opening
repositories, and refuse to open a repository if it is owned by a
different user.

This breaks any use of git in do_install, as that is executed by the
(fake) root user. Whilst not common, this does happen.

Setting the git configuration safe.directories=* disables this check, so
that git is usable in fakeroot tasks.  This can be set globally via the
internal environment variable GIT_CONFIG_PARAMETERS, we can't use
GIT_CONFIG_*_KEY/VALUE as that isn't present in all the releases which
have the ownership check.

We already set GIT_CEILING_DIRECTORIES to ensure that git doesn't
recurse up out of the work directory, so this isn't a security issue.

[1] https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bed8e6993e7297bdcd68940aa0d47ef47120117)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0e939aca4f..1deba8d910 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -776,10 +776,18 @@ export PKG_CONFIG_DISABLE_UNINSTALLED = "yes"
 export PKG_CONFIG_SYSTEM_LIBRARY_PATH = "${base_libdir}:${libdir}"
 export PKG_CONFIG_SYSTEM_INCLUDE_PATH = "${includedir}"
 
+# Git configuration
+
 # Don't allow git to chdir up past WORKDIR so that it doesn't detect the OE
 # repository when building a recipe
 export GIT_CEILING_DIRECTORIES = "${WORKDIR}"
 
+# Treat all directories are safe, as during fakeroot tasks git will run as
+# root so recent git releases (eg 2.30.3) will refuse to work on repositories. See
+# https://github.com/git/git/commit/8959555cee7ec045958f9b6dd62e541affb7e7d9 for
+# further details.
+export GIT_CONFIG_PARAMETERS="'safe.directory=*'"
+
 ###
 ### Config file processing
 ###
-- 
2.25.1


