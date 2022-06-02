Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5FDCCA473
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:37 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web09.2156.1654137092637237558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gyeWteKF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso8042755pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gOfpiPAFqkaKAg5BUsR9grZdplXKXZSKXUXL2vIVFTM=;
        b=gyeWteKFN0q5IcBcuSy5Q/bRsqXwJdUcbgQRB2HFwHF9AfhTOMMLLqctWXR6FESIpu
         uT4RfAR7iZ+QIPLoBvU5GFAGVrdgBCJlXR3fv5dbh2O55ITXRBBzL4leN9tBL3dkZSlG
         a0OqHmMjt++P0MkoPNKEs9NGGRiHGLwwSwiBjFTAT5W3J78ydUg0obSyZ5vAraAB503C
         CroRHq7SIhyP7lzSKeW933WD5S82AXb6rjnoXU1bnB9gkBxeOf2hFHZF7xKkHU+C52dQ
         voTs6RbvB1vHrGjVgQomW12iwwuJkCcCYImeNpZRJguNpSFGdXagnUyvajCN8GCufDG0
         I9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gOfpiPAFqkaKAg5BUsR9grZdplXKXZSKXUXL2vIVFTM=;
        b=gW9gs57k27eV1Vr3PN1idYsDv/I7dgKljhBOjvLzeeax3M0gkBLtq3Ic7aCZpX6pBO
         eZEIWpvMcaZwU/xwKWSYbedY1W7b7/dS7JAWHI9gRBvhTLdiGCj7fdCd6vaAtyJs5sFh
         55STgekuuGxYam7wgR7jbdAVrg7PSYB96MMkKneIJIcCoSgi4/HxwKuY+wcqt+acwdHC
         ox+wH8b2JDJZnJ0I6xswfNUbgQ+fWocIegdJDbDkQklQ9ZDuRNPUx3B+wynyr23oTMh5
         cLwn3aCWSRd7hb9Gyw2iHGuiAqSJA9uVz4t1Mt5EZjFoPgOEVS6eEyWI0XXXR7B03caU
         z/mw==
X-Gm-Message-State: AOAM531rpExjBqqcHS+TjTi6rs5+v9ECqxDVzGLwkm0fVndSGRWth63n
	LEMNvgO9pgItIAEAC5Gss68cDRy/CvUW3ldg
X-Google-Smtp-Source: 
 ABdhPJxWun+dxHWjcyQvIlU9QYwWSyL+0Ia5TZMfYHJrIOGVPoXpJ710PWjjYmOv1tW84gbBp1tkmw==
X-Received: by 2002:a17:90b:503:b0:1e2:f129:5135 with SMTP id
 r3-20020a17090b050300b001e2f1295135mr2659059pjz.22.1654137091522;
        Wed, 01 Jun 2022 19:31:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] vim: Upgrade 8.2.4912 -> 8.2.5034 to fix 9
 CVEs
Date: Wed,  1 Jun 2022 16:30:47 -1000
Message-Id: 
 <cd259a00503af360524f58c9cea51aa142dee250.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166455

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Address CVE-2022-1621, CVE-2022-1629, CVE-2022-1674, CVE-2022-1733, CVE-2022-1735
CVE-2022-1769, CVE-2022-1771, CVE-2022-1785, CVE-2022-1796

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fafce97bd440150ac5c586b53b887ee70a5b66bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 4b8f4d1dfb..9d918379b4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4912"
-SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
+PV .= ".5034"
+SRCREV = "5a6ec10cc80ab02eeff644ab19b82312630ea855"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


