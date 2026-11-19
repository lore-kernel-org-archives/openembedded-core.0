Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8009.1795062167036122572
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ehsZUfV0;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10759; q=dns/txt;
  s=iport01; t=1795062170; x=1796271770;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=V+cTkmHgD3EWcDoOyhkB7zrHWnAZx4Ar4SygLsCNG2I=;
  b=ehsZUfV0JWrXULyeBUIelx1JYsHPA4HzoS5X5XWbsflewTNkVMjsAs3M
   HVL+TP3qGrZ2677miaCOfR0d09mOZqed1kjrRwbrHpRxcboJyotOPWWN+
   fmF9wfmIqrKjNa8JgIQ8K/X9FvFftJ2YCA+1/dtVFl3dUurT2TCrJgx5y
   Heozj7G3CiFLhO7RucRYYNN50FXwWLOT7sUyEWBsjbZq2OiN+KnFzVE77
   Iv1Bf7oXTGhRjjJV3DDRoKKVw2QP6NwBZ+W5eqfq5fEnh1p2iibI3TCr4
   2B22n7725kDFbKzFRBsLmjZD1TNfdkSgpT+gSGExqifPO2CFe3r+Zekwh
   A==;
X-CSE-ConnectionGUID: rPS/Bb4TTPSBtjGlS8yJiA==
X-CSE-MsgGUID: xuc+icteTr6YFNc0rHgRYQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgDWd/5q/85K/pBRCYJZgld1YENJA5QngTVsA5Mki?=
 =?us-ascii?q?wUUgWoPAQEBD0QNBAEBhD9GAo4gAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDE?=
 =?us-ascii?q?bk1gXkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAUSEOScbgUlEgRWDa?=
 =?us-ascii?q?oEFSwGBEAKBKwEICgEHhmAEgxwSgVSBC4wMAoFPiApIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kL?=
 =?us-ascii?q?wUaJj4bCoEMJx8eGw4CDhgNSBEsNxUZBD5uB5NRghAWJS0ZBgEBPBs2AQceB?=
 =?us-ascii?q?hc/gTUIGZM1AgiQFYIhoRGEK4wklToaM4QEgVeSQ5JUC5h9jgqVaTE3hGqBa?=
 =?us-ascii?q?DxpcDMaCBsVgyIJShkPjjmBY4IIhRNRbMVuJjICCQMvAQEHAgcOAwuBaJACL?=
 =?us-ascii?q?YFPAQE?=
IronPort-Data: A9a23:Ham7IKKj3mpN9YyAFE+Rm5QlxSXFcZb7ZxGr2PjKsXjdYENS0DAFm
 jZJWG+FOPuLN2b8LdkiYIi0pExQsZTQn4JnGwAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmckajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN10NHpxF4dExtpPOktS9
 9McE2AcTBGq0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmES/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MnwsYDUXUrsTIIMjhu6ki1H0ciZTrxSeoq9fD237klUgieGybIW9ltqiVdhe3UeTu
 m/65TrILDcRbMa/xgC0yyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnQjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWYHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:3+RCbKv2gvnmrjcfhndcVOum7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AbhXmU2hatZoESFpkaWlAKH2pUjJuaEXmi13af3O?=
 =?us-ascii?q?EMV1DVL+6TWTA6YFlup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AodUH0A0IS1tmszJp+bQBs1DGSTUj87mlS0EGjZg?=
 =?us-ascii?q?6oZe1Gwp7Yy29gw6Ge9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="61911747"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:22:47 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 82E42180003BA
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:47 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B077FCC8C97; Wed, 18 Nov 2026 20:22:43 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 26/27] python3-git: Fix CVE-2026-87819
Date: Wed, 18 Nov 2026 20:22:41 -0800
Message-Id: <20261119042242.1640611-27-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261119042242.1640611-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
 <20261119042242.1640611-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:22:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250628
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
index 0000000000..be6e0a2b31
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
index 0000000000..6bd578f535
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
2.35.6

