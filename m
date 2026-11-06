Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7338.1793976214391252784
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DZKR5wXL;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8338; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=eHR6tmB0Mph+YkiIDc2yzkFIrVec2FD3DVtWbr8Pi30=;
  b=DZKR5wXLrQgcxkojfnJuXnNuK1ztD5T2YnfydNsCC9Sl8OrQn6Dq2fWD
   hpXn0vxzRKb+vlAsljQ/bC7X4MyRWKVtElEQbSTIUmT+3nx++KEfyvyxk
   z02/iIKkB90MK/2al2nM9XyWH14Q+mx9wFAnn/hLcCwkhWLMjwQ/9bxkx
   o5SpsE4PKRN4hqS9GfRDtCMUIsQGVcHP5yk3kdve0NqXaZsXQKaVKirWi
   eW1sbgyK/CM78NQbF0P7c293ojviKJElRmBckYv8A8S5X3HRNRd0eQNhf
   /trbj/sYaNQg0AGVpnCzR0La9vCbotKs4Y62Fx6Rz/mQMm5QdZqQHUdGk
   Q==;
X-CSE-ConnectionGUID: eQeEtGBPT96tA/AcbMKjxg==
X-CSE-MsgGUID: LFdf+7vZQsOQ9yHxRsx76A==
X-IPAS-Result: =?us-ascii?q?A0ACAwAQ5u1q/5H/Ja1aglmCV3VgQ0kDlCeCIQOeIYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOHQImNgcOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysdAQUIGYMCAYI6AzcDEbw/g?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAUSEOScbgUlEgRWDaYEFg?=
 =?us-ascii?q?VwCiCYEgxwSgVqNGAKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3F?=
 =?us-ascii?q?RkEPm4Hkj2CRTsSPRwbBwQPASuBNA8KMC+TNZJBoRGEKowklToaM4VbpRYLm?=
 =?us-ascii?q?H2OCpZRhGmBbgE1gVkzGggbFYMiCUoZD445g2uFE1FsxRwmMgIGAwMvAQEHA?=
 =?us-ascii?q?gcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:/GjOTK8/IxgY2p7R8KoJDrUD13+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2cYXDqGM6qOamb1eIskboyyo0NTv5/VndNkHgdt+HxEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k7BIA15sldOV0fq
 +AxbxkGZDWghfK5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0An1lQ/UPrSmM+5m2P2fzBwo1OOrq1x6G/WpOB0+OWxbYKLIYXVH625mG68i
 G7IvDvnMCgBE+XO2BqVyGm82bHmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:NPncG6oRKE8IFs+EzM46mSYaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A5Hk/jmuxugwLmsS6CRw3fwmV6IsoS3Dw0Fj6G3P?=
 =?us-ascii?q?pV3pAD5SeQ3qz+rNrxp8=3D?=
X-Talos-MUID: 9a23:13qmCQs8v4qucLfpC82noB9uOoQ3/ZaXE2c0wIQmq/OfJXMuEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545063172"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 67FDC180001F7
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id C07DBCBF21E; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 05/27] python3-git: fix CVE-2026-67322
Date: Fri,  6 Nov 2026 06:43:09 -0800
Message-Id: <20261106144331.3354811-6-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249673
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/gitpython-developers/GitPython/commit/8ac5a30519b6f4af85398b9b9d7064ff4d452da2
[2] https://security-tracker.debian.org/tracker/CVE-2026-67322

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Converted the caller-supplied URL to str before Git.polish_url(),
  and converted the normalized clone URL to str before Git.check_unsafe_protocols().
  Expanded Backport Changes to explain these GitPython 3.1.43 adaptations.
---
 .../python/python3-git/CVE-2026-67322.patch   | 171 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   1 +
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
new file mode 100644
index 0000000000..a78d2bd37a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
@@ -0,0 +1,171 @@
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
+- In Repo.clone_from(), stringify caller-supplied url before Git.polish_url()
+  because GitPython 3.1.43 accepts PathLike URLs but polish_url() uses string
+  operations. Stringify normalized clone_url before Git.check_unsafe_protocols()
+  because its regex expects str; validate the normalized value passed to Git.
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
+@@ -670,29 +670,34 @@ Git.polish_url
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
+@@ -1408,8 +1408,9 @@ Repo.clone_from
+         if multi_options:
+             multi = shlex.split(" ".join(multi_options))
+ 
++        clone_url = Git.polish_url(str(url), expand_vars=False)
+         if not allow_unsafe_protocols:
+-            Git.check_unsafe_protocols(str(url))
++            Git.check_unsafe_protocols(str(clone_url))
+         if not allow_unsafe_options:
+             Git.check_unsafe_options(
+                 options=Git._option_candidates([], kwargs),
+@@ -1421,7 +1422,7 @@ Repo.clone_from
+         proc = git.clone(
+             multi,
+             "--",
+-            Git.polish_url(str(url)),
++            clone_url,
+             clone_path,
+             with_extended_output=True,
+             as_process=True,
+@@ -1461,7 +1462,7 @@ Repo.clone_from
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
+@@ -382,13 +382,13 @@ _cygexpath
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
+@@ -416,7 +416,7 @@ cygpath
+ )
+ 
+ 
+-def cygpath(path: str) -> str:
++def cygpath(path: str, expand_vars: bool = True) -> str:
+     """Use :meth:`git.cmd.Git.polish_url` instead, that works on any environment."""
+     path = str(path)  # Ensure is str and not AnyPath.
+     # Fix to use Paths when 3.5 dropped. Or to be just str if only for URLs?
+@@ -424,12 +424,15 @@ cygpath
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
2.53.0

