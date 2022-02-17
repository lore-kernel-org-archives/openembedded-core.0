Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 170E4C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:02 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1776.1645114201172814509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bah9lsnl;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id u18so10519729edt.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R10cQRbFkAtfvpO+hfoXHLRcBDLE6TGfH11gakAJf0E=;
        b=Bah9lsnlfLLyWBod44EbUaHP0pNZU4fnixNQrGN0XsBY2hq4PRlyS8Pk0tfjE4rJ8a
         hZ/n6/S9BTpMrSqrFGe1JK4fA+hLaS82KCnGVdf+rS94XG1l5mXXWmxLYVf3mhDBKg6N
         wiMK7TsxA/PpjAxXSk3lYflicCzsEUVAdkF36/w3yGX8Ka6Mqi8UmrDRIapxZ4zzN9bf
         EGWTw7hlKpjjpXo39MA9HmlcTtOYE7oIlVElPtYze1PqPA3NNnJHagElMTXJX9E2OjoN
         8MCQKysUdJ9sIPubZMbptdsNTUw6ij1t4A8kzhfjHOD1vMgSRHUaIHJz1XiN1ajmvi/i
         KnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R10cQRbFkAtfvpO+hfoXHLRcBDLE6TGfH11gakAJf0E=;
        b=qnQk0b+R/hqV0QpIlMiV5t13jatboCuKcHlsOGumgYCsl6iR8q/3MVm+nfVgKnXn8H
         xTqNXwh0laGafHJnE2PN+fPaBPHPb7ticsYZiC4zyeV+VeYyqZdMYZ0ze6vsNDYnyJnW
         mRc9XTsAXcvat7k6thQqcglrCi+Id6odIT8q9Nsq4kTSBN46H9aRRBmAXmE/IWjmy/I6
         oHG1sPZNSX0d0RBIyQ15or2UlRFY5Q7D/qnF8palX4wSEp2Au6YU6tIrXqoWG9bQ/IL4
         0mukG78s81rtxRfgdiR22ids2Qq9efmgYIoC9LNFW4LSL0Z2IoJ+aA9c9/CA4bMq2FLo
         DShg==
X-Gm-Message-State: AOAM530mejt9DNz4p6tqdipoOCWbJ+pch2mW0pFLRwZUArjyyHCLBWfU
	jO6vPLqbexax90WQuCbXPMfjQyoOSdk=
X-Google-Smtp-Source: 
 ABdhPJy8+wEr6G8WSc+dpWkh3KMS7nWDfyWXOa8I6Sx7X3OQ+MDLu/g360cC1dWFMGjsdcnljO45kA==
X-Received: by 2002:a50:9d47:0:b0:40f:9d3d:97b6 with SMTP id
 j7-20020a509d47000000b0040f9d3d97b6mr3452240edk.392.1645114199798;
        Thu, 17 Feb 2022 08:09:59 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/28] libgit2: update 1.3.0 -> 1.4.0
Date: Thu, 17 Feb 2022 17:09:23 +0100
Message-Id: <20220217160939.1424397-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161829

License-Update: regex replaced with pcre, overall licensing doesn't change

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgit2/{libgit2_1.3.0.bb => libgit2_1.4.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgit2/{libgit2_1.3.0.bb => libgit2_1.4.0.bb} (79%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.3.0.bb b/meta/recipes-support/libgit2/libgit2_1.4.0.bb
similarity index 79%
rename from meta/recipes-support/libgit2/libgit2_1.3.0.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.0.bb
index de913c780d..4dd32a75cc 100644
--- a/meta/recipes-support/libgit2/libgit2_1.3.0.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.0.bb
@@ -1,12 +1,12 @@
 SUMMARY = "the Git linkable library"
 HOMEPAGE = "http://libgit2.github.com/"
 LICENSE = "GPL-2.0-with-GCC-exception & MIT & openssl"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73fa96e40ce64f79bab087c7e1deeacd"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=main;protocol=https"
-SRCREV = "b7bad55e4bb0a285b073ba5e02b01d3f522fc95d"
+SRCREV = "1d5b9bd86dccc7347aaadf5e3ab122eed9413404"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


