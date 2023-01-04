Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC89FC63797
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:11 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9372.1672830363665812039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c1cP/1h/;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so26125527wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaHyC7Byoih+nGgQyy72SnbCASNOMiCAUKetbyx44SE=;
        b=c1cP/1h/aADahjN3VNU0RKvA8bvpaI7b1deEYFnZqRmmesgh5ohWmd974BFXAMoUE/
         utnbS4FcOqIch34fLBMZFlPSgaUQhF/fTwwb+/EQmp+y32wu1OHaODUyfFd1KbXyb7VD
         OJf+y7778yJS3PfkRH77762nQwemxBk+NG0H7VQriK8huC+lchWTDWzNTM9UPf/gsPQ6
         hFTR/1WBfrMs6jx0UHOt2gyhTvrKRlraO1lRChdbNkuRia9Ey2XADZhmbiqMp9F5m/x9
         lQk9Y7KoXFDbeCnv2ukScnMApzVzYzdfHstTSHD/eM5vP+NkaHuhgvXJE8D3A2s4Y+U0
         UDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaHyC7Byoih+nGgQyy72SnbCASNOMiCAUKetbyx44SE=;
        b=tMFHpzm1ynwj7yTdOtGPxk9B4gptbJ3SttAPgzDqPn0NXQmMhTn9deckGjz72+g4Sr
         VuUcGye78fIQ/34lhqL0X9jYRjx2azS34l5Nt4yLCC5PQ+iyfAwKN2wM3XkAq4d4UwR/
         hJ29oHfcdrMaEtSZFqAz1E3SvQYOgSwMa6AW/pUj4yq9E5eLP43p+Irn1Zaa3haW25lz
         jbyLo1UBhHt9RixWu1MeQjmVuyM92+/XErPktjr5mGGf5FsYGdcXrKhsK+mPH0gcOPBg
         mydatiIOfrFTejpH7cpOSkYy/KLZ+duFbcmYxE/+Kh7qCkB/XDpAkkW7W6PspIaZ6acz
         rTCw==
X-Gm-Message-State: AFqh2koQSvd/ChRlFBOl0MUgbAF09fOEiiWIpzeTR3RRF4kFiqsLq1Tm
	7rJUHcksCyHcWjjaXwJ61NTXGWtN2QE=
X-Google-Smtp-Source: AMrXdXuuvmzeaK/Im8IZmXKYL0g4l39bVxspnUVzteC64bjk1w7JCTRm6dKvFD6f4FWapXpctVpRog==
X-Received: by 2002:a05:600c:5006:b0:3d2:3eda:dd1 with SMTP id n6-20020a05600c500600b003d23eda0dd1mr33828365wmr.17.1672830362103;
        Wed, 04 Jan 2023 03:06:02 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/77] man-pages: upgrade 6.01 -> 6.02
Date: Wed,  4 Jan 2023 12:04:43 +0100
Message-Id: <20230104110548.2537259-12-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175398

License-Update: readme rewritten, set of licenses provided explicitly.

Of those, there's various bsd flavours, gpl2-and-later and gpl-2-only, so add the
latter.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../man-pages/{man-pages_6.01.bb => man-pages_6.02.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/man-pages/{man-pages_6.01.bb => man-pages_6.02.bb} (83%)

diff --git a/meta/recipes-extended/man-pages/man-pages_6.01.bb b/meta/recipes-extended/man-pages/man-pages_6.02.bb
similarity index 83%
rename from meta/recipes-extended/man-pages/man-pages_6.01.bb
rename to meta/recipes-extended/man-pages/man-pages_6.02.bb
index 1ad4ed1317..2e574e1de4 100644
--- a/meta/recipes-extended/man-pages/man-pages_6.01.bb
+++ b/meta/recipes-extended/man-pages/man-pages_6.02.bb
@@ -2,12 +2,12 @@ SUMMARY = "Linux man-pages"
 DESCRIPTION = "The Linux man-pages project documents the Linux kernel and C library interfaces that are employed by user programs"
 SECTION = "console/utils"
 HOMEPAGE = "http://www.kernel.org/pub/linux/docs/man-pages"
-LICENSE = "GPL-2.0-or-later"
+LICENSE = "GPL-2.0-or-later & GPL-2.0-only"
 
-LIC_FILES_CHKSUM = "file://README;md5=bf1faa9b0245e39a7c0c9690ffdf6e54"
+LIC_FILES_CHKSUM = "file://README;md5=26901408d8cfd6f6675f8b49daf9cc74"
 SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "c1e8bea88589f1a80b67dafd82fb98b018ddd7f7bfa594f8f79686258d26e784"
+SRC_URI[sha256sum] = "968def9e7055c9cbca9a4f21f79677b02ac8b0d2fa62ceea7bd8ef4dcc6cac41"
 
 inherit manpages
 
-- 
2.30.2


