Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96F9C7EE29
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:28 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.26620.1685610258654342845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98458953"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98458953"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90465C3F81
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:09 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3341D3F3B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E71288864;
	Thu,  1 Jun 2023 18:04:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-typing-extensions: upgrade 4.5.0 -> 4.6.2
Date: Thu,  1 Jun 2023 17:03:38 +0800
Message-Id: <1685610221-29015-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--3.874400-10.000000
X-TMASE-MatchedRID: h8nmbN2t+rqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvJt7aD46KTu/tN
	2vjEPERNff1/prWVq6FfiUXRhIg6ak8HitdqBBn7Of/Bx1+MuMJxXefgn/TNQzVjvc93O9dks77
	E1Sddu5xY5Eh/SzoiVjue5HN6v4cMQbet2SV2daHGRAAE2aJ30+9Bi8r8zoNMWqbaOadHHHDK/e
	L8n0LPmd8cCkA5p5qg/HyfiRbsgEXIRZRfI7CCoQXlKcEciy76QR7lWMXPA1t0I1CuCkvnDck/W
	Ck9r5yu93Q24p8sE2d4Xern/Fx5bArTXUi+zTMUNT0Qrj4fxTWOQOsE4nDCdFBn/9KQLS7SvqnF
	tM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcKXqmmYTGpxiUg5U
	D6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyoPZea/vmsAXJ0wHGbMkGIdOsi4
	YK9p0hNfS05JQb+Uz6grPp5+AT6AOEixxB3mn1+lnJwxOYm6mhcLwNTjrJ2JexAfLmFD8H/r/b+
	dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182089

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-  Fix use of @deprecated on classes with __new__ but no __init__.
-  Fix regression in version 4.6.1 where comparing a generic class against a
   runtime-checkable protocol using isinstance() would cause AttributeError to
   be raised if using Python 3.7.
-  Change deprecated @runtime to formal API @runtime_checkable in the error message.
-  Fix regression in 4.6.0 where attempting to define a Protocol that was generic
   over a ParamSpec or a TypeVarTuple would cause TypeError to be raised.
-  typing_extensions is now documented at https://typing-extensions.readthedocs.io/en/latest/.
-  Add typing_extensions.Buffer, a marker class for buffer types, as proposed
   by PEP 688. Equivalent to collections.abc.Buffer in Python 3.12.
-  Backport two CPython PRs fixing various issues with typing.Literal:
   python/cpython#23294 and python/cpython#23383. Both CPython PRs were originally,
   and both were backported to Python >=3.9.1, but no earlier.
-  A side effect of one of the changes is that equality comparisons of Literal
   objects will now raise a TypeError if one of the Literal objects being compared
   has a mutable parameter. (Using mutable parameters with Literal is not
   supported by PEP 586 or by any major static type checkers.)
-  Literal is now reimplemented on all Python versions <= 3.10.0.
-  Backport CPython PR 26067, ensuring that isinstance() calls on protocols raise
   TypeError when the protocol is not decorated with @runtime_checkable.
-  Backport several significant performance improvements to runtime-checkable protocols
   that have been made in Python 3.12 (see python/cpython#74690 for details).
-  A side effect of one of the performance improvements is that the members of a
   runtime-checkable protocol are now considered "frozen" at runtime as soon as the
   class has been created. Monkey-patching attributes onto a runtime-checkable
   protocol will still work, but will have no impact on isinstance() checks comparing
   objects to the protocol. See "What's New in Python 3.12" for more details.
-  isinstance() checks against runtime-checkable protocols now use inspect.getattr_static()
   rather than hasattr() to lookup whether attributes exist (backporting python/cpython#103034).
-  Backport the ability to define __init__ methods on Protocol classes, a change
   made in Python 3.11 (originally implemented in python/cpython#31628
-  Speedup isinstance(3, typing_extensions.SupportsIndex) by >10x on Python <3.12.
-  Add typing_extensions versions of SupportsInt, SupportsFloat, SupportsComplex,
   SupportsBytes, SupportsAbs and SupportsRound. These have the same semantics as
   the versions from the typing module, but isinstance() checks against the
   typing_extensions versions are >10x faster at runtime on Python <3.12.
-  Add __orig_bases__ to non-generic TypedDicts, call-based TypedDicts, and call-based NamedTuples.
-  Add typing_extensions.get_original_bases, a backport of types.get_original_bases,
   introduced in Python 3.12 (CPython PR python/cpython#101827, originally
-  This function should always produce correct results when called on classes
   constructed using features from typing_extensions.
-  Constructing a call-based TypedDict using keyword arguments for the fields
   now causes a DeprecationWarning to be emitted. This matches the behaviour
   of typing.TypedDict on 3.11 and 3.12.
-  Backport the implementation of NewType from 3.10 (where it is implemented as
   a class rather than a function). This allows user-defined NewTypes to be pickled.
-  Fix tests and import on Python 3.12, where typing.TypeVar can no longer be subclassed.
-  Add typing_extensions.TypeAliasType, a backport of typing.TypeAliasType from PEP 695.
-  Backport changes to the repr of typing.Unpack that were made in order
   to implement PEP 692 (backport of python/cpython#104048).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...g-extensions_4.5.0.bb => python3-typing-extensions_4.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.5.0.bb => python3-typing-extensions_4.6.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
index 80f87cae84..be43fe4a64 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.6.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "5cb5f4a79139d699607b3ef622a1dedafa84e115ab0024e0d9c044a9479ca7cb"
+SRC_URI[sha256sum] = "06006244c70ac8ee83fa8282cb188f697b8db25bc8b4df07be1873c43897060c"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


