Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id F2E337CE8C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Mar 2019 00:25:16 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id x9so18218761iog.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Mar 2019 16:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zZOdrMStwdUGKHuOyJY4yXljo0xTKRc7WgixlAQxYvw=;
	b=Qax2yh7lRHWQUQAk1XdzfP6qJuWCGSUnIVvBhQKTDh4zxSSLd55rjlF4QS9vdQRz2B
	qGosFUpnmqfQpiugsLx+apLERBBwutNc0/yWslvYyJzvl7pwHzij4w1E1htSx2ztABBx
	UmOKHtgfZvFkiemHfuMhIrUHnZXdAbAcOjTLydB+lKI7rga9BmqY4NHHEKRETUEjBGPR
	EBXjk7X85FbnV/g86adeo5tTD+wmaInqHKd906Ln/Cxh9Q6fqJKLT/IM+y9tuvpGMYtg
	qFfRaEwqXlJh8623Em9M0kwVqVTYRKvGOMNNUNEOLRej6awNTSH/4eoLB6wTA099m1ut
	YwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zZOdrMStwdUGKHuOyJY4yXljo0xTKRc7WgixlAQxYvw=;
	b=gxLs7r0XNlMXdU/s886o+H3XZNvHf54fz0dsivWniUX3pnK5pVH/SsXV3bEv+KpFyb
	MDLKH8uLEIMKr/ngmJJX5kQwTlbHBkda3VlpWK8Mx65NfZWSJe8eMrHfNo7lcxbrpeXL
	ZMxdGiMyri2A+x6aLu5wSxgZVMxBEAUnSkSZiO+MCzDxBnHWTpQJewUJxZgZ4raG4UE5
	K6mcQ+PyXTlwTIYSo0DpKQ/GH654di9GvjIWPkstyWAPLeZIoJyG87TISeJKhrNF7E02
	8bt+Ocpl46GHCWUIy4lzvWppS7b/oVFWGOdrByjyFnOOIw5ITHiW8N8xhJsFvGunifWr
	pk4g==
X-Gm-Message-State: APjAAAUlRsYFTzN4QkLKTXpr3GcR14Pw0PStl0tTm47m2rPUXt3nLZ5F
	VCfvafVHk2bo4IeYH7DCPrGQc/mCsqA=
X-Google-Smtp-Source: APXvYqy6heXVdzMizvxtobuOOIHMEvhRALUtxwitxt6weMHf5xg7QG+UL6oPPMllY+k4T8zb5BY44Q==
X-Received: by 2002:a5e:8c07:: with SMTP id n7mr3633904ioj.301.1552091117737; 
	Fri, 08 Mar 2019 16:25:17 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	t62sm4728635ita.35.2019.03.08.16.25.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 16:25:16 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri,  8 Mar 2019 19:25:15 -0500
Message-Id: <20190309002515.12754-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] kernel-devsrc: make mips devsrc files backward compatbile
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
X-List-Received-Date: Sat, 09 Mar 2019 00:25:17 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The additions done to devsrc to support the 5.0 kernel should have
had a graceful failure mode, since the files/directories won't be
present on older (or different) kernel versions.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index cf2b476051..6daeea4f7a 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -221,8 +221,8 @@ do_install() {
 	    cp -a --parents kernel/time/timeconst.bc $kerneldir/build
 	    cp -a --parents kernel/bounds.c $kerneldir/build
 	    cp -a --parents Kbuild $kerneldir/build
-	    cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build
-	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build
+	    cp -a --parents arch/mips/kernel/syscalls/*.sh $kerneldir/build 2>/dev/null || :
+	    cp -a --parents arch/mips/kernel/syscalls/*.tbl $kerneldir/build 2>/dev/null || :
 	    cp -a --parents arch/mips/tools/elf-entry.c $kerneldir/build 2>/dev/null || :
 	fi
 
-- 
2.19.1


