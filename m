Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 584E577302
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 10:35:56 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l66so63383868wml.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 02:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=EKNHXL2oh/3Xk0guMQ0YAl4fT1D5/hTkyE3xJxpNoCg=;
	b=Esj5JJThxLP4DKZdq1cf8JLzbhA/mviP4eWPSr6Lo6Bcy3aIALzP16k0CNyx9y/IWi
	EFoedeWZ5V7/DYRrDvWBh/mCsdP5CXFo03H+Wsza/L21AvfPBplrmE1IOPVVO4zIvHX7
	vtsvE2Dlgaj4+pcaobRhHkJRHd7XG6HJ+UztJkb0bDgJnO19qWPKtj4Blwyi+HvI7985
	da7vEWta4Wpnll0r65WCnatt42ysxCkP19ugLEFE5VFV3sRXZ9MB8d2YMPxws6FqfStz
	Ldy0tn7EFPjg5LASwqCNbeFI5G0/9Yx8X3qt1tu7FFm7UOdzH3Y3/LumLQqVT4kU3MaK
	Ppwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=EKNHXL2oh/3Xk0guMQ0YAl4fT1D5/hTkyE3xJxpNoCg=;
	b=MmM2Ock8QyrNJkMV65T03o4zI4pJ0y4VSfP9kLmVFdTXDvR/Z1iabsVbFB9LCrzgbZ
	0fKreqrfq+jizL2BFaJOgPl7vXczEdJ7dA3fdaRodPrTv8mRoBWrPgtjSa6LIPPCYPyE
	AOgUsX8VdOOet19gUNbGk3tedre18+ZHau3wF5OwGxDYV2GuL1T0qdkcZmrx+SSEZ7KK
	2l4Hz5/1QKf7GC9/gJPl94YvT1uJj3FOPjtf/YWpvsFJ7unIqQfT1EwrG9P/IynxFuuR
	XR5ZP6blfm/URq092mW2m3/bT3aI7Wa7jHKS1xdUqnEdaotIKCSUSbKO2P0MKo2Yd0zZ
	xZoA==
X-Gm-Message-State: AG10YOQWK1gKE4tc/9yZ1jtJdz+NkkqttILqfFB/6CsMgNURz/GRAeYIqgRbxOvHxmYtBJ3z
X-Received: by 10.194.88.195 with SMTP id bi3mr1031672wjb.34.1454495757126;
	Wed, 03 Feb 2016 02:35:57 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t205sm7180029wmt.23.2016.02.03.02.35.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Feb 2016 02:35:56 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 10:35:55 +0000
Message-Id: <1454495755-6949-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] p11-kit: fix packaging warnings
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
X-List-Received-Date: Wed, 03 Feb 2016 10:35:57 -0000

This recipe was ignoring the wrong test, so update INSANE_SKIP.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
index 798ad37..a4efff1 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -18,4 +18,4 @@ FILES_${PN} += " \
     ${libdir}/pkcs11/*.la"
 
 # PN contains p11-kit-proxy.so, a symlink to a loadable module
-INSANE_SKIP_${PN} = "dev-elf"
+INSANE_SKIP_${PN} = "dev-so"
-- 
2.7.0


