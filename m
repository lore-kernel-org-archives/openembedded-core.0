Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E7F2E719B0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 20:46:30 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id v184so9982162pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 12:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NtbKA+VV7AuDQWH23OieUEJ92McwpA8hz1jQqy860q8=;
	b=oAclrUjyeM/PcQF9bsXl2CPV/eOQdfguF6JugtJ2xa2jKV7knFa1v4dZz5bQ3szz06
	PG2/Hu8otD/mXAJ5l+MYpJuf4SftKGg+xJstF0BsrG5wKm6XzqlxJqX1OI5gEzsb4vHc
	SpprEmqkiaFYzxcGuD3vigVB5LsDpFSVmOKBe2SMyedpoiY80930NO53iB69j5Y/GdqQ
	FoRlSMH2UfY2+o7kUroGfLBHb3AkhzKADbdglbPbSc2fj0Ip0ML25X7jTe25HIEQ7Lmt
	cP6B0DwhPuQ07x7wNMjG815TWilMut8KvdQ3rLVWVSoJeoTFbptPUXByU7btz0QuZF3Q
	Al2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NtbKA+VV7AuDQWH23OieUEJ92McwpA8hz1jQqy860q8=;
	b=XbG8d2ezx10IUDxZwb5BKvYf34vvxS9Zl0F0u201KnE8k56D7bhV0E6qfwF7/D07hF
	jsRw0+7jERiRiPSIwgD4/NJ7z2LvvO+9joBkfkC2232RVXca+baI5bwM7Pim1HvPM8Lt
	n7c7YddWrEif/W9iAn6rFoV9itz1wLyiYY7Cd455zNB6ux9vic2e8wJQQkjAaAt9EmA3
	lZFODBvw04t52ZnY7qQH11gI4QkshWsLZJMlukiD7kt4mSmOwdh6XJJnLXpjvuTX50sb
	7HKNLfPjo4ezwxmHKyNt3uu7KD/tKzZVqO1AzTKWk7hsUCXuOkkLyA9V24BfQv0X0diD
	eNdg==
X-Gm-Message-State: AIkVDXK2ser192xm6WJ9HNbwcFE+OfAAmu5tk+bPZuSZQfBHSWx4WnAehxQV58deyjBTuw==
X-Received: by 10.99.100.70 with SMTP id y67mr15390887pgb.74.1486413990944;
	Mon, 06 Feb 2017 12:46:30 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l12sm4868386pfj.37.2017.02.06.12.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 12:46:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:46:15 -0800
Message-Id: <20170206204616.26245-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170206204616.26245-1-raj.khem@gmail.com>
References: <20170206204616.26245-1-raj.khem@gmail.com>
Subject: [PATCH 4/5] iproute2: Inherit pkgconfig
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
X-List-Received-Date: Mon, 06 Feb 2017 20:46:31 -0000

Fixes
ERROR: iproute2-4.9.0-r0 do_package: QA Issue: iproute2: Files/directories were installed but not shipped in any package:
  /usr/lib
  /usr/lib/tc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc b/meta/recipes-connectivity/iproute2/iproute2.inc
index 63e7ca9e83..ce64888a05 100644
--- a/meta/recipes-connectivity/iproute2/iproute2.inc
+++ b/meta/recipes-connectivity/iproute2/iproute2.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 DEPENDS = "flex-native bison-native iptables elfutils"
 
-inherit update-alternatives bash-completion
+inherit update-alternatives bash-completion pkgconfig
 
 EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR} DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
 
-- 
2.11.1


