Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F87C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:21 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.722.1657231218428362294
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BnjsF7yX;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 y14-20020a17090a644e00b001ef775f7118so112242pjm.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SlK1ksdEIE87/W0PZQxVEmkzWaejlpd4kPxut7EDigM=;
        b=BnjsF7yXflirUFv1EiCM3d6Y6u3+JAJfjl/+WDdz4Ehrr0gUhJ64HJzhgFkuGStBiP
         Zw0SFtQqbYjrW+RtuOEqjetnO0WHDs/GWEouDCT29TTO/lvLPjipHhqERZBuzeUn+U+4
         Ic0yO58wNuj6bzzySF0XtUaaGXwlXKXPrar3Rqck9DbXZXfadspBM16X8Qf3oAhkQWR8
         XiWcQMAGZg4W1rixR086ORJd9HWQlcpY9mjuCQGpMvxbMFQBaDMQVQ9fT3OSVNfvZPEy
         UNaiI1Z1UBMjVxctp5KOyvoufXJATP8taaFz6EyyOCJPPevQb8BydWPOOzKvXJgHJjo9
         /nig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SlK1ksdEIE87/W0PZQxVEmkzWaejlpd4kPxut7EDigM=;
        b=EVh9sVWHtlW+9f7/4ryukFHgsGGcCcl9kuMVktYZeznLjBtw1KlG9fcplLHgBLLcHD
         hdVLhY6XzuseXxKQFguwFiKGJBBTE79dbsX6VbQN5O2VHRrffvKSLhvK0Wfop4wVr2ev
         Tu9jy922P/zerEB0lIPl3b/MYxl7r7UA9brbDff06kLQ5ndj3TADLVRo64je4kRhstJL
         1rVuvXjrmm+oNdNk3kwJXjaYw1AeAjMyDWO7baRzT1JPNdP5/JtW9/nlXi2l2Ab9TQpj
         KXMIhs/R56YlsEVR+lgTGdKUBMpIYb6CXvwT5QYxknniYKVZzWH/q2/iiZ78rqtwZb2V
         JmtA==
X-Gm-Message-State: AJIora/zMudKTn7PuUckAhGjdgeFzaG4RJuz+3SLnkC7WyTaN9oSKu5r
	KuokySQTGVFZBKFPLV3gC3NN0oo14kSiQczQ
X-Google-Smtp-Source: 
 AGRyM1uwxB7E1LeMF9EJMRU3ZC/6VBNs0gB6T0OmMENPP5ZlYkfzia1R/Vwoc9zTh3ee6Pod/+AN7w==
X-Received: by 2002:a17:90b:1bcc:b0:1ed:361b:702a with SMTP id
 oa12-20020a17090b1bcc00b001ed361b702amr7871840pjb.1.1657231217400;
        Thu, 07 Jul 2022 15:00:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] packagegroup-core-ssh-dropbear: Add
 openssh-sftp-server recommendation
Date: Thu,  7 Jul 2022 11:59:31 -1000
Message-Id: 
 <93796b2787c410385d3176495e5307327449d2f7.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167807

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Seems sad to have to do this but openssh is moving to use sftp instead
of scp to move files. This means scp from Fedora 36 will no longer be
able to move files to/from a dropbear based image. This breaks a number
of our key QA tests and I suspect will cause users pain too.

The sftp server from openssh is small (200kb uncompressed) and standalone
so adding it to the packagegroup seems to be the best way to preserve user
sanity. If people really don't want it, they can just use dropbear instead
of the packageground.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a98188e83b2c027d99cc38e3367e1ec2a98efbb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
index 5ec3f6c927..5523f874db 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-ssh-dropbear.bb
@@ -4,3 +4,4 @@ PR = "r1"
 inherit packagegroup
 
 RDEPENDS_${PN} = "dropbear"
+RRECOMMENDS_${PN} = "openssh-sftp-server"
-- 
2.25.1


