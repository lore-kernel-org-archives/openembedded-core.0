Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.5870.1622797840832219486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TzAqfOFO;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id g18so8298757edq.8
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iB0Gq8Hai65O7J3iCx+J3AFKqy5CMeVTM4putSjgNxs=;
        b=TzAqfOFOnQLI5hEaHAl6jZv/QXk4smtz84aQMVMf0uyr0Gy/Kobx3MEQ7NW+5YQeM9
         VXuTBv4gTSVsWp9VUxFW0MG8FiqfyVbapUP1jOpPIuUwwMXc6KBJcq3EKlBdqYEmjpbd
         9/QO7WRQYFdRckKId7PVapLDJgEcMiYShjcYcxQtjYDEfH8r5l6F2QYRT3pWT3wkUN70
         VthXtfvZqv3YVOWUcKRG6DQK1F8sV+RViCau9BZpnx1ISiBKAULvvfNwSu9wdr0qTij2
         8P9IQBw5bsqZiEnNtYOrH1j9jFgTE1wDma2K1ned0XjC7xp+yuzStsSbk/C3CPWN9LcU
         N8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iB0Gq8Hai65O7J3iCx+J3AFKqy5CMeVTM4putSjgNxs=;
        b=CBX4ImFHxZi/dCmQ7COIYWepteVYlxt2iWp+V2qYWvQORSlzFYE6vtpoQlwKso5zI7
         Oc2oMck+ws/5MSdnGobUsh/5zlyvIr3ebNwk13DR2PxRpJZft/acvmCJXLKRiFlkzKoF
         Qj8hSbXy0n1Q1OHlI6joVFXP4p+o84cInGMIzODxwwlM28xM8d+j6n40gGqm/E16hinS
         j8FlAxHOVW6+B/CIDLLAqk+fPvqY3PG9ZXT5wyrlsGRk4bUdY39w/LsaVoW5/OCowoHp
         ePFv7ZE+IMf515Mk/7rQdddjzKQ7GSCA12XWberEocP98EamFPCc3Qz1Z/Ujsw4D3+kI
         PviQ==
X-Gm-Message-State: AOAM532P3BIc8lHf5JQt9mZ7OSHpMFtMpwDKlM6mLEc7YPrhaP6vupXd
	vwjWZdzNZkqFkEqAT5rw/q9wR4BPHi2tVw==
X-Google-Smtp-Source: ABdhPJysxO3X+lmkQzoo8sO3+MJAEA7NmxQMsPRKXb4Ha0OVlBrvItx6f5snVH8wsah5Y3T9fVzDUA==
X-Received: by 2002:a05:6402:3594:: with SMTP id y20mr3663413edc.63.1622797839507;
        Fri, 04 Jun 2021 02:10:39 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:39 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/11] perl-cross: 1.3.5 -> 1.3.6
Date: Fri,  4 Jun 2021 11:10:25 +0200
Message-Id: <20210604091030.1380877-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../perl-cross/{perlcross_1.3.5.bb => perlcross_1.3.6.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl-cross/{perlcross_1.3.5.bb => perlcross_1.3.6.bb} (92%)

diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
similarity index 92%
rename from meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
rename to meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index 9509313b86..83b7b415af 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.5.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
 "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-SRC_URI[perl-cross.sha256sum] = "91c66f6b2b99fccfd4fee14660b677380b0c98f9456359e91449798c2ad2ef25"
+SRC_URI[perl-cross.sha256sum] = "4010f41870d64e3957b4b8ce70ebba10a7c4a3e86c5551acb4099c3fcbb37ce5"
 
 S = "${WORKDIR}/perl-cross-${PV}"
 
-- 
2.31.1

