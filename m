Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5E67EB41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 15:18:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r195so4062194wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 08:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5OvBnSU+lgE9snTgae5vb9vucGWxRUqRW1Q2s9k8Qqo=;
	b=If/MAXiiHcsDgHa2DaWaNGDIbSnaWRG9RzGKlMwNvfkTj8ehoYwbpNjE5xcpdUZwpI
	74o/iBznWytTMGovPPUuNMrYwSBc81YVCMEwWvBGK2WKsIh21kp58unRfdpcaI+n+xlx
	SYpuK35K79NwdMHCCzPnXWRFll5lmntGF5rA+f36p+0Nt1gC1WQMNNn1ncbrPURo0gA3
	+yx4KtlEMsoOGxLX9LYVRvIopgar73tsEr4pb3lgJ3FxtrZU8jvh6Wp8+H0E1B9ugpCU
	iVBTuvxC2PdWHiK2QtVtpF1PnHHK1Fq6jb3Bu1Z6q0VSN0E/EVp0hZada/qj6Z8XD/iZ
	K3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5OvBnSU+lgE9snTgae5vb9vucGWxRUqRW1Q2s9k8Qqo=;
	b=Eof3Rb2MK9cfgEANkoi8WcohOCZwfXdaCfD3EZPwnsBkiaqJRIAWW3TwGIHK24RtWp
	GCQ5c+2YSUsg95X1fqjieCJ1oT6Uysqaj9BCLHUm+vFh+eaU5HessvSELjdJQXTUYPB3
	Ltlsg74zbejdizVVGF5vHOSvG/FVYn7iTQPZTVvYDQtNq/avcBMiJTBDh+efZduvoz/u
	pDTL7AqPdNt0HO8F6IjbLoGfTcVr3BSghR7zIajyHZERXf51/JZ4yWMZu2N+op9E6+NI
	FAFF1upUTp6NQxhew7BlNJx1PLwCVATn3VPiprSMtZ5K8FjdBiERIsGqdvDsOE521sdS
	6ZaA==
X-Gm-Message-State: APjAAAX9uyVRB0ySOt783LyPs0i1Wx2oiv0+mEAStjaf1cAGiEcmLhAt
	qfs/SZLB/ThWbsm/dAzKm/tGBjKMd0Y=
X-Google-Smtp-Source: APXvYqzPXhXiGaInCn/US2HPoWvsHoQcGOXt2Kjuo4uNfKPzr/OWT/BhhIoI6e0kLccz42mWr3wKHA==
X-Received: by 2002:a05:600c:29a:: with SMTP id 26mr4635348wmk.8.1568215081615;
	Wed, 11 Sep 2019 08:18:01 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	q66sm4566574wme.39.2019.09.11.08.18.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 Sep 2019 08:18:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2019 15:18:00 +0000
Message-Id: <20190911151800.1363-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566540028.git.Martin.Jansa@gmail.com>
References: <cover.1566540028.git.Martin.Jansa@gmail.com>
Cc: Jan.Hilsdorf@lawo.com
Subject: [PATCH 7/7] kernel-devicetree.bbclass: add missing backslash
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
X-List-Received-Date: Wed, 11 Sep 2019 15:18:01 -0000

* in oe-core commit 1860d9d3c62e2e94cd68a809385873ffd8270b6d I've accidentally
  removed the backshash here

Reported-By: "Hilsdorf, Jan (LAWO)" <Jan.Hilsdorf@lawo.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel-devicetree.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kernel-devicetree.bbclass
index a45a0ce3c8..6028361f80 100644
--- a/meta/classes/kernel-devicetree.bbclass
+++ b/meta/classes/kernel-devicetree.bbclass
@@ -81,7 +81,7 @@ do_deploy_append() {
 					> ${DEPLOYDIR}/$type-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
 				if [ -e "${KERNEL_OUTPUT_DIR}/${type}.initramfs" ]; then
 					cat ${KERNEL_OUTPUT_DIR}/${type}.initramfs \
-						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext
+						${DEPLOYDIR}/$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext \
 						>  ${DEPLOYDIR}/${type}-${INITRAMFS_NAME}-$dtb_base_name-${KERNEL_DTB_NAME}.$dtb_ext.bin
 				fi
 			fi
-- 
2.17.1


