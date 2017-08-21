Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id CE162782B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 20:55:17 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id p8so16863593wrf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 13:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zhrYaXPtN8hJ7/lUqhmn9iUTxhoa4Cl7ZgkddaVJ9e8=;
	b=tnnR1wvy25UPcHiHR7FFFHRbqpyGoXD3/eHtX2Fa80nrm/lONq3N/mPqQG94nAZB+E
	FkyNqvnbmR2XnOi6cgLYGcpRSDuMU+rejGddYUjkWM50uoYJymIM5GdexqI0Dr5l9M5G
	cJaFoJ5m+N3b4G80ErLuXBM2VTVD+rB2/ruk2NRfJLHVwmUrHApOIa58zlIScOaOLrnd
	KtMKJzgv+Kg5M/phpUAJha46jEKsfKzWhJpEK42brNILOY5W8wGkaSEN4AT3kiyQdJYA
	jt7WF2HDjN3kxdn4VRlLk62+MckGUlcutF/brtV1Ga7RygbdWrgBXEMVI0iY2J9siOsG
	BZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zhrYaXPtN8hJ7/lUqhmn9iUTxhoa4Cl7ZgkddaVJ9e8=;
	b=nOKjoG89u8UzBmepI3P8vdygLzQtCBtpn/tnW/otHwg1XvyDyA48UCDTw8DXks5WlM
	IBk0amBXKWNK5kvc9L5AKiq0SSuKmwefAfeFsY+riAk5el6v2Grm8XhVHg5KBjtE77YM
	ekH+fpFTl+nLwOSLRi9RYHTKv45+s5hUa5KkZICcw1UQtdOx+UBS30XIVrXHi/37B//D
	RAxMwdhDxb1hhjbTDq+6tsc9Y83SHIxH5+Ed5U3O4V8x8HOxREImlK0md02o62XvoTzC
	d9qrNy3hmj1jR7hxVvRsKYLSErg/YBVCcdbhwI+LDba+PATe/clDTIE0xQhg5R8QiIhl
	Vy8Q==
X-Gm-Message-State: AHYfb5hfSWkSLwPJNlEqy3r+3pkvJEbeLCIjxYAk1Y1iq+K+ylQ6/Ohh
	1QsMGRUcmvyEf6Ti
X-Received: by 10.223.130.49 with SMTP id 46mr804178wrb.109.1503348918313;
	Mon, 21 Aug 2017 13:55:18 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	w61sm10416072wrb.49.2017.08.21.13.55.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 13:55:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 22:56:59 +0200
Message-Id: <20170821205659.20036-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <CA+chaQfbEAVhPbPeOi=vfMcjds2DMGtMGz256gode6+2NdzMug@mail.gmail.com>
References: <CA+chaQfbEAVhPbPeOi=vfMcjds2DMGtMGz256gode6+2NdzMug@mail.gmail.com>
Subject: [PATCH] libcheck: fix file-rdeps QA issue
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
X-List-Received-Date: Mon, 21 Aug 2017 20:55:18 -0000

* Fixes:
  ERROR: nativesdk-libcheck-0.10.0-r0 do_package_qa: QA Issue: /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/checkmk contained in package nativesdk-libcheck requires /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/bin/gawk, but no providers found in RDEPENDS_nativesdk-libcheck? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libcheck/libcheck_0.10.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-support/libcheck/libcheck_0.10.0.bb b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
index 4db2d7528c..9d34198a96 100644
--- a/meta/recipes-support/libcheck/libcheck_0.10.0.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
@@ -20,6 +20,5 @@ CACHED_CONFIGUREVARS += "ac_cv_path_AWK_PATH=${bindir}/gawk"
 RREPLACES_${PN} = "check (<= 0.9.5)"
 RDEPENDS_${PN} += "gawk"
 RDEPENDS_${PN}_class-native = ""
-RDEPENDS_${PN}_class-nativesdk = ""
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


