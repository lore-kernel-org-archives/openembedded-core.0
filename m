Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFB7719F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 15:37:58 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b201so152356530wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 08:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PaA8UbNopRA1eulqD01LC6PPhe+IaDn/IZOrohoIYDM=;
	b=bB6evGRGpUqxKTTLn1yQ7hCDu5jiO8ZaLizeFFF2QHnS5kSE2UC6qmvioNrTEb2lwV
	AoyOzHNoqhQjD+epepsiLENy/Uczkopj/PcTFtAasaYaYKEsy8IWQU+XqZ43hWs1ImKg
	GyaHmVHg+hElz6HacWV6iUH20emC1/rENt+KgJsjauJjjnbzxAImrh6g9CmET10kPYQR
	dpGMItkSPxQ7EF6EAbVXV4AJpLMNkaVh0n3uypkwWZfmo6EZRw8BSvhkj806Ici2Mb3i
	066wnHZaqWt6c1z8tn8q0g3YKXBB5wO7JBSpwkuzNbGavAdpJ4OR7EPcEme4Fcs1YvGd
	g+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PaA8UbNopRA1eulqD01LC6PPhe+IaDn/IZOrohoIYDM=;
	b=aTCoP7eAKNxyOnE1/ialvtfZwfrP/kGsfP47p5kT2DLHeOF1t803bSM+nFlutY5Bj/
	a0uVNTZdYiQyi8s7rNMqrLOudMd94/OLt0zAjXhViBytrsNjswJRUNU6xP8i0Ez0ndtn
	l3cZtW3Fr4tWs28Em3+0Y1SyIfJXs+OtHTiSa7GqpdcFXEC2L4KL1ZQJU6GIxDGi572N
	jqgGGcydvydscJhBJPkkj0otMrTsMvp8BXMbdmqIf7hRV6/r0fdSCXtcUmst7kMzO8OW
	7sF6MMQxq8ArWZ6MetT/zHSuRxf3kJl/khwRlEIO3mBXmDKJacULAR7ia9bMMGKv1zKI
	mQ7g==
X-Gm-Message-State: AA6/9Rnfjy+uEPz0QyGN3pZag5Xfo5CpwzeTvpEGcXOJaOGottpro38El1KiXI65ousYgUbC
X-Received: by 10.28.47.211 with SMTP id v202mr4133544wmv.73.1475595478640;
	Tue, 04 Oct 2016 08:37:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	us3sm4114485wjb.32.2016.10.04.08.37.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Oct 2016 08:37:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2016 16:37:52 +0100
Message-Id: <1475595473-19221-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] json-c: add BBCLASSEXTEND for native and nativesdk
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
X-List-Received-Date: Tue, 04 Oct 2016 15:37:59 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/json-c/json-c_0.12.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/json-c/json-c_0.12.bb b/meta/recipes-devtools/json-c/json-c_0.12.bb
index d8c76db..a15455c 100644
--- a/meta/recipes-devtools/json-c/json-c_0.12.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.12.bb
@@ -28,3 +28,5 @@ do_configure_prepend() {
     # Clean up autoconf cruft that should not be in the tarball
     rm -f ${S}/config.status
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.8.1


