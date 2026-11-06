Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7521.1793976220823708730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CI9sgnQq;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6426; q=dns/txt;
  s=iport01; t=1793976220; x=1795185820;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=SOhRAgNrTc9u8M2D9k9aQAhDW8BJAdacJb7wFDRCDs0=;
  b=CI9sgnQqdjw86UjWWTIV8qQVbfQrSju4rpuOzmV8ZNIKNZEUFFVI1rOe
   RTGDBiVtNoQHBrzVnfjgy8oizKwbiWhA03BvnWkwLepCHApBN6obsij/5
   l5WvFu2JMHE2VDcpTcrqBSwGW1Pc5QY2wiwKCr/JHkU6tS1jMW9HHM0jg
   kKr7avCTV8AoZuDztmgUMrJInTYCI6zc1+xWMrv4Py4JLeOdufTYKdhDj
   Ht9BYYu5Ey+GtB+sN4V8UHSHD4xQFe3uwX7nyIy+rAOpLqhrG5UswVa2S
   eIj40IAuF92AE/1zhQS0eNvnp5/soGfCQJfeKzSWpDGvGH+EhkLAEsAGA
   A==;
X-CSE-ConnectionGUID: iF508r/dSZu1/zR1N6CO3w==
X-CSE-MsgGUID: tv229FN0SwGWPyJClQRZYA==
X-IPAS-Result: =?us-ascii?q?A0ACAwAN5+1q/43/Ja1aH4I6gld1YENJA5QngiEDniEUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhD9GAo4dAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYI6AzcDEbxNg?=
 =?us-ascii?q?XkzgQGDKQE/AkNQ2EwQb4FoAQsUAYE4hUKIJF0YAUSEOScbgUlEgRWDaYEFg?=
 =?us-ascii?q?VwBAYFGhmAEgxwSgVqBA4wVAoFRW4YeSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hkj2CRQgzEgEsEFEBCiGCFBildp9TgT6EKowklToaM6pxC?=
 =?us-ascii?q?5h9jgqVPIEVhGmBbwYvgUcLBzMaCBsVO4JnCUoZD445g2uBf4NlxggmMgIGA?=
 =?us-ascii?q?wMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:d4Sl7qBmGjHB+xVW/37iw5YqxClBgxIJ4kV8jS/XYbTApDsn02NTn
 TEbD2DSbP/fYGqgetwkPo7lpkxQ7ZDVyIdrOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwtszVBEseoEjyPsuRnN0r
 NpGAxdWcUXW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/GY8kleulrnL+aDZf7lmSoMLb5kCOkFAtj+axbYe9ltqiWdsPxBe2g
 Dr94EvGOgA4H9im8wi02yf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aetRIaHt4VGOog5UTVluzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ02FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:o8LyMK4oc/0QADRKAgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3ANDORk2lacuyBFZUAV5V64fvYS2bXOXzzkS+AOQi?=
 =?us-ascii?q?0MlR0EfqHcwa2pohDyNU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3Aq7AUPw8L03bfzimL4OOPlFuQf9t2uf7/JmZVqoo?=
 =?us-ascii?q?phPGVFwd0Ag2vvR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544476455"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 19EDC180004AF
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id B6D5BCBF204; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 04/27] python3-git: fix CVE-2026-67324
Date: Fri,  6 Nov 2026 06:43:08 -0800
Message-Id: <20261106144331.3354811-5-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249689
Content-Type: text/plain; charset="utf-8"

Upstream commit [1] adds joined-short-option parsing, including
clustered forms such as -fuVALUE, while preserving safe attached
values. This behavior matches CVE-2026-67324's description [2] and
the upstream advisory [3]. The commit also adjusts clone-option
handling to preserve long-option abbreviation checks.

[1] https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-67324
[3] https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-v396-v7q4-x2qj

Signed-off-by: Yogita Urade <yurade@cisco.com>
---
Changes in v2:
-  Refreshed patch context and removed trailing whitespace.
---
 .../python/python3-git/CVE-2026-67324.patch   | 94 +++++++++++++++++++
 .../python/python3-git_3.1.43.bb              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch

diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
new file mode 100644
index 0000000000..73722344c1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
@@ -0,0 +1,94 @@
+From b09720b6f8311edac108392bd834e74918836c4f Mon Sep 17 00:00:00 2001
+From: "GPT 5.6" <codex@openai.com>
+Date: Sun, 12 Jul 2026 14:12:16 +0200
+Subject: [PATCH] fix: reject joined unsafe short options
+
+GitPython blocks options such as --upload-pack/-u and --config/-c
+because they can execute arbitrary commands unless unsafe options are
+explicitly allowed. Git also accepts a short option with its value
+joined to the same token, including after clusterable flags. Forms
+such as -uVALUE, -fuVALUE, -cVALUE, and -vcVALUE could therefore
+bypass an exact-token check.
+
+Parse single-dash option tokens sufficiently to recognize blocked
+short options while preserving safe attached values such as
+-oupstream. Also distinguish clone multi-option values from bare
+kwargs so positional values are not treated as long-option
+abbreviations.
+
+This completes the option-validation hardening for
+GHSA-2f96-g7mh-g2hx.
+
+CVE: CVE-2026-67324
+Upstream-Status: Backport [https://github.com/gitpython-developers/GitPython/commit/56806080c1348749b07daa4a2024ce47b3cad285]
+
+Backport Changes:
+- Omitted test/test_clone.py, test/test_git.py, test/test_remote.py
+  because the current PyPI source archive does not include the test
+  suite and the python3-git recipe does not run it.
+
+Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
+(cherry picked from commit 56806080c1348749b07daa4a2024ce47b3cad285)
+Signed-off-by: Yogita Urade <yurade@cisco.com>
+---
+ git/cmd.py | 40 ++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 36 insertions(+), 4 deletions(-)
+
+diff --git a/git/cmd.py b/git/cmd.py
+index 523029fc..75495dc1 100644
+--- a/git/cmd.py
++++ b/git/cmd.py
+@@ -734,8 +734,21 @@
+     @classmethod
+     def check_unsafe_options(cls, options: List[str], unsafe_options: List[str]) -> None:
+-        """Check for unsafe options.
+-
+-        Some options that are passed to ``git <command>`` can be used to execute
+-        arbitrary commands. These are blocked by default.
++        """Raise :class:`~git.exc.UnsafeOptionError` for blocked option spellings.
++
++        In addition to exact matches, this rejects abbreviated long options accepted
++        by Git (for example, ``--upl`` for ``--upload-pack``) and unsafe short options
++        whose values are joined to the same token, including after clusterable flags
++        (for example, ``-uVALUE`` and ``-fuVALUE``).
++
++        A list containing only bare names is treated as normalized keyword arguments,
++        so multi-character names such as ``upload_p`` are checked as long-option
++        abbreviations. If any item starts with ``-``, the list is treated as tokenized
++        command-line input: bare items can be option values and are not checked as
++        abbreviations. Thus ``["--origin", "upload"]`` is allowed. Single-dash options
++        use short-option parsing rather than broad prefix matching, preserving safe
++        attached values such as ``-oupstream`` and ``-bcurrent``.
++
++        Some options passed to ``git <command>`` can execute arbitrary commands and
++        are therefore blocked by default unless the caller explicitly allows them.
+         """
+         # Options can be of the form `foo`, `--foo`, `--foo bar`, or `--foo=bar`.
+@@ -747,4 +760,13 @@
+         # only.
+         canonical_unsafe_options = {cls._canonicalize_option_name(option): option for option in unsafe_options}
++        unsafe_short_options = {
++            canonical: option
++            for canonical, option in canonical_unsafe_options.items()
++            if option.startswith("-") and not option.startswith("--") and len(canonical) == 1
++        }
++        # These value-less Git flags can be clustered before another short option
++        # (for example, ``-fuVALUE``). Stop at any other character because it may
++        # begin an attached value, as ``o`` does in the safe option ``-oupstream``.
++        clusterable_short_options = frozenset("46flnqsv")
+         options_are_kwargs = all(not option.startswith("-") for option in options)
+         for option in options:
+@@ -757,3 +779,13 @@
+                 raise UnsafeOptionError(f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it.")
++            option_token = option.split("=", 1)[0].split(None, 1)[0]
++            if option_token.startswith("-") and not option_token.startswith("--"):
++                for option_char in option_token[1:]:
++                    unsafe_option = unsafe_short_options.get(option_char)
++                    if unsafe_option is not None:
++                        raise UnsafeOptionError(
++                            f"{unsafe_option} is not allowed, use `allow_unsafe_options=True` to allow it."
++                        )
++                    if option_char not in clusterable_short_options:
++                        break
+             if not (option.startswith("--") or (options_are_kwargs and len(candidate) > 1)):
+                 continue
diff --git a/meta/recipes-devtools/python/python3-git_3.1.43.bb b/meta/recipes-devtools/python/python3-git_3.1.43.bb
index 76a21c670f..ca2efce37e 100644
--- a/meta/recipes-devtools/python/python3-git_3.1.43.bb
+++ b/meta/recipes-devtools/python/python3-git_3.1.43.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://CVE-2026-42284.patch \
            file://CVE-2026-67323.patch \
            file://CVE-2026-67325_p1.patch \
            file://CVE-2026-67325_p2.patch \
+           file://CVE-2026-67324.patch \
            "
 SRC_URI[sha256sum] = "35f314a9f878467f5453cc1fee295c3e18e52f1b99f10f6cf5b1682e968a9e7c"
 
-- 
2.53.0

