Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6AB7F748
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 12:05:14 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id 4so14409593wro.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 04:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ZZK2JNxng6WapJStrJfsFStPmW+6lRkvG3CdJ+dpZX0=;
	b=e7O/zcH9JsTHxAxfr9xWZKg+yCTfyewZHM2J3DRrEoDYzMMjnh8jN/Wu4KLXarMHJk
	qx5XxvuEQg0ks+ofBwOeb9vvguc21e5Z4DStatloA2rCALpUbN/BRgbIHeqPkhPComqv
	rzmZMaiow5Vg+A4gGQPMaJUzb/9TnKVtWie8qkJ8RyNsWT7hDKLUhINOhgucHSmg9alp
	RmHu1UKE273G2nmEBYXBI/O68Pbnn+9nb89Ipvj0ldFMR0iESnUUyMLxfgKAMgghimk9
	iLe4jNxqM7meG8CWRKRuJFeEOp40uuhSN2d1wdX1jh1AnZ2nNbYngV7xaDJtuLBOWkoC
	vIUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZZK2JNxng6WapJStrJfsFStPmW+6lRkvG3CdJ+dpZX0=;
	b=XGpmlh86Hq4nZQc4XWDRigd98e2yXN3+Cp68YBwyec210BUglDhpx9D/jF3iwfR1ei
	F7YEu/nPronUg/zG9/wH2xqxGQZj4dR+WM9evEV/SY2siJxMK72lifWVtlvqruiZdYs7
	WyhplTxxn4nZOaF4uy9sKiX10vEPkhLnC3bklx5/tmVPBTcnwEQBznJGUnJE+U66JnOs
	qiTN131s+wl141cuAp0kkMRFdVaBSNLF6yQWgo+QdLVXIPSj8SiTXXtKdLmcJ4RWCGvR
	M+LWNaK4RBvk/+cVSqGxqPkd4RVTmgioSmgjEnDaXMS8mndjyq8q5zEssQ2z1hXIPP0i
	ijJg==
X-Gm-Message-State: APjAAAVX2KbArI7En0dUoGeFkiI1+mtCST2FA73gv3W2KYsmiH3cYiZO
	mYMRqqK02z2zzDFsqYGr8S8Td6jRbi0=
X-Google-Smtp-Source: APXvYqx8BxE0e3r2oV3yf49l7roZ47zdVVjxl25btC4SLpQ3n3S7TQ/mV4nPt7FRYZLstva7hedCEw==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr29459569wrm.94.1574683514854; 
	Mon, 25 Nov 2019 04:05:14 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e16sm10227411wrj.80.2019.11.25.04.05.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 04:05:14 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 12:04:34 +0000
Message-Id: <20191125120435.5203-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191125120435.5203-1-ross.burton@intel.com>
References: <20191125120435.5203-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] packagegroup-self-hosted: texi2html isn't a build requirement
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
X-List-Received-Date: Mon, 25 Nov 2019 12:05:14 -0000
Content-Transfer-Encoding: 8bit

texi2html isn't a build requirement and hasn't been since 2012 (oe-core
aa1c451).

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 7f40e56a19b..996757f7e13 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -167,7 +167,6 @@ RDEPENDS_packagegroup-self-hosted-extended = "\
     sysstat \
     tar \
     tcl \
-    texi2html \
     texinfo \
     unzip \
     usbutils \
-- 
2.20.1


