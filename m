Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7340.1793976214807337239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QP/Tnwjp;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10759; q=dns/txt;
  s=iport01; t=1793976215; x=1795185815;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=FepKbQR/0LVeeWOcVLVV/exQoOcalfeyCaXX1Ej/MaU=;
  b=QP/TnwjpQgFh0dtNUBmV7WWcVANARdR6JLrY4HOmTn7mhheijLjv8D4z
   TjvMcxG2AcfA9D2p8ETQCpCUe9Oby+5yzLFr6L+YsyMkWoM3a6+8ju26T
   zKXGcErKBgHwTq89HJlM4auvONB2h5K5D05RLEUUJHCzZK3KtvF/JJ//Y
   q7kigf3ap8xSupnGokTTfW5pUhGJOdsd+s6mSK81A8NAeSyr4PSrgZnU4
   mZVXladyrqCrPxNK31JFU/hgIu1uVuh8/1kGkeJIby22m6sqRzJVVosqF
   kFI6gPw/jNX7vwlf61BMpWbuWysxR+2gugmXhAXi1SKm4X5lvDoGfiUnv
   A==;
X-CSE-ConnectionGUID: NEFl3y3UQ5W5kzaFjnNr6w==
X-CSE-MsgGUID: GTKWtvgQT4ij8ckHc4xDFQ==
X-IPAS-Result: =?us-ascii?q?A0AnAACS5u1q/4z/Ja1RCR0BAQEBCQESAQUFAYF8CAELA?=
 =?us-ascii?q?YJWdWBDSQOMb4c4gTVsA5MgiwEUgWoPAQEBD0QNBAEBhD9GAo4dAiY0CQ4BA?=
 =?us-ascii?q?gQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBP?=
 =?us-ascii?q?RwDAQIvKyMIGYMCAYI6AzcDEbxFgXkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4A?=
 =?us-ascii?q?YVBiCRdGAFEhDknG4FJRIEVg2mBBUsBgRACgSsBCAoBB4ZgBIMcEoFagQyMD?=
 =?us-ascii?q?AKBUYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BHoESg?=
 =?us-ascii?q?QddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJ?=
 =?us-ascii?q?j8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEPm4Hkj2CChYlL?=
 =?us-ascii?q?RkGAQE8GzYBBx4GFz+BNQgZkzUCCJAWgiGhEYQqjCSVOhozhASBV5JCklQLm?=
 =?us-ascii?q?H2OCpVpMTeEaYFoPGlwMxoIGxWDIglKGQ+OOYFjggiFE1FsxRwmMgIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokAItgU8BAQ?=
IronPort-Data: A9a23:ip2bDKzg3qW7fAW0LFx6t+dgxyrEfRIJ4+MujC+fZmUNrF6WrkUAn
 WcbCzyDbP6CYzejKdskb9m290pT7JfUxtA3GlFtqVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGcbE4lD671KODxxq
 P8KIR4PaDaZ2f3jldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tPa1nHDzfhVTqUmeouw85G27IAlZjeSxYIWOJ4XQLSlTtmmkh
 V3a4WvAPk0bNoyUyhqOrmKAqNaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:5/mV1airQtkR90zEmWwdKVIlFnBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:FtHCQmFvTC8j1tCWqmJB2WAQQdF+T0SA8yrTMUaWC2BPUuOKHAo=
X-Talos-MUID: 9a23:q9BOLgnASr5zfvXEUkLsdnpNCORX/7qhMXxRkJdWsMqkPnBgFxmk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544873512"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:34 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id DD94B18000631
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 6A663CC8C92; Fri,  6 Nov 2026 06:43:33 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 26/27] python3-git: Fix CVE-2026-87819
Date: Fri,  6 Nov 2026 06:43:30 -0800
Message-Id: <20261106144331.3354811-27-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249682
Content-Type: text/plain; charset="utf-8"

This patch applies the upstream fix as referenced in [3],
using the commit shown in [1] and [2].

[1] https://github.com/gitpython-developers/GitPython/commit/751473a5f3221d6f989291cbebcc404353fd3ba8
[2] https://github.com/gitpython-developers/GitPython/commit/bc63b027e2fc737e2ec0222bfa764e1aa76a427f
[3] https://security-tracker.debian.org/tracker/CVE-2026-87819

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
- Changed the advisory reference from NVD to Debian Security Tracker.
  Added the omitted release-note change to p1. In p2, restored comments
  identifying the Actor.from_string and review-follow-up changes, and
  moved the Co-authored-by trailer into the commit-message trailer block.
---
 .../python3-git/CVE-2026-87819_p1.patch       |  78 ++++++++++
 .../python3-git/CVE-2026-87819_p2.patch       | 146 ++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |   2 +
 3 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
new file mode 100644
index 0000000000..8d5566c19c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
@@ -0,0 +1,78 @@
+From 47e0d430af6885ceeaa38a8c5517efac872b70b4 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Tue, 11 Aug 2026 14:18:25 +0200
+Subject: [PATCH] fix: parse actor identities without regular expressions
+
+<!-- agent -->
+GHSA-g5vv-9gxw-82hx reports quadratic backtracking when an actor
+identity contains a long unterminated email delimiter.
+
+Add a regression that exercises a 20,000-character malformed identity,
+then replace both actor regexes with direct delimiter scans following
+Git's first-opening, first-closing delimiter behavior. Keep GitPython's
+whole-string fallback when either delimiter is absent.
+
+Reference Git baseline cf5497b14c5a24f10c13f7e0ee85cb95
+ident.c::split_ident_line and its invalid-committer cases in
+t/t9300-fast-import.sh. Also reference gix-actor's signature decoder and
+lenient identity tests.
+
+CVE: CVE-2026-87819
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/751473a5f3221d6f989291cbebcc404353fd3ba8]
+
+Backport Changes:
+- Omitted test/test_actor.py because the current PyPI source
+  archive does not include the test suite and the python3-git
+  recipe does not run it.
+- Omitted doc/source/changes.rst file changes.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+(cherry picked from commit 751473a5f3221d6f989291cbebcc404353fd3ba8)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/util.py | 24 ++++++++----------------
+ 1 file changed, 8 insertions(+), 16 deletions(-)
+
+diff --git a/git/util.py b/git/util.py
+index 9619937c..9a698e6d 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -772,10 +772,6 @@ class Actor:
+     committers and authors or anything with a name and an email as mentioned in the git
+     log entries."""
+
+-    # PRECOMPILED REGEX
+-    name_only_regex = re.compile(r"<(.*)>")
+-    name_email_regex = re.compile(r"(.*) <(.*?)>")
+-
+     # ENVIRONMENT VARIABLES
+     # These are read when creating new commits.
+     env_author_name = "GIT_AUTHOR_NAME"
+@@ -820,18 +816,14 @@ class Actor:
+         :return:
+             :class:`Actor`
+         """
+-        m = cls.name_email_regex.search(string)
+-        if m:
+-            name, email = m.groups()
+-            return Actor(name, email)
+-        else:
+-            m = cls.name_only_regex.search(string)
+-            if m:
+-                return Actor(m.group(1), None)
+-            # Assume the best and use the whole string as name.
+-            return Actor(string, None)
+-            # END special case name
+-        # END handle name/email matching
++        line = string.partition("\n")[0]
++        left_bracket = line.find("<")
++        right_bracket = line.find(">", left_bracket + 1)
++        if left_bracket >= 0 and right_bracket >= 0:
++            return Actor(line[:left_bracket].rstrip(), line[left_bracket + 1 : right_bracket])
++
++        # Assume the best and use the whole string as name.
++        return Actor(string, None)
+
+     @classmethod
+     def _main_actor(
diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch
new file mode 100644
index 0000000000..cf5d931830
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch
@@ -0,0 +1,146 @@
+From 0d63f66a673cfcad25a1fd85f56177d19a1b6547 Mon Sep 17 00:00:00 2001
+From: Byron <sebastian.thiel@icloud.com>
+Date: Fri, 28 Aug 2026 08:37:50 +0200
+Subject: [PATCH] fix: restore Actor.name_email_regex (#2220)
+
+<!-- agent -->
+GitPython 3.1.60 removed the Actor.name_email_regex class attribute while
+replacing internal actor parsing, which broke downstream consumers such as
+python-semantic-release.
+
+Bring back the historical compiled pattern for downstream compatibility,
+but emit DeprecationWarning whenever the class member is accessed. The warning
+explains its quadratic behavior on long malformed strings and points callers to
+the public Actor(name, email) constructor when fields are separate, or direct
+string parsing when they are not.
+
+Assisted-by: GPT 5.6
+Co-authored-by: GPT 5.6 <codex@openai.com>
+
+# 252a84ac Add public Actor.from_string constructor (#2220)
+
+Add public Actor.from_string constructor (#2220)
+
+Promote the existing actor identity parser to Actor.from_string while retaining _from_string as a compatibility alias. Point the name_email_regex deprecation warning to the new public constructor or Actor(name, email).
+
+Validation:
+- actor-related test/test_actor.py and test/test_util.py cases: 12 passed
+- ruff check and format checks passed
+- basedpyright git/util.py: no errors
+
+Co-authored-by: Codex GPT-5 <codex@openai.com>
+
+# dd2181d8 Address review feedback about Actor subclasses
+
+Address review feedback about Actor subclasses
+
+Review feedback: Actor.from_string() should preserve the class on which the public classmethod is called instead of always returning a base Actor.
+
+Construct through cls on both parsing paths and cover subclass construction directly.
+
+Validation:
+- actor-related test/test_actor.py and test/test_util.py cases: 13 passed
+- ruff check and format checks passed
+- basedpyright git/util.py: no errors
+
+# fcf1ecb1 Address review feedback about constructor typing
+
+Address review feedback about constructor typing
+
+Review feedback: Actor.from_string() constructs subclasses at runtime but its Actor return annotation prevents type checkers from preserving subclass-specific members.
+
+Use the project existing Python 3.7-compatible bound TypeVar pattern so the declared return type follows cls.
+
+Validation:
+- actor-related test/test_actor.py and test/test_util.py cases: 13 passed
+- ruff check and format checks passed
+- basedpyright git/util.py: no errors
+
+Co-authored-by: Codex GPT-5 <codex@openai.com>
+
+CVE: CVE-2026-87819
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/bc63b027e2fc737e2ec0222bfa764e1aa76a427f]
+
+Backport Changes:
+- Omitted test/test_actor.py because the current PyPI source archive
+  does not include the test suite and the python3-git recipe does not
+  run it.
+
+(cherry picked from commit bc63b027e2fc737e2ec0222bfa764e1aa76a427f)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/util.py | 26 +++++++++++++++++++++++---
+ 1 file changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/git/util.py b/git/util.py
+index 9a698e6d..16cd25ef 100644
+--- a/git/util.py
++++ b/git/util.py
+@@ -80,6 +80,7 @@ from typing import (
+     Sequence,
+     Tuple,
+     TYPE_CHECKING,
++    Type,
+     TypeVar,
+     Union,
+     cast,
+@@ -108,6 +109,7 @@ from git.types import (
+
+ T_IterableObj = TypeVar("T_IterableObj", bound=Union["IterableObj", "Has_id_attribute"], covariant=True)
+ # So IterableList[Head] is subtype of IterableList[IterableObj].
++T_Actor = TypeVar("T_Actor", bound="Actor")
+
+ _logger = logging.getLogger(__name__)
+
+@@ -767,11 +769,27 @@ class CallableRemoteProgress(RemoteProgress):
+         self._callable(*args, **kwargs)
+
+
++class _DeprecatedActorNameEmailRegex:
++    _pattern = re.compile(r"(.*) <(.*?)>")
++
++    def __get__(self, _instance: Any, _owner: Any) -> Pattern[str]:
++        warnings.warn(
++            "Actor.name_email_regex is deprecated and will be removed in GitPython 4.0.0 because searching long "
++            "malformed strings with it can take quadratic time. Use Actor.from_string() to parse actor identities, "
++            "or Actor(name, email) when the fields are already separate.",
++            DeprecationWarning,
++            stacklevel=2,
++        )
++        return self._pattern
++
++
+ class Actor:
+     """Actors hold information about a person acting on the repository. They can be
+     committers and authors or anything with a name and an email as mentioned in the git
+     log entries."""
+
++    name_email_regex = _DeprecatedActorNameEmailRegex()
++
+     # ENVIRONMENT VARIABLES
+     # These are read when creating new commits.
+     env_author_name = "GIT_AUTHOR_NAME"
+@@ -805,7 +823,7 @@ class Actor:
+         return '<git.Actor "%s <%s>">' % (self.name, self.email)
+
+     @classmethod
+-    def _from_string(cls, string: str) -> "Actor":
++    def from_string(cls: Type[T_Actor], string: str) -> T_Actor:
+         """Create an :class:`Actor` from a string.
+
+         :param string:
+@@ -820,10 +838,12 @@ class Actor:
+         left_bracket = line.find("<")
+         right_bracket = line.find(">", left_bracket + 1)
+         if left_bracket >= 0 and right_bracket >= 0:
+-            return Actor(line[:left_bracket].rstrip(), line[left_bracket + 1 : right_bracket])
++            return cls(line[:left_bracket].rstrip(), line[left_bracket + 1 : right_bracket])
+
+         # Assume the best and use the whole string as name.
+-        return Actor(string, None)
++        return cls(string, None)
++
++    _from_string = from_string
+
+     @classmethod
+     def _main_actor(
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index efd17b45c4..1c77341132 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -50,6 +50,8 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-78675.patch \
            file://CVE-2026-87817.patch \
            file://CVE-2026-87818.patch \
+           file://CVE-2026-87819_p1.patch \
+           file://CVE-2026-87819_p2.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

