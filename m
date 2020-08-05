Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.1300.1596605908039173495
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2020 22:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Mj3xVKMP;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id DE32620B4908
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2020 22:38:26 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DE32620B4908
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1596605906;
	bh=M/VEUbAIsU0xmPXs/vYkhM7OqcpHX1aqUvN0CtKlZeE=;
	h=From:To:Subject:Date:From;
	b=Mj3xVKMPK3NP7/FMgYsHY9wmlXsGiJoyMyeiveD6avEiz+D570vWgS5SPYgaGXn4D
	 I3vja/w+2mYOfrLNrREANbVxASTz+dM9XEcaauwH3ggbncxI31wRe0w/uZb2X8arP7
	 xXLA+uCiL1bhVr2qzWD+JF0QwvGOqvaCC67Zbp7Y=
From: "Alejandro Hernandez" <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] musl: Upgrade to latest release 1.2.1
Date: Tue,  4 Aug 2020 22:38:20 -0700
Message-Id: <20200805053820.17794-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alhe@linux.microsoft.com>
Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index ed2178b5a4..51b19e89a5 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,9 +4,9 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "0a005f499cf39822166dd4db3d2d31f0639f1b1b"
+SRCREV = "73cc775bee53300c7cf759f37580220b18ac13d3"
 
-BASEVER = "1.2.0"
+BASEVER = "1.2.1"
 
 PV = "${BASEVER}+git${SRCPV}"
 
-- 
2.17.1

