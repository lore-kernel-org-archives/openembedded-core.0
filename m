Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.12546.1604673417986037295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2020 06:36:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ueybIXu/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 10so1505383pfp.5
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2020 06:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Y6jFcArczmdAcgbsyo6BTmPW4vlWM7oleoLxHYe19QE=;
        b=ueybIXu/u+d9fYHXncWPit5dst4gTooDatncizqO0XhkVUQuz0cJzAO6FWT9EoUEKr
         jpBTfvpYo4bSDqima5BtPY6PuvTF1vMM7e62Fc8aiIazX8oji/xXzZpYYwnND7o7JuaZ
         +6QUMIpsgea2HnZBmcMVyog+ccw1CvOKXtKgaV+W191MzT+HOGo2fzfWqboTdivf8CAq
         TRXCUdQOY6Gvgw0Qxe5yqAESyMurcYKUoDw8BGXhZwe1xTY8gMRQbW0XDVKsI2oMN5lR
         Q268sp2vkaD/I6lnYMS/b918/TzddsdLVHZMZPdqQHlgTsX7f7pv8ZA3qUqXNIcVnY6L
         oWgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Y6jFcArczmdAcgbsyo6BTmPW4vlWM7oleoLxHYe19QE=;
        b=WvZDphHsxcRq8ZIe8MYoeHHVQZtYkEs7ZcAsR/6MR2UmP/ZVilkSTCMLIvwjVoq1xP
         K8aH5uPGpv6MLVcddZg/DGYOONGb6jZHiaQbf2jUKLg8yZJIRU3fwY2M4e16FVdssD+1
         54Jmc977o0epOQIcdl5VhJDpfWZBIr1+LiaP0A6yIiDhue07UDENDscjj3NdiY5qKt/J
         b4kYmbQqV/HYUGyP9SOwdR18W3ioV+H9dmsqZ22VExF4MMfKnZC7J/82fw8Etk2ax2pr
         UG5cYqKMuCftyGmry7yh0MwukZbmRb37uu1VgeoPueQm0B5eISpKOAeOpwUsyfBfbJQe
         KGyg==
X-Gm-Message-State: AOAM531Vam6CxK7mtLqskFdcpBX5STXZo3vv1ZW1umXhQXGx6oC016NI
	GkMRk3ruEWqMGPOYPBo15AW/0Q0EmDXXX+0G
X-Google-Smtp-Source: ABdhPJx0T7ulwqp/B2zTGEsLvTYQdKqqYrNzet6iKESvlu73s88AKTKH4nuMkjEb9XaO7DDvf6lhcw==
X-Received: by 2002:a17:90a:d246:: with SMTP id o6mr2842749pjw.14.1604673417134;
        Fri, 06 Nov 2020 06:36:57 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id jy19sm2765166pjb.9.2020.11.06.06.36.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 06:36:56 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/20] jquery: Upgrade 3.4.1 -> 3.5.0 to fix CVE-2020-11022 and CVE-2020-11023
Date: Fri,  6 Nov 2020 04:35:29 -1000
Message-Id: <555cfcf53acf5e7ebe64874de33fa696670ce18c.1604672839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1604672838.git.steve@sakoman.com>
References: <cover.1604672838.git.steve@sakoman.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Version 3.5.0 is a security release

Reference:
https://blog.jquery.com/2020/04/10/jquery-3-5-0-released/

The primary purpose of the jquery recipe is to make the diffoscope
output from the autobuilder easier to navigate.

Master branch has been using 3.5.X for some time now so this should
be a safe upgrade.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d0f883c4cbdcf722767b437a69002244be4cf8d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../jquery/{jquery_3.4.1.bb => jquery_3.5.0.bb}           | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/jquery/{jquery_3.4.1.bb => jquery_3.5.0.bb} (73%)

diff --git a/meta/recipes-devtools/jquery/jquery_3.4.1.bb b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
similarity index 73%
rename from meta/recipes-devtools/jquery/jquery_3.4.1.bb
rename to meta/recipes-devtools/jquery/jquery_3.5.0.bb
index 1bf6ef5c98..5c6f9cddbe 100644
--- a/meta/recipes-devtools/jquery/jquery_3.4.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.5.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "jQuery is a fast, small, and feature-rich JavaScript library"
 HOMEPAGE = "https://jquery.com/"
 LICENSE = "MIT"
 SECTION = "devel"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;startline=8;endline=10;md5=cdb86f5bda90caec023592d2e768357c"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/${BP}.js;startline=8;endline=10;md5=b1e67ece919e852643f1541a54492d65"
 
 SRC_URI = "\
     https://code.jquery.com/${BP}.js;name=js \
@@ -10,9 +10,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map \
     "
 
-SRC_URI[js.sha256sum] = "5a93a88493aa32aab228bf4571c01207d3b42b0002409a454d404b4d8395bd55"
-SRC_URI[min.sha256sum] = "0925e8ad7bd971391a8b1e98be8e87a6971919eb5b60c196485941c3c1df089a"
-SRC_URI[map.sha256sum] = "8da74aec0fcdd7678a2663b3cc9bafbaf009e6d6929b28bb3dd95bced18206f6"
+SRC_URI[js.sha256sum] = "aff01a147aeccc9b70a5efad1f2362fd709f3316296ec460d94aa7d31decdb37"
+SRC_URI[min.sha256sum] = "c4dccdd9ae25b64078e0c73f273de94f8894d5c99e4741645ece29aeefc9c5a4"
+SRC_URI[map.sha256sum] = "3149351c8cbc3fb230bbf6188617c7ffda77d9e14333f4f5f0aa1aae379df892"
 
 UPSTREAM_CHECK_REGEX = "jquery-(?P<pver>\d+(\.\d+)+)\.js"
 
-- 
2.17.1

