Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5092DC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:19:57 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.13989.1644182396364397306
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:19:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DWEp8QYP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id e3so7552124wra.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+BDxtQLyvc8vbrjAKvazK4iKoO05bRzSk/I0T7DLvKI=;
        b=DWEp8QYPfesu+YdsBc5JDvJPrdCM8RczhjnH5fwOctd4Z7f6/sjsp/f2ojSxG6OMvt
         loke1a9UU+pOycsJeLWH7Le6EErqd5LB2erAG9Pb6PhdxWaqGucc5DWEIx1flXADdqAT
         hnoxQ+DMUnP9YW7HzXKeh3ZYOHwDM4GQurHTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+BDxtQLyvc8vbrjAKvazK4iKoO05bRzSk/I0T7DLvKI=;
        b=GTlDk11BRtn1QJa18x/MfH9QTaSV0b11NU2HLF3bcid1NfM0wdPgrwTBZ7d0lDaNid
         5gSfAuAuSVelgUoN0yrmaqTyvyeQPO2p8FX0YjxgMXlPEF6MMXIj2SsnwmYOWzVip79O
         GL0ror7NP53chVNAgo8ur7RpvlBzbL9SozEppNvMfG0dyMUOMXHifb4IDrsCM0+VFBoB
         pF4cwiHEemCBB6540pvD0kb/C2q85iuGBh9b5e5U14i2judmXQ2hLVimTUJGdGopWJfi
         s7UP/ECV+iS5SS5ZTyIRjtyLLqIB60NdmOcnGgO00xqE9QVcCo3aD7w0IX0btr3QYS2b
         XkCQ==
X-Gm-Message-State: AOAM532peRuJOIv+O7yQJzxiDrSBHQm6A5WZvVJ/JgeBaRPjjhN1+Gbo
	DbrIMgXUGbToVw8C5LM8XelHPfMErLySGA==
X-Google-Smtp-Source: 
 ABdhPJyjyRpok+yo9C+pOY/6JkCm+QI2+qEaU+igP9xfYiN5Z2plipBL39SRXnjjV96XG3B9Alx1Kg==
X-Received: by 2002:a05:6000:1846:: with SMTP id
 c6mr7721722wri.438.1644182394079;
        Sun, 06 Feb 2022 13:19:54 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:aabf:a020:d9fb:13aa])
        by smtp.gmail.com with ESMTPSA id
 u17sm16594281wmq.41.2022.02.06.13.19.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:19:53 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] vim: Upgrade 4269 -> 4134
Date: Sun,  6 Feb 2022 21:19:51 +0000
Message-Id: <20220206211952.2523894-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161411

License text underwent changes on how to submit Uganda donations, switch from http
to https urls and an update date change but the license itself is unchanged.

Also, add an entry for the top level license file. This is also the vim license
so LICENSE is unchanged but we should monitor it too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index f044be504b6..2b45e935c33 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,8 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=909f1394892b7e0f9c2a95306c0c552b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
+                    file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -20,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4269"
-SRCREV = "48a604845e33399893d6bf293e71bcd2a412800d"
+PV .= ".4314"
+SRCREV = "8cbf2499179db39a46e700ab04d0b36e22bcc1bb"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.32.0


