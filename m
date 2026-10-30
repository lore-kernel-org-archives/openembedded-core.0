Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17050.1793381415817763819
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=iMIPxrpX;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30E4D1682
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:30:12 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03AD93F59E
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 10:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793381415; bh=bkueleo54n21+P0BJBjWsqZS73AaVfh2vaiUZwFK6a0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iMIPxrpXrKHIiiTH+KfZICfFLmDn5Ubsa3FKZ+mI3KzCMNebRN0HP/9WqIa6slCZy
	 SBWnDj5DSbpqgOJksdMlnN0hvIz7nYi8NhHrIo7+OfqoHvpX9jJQSkWvuVkzgonMy0
	 9UHi58++tcsvi5Y9miecyp23S+uLRw2/3CFhlWKM=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3: fix packaging of zipimport.pyc and sysconfig_vars.json
Date: Fri, 30 Oct 2026 17:30:09 +0000
Message-ID: <20261030173010.4102708-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030173010.4102708-1-ross.burton@arm.com>
References: <20261030173010.4102708-1-ross.burton@arm.com>
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:30:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249060
Content-Type: text/plain; charset="utf-8"

Neither of these files were explicitly packaged, so they ended up in
python3-misc.

The JSON sysconfig data should be packaged in -core alongside the Python
sysconfigdata.

zipimport.py is now in core, so zipimport.pyc should also be in core.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3/python3-manifest.json | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
index 008d41e5654..50fdf5d0eae 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -201,6 +201,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/pager.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sitebuiltins.py",
             "${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py",
+            "${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json",
             "${libdir}/python${PYTHON_MAJMIN}/_weakrefset.py",
             "${libdir}/python${PYTHON_MAJMIN}/abc.py",
             "${libdir}/python${PYTHON_MAJMIN}/annotationlib.py",
@@ -402,6 +403,7 @@
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc=
",
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc"=
,
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipimport.*.py=
c",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/_pyrepl/__pycache__/pager.=
*.pyc",
             "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
--=20
2.43.0

