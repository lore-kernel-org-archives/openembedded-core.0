Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2FBC41513
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 19:30:19 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web11.4579.1720553416565067352
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 12:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=k7/2ZDwe;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.182, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3d9bcb47182so235190b6e.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720553416; x=1721158216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9h4ydLAfOMrdo9oypE8ejNYavaUOGBZbH6+QmReoqsM=;
        b=k7/2ZDwe1p62PLEbnN8DxyTcavndd3XoZqRawTN/ofSHhqvII5W0XTkDPfzWLHfLMN
         SirUxpRRCs7xptzIttF5KESsndu6F5V+v2C9jUxp/xC9ySxnPXC5xtCe71PTTEVc8QUF
         JdabRJsw4TXe1GBmlK8rqJxxwLkobaVXaGJ3OAoFtP+FwV+PeY6Qo8XU2c7Z1d/oyeYq
         zOmTla9LCXJ4cNLFKVowHxwU/kB8511eN3Sjzx1I1oyJ46I/RLdtxbAdJ0xq53OD69bL
         jwCfwNWsYT4glq/CboEimgSOUXevVQhGQWUjbw1oEb0E1AS7iAQ1Mds3/zBkf9rq+jS+
         OlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720553416; x=1721158216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9h4ydLAfOMrdo9oypE8ejNYavaUOGBZbH6+QmReoqsM=;
        b=BcEw92g+amIZ/8ftOwXyKFtW2WLa+eW5DEubPrgd9EsvFUbxAQauzyHcSI2qOX4uPX
         5/NvcikHMtDo4m+l1sQm0N94VgfQ4BNeJkrMVQ1VG9Kt2AYGhAXIS9PIBQn3ICyhQcWm
         dPq3oPxmSg9turIn2ZdJ+XXALmaFvCncwOe2TXJy6hn2Alv5s135b8mIrZaWq8mCS9V+
         SRmrlse/6NecxVmEsAiHEYrIchYm/9CPQouk5tLjdLkcO/4c8TUAmIIom0601V2YhoaE
         sBnWQABZRYRSnWP2ZFXhgljSHdcSrT5+WA8YI3IvJNuzatGYdPipUdKOF5ic3DvTBJDq
         8L8Q==
X-Gm-Message-State: AOJu0YxpylEaRwAqrGmtOulDRMMh/zFAkGuwsOZV79v/J/yXLdjjH4xk
	fhtJdT90cV7sBhf+x+0xX+p4EESmqoIGIdNNnF0mQhAIA/0l6YriGy84FKHAqlJ3zDsq4oAquFG
	n
X-Google-Smtp-Source: AGHT+IG18RMpFmz8WfoSK1W5mewxqR9y3Gvt0KqfiR27I8C50ghvbH3Da6623e9he+HG6NUNc91VqA==
X-Received: by 2002:a05:6870:c69d:b0:25e:1711:90e3 with SMTP id 586e51a60fabf-25eae7645c5mr2942468fac.2.1720553415646;
        Tue, 09 Jul 2024 12:30:15 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438995a8sm2282780b3a.10.2024.07.09.12.30.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 12:30:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/7] xz: Update LICENSE variable for xz packages
Date: Tue,  9 Jul 2024 12:30:00 -0700
Message-Id: <d511c41dac048fbdd93a54136e93b0623a18a83d.1720553275.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720553275.git.steve@sakoman.com>
References: <cover.1720553275.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 19:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201680

From: aszh07 <mail2szahir@gmail.com>

Update LICENSE defined for xz packages to match the license
information provided in the xz COPYING file.

The License information from PACKAGERS file of xz mentions
packages with lzma files are in public domain.They ask to
use GPLv2+, if only it's not possible to mention "PD and GPLv2+".

Include PD license with GPLv2 to packages with lzma content:
xz-dev package contains lzma header
xz-doc package contains lzma man pages
xz packages contains lzma binaries

Links: https://github.com/tukaani-project/xz/blob/v5.4.6/COPYING
       https://github.com/tukaani-project/xz/blob/v5.4.6/PACKAGERS

Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e5b955def5d9f305f5aba2c68b73287c03fd163)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/xz_5.4.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/xz/xz_5.4.6.bb b/meta/recipes-extended/xz/xz_5.4.6.bb
index da3b75a10b..3f82e476bf 100644
--- a/meta/recipes-extended/xz/xz_5.4.6.bb
+++ b/meta/recipes-extended/xz/xz_5.4.6.bb
@@ -9,10 +9,10 @@ SECTION = "base"
 # libgnu, which appears to be used for DOS builds. So we're left with
 # GPL-2.0-or-later and PD.
 LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
-LICENSE:${PN} = "GPL-2.0-or-later"
-LICENSE:${PN}-dev = "GPL-2.0-or-later"
+LICENSE:${PN} = "PD & GPL-2.0-or-later"
+LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
-LICENSE:${PN}-doc = "GPL-2.0-or-later"
+LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
 LICENSE:${PN}-dbg = "GPL-2.0-or-later"
 LICENSE:${PN}-locale = "GPL-2.0-or-later"
 LICENSE:liblzma = "PD"
-- 
2.34.1


