Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1D77F7F5EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:16:23 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id l21so2763090lje.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HNInYf0sS3qXMFzyOXA+/7Ef+sgS8s6/JJBDIUUOMk8=;
	b=a6PRcdv+zl66qOoABzzuwUq9P30hmZvW7JzOdzWvXhdLgk+pxNpmSF7z3NVSINx4Em
	DMZ0hEUHDJxvgWUdgL6oDJ1VmVr5tjV1LCrl9uj9xaDQmR+XDn79PeKjzwJCFd4Rs67P
	xSRZl+aFDsNs1NEqAE2WvCR8dVBPTkhSC35j5cmunzOcS/11usPVXqOiEacm2n45y9UH
	2aMpCANB4aqfQ/DMOeLnii5nVjPsoqw3TEdMeRR8w8wmnwtW8G1C3QHOrpEK6wBT3jr7
	wVga1Z4rum9ivkji3/Hb8Qw5cGrgPUo11dYD00i57bnhi8Y/z8uNQ/7b8asGpwnY9NWL
	QcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=HNInYf0sS3qXMFzyOXA+/7Ef+sgS8s6/JJBDIUUOMk8=;
	b=eAoP+M22YSZpb4b5CU57LvBf1ERKwyZjwzxh0bfLQXdtr123LS1VMUyyhuuyRo/OJg
	wWF8WGTeDQ37JlKmAFEZCIGznTXFMA2wGHEkyq59vbTSWoH87fyN1OEN39Ednv3DDGHB
	G8CmB7ew5YmB1OhPOI4YeIYJYD0+ls/s06oUyof3YoOY00ReRH5lCY8zn/mHJMZcwnyR
	1p1Poi84WTOY47nmDE7IAFspR6tR5IcrrsRuqmU3NBNLJFvoPXi8AwIAbn6mzk1863P+
	LGvRn5PAQPE7GSQfrldmbHSgJpgBnJR5dHEo4r502BATcBU6XevkSHtvHn62m9tY77XZ
	uSqA==
X-Gm-Message-State: APjAAAVQB9JcBehOTo0czj6sG1gFqPFjiCiJRr9bXRJEOSd1Qn0PJEoU
	287IBnHBmc9G779dnmF+aEILxtc4ook=
X-Google-Smtp-Source: APXvYqzYP6BR+UULLe7fgy38d7e/wwOuuR0oWItYcwg5aYHAr0HQxBaCtfPvqI6UhblmIZXjVKMO+g==
X-Received: by 2002:a2e:9257:: with SMTP id v23mr2794243ljg.185.1571321783338; 
	Thu, 17 Oct 2019 07:16:23 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	c26sm1273044ljj.45.2019.10.17.07.16.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 17 Oct 2019 07:16:22 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2019 16:16:19 +0200
Message-Id: <20191017141619.9954-1-ricardo@ribalda.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [PATCH] i2c-tools: Add missing RDEPEND
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
X-List-Received-Date: Thu, 17 Oct 2019 14:16:23 -0000
Content-Transfer-Encoding: 8bit

Fixes:
 # decode-dimms
Can't locate Carp.pm in @INC (you may need to install the Carp module) (@INC contains: /usr/lib/perl5/site_perl/5.28.1/x86_64-linux /usr/lib/perl5/site_perl/5.28.1 /usr/lib/perl5/vendor_perl/5.28.1/x86_64-linux /usr/lib/perl5/vendor_perl/5.28.1 /usr/lib/perl5/5.28.1/x86_64-linux /usr/lib/perl5/5.28.1 .) at /usr/lib/perl5/5.28.1/Tie/Hash.pm line 190.
BEGIN failed--compilation aborted at /usr/lib/perl5/5.28.1/Tie/Hash.pm line 190.
Compilation failed in require at /usr/lib/perl5/5.28.1/x86_64-linux/POSIX.pm line 505.
Compilation failed in require at /usr/bin/decode-dimms line 41.
BEGIN failed--compilation aborted at /usr/bin/decode-dimms line 41.
root@qt5222:~# apt-get install perl-module-carp

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
index dcbd05aed4..c5761170aa 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.1.bb
@@ -31,6 +31,7 @@ FILES_${PN}-misc = "${sbindir}/i2c-stub-from-dump \
 RDEPENDS_${PN}-misc = "${PN} perl perl-module-posix \
                        perl-module-constant perl-module-file-basename \
                        perl-module-fcntl perl-module-strict perl-module-vars \
+		       perl-module-carp \
                       "
 
 ALTERNATIVE_PRIORITY = "100"
-- 
2.23.0


