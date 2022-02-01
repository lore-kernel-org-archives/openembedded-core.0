Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505D3C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.45563.1643700532865576983
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LLhLTrs+;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id
 o30-20020a05600c511e00b0034f4c3186f4so1121464wms.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NBtnJOdatvzKdThAsIYFCF9D5Y1fUEnRkJyMkE1sFHw=;
        b=LLhLTrs+g2ST87s5+Pf2KjOpVdBXZUyuYB3UnSZVdkrdkE9Rm+5OzU0BRUr81LLHGK
         g3115vkBGIwxZbqji0tofeSvmYvfonVe51VI1ANzNEvm/sBAOXcHi4OXWcaJUq4KuSOD
         CAh3zjdQAz8geLx3GifzvOLdJQP60+mWkfU1I2AIPm+k9hX5/LEGS+hkCKjdbnWEccoG
         ryPuWN0B7Huy1dpzFUuz1YBBhrLXVkASwnuaqTND8VK1SZhtu7jwCqSZ10vIY/PBYjju
         9xqak4vY2ReZN5DGaq9VqLGhQN/k36z6UsoES5EeELbpBPSPR3tgxPAob2EBdlfYT89K
         H0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NBtnJOdatvzKdThAsIYFCF9D5Y1fUEnRkJyMkE1sFHw=;
        b=asqk8JuZtiJex54cpHnWhFKVSTfuo/+RIAc7c4l5gRNPQfNG3C+aTpPXyyt02LuU4e
         PJzdTEWHVFSsBUxSuNShjwKwW2uVWgXuBsRdoE0hChTIPe/fBe4w2bCA6OviKAwslUvE
         A2DgE2n6n5JPiR972ruWvB8AgZgxfPuJOgKJribWdiTbuth+P7V4FtLjypqqAAVcwiMO
         KBfKIKyqFXnPWCY+Z9ljMc9wIiwZgdHq65s/8ufu6TfKurxB20Up97RTCQgV9Uff6a+M
         re5efIGLtCW7dgf7Btnrr0GeOiJTgsIObz6mktEIQ6Jp0yjV9bc9mMPrSXDINJACa8hW
         bzfg==
X-Gm-Message-State: AOAM5313jkDC9emP2U2Mly1EcDqqh/iCn0RkQdqaJyaCN8bGXW8wHTGx
	6IarWKNDgdtD1uNYcCiYCUQOCXJkHTs=
X-Google-Smtp-Source: 
 ABdhPJzb7u1qy9oajXcZ53jfmZkOaQNxIQ+2J/6KIDLrwXRqKOyXcSOM1Q8m+aU0I3JEpZYL5QbtoA==
X-Received: by 2002:a05:600c:4e05:: with SMTP id
 b5mr574625wmq.44.1643700531512;
        Mon, 31 Jan 2022 23:28:51 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:51 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 8/8] libcap: Use specific BSD license variant
Date: Tue,  1 Feb 2022 08:28:31 +0100
Message-Id: <20220201072831.34695-8-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161153

From: Joshua Watt <JPEWhacker@gmail.com>

Make the license more accurate by specifying the specific variant of BSD
license instead of the generic one. This helps with SPDX license
attribution as "BSD" is not a valid SPDX license.

(From OE-Core rev: 9e8b2bc55792932e23d3b053b393b7ff88bffd6b)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
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


