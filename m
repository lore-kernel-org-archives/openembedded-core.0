Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39417C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:47:19 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.7346.1654699634251795728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SIiR0/L3;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id f65so8890812pgc.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PB5MYfBfqTHbRDkixB+WqsaawMyy69ssq5oQdJvsTbk=;
        b=SIiR0/L387RuYJZk/RZ/bxMhBWkqfXp3mhgCbF8mM7WEt4NGDPCVfe1Ll71QgkV0Ns
         Vnk3mzcFgwRlyoA/t+6oFj+VK4S7A+G4RmaWae1XzkPE1tEc3ig7ffoq+TRQAxfT/Glw
         JV6qIH1VNrfDAIqC1Nrtg4U8v5tgugC5KRy+nRnFhpOeSSLkzLms59ttVrpcW9K2Xp06
         e4f0C1PNh+xJ++dJNObMl5y1oF7ABZN07RqaVt4Kadt7Bk34w0g/JzIuo3heTS7FQ0st
         EpQSZDWd7ePM5vSQbxYC+TfEtyIkH3k5GCra2lzgPNxsAA9bTizte0HXTFSoAZIe2VKe
         xSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PB5MYfBfqTHbRDkixB+WqsaawMyy69ssq5oQdJvsTbk=;
        b=FrHgbjpqwWSIH0O/YFEUHEcHu/huZIqknlo4qP9jmMxZRv9GasqOOBOj3O9pWsNxh0
         em5fRVFqUlQULJU/GPdz+BsxDDg7EnQp6SWIIDCHEPGNfZ1atVnK4ymZLufL6m8gmmii
         dCvX0DTlTEeMUx3mj78kocfBCSBD/WQdR87UnqVNdZGUpmHUxq8Lbsi4hgyTkIhH/dbP
         1b1thc2Qy1TjxEtSyUogA8pj+m9QQv0DSIxmZBJebCr3iwd91OAOuu/WJ+fD3sQ7zfTp
         FMvYzbaScFNUCQD4aEroDm2W9kILlutAM6zFuR8LXmcgcUMv6fbwnpF538eF17mIDnug
         z1Dw==
X-Gm-Message-State: AOAM532gKpIm7n0TCFCDsiTYfEZU2XlwqY1BtjzIC15bgdE1JXcn+dKr
	X5GgsDpHH1pQgKCEnWxAhYQAQ8UTz1VWosIF
X-Google-Smtp-Source: 
 ABdhPJz25ZxX21Aiy5nIpQWscfRxRrgIRgtIH+TrpFQDv5ykATHuNmaIuyhAwBBD7aRdWAIqfND4zA==
X-Received: by 2002:a63:8a44:0:b0:3fc:a9a6:91e with SMTP id
 y65-20020a638a44000000b003fca9a6091emr30347775pgd.296.1654699633196;
        Wed, 08 Jun 2022 07:47:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 bg13-20020a17090b0d8d00b001e08461ceaesm16709701pjb.37.2022.06.08.07.47.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:47:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] libxslt: Mark CVE-2022-29824 as not applying
Date: Wed,  8 Jun 2022 04:46:31 -1000
Message-Id: 
 <9c736c9dcf5f18b8db082a0903be0acb3fbb51c2.1654699348.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654699348.git.steve@sakoman.com>
References: <cover.1654699348.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:47:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166742

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We have libxml2 2.9.10 and we don't link statically against libxml2 anyway
so the CVE doesn't apply to libxslt.

(From OE-Core rev: c6315d8a2a1429a0fb7563b1d6352ceee7bc222c)

Signed-off-by: Omkar Patil <Omkar.Patil@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad63694e6df4f284879f7220962a821f97928eb0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.34.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
index 62afec5755..4755677bec 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.34.bb
@@ -22,6 +22,10 @@ SRC_URI[sha256sum] = "98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ffd55bf926a7
 
 UPSTREAM_CHECK_REGEX = "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
 
+# We have libxml2 2.9.10 and we don't link statically with it anyway
+# so this isn't an issue.
+CVE_CHECK_WHITELIST += "CVE-2022-29824"
+
 S = "${WORKDIR}/libxslt-${PV}"
 
 BINCONFIG = "${bindir}/xslt-config"
-- 
2.25.1


