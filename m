Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.8053.1591884223734754341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 07:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OG988AHq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id l17so5105416wmj.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 07:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XsCquGhyZwB6EIHdm8kLQ0PRsGuE6pA1ADovJGRMagA=;
        b=OG988AHqlFZBeVzDXmomPG66VRW8pZBBmlJSgitGVBbOzQn9oNSiPZX6/sTKMXOUbE
         eVtHhR/GZ52xCUm5UG0vX5zFbHGAU/khpHLs3srdBA3YgZzJyDYnHRkKRv8JFU94kzwP
         xfkWklAesqI5fDoTC0EvaGbapg4pwdnMuw7OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XsCquGhyZwB6EIHdm8kLQ0PRsGuE6pA1ADovJGRMagA=;
        b=Kyx7iuG3TLjJI4zJFgJb7TRuXeFVI9PUYyc8LkR0rE/8vgY/C9tsk/0VblqCwhQqiO
         KRgSz7m+sp71/6H3ihhjVH0UkVOXD2RfWujJnjXhWv3tSzFxZrH1ymv/FwY75JUsr/W7
         cagtVpAKgP87spsYx1ierBcshHDYe7moBo4W8Qttb3jIwDTA5oekAYHx58t76gMC8fub
         2ISq7RnhO4nOGq+ntcWMdKG81waQiin5HjR2kJg6R+Py7yDo1AbapWVm+hsjAxAfiDsy
         MBf8bPYIVsMH8rNCiMWuLeuwaozFIgGIJ4t41MzPqjErsuYsM3yDsRiL+3hijuslbzE4
         etKA==
X-Gm-Message-State: AOAM533opGwsEgDf7aEy2lxe0cX+gIPESuo6JMyBye5O8ZSZEYxym9pL
	Mawv9Cl8rFv+EdNnHw4Nf/JFVpXq2mFs/A==
X-Google-Smtp-Source: ABdhPJyD63R4zT8sPQTFhiq+Y3ZV8diNPJ0TWnKIAsciSzGtEpEwbwr68VceRFtwl8kSLi0mkV375g==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr8235007wmj.5.1591884221653;
        Thu, 11 Jun 2020 07:03:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u3sm4754942wrw.89.2020.06.11.07.03.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 07:03:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Revert "bitbake.conf: Remove unused DEPLOY_DIR_TOOLS variable"
Date: Thu, 11 Jun 2020 15:03:40 +0100
Message-Id: <20200611140340.235389-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit b1f15f651461d07a8cfbd3bdcfea0e89f195212d.

The variable is used by multiple other layers and users are requesting
it be added back.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9336c244bc6..f7700f11911 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -410,6 +410,7 @@ DEPLOY_DIR_IPK = "${DEPLOY_DIR}/ipk"
 DEPLOY_DIR_RPM = "${DEPLOY_DIR}/rpm"
 DEPLOY_DIR_DEB = "${DEPLOY_DIR}/deb"
 DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
+DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/tools"
 
 PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
-- 
2.25.1

