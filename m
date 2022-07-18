Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AEAC43334
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:51:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.28268.1658155877588655608
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ruV0aD87;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id e16so10810819pfm.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=30MClMHSIKzPyo7Uemg7gIcwb5ASB7i8xN4gdDU4odk=;
        b=ruV0aD87hjDwpFQTygjhhKgUQnhmAjjOXERba6jG5UjTm6ol4LQyHQhLhnkUAh7QED
         cLuzyg84179ZbPO62ZxdWG+usC4N7wc7VlntMnL3Zq7Z7z/5MYjMpBCRUCdtIqVYBG6N
         IEnACXsdepGh+y4eLqPEZjKZkW6QOD1wyL99jha6rHVe2yhnk9qyes4C7ipSHdCLoMu9
         9jrXKGL5t8zQxUD8GzKoAOnE5ptP1PhGOPsWwiJF2uxbDm8TcWqi2U6pzZQva8VmC5RM
         SYX/Eh7HFqZLjA23ZEFVoiwQ/Fq6PVqg3xni7hAhV0Ql+g82LfK8eryQf8B6uq2BC99M
         D5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=30MClMHSIKzPyo7Uemg7gIcwb5ASB7i8xN4gdDU4odk=;
        b=C37s7bOrPo93/dlOPC+tZ4fMRyO9yUaPd4uI1nRuVs+joOUybai7yaGLTDklc6mGt2
         +U3Iivr9ifk1QJUPM+dV8wwxcregkBrCS/2+yUe6M9qst1j6htPxprmpnjD1pNd8SLR8
         xPLMk4RVssOeOOzJuYYB6HVYPpScvwfJEjXq+Joitv7dhDZvjzdqdMR/jRNZg0F7ZTzP
         wgKrPNZPgMDRVP6UYd7ue0GGV8mHIiflAHzH8es2MRnnsJDgqn/vpL+qHxKAB8Bh8cxZ
         IHEJLxf5SKZ7nkZ3QDxy+Or6LV0lVm7gxOyDbbcd+uPKhz6DPAwNfJZBSNe4Gm+aQD7O
         OxCQ==
X-Gm-Message-State: AJIora+BVek1VfQJ2JMLcxJz2pmr7/YWTqqs8sGg5F44C2kRhk467Ihu
	/FCZcz9kwO36/HdQ1Jqv60jRHgrYteLgsAC9
X-Google-Smtp-Source: 
 AGRyM1uMFujqnk3FJfzJg2jeD6X9FZuGpF+IKGdW1JfkWjf4tj1NfuoZLICeYSIn8sGdiC4KQMxQsg==
X-Received: by 2002:a05:6a00:2446:b0:528:5f22:5b6f with SMTP id
 d6-20020a056a00244600b005285f225b6fmr28824683pfj.73.1658155876557;
        Mon, 18 Jul 2022 07:51:16 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.51.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:51:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 35/35] pulseaudio: add m4-native to DEPENDS
Date: Mon, 18 Jul 2022 04:49:00 -1000
Message-Id: 
 <f1c2e21a28f8ad5dc6ff7b0db877aa22e01a9e00.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658155579.git.steve@sakoman.com>
References: <cover.1658155579.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:51:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168235

From: Ross Burton <ross.burton@arm.com>

Normally m4-native ends up in the sysroot via the toolchain, but if a
non-standard toolchain is used them m4-native may not be installed.

However Pulseaudio explicitly checks for m4 in the meson.build, so add
it to DEPENDS.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ddf846635783923d43520c9dd6f63ca59ed6e3b8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 821ce7d1df..61d5bb00ba 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -61,7 +61,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
 "
 
 # libtool is needed for libltdl, used in module loading.
-DEPENDS = "libatomic-ops libsndfile1 libtool"
+DEPENDS = "m4-native libatomic-ops libsndfile1 libtool"
 # optional
 DEPENDS += "udev alsa-lib glib-2.0"
 DEPENDS += "speexdsp libxml-parser-perl-native libcap"
-- 
2.25.1


