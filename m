Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978ECC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 21:17:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2081.1643059051431580774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 13:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CbCepZ2l;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so9928wmb.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 13:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=hWItkA1hEBGK9SMa9DMUmcX87aDippEdmrZAAWomq+g=;
        b=CbCepZ2lUskA4Z43PYR8Z1UxKZGVPYn+vK6wDKqFlknpBGoiaBY3BEfceYqISEmpMg
         MQNIAD9QP+NaJsMK93F5gE3Xbfk9w6wPWx4c4gwGG1F7ZXLxYj/SC/QBc4PLe1gJhNWb
         M8+dedFuwC8p/fo6L35QqUkfsKvJxgqHcY5LO+Q1kEYyBHmdKE2F0tbPl1xL5P+FR/Mr
         Uc3lMnXKZBnYjNdRbM4s3a07afi1C+KY91n/r8klJNWTYYFTZOhWSw8Uuj8Kalyb2zl8
         x+YvFMmLxp+ncwE9YNHnDphejPFiQjtwWTW7caJkL7sGKmqdnP8ZashgtR7Fp28KEXQx
         H1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hWItkA1hEBGK9SMa9DMUmcX87aDippEdmrZAAWomq+g=;
        b=m0wMfEQkawQydX1GvIbrk5aB8fhagcUdF6KC/QsnXXbE1c7rlnQaT4ihKy8oLkcAu0
         CAH3/THndOMJDINhhBKEB/jaPSpdYjAMJ5OgYuo+NWlLUKvrCMf4neYAaHmiz6Xw57W1
         UvBFSUsWN8pYTyNEeVYUsQ+jlJ+ksecRXJ7tknmuFc0V3xbCJUViKrvvd6fQDGq+0IKW
         b0IK07wwaxn7V/ZipyHGwgvVtAPAy3zriYQ6Um/eKpG24fAfK814WxiTVVTgKqlHtOku
         hhxINC6NuAku4j2jYrsRrb8Us+v7N1noCBRQQu8/wcO0WjSa5UY4Fx5S/xE02x1wtXDM
         CO1g==
X-Gm-Message-State: AOAM530YLepNiitP353TKRA1aYrnYURhavbEvTUPyJZMUfKqBnJTSbFs
	T+39y61TNhZpVao0tC4mRVyFbna+1fo=
X-Google-Smtp-Source: 
 ABdhPJz3bmmwFKd7xbDSsUUbRXw7I6oMUw6m0AIpftnY3auokxhTPGiG9bzR800jdslbtULs1zAmsA==
X-Received: by 2002:a05:600c:1c1c:: with SMTP id
 j28mr174902wms.138.1643059049854;
        Mon, 24 Jan 2022 13:17:29 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 b2sm7506061wrd.64.2022.01.24.13.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 13:17:29 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][dunfell][PATCH] libcap: Use specific BSD license variant
Date: Mon, 24 Jan 2022 22:17:20 +0100
Message-Id: <20220124211720.33078-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 21:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160902

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 9e8b2bc55792932e23d3b053b393b7ff88bffd6b)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 meta/recipes-support/libcap/libcap_2.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap/libcap_2.32.bb b/meta/recipes-support/libcap/libcap_2.32.bb
index 325fa87a1b..d67babb5e9 100644
--- a/meta/recipes-support/libcap/libcap_2.32.bb
+++ b/meta/recipes-support/libcap/libcap_2.32.bb
@@ -4,7 +4,7 @@ These allow giving various kinds of specific privileges to individual \
 users, without giving them full root permissions."
 HOMEPAGE = "http://sites.google.com/site/fullycapable/"
 # no specific GPL version required
-LICENSE = "BSD | GPLv2"
+LICENSE = "BSD-3-Clause | GPLv2"
 LIC_FILES_CHKSUM = "file://License;md5=3f84fd6f29d453a56514cb7e4ead25f1"
 
 DEPENDS = "hostperl-runtime-native gperf-native"
-- 
2.17.1


