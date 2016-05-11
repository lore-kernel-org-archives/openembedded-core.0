Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 914E677081
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:26 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id zy2so4801676pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=h3U0fnLDUqkhwJ/ocpUEY3p5+Tb1w991pvhJkzCZKBA=;
	b=fX9ThNu8XZqJ7iK0hlIBKF76PbU/0hYAwgr8tG0cKegIKpee3narfvA3IUla/Qi4pS
	BwCAEVH/2NlBsso5PXctIo3NkZ4CrlFcro89NDQ0NpNAWyfNh/FeTeAUMQgOlJ4T/hej
	r9fN66XKvwjoO283TAQMn4FRsY6nklWXPw6/yC3YN43tI3flMeYfNJB6KyDSi1cbDmAR
	Zho62ML08aw9sZQQHnoU/PHW0SrvMKSDB2+07OvirkQU0Jy/58JMOeiI8vmpDa/EmsGS
	6HrYGfpXoznfpEtHatUi9h8j15VXnIsr+VCsk2z8VXvFnFw2cK1PeYOyx284IN38olTk
	NBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=h3U0fnLDUqkhwJ/ocpUEY3p5+Tb1w991pvhJkzCZKBA=;
	b=nIbM5C/8mud7n9IZGBynoYleJal7f7Vw1tmQurdoC0n6/Etv9gc7E7po71125TWLxJ
	fxbAjStlMXcxqvNgRQZSb3TtO64UtZNEKUAMGmj5OzJBQlfNLd+557ooF/OwJ+OUH07T
	wCVCEKfqwiYg7gwA21zkppJ+dvb9VlFnh5AAcWdaML/VgsvIUtUdFacfZKVsDOcYc/hI
	ftjRN2FPvEaECct8AOkenPv7z3JX8iSTjqKch/+/njA41S4STOmquo9WfkTCwjQ1fA/i
	ad+i4IfynRU9mBmt8l3BCime2F0lMwOVawh9cGBRya7vuf1gldFPIZQHE2Jri1tu52oF
	q14w==
X-Gm-Message-State: AOPr4FVVTHvu5F8xQhFKlS50+vuVC4pV6NFCs0XSAP/0AIWpEbBnDWSjiBmfOirJ0HAJrg==
X-Received: by 10.66.151.104 with SMTP id up8mr5074023pab.134.1462988187276;
	Wed, 11 May 2016 10:36:27 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:39 -0700
Message-Id: <d4ffe7c40a1f35b550edb4c37addc832346e300c.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH 36/42] bitbake: Oldest kernel for nios2 is 3.19
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
X-List-Received-Date: Wed, 11 May 2016 17:36:26 -0000

From: Marek Vasut <marex@denx.de>

The oldest kernel version for nios2 is 3.19.0, set it so, otherwise
qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
message from glibc.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/bitbake.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9c865d7..382dadc 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -405,6 +405,8 @@ SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
 OLDEST_KERNEL = "3.2.0"
 OLDEST_KERNEL_aarch64 = "3.14"
+OLDEST_KERNEL_nios2 = "3.19"
+
 STAGING_KERNEL_DIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
 STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
 
-- 
2.8.2


