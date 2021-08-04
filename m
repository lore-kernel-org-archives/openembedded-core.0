Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.12783.1628100057523957101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Aug 2021 11:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=obBAkRa5;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id a20so3928372plm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ougr7WXN3FPNeFV9+pDtoDCxDXHAtQpodwoAgMX5KuU=;
        b=obBAkRa5Hw29uPwi0f61NmdqAl1OQEYqDlcEvU5ogw5m/hLzjTiFtVwggBhyDmJXce
         NqbjcLPKCWaHIsd9aqHCTNrvdisXy9qtm4FRwf0vkggf2psaeV3Z21+hp7jFUVNi8of5
         xh3102NuINxxthl6qe1B7skN1HQQMjJfudFcjesQjLD33DiX4wB+Xj7O7RzL1QG8gs6h
         YKRlB37qZo+n2uSSC6PMu/QFFwteSq4NxZUkH5OKHP98vjwnsVieThH7hF1CYfEYOs9f
         6NcoFLF5Hlsg1ztQqVUTaGCB5rWbFCds+wW9g6yszwOrTNTbs+1e7nshyl4C74Qo245K
         nj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ougr7WXN3FPNeFV9+pDtoDCxDXHAtQpodwoAgMX5KuU=;
        b=EeBdb2Oz8fGS94X3+rO84XNlUE0H/RToP1l6jybZYdohlyoq4rI+6t5djE2frVt8sy
         5fUg1S4SpEONqCPA1WWMkNM9Sp8c8T++lqAqICT2oV2QE4b7CXpT5PBmA5y7YugWr9oP
         9PgZvuY+DI00ov9Bq2Z6FxyvJFYE9xrQiFI2FQk6p2zEZWDIfiAQg9p/NSaayRYMPTWf
         P2XeGA4ssPOoJJ/47rnXVchdueijGkPh8TJqyZwqA80K4AZls7u+0YDwZMN8lNxqmgfr
         LCG1LmbcwJzbzaZq1/ZR/CvzlrEjbeVCBI9v2gfV0s6SX+/jOWWMIKg2hwFrwPO/eqID
         xeOQ==
X-Gm-Message-State: AOAM533O8mvOSHen9bcg0wiI39Jj86FlTvXa4Eqg7TP3liu7J78xw/vy
	S4uUI+x/PCrQXF2AKObKeoPsXkStBJF3yw==
X-Google-Smtp-Source: ABdhPJxc70DR4H9Y6Rf22BRSJTub1Aco6jZb5ScT0hgZQrKzcovEMkHE8RHbP/WI6m+XDy8XbT/1Mw==
X-Received: by 2002:a63:5809:: with SMTP id m9mr363040pgb.342.1628100056924;
        Wed, 04 Aug 2021 11:00:56 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id p8sm3586094pfw.35.2021.08.04.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 11:00:56 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/3] distrooverrides.bbclass: Correct override syntax
Date: Wed,  4 Aug 2021 11:00:51 -0700
Message-Id: <20210804180051.1865715-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210804180051.1865715-1-raj.khem@gmail.com>
References: <20210804180051.1865715-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/distrooverrides.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distrooverrides.bbclass b/meta/classes/distrooverrides.bbclass
index c172a348d8..bf3a2b2090 100644
--- a/meta/classes/distrooverrides.bbclass
+++ b/meta/classes/distrooverrides.bbclass
@@ -6,7 +6,7 @@
 # This makes it simpler to write .bbappends that only change the
 # task signatures of the recipe if the change is really enabled,
 # for example with:
-#   do_install:append_df-my-feature () { ... }
+#   do_install:append:df-my-feature () { ... }
 # where "my-feature" is a DISTRO_FEATURE.
 #
 # The class is meant to be used in a layer.conf or distro
-- 
2.32.0

