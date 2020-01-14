Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7E47F971
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 00:15:03 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id l35so5012643pje.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2020 16:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gQctcKRQWr3/WFBx0fDqHSazbUpkcW/kK7tGJ30BXrI=;
	b=rnEllVpAnxiejdaG/b5LBHCd7tTstAFM+kJBKRCbscPWQqvwc3iLkqMhsYs2ixEXCJ
	71GtEP0jefBKmYuyIQCooUFEVxCBvY3Su2dW2VhpLgnaBcPikiK9tUEdbnuju+mHOEv9
	AtwM17HwuV1sZ6HnGvV4HeaS7osiWQWjqPyMRrvg3psXlsiijo5deViiH7/nEubm0eVz
	SHGH6Kw83c96nPXXUcwUl/LK2RGDoNoVel+aWFlwcY54JbuqOx8YsREws4Pb0+txvAwQ
	UpEUnwYJLEckYl9snFJFZ1VGov+P+XdymmHjOidEOGl9Vt0jNUZDSv4KocOC6R9tNTjp
	P+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gQctcKRQWr3/WFBx0fDqHSazbUpkcW/kK7tGJ30BXrI=;
	b=NEzbmk1FcD/VyCKF/JNwMRPtDJpow2AW/G0ppLUd3Z4lDSOxmCs7R7pU3z4oE6T2XI
	slfNx6pBsCuAI/US5w9S0EIy/Jrsm13QDL+GOFPqggAO1ApQZjO0Do5dNShoXJ6+OuSG
	GvlkOcowkLvo+OUOQHmRhcnyMAnAFBvXWZqWE0hYkf97ta7lBypcbuYIbq/+bv3E7h4W
	ZgIk52LuWSFqiBbdABewup7ExSxZsrxh897gpYmnB/Sdq/m7CTCZu4A02xvWW/agiok1
	iAfQa+uQLSHv4OOLE/Dqrw2SwAX4dg0UAJIb+Pi6JxcWmCEV+xj5V4qu/ddeHFdtAiKW
	Rjkg==
X-Gm-Message-State: APjAAAUSc8gbCM8xxKSYl1w0YEnOE/CWrnMq7UqCQ51Dfat49WZ8eXiZ
	2V7elUxpIg4eJA/vcwzkOrs7qA9iSOk=
X-Google-Smtp-Source: APXvYqzmkm8aXYQhFiZ09R7zD4zoqX70tLCBS82/jcGwdwMHHxdebs7MFY/xq+MZyySMeNFSgrkrEw==
X-Received: by 2002:a17:902:9a42:: with SMTP id
	x2mr17747672plv.194.1578960904089; 
	Mon, 13 Jan 2020 16:15:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id
	b98sm14394392pjc.16.2020.01.13.16.15.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 16:15:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2020 16:14:59 -0800
Message-Id: <20200114001459.294298-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] tcp-wrappers: Remove redundant forward declarations
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
X-List-Received-Date: Tue, 14 Jan 2020 00:15:03 -0000
Content-Transfer-Encoding: 8bit

fgets is already in stdio.h, and it can confuse the compilers when using
fortified headers, therefore remove the declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Remove-fgets-extern-declaration.patch | 43 +++++++++++++++++++
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch

diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
new file mode 100644
index 0000000000..88c8d9cae7
--- /dev/null
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/0001-Remove-fgets-extern-declaration.patch
@@ -0,0 +1,43 @@
+From 24d10919b4bc5e37a2d80b274d2cd2ee77b03549 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Jan 2020 14:25:47 -0800
+Subject: [PATCH] Remove fgets() extern declaration
+
+These sources already include <stdio.h> which should bring the correct
+declaration
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ hosts_access.c | 1 -
+ misc.c         | 2 --
+ 2 files changed, 3 deletions(-)
+
+diff --git a/hosts_access.c b/hosts_access.c
+index 329b35e..0133e5e 100644
+--- a/hosts_access.c
++++ b/hosts_access.c
+@@ -44,7 +44,6 @@ static char sccsid[] = "@(#) hosts_access.c 1.21 97/02/12 02:13:22";
+ #include <netdb.h>
+ #endif
+ 
+-extern char *fgets();
+ extern int errno;
+ 
+ #ifndef	INADDR_NONE
+diff --git a/misc.c b/misc.c
+index 74ca319..9a5e73a 100644
+--- a/misc.c
++++ b/misc.c
+@@ -18,8 +18,6 @@ static char sccsic[] = "@(#) misc.c 1.2 96/02/11 17:01:29";
+ 
+ #include "tcpd.h"
+ 
+-extern char *fgets();
+-
+ #ifndef	INADDR_NONE
+ #define	INADDR_NONE	(-1)		/* XXX should be 0xffffffff */
+ #endif
+-- 
+2.24.1
+
diff --git a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
index bd0c84c242..e903b9db14 100644
--- a/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
+++ b/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://ftp.porcupine.org/pub/security/tcp_wrappers_${PV}.tar.gz \
            file://0001-Fix-build-with-clang.patch \
            file://fix_warnings.patch \
            file://fix_warnings2.patch \
+           file://0001-Remove-fgets-extern-declaration.patch \
            "
 
 SRC_URI[md5sum] = "e6fa25f71226d090f34de3f6b122fb5a"
-- 
2.24.1


