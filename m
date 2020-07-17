Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.12911.1594996692044688270
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0AohJWki;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id a24so5479133pfc.10
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=GsQhEMj42XthZ25L5wiXFCdmK9TZM12gQlGqJ9xxVls=;
        b=0AohJWkiKRDsn8/+ep2I+Sr7cSVHyfB862kXLQ6fflVunQ6TSjusszqgajHaAqF+Mz
         6+i3AkPdvgouK7A+RddNs18BPM5V3Q44h9tCDLgh8XW8xUx1RPingI0wR6vG5kwUFK4C
         0w6YcID4DHuSEPB3F3JTZSyoQQTB2h+UxV6HTkFuTwT35XPdkvvqXl6AMF5FdrzCUl9s
         G0eP4VSVot+RfSuaaseC1fv8niIvjWFQyO/aN8Zrt9tyJuFvDn4L7jIFOzHTsLyK/zcE
         ERwtxb/xCiE7NXwdGsICcRoIs73gOZ6sq+AbkgNQ5cKdaYOX2kwAdwjMXcbcHDnY1wCy
         47zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=GsQhEMj42XthZ25L5wiXFCdmK9TZM12gQlGqJ9xxVls=;
        b=RHiFu+ulcnAQuu3//deNhqjnszI7vZ5bE4o6qSbThpbK/w2+0QhF2p8rG7ObjrMchX
         abvRacThpMjTVb3spB0+4JLCV4jl/9qE6J/eKv6IRu9w79xH9DI3a4VlxmgCqspTDxPc
         4OwmvBHVLr6MzkBVvrjzkVVdcoacd53TInsTDUJ1TpYrcTdxxxyPZTCYNwUmX5+XaPLJ
         +yZ3vY5Ra9GBB1Q6HGEEzw0Luq06zQlr+LbE6PS3bmWW0SLSpFv86TALeV2TtArkkmXD
         pQi4vzI/GYAcKudfuOwHYiWmAQVLJkRgWLgYcEVnpJtMuQ4we7O3yuRQPhFn8ZjGSupS
         9/tA==
X-Gm-Message-State: AOAM5316bGq4kMPqL85Okz4FGSpts4vjU37DfOFHLhHBPfr4QSX+17+n
	tQcFPUuVwFSUyhLWKgTIQhbnW8yQ0zA=
X-Google-Smtp-Source: ABdhPJxVeMZxaN3PwSEC1YQSSP5oxPa/mpRZx1N5/KvH4aCiI95t9dfidctsu3t81gGwyjWiY8yd7g==
X-Received: by 2002:a63:af01:: with SMTP id w1mr9109703pge.23.1594996691140;
        Fri, 17 Jul 2020 07:38:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:10 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/20] avahi: Fix typo in recipe
Date: Fri, 17 Jul 2020 04:37:10 -1000
Message-Id: <683fb53c94e63e4f5acf4c2efd04977cc10bed49.1594996440.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Christian Eggers <ceggers@arri.de>

According to the PACKAGES variable, LICENSE_avahi-client is misspelled.
Additionally, the libavahi-client package actually only includes
LGPLv2.1+ software (as opposed to the global LICENSE variable).

Signed-off-by: Christian Eggers <ceggers@arri.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8837b4735b5e96ae0f5542319e711dbda8c3849)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/avahi/avahi_0.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.7.bb b/meta/recipes-connectivity/avahi/avahi_0.7.bb
index 24523c7f81..f6e3afb24e 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.7.bb
@@ -14,7 +14,7 @@ LICENSE_libavahi-gobject = "LGPLv2.1+"
 LICENSE_avahi-daemon = "LGPLv2.1+"
 LICENSE_libavahi-common = "LGPLv2.1+"
 LICENSE_libavahi-core = "LGPLv2.1+"
-LICENSE_avahi-client = "LGPLv2.1+"
+LICENSE_libavahi-client = "LGPLv2.1+"
 LICENSE_avahi-dnsconfd = "LGPLv2.1+"
 LICENSE_libavahi-glib = "LGPLv2.1+"
 LICENSE_avahi-autoipd = "LGPLv2.1+"
-- 
2.17.1

