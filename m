Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A1CDC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:35:04 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web09.3331.1645472103882864156
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ht3CIHKA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id z16so9758248pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GeTTQWllqCLdHedbOvY8wg+weIOn3UbUs0gx1P+MBQo=;
        b=ht3CIHKA+o5T5cvIU1iukb9FmuJQW1ByvrnmHD1Tzt2QXDmN5mBc5rxImeFI6htEDg
         9dJThXwJ0lzCAY1mNSJPrqbtKATdVxVchHBqDGJlav0xo2IqX2rBDZL63GwSS3rfbjI2
         vRRgHrazSKmakY5QHYDeC5CPQNQ6RSr9y9qAMazmxhuuqWGHaroZBeaiNTfvlL4vTBaH
         dnyM98xLVnH3MNC3GoB05H/bScU1cF396nSUbaU2vHgfxj1YzoPK6x206/pKx2w7RFCL
         xCtcvbN4FdsW803/+rPwTfxt1ZjmrKoSm+f1BZad3PILuXpz/JTLGc/vR4difYtYm8EU
         CHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GeTTQWllqCLdHedbOvY8wg+weIOn3UbUs0gx1P+MBQo=;
        b=PlOS1aYYnkJ2tR3d2lMIDLtYP7N1TH1Z1fBZ9Ik+TlgeHXmq13UiKrbTD9rHIAy41B
         pre5eP1Qzbn1WKy15U/oEFoy5Uwc5ImPaJHZkMpPJyUxhnazQBXpeuxp9l8eRfsmOXsx
         FbzBHPGc/hk1xZPpwv/JT2xbuSIigvHi4l1U8P0Li257JmeyZlW6ymT6NvYwCZHUMgJJ
         dpOJTwOeqhV9gtOje5HRBaHXto0w9aB9It1FaW9d0xae03vzCaNsiLuYaCmutNxCWr3+
         sL3Zy5F2k8LwUkCm6BX2BNjZiVaT9UeX5WvCf0l6lCJCmcRwrz+6P75lBjEsxmsYVZ71
         C/WQ==
X-Gm-Message-State: AOAM531/7uuEJRYO/8d3+uliNJ/svVdS0iJQBv5vjKhSIORXS7AV5zbI
	7evmrqcw/kGICENDCUe+mf4VkSyYQut28ZMx
X-Google-Smtp-Source: 
 ABdhPJwgwJwvlsd5+SDHe4m5b5qzuFawbtRnwFTZFdC+2iMSR3395UtdIiDqbrGVogt1r9AajcoHPg==
X-Received: by 2002:a63:d711:0:b0:373:d6e7:e78c with SMTP id
 d17-20020a63d711000000b00373d6e7e78cmr13023103pgg.121.1645472102904;
        Mon, 21 Feb 2022 11:35:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s2sm14286657pfk.3.2022.02.21.11.35.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 11:35:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] vim: Upgrade 4269 -> 4134
Date: Mon, 21 Feb 2022 09:34:28 -1000
Message-Id: 
 <f27f15977085dbdf7da28ed8ed60c02ffa009db8.1645465376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645465376.git.steve@sakoman.com>
References: <cover.1645465376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 19:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162074

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License text underwent changes on how to submit Uganda donations, switch from http
to https urls and an update date change but the license itself is unchanged.

Also, add an entry for the top level license file. This is also the vim license
so LICENSE is unchanged but we should monitor it too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d195005e415b0b2d7c8b0b65c0aef888d4d6fc8e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 3d0d83caeb..ff1090bb14 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,8 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS_${PN} = "diffutils"
 
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
2.25.1


