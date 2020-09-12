Received: from mail-io1-f67.google.com (mail-io1-f67.google.com [209.85.166.67])
 by mx.groups.io with SMTP id smtpd.web11.21736.1599929444856003827
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2020 09:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@emacinc-com.20150623.gappssmtp.com header.s=20150623 header.b=QD+k9PBX;
 spf=pass (domain: emacinc.com, ip: 209.85.166.67, mailfrom: mgloff@emacinc.com)
Received: by mail-io1-f67.google.com with SMTP id h4so14368881ioe.5
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2020 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=emacinc-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yn8ujNXqh9XpExq54jCmb2lrpB2SfkLNoFNWj6/oIQw=;
        b=QD+k9PBXn1iewlOkHV1208qUtarRlXe7XmOYOB9w+DpSbx7Ag16F3ItxR8fyIFmxJ5
         1wDHkS6iuqqndrL05HHMppLm9OXG4TmndH3IJoxTFgeq4pIFYgnPZNMF5ezHrvXOnPbd
         SKg3tJg9DqOnG5A2zamqecBQTSQnYiYTns1rKp23TbGCnmNMtw2ZpW4ra9OD2fA99Z0q
         M7RaYVRVLgzKEChLkmR7s4GlP2O0/lO/UVf47fJk8CvfEa3kxkATEqhrj1N8uW6LDbgZ
         adhPvsIv6+6LMpwiqbdfHB/mhiGUnBUTLo7pMNzzMKsn7gxdtxLYCdJ1BXtQgLNVFUxX
         94uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yn8ujNXqh9XpExq54jCmb2lrpB2SfkLNoFNWj6/oIQw=;
        b=KGhDtMJnTlGRsPk5uINFK0AnUaHTDlUtTxDQ6V9SqsCl5BvKblPh+cnXnuB5rAhQk8
         GGIovLV/jCmQ/uX/BkwKaG/jHvBgBfYo7qr0YOvyVmolh77ku5bO002IV6PSQZ+TCxzi
         /CgAlgaWdvfjWtBm72JL47UfKt2i7w9c4zosSG/rmQG+icQCaKvf18Jm4CEBrp4LXg86
         aNCrbyV49EZDQ4H+NVc4cTN0eB4qyDipl8j0R9iBn4bn4NI5lG30JSN44BQT8GSxuoGs
         5AmJu0bM0Pbtx4n89QfO6dORatZlcaq+pAY+8R6PFNl/4Qi3vnBs44wZ01LHSymAMmzc
         jlRQ==
X-Gm-Message-State: AOAM531bZtVoSPOyfS5Np+FTL+Gxrjh0e2ymCeUypxDfM4JqMllkw/9S
	MkOt/UsuucOXabQMJJIw/PC7aGpSfO8cIkhd
X-Google-Smtp-Source: ABdhPJyZ9SAGjtfiJEeuoiIRxmIVDavE9pN5jO43Sh1jEZRoKFAT1Z2GjRtbV8IIBz+jqUa9BXPFvA==
X-Received: by 2002:a5e:820d:: with SMTP id l13mr5840266iom.3.1599929443950;
        Sat, 12 Sep 2020 09:50:43 -0700 (PDT)
Return-Path: <mgloff@emacinc.com>
Received: from Shuttle.mediacom.info ([2604:2d80:9f80:9700:dbc1:b947:539f:e0])
        by smtp.gmail.com with ESMTPSA id r7sm3398031ilg.27.2020.09.12.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 09:50:43 -0700 (PDT)
From: "Michael Gloff" <mgloff@emacinc.com>
To: openembedded-core@lists.openembedded.org
Cc: Michael Gloff <mgloff@emacinc.com>
Subject: [OE-core][dunfell][PATCH] sysvinit: Remove ${B} assignment
Date: Sat, 12 Sep 2020 11:50:30 -0500
Message-Id: <20200912165030.978292-1-mgloff@emacinc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order for the VERSION variable to be set, the
top level Makefile should be used, which only
builds the code in /src anyway.

Signed-off-by: Michael Gloff <mgloff@emacinc.com>
---
 meta/recipes-core/sysvinit/sysvinit_2.96.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.96.bb b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
index d2b85ed9c0..7358f02385 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.96.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.96.bb
@@ -25,7 +25,6 @@ SRC_URI[md5sum] = "48cebffebf2a96ab09bec14bf9976016"
 SRC_URI[sha256sum] = "2a2e26b72aa235a23ab1c8471005f890309ce1196c83fbc9413c57b9ab62b587"
 
 S = "${WORKDIR}/sysvinit-${PV}"
-B = "${S}/src"
 
 inherit update-alternatives features_check
 DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
-- 
2.28.0

