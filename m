Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F4EC433FE
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 08:41:05 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.6556.1634805664342048366
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CX7Cvya3;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id d3so547375wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 01:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=59wfaqPaSqvx5NDRGAbJlPSv0g9pQhzt+aybdFwQa+k=;
        b=CX7Cvya38Nq4JAd9cUdM8pCKItKnQtnV/XPDwcnIY114ZhfmoCeDZib+JkRbHjxk1V
         TZfXLTNjy+SvRGQGBAeNxmcpGuBWsoh/KO6Y5b35YE54iVA/GD72eM7tRHpU28I628nT
         uydqYo4UtCA2Me7zmVipU3YrvL1t6XQcrdL52e+fkQtinXd1V4UZx+Yr267rRFIZ47nK
         pBkpAvZcyjZDyLWPJUUP9//Ip4uqf0lD6SgjwYCp9t49kfBHYIznCwXq7AfNz6CQL+RF
         E6dFuGYql61ZKmSk8EWBLa9P6oByMl72Zjop1F88pLPdIKVOD+vsYhpurhRmNNyF2q2E
         694w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=59wfaqPaSqvx5NDRGAbJlPSv0g9pQhzt+aybdFwQa+k=;
        b=RELT777uVWDz/wKy1owfQnxss6vtIHiu6vl0YfQ6AfYyHKO0cuyMoBaEyVlkl/6xZp
         Z+qNUXCIgrLh1elqdrhMGH48Lf57Co3JJYs95otFxJbjcsADRhb7hcrsphHj9lIIoLvA
         yan+8RQ8v0Se5E4rzZ05Eub+77KfudnBDNpDNF6ZaR+10xsr9yYsmKAM2FCn9BHdwY/z
         683U+DE3qR9n+4exksuCqO28zmVjzBpIhtMUMpxLU8SThyrvvuXiVZA/51jLoB1lbkZX
         wBHPcxMV0t/yWrmXprVPEGjBcGxGLAOrH55v7EWF4E8ax5lQCBiPeKgpVzaVfSXk/i22
         Oshg==
X-Gm-Message-State: AOAM532SP0pRdt/kubCMmXwfGwiIObbpfH1oSDmEz+nRIAZCeAIK8fE+
	t+ckg2e44IjaPK+vmPbF1P/3p4ngkhY=
X-Google-Smtp-Source: 
 ABdhPJz1VZd1JZYfl9iyUhYuynMtWG5MQLXEbmQy8fG9dboVR0Hhbo9b8NvYRV5YsKToML918f9dvA==
X-Received: by 2002:adf:b19b:: with SMTP id q27mr5694602wra.125.1634805662978;
        Thu, 21 Oct 2021 01:41:02 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 25sm7384126wmo.18.2021.10.21.01.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 01:41:02 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/2] stress-ng: convert to git, website is down
Date: Thu, 21 Oct 2021 10:40:59 +0200
Message-Id: <20211021084059.977697-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021084059.977697-1-alex@linutronix.de>
References: <20211021084059.977697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 08:41:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157277

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
index 198f7e87c7..f9dcdda0af 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
@@ -1,14 +1,15 @@
 SUMMARY = "System load testing utility"
 DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
 imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
-HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
+HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            "
-SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
+SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
+S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
 
-- 
2.20.1


