Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.50326.1624294995131977249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WVEGmIUY;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id y21so3059013plb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mTLybJ+LgJCxHXMucV0BkSY6fQWU7Zek20wRyHldht0=;
        b=WVEGmIUYzDOalfqFsO38pEJVd2SYUekYdvIQEzFiQ7kXexkSiLXukrQ1MW/7T21JsR
         K6UNLKYFKKn8GseZJbQBQCZZ5xpmGOqhbzw0yjnMJggd8Lxzk88Xpv9LNhrQqWcXbGGg
         3921Zt5yNHPsDZpR+7GNOdtoRTVc73BscZdz1rVAYiiVo9mxILvdWB1WbXD9fczvBZdB
         h629Y16dRwomM5ycHC+8eYw8SZLbAj/haFZwcmbZFxgv3aMq5L0bu7rIkVbfagT8JGWj
         Nn62FSLtb6Yj9nPB8ellz2bH3eB3zI2Y7x9KodAcbw4vhe5QrhV7XPbvZn614swyWskB
         mGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mTLybJ+LgJCxHXMucV0BkSY6fQWU7Zek20wRyHldht0=;
        b=oYU64CjzFF+yFvl1xK68xUpc5eEakaiHkLYZQ2BEJP2cBpsRZjSNGToHAS4TGMnMY9
         qwO0NxCmQ9h0orHJB51w0KopLIZdtM10k563Z4a15jxCEcmN2dWUq4Rr7RMjWnCovGrK
         jVyQvvMqvzmFGKZPhaC2GYZjJiywsW0p1Y2LFPOnFRBiH1SCrAuqIAqN1dM9c6iojMEk
         dgYXoAT2W4+Z1WaxVwdjtSI4hmkMv10uQwySTh4PNOBmelBlmj5iP9VD6/oeU/OOBrEF
         WaO37ELX1oJF/XZeOq9bX7HfTeLUsCijfDwNQ1a1yVzFrZ8468C5N9jBiwpWL6P3+34a
         a9aw==
X-Gm-Message-State: AOAM532kZ7t0ugUleaJxvzG+DawdC6I5qdzInpQm9A+bSnowbYxs9YNR
	RUy1ME0qdAQxRcKuLyC+xPFSG8jATTkm5A==
X-Google-Smtp-Source: ABdhPJzqFHTnlAPDCDf1ONpK0a6CASrs/IFMfSutciqSW9n5Am672187DHr3M5zyuZJWOUMXsTzI9w==
X-Received: by 2002:a17:902:9b8a:b029:10e:a83d:7dcf with SMTP id y10-20020a1709029b8ab029010ea83d7dcfmr18633343plp.7.1624294994538;
        Mon, 21 Jun 2021 10:03:14 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:9640:8a50:f0aa:6cd5:a7ef])
        by smtp.gmail.com with ESMTPSA id s125sm6002868pgc.63.2021.06.21.10.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:03:14 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [RFC PATCH 09/10][dunfell] python3: upgrade 3.8.9 -> 3.8.10
Date: Mon, 21 Jun 2021 10:02:56 -0700
Message-Id: <4f3d732b68925204fd63790f8ef69b6819fbc4fb.1624294059.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1624294059.git.timothy.t.orling@intel.com>
References: <cover.1624294059.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Release Date: May 3, 2021

This is the tenth and final regular maintenance release of Python 3.8

Note: The release you're looking at is Python 3.8.10, a bugfix release for the
legacy 3.8 series. Python 3.9 is now the latest feature release series of
Python 3.

FIXME:
AssertionError: Failed ptests:
{'python3': ['test_record_extensions', 'test_build_ext']}

References:
https://www.python.org/downloads/release/python-3810/
https://docs.python.org/release/3.8.10/whatsnew/changelog.html

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 .../python/{python3_3.8.9.bb => python3_3.8.10.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.8.9.bb => python3_3.8.10.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.8.9.bb b/meta/recipes-devtools/python/python3_3.8.10.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.8.9.bb
rename to meta/recipes-devtools/python/python3_3.8.10.bb
index c6e7e593787..3e4386e57c8 100644
--- a/meta/recipes-devtools/python/python3_3.8.9.bb
+++ b/meta/recipes-devtools/python/python3_3.8.10.bb
@@ -42,8 +42,8 @@ SRC_URI_append_class-native = " \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
 
-SRC_URI[md5sum] = "51b5bbf2ab447e66d15af4883db1c133"
-SRC_URI[sha256sum] = "5e391f3ec45da2954419cab0beaefd8be38895ea5ce33577c3ec14940c4b9572"
+SRC_URI[md5sum] = "d9eee4b20155553830a2025e4dcaa7b3"
+SRC_URI[sha256sum] = "6af24a66093dd840bcccf371d4044a3027e655cf24591ce26e48022bc79219d9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2

