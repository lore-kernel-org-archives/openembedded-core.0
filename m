Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 531D47E98E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 22:05:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q15so3220670pll.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 15:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M5zdDlZ1N64LKYt6napq55+rAbv7frVQGHsD++G8bHw=;
	b=UdqvbYmlSXfX9jnJ6GOtivb8NsIFyl/ZoZ946oL5oE9spJEgN95sf4gzkhksoQWMMd
	H7Y0+8dDgymkXqeLAb8zl8SVJX/DLEp8Akq4t4mu6+gUJxrTwjAsSC7LVLUw+fPA21kw
	pXW/bw+R8orv6g/fKbixpG4C2FDm4jLl2pf4j7c7M4LW9WeNP7UDOhMufFKYwwtossks
	PNn6xXrsjFNLFXzVs9gGIuFZewZFz1d7A/JNrcWQnKoKBFO2dESD7B/OSxZ4YXU+ff6k
	+6njbUZZV4X1IC6TVTKriYkzqXhVsQ4YN7eh9f9rhrNk1JpkN0q/+gDQgoIjku2QMD9t
	QZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=M5zdDlZ1N64LKYt6napq55+rAbv7frVQGHsD++G8bHw=;
	b=nMTmUhKo5+7Bg8s1scO0IK6Bauu8Ccme6DsId4WK3ZrHp0JhcrcmNJhEbYTGliY7XB
	4wlM0bXO8syjZxCp8ZPmMPCwV7DD07DbG2rx2xAqOuddE37nnQ4kEwV6u2RpLv4vEtss
	IogzKwPcDlSroHBAKrp3vrMV7MLBAeNzV8OFowaZX50Wz7s7WK6oSsi4xxe0fUOGCV3A
	s3ilQBh7xBsGwHX/uWk1EFcACa6KzcKUaC21hyHOCTlfSGyUcxiyEonkNLXsrjFQrTIk
	Gs6/eVXPMbW+Knp3TVXuVj8ApJWBDCl5b/VnaqwahwBp8RkFq529fPAHiTVR40+CVZKh
	3zDw==
X-Gm-Message-State: APjAAAUVlMuVvMUs2n1B3zT/YBssO9ek9ZiM356o6J2T73J5UXtntbud
	bWjNEI1GQamb2SbKZfZUHX0AieakTeA=
X-Google-Smtp-Source: APXvYqwOmzdysi6+F8iVr2TuDBC+OdHIkJwYUX+g8sC92iW2Eyrm/wqGPFZuUeR7NmEQmd8cwz/AjQ==
X-Received: by 2002:a17:902:b684:: with SMTP id
	c4mr667961pls.102.1569449100638; 
	Wed, 25 Sep 2019 15:05:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id q132sm23058pfq.16.2019.09.25.15.04.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 15:05:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 15:04:46 -0700
Message-Id: <20190925220446.1403940-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] qemuriscv: Do not blacklist clang anymore
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
X-List-Received-Date: Wed, 25 Sep 2019 22:05:00 -0000
Content-Transfer-Encoding: 8bit

clang 9.x ( which is now default in meta-clang ) supports riscv

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index df35f2808f..a42346f361 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -36,16 +36,3 @@ QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,por
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = " -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-device,rng=rng0"
 
-BAD_RECOMMENDATIONS += "\
-    libcxx-dev \
-    libcxx-staticdev \
-    compiler-rt-dev \
-    compiler-rt-staticdev \
-"
-
-ASSUME_PROVIDED += "\
-    libcxx-dev \
-    libcxx-staticdev \
-    compiler-rt-dev \
-    compiler-rt-staticdev \
-"
-- 
2.23.0


