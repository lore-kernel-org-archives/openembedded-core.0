Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBFEC3DA71
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 19:21:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.143556.1671132075378625050
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 11:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GdZE+MRJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id 17so58583pll.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJDw9J7cX0VT/icCCQr6rlXNN++e6HZG1Uz1MFdPeuI=;
        b=GdZE+MRJPcpt+0PL16CmPjr06IxUxj9kd8XsKgL9/kwheniMGnqUFStBjpAczhtv13
         ytgtdBVxH1mWkInxnw4Vmgaen6rypRbxVa1JIz85gWexd6gTeyirMNMmMtptPCaJG+R9
         97fQ3QeQzo+g0/JAWJpLNEz02WbaNj3dn1WI4d+2W27V3cDiaBVTjQ98p6SeE4LGUqg8
         UJFywoLEOB6uZA/DzPQ7OMkIi4aRt6TDp7jTvgFhsI8SmQ7ZqQgr8AVigMSJc760P2SM
         vcSkuwOY9I3YRvVJZvAlQ9kKcFK7GeYu2YlpaUSGOIEpUJ7EU4+uGJEeWYuy4XIy1Yos
         1fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJDw9J7cX0VT/icCCQr6rlXNN++e6HZG1Uz1MFdPeuI=;
        b=7JnQ/EaKJvNbd67/Aj3DQSUMhnuPZsuS7mM3mCQ95OyBVTr9xd51q4lisDT46RxWOf
         93sj72qUb5ArSGAkqFKzAUeEKno0bgzAxgV1TcMd7XEyngwch2btiEr3NMJKh+fUI274
         3UoPgAwktxoe/6w1w+rZgVEmsb97ePbhm3P965Jv5ZBvR8T+iBIwU6MCwaTZJXi9IjTY
         1HczqzuWLtrdEQJDPhgUcb49sbF9o6mDaAkFIBHE3LsCYjcAOC4P04Dl/FyJ1h4K2eR9
         9/NHyZm9cX2AJdqIGmzBBCWHjJfabJUGqEsaqLaH1KOOzkc1cy3Pws1b0wEq6nVkdzvU
         XXbA==
X-Gm-Message-State: ANoB5pkkcZEvDAdhaKtgF5jCgArcrPt1CSbnGVFT7JFvxdow896gJfij
	b545GCv7TulBgto23J3zF04mXeGBlijLfi8NFaE=
X-Google-Smtp-Source: AA0mqf6p4rhcO788cTHT6rtV62E6ptjVbvSNbL6ZTb2Iwtzw/vj3a2nt9L3QB9i21Am0ctZbifXCcw==
X-Received: by 2002:a05:6a20:9c8f:b0:9d:efbf:6623 with SMTP id mj15-20020a056a209c8f00b0009defbf6623mr21622593pzb.49.1671132074379;
        Thu, 15 Dec 2022 11:21:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r19-20020a170902c61300b001869b988d93sm4167095plr.187.2022.12.15.11.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:21:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/30] mpfr: upgrade 4.1.0 -> 4.1.1
Date: Thu, 15 Dec 2022 09:20:31 -1000
Message-Id: <1e65bfb5806c56e6ebb9244a5a71069ae2dbb498.1671122751.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1671122751.git.steve@sakoman.com>
References: <cover.1671122751.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 19:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174599

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Bug fixes (see <https://www.mpfr.org/mpfr-4.1.0/#fixed> and/or the
  ChangeLog file), in particular for macros implementing functions.
- Improved manual formatting.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f733eddc428cf9537f97cb91025b73dd1fdea932)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/mpfr/{mpfr_4.1.0.bb => mpfr_4.1.1.bb} (91%)

diff --git a/meta/recipes-support/mpfr/mpfr_4.1.0.bb b/meta/recipes-support/mpfr/mpfr_4.1.1.bb
similarity index 91%
rename from meta/recipes-support/mpfr/mpfr_4.1.0.bb
rename to meta/recipes-support/mpfr/mpfr_4.1.1.bb
index 2121dad57c..f531a88961 100644
--- a/meta/recipes-support/mpfr/mpfr_4.1.0.bb
+++ b/meta/recipes-support/mpfr/mpfr_4.1.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 DEPENDS = "gmp autoconf-archive"
 
 SRC_URI = "https://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f"
+SRC_URI[sha256sum] = "ffd195bd567dbaffc3b98b23fd00aad0537680c9896171e44fe3ff79e28ac33d"
 
 UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
 
-- 
2.25.1


