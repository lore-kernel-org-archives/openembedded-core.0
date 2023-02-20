Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F02C64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 14:19:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.14070.1676902740565416587
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 06:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=c4PAcmjo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id 16so601748pfl.8
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 06:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/GbpV/WkgmscLg5aTSZqmWmY58gYR6HVorkrMMpgIMQ=;
        b=c4PAcmjotnCT9AzGZ3sNnv5dPfEYq6DvcGBs9M/QdYb/dwglu8f6c4xVYHRml8lp6l
         l+MYm2j/Tykysyswp6Pfmlzh0iwnnr7fPkID4BHRN0BcU/aSB/6LyrHag00I0otti6fg
         pOWKLom2QkKRmjmuKNwnj6CHfVRhZoxewq+iH/VFfopoJRnsM2iUtvfsxBv7GhRme02G
         ZNcTmWvqIXyMrNiBtX703N73SyzQBE/zHMBEakVMaH3de99lzto8T7gejL/wx4na1N6P
         DLFejnHwSlh9+BNGTcMvnnxDUIDaSSOnHt1u+sLwpu4W8pRxrbpPcL4TOHd1DEpT2aWo
         gHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/GbpV/WkgmscLg5aTSZqmWmY58gYR6HVorkrMMpgIMQ=;
        b=NW3ZPWSG3DRxU8fHsOQ5IyvTlwEuDUKmcjDwbP2mkgQfVZZixMu5rrZdA/d77J2hz6
         4OLDJK3CZ40l/XLRbCE5JODvgiahZoyUr5FPqA1Cz31C8549BWsd4EBx7ZU/RerZEwvp
         oCeT7sPCMaA+LrL9EeJaWFLduD24eVYPF5AcfMD8nYzXlin3LikjO5c7B3de5VDmiqVs
         AnfmmM8GGK08xaBx1lOa5UhM64gTNCCtK/6R0CEJ9cU7u7JRGqb4MfbYit2qFw2msZck
         sFtv4FhCGO+Nuf37IN/c2+Ij5iPwzDf5Qaza4D0QSH7nz/MFbtoHV6bSmI83ZjGM1igG
         4WIQ==
X-Gm-Message-State: AO0yUKV32AaQFEeWuHBD1Q6RSizIBr9VLqoKo/I6EQvwPDc1wwrYMc3O
	ehLQdoKkdtL2h372jvYrFI6faWoopepZ7NRWuLM=
X-Google-Smtp-Source: AK7set9N3H45kTTVzo/vnPDmwqKb5mC8BTu0STMtIqjitohYAAA+ANw5kfjhdZki1OG3FehpjKJYFQ==
X-Received: by 2002:aa7:95a4:0:b0:5a8:c6c1:c9ae with SMTP id a4-20020aa795a4000000b005a8c6c1c9aemr1283125pfk.30.1676902739592;
        Mon, 20 Feb 2023 06:18:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id q19-20020a62e113000000b0058baf8694e1sm7789297pfh.71.2023.02.20.06.18.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 06:18:59 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/22] libgit2: upgrade 1.5.0 -> 1.5.1
Date: Mon, 20 Feb 2023 04:18:19 -1000
Message-Id: <63cb8eb147088ae171ffa2b6005410742e50e4e6.1676902605.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676902605.git.steve@sakoman.com>
References: <cover.1676902605.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 14:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177418

From: Alexander Kanavin <alex.kanavin@gmail.com>

Fixes:

libgit2, when compiled using the optional, included libssh2 backend, fails to verify SSH keys by default.

Description:

When using an SSH remote with the optional, included libssh2 backend, libgit2 does not perform certificate checking by default. Prior versions of libgit2 require the caller to set the certificate_check field of libgit2's git_remote_callbacks structure - if a certificate check callback is not set, libgit2 does not perform any certificate checking. This means that by default - without configuring a certificate check callback, clients will not perform validation on the server SSH keys and may be subject to a man-in-the-middle attack.
Beginning in libgit2 v1.4.5 and v1.5.1, libgit2 will now perform host key checking by default. Users can still override the default behavior using the certificate_check function.
The libgit2 security team would like to thank the Julia and Rust security teams for responsibly disclosing this vulnerability and assisting with fixing the vulnerability.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f59486310cf33c586671a16cf52862c19c3c4c31)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.5.0.bb => libgit2_1.5.1.bb} (78%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.5.0.bb b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
similarity index 78%
rename from meta/recipes-support/libgit2/libgit2_1.5.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.5.1.bb
index ee4d79b11a..59866ce385 100644
--- a/meta/recipes-support/libgit2/libgit2_1.5.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.5.1.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=112e6bb421dea73cd41de09e777f2d2c"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
-SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "fbea439d4b6fc91c6b619d01b85ab3b7746e4c19"
+SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.5;protocol=https"
+SRCREV = "42e5db98b963ae503229c63e44e06e439df50e56"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


