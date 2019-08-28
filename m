Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2757F27C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:28:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x4so1780148iog.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 12:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0VSViakQXDI0Ssm+alWXfJauXL1MZSxMBdra+Qw549Q=;
	b=cisWVX5vLE4hQBz9z6g4tpZ118MVhhVrKF43fMUge3gEz6fFFaJoMzV3hIr1xcXYxy
	ZbjPY7dMfHdbBMaVGF4MADbT7ZjP3yQUA1oiKcsIS+z8xEMGW5v6NV9Iq1J8RF3+qEY4
	QTouYvSX+F8SJaqxX5BEA9I7f1KeR4SPOI4+BsI3sgZe3ipvLJV90Cd5JEHiNns274vY
	8kZP50KD//p3z/lvWgSNW+9Z7RPTPR36gUMcgJY7AjOFDeQ6TYs1/P2vTI+TeYp2wlFH
	/hziSgnXHDHCrMzEzlzWHjzwgD96RKuPyCBD3u0Goajx4jmy8xWqFkMe23PzcIlzOjlm
	Ax3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0VSViakQXDI0Ssm+alWXfJauXL1MZSxMBdra+Qw549Q=;
	b=lDutaT+smQjxiCjI8I6grqD07FwKBBo36BYiVlLT3FQppt52bkSRzM7L2OJlra77iF
	DEI0HzQ91yj/bBSTynGcVQ4qyn1CZCGVGOUdjeLlwWcJaVcKj0u3Ncsb+PGsGbxyPy/F
	FE92ddm6AcJDm4gBnxS7Ii8c/QBlih+yvhhBCYIVIApsHzmOn/cq6fEcVQMGWmYI0Tpg
	K30V+UzoBBsZOipkKFbPigzGSJdPC1k2cYrET7kDGzoLvSeqUiU55D48fU/6zDR5c3oY
	sLSZdBBbxbdeioMOvDQTPRmevHK6bNrqsKyUmb5ljSiuVH25toa7Ta/xxF1XvgrHCW8p
	fCLw==
X-Gm-Message-State: APjAAAUNj14wmdQTWpsH75LWTHDLl48c2eCDS9JvaPlMQIwZ+tk4JC0G
	522UOVshn+UT3Z1RVQv2E0/+n33uLA0=
X-Google-Smtp-Source: APXvYqwE6BVCk1tMgt8lgbTchEMl2XqUkP+EBHVG0bWB1cX9SMVfuHjPfBOz708fCIAjal6TkPoKww==
X-Received: by 2002:a5e:9515:: with SMTP id r21mr6525981ioj.257.1567020533388; 
	Wed, 28 Aug 2019 12:28:53 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id d6sm4454375iod.17.2019.08.28.12.28.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 12:28:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed, 28 Aug 2019 15:28:38 -0400
Message-Id: <4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567019771.git.bruce.ashfield@gmail.com>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 19:28:52 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Witht the approaching EOL of python2, the kernel packages need to
be updated to depend on python3.

The core kernel scripts are now python3 safe, making the RDEPENDS
change relatively simple.

but

There are some scripts that are captured in the devsrc files that
are not used, but reference /usr/bin/python. The python3 package
does not provide /usr/bin/python so any package managers with
automatic dependency detection will fail to assemble a rootfs due
to the missing intepreter.

We could drop the scripts from the source capture, but that
risks dropping something that we need in certain operations and
we'd miss when they are updated in tree to explicitly call python3
(since they won't be revisited often). Light testing shows that the
scripts do run with python3, so rather than removing them, we change
the interpreter once they are copied, and automatic dependency
detection won't cause us rootfs assembly issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 3900489ac5..e17c0ea0ab 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -240,6 +240,15 @@ do_install() {
     # Copy .config to include/config/auto.conf so "make prepare" is unnecessary.
     cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
 
+    # make the scripts python3 safe. We won't be running these, and if they are
+    # left as /usr/bin/python rootfs assembly will fail, since we only have python3
+    # in the RDEPENDS (and the python3 package does not include /usr/bin/python)
+    for ss in $(find $kerneldir/build/scripts -type f -name '*'); do
+	sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "$ss"
+	sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "$ss"
+	sed -i 's,/usr/bin/python,/usr/bin/env python3,' "$ss"
+    done
+
     chown -R root:root ${D}
 }
 
@@ -249,7 +258,7 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 FILES_${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
 FILES_${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
 
-RDEPENDS_${PN} = "bc python flex bison ${TCLIBC}-utils"
+RDEPENDS_${PN} = "bc python3 flex bison ${TCLIBC}-utils"
 # 4.15+ needs these next two RDEPENDS
 RDEPENDS_${PN} += "openssl-dev util-linux"
 # and x86 needs a bit more for 4.15+
-- 
2.19.1


