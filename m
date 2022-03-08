Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A6EC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:13:53 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.8397.1646748832004726166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0o0pxL57;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id g1so17457581pfv.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Wpge5l9qf2vi0bvyBpC9tO4Ff09e7vQQ5ugGaWoJvNE=;
        b=0o0pxL57TpBBw7Q2UykeQmUehjNvIyWdHhzmv0xyz3edupZW1WrC5ORCZNE4FCS1l5
         fpsO8BfVH5wQcoPBBPDdI26C4lRakOijznSC1/qx+gx4QUVDEMpj2QJcNz/y8aH+B6If
         eWIiR87sCRGqvGbhyJNBU6JNnUJQ4UMfIcwhOk3xmDBbJQNJ+17+EwSlNZ5szPg+jk1n
         htqc9r6k//BVLA1QxQvmK1qhc130TpIJN2EUAJX2PGvC08eFefAsAjr8EaVQcckx6AfZ
         zSMXQAH1tsL8kR5uWxP24rophDMe4b5ZjM5kvwmxtX0XUw9IJLOmfBJXEhdesk/Dr8bV
         +ZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wpge5l9qf2vi0bvyBpC9tO4Ff09e7vQQ5ugGaWoJvNE=;
        b=KzcX0TFY3gJBI3qxZsDFiDLGInQntuSDvK8nFqHNaxv2JV1vQip4qYNyg5FCjYyYwi
         hqZhixL3yNAZ2hErrg8dgY4+MKHTiOT2G4WYN5YRRg5xLE0Bcg22cKA6QF6J8E0TH2Oz
         sNET4kyTOxTl4BkS5hc/cLUwsK9XHuBdGVa54EuRRsTWZk2dw5zABOW36z6znS6ftmuu
         h7DWJ7NFZ6ghcC9mYupNHJSkz+u59ng3Dg2SaHE7DmxICbyDn+2xqlCzn6EirrzSmK0j
         31b7JTdTFWVZMAoS7qdDgTJh6Nkbvf2kEDI9L0JT9D1DMYiwqW391GcSd5L+gsDkKuum
         RcZA==
X-Gm-Message-State: AOAM533UNGPGGdW+a3chxBJ7YARPYifd+2V+S3gY8GAZFB6SKJVnONdZ
	Tr3IdXGmLhnlUeVHGaoH0sQo3PFeXJtpneN9Rrg=
X-Google-Smtp-Source: 
 ABdhPJwt1wY9ld2FXIx9L4nNm01CAbxLSRz0ZF53EPxGhffi56AZTmXTpf9B6MMrvmQEFjddh4bOaw==
X-Received: by 2002:a63:914b:0:b0:37e:9914:b268 with SMTP id
 l72-20020a63914b000000b0037e9914b268mr14267610pge.85.1646748830976;
        Tue, 08 Mar 2022 06:13:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e21-20020a635455000000b00372badd9063sm15160884pgm.11.2022.03.08.06.13.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 06:13:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] asciidoc: update git repository
Date: Tue,  8 Mar 2022 04:13:30 -1000
Message-Id: 
 <6b899f694ec57bb3c6254d59ac5c51378579c014.1646748150.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646748150.git.steve@sakoman.com>
References: <cover.1646748150.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:13:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162904

From: Ross Burton <ross@burtonini.com>

The asciidoc-py3 repository has been renamed to asciidoc-py.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 62738dc8d9..325ff9aa15 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -8,7 +8,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYRIGHT;md5=029ad5428ba5efa20176b396222d4069"
 
-SRC_URI = "git://github.com/asciidoc/asciidoc-py3;protocol=https;branch=main \
+SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main \
            file://auto-catalogs.patch \
            file://detect-python-version.patch"
 SRCREV = "618f6e6f6b558ed1e5f2588cd60a5a6b4f881ca0"
-- 
2.25.1


