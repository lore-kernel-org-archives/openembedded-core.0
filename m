Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.35531.1607956657431115007
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mQOjadxY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id w6so12190845pfu.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zhSoR79yAKzSJnsSLXOdYIHoT5IO0mE/GI4Lx57xNyo=;
        b=mQOjadxYjs2AC7K9mpycUKnZi5XGHFNJGA632q3F1reDgKT4SGJlhkBm8Er22Mjqn/
         3KWt+jX87nwYN+M2Tnb65FYYsNVgiBl5eRqPIDCQ07ZuxCGDxFbaNd7o7XdpdcASI3uQ
         c22FrKNV0p5jTh2+d9Ejaff4liyK2CorOIzz1VUKt68H7MEj8PWFt82zusVD3607xjwv
         2uaebz7C0Vs9IzdA5oCnGjI2zrt9ZVWHwvsk2A7wWWsepWuLrLjAa7V2ke1su2iJKmkL
         5i33m4zcNwUx3ABOfVYZNq0W1UNNlP/Dl6+7yEIBnxF9TnX1BCu1xHBJWY+m99FxpA4+
         Sdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zhSoR79yAKzSJnsSLXOdYIHoT5IO0mE/GI4Lx57xNyo=;
        b=gpNFydSWHe31UcDVQllJU+MarqeDZZT2GZHHNo/bjS/4b8bv1OgUWz7c5ncR3Sgtbc
         N7FCE/7wScGNofbDEJC6VRQrp4z+sl27ju+qUQnuGXFdWOzgzfJU6sbhw/6TRi9DF3dU
         qurBs6qNIsF8mURNtToY55VvP/nG6Sj0jbxmGs6hjA5B8OwEvYMUBX+XH1scEI8tgjIG
         Rd2VjCAW1frYO/VYRcHsGsEfu3LfHXnBgGA9DbIXhMLxb1rrYkO6K+lvzIxRqeWtTBFp
         DFdu0CrWrBbYjPfEYhjZp+CvoCjcPTkRU+3SK/EHJ19RO9Nq/+yYlrWJ6c7SrtDaTQ2p
         Px9w==
X-Gm-Message-State: AOAM5308UJnx8PQ/jK7F2bJa9h8OKyXQRLvB5Baebqr77m5K8Y4HUc+j
	092TI5DT4uUVNbHLA2LEfwZbrai8NeXIEq26
X-Google-Smtp-Source: ABdhPJzbQlSUSI3jsNiWMjCGz6rG9/Jm/x4w2HB5MjeJWrrtzYBLHMmh/Dju2FwF/pc1z77lyRdD5w==
X-Received: by 2002:a62:4e91:0:b029:19e:53f7:e7f9 with SMTP id c139-20020a624e910000b029019e53f7e7f9mr23645360pfb.45.1607956656464;
        Mon, 14 Dec 2020 06:37:36 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:35 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/25] meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell
Date: Mon, 14 Dec 2020 04:36:39 -1000
Message-Id: <e902026496ea026c4316d1a74265c633db9431b8.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: sangeeta jain <sangeeta.jain@intel.com>

Update command used for cross compilation to include ${CONFIGUREOPTS}
to ensure right arguments are passed for cross compiling on any host.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e995e67bc7a3d30adf9f8d0d2f4df92a941baeae)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/manual/oe-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index fb47c5ec36..4ad524d89b 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -80,7 +80,7 @@
           "expected_results": ""
         },
         "7": {
-          "action": "Run command:./configure && make ",
+          "action": "Run command:./configure ${CONFIGUREOPTS} && make ",
           "expected_results": "Verify that \"matchbox-desktop\" binary file was created successfully under \"src/\" directory "
         },
         "8": {
-- 
2.17.1

