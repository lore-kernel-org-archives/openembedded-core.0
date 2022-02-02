Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB18C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web12.2281.1643826488631826780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HO7pJsW1;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id u24so355365eds.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ewpstx3ul7uNud0I1bAZYhhFk75Zor0SywQkyHy6Jws=;
        b=HO7pJsW1aFtNkeNZ+n+mJb24HOUF8oBhkdFd+/JA4W73BIBObTnuePX8lBIzNwYGbp
         NJoTIBtAfD1e3oBVZAovaBHn6Df6MbchQO+XRvOswczXFro1kHiH9hNZ/1zjLV1Vzys3
         homEhOi0p4HlNZ0eO8G46RseylPylayVM9LmbIpnJfiF9JDP1Vs1+vR7846Po5PphYib
         9aRD+E/H1/DVdy2WTrbOwt8szI5TMWJSb37/eVIeuYNcltT5rflVSn+PJuqz8BlOvCcC
         d+YTqY4qeZBNuLy7PwTP6ct44Imss0hX8tGtsutIJLFks6RaZSHDMAsJxI7fkreEmRjJ
         OHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ewpstx3ul7uNud0I1bAZYhhFk75Zor0SywQkyHy6Jws=;
        b=q83CUxewFv08AqCiHlBXTvsMnCERziM0OWaEoJPW1guqSviwv6GME8gcDVwNGVrK7q
         zzptzpqN1bFDW0zKL5XQ9KSS8WlOxc3hRPWkdua92pcHQ2PEOKTjzxGmr2TAcJAjJJqg
         nd5i3OkuUNICmXM6Mf8pEPqPOce68+k7mccrrE2mixpTxqvs5qdjAbIs3yrYptZoio8K
         Haq5JTkWRrd5dBcBPJPX+kBBLBptbDCQWr4zXl6DHUmxXcYNqZ28obxam9CNYpuOcfwi
         fv44hgnBSgwRy96o6HlBFiZP8GZto5b241P31XhcYuiTcr7av0QHysfdtdja1V5m82dI
         ugDg==
X-Gm-Message-State: AOAM5336X/rZ+hZ9Un7nJQ/6CJehwGjB38U7RJEH77BLuppSptZLhwaA
	NYG3dVCFH+QCsQ5YA4xjJmWEFLrC41w=
X-Google-Smtp-Source: 
 ABdhPJyZpneGZ4yZOr/VXKWl04fhUW1gg3fVoNJwg3q0FT7YZJFXFRWsQg0J+E0ifWLCrbabFECROQ==
X-Received: by 2002:a05:6402:5147:: with SMTP id
 n7mr31452289edd.2.1643826487219;
        Wed, 02 Feb 2022 10:28:07 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/33] cmake: update 3.22.1 -> 3.22.2
Date: Wed,  2 Feb 2022 19:27:31 +0100
Message-Id: <20220202182758.919991-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161231

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.22.1.bb => cmake-native_3.22.2.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.22.1.bb => cmake_3.22.2.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.22.1.bb => cmake-native_3.22.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.22.1.bb => cmake_3.22.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.22.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.22.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.22.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 628734ac73..9276db3c56 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "0e998229549d7b3f368703d20e248e7ee1f853910d42704aa87918c213ea82c0"
+SRC_URI[sha256sum] = "3c1c478b9650b107d452c5bd545c72e2fad4e37c09b89a1984b9a2f46df6aced"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.22.1.bb b/meta/recipes-devtools/cmake/cmake_3.22.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.22.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.22.2.bb
-- 
2.20.1


