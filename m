Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.11866.1601982889891223162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 04:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E0331476
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2020 04:14:49 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE2093F66B
	for <openembedded-core@lists.openembedded.org>; Tue,  6 Oct 2020 04:14:48 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] boost: don't specify gcc version
Date: Tue,  6 Oct 2020 12:14:43 +0100
Message-Id: <20201006111444.3952584-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201006111444.3952584-1-ross.burton@arm.com>
References: <20201006111444.3952584-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@intel.com>

There's no need to specify an ancient GCC version here as Boost will
probe it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/=
boost/boost.inc
index e74c7d6f7d..89df754744 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -169,7 +169,7 @@ do_configure() {
=20
 	# D2194:Fixing the failure of "error: duplicate initialization of gcc w=
ith the following parameters" during compilation.
 	rm -f ${WORKDIR}/user-config.jam
-	echo 'using gcc : 4.3.1 : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXX=
FLAGS}" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
+	echo 'using gcc : : ${CXX} : <cflags>"${CFLAGS}" <cxxflags>"${CXXFLAGS}=
" <linkflags>"${LDFLAGS}" ;' >> ${WORKDIR}/user-config.jam
=20
 	# If we want Python then we need to tell Boost *exactly* where to find =
it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; t=
hen
--=20
2.25.1

