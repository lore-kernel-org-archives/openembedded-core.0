Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BEDBC433EF
	for <webhook@archiver.kernel.org>; Thu, 26 May 2022 17:10:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22516.1653585014406904572
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 May 2022 10:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8C01150C;
	Thu, 26 May 2022 10:10:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A0FA3F66F;
	Thu, 26 May 2022 10:10:13 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [RFC PATCH 10/10] documentation: remove obsolete PEP517_BUILD_API
Date: Thu, 26 May 2022 18:10:01 +0100
Message-Id: <20220526171001.4074388-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526171001.4074388-1-ross.burton@arm.com>
References: <20220526171001.4074388-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 May 2022 17:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166196

This variable has been obsoleted, so remove it from the documentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst   | 4 +---
 documentation/ref-manual/variables.rst | 5 -----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 729aa259e02..e170d31cd9d 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2000,9 +2000,7 @@ The ``python_pep517`` class builds and installs a P=
ython ``wheel`` binary
 archive (see `PEP-517 <https://peps.python.org/pep-0517/>`__).
=20
 Recipes wouldn't inherit this directly, instead typically another class =
will
-inherit this, add the relevant native dependencies, and set
-:term:`PEP517_BUILD_API` to the Python class which implements the PEP-51=
7 build
-API.
+inherit this and add the relevant native dependencies.
=20
 Examples of classes which do this are :ref:`python_flit_core
 <ref-classes-python_flit_core>`, :ref:`python_setuptools_build_meta
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index 367b4674e2c..da9b8577842 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5657,11 +5657,6 @@ system and gives an overview of their function and=
 contents.
=20
       :term:`PE` is the default value of the :term:`PKGE` variable.
=20
-   :term:`PEP517_BUILD_API`
-      When used by recipes that inherit the :ref:`python_pep517
-      <ref-classes-python_pep517>` class, specifies the entry point to t=
he
-      PEP-517 compliant build API (such as ``flit_core.buildapi``).
-
    :term:`PEP517_WHEEL_PATH`
       When used by recipes that inherit the
       :ref:`python_pep517 <ref-classes-python_pep517>` class,
--=20
2.25.1


