Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902FCC64ED6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 14:41:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.44243.1676990501292688729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 06:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=STiHgAx8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id s15so1103569pfg.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 06:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALHGg2o4TlmtEmzNzXVL30yOXxTXSO7/vcqj8Kroxt4=;
        b=STiHgAx8yHle/gx08GplqzRvJHqdDoPrWsSfzp40RjZBgRs25gIsLbsx09rR4yOA+m
         73JqxXl42hDbXZh/WBOtK38mch+QY1vR/fF39MLJSFPuaMvHcZNpZFlKesPSle/9UnA5
         ifxbUDMobN2d3r/heJq3jOO7fR5CKV6T24hEAUL8EwumEHK49fQxGSzDNQzFxdk5TXw1
         l3EjgcSnep2d9srFJHDObhNQgLNwCTWXmIjoVDmmvtmWgkg5jwK8DhkL1giMp3g48V2R
         69yBVYl307mXRI3MjjcqNBANcyrV1VaQqkcqabY1gDbw0qgLMsuzIJJSM0pyQkM2w7+K
         oOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALHGg2o4TlmtEmzNzXVL30yOXxTXSO7/vcqj8Kroxt4=;
        b=iqY1rral/isJnNH3UMf921yTOIVblB8E2hGtuSL4EIhk5JCZ5ukoIlaeshocNjoLes
         2FHfWDN6vSrNMRPP5xSKc28S9E+/sDg/gY3mkyXe2IxjMsixHVcJ+yKRAKnEfGYg4QOo
         MePIVzQCGenIFqRu0SHM82IeK//HheO8/kpUl7khtYLocmf6Kfn9xPXoEC7f/hym/7Zn
         DbTbjmjNH4uYYA293YpDEu2KX4fJa7wANGcrth+PYQW4zdfN/5J1qjiR/cIUFfpsDdCr
         4+bYsvSJQnzoIF0FEytdLnJV8PD/mKi9P3PdasJaCyGaBa/SYM+UMSWnWb7seQ3JRxRx
         YLGQ==
X-Gm-Message-State: AO0yUKXaZAdD6h4DxOaIpfIdTobs/DxZltaZFJbOxAbvrbHjfKu3wFjd
	CJYB8YhK5PiBk8hyqUGC5+ZLKn+2PBEiD+5KyPI=
X-Google-Smtp-Source: AK7set/sFyJGSUWjdDumRx5Dc7D6Fx/NHbaKoDyMtWKgfhCVRQRHsY0aABdvWqpZUawbehPcLFFAaA==
X-Received: by 2002:a62:840e:0:b0:5a8:a467:f975 with SMTP id k14-20020a62840e000000b005a8a467f975mr4482725pfd.17.1676990500261;
        Tue, 21 Feb 2023 06:41:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id h5-20020a62b405000000b005ae8e94b0d5sm6151140pfn.107.2023.02.21.06.41.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 06:41:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/23] update-alternatives: fix typos
Date: Tue, 21 Feb 2023 04:40:57 -1000
Message-Id: <6b6f3cfe8995663b31482e70285863266dfd9d80.1676990336.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676990336.git.steve@sakoman.com>
References: <cover.1676990336.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 14:41:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177514

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3ca05b072c152b76a86edaaddebabdef312ea95)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/update-alternatives.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index fc1ffd828c..7581a70439 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -1,5 +1,5 @@
 # This class is used to help the alternatives system which is useful when
-# multiple sources provide same command. You can use update-alternatives
+# multiple sources provide the same command. You can use update-alternatives
 # command directly in your recipe, but in most cases this class simplifies
 # that job.
 #
@@ -29,7 +29,7 @@
 # A non-default link to create for a target
 # ALTERNATIVE_TARGET[name] = "target"
 #
-#   This is the name of the binary as it's been install by do_install
+#   This is the name of the binary as it's been installed by do_install
 #   i.e. ALTERNATIVE_TARGET[sh] = "/bin/bash"
 #
 # A package specific link for a target
@@ -62,7 +62,7 @@ ALTERNATIVE_PRIORITY = "10"
 
 # We need special processing for vardeps because it can not work on
 # modified flag values.  So we aggregate the flags into a new variable
-# and include that vairable in the set.
+# and include that variable in the set.
 UPDALTVARS  = "ALTERNATIVE ALTERNATIVE_LINK_NAME ALTERNATIVE_TARGET ALTERNATIVE_PRIORITY"
 
 PACKAGE_WRITE_DEPS += "virtual/update-alternatives-native"
-- 
2.34.1


