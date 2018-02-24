Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 89E246093D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Feb 2018 04:12:54 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id y26so4116773pgv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 20:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ACSg29f2BIOvfCmoVZfsd4iRXdBe3bcglKjhRy+wvd8=;
	b=FJtt4PmDIe1xnzgeXRUINX2I/PXinCOua/aelGbOtwV2wGevqQY4jrvUUAqWLkLKTC
	C5KV7xWJUmamSqK/Gq3LJgN09jvthwuelDZBUj+Akqmh9JZdB4GkARSTOddHyllPlFEA
	6bcQa7dkW9r/Cghzz+FepaJDUJux1KxgOATyuu41osc33eDC7ZwYxqLasXpdHa1cu1si
	ljQCv3c8SiQQNjz3rIfOk9diWRfPofFXajGPL8PukJ/sQ7odb9/XF1KrowM8K6FpL7XM
	OcTJCyFuIyOiuw6LrW5t1Wc+nEJ1CV6FwdwupS/2ssQPHyA7B5p6+Qf4G7UqNMYoybpy
	dmWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ACSg29f2BIOvfCmoVZfsd4iRXdBe3bcglKjhRy+wvd8=;
	b=F3F7YWnjaZXRhQ10DWmOWuAqEsv+TE+TzRRBFMk1hA07APdH8vMnmJgfd//HJPl3EN
	VHZNa5EjpvEkiU9UtIwSwfrCS461RgeiVGEJD+6STNO6eLGW3yRfw+UicPC2A2XK9URF
	AyXN04EhprG98ovjk7nremHMIs66+CvPbSYg1I17/RnMW1KYcagyxioDhh8y8PLBRjR2
	D2fEcYuqYWX8l9tYqt3mJqJRzfrMWVTCd4bDULtDXVwygOZtBPPu+WsDTkc2ReNY9YKv
	ziQ70nLY3uFviAO9NhJOdhOJI6wcDfabNx9zlu8K1y8pGKHzDG/LSIB8dGHpKVZglgHp
	jmJg==
X-Gm-Message-State: APf1xPAgQ0zlWuwCqoNWRDp7OrULnZCnRD0rotX8sWFusz9RKuFv9Ba2
	NZm1Q3pY6UhO71V4IaFCpyQ=
X-Google-Smtp-Source: AH8x2249TaOA31QTpJwyLX8EeQBYGWg9cizay5+320Yls63WNvgqnz0Ddsf2//zZzhZSD2a9laKaVA==
X-Received: by 10.98.200.131 with SMTP id i3mr3896902pfk.40.1519445575670;
	Fri, 23 Feb 2018 20:12:55 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:d4a8:b8d7:4edf:beec])
	by smtp.gmail.com with ESMTPSA id 186sm6641324pfe.2.2018.02.23.20.12.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Feb 2018 20:12:55 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri, 23 Feb 2018 20:12:51 -0800
Message-Id: <1519445572-25411-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
References: <1519445572-25411-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 2/3] linux-yocto-rt/4.1: update to 4.1.49 plus meltdown
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 24 Feb 2018 04:12:54 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index c82468a..bdad3ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8cc62ac3f26bd6dde68ad2d86026a252fe7add44"
-SRCREV_meta ?= "9f9c9a66ef3452343586adf150137967e955d71a"
+SRCREV_machine ?= "b4c6e9630df3207eb6fbadb337e5df806ee6b6c5"
+SRCREV_meta ?= "4e12cb8f8e06636f2058ea0ab3096ed38228a88b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.43"
+LINUX_VERSION ?= "4.1.49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.4


