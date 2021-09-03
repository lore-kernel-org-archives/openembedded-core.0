Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.4107.1630675511218068396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 06:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4942101E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 901F83F694
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Sep 2021 06:25:10 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/14] recipetool/create_buildsys_python: treat BSD as BSD-3-Clause
Date: Fri,  3 Sep 2021 14:24:59 +0100
Message-Id: <20210903132459.2560051-14-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903132459.2560051-1-ross.burton@arm.com>
References: <20210903132459.2560051-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The PyPI license classifiers include "OSI Approved: BSD", which does not
specify which of the many variations of BSD license it actually means.

The generic "BSD" license in the oe-core set is actually BSD-3-Clause.
From a random sample of ten PyPI modules that use "BSD", they are all
BSD-3-Clause.  As we expect the recipe maintainer to verify the license
anyway, and this matches the previous license text, explicitly set the
license to BSD-3-Clause.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/l=
ib/recipetool/create_buildsys_python.py
index 8aa44650d33..0b6b042ed17 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -101,7 +101,7 @@ class PythonRecipeHandler(RecipeHandler):
         'License :: OSI Approved :: Apple Public Source License': 'APSL'=
,
         'License :: OSI Approved :: Artistic License': 'Artistic',
         'License :: OSI Approved :: Attribution Assurance License': 'AAL=
',
-        'License :: OSI Approved :: BSD License': 'BSD',
+        'License :: OSI Approved :: BSD License': 'BSD-3-Clause',
         'License :: OSI Approved :: Common Public License': 'CPL',
         'License :: OSI Approved :: Eiffel Forum License': 'EFL',
         'License :: OSI Approved :: European Union Public Licence 1.0 (E=
UPL 1.0)': 'EUPL-1.0',
--=20
2.25.1

