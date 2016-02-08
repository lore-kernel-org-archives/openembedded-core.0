Return-Path: <armccurdy@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23DDB7327E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 19:35:52 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id fl4so401654pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 11:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4lgPTnuxlikLBeGjmSNj2M2FLnt421gXWhvbBooutQU=;
	b=kYmyou63FcWnvAViHTibVbeC/xY8K3GNGEm8N8+zlhP3eTRKYsV0AztErFfeam3gx9
	VWVTNPSojw1XaTFSO9irfaFIImHsZdx++9+R1yd/UtRwAvwDmIwScTIjiOI665wrB6js
	KJ112q1SEU/RcQe0RkGaUXnyoqL0gU0BUgKWxjfKOy9m1L7R+2jzNDpUPQsdzOa5KcDi
	fQ3/mvnTG5AXovapWusYACnCwDPUv883BVUIzRCrskivfYyx1RRkkPiZSJ0eUmxBEFwF
	rrqw1COlQ4oEyTzTMittaeyuoCkrOVrmoJqhqUOXlv3UGz4PJW1+u6pK9hhrHsuW8zc7
	jb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4lgPTnuxlikLBeGjmSNj2M2FLnt421gXWhvbBooutQU=;
	b=i1Noexd9q7D8MV4oDd1zdE8IBKt+r3yrL4phjxpbdkROds1SXxLugLw3pYzj2dk9+d
	gskon4R1H0a/r0p7nr9Y+t1Q8kuwfQNZNgurEHlGFNxw/28b+F7LghvXQrIfgbY0CNtS
	ICI/8RrewesOrktoUo3WBewR4nwLGAWxnfg/OtaWc/83mQuk0/jbvujq6qOV+MI4l+9e
	XhPTiDDi4q9myeTQ+7EcYZg9/R+k0MKuNbRhG1vrArPrK+wvCU/WYQ7FRC+VUiw/gAcA
	/Qaz0yHUhAvVq3z3CgTyPU+n7vKM+kkldhGeJNh5U46p0+2d+OeBw/IR/wCmIh+pbmaG
	WXJw==
X-Gm-Message-State: AG10YOR+vqLoGLEN+exT/NYBV9bIi8IAQAGcO9R1+ZKrEk5d6MOeeS6qvO/YU13MyPW7kg==
X-Received: by 10.66.252.163 with SMTP id zt3mr43184883pac.127.1454960153225; 
	Mon, 08 Feb 2016 11:35:53 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	70sm32085872pfs.78.2016.02.08.11.35.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 11:35:52 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 11:35:41 -0800
Message-Id: <1454960141-18350-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
References: <1454960141-18350-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] gdb: drop unnecessary CC_FOR_BUILD etc exports
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
X-List-Received-Date: Mon, 08 Feb 2016 19:35:52 -0000

These exports are all provided by autotool.bbclass

  http://git.openembedded.org/openembedded-core/commit/?id=edf30561184ec42e5692a55fdf93304fac0fdb1b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-common.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 6baeb0b..06272a9 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -22,16 +22,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 		file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
 		file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
 		file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6"
+
 inherit autotools texinfo
 
 SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
           "
-export CC_FOR_BUILD = "${BUILD_CC}"
-export CXX_FOR_BUILD = "${BUILD_CXX}"
-export CPP_FOR_BUILD = "${BUILD_CPP}"
-export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
-export CXXFLAGS_FOR_BUILD = "${BUILD_CXXFLAGS}"
-export CPPFLAGS_FOR_BUILD = "${BUILD_CPPFLAGS}"
 
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
1.9.1


