Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.4214.1630675506386042163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96011101E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:07 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41B403F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:07 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/14] valgrind: set precise BSD license
Date: Fri,  3 Sep 2021 14:24:53 +0100
Message-Id: <20210903132459.2560051-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"BSD" is ambiguous, use the precise license BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.17.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb b/meta/rec=
ipes-devtools/valgrind/valgrind_3.17.0.bb
index 2805ad0eb31..3fa483d8bc0 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Valgrind memory debugger and instrumentation=
 framework"
 HOMEPAGE =3D "http://valgrind.org/"
 DESCRIPTION =3D "Valgrind is an instrumentation framework for building d=
ynamic analysis tools. There are Valgrind tools that can automatically de=
tect many memory management and threading bugs, and profile your programs=
 in detail."
 BUGTRACKER =3D "http://valgrind.org/support/bug_reports.html"
-LICENSE =3D "GPLv2 & GPLv2+ & BSD"
+LICENSE =3D "GPLv2 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263 \
                     file://include/pub_tool_basics.h;beginline=3D6;endli=
ne=3D29;md5=3D41c410e8d3f305aee7aaa666b2e4f366 \
                     file://include/valgrind.h;beginline=3D1;endline=3D56=
;md5=3Dad3b317f3286b6b704575d9efe6ca5df \
--=20
2.25.1

