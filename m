Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web09.2390.1604096428640011140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2020 15:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rtBCsPfi;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id w25so8271170edx.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2020 15:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTlw5mkzu2bt7XlYUFVA3oXfdx+8Sva48mAbODezTC0=;
        b=rtBCsPfiXcXx4aSDlBo1SO/XT9Ls9TGaiphgjMSVjxeaGwA4/ON3Dkk1DasxnAMKVN
         ScIkrYyRQn4G1dKYHmn0D/Ss4y3MTnlDMRwwENOzH77NQ6Yi+NuCHowbO/elZUj049tq
         74G+twNC/itLqcbsP2GRkk+nnGDb7wzKd9F4H5AVbZEAbUwb1LBFZKVUlvghWisQz9vU
         b0VKDcOQHc9gbVjV88CaZ5U2I1eme9eeIGx0N0K9rVMCJfht+HZkpw1zgKRtKiprTTqZ
         djgzTnCe70nRV5jgzl/Hfwl5YVkEP5p7w3Xvu+a2QGkcR6qpRIWSVYChRom9A6ent1Ip
         7zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WTlw5mkzu2bt7XlYUFVA3oXfdx+8Sva48mAbODezTC0=;
        b=cIPJKGR5atTAzqZTva/LymgqQg73SFzbQUY+DkPjb/VsL09UmTeKzI7NUZ5347vC5f
         VRKVsb/u09VtNCFOwcngmDM9em77dLwYlecV+tM0OKofkTP7rtbyN61U95bkOgwdzSZy
         8mbWgsVgmRevS7bV6stHS0E9IDxQW56uV1MJergzreB27rDg1mwHChCVE4XMM4MbNeE8
         DfMOk+VFG1HyXQ4/TWh99CFcRIJ8bynizgd1so3OCZoMZOL7w95kIc0HNO5+yaC4Ona5
         lTFgiSAjGUnZKzsthSCdtYuYAcksIIEUudbf38SdYxDDcXkMtonXJIXUtW2iHv5w4eK8
         xkDA==
X-Gm-Message-State: AOAM532lnHU+8y+ZiS0ThV78v7FVk1+Dc3I+x39wRbJRuC2iqtMzvbRH
	XqEHfuid8zT8+jpoTORb6myj7w8VMaGmYw==
X-Google-Smtp-Source: ABdhPJxCL68FiNvT2Du36MDvY6qDQGAVLtKIUWD7dqyoxWqISUaQ+f5BUDxliEkGFLMrtf+kqbUoBQ==
X-Received: by 2002:a05:6402:359:: with SMTP id r25mr4892896edw.308.1604096426796;
        Fri, 30 Oct 2020 15:20:26 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id b6sm3631497edu.21.2020.10.30.15.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 15:20:26 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] json-glib: fix reproducibility
Date: Fri, 30 Oct 2020 23:20:20 +0100
Message-Id: <20201030222020.20214-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
index 3cb637f220..835ba7b4b3 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.0.bb
@@ -19,7 +19,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
 
-SRC_URI += " file://run-ptest"
+SRC_URI += " file://0001-json-glib-json-enum-types.c.in-fix-build-reproducibi.patch"
 SRC_URI[archive.sha256sum] = "0d7c67602c4161ea7070fab6c5823afd9bd7f7bc955f652a50d3753b08494e73"
 
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
-- 
2.29.0

