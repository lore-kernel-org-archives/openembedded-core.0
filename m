Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2756DC433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 19:51:49 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.2939.1643917908537109324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=W02TdkkF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id i17so3074648pfq.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 11:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ziZTb+dbzV3S1A1Hi4QoX+bgroZE0kCDbOc9uV4GQrs=;
        b=W02TdkkFzbiCar336IQlPW7ou0L1Fm7FhN3g+RQBICcjhIPhbVKoQp+IuGdQp7soXO
         figMQATI9hdlxkWqULRzPcK23pEKpyKazWWb4DU7+9BBtcufrognyDwA+AnLEnhsoU4l
         mcnWgvAfGT+hXDAW2xUi5BU3oSUKbZsbuHTaLRbn0sIAiutw2+oXMPxQa3/CCJkyn4mU
         sFRDfBqKMTk2MD7JvsjOc8p+GARkttf4lAyKULc0kNIvEgDJOgZuzoTaTc1UXIb+Rk5D
         gzNLI1r6J/lK4i8++UyPQSPVgZy5FyiIHbCxP+R7gRA83kmszM9X+M4VMw3POjMOk4Wv
         5Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ziZTb+dbzV3S1A1Hi4QoX+bgroZE0kCDbOc9uV4GQrs=;
        b=L7LodkIwXoodc4r0ZJ98cV/0LtU1irxEuAvbRzBmm3N+oVy41OwkrRPz2reAE3AFfC
         dUFFbPfat0MzdVmOvWAwDqrbOYeWMmSU2vYbETE/h0iDXj8aGAU+6DYmlvXxdLfci+nL
         0EidxD305vClO/Fab/ss144YoJaZUU3PUGA/KttNOGE3W/teEmVUS845+W25Bqi8d4/x
         IZALa5oGECJ5pMFV2H6I5kTlIhQAl1+2KUzkMfs4Ltjbvs6erdZ1OUApQ4c2tUwkhC9R
         CJGHZTOzndU9pPqh88WVMSqHLhpNZ1n2PMGAoKPVpxkrp5neXn9pQ5TmxHO0+wJnXqRZ
         Noug==
X-Gm-Message-State: AOAM533ESaoLGdNmy4crW18fpF91mnveUWPC4GPwwJstpNJYR/kPpPqy
	OCw0l+OhUXzjzdQR6GfMdTKXqldoetChinr3
X-Google-Smtp-Source: 
 ABdhPJwtuVhuuyGfFvvRLt0P+RLr0zAqCSU3nIx9X67PHbA8YxPCZNfPd9hn472u3bB0LxOxQyS0/Q==
X-Received: by 2002:aa7:9acb:: with SMTP id x11mr34860018pfp.82.1643917907535;
        Thu, 03 Feb 2022 11:51:47 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s4sm27762216pgg.80.2022.02.03.11.51.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 11:51:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/20] libusb1: correct SRC_URI
Date: Thu,  3 Feb 2022 09:50:44 -1000
Message-Id: 
 <0dee7ab265d0c02bb63f17db10a3c246a37297c2.1643917717.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643917717.git.steve@sakoman.com>
References: <cover.1643917717.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 19:51:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161315

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d4c37ca1f1e97d53045521e9894dc9ed5b1c22a1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libusb/libusb1_1.0.22.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.22.bb b/meta/recipes-support/libusb/libusb1_1.0.22.bb
index a4fe4de2cb..ffa8f0320c 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.22.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Userspace library to access USB (version 1.0)"
 DESCRIPTION = "A cross-platform library to access USB devices from Linux, \
 macOS, Windows, OpenBSD/NetBSD, Haiku and Solaris userspace."
-HOMEPAGE = "http://libusb.sf.net"
+HOMEPAGE = "https://libusb.info"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
 
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://no-dll.patch \
            file://run-ptest \
           "
-- 
2.25.1


