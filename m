Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B79C46467
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:43:16 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.16183.1672594992468669732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yOpZaOlU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id v23so27820529pju.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0wZUUPDUWwjYB2N26ZiIdWErgkZrc0rOF65snY+qPLo=;
        b=yOpZaOlUBribiubyTYqbHoZtymdIJPY/TX7n+syHoMKs9O22F+XanGHK1hfAoXmrLI
         a4BTRjFNQCFAjxSa6lF4vQ3WT1hyYw19W+yp0wLnCs7YwJNnGBvahZdebbytk1PzvH7D
         YksGZyW9XM8WAbvP3BH8SUbU8Ua5Fp+sf7IFlNPcJyHdBS9iEGB9BAN6pwIcunsNv9vQ
         NN5lYwZD1VCYIsYIVjjHkjJlr6150lUW+hvA8LMhOtF0R+AEHNxz2lVvwKQQnEw2PZDs
         5fb0xApYP216JSUZkYgcVfhwBCTQrm/TvRNhYVHt66RxgjLPaPSF+4ESHHkaLmVQ2yUO
         xIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wZUUPDUWwjYB2N26ZiIdWErgkZrc0rOF65snY+qPLo=;
        b=yze6LIvWSsj6WlQD/oim2y8jNggbzjDOVzBDBxdl3tWWe0W4L/fH8vqb9SQIChuzzq
         KCcE9GvVvUbyftwUgNxS+xYr/iIjHDlkeKAvnzV9WJqAYNWWP+AHZpnq2crI3QD6RXaO
         UU8nvSdSPBSENWVX0R6XEOXstA85VVFScEwDS18wIFSgR4D2zAMAh+KIKmTA0uKYGKHH
         J7tpf7aCLagV1ytscsFF+yEc47YPZswnMaO3faicK3+G+RNWfS63qHKLMxfrR8AzZMgM
         qGgGeUm2EckNCupeSMyYnf/yqOwlXhUB6jrMMkILudryAo0w93RzTN0ZxhuAEauhwWK+
         /iIg==
X-Gm-Message-State: AFqh2kreibdzQd+SPfIL+kpDRvS7FH+nqdc9RDd4Sz2bhzVKZRPP2SVF
	IvZPWakq74Z0l5PKM1pvQQF6Z8JdwMLwpSy8TiE=
X-Google-Smtp-Source: AMrXdXt2mWyI6L++Rdem6BPTpS3e1MxT1e6tHuuXbM4+WoR1FTKRLoGNaWRQDkNpqKajONaw2f0QvA==
X-Received: by 2002:a17:902:e9ca:b0:189:9519:87b6 with SMTP id 10-20020a170902e9ca00b00189951987b6mr40599771plk.5.1672594991504;
        Sun, 01 Jan 2023 09:43:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.43.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:43:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/18] tzdata: update 2022d -> 2022g
Date: Sun,  1 Jan 2023 07:42:28 -1000
Message-Id: <0edfcafbac345116f5d4a76f488c7ac41cbcc594.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672594796.git.steve@sakoman.com>
References: <cover.1672594796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:43:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175230

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2394a481db1b41ad4581e22ba901ac76fa7b3dcd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d3c78e9157..1834665a1e 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022d"
+PV = "2022g"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
-SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
-
+SRC_URI[tzcode.sha256sum] = "9610bb0b9656ff404c361a41f3286da53064b5469d84f00c9cb2314c8614da74"
+SRC_URI[tzdata.sha256sum] = "4491db8281ae94a84d939e427bdd83dc389f26764d27d9a5c52d782c16764478"
-- 
2.25.1


