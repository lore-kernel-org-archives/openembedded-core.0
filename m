Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7336.1793976213937852288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Wx6pwb40;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6233; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=V3pm0xUnOLiVIPn9WKikhWH3uH7i0XXZaLWvYHRHAo0=;
  b=Wx6pwb40E4iPci3TO97CbH64gg6IQMswYWkcT6V315hm0puIQVo7oyvu
   CsrWphzNcJKFurMpvJwSC6MaZTVgOW/IlLLZb0JFK/B4MLlDhLr6BbaAk
   9STsaGC4kAcpQ997w8bdfIxQP2hnlxWGZOzF/riMU527PmxhMjajDfFsH
   GofSXBWgKU7cXRtFIwg1oCyfkp1cXLkGnCr/VNHfG3DoHd9Kx0rlC1DMo
   qYWr6uV3qWh0oMWeG4Rn/6Fg84IgQWxWFlEMuz4jkd9/h/xSfO29UFDXm
   66Ix8nrKEYFhM5Pi+y8kUJ2kceOFv7RU3UNTJD7xVvErVo/zdDWoFTf4h
   w==;
X-CSE-ConnectionGUID: xTapc1RlTSqP6r/ieZ1jMg==
X-CSE-MsgGUID: uB7L5COQQ7CT9igDGqz4Ig==
X-IPAS-Result: =?us-ascii?q?A0BJAgAQ5u1q/5P/Ja1aglmCV3VgQ0kDlCeCIQOTIIsBg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbw/g?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAYR9JxuBSUSBFYNpgQWBX?=
 =?us-ascii?q?AKIJgSCDYEPEoFajRgCgVGGeUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQx0ORAwHiQvBRwmPhsKLxgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5I9gh8mLQ4SATxRARAbgiwGSJJxMpIFgTWfXIQqjCSVOhozhASBV?=
 =?us-ascii?q?5JCklQLmH2OCpZRhGmBaDyBWTMaCBsVgyIJShkPjjmDa4UTUcYIJjICCQMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:SvxZ/qBhanXufBVW/37iw5YqxClBgxIJ4kV8jS/XYbTApG8q0jYEm
 GBNCmCFM/aCa2fwcoglO4nk8ElUup/RnYViOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE08lnFEpvB4kkwf9PX3sJ9
 PEqcTIoYUXW7w626OrTpuhEnM8vKozveYgYoHwllGmfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYwBPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOkFEqgOaxaoK9ltqiWO8Kuhuzg
 Vv/oE/FUxAVGPOG22ak/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTUkuzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:560lsaqIqJ3g2/yNp/TKnx4aV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:jFiDUWAyT5tHeGD6Ezlb/VYfQ/ohTkbE9CnKZE61Oz9rbbLAHA==
X-Talos-MUID: 9a23:DXC/pQmxw+umF2c5mM2Ednp/HphMvo+JMXlSuqlXusaoGjViZxaS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545386420"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 7AC9318000890
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 0B3B1CBEF6C; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 12/27] python3-git: fix CVE-2026-73620
Date: Fri,  6 Nov 2026 06:43:16 -0800
Message-Id: <20261106144331.3354811-13-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249666
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
2.53.0

