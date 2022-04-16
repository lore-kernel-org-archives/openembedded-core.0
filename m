Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD054C636FC
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web12.21683.1650136492790467660
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=C7+oVIDQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id v12so9522381plv.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 12:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7jECRAY97mIRcco6zbUwLMSDQpkJoUxLkVnhypviwlg=;
        b=C7+oVIDQaueaCwx3oLXVtkdqkV199cvH90+q3/nQl4WknrnUBWsA5eKiPBwh6HO6qB
         IszkK5AgREsVZ/gJxBnBLvjx9DsUePI3B39uXmHuOLAgiFH45NlkCebnmvFHUA5ZRVLZ
         cPpgcI5RQE4STokGP2k/iRP4eAvWY68Mdvr2DROwQhztqFPxXlFwje+W8kdF5AggaSd8
         Z/JnL5wqIcafagRVWDcX7NWc1GOn8FdpQgbMk3J8cuKQFO3GYJQV9wjojM4QNwpNpNhy
         XfdrnuLu4xDksDxGxkBAx7ZyouqLuQNcvSfKbkbjnUS4+n8Uv27qX7dbo+Ctrwz2cvRs
         iUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7jECRAY97mIRcco6zbUwLMSDQpkJoUxLkVnhypviwlg=;
        b=qYJ1rZ6fd7aIbiNSqEUJvpyBrh+dBCQmPGhktgiGwguGG4cvS35zv/8FvfMbzsaemr
         b9lWxv3Cp9P2vqYEElC49pK/c/6kzsc0rGZ0b+uTWO1+HQL5Gmu6npdDrvywzFydT71W
         exQfewyqTXalcjMeUpwz7XiILCU37q8QQXA495u9NdyHcx4cWunvgaPKzP0dBtqf4mB1
         lhOAfbcjoEYOHnqok4w49Vl+FztDFCiLkV9qdRIKw9UNVLPhSo7DAmhzJqArbqIR0nHi
         vYzwcvcKkwG5Ei6pR8jpn7mUwTLhLSRSE3YWkCXy53/iph+72C9t4Rb7H2DdfKnk52kP
         zX+w==
X-Gm-Message-State: AOAM533zYNLzI98R5cFAxvWyoECbQ3U2mAlDUdVmz3P7klBkJNGr+dW5
	ps0ZFP2vHKBG77OJZufM7pOp9KXwqt6YuAFDi8I=
X-Google-Smtp-Source: 
 ABdhPJwlo+v5ecKp762fXldpMQGxWFb+Ji+3wDV+DBm8XCfxciCbRIz7oVFS54H0KwdS8VXT1ZBZMg==
X-Received: by 2002:a17:902:e886:b0:158:cefc:c041 with SMTP id
 w6-20020a170902e88600b00158cefcc041mr4658224plg.51.1650136491706;
        Sat, 16 Apr 2022 12:14:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h2-20020a62b402000000b0050a62e582e5sm430004pfn.37.2022.04.16.12.14.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 12:14:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/11] vim: Upgrade 8.2.4524 -> 8.2.4681
Date: Sat, 16 Apr 2022 09:14:19 -1000
Message-Id: 
 <1c68d33f4742df9bcec7d1032dab61d676f86371.1650131192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650131192.git.steve@sakoman.com>
References: <cover.1650131192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164547

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License change is a date in the license file only.

This includes a fix for CVE-2022-0943.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69bc2f37d6ca7fa4823237b45dd698b8debca0a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index b3c471225e..5f01fc3bca 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
+                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4524"
-SRCREV = "d8f8629b1bf566e1dada7515e9b146c69e5d9757"
+PV .= ".4681"
+SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


