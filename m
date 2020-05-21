Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.8496.1590075300491743846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 08:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MNCdzBHI;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id y17so5282183ilg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 08:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Fg8dj8jogogoyvmLbckQilnM0e2wblnokYbyNVJmUew=;
        b=MNCdzBHI1/4Tk/KOSXcdBw7obGYNNHSgMpXA8/Q8SUYpdEkNCvH1RXs7JcYmlccjc0
         iEcbPGWh1WUYagcGLpQDIcjSTGbSnqqa1EosfcBdViaH36vpTS+ViOaZpdK4kLeC4lpR
         RBn3VlZMf3xArUXkG1AcFsMgKpWGErj10hEE07VLifeYnfb/H+dtX+RABDzUoGMMWKAh
         FbIrAv2G1H5mCaWsuQ99jeg20I6fIUB45oMJZweL8oz5EkmId4dL0U2vbiSJ1qF8/qhh
         IehCTQIGWL+g3HM2hXdnV45MzxKwnFxojth/FDIk2fhJMqeV7IL1u/SsNoGeVBHWVQVx
         GvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Fg8dj8jogogoyvmLbckQilnM0e2wblnokYbyNVJmUew=;
        b=gga52twLFi86nRr5jQDCixPwkK+cE9OOshByXr6ioaIyRyfk9GmVr6ufR6IX8gAQta
         C7IvE/8obUa52cVDjRJxs3spme6AhYvIt64SrI3MDCE+LRMpTDeEqfleQJTijLRw66b2
         CfPux5ixWfXLz7qeWTg/ShZmjS/u3YZPEazUkdJeaZq5sb5XCqN61WCYLZAzG5E0GHa3
         gCgujaXftbFf0CmCEYCa358FDGIsUJtrlXLBwenoKdu31d00p8TunXwFBDzFS6yICTQx
         IhhyJadqN6Wwed2LA/vXzOvQMU7nwkMB0YjGIOv80fArTvaZ6D0GvjA/06i7W6K5xVaK
         tXmg==
X-Gm-Message-State: AOAM5301HDijiAh0CxRUHKzBx5VE7+335nBawOvVjvOnESlHz+w4v+7D
	im50So3x9CJHktIsa/K/Jg0stAolgVs=
X-Google-Smtp-Source: ABdhPJwAncmonbXt+a5rSE7epxv7b4o2Yjwf1DlvBg6lQa4a1q31KkHQoaY282Q38KD1sCqki5ZDVw==
X-Received: by 2002:a92:5b18:: with SMTP id p24mr8227212ilb.222.1590075299640;
        Thu, 21 May 2020 08:34:59 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from OLA-8C37N23.garmin.com ([2605:a601:ac3d:c100:dd2f:75de:f1b0:dc7a])
        by smtp.gmail.com with ESMTPSA id i15sm3079821ils.74.2020.05.21.08.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 08:34:59 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] Bump layer version
Date: Thu, 21 May 2020 10:34:55 -0500
Message-Id: <20200521153455.11252-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1

The commits 910ffaf5be ("pyelftools: Import from meta-python") and
a96f815c53 ("pycryptodome: Import from meta-python") moved recipes from
meta-python to oe-core. In order for this to be communicated with users,
bump the LAYERVERSION so that meta-python can key of it in its
LAYERDEPENDS.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index da93d64e0a..098ef12ac6 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -11,7 +11,7 @@ LAYERSERIES_CORENAMES = "dunfell gatesgarth"
 
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
-LAYERVERSION_core = "11"
+LAYERVERSION_core = "12"
 LAYERSERIES_COMPAT_core = "gatesgarth"
 
 BBLAYERS_LAYERINDEX_NAME_core = "openembedded-core"
-- 
2.17.1

