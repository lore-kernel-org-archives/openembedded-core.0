Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8010.1795062167956330772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ihp5Aat8;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6233; q=dns/txt;
  s=iport01; t=1795062168; x=1796271768;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SCDZvcat/IL5A4qQwgBMX+31fqoUKiQ5QF5wNhe5tBU=;
  b=Ihp5Aat8FzTh2Mp4i6NPD0rIu8IIoempDiAuy0bCurqx2FwIHxskbhT2
   Tf3y6wOTVX9HE2jiwm5MIabgjLVk+QaXcjDrHQ9m8TJ5lJrgnsqJI9AZQ
   mz6olxHar+jHWYREgZQX0nmjGr/h8Gi9T4+cUVqjD7lvjRMvoXPFEovxR
   zDDFwbM1bWbVWX7wsaNasdqTQ+52G9lmPx7me7QiskU0eNoctm6zaGjka
   /N4O5hTBCwVM3rmxjFkGGQSOi4wB99L1hn87bec7mYGC36qNbJ7WSvxS9
   97uH7WZLA1Ex+m6OCPL+ICNk3hCztkPWkA5BeAuioPZK+ADA9ztSrez4k
   A==;
X-CSE-ConnectionGUID: SOkWboLURS+8LWSj/6Yjxw==
X-CSE-MsgGUID: 6Vda0GmESLCWa4OjStXrUQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDWd/5q/89K/pBaglmCV3VgQ0kDlCeCIQOTJIsFg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbk1g?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBFYNqgQWBX?=
 =?us-ascii?q?AKIJgSCDYEPEoFUjRcCgU+ICkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjO?=
 =?us-ascii?q?xeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bD?=
 =?us-ascii?q?gIOGA1IESw3FRkEPm4Hk1GCJSYtDhIBPFEBEBuCLAZIknEykgSBNZ9chCuMJ?=
 =?us-ascii?q?JU6GjOEBIFXkkOSVAuYfY4KllGEaoFoPIFZMxoIGxWDIglKGQ+OOYNrhRNRx?=
 =?us-ascii?q?lomMgIJAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:sFT+IavJQ1O+WJCmNBK8H4UkB+fnVBxfMUV32f8akzHdYApBsoF/q
 tZmKTuEbqmLNzD1fYt0bdi19kJUv8TTm4M1HAI6qCE8FH5GgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva+Es01BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwwcF0PmtJ0
 cEiE3NdSi+4haXo8bCrVbw57igjBJGD0II3s3x6iDWcBvE8TNWbHePB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgh/5JEWxI9EglHubidRpF+9rqss6G+Vxwt0uFToGIeEI4LWGp4E9qqej
 jz4822hLRQ3D/i09jPZ1XCXmt/VoBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPBWC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:RkZ6iKveJVsJ32A8gx2rp7hL7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:Y4dKTWE66h8D2Ur1qmJc000rEMcBT0fmjyf0HHS6TjhYSq2KHAo=
X-Talos-MUID: 9a23:avbe3AVPrSlDWAXq/GHSiDg6G8JF2ICFN0lRtpc9p/meCBUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59164739"
Received: from aer-l-core-06.cisco.com ([144.254.74.207])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:46 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-06.cisco.com (Postfix) with ESMTPS id 07152180004B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:46 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 43E4CCBEF6C; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 12/27] python3-git: fix CVE-2026-73620
Date: Wed, 18 Nov 2026 20:22:27 -0800
Message-Id: <20261119042242.1640611-13-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250615
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/3af0c2516c5e18c829da30338614688f6b69b49c
[2] https://security-tracker.debian.org/tracker/CVE-2026-73620

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Refreshed the embedded hunk context and index hashes.
---
 .../python/python3-git/CVE-2026-73620.patch   | 130 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
new file mode 100644
index 0000000000..7901c8d28d
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
@@ -0,0 +1,130 @@
+From cc80ea13457773907fa7843e274dca8dc7d196a5 Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 26 Jul 2026 05:54:27 +0200
+Subject: [PATCH] Block unsafe checkout-index and tag file options
+
+GHSA-3f7w-8rr8-f37f reports that caller-controlled options forwarded by
+IndexFile.checkout() and TagReference.create() can make Git write to or read
+from arbitrary filesystem paths.
+
+Add regression coverage proving the unsafe options are rejected by default while
+preserving the explicit allow_unsafe_options escape hatch. Reuse GitPython's
+existing option candidate normalization and unsafe-option guard at both public
+API boundaries.
+
+Git baseline: a23bace963d508bd96983cc637131392d3face18.
+Documentation/git-checkout-index.adoc defines --prefix as prepending an output
+path, and Documentation/git-tag.adoc defines -F/--file as reading a tag message
+from a file.
+
+CVE: CVE-2026-73620
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/3af0c2516c5e18c829da30338614688f6b69b49c]
+
+Backport Changes:
+- Omitted test/test_index.py, test/test_refs.py because the current PyPI
+  source archive does not include the test suite and the python3-git
+  recipe does not run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 3af0c2516c5e18c829da30338614688f6b69b49c)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/index/base.py | 12 ++++++++++++
+ git/refs/tag.py   | 13 +++++++++++++
+ 2 files changed, 25 insertions(+)
+
+diff --git a/git/index/base.py b/git/index/base.py
+index dfe7e0dc..90d4c16f 100644
+--- a/git/index/base.py
++++ b/git/index/base.py
+@@ -129,6 +129,8 @@ IndexFile
+     Make sure you use :meth:`index.write() <write>` once you are done manipulating the
+     index directly before operating on it using the git command.
+     """
++    unsafe_git_checkout_index_options = ["--prefix"]
++
+ 
+     __slots__ = ("repo", "version", "entries", "_extension_data", "_file_path")
+ 
+@@ -1199,6 +1201,7 @@ IndexFile.checkout
+         paths: Union[None, Iterable[PathLike]] = None,
+         force: bool = False,
+         fprogress: Callable = lambda *args: None,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> Union[None, Iterator[PathLike], Sequence[PathLike]]:
+         """Check out the given paths or all files from the version known to the index
+@@ -1224,6 +1227,9 @@ IndexFile.checkout
+             The provided progress information will contain ``None`` as path and item if
+             no explicit paths are given. Otherwise progress information will be send
+             prior and after a file has been checked out.
++        :param allow_unsafe_options:
++            Allow unsafe options, such as ``--prefix``.
++
+ 
+         :param kwargs:
+             Additional arguments to be passed to :manpage:`git-checkout-index(1)`.
+@@ -1248,6 +1254,12 @@ IndexFile.checkout
+             i.e. if you want :manpage:`git-checkout(1)`-like behaviour, use
+             ``head.checkout`` instead of ``index.checkout``.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=self.unsafe_git_checkout_index_options,
++            )
++
+         args = ["--index"]
+         if force:
+             args.append("--force")
+diff --git a/git/refs/tag.py b/git/refs/tag.py
+index 1e38663a..487eaa14 100644
+--- a/git/refs/tag.py
++++ b/git/refs/tag.py
+@@ -14,6 +14,7 @@ module imports
+ 
+ # typing ------------------------------------------------------------------
+ 
++from git.cmd import Git
+ from typing import Any, TYPE_CHECKING, Type, Union
+ 
+ from git.types import AnyGitObject, PathLike
+@@ -40,6 +41,8 @@ TagReference
+         print(tagref.tag.message)
+     """
+ 
++    unsafe_git_tag_options = ["--file", "-F"]
++
+     __slots__ = ()
+ 
+     _common_default = "tags"
+@@ -92,6 +95,7 @@ TagReference.create
+         reference: Union[str, "SymbolicReference"] = "HEAD",
+         logmsg: Union[str, None] = None,
+         force: bool = False,
++        allow_unsafe_options: bool = False,
+         **kwargs: Any,
+     ) -> "TagReference":
+         """Create a new tag reference.
+@@ -121,12 +125,21 @@ TagReference.create
+         :param force:
+             If ``True``, force creation of a tag even though that tag already exists.
+ 
++        :param allow_unsafe_options:
++            Allow unsafe options, such as ``--file``.
++
+         :param kwargs:
+             Additional keyword arguments to be passed to :manpage:`git-tag(1)`.
+ 
+         :return:
+             A new :class:`TagReference`.
+         """
++        if not allow_unsafe_options:
++            Git.check_unsafe_options(
++                options=Git._option_candidates([], kwargs),
++                unsafe_options=cls.unsafe_git_tag_options,
++            )
++
+         if "ref" in kwargs and kwargs["ref"]:
+             reference = kwargs["ref"]
+ 
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index f712a0e699..d47ce73d72 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-73624.patch \
            file://CVE-2026-73622.patch \
            file://CVE-2026-73621.patch \
+           file://CVE-2026-73620.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.35.6

