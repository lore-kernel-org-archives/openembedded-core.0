Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1B4C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 07:39:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.124799.1680680377584640128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 00:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OM3iGUSX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id n19-20020a05600c501300b003f064936c3eso595507wmr.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 00:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680680376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6GptB3xT+UNo11ZpnEPZpLD1W2OgWPzFZt4eoFekMY=;
        b=OM3iGUSXio0yjzwXjin9mo5dO+YVEJbp24BvGNqLFS6UPzTwSEirBkMKAO4SxIXj+a
         npxyvRYPV5F0QKbUN619XoPBHAqhZZmTZonvyfqbk8XrNRxHdzx2Pvfyt6ghjWVEAZzG
         ferkYuHQjmrNqffQRPc2lYkobo8apxbsXLpmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680680376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O6GptB3xT+UNo11ZpnEPZpLD1W2OgWPzFZt4eoFekMY=;
        b=3bi62zNvWol1fW+vhtxbeaTxpu5Qqyi0pxNQl7tIqtPwA/sFOF9Twh36JTCb5XMpkI
         /Os08IJIhLZNNNelCA6R+9Bg3pvZRIGHyRQmDrq58NB2i3MrcG/tN+MVDjl+zMdnRdTv
         KpiPfo3iltY6QsSn6S/llkrSrY7s0zIqonNQd7ZgkK0ewZAOqtd8RDeq6nbuJNgkkDfA
         rB6b0oDZvpNUN2HVXNk7u5VK4EkeLiuSMtcT5jXD5AiJcP/bxGHUyXjSuEJWBaYa9PBh
         ZZl5wS2rr3rJeycWfoLlmuPwnMedr0bO2R06n69uvxwLHxaxQvjRiFlYMAoz3rPKpDzv
         3RSQ==
X-Gm-Message-State: AAQBX9d0TbKDYsnZSbwpq3mlEE/22gB5goEwoIqUensydDgPH5qvICB9
	hmxPhf2PfIwb5VRjek8nkyg+nAdlUbqZVl65PxI=
X-Google-Smtp-Source: AKy350Y5l3ufv9SfenW/TTBUnSe88zscxTOc2OL1FIhRhdTaduSETD5fXFA6ww2q7tvSNAVkv7KGAg==
X-Received: by 2002:a7b:cd85:0:b0:3ee:3f7:35aa with SMTP id y5-20020a7bcd85000000b003ee03f735aamr3927887wmj.19.1680680375424;
        Wed, 05 Apr 2023 00:39:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f5bf:59d3:395c:4325])
        by smtp.gmail.com with ESMTPSA id d21-20020a1c7315000000b003ed1f6878a5sm1304789wmb.5.2023.04.05.00.39.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 00:39:34 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xdg-utils: Fix CVE number
Date: Wed,  5 Apr 2023 08:39:33 +0100
Message-Id: <20230405073933.467230-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179725

In the previous commit I somehow mixed up and used an incorrect CVE number.
Use the correct one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xdg-utils/{CVE-2020-27748.patch => CVE-2022-4055.patch}     | 2 +-
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xdg-utils/xdg-utils/{CVE-2020-27748.patch => CVE-2022-4055.patch} (99%)

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
similarity index 99%
rename from meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
rename to meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
index ec3605e1586..b2360301088 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2020-27748.patch
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
@@ -14,7 +14,7 @@ Upstream-Status: Submitted [https://gitlab.freedesktop.org/xdg/xdg-utils/-/issue
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-CVE: CVE-2020-27748
+CVE: CVE-2022-4055
 
 
 Index: xdg-utils-1.1.3/scripts/xdg-email.in
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
index d95bcccd2a5..4d931805354 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.3.bb
@@ -21,7 +21,7 @@ SRC_URI = "https://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
            file://0001-Don-t-build-the-in-script-manual.patch \
            file://1f199813e0eb0246f63b54e9e154970e609575af.patch \
-           file://CVE-2020-27748.patch \
+           file://CVE-2022-4055.patch \
           "
 
 SRC_URI[md5sum] = "902042508b626027a3709d105f0b63ff"
-- 
2.39.2


