Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8ED6C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:28:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1.1657729709716014826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8B9A1C01;
	Wed, 13 Jul 2022 09:28:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01CCB3F792;
	Wed, 13 Jul 2022 09:28:28 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 8/8] documentation: remove obsolete PEP517_BUILD_API
Date: Wed, 13 Jul 2022 17:28:21 +0100
Message-Id: <20220713162821.974801-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713162821.974801-1-ross.burton@arm.com>
References: <20220713162821.974801-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:28:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167972

This variable has been obsoleted, so remove it from the documentation.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 documentation/ref-manual/classes.rst   | 4 +---
 documentation/ref-manual/variables.rst | 5 -----
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index d0ed5392293..424c505715f 100644
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
index c4b2119f26c..1710830dc03 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5682,11 +5682,6 @@ system and gives an overview of their function and=
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
2.34.1


