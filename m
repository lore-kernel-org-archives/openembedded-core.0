Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.6479.1601503950364471210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lwMUmo1O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id j19so683615pjl.4
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=IgCUsNRPDr+162r7TDzbfepbDSeUZEylyNVO77W3hvg=;
        b=lwMUmo1OhIVWuynV9Xg60iHFVXg0By8GI453IimfptFSgUjxetpI1L9lYNZ03SgJ3u
         AIyCHlPdnfrniAZsOq4ctSXVs9MgK2ECy5sIH0oZpjgSxJC8Iy55w4a99z8aIbDviHJx
         8CnMdSEFLjPsf4tNDHn0HTYZueWsJxKYZLxxgaGApA7squgNc62cfVk8Cp6eT6+OmKmO
         jiuu60eHbv9QcwLyQOik7tUOQt80+OqCSuv8FS0g+lnStXBubPmIXATcVRKGf09Ro77m
         ZjKcmcDNzDXTBDBQ0/qxvIUNwrTbYbj6URhpGdJRG4RLslZDqL2lwA/6+qZd3bmuRFSn
         IHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=IgCUsNRPDr+162r7TDzbfepbDSeUZEylyNVO77W3hvg=;
        b=iwh82RDkFGQgUFc7j9oAHvIdhnr2HLCbjgsp9mYVK/SStQ40BtMnmRhg7GLo7C1Xax
         PPA7/ugVUv5V3Ku6Diwj+XPHEVUScNETT2HJd39O3EyeNwz1I5jAAwXTTQ2WvzP8f4i9
         s9HK3FaoeFZTXB+ipXHGeQm2BrTz7N5ScG6/T3Wi3bjgAWevCCY6gpJ32UczBd/SaHy7
         VVCJES46qgtYP1BQnsnINie0w+9f1MxG9r4GjpFEcjYzip4wKK08NFjBrubjTin+yNEM
         AxA8z2kWSDU3+s4+3++QBGg4dnic1mNynnIxgVp+zd4ezuOwSgNzm66xhyeic8PTKJOS
         EC9Q==
X-Gm-Message-State: AOAM530hFb8uICCadvfEyBCzUTFzPJmjO+HeWyvWH8bVhYB8TiyvbUYx
	QeqKhaXce5nGGpPwlqZCMm/QiJqo5R4ArQ4P5Wk=
X-Google-Smtp-Source: ABdhPJzNEheYUcYLLcjpYsuzNSR7n06l1g8X5Im+0P89utV3HdE74g+XgRiSFbzrp0VlesVX5Lb/mA==
X-Received: by 2002:a17:90a:c288:: with SMTP id f8mr4291202pjt.123.1601503949530;
        Wed, 30 Sep 2020 15:12:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.12.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:12:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/41] cve-update-db-native: remove unused variable
Date: Wed, 30 Sep 2020 12:11:13 -1000
Message-Id: <e9d24bae963aae93a1ace55c681b2d7de4ea935d.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 790f8a5bfbd1851226fa5fc5b09e79f6396e747d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 73da8ae6a2..0cd3a1c153 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -33,7 +33,6 @@ python do_populate_cve_db() {
 
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     db_dir = os.path.dirname(db_file)
-    json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
     if os.path.exists("{0}-journal".format(db_file)):
         # If a journal is present the last update might have been interrupted. In that case,
-- 
2.17.1

