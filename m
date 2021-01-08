Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.27.1610114806492340439
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 06:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 210F5ED1
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C001C3F70D
	for <openembedded-core@lists.openembedded.org>; Fri,  8 Jan 2021 06:06:45 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][pseudo 3/7] Disable deprecated function warnings
Date: Fri,  8 Jan 2021 14:06:36 +0000
Message-Id: <20210108140640.1069133-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108140640.1069133-1-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Pseudo has to call deprecated functions because it is wrapping them, so
disable deprecation warnings.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 Makefile.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.in b/Makefile.in
index b43d2d6..d1f77d5 100644
--- a/Makefile.in
+++ b/Makefile.in
@@ -42,7 +42,7 @@ LOCALSTATE=3Dvar/pseudo
 BINDIR=3D$(PREFIX)/$(BIN)
 LOCALSTATEDIR=3D$(PREFIX)/$(LOCALSTATE)
=20
-CFLAGS_BASE=3D-pipe -std=3Dgnu99 -Wall -W -Wextra
+CFLAGS_BASE=3D-pipe -std=3Dgnu99 -Wall -W -Wextra -Wno-deprecated-declar=
ations
 CFLAGS_CODE=3D-fPIC -D_LARGEFILE64_SOURCE -D_ATFILE_SOURCE $(ARCH_FLAGS)
 CFLAGS_DEFS=3D-DPSEUDO_PREFIX=3D'"$(PREFIX)"' -DPSEUDO_SUFFIX=3D'"$(SUFF=
IX)"' -DPSEUDO_BINDIR=3D'"$(BIN)"' -DPSEUDO_LIBDIR=3D'"$(LIB)"' -DPSEUDO_=
LOCALSTATEDIR=3D'"$(LOCALSTATE)"' -DPSEUDO_VERSION=3D'"$(VERSION)"' $(SQL=
ITE_MEMORY) $(FORCE_ASYNC) -DPSEUDO_PASSWD_FALLBACK=3D'$(PASSWD_FALLBACK)=
' $(OPTDEFS) $(EPOLL)
 CFLAGS_DEBUG=3D-O2 -g
--=20
2.25.1

