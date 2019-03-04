Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B7ED57C930
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 17:31:53 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c13so314802wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 09:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JcER/62MIusMb36RxEDqPl3BcgB/AA+50rE3qnfRakw=;
	b=1DpBLHyDcGas+5LxngTg/HfUfrcMFKsK0ZDu9iK008XZVBkx5hDeWCjvxegryJAQrv
	E7MYtSulyvG0RcWbTyLTHb6/3LsY2OT/6DL4PBNMb/2R68qPKwP5K8ELN+rI6W2Pm6rX
	rfY4WVF1eCMxfnZH31wyYAltsHJec5olPS+m9P2kE+2ah7pTvJ4qgiPVOB6YcLsA/p7Q
	Vgmuq1Ialjh6oQ8oxk67RcVLL5Y41KlE5RuW689Iiz45eY52ad6bk/ygklExplbID3qk
	evDZVwPeOkAd0NLYyQmf4NUOiogI9KDeTrfZ3B7I4BnH5ygUmLtzuzmDx5KUGrpq7Pb3
	npcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JcER/62MIusMb36RxEDqPl3BcgB/AA+50rE3qnfRakw=;
	b=E1orBNAr+JY/x6zHQRItULKEqcMkbicbyHxTvbMH2fxzWJ4HPptjFYbGimpERisXQw
	NRRO5QYSuSI2Z2x6vAapCWjDcI3/vQMoTWrVp+Nq8omGFJ4iDnVpmnvdjzI0sgiTvGmj
	bWow39oeTWzQrxRrlmy62ObBwRmkJdZhx5tlpnrWYg99VWNKytOP1iGVhrpXijrnRnNo
	pyulfhim9wImArhmBJUuTu8XGhuXOHorVTWQNdUXFD+rhLwcHG7SaDGxpfkGcErz3isV
	PYJpRPshFKHYuUsvpauGBK+PD1/C/1T9jvy+JE1SkdUjTq4WRDJ6/1jeioEmG1LNa2rg
	1a9g==
X-Gm-Message-State: APjAAAX/Q9CO54iQwom99egwBuVaBhRxB+dw9IAEvQheu/UBeZ6WbEKG
	n356kIGsUNYuzaJrje2qNo+DWYHvikc=
X-Google-Smtp-Source: APXvYqxvwNU0CB6RiBJc9lCd+psytxJpqpQ4Pp+qt1D2yryckPmyc4XApn7ZYYzDjY4SY67IRyQ6TA==
X-Received: by 2002:a1c:7e82:: with SMTP id z124mr143517wmc.43.1551720714169; 
	Mon, 04 Mar 2019 09:31:54 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v67sm10137991wmb.9.2019.03.04.09.31.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 09:31:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 17:31:43 +0000
Message-Id: <20190304173144.25675-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190304173144.25675-1-ross.burton@intel.com>
References: <20190304173144.25675-1-ross.burton@intel.com>
Subject: [PATCH 5/6] util-linux: remove spurious lzo-native dependency
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
X-List-Received-Date: Mon, 04 Mar 2019 17:31:54 -0000

This was added with no explanation in 2010 (17f3c548c) and doesn't appear to be
needed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index cce684f2802..18c3af240eb 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -21,8 +21,6 @@ LIC_FILES_CHKSUM = "file://README.licensing;md5=1715f5ee3e01203ca1e1e0b9ee65918c
 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives python3-dir bash-completion ptest
 DEPENDS = "zlib ncurses virtual/crypt"
-DEPENDS_append_class-native = " lzo-native"
-DEPENDS_append_class-nativesdk = " lzo-native"
 
 MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP}.tar.xz \
-- 
2.11.0


