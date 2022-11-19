Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37533C433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:16:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.30668.1668892561765623221
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:16:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qHdfS40S;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id k22so8049531pfd.3
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XhktrNipP9emapGdB8T8mBY+ux9AGiZwldi27OnPVRU=;
        b=qHdfS40SNmidsGWcxwVgTDp3YfdgkPGGIiiKHT0z50zU5ku6obN400F69uw1B2Sdha
         6lA5s0qc5j21lg0FVAYjeAmAGaZqRvuvEePdykGkzqh/GzsL548ltLveZsHOZ+3XDaSZ
         0nSQULzAdtWO7okYvka/Dls6FjZWYC/qTCT463UPllNt+bG6u8hRqLlYMBNHgI/Xl3Kj
         b541tNzHCVXfOhs9R5YNAovAtFwlHuqpOQMMWRTXY3eAb/2thtExoAw7MtHBxDHXPUm2
         HAK0RClGLMYNvD6ei+ULin+Uf6WhLxQowgEHdag62RiE645eijSazyMGP6vwdK3UGphi
         acaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XhktrNipP9emapGdB8T8mBY+ux9AGiZwldi27OnPVRU=;
        b=p3EUbF/AbQys8kEkzkLgLMyHXNMqtPD11DUhZbWCoMDmJQbEpYF4tKRV/UHBoYE9Te
         zg0ghL+DywmJPoSbVxuZkOO+JHKnJDCQdO1Idg1mq5JB8UHWk4k6sCa1W/BcXFkCrhQe
         c+gAdERAZWViv9qdLJMdI5oERNYoogqZotgQ8pRIrDWHBfEMktJjaISlRvjhXZwk3EYv
         3fPZAQVTImYedbWXpgGn3wYM06Adz/i/IVCwERx20EN5CNEeSZE9U4eHT3XkMzcjumT7
         U0mlPao8TssZfXWyVb0nMVF5Ay9vAbbd2A1Vey2yux8lV4ChkORUOV2PawN8O3tcItEN
         ueQA==
X-Gm-Message-State: ANoB5pmFyM4s9drdGVc7fRRe376yNxvTaKPwB2n6+W7Ve5qmmJ3mZzAX
	q1Wmx8yzVy+HkVCd6znQDJTuqOZGnH45eoHjGcg=
X-Google-Smtp-Source: AA0mqf7ylZZfr0TG4AUKWq4CTb7ll7jjy1QcByV39hkIqb6BrD9OMLoUHdcx3jS+ECV1ONZXYcK+Lw==
X-Received: by 2002:aa7:8429:0:b0:556:d001:b830 with SMTP id q9-20020aa78429000000b00556d001b830mr14140108pfn.62.1668892560751;
        Sat, 19 Nov 2022 13:16:00 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:16:00 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/35] gptfdisk: remove warning message from target system
Date: Sat, 19 Nov 2022 11:14:59 -1000
Message-Id: <3ab83b07ba46e184bd49362f226f737caa4868d7.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173560

From: Peter Bergin <peter@berginkonsult.se>

A recent change in libuuid made warning when running
sgdisk. Backport patch from upstream to silent warning.

The warning:
    "Warning! Unable to generate a proper UUID! Creating an improper one as a last
     resort! Windows 7 may crash if you save this partition table!"

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce6491b900e509a776eddaf6bd57251628393fa3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...to-deal-with-minor-change-in-libuuid.patch | 27 +++++++++++++++++++
 meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
new file mode 100644
index 0000000000..f358081092
--- /dev/null
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch
@@ -0,0 +1,27 @@
+From c640d9011a8330ebaad501784fb0ee1ce5e7a5ef Mon Sep 17 00:00:00 2001
+From: Rod Smith <rodsmith@rodsbooks.com>
+Date: Sat, 16 Apr 2022 09:32:04 -0400
+Subject: [PATCH] Updated guid.cc to deal with minor change in libuuid
+
+Upstream-Status: Backport [https://sourceforge.net/p/gptfdisk/code/ci/6a8416cbd12d55f882bb751993b94f72d338d96f/]
+Signed-off-by: Peter Bergin <peter@berginkonsult.se>
+---
+ guid.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/guid.cc b/guid.cc
+index 1e73ab7..d3e4fd5 100644
+--- a/guid.cc
++++ b/guid.cc
+@@ -141,7 +141,7 @@ void GUIDData::Zero(void) {
+ void GUIDData::Randomize(void) {
+    int i, uuidGenerated = 0;
+ 
+-#ifdef _UUID_UUID_H
++#if defined (_UUID_UUID_H) || defined (_UL_LIBUUID_UUID_H)
+    uuid_generate(uuidData);
+    ReverseBytes(&uuidData[0], 4);
+    ReverseBytes(&uuidData[4], 2);
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
index e473b9cd55..2c093c20ae 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
+++ b/meta/recipes-devtools/fdisk/gptfdisk_1.0.9.bb
@@ -9,6 +9,7 @@ DEPENDS = "util-linux"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${PV}/${BP}.tar.gz \
            file://0001-gptcurses-correctly-include-curses.h.patch \
+           file://0001-Updated-guid.cc-to-deal-with-minor-change-in-libuuid.patch \
            "
 SRC_URI[sha256sum] = "dafead2693faeb8e8b97832b23407f6ed5b3219bc1784f482dd855774e2d50c2"
 
-- 
2.25.1


