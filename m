Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2AFC433EF
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 14:04:22 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.9553.1646921061993856976
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=L6eHds0R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id s42so5231674pfg.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 06:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ATbxODqz3bHsmPIHpHI203jPSQ2b2M5JsBRQMlvr/+U=;
        b=L6eHds0Rbz/BTQrYS41Isx8mhH0rOdY3gbxNAumuY3jHumNDMWFFrSt8UJf305Jgkp
         5RoR+9zPIKMA1aPHrm7kQfvF6pksSKb++5ul6TJY6VD3QiuTBnfCi+HSK+LkBj+vbJjy
         icTRzBErp7y7lkR+vs63/cMYoD2w4oB8MTZQz6ybPXXAtQpzuxlDfizMkYXPTPdM722A
         1McldgNB70C3r+Mh7c965QuhzFjFFfI5o9arpflkmw3k3ziB50j/O/pzjsS5PCn9RP1z
         aSyH1y/w+BzpMOGEhzUBTUKhl8nGOBc/Y2pXDDtZC5f+S73HwBcCimDuVR+zrQWepBpy
         8FGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ATbxODqz3bHsmPIHpHI203jPSQ2b2M5JsBRQMlvr/+U=;
        b=OBqp1sL0XkRIJwmck0WF0/CJ7VHxwrmK9ns7HWoLIKNkto4Fvoymxb9Vuym4y7Ojk6
         AyJDYvuyb1fgsJhJRjaZC5Ai08M8uWxt9CE+9aZVk8aD1ZArngbJYfztHtsNywsMQS/J
         aSdG0gsD30vO8ISN4ooHZBQlw6q7XodLO735iZFK0vF/VyxE7Tm1xtX8dtaTnvhF1m4I
         WwryEYn8ER410nRCLy9P5M1LLQ2BCnDL7SBjG2EuMRKomsTx64+jfQbRyCWxY6cF6FUc
         90F1ymc17ro6FS0SxR+9jr44AdsZmsvasTgax8bcjBKlt5MOUgI6PmHzBrWUccFcuRyG
         AfGA==
X-Gm-Message-State: AOAM533gJe2DCbsOEd7gAeIs7TjfgYTbJfTVe3G5XXK+45jg98Wv2tKY
	rr3e6heWZfXTfqaGVjPOE6f3f7DpoFUpfvYOcG8=
X-Google-Smtp-Source: 
 ABdhPJyImBCubzLLSKl1QiQo/dDHVdTZAsFqcSJRY+k1eJ0Dtk11p10nU6wboUdoNzDQNkyQY0V6dA==
X-Received: by 2002:a05:6a00:2352:b0:4f7:752d:dd09 with SMTP id
 j18-20020a056a00235200b004f7752ddd09mr3162742pfj.22.1646921061029;
        Thu, 10 Mar 2022 06:04:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004dfc6b023b2sm7291927pfl.41.2022.03.10.06.04.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 06:04:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] vim: Update to 8.2.4524 for further CVE fixes
Date: Thu, 10 Mar 2022 04:04:02 -1000
Message-Id: 
 <b7fa41cda88bffa5345d5b9768774cdf28f62b7b.1646881254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646881254.git.steve@sakoman.com>
References: <cover.1646881254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 14:04:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163025

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes CVE-2022-0696, CVE-2022-0714, CVE-2022-0729.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d29988958e48534a0076307bb2393a3c1309e03)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 838f7b7a53..b3c471225e 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4424"
-SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
+PV .= ".4524"
+SRCREV = "d8f8629b1bf566e1dada7515e9b146c69e5d9757"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


