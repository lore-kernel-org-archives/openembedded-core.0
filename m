Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF233C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:29:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.665.1648751364200546164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E35B1139F
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 954AA3F718
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:29:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/23] oeqa/core/utils/misc: remove redundant file
Date: Thu, 31 Mar 2022 19:29:05 +0100
Message-Id: <20220331182915.22128-13-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331182915.22128-1-ross.burton@arm.com>
References: <20220331182915.22128-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163854

This file dates back to 2016. Half of the functions have never been used,
the rest are used in one place and have now been replaced.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/lib/oeqa/core/utils/misc.py | 47 --------------------------------
 1 file changed, 47 deletions(-)
 delete mode 100644 meta/lib/oeqa/core/utils/misc.py

diff --git a/meta/lib/oeqa/core/utils/misc.py b/meta/lib/oeqa/core/utils/=
misc.py
deleted file mode 100644
index e1a59588eb6..00000000000
--- a/meta/lib/oeqa/core/utils/misc.py
+++ /dev/null
@@ -1,47 +0,0 @@
-#
-# Copyright (C) 2016 Intel Corporation
-#
-# SPDX-License-Identifier: MIT
-#
-
-def toList(obj, obj_type, obj_name=3D"Object"):
-    if isinstance(obj, obj_type):
-        return [obj]
-    elif isinstance(obj, list):
-        return obj
-    else:
-        raise TypeError("%s must be %s or list" % (obj_name, obj_type))
-
-def toSet(obj, obj_type, obj_name=3D"Object"):
-    if isinstance(obj, obj_type):
-        return {obj}
-    elif isinstance(obj, list):
-        return set(obj)
-    elif isinstance(obj, set):
-        return obj
-    else:
-        raise TypeError("%s must be %s or set" % (obj_name, obj_type))
-
-def strToList(obj, obj_name=3D"Object"):
-    return toList(obj, str, obj_name)
-
-def strToSet(obj, obj_name=3D"Object"):
-    return toSet(obj, str, obj_name)
-
-def intToList(obj, obj_name=3D"Object"):
-    return toList(obj, int, obj_name)
-
-def dataStoteToDict(d, variables):
-    data =3D {}
-
-    for v in variables:
-        data[v] =3D d.getVar(v)
-
-    return data
-
-def updateTestData(d, td, variables):
-    """
-    Updates variables with values of data store to test data.
-    """
-    for var in variables:
-        td[var] =3D d.getVar(var)
--=20
2.25.1


