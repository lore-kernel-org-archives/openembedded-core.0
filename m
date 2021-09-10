Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7164.1631269255315766597
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEBB7101E
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72B313F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:54 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] oeqa/core/target: remove abstract decorations
Date: Fri, 10 Sep 2021 11:20:46 +0100
Message-Id: <20210910102050.1266413-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
References: <20210910102050.1266413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

There's no need to inherit from object in Python 3, and marking the
methods as abstract is overkill considering the type hierarchy.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/target/__init__.py | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/core/target/__init__.py b/meta/lib/oeqa/core/t=
arget/__init__.py
index 1382aa9b523..3da66038342 100644
--- a/meta/lib/oeqa/core/target/__init__.py
+++ b/meta/lib/oeqa/core/target/__init__.py
@@ -4,33 +4,26 @@
 # SPDX-License-Identifier: MIT
 #
=20
-from abc import abstractmethod
=20
-class OETarget(object):
+class OETarget:
=20
     def __init__(self, logger, *args, **kwargs):
         self.logger =3D logger
=20
-    @abstractmethod
     def start(self):
         pass
=20
-    @abstractmethod
     def stop(self):
         pass
=20
-    @abstractmethod
     def run(self, cmd, timeout=3DNone):
         pass
=20
-    @abstractmethod
     def copyTo(self, localSrc, remoteDst):
         pass
=20
-    @abstractmethod
     def copyFrom(self, remoteSrc, localDst):
         pass
=20
-    @abstractmethod
     def copyDirTo(self, localSrc, remoteDst):
         pass
--=20
2.25.1

