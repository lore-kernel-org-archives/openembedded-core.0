Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBBEC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 21:09:50 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.6192.1752613784726592653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 14:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ej1PUMag;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-748e63d4b05so3570384b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 14:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752613784; x=1753218584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MLoZceKMiCMEUF3zSx3e+kD6cEOL6hK2ZZsJpwaDU0=;
        b=ej1PUMagTP8q64dX4dXzZguhTrDfh2jQwR26Oes/ciB9HkZXrWvfQDKyIyviWGl5XW
         /j5dN++r0maxIQxVZaL3lBYvz4fw31I0SZdVInPJcBIuPb5OBzRtSJ98Q8/gekpPNY01
         vsqyAfrScNUM/T5tmKl3SjdZz5S1L3iY03J05EMPkOBPBH9hFdBPyJjHiDmRAhxxBPxV
         FBuvfBD1a7ILUYL62zlZXcjPucFYJaJ5+oyimwG2Tz6M+2GqaZVztdnXQVzlB1kIr4N+
         QWE2ytsnjkgWi/StKB6NebBBCt8vjYHEG7dUQZAWBy4zJ10PqXmfZmIwToUNQAaSILUt
         L4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752613784; x=1753218584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+MLoZceKMiCMEUF3zSx3e+kD6cEOL6hK2ZZsJpwaDU0=;
        b=cE+lgDzB6Fk6Zy0rn7Dr1cun9RSpV7chA3HunrQKGgFkxjvyu+5k5F8lnAe7sEy/yi
         XHsKGC8eifc2LqBi08IRWBPA/UhmPYFX4robi/OJh5SjCAIyLWXuOKfg/3FMuNoz58fR
         GqW1pLGjbkMIcH0raPOZrsLzVY/vV3In0D7ymQ4tPNU+odl1wy9h339rJP7snCrUlI4I
         0iC7xJhdO1dD8WjTvbWxbC3bNoSntDw8SiTXUxSJ2eRQLEsxyZnK0nsXo1b6/MIQ43sO
         krDPW3VPv0oxGp0qvXm6/5/RMJTxYOcWZjFKASa03JRf8ozUaOL5E50O6FN8uGn95Bux
         lJRg==
X-Gm-Message-State: AOJu0Yzwbk72m2Dkcyh5ndZCjP5cEwpN39us3tOAU5WVes6cMV54Do6K
	MgaPinI7v6Ppz/3fwTXyS6XWkxtpmfGkccyXSB6C/xzDaXLrV4Cv6B05XRZLDOug
X-Gm-Gg: ASbGncsyWV7XjX4rVbNVCavid69XHEavs/dD9K5p0pZLOzmS5x9crcd1O9qSTMvIi0g
	wVf9kuNMmG8Yy2NPlO48n1rBRAqkY0T0Icdtj/MpcmB0Wzg7RJ0vGpT3igKmkIDEt2BIiOTzPSu
	EM8+x756+iOqKowPUSdxHr2zZwvkF1Lf54WyC45gASVjxNDUlhtUTYf3DcqMPyDcOjUamJe799y
	UWcmTQhuBaI4SisXFubIuTPdJ3PMtsqcV4g0g9JWVmoH/95t9JqtRCerdipx/ZG7eIJ65e1w/YI
	Xwe21Z7AAod02axA6i8qDdfk4DvsZKqz+6m1OF40IImr4iej87g/Gk+Vhkt9VzqZnRF4UzB6r6Z
	FUyLLYM0uPSzB/w==
X-Google-Smtp-Source: AGHT+IFDGEokjxnDj9hn9JsmxPzIMDiOCX4zMr68n2erxUHpCbbFZSrXD4aW7PucAxVNtAiPHEKF4g==
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-7572427e405mr71682b3a.20.1752613783642;
        Tue, 15 Jul 2025 14:09:43 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a8d6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f4b3b5sm12745770b3a.123.2025.07.15.14.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 14:09:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] ninja: upgrade 1.13.0 -> 1.13.1
Date: Tue, 15 Jul 2025 14:09:38 -0700
Message-ID: <20250715210939.3226204-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715210939.3226204-1-raj.khem@gmail.com>
References: <20250715210939.3226204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 21:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220428

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/ninja/{ninja_1.13.0.bb => ninja_1.13.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.13.0.bb => ninja_1.13.1.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.0.bb b/meta/recipes-devtools/ninja/ninja_1.13.1.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.13.0.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.1.bb
index a5fa8f1c9e4..dcaa889c047 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.0.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "b4d51f6ed5bed09dd2b70324df0d9cb4ecad2638"
+SRCREV = "79feac0f3e3bc9da9effc586cd5fea41e7550051"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"

