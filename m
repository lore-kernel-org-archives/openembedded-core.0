Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A440C5DF83
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:28:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2754.1787030925121593991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:28:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qXQl3eGL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QZNquEV0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a01357ee21-7391d4ed-ff29-4e64-863a-d4b94b0fd5e0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787030925;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AYdj4XOHcbPjkn9uZ9mDa8dYO5FRj6Lzorz88WbrGrg=;
	b=qXQl3eGLO6SF9pAwjdqVK1dRNkxLSvC3FoR6LUnlIOtX9fnUSURegGVVs0zBmFNK
	39FYSWq4PBXtnQ2lxCvW17m8Efqx7BhaBHrJpV230CVXo1q/f2iteaqqYG8+1w3UC1m
	DLgyPDcoh7TCC2wr0t9e/7/4EqRbsJsH3Wi4kPPM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787030925;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AYdj4XOHcbPjkn9uZ9mDa8dYO5FRj6Lzorz88WbrGrg=;
	b=QZNquEV0ubTm9xD/7mAYgg5Nu9DQ0zGMFqD7MozVhnRmIrzQ6JeSM90He65wjqSp
	S4s6MreXRrz0DNKS2E6rELvs+FGCXo5T5Fu2QSuG/rH+u11I6HCudGtlM7xmXJRsjTl
	HBq3LL7NGyQMW79cThLGpZoEUAT0finxL0y+TqMw=
Content-Type: multipart/mixed; boundary="===============3996724233091617712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pygments: upgrading to 2.21.0 SUCCEEDED
Message-ID: <010101a01357ee21-7391d4ed-ff29-4e64-863a-d4b94b0fd5e0-000000@us-west-2.amazonses.com>
Date: Tue, 18 Aug 2026 05:28:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.18-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243646

--===============3996724233091617712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pygments* to *2.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pygments-upgrade-2.20.0-2.21.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c0fb11062c519a1c04475d30119765023b9cb7e2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 18 Aug 2026 05:25:36 +0000
Subject: [PATCH] python3-pygments: upgrade 2.20.0 -> 2.21.0

Source: CHANGES

Version 2.21.0
---------------
(released August 17th, 2026)

- New lexers:

  * BitBake (#3103)
  * Caddyfile (#3225)
  * CEL (#3048)
  * PureScript (#1077, #3054)

- Updated lexers:

  * Bash: Fix coloured keyword at the beginning of a name (#2926)
  * Boogie: Add missing Boogie and Civl Verifier keywords (#3156)
  * C#:
    - Recognize interpolated verbatim strings with either ``$@`` or ``@$``
      prefixes (#2685)
    - Support dollar-prefixed and multi-quote raw strings (#3129, #2897)
    - Recognize ``union`` (#3182)
  * C/C++:
    - Add C23/C++26 attributes (#3084)
    - Add more C2Y keywords (#3092)
    - Highlight a function following a namespace body (#2928)
    - Fix C/C++ lexer support for multiline pre-processor comments (#3051)
    - Add ``.ipp`` as a file extension (#3141, #1008)
  * Clojure: Recognize named, octal and unicode character literals such as
    ``\space`` and ``\o377`` as a single token (#979)
  * Csound: Add missing opcode parameter type letter (#3161)
  * CUDA: Derive from the C++ lexer instead of C to highlight C++
    constructs such as ``template``, ``class`` and ``namespace`` (#3127)
  * D: Allow non-ASCII (Unicode) identifiers (#1088)
  * Fish: Fix single quote backslash escape (#3138, #2821)
  * Go: Various lexer improvements (#3199)
  * GoogleSQL: Require a word break after ``SET`` (#3167)
  * Hexdump: Only match valid digits (#3200, #2847)
  * JavaScript: Highlight the ``arguments`` object (#3146)
  * Jsonnet: Recognize colons in array slice expressions (#2828)
  * JSX: Allow apostrophes in element text (#2816)
  * Julia: Fix rstrings backslash (#3140, #2537)
  * Kotlin: Support companion objects without an explicit name (#2525)
  * Kotlin: Don't let a nullable type marker (``?``) consume the following
    character, so ``Foo?,`` and ``a?:b`` tokenize correctly (#2964)
  * Kusto: Recognize member-access dots in dynamic objects (#2779)
  * Lua: Various improvements (#3143)
  * Macaulay2: Update symbols to 1.26.05 (#3120)
  * Markdown:
    - Highlight bold-italics (``***...***`` and ``___...___``) (#3067)
    - Fix mention regex to support hyphens in usernames (#3139, #3135)
  * Markdown, reStructuredText, TiddlyWiki5: Fix wrong token offsets for
    embedded code blocks (#3133)
  * Mathematica: Recognize ``\[Name]`` named-character escapes such as
    ``\[Nu]`` instead of emitting an ``Error`` token (#3097)
  * MATLAB, Octave, Scilab: Allow ``...`` line continuations in function
    definition signatures (#659)
  * MySQL: Require a word break after ``SET`` (#3110)
  * PostgreSQL: Add more keywords (#3066)
  * Python:
    - Recognize ``sentinel`` (#3114)
    - Recognize ``frozendict`` (#3119)
    - Recognize lazy imports (#3115)
  * reStructuredText: Allow ``.`` and ``+`` in directive/role names (#3085)
  * Ruby: Don't duplicate the body of an unterminated heredoc (#2998)
  * Ruby: Treat ``<<`` after ``)``, ``]`` or ``}`` as the shift operator
    rather than the start of a heredoc (#760)
  * S

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../{python3-pygments_2.20.0.bb => python3-pygments_2.21.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.20.0.bb => python3-pygments_2.21.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.20.0.bb b/meta/recipes-devtools/python/python3-pygments_2.21.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pygments_2.20.0.bb
rename to meta/recipes-devtools/python/python3-pygments_2.21.0.bb
index abe6205292..044014b134 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.21.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592"
 
 inherit python_hatchling
-SRC_URI[sha256sum] = "6757cd03768053ff99f3039c1a36d6c0aa0b263438fcab17520b30a303a82b5f"
+SRC_URI[sha256sum] = "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
 
 inherit pypi
 
-- 
2.47.1


--===============3996724233091617712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pygments: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.20.0.tar.gz;downloadfilename=pygments-2.20.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pygments/pygments-2.21.0.tar.gz;downloadfilename=pygments-2.21.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pygments: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dbg: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dbg: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dev: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-dev: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-doc: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-doc: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-locale: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-locale: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-src: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-src: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-staticdev: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments-staticdev: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PV changed from "2.20.0" to "2.21.0"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PKGV changed from 2.20.0 [default] to 2.21.0 [default]
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pygments-2.21.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info -> /usr/lib/python3.14/site-packages/pygments-2.21.0.dist-info, added "/usr/lib/python3.14/site-packages/pygments/lexers/bitbake.py /usr/lib/python3.14/site-packages/pygments/styles/__pycache__/night_owl.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/cel.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/purescript.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/bitbake.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/cel.py /usr/lib/python3.14/site-packages/pygments/lexers/purescript.py /usr/lib/python3.14/site-packages/pygments/styles/night_owl.py"
packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: PKGSIZE changed from 8828521 to 8981461 (+2%)
Changes to packages/x86-64-v3-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info moved to /usr/lib/python3.14/site-packages/pygments-2.21.0.dist-info
  /usr/lib/python3.14/site-packages/pygments/lexers/bitbake.py was added
  /usr/lib/python3.14/site-packages/pygments/lexers/cel.py was added
  /usr/lib/python3.14/site-packages/pygments/lexers/purescript.py was added
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/bitbake.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/cel.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/purescript.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/styles/night_owl.py was added
  /usr/lib/python3.14/site-packages/pygments/styles/__pycache__/night_owl.cpython-314.pyc was added

--===============3996724233091617712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pygments/python3-pygments: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info -> /usr/lib/python3.14/site-packages/pygments-2.21.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pygments-2.21.0.dist-info/licenses, added "/usr/lib/python3.14/site-packages/pygments/lexers/bitbake.py /usr/lib/python3.14/site-packages/pygments/styles/night_owl.py /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/bitbake.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/cel.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/purescript.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/styles/__pycache__/night_owl.cpython-314.pyc /usr/lib/python3.14/site-packages/pygments/lexers/cel.py /usr/lib/python3.14/site-packages/pygments/lexers/purescript.py"
Changes to packages/x86-64-v3-poky-linux/python3-pygments (sysroot):
  /usr/lib/python3.14/site-packages/pygments-2.20.0.dist-info moved to /usr/lib/python3.14/site-packages/pygments-2.21.0.dist-info
  /usr/lib/python3.14/site-packages/pygments/lexers/bitbake.py was added
  /usr/lib/python3.14/site-packages/pygments/lexers/cel.py was added
  /usr/lib/python3.14/site-packages/pygments/lexers/purescript.py was added
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/bitbake.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/cel.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/lexers/__pycache__/purescript.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pygments/styles/night_owl.py was added
  /usr/lib/python3.14/site-packages/pygments/styles/__pycache__/night_owl.cpython-314.pyc was added

--===============3996724233091617712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pygments-changelog.txt"

Changelog for python3-pygments: 2.20.0 -> 2.21.0
Source: CHANGES

Version 2.21.0
---------------
(released August 17th, 2026)

- New lexers:

  * BitBake (#3103)
  * Caddyfile (#3225)
  * CEL (#3048)
  * PureScript (#1077, #3054)

- Updated lexers:

  * Bash: Fix coloured keyword at the beginning of a name (#2926)
  * Boogie: Add missing Boogie and Civl Verifier keywords (#3156)
  * C#:
    - Recognize interpolated verbatim strings with either ``$@`` or ``@$``
      prefixes (#2685)
    - Support dollar-prefixed and multi-quote raw strings (#3129, #2897)
    - Recognize ``union`` (#3182)
  * C/C++:
    - Add C23/C++26 attributes (#3084)
    - Add more C2Y keywords (#3092)
    - Highlight a function following a namespace body (#2928)
    - Fix C/C++ lexer support for multiline pre-processor comments (#3051)
    - Add ``.ipp`` as a file extension (#3141, #1008)
  * Clojure: Recognize named, octal and unicode character literals such as
    ``\space`` and ``\o377`` as a single token (#979)
  * Csound: Add missing opcode parameter type letter (#3161)
  * CUDA: Derive from the C++ lexer instead of C to highlight C++
    constructs such as ``template``, ``class`` and ``namespace`` (#3127)
  * D: Allow non-ASCII (Unicode) identifiers (#1088)
  * Fish: Fix single quote backslash escape (#3138, #2821)
  * Go: Various lexer improvements (#3199)
  * GoogleSQL: Require a word break after ``SET`` (#3167)
  * Hexdump: Only match valid digits (#3200, #2847)
  * JavaScript: Highlight the ``arguments`` object (#3146)
  * Jsonnet: Recognize colons in array slice expressions (#2828)
  * JSX: Allow apostrophes in element text (#2816)
  * Julia: Fix rstrings backslash (#3140, #2537)
  * Kotlin: Support companion objects without an explicit name (#2525)
  * Kotlin: Don't let a nullable type marker (``?``) consume the following
    character, so ``Foo?,`` and ``a?:b`` tokenize correctly (#2964)
  * Kusto: Recognize member-access dots in dynamic objects (#2779)
  * Lua: Various improvements (#3143)
  * Macaulay2: Update symbols to 1.26.05 (#3120)
  * Markdown:
    - Highlight bold-italics (``***...***`` and ``___...___``) (#3067)
    - Fix mention regex to support hyphens in usernames (#3139, #3135)
  * Markdown, reStructuredText, TiddlyWiki5: Fix wrong token offsets for
    embedded code blocks (#3133)
  * Mathematica: Recognize ``\[Name]`` named-character escapes such as
    ``\[Nu]`` instead of emitting an ``Error`` token (#3097)
  * MATLAB, Octave, Scilab: Allow ``...`` line continuations in function
    definition signatures (#659)
  * MySQL: Require a word break after ``SET`` (#3110)
  * PostgreSQL: Add more keywords (#3066)
  * Python:
    - Recognize ``sentinel`` (#3114)
    - Recognize ``frozendict`` (#3119)
    - Recognize lazy imports (#3115)
  * reStructuredText: Allow ``.`` and ``+`` in directive/role names (#3085)
  * Ruby: Don't duplicate the body of an unterminated heredoc (#2998)
  * Ruby: Treat ``<<`` after ``)``, ``]`` or ``}`` as the shift operator
    rather than the start of a heredoc (#760)
  * SCSS: Recognize variable references in property values (#2818)
  * Shell: Recognize chevron prompts (#3096)
  * Smithy: Fix text blocks and add missing syntax (#3168)
  * Swift: Keep ``func`` a keyword in ``class func`` type methods (#1125)
  * Tcl: Stop ``$name`` variable references at a dash (#1720)
  * TeX: Recognize LaTeX math environments as math (#3034)
  * Twig: Allow uppercase letters at the start of identifiers (#3159, #2965)
  * TypeScript: Only treat ``module`` as a keyword when followed by
    whitespace, so identifiers like ``modules`` and ``module.exports``
    are highlighted correctly (#2823)
  * Vala: Recognize verbatim strings before ordinary quoted strings (#2861)
  * Vala: Recognize conditional compilation directives (#2858)
  * Vim:
    - Bump the syntax file to vim 9.2 (#3183, #3174)
    - Small improvements to the VimScript lexer (#3173)
  * YAML: Add ``yml`` alias (#3169), recognize non-breaking spaces as valid
    scalar content (#2827)
  * WebAssembly: Recognize sign-extension operators (#2991, #3160)
  * XML: Mark SVG files as XML (#3093)

- New styles:

  * Night Owl (#3132)

- Fix catastrophic backtracking in ``looks_like_xml`` (#2931, #3112)
- Improve monokai theme colors (#3100)
- Improve handling of non-string types in ``html_escape`` to fix broken clients (#3090, #3086)
- LaTeX formatter: honor the wrapped lexer's ``stripnl`` and other input
  options when ``escapeinside`` is set, so blank lines are no longer stripped
  under ``stripnl=false`` (#2975)
- RawTokenFormatter: fix a crash when ``error_color`` is set (#3215)
- Groff formatter: don't duplicate a character when word-wrapping (``wrap``)
  a token that is not at the end of a line (#3201)
- Add support for Python 3.15 (#3099)
- Fix invalid ``-L`` values report success (#3217)
- Allow ``transparent`` as a color style definition (#3180, #3170)
- HtmlFormatter: ``"`` and ``'`` now render literally (#3185)

    - Improve parentheses handling for function definitions (#2207, #2208)

--===============3996724233091617712==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pygments-upgrade-2.20.0-2.21.0.patch"

RnJvbSBjMGZiMTEwNjJjNTE5YTFjMDQ0NzVkMzAxMTk3NjUwMjNiOWNiN2UyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTggQXVnIDIwMjYgMDU6MjU6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5Z21lbnRzOiB1cGdyYWRlIDIuMjAuMCAtPiAyLjIxLjAKClNvdXJjZTogQ0hBTkdF
UwoKVmVyc2lvbiAyLjIxLjAKLS0tLS0tLS0tLS0tLS0tCihyZWxlYXNlZCBBdWd1c3QgMTd0aCwg
MjAyNikKCi0gTmV3IGxleGVyczoKCiAgKiBCaXRCYWtlICgjMzEwMykKICAqIENhZGR5ZmlsZSAo
IzMyMjUpCiAgKiBDRUwgKCMzMDQ4KQogICogUHVyZVNjcmlwdCAoIzEwNzcsICMzMDU0KQoKLSBV
cGRhdGVkIGxleGVyczoKCiAgKiBCYXNoOiBGaXggY29sb3VyZWQga2V5d29yZCBhdCB0aGUgYmVn
aW5uaW5nIG9mIGEgbmFtZSAoIzI5MjYpCiAgKiBCb29naWU6IEFkZCBtaXNzaW5nIEJvb2dpZSBh
bmQgQ2l2bCBWZXJpZmllciBrZXl3b3JkcyAoIzMxNTYpCiAgKiBDIzoKICAgIC0gUmVjb2duaXpl
IGludGVycG9sYXRlZCB2ZXJiYXRpbSBzdHJpbmdzIHdpdGggZWl0aGVyIGBgJEBgYCBvciBgYEAk
YGAKICAgICAgcHJlZml4ZXMgKCMyNjg1KQogICAgLSBTdXBwb3J0IGRvbGxhci1wcmVmaXhlZCBh
bmQgbXVsdGktcXVvdGUgcmF3IHN0cmluZ3MgKCMzMTI5LCAjMjg5NykKICAgIC0gUmVjb2duaXpl
IGBgdW5pb25gYCAoIzMxODIpCiAgKiBDL0MrKzoKICAgIC0gQWRkIEMyMy9DKysyNiBhdHRyaWJ1
dGVzICgjMzA4NCkKICAgIC0gQWRkIG1vcmUgQzJZIGtleXdvcmRzICgjMzA5MikKICAgIC0gSGln
aGxpZ2h0IGEgZnVuY3Rpb24gZm9sbG93aW5nIGEgbmFtZXNwYWNlIGJvZHkgKCMyOTI4KQogICAg
LSBGaXggQy9DKysgbGV4ZXIgc3VwcG9ydCBmb3IgbXVsdGlsaW5lIHByZS1wcm9jZXNzb3IgY29t
bWVudHMgKCMzMDUxKQogICAgLSBBZGQgYGAuaXBwYGAgYXMgYSBmaWxlIGV4dGVuc2lvbiAoIzMx
NDEsICMxMDA4KQogICogQ2xvanVyZTogUmVjb2duaXplIG5hbWVkLCBvY3RhbCBhbmQgdW5pY29k
ZSBjaGFyYWN0ZXIgbGl0ZXJhbHMgc3VjaCBhcwogICAgYGBcc3BhY2VgYCBhbmQgYGBcbzM3N2Bg
IGFzIGEgc2luZ2xlIHRva2VuICgjOTc5KQogICogQ3NvdW5kOiBBZGQgbWlzc2luZyBvcGNvZGUg
cGFyYW1ldGVyIHR5cGUgbGV0dGVyICgjMzE2MSkKICAqIENVREE6IERlcml2ZSBmcm9tIHRoZSBD
KysgbGV4ZXIgaW5zdGVhZCBvZiBDIHRvIGhpZ2hsaWdodCBDKysKICAgIGNvbnN0cnVjdHMgc3Vj
aCBhcyBgYHRlbXBsYXRlYGAsIGBgY2xhc3NgYCBhbmQgYGBuYW1lc3BhY2VgYCAoIzMxMjcpCiAg
KiBEOiBBbGxvdyBub24tQVNDSUkgKFVuaWNvZGUpIGlkZW50aWZpZXJzICgjMTA4OCkKICAqIEZp
c2g6IEZpeCBzaW5nbGUgcXVvdGUgYmFja3NsYXNoIGVzY2FwZSAoIzMxMzgsICMyODIxKQogICog
R286IFZhcmlvdXMgbGV4ZXIgaW1wcm92ZW1lbnRzICgjMzE5OSkKICAqIEdvb2dsZVNRTDogUmVx
dWlyZSBhIHdvcmQgYnJlYWsgYWZ0ZXIgYGBTRVRgYCAoIzMxNjcpCiAgKiBIZXhkdW1wOiBPbmx5
IG1hdGNoIHZhbGlkIGRpZ2l0cyAoIzMyMDAsICMyODQ3KQogICogSmF2YVNjcmlwdDogSGlnaGxp
Z2h0IHRoZSBgYGFyZ3VtZW50c2BgIG9iamVjdCAoIzMxNDYpCiAgKiBKc29ubmV0OiBSZWNvZ25p
emUgY29sb25zIGluIGFycmF5IHNsaWNlIGV4cHJlc3Npb25zICgjMjgyOCkKICAqIEpTWDogQWxs
b3cgYXBvc3Ryb3BoZXMgaW4gZWxlbWVudCB0ZXh0ICgjMjgxNikKICAqIEp1bGlhOiBGaXggcnN0
cmluZ3MgYmFja3NsYXNoICgjMzE0MCwgIzI1MzcpCiAgKiBLb3RsaW46IFN1cHBvcnQgY29tcGFu
aW9uIG9iamVjdHMgd2l0aG91dCBhbiBleHBsaWNpdCBuYW1lICgjMjUyNSkKICAqIEtvdGxpbjog
RG9uJ3QgbGV0IGEgbnVsbGFibGUgdHlwZSBtYXJrZXIgKGBgP2BgKSBjb25zdW1lIHRoZSBmb2xs
b3dpbmcKICAgIGNoYXJhY3Rlciwgc28gYGBGb28/LGBgIGFuZCBgYGE/OmJgYCB0b2tlbml6ZSBj
b3JyZWN0bHkgKCMyOTY0KQogICogS3VzdG86IFJlY29nbml6ZSBtZW1iZXItYWNjZXNzIGRvdHMg
aW4gZHluYW1pYyBvYmplY3RzICgjMjc3OSkKICAqIEx1YTogVmFyaW91cyBpbXByb3ZlbWVudHMg
KCMzMTQzKQogICogTWFjYXVsYXkyOiBVcGRhdGUgc3ltYm9scyB0byAxLjI2LjA1ICgjMzEyMCkK
ICAqIE1hcmtkb3duOgogICAgLSBIaWdobGlnaHQgYm9sZC1pdGFsaWNzIChgYCoqKi4uLioqKmBg
IGFuZCBgYF9fXy4uLl9fX2BgKSAoIzMwNjcpCiAgICAtIEZpeCBtZW50aW9uIHJlZ2V4IHRvIHN1
cHBvcnQgaHlwaGVucyBpbiB1c2VybmFtZXMgKCMzMTM5LCAjMzEzNSkKICAqIE1hcmtkb3duLCBy
ZVN0cnVjdHVyZWRUZXh0LCBUaWRkbHlXaWtpNTogRml4IHdyb25nIHRva2VuIG9mZnNldHMgZm9y
CiAgICBlbWJlZGRlZCBjb2RlIGJsb2NrcyAoIzMxMzMpCiAgKiBNYXRoZW1hdGljYTogUmVjb2du
aXplIGBgXFtOYW1lXWBgIG5hbWVkLWNoYXJhY3RlciBlc2NhcGVzIHN1Y2ggYXMKICAgIGBgXFtO
dV1gYCBpbnN0ZWFkIG9mIGVtaXR0aW5nIGFuIGBgRXJyb3JgYCB0b2tlbiAoIzMwOTcpCiAgKiBN
QVRMQUIsIE9jdGF2ZSwgU2NpbGFiOiBBbGxvdyBgYC4uLmBgIGxpbmUgY29udGludWF0aW9ucyBp
biBmdW5jdGlvbgogICAgZGVmaW5pdGlvbiBzaWduYXR1cmVzICgjNjU5KQogICogTXlTUUw6IFJl
cXVpcmUgYSB3b3JkIGJyZWFrIGFmdGVyIGBgU0VUYGAgKCMzMTEwKQogICogUG9zdGdyZVNRTDog
QWRkIG1vcmUga2V5d29yZHMgKCMzMDY2KQogICogUHl0aG9uOgogICAgLSBSZWNvZ25pemUgYGBz
ZW50aW5lbGBgICgjMzExNCkKICAgIC0gUmVjb2duaXplIGBgZnJvemVuZGljdGBgICgjMzExOSkK
ICAgIC0gUmVjb2duaXplIGxhenkgaW1wb3J0cyAoIzMxMTUpCiAgKiByZVN0cnVjdHVyZWRUZXh0
OiBBbGxvdyBgYC5gYCBhbmQgYGArYGAgaW4gZGlyZWN0aXZlL3JvbGUgbmFtZXMgKCMzMDg1KQog
ICogUnVieTogRG9uJ3QgZHVwbGljYXRlIHRoZSBib2R5IG9mIGFuIHVudGVybWluYXRlZCBoZXJl
ZG9jICgjMjk5OCkKICAqIFJ1Ynk6IFRyZWF0IGBgPDxgYCBhZnRlciBgYClgYCwgYGBdYGAgb3Ig
YGB9YGAgYXMgdGhlIHNoaWZ0IG9wZXJhdG9yCiAgICByYXRoZXIgdGhhbiB0aGUgc3RhcnQgb2Yg
YSBoZXJlZG9jICgjNzYwKQogICogUwoKW0NoYW5nZWxvZyB0cnVuY2F0ZWQgYXMgaXQgZXhjZWVk
cyAzMDAwIGNoYXJhY3RlcnM7CnRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4g
YXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQotLS0KIC4uLi97cHl0aG9uMy1weWdtZW50c18y
LjIwLjAuYmIgPT4gcHl0aG9uMy1weWdtZW50c18yLjIxLjAuYmJ9ICB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlnbWVudHNfMi4yMC4wLmJiID0+IHB5dGhvbjMt
cHlnbWVudHNfMi4yMS4wLmJifSAoODAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weWdtZW50c18yLjIwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVudHNfMi4yMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXgg
ODAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWdt
ZW50c18yLjIwLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1weWdtZW50c18yLjIxLjAuYmIKaW5kZXggYWJlNjIwNTI5Mi4uMDQ0MDE0YjEzNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5Z21lbnRzXzIu
MjAuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlnbWVu
dHNfMi4yMS4wLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM2YTEzYzkwNTE0ZTI4OTlmMWVi
YTdmNDFjM2VlNTkyIgogCiBpbmhlcml0IHB5dGhvbl9oYXRjaGxpbmcKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI2NzU3Y2QwMzc2ODA1M2ZmOTlmMzAzOWMxYTM2ZDZjMGFhMGIyNjM0MzhmY2FiMTc1
MjBiMzBhMzAzYTgyYjVmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjYxMGNhNzUxYzliYzI0OTJi
MzhlYjlhMzhhN2ZiYzkzZWRiYmIyZDcxODJlZGFmMzRlNjZhZTQ5M2RlZTVjOGMiCiAKIGluaGVy
aXQgcHlwaQogCi0tIAoyLjQ3LjEKCg==

--===============3996724233091617712==--

