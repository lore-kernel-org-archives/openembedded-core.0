Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA497825B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 08:51:20 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f28so9486268lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6uebA0a3ywOA+2hXSI1bpUryenq1MNcA6ummvZ7k3XM=;
	b=XefYCv6x9C0e8lOJGKMXoVvsx/DZPoZiyKiYOs/GkXE26dP+wZUew4C3zn0RjuuP+/
	mnRmCZ7wWmInp5m6q8YWhSw+aR27iNjJhF3Lifnblk9wKYm6IIGcj0ncgj761GgTalcA
	Z1Dtx7GOPcnknSejtx6p0njRXdfDpGXSglZH76oCAIHduki3Qy+mCXd4nRNU60vhIUUY
	r2oDhGqr9ReUtL86Kd+npXDNW+959+ZmcxDuG+l4Vsmg8uahFckTzZjq5eTn8fPwq8ia
	hFZ8HNHuzqgrNcRg0iHET7UrNjal6wZkGe4QBOljbzVed3wsD8DiPMeUeSJTtgb2WkAL
	Un9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6uebA0a3ywOA+2hXSI1bpUryenq1MNcA6ummvZ7k3XM=;
	b=i5Po6aI1r2hh4KBZQQ+UUcCAYmNEkR3eTgPjJxK5mnJhWjVXUiP/YmQztwQkwBCe3V
	zn2mTo+B92CzxQ77vG9RvFvF9EzdfXJKdWXo0CAr0OeMFkPJsleN1ULkXLi45srF0NQN
	Yo1dfw706z6Ej5k4b8DKbarVZ0UcKHH/Dw3BHeCzkA2k5qcF3/GOhd2b9yXftEot+xVi
	fhFRIpi6RAWjfvNGSN9Fj2T8Xyt2kveCG547QUSWxgRAZMKF1GHtY0ckc8zOqP/jbi/z
	4IDzwm/sdx3vzaCT8ARrNvlH9ae6bxlNMO7882762I26xUnkCCHhzJ0LMMx9iFO0jVf1
	vzeg==
X-Gm-Message-State: AKS2vOwYIOREIju0l0el5KTb7va1b/VbMPAAttshKzDaCIaBWId1XUIR
	DZmw6WJr8yVgYXiwzLo=
X-Received: by 10.25.216.132 with SMTP id r4mr6061483lfi.26.1498812681121;
	Fri, 30 Jun 2017 01:51:21 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	f46sm1883560lfh.51.2017.06.30.01.51.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 01:51:19 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2017 10:51:14 +0200
Message-Id: <20170630085114.32050-3-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
References: <20170630085114.32050-1-ricardo.ribalda@gmail.com>
Subject: [PATCH 3/3] libgfortran: Add missing fincludes
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
X-List-Received-Date: Fri, 30 Jun 2017 08:51:20 -0000

ERROR: libgfortran-6.3.0-r0 do_package: QA Issue: libgfortran:
Files/directories were installed but not shipped in any package:
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_features.mod
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_arithmetic.mod
/usr/lib/gcc/x86_64-poky-linux/6.3.0/finclude/ieee_exceptions.mod

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-devtools/gcc/libgfortran.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 3b94c1b85b70..5f5d4af7589d 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -54,6 +54,7 @@ FILES_${PN}-dev = "\
     ${libdir}/libgfortran.la \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libgfortranbegin.* \
     ${libdir}/gcc/${TARGET_SYS}/${BINV}/libcaf_single* \
+    ${libdir}/gcc/${TARGET_SYS}/${BINV}/finclude/ \
 "
 FILES_${PN}-staticdev = "${libdir}/libgfortran.a"
 
-- 
2.11.0


