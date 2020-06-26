Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.2824.1593155959162558679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ea80ijVc;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id g20so5908538edm.4
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vj+fsAUjZGvxt8F+mciwhqe1M1TpMUuymLLoixUjnt4=;
        b=Ea80ijVcGF4uDJLyq1mhAoQhBXdxwAh9x8f3zFPZJj713bp1rpzvNftO8PYzGuSn2W
         HrCBU73v8VqcmcBp1QtfFg93WseuwKwNlFbq/wGlxcw8uS2xiEgyPAgLqja+nbmhyZ07
         mOBew3uJ40tT7KNk1OFpH/Gr75j+luXB7f8zuHZNFbUvIjcQ0vPEZ6qav3TdfvG35oJ+
         n/Q2NBUpJX7QH5EtVDOAy9dHh4b8BCRXth/YYRXFXT75NgW1ix4KDFsGUTT/klBVEHnx
         wddreCbWF/oaU1G0MM0JFBTEKw9gijwxoObNas+W4n8rla3f7BbWpswmPRQfXsZT3B7+
         EI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vj+fsAUjZGvxt8F+mciwhqe1M1TpMUuymLLoixUjnt4=;
        b=RqLAZN0XeJ0BofUz/essHMnZ6mdSFYXmN/Zg/pXArFOc3mxuq84T2D4YdLzcV+bsQu
         8m8MavwzQGIUKmIRBcfUArSm8p1jFJ8VmXwusgOTLfX0IMXd/1MNBDzMf+YhdhNUifg3
         WosjQLAjjJI+07G6KxpV76AvCc1gXgkabLjj2EG0D7vOcDgbqG0t7A/nxAfpF5IbP3C5
         BqtZIx3/Y5PkrSqKVw9VVtDZ45+s1THkt3K20pMHsG2xWOtdxs7fTCVi2x1Muz54BUJE
         I4nQbxhSwJloy43GejZKQUbq+vGiuLcxq03IsGpvPImPo2sBoDKMcEK8FvDeHxBaRqxE
         rOnQ==
X-Gm-Message-State: AOAM533QL7uqXo3Qiae+Z5QTp/gSC/2/V4vWR3C9MopIZtYHjBdQ/OMk
	QxOjXacL6UouFfW2nM9Q1UPzd3d7USk=
X-Google-Smtp-Source: ABdhPJz+5cR1r0bg94NzIp8SB9JXP7kYBjwIbpb9kIoeim4xZRD3nuX2Se4v87sbMv1NjGzeDc7Btw==
X-Received: by 2002:a05:6402:1ca2:: with SMTP id cz2mr1888304edb.15.1593155957553;
        Fri, 26 Jun 2020 00:19:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/30] systemtap: upgrade 4.2 -> 4.3
Date: Fri, 26 Jun 2020 09:18:30 +0200
Message-Id: <20200626071844.29134-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 116e83fe0f..4ec0703f2b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "044a0640985ef007c0b2fb6eaf660d9d51800cda"
-PV = "4.2"
+SRCREV = "c9c23c987d819d07c6b96b54f8e03188fecd9e46"
+PV = "4.3"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://0001-Do-not-let-configure-write-a-python-location-into-th.patch \
-- 
2.27.0

