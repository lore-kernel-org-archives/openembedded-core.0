Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EEFCD6E68
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 18:13:01 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5851.1780337576715059320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 11:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ghD1hoNq;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-69dc2c38f6dso3141662eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780337576; x=1780942376; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RpDd9XgZN/AUhJVG5yrozQKCUfJX1HTVnqj3ydBIlM=;
        b=ghD1hoNqL4BW/6eopR88Id1uANuvfM5KZgHGpFsPFXKgeDRZn6P5iZInApDGNhAMXT
         F0PysP/ZjXAopWNu2NQ5uQd8lSoaUfJjg8rblHW0wdHFjpj4w2i0B64GHTtsnhJvQ+zB
         NQoo89LX99lOgjmQtMS4m6078kD/n+8VsolY1ghpkqjiehhkhRPMgAxh+6oCQNVM80+x
         7jBE0tZCV2xedNgtAk945EU3Q0wWTt/8rxEeZSxpPQ9LI2n+yRRzvFRxqg3mRIXIzHNe
         /M00oljurO8jAo5+CHrbi8kuLww3141QE6/p14JimSuL2FhyUG7YhPIAPyWUuYvmngVB
         C2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780337576; x=1780942376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RpDd9XgZN/AUhJVG5yrozQKCUfJX1HTVnqj3ydBIlM=;
        b=clJpU5415WuXRo8RZm4wziXgR/t2m5jqrgHkyo5asdORW/3BZ/Le/tD3Bu25RJxHWn
         9pVvaFiWa3h7VKJzsX1WZcF+oF9lenrqj/m5J53V+QwnWLQp3ZlHOp4ZWWJ6NzAT+Rzl
         /r/kiTRCIQfslDLltGvC+k61BVmCQmBl7Equ4NNHRt+gW1F694L50VED+zvNBDBsqGxH
         STmgVfDl9WN9rJMyCum2caAtOR42SZb2MW7/MECtbcETlRzVP2UXrPgc3huQlL3MsCVQ
         ZOCb8u1Y/7fE+N2vTEUZ98XnE2hb3SBFa/8s9n2CSGisRlBJiy7lW9dAkQ/HUiAm50lz
         5SdQ==
X-Gm-Message-State: AOJu0YwnrU2mzTbURYyAhDtoz4W1up4bao58VU9iUcslyscuzOdiLAFT
	lOlyVAcmPS4XdycpIlX0GaqJ+Of3Gjwyq09eJcZ68x7wg0VXSmqwr109RQzG4w==
X-Gm-Gg: Acq92OGvlU7nWkkC9F1cdYBw5XEV1Cw1AWpyZfV9HNAemj2muKw3lmopi6UT3XMvBt6
	/yzmE07iRjzKInXTbRcMxL7bbi3wjej7NXaP2hELTDE3SXqZOCEkdJyIc2SQ23bKn658LIXSjT/
	Lpey0cfkNwM30o4gk77/gZQhSxM4nhiwvan/B/QsRie8Z/U1lH8usRrqU6sEFBNRdb99cIdd3Xa
	rsd5fA0i8xEzmK7ej0YRv8NzgxTyyKZzjG1hw7DTr9iOG3seLJeYsxuWYXcpFu7NlxJgnDvt+jx
	WT8M8P3OpqBOyZbRWUeQVer0P9eM39mPBFP9nSw4qlFx+sa6YMWHAo1RwwHH+FUYhD7JlBdxL8u
	+kbn/kqE43tPQFeCHEh5CATDpoe9A6vuSG9ZV76oqUTaKRd2m7qfj2ckLmsr+1c0FDlEDR0hvqg
	pd6uvsd45qdvfCo7CyWVZERsMpbbT2oHA=
X-Received: by 2002:a05:6820:62a:b0:69d:ffa3:f56c with SMTP id 006d021491bc7-69e102dfe0cmr6528963eaf.14.1780337575758;
        Mon, 01 Jun 2026 11:12:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::399e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e30afb3e6sm860649eaf.3.2026.06.01.11.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 11:12:55 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/8] gettext-minimal-native: Use SPDX License Identifier
Date: Mon,  1 Jun 2026 12:11:37 -0600
Message-ID: <20260601181251.123019-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237977

Changes the license from FSF-Unlimited to FSFULLR, which is the SPDX
identifier for the same license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/gettext/gettext-minimal-native_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index 28392a26b5..c0cd701ab1 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -12,7 +12,7 @@ SRC_URI += " \
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-LICENSE = "FSF-Unlimited"
+LICENSE = "FSFULLR"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=4bd090a20bfcd1a18f1f79837b5e3e91"
 
 inherit native
-- 
2.54.0


