Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FF5C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:33 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.30344.1641226773238359847
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id v22so30831157qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=ZgVeV/C5N7bcd6/XMvsPIhagRNWVpdi+827nMWWHIcg=;
        b=DtPeCleqx/dxZIBc8DLPG/86YmesdemR1OKgpPbPTm797Y7ARu89eKcZe+odK95AHL
         YWNsPormVT2gsAX8gMsKXMxKzM/oogqpkUcxMrZwwVkhbLiUGxTpqEn1WeApNmB8XIWr
         A3UNNRya2+sdLF82ewvrJWUMfIf+izFgimxay1mupuqKc2LHUsGsjAClBFoSGwVDHir3
         Q58J2FXS967Jls898GJ4mUHL5/plxUyaPggCZtuKHo3yBSMryQOczAuCkay+V/x4aYfC
         VPp5XxJ7crVokeqILsQdIb/K7RG+c3N01ooPID4Vo6EXpk7VWeRX05IenePhxB9P/lRh
         gibw==
X-Gm-Message-State: AOAM532pLwsacNiFiJf5oeGo4UFpucl/LqclssS11Vm+sTmocA0uq1kS
	IcvFiwpZjUuH89Qnt1KtO+JLoUJPA/J5jIqg
X-Google-Smtp-Source: 
 ABdhPJxrM4hGNgCrK5t4jznAjbnXWwNkDWz5T8Lgm4p6PI+PH2stIP631xpvi5cqtxF8295mWo8Avg==
X-Received: by 2002:a05:622a:2c9:: with SMTP id
 a9mr40349122qtx.28.1641226772116;
        Mon, 03 Jan 2022 08:19:32 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 o17sm28874817qkp.89.2022.01.03.08.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:31 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/24] libmicrohttpd: upgrade 0.9.73 -> 0.9.75
Date: Mon,  3 Jan 2022 13:18:39 -0300
Message-Id: <20220103161854.301148-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160126

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../{libmicrohttpd_0.9.73.bb => libmicrohttpd_0.9.75.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libmicrohttpd/{libmicrohttpd_0.9.73.bb => libmicrohttpd_0.9.75.bb} (87%)

diff --git a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
similarity index 87%
rename from meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
rename to meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
index 0b5901bc74..494ccd2ee9 100644
--- a/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.73.bb
+++ b/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb
@@ -7,8 +7,7 @@ SECTION = "net"
 DEPENDS = "file"
 
 SRC_URI = "${GNU_MIRROR}/libmicrohttpd/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "2b15949b1633e4fa487e08cdcc97f0e3"
-SRC_URI[sha256sum] = "a37b2f1b88fd1bfe74109586be463a434d34e773530fc2a74364cfcf734c032e"
+SRC_URI[sha256sum] = "9278907a6f571b391aab9644fd646a5108ed97311ec66f6359cebbedb0a4e3bb"
 
 inherit autotools lib_package pkgconfig gettext
 
-- 
2.34.0


