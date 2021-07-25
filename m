Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web12.18825.1627227557106726136
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 08:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MKuAHnEE;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: vivien.didelot@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id a19so5311719qtx.1
        for <Openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 08:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nx22A3y4GiUJBDHkxT3ygUnmKpn4OX4VVjX3QdGc0EY=;
        b=MKuAHnEEzASna2jrixJNR0/cjCz1jdM2FD/FVJCAPiVzJLDazC/5q30cmya3wlUtcE
         K5YGPvcPm+WRCTAol0X9YTosWOJZEofGZ1AXD8f6+a4/ReGYMWEsA2mo/oQGDsKrWbCY
         EemtRPDFbC9LcTZv1VJBkXd4TLPKthV7loWSuBVrgwpF8IP1Xhnr+Mo+zApsJU9GoXwI
         mEwhigMqNVu+F9iHHQMvyhlujSFPZ+Mm1wUA3DeeDapK4Ag5LfHFVLMG8y4Zws7HRpVe
         Xn2yezxSpu7MuxXeskdNpnRNV+WGypfh1CjFtWFhlvV7JMYsyIsUuOpqCDj6E2eO+jlh
         WY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nx22A3y4GiUJBDHkxT3ygUnmKpn4OX4VVjX3QdGc0EY=;
        b=IQ9//ln9svUStKqpcJ6WHi0gZX7Dez2imzcqecXyMvF/+dWF5/W28F9W1QGeid0IDm
         CXx1FAD+oDuKZKSn2qqvmDYCuwLeWmWv8XVyoV4dRBStgMleEz7MQxQwEWf/cvSdRCiW
         NNYUljwTm0MEufPWBvTBCi12JmDq3j78Pxsb+hP7CAFcRRaLzKkkpGBIeoMDkrCSvg8w
         n3mFfaQ3V0O9KuBlwGHJOKyqw3jfnbb+92nn24QYzwKS4aQkkFBMZg++v0BOP0ZDaRD1
         HyTvRuXJfU+e3Rn6V0W0Gw3D4L4F+IjyeszxEr8zAvwxVcljSfp6aeN1Bi8xRBn875LP
         dUUQ==
X-Gm-Message-State: AOAM533DknJe+BknhYo5P0Bnoz/dGemdCFDt5ibX7kistAPSpCYwGXA2
	nIzKA5BSpte8B2UlBO5nO8c1WDsgAXU=
X-Google-Smtp-Source: ABdhPJw5oDNkStuBifgrAESrBvBPHn5ZpLL0CA2DBF+Dyh7De4pqdmj5RK5jKeKPq3C1yjGwTJN/fg==
X-Received: by 2002:a05:622a:10d:: with SMTP id u13mr11969419qtw.314.1627227556046;
        Sun, 25 Jul 2021 08:39:16 -0700 (PDT)
Return-Path: <vivien.didelot@gmail.com>
Received: from localhost (bras-base-mtrlpq2848w-grc-41-70-53-240-121.dsl.bell.ca. [70.53.240.121])
        by smtp.gmail.com with ESMTPSA id h2sm18358853qkf.106.2021.07.25.08.39.15
        for <Openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 08:39:15 -0700 (PDT)
From: "Vivien Didelot" <vivien.didelot@gmail.com>
X-Google-Original-From: Vivien Didelot <vdidelot@pbsc.com>
To: Openembedded-core@lists.openembedded.org
Subject: [PATCH] init-manager-systemd: define weak dev manager
Date: Sun, 25 Jul 2021 11:39:08 -0400
Message-Id: <20210725153908.1122555-1-vdidelot@pbsc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For a full systemd distro, also add a weak assignment for systemd as
the dev manager.

Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
---
 meta/conf/distro/include/init-manager-systemd.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/conf/distro/include/init-manager-systemd.inc
index 1558b85250..4bd950a9aa 100644
--- a/meta/conf/distro/include/init-manager-systemd.inc
+++ b/meta/conf/distro/include/init-manager-systemd.inc
@@ -4,3 +4,4 @@ DISTRO_FEATURES_BACKFILL_CONSIDERED_append = " sysvinit"
 VIRTUAL-RUNTIME_init_manager ??= "systemd"
 VIRTUAL-RUNTIME_initscripts ??= "systemd-compat-units"
 VIRTUAL-RUNTIME_login_manager ??= "shadow-base"
+VIRTUAL-RUNTIME_dev_manager ??= "systemd"
-- 
2.32.0

