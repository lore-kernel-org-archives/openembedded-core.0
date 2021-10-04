Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105CFC433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 14:21:09 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.10081.1633357267925168853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IBemWh9O;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so87356pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 07:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HG4LuMepw7yvr6fdJH3m40AZXAdPGUR5IY1f4NXEnDg=;
        b=IBemWh9OdUMN2Aspyq8S1j1s3MknrjBBeS0IqYHjvf/Bp1KePrCc1YwzZG+ZvUusv8
         p0LIgC68HwqLHmMai68tSX2wsuZxWxJrXaDqCQeegeEOC4GFQb2AfYM4/LzxNtvJbJ1P
         79Y21Nldj3KeSLh2NrNYw92LSvKID4D/x2mRZ3zfACXv2qa3CXA6J9akO+MVzEzOK+v0
         71XE7hywtBXud2hAv9vBDI/Jqkjs+ge8fvdYKIfNIItFbGZbGZ1XQtUqtVyKgV0N+I3R
         4eiQJPMmFua0Lt5tQfYWrXWDBgPX/jNdzn0MIQYnHUYjECkQ16A2pRnRNZCDEguw5qxT
         hS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HG4LuMepw7yvr6fdJH3m40AZXAdPGUR5IY1f4NXEnDg=;
        b=Hrh6+b/odiO4QXOMAHp9CklLXXMNwq+ELc3gc5rd0ZTVDCol3FjB2cf+IiK46J9sIt
         seva0SOfgEUDFCYZxONRsBewf2qwgDqW0mqyth1/knkeOpjp/4DCmIUh+bh5I3krIz+Z
         TN5qR22KEQDCmY/859pacKOuqTKdcqWz8nKRod0pYOitBz2bFKmOZBOng5st9g8f//lz
         SxyiSRXSX1PP25GKkKDKR0Cp60fif6lVMVLuS1qvMsYsEOeB6t2kf3uCkuZHLRO0WFEA
         GOnyyZU9JG1Ta3ISu6Ja8ictxREhxfocAjzn/7m+SzjiOHLje3tZ/ZlnuHwOcKoXwPtq
         JO5w==
X-Gm-Message-State: AOAM533Af4t1VS0qfP7PlOiifE9WcRshwfHjJnl9TII8WrIRH6OVj0B8
	ae/vQ6Rhb6n27/itBmBXVz1Vo3Z5BOse9jx2v1Y=
X-Google-Smtp-Source: 
 ABdhPJxfSM9zoiWRZSMioUxw7pzlWxtY+uvHfTMiTA5kbO3w3mqkexOTJtb5XWgHpzBPc2UuHdgyTQ==
X-Received: by 2002:a17:90b:3b4c:: with SMTP id
 ot12mr37618744pjb.67.1633357267078;
        Mon, 04 Oct 2021 07:21:07 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 t4sm8313066pfj.13.2021.10.04.07.21.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:21:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/15] mtd-utils: upgrade 2.1.2 -> 2.1.3
Date: Mon,  4 Oct 2021 04:18:32 -1000
Message-Id: 
 <809b3a22a56d794c3ae5f82d4a4a6a5c889ed42e.1633356813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633356813.git.steve@sakoman.com>
References: <cover.1633356813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 14:21:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156597

From: Stefano Babic <sbabic@denx.de>

Drop also --enable-install-tests from configuration options because this
was removed in 2.1.3.

(cherry picked from commit c95c852b84f02f5e2ad5c575ab683bba0471f221)
Signed-off-by: Stefano Babic <sbabic@denx.de>
CC: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 55f05dc8f9..d8355bbad3 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,17 +11,15 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.1.2"
+PV = "2.1.3"
 
-SRCREV = "7b986779342021bda87c04da3bf729718736d8ab"
+SRCREV = "42ea7cd48d2b3c306d59bb6c530d79f8c25bf9f5"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            "
 
 S = "${WORKDIR}/git/"
 
-EXTRA_OECONF += "--enable-install-tests"
-
 # xattr support creates an additional compile-time dependency on acl because
 # the sys/acl.h header is needed. libacl is not needed and thus enabling xattr
 # regardless whether acl is enabled or disabled in the distro should be okay.
-- 
2.25.1


