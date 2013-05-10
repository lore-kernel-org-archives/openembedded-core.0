Received: from mail-ee0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UalET-00087a-42
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:11:25 +0200
Received: by mail-ee0-f41.google.com with SMTP id d4so1090357eek.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 03:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ZDerR7XHEpR8Nt7+LwOJ+qzucs7fiBTG1cEmgNIfrgg=;
	b=MpyaLGNItoqi4jkK9ZvwjBN5Nrnzlhn8lgNOspg8c2wJXaDHOwV5AsZlz+glNJqlbY
	b1QvI7alOa8UfnZX/AkDIxsPL3ProPaB6JKe+JiUUXulyK4Nz4CX71CRedYnma9uxQWk
	kQeX61OqtEX7kjRtW69gwe797EgJSV0Up8SZprvX9uis145PnSggeicn2NOW0Q34Kptk
	LiAxWMKQwpR69VdvvqvvtlnlPyGqC7NN4/VapuqUMHiIBHu6ZVlN5DZjVB5mAzUymu1i
	iEfRtzGQ1uLC28FVmjLcfevlUYDihIyMFDANtPmEZtACgfF9A8QELgT/GhWP21IcXeVZ
	gM9g==
X-Received: by 10.15.93.193 with SMTP id w41mr29397023eez.22.1368183199898;
	Fri, 10 May 2013 03:53:19 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id n7sm2871118eeo.0.2013.05.10.03.53.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 10 May 2013 03:53:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 12:53:12 +0200
Message-Id: <1368183192-26634-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <1368183192-26634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1368183192-26634-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/3] bitbake.conf: export STRINGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 11:11:29 -0000

* remove STRINGS export from systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf                   | 1 +
 meta/recipes-core/systemd/systemd_199.bb | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 86a4831..fda7bc8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -454,6 +454,7 @@ export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
+export STRINGS = "${HOST_PREFIX}strings"
 export NM = "${HOST_PREFIX}nm"
 PYTHON = "${@sys.executable}"
 
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index 08cb0c6..fadc385 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -86,7 +86,6 @@ EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 do_configure_prepend() {
 	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 
-	export STRINGS="${HOST_PREFIX}strings"
 	export GPERF="${HOST_PREFIX}gperf"
 
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
-- 
1.8.2.1



