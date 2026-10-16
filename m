Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B481FCCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 05:41:17 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15557.1792129268905469582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 22:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Qalx00nE;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7829; q=dns/txt;
  s=iport01; t=1792129268; x=1793338868;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fd8SxDslBfeFvoJNuvu9U4kosQ4CnQlblDozKVUsGh8=;
  b=Qalx00nEtTz+Xq5mtNfttzh7AtatIY2FSLBJTNdeHZzlU4apV30ljT+9
   Kl7iu3MmV+YgYpXZf57wla0djrfCDpsI0VK7JDv/XHqF1AfE666BdqIbz
   UHyAG+MNRxZUD659jrvtjwN8e+fQcFvykPiZtAzoSjRoQMXs7hcCLpBrj
   IZ/wAF39qumerLkzL623q85gFuVcQscar59RVHRVkdzyTKxjOXhRf/PUp
   q4R6PkIYTIZZLleo/MOM21eRJxal47I8j4d0dIZdg4bShxZ2tbI2dvn+Z
   SMRFEVXiIjBotEULVvu6J4HTnJqchYGzNcl8aCmEe2M5H0gtAEvsZTbNp
   Q==;
X-CSE-ConnectionGUID: 46yjlOgwQX2DmIrrBunUOA==
X-CSE-MsgGUID: JyFtbXweR5iAaVsNsntWWQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgAeuNFq/5D/Ja1aHgE8DA4LgVmCV3VgQ0kDlCaCI?=
 =?us-ascii?q?QOeHIF+DwEBAQ9EDQQBAYQ/RgKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysdAQUIGYMCAYI6A?=
 =?us-ascii?q?zcDEbx4gXkzgQGDKQE/AkNQ2EsQb4FoAQsUAYE4hUCII10YAUSEOCcbgUlEg?=
 =?us-ascii?q?RWDaYEFgVwBAYglBIMcEoFagQOUREiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgSCCFiMZNnqBCV6BKylhEBeBCYIHAoJUggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IESw3FRkEP?=
 =?us-ascii?q?m4HkhQeghg7Ej0cGwcEDwErgTQPCgQsL5M1kkChD4QojCKVOhozhVulFAuYf?=
 =?us-ascii?q?Y4Klk+EaYFoPIFHCwczGggbFTuCZwlKGQ+OOYNrgX+DZWzICicyAgYDMgEBB?=
 =?us-ascii?q?wIHDgMLgWiQAi2BTwEB?=
IronPort-Data: A9a23:lcknMq+ncki9OUA8SWBFDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 DEdDW3SafmKMzT2Ld5/bIy18UgO7cPdxt5gQAY5qXxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2lqY5wa/sF4Hlh+r
 9AdCSoXRA2FusWflefTpulE3qzPLeHxN48Z/3UlxjbDALN+HtbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0En1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OW2bYeEKoDbFa25mG66t
 0za9VTmDytHNfWW9yGj6XSwudD2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:FuL7IK5z3EVvJNH99gPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:CZYmrmEhRrapMskYqmI7ql8WHucqbUTtllvVAlWiI3tvdZq8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AnU1CPA/sjMUda1poQApt/W6Qf+V5zbikOF8Aq8g?=
 =?us-ascii?q?HksC6LgprPSuisw3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535598498"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 05:41:08 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id E014218000231
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:07 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 3F07BCBF21E; Thu, 15 Oct 2026 22:41:07 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 05/27] python3-git: fix CVE-2026-67322
Date: Thu, 15 Oct 2026 22:40:44 -0700
Message-Id: <20261016054106.210444-6-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016054106.210444-1-yurade@cisco.com>
References: <20261016054106.210444-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 05:41:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247936

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/8ac5a30519b6f4af85398b9b9d7064ff4d452da2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-67322

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
 .../python/python3-git/CVE-2026-67322.patch   | 167 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 168 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
new file mode 100644
index 0000000000..6041ff3d2e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
@@ -0,0 +1,167 @@
+From 3ae11b59c9c4cf15f04397d58b8a90b621b6571b Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Wed, 15 Jul 2026 16:44:13 +0200
+Subject: [PATCH] fix: prevent environment expansion in clone URLs
+
+Repo.clone_from() expanded environment-variable references in caller-supplied
+URLs before passing them to git clone. This could expose process environment
+values to an untrusted remote and made protocol validation apply to a different
+value than Git received.
+
+Polish clone URLs without variable or home expansion on native and Cygwin
+Git, then apply unsafe-protocol validation to that exact normalized value.
+Preserve the literal URL when normalizing the stored origin after a successful
+clone, while retaining the existing Git.polish_url() default for callers
+that intentionally normalize local paths. Add regression coverage for
+POSIX and Windows variable syntax, Cygwin conversion, stored origins, and
+post-normalization protocol validation.
+
+Git baseline: git clone passes URL arguments through literally; t/t5601-clone.sh
+covers the accepted URL forms without shell-style environment expansion.
+
+Security: GHSA-rwj8-pgh3-r573.
+
+CVE: CVE-2026-67322
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/8ac5a30519b6f4af85398b9b9d7064ff4d452da2]
+
+Backport Changes:
+- Omitted test/test_clone.py because the current PyPI source archive 
+  does not include the test suite and the python3-git recipe does not 
+  run it.
+
+Co-authored-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 8ac5a30519b6f4af85398b9b9d7064ff4d452da2)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py       | 19 ++++++++++++-------
+ git/repo/base.py |  7 ++++---
+ git/util.py      | 15 +++++++++------
+ 3 files changed, 25 insertions(+), 16 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 75495dc1..58d219e3 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -670,29 +670,34 @@ class Git(metaclass=_GitMeta):
+ 
+     @overload
+     @classmethod
+-    def polish_url(cls, url: str, is_cygwin: Literal[False] = ...) -> str: ...
++    def polish_url(cls, url: str, is_cygwin: Literal[False] = ..., expand_vars: bool = ...) -> str: ...
+ 
+     @overload
+     @classmethod
+-    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None) -> str: ...
++    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None, expand_vars: bool = True) -> str: ...
+ 
+     @classmethod
+-    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None) -> PathLike:
++    def polish_url(cls, url: str, is_cygwin: Union[None, bool] = None, expand_vars: bool = True) -> PathLike:
+         """Remove any backslashes from URLs to be written in config files.
+ 
+         Windows might create config files containing paths with backslashes, but git
+         stops liking them as it will escape the backslashes. Hence we undo the escaping
+         just to be sure.
++
++        :param expand_vars:
++            Expand environment variables and an initial ``~``. Disable this for values
++            obtained from an untrusted source, such as remote URLs.
+         """
+         if is_cygwin is None:
+             is_cygwin = cls.is_cygwin()
+ 
+         if is_cygwin:
+-            url = cygpath(url)
++            url = cygpath(url, expand_vars=expand_vars)
+         else:
+-            url = os.path.expandvars(url)
+-            if url.startswith("~"):
+-                url = os.path.expanduser(url)
++            if expand_vars:
++                url = os.path.expandvars(url)
++                if url.startswith("~"):
++                    url = os.path.expanduser(url)
+             url = url.replace("\\\\", "\\").replace("\\", "/")
+         return url
+ 
+diff --git a/git/repo/base.py b/git/repo/base.py
+index 3380e0c5..d661f036 100644
+--- a/git/repo/base.py
++++ b/git/repo/base.py
+@@ -1408,8 +1408,9 @@ class Repo:
+         if multi_options:
+             multi = shlex.split(" ".join(multi_options))
+ 
++        clone_url = Git.polish_url(url, expand_vars=False)
+         if not allow_unsafe_protocols:
+-            Git.check_unsafe_protocols(str(url))
++            Git.check_unsafe_protocols(clone_url)
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([], kwargs),
+@@ -1421,7 +1422,7 @@ class Repo:
+         proc = git.clone(
+             multi,
+             "--",
+-            Git.polish_url(str(url)),
++            clone_url,
+             clone_path,
+             with_extended_output=True,
+             as_process=True,
+@@ -1461,7 +1462,7 @@ class Repo:
+         # escape the backslashes. Hence we undo the escaping just to be sure.
+         if repo.remotes:
+             with repo.remotes[0].config_writer as writer:
+-                writer.set_value("url", Git.polish_url(repo.remotes[0].url))
++                writer.set_value("url", Git.polish_url(repo.remotes[0].url, expand_vars=False))
+         # END handle remote repo
+         return repo
+ 
+diff --git a/git/util.py b/git/util.py
+index 27b239ab..9619937c 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -382,13 +382,13 @@ def py_where(program: str, path: Optional[PathLike] = None) -> List[str]:
+     return progs
+ 
+ 
+-def _cygexpath(drive: Optional[str], path: str) -> str:
++def _cygexpath(drive: Optional[str], path: str, expand_vars: bool = True) -> str:
+     if osp.isabs(path) and not drive:
+         # Invoked from `cygpath()` directly with `D:Apps\123`?
+         #  It's an error, leave it alone just slashes)
+         p = path  # convert to str if AnyPath given
+     else:
+-        p = path and osp.normpath(osp.expandvars(osp.expanduser(path)))
++        p = path and osp.normpath(osp.expandvars(osp.expanduser(path)) if expand_vars else path)
+         if osp.isabs(p):
+             if drive:
+                 # Confusing, maybe a remote system should expand vars.
+@@ -416,7 +416,7 @@ _cygpath_parsers: Tuple[Tuple[Pattern[str], Callable, bool], ...] = (
+ )
+ 
+ 
+-def cygpath(path: str) -> str:
++def cygpath(path: str, expand_vars: bool = True) -> str:
+     """Use :meth:`git.cmd.Git.polish_url` instead, that works on any environment."""
+     path = str(path)  # Ensure is str and not AnyPath.
+     # Fix to use Paths when 3.5 dropped. Or to be just str if only for URLs?
+@@ -424,12 +424,15 @@ def cygpath(path: str) -> str:
+         for regex, parser, recurse in _cygpath_parsers:
+             match = regex.match(path)
+             if match:
+-                path = parser(*match.groups())
++                if parser is _cygexpath:
++                    path = parser(*match.groups(), expand_vars=expand_vars)
++                else:
++                    path = parser(*match.groups())
+                 if recurse:
+-                    path = cygpath(path)
++                    path = cygpath(path, expand_vars=expand_vars)
+                 break
+         else:
+-            path = _cygexpath(None, path)
++            path = _cygexpath(None, path, expand_vars=expand_vars)
+ 
+     return path
+ 
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index ca2efce37e..fafb9972ef 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67325_p1.patch \
            file://CVE-2026-67325_p2.patch \
            file://CVE-2026-67324.patch \
+           file://CVE-2026-67322.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.44.4


