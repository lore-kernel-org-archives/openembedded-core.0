Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6712EC98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:59 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1228.1790144870247368461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AQWGl07Z;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wYmqgLmQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0ccf2f470-476c8261-1960-4a04-ada5-35160e4199b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rcRN7Ul2H5PyDWmmoX9XbZQg5FFOxpFTacSiTBxF674=;
	b=AQWGl07Z92cPpBd20hVMD/M1zUuvnPWPtDH9CHWD8zpf24laPp0U3yHiQRQcJYkF
	ByoVnG7E4daHXQt4ejsgROYeHnbvApxeo7sMuLs37m9nj6iiTcc63igCZi4Nn6mxgWB
	21e2FewaY7ZSR53xISoPJvx6pPwef+LfJLbD1Yj4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rcRN7Ul2H5PyDWmmoX9XbZQg5FFOxpFTacSiTBxF674=;
	b=wYmqgLmQzCpL1CVkkYWc6YorOCaeqbGVKadv+D1NOnCXJ7/5pFeNFMt+P5oY1bTi
	lf4+UqpsPUsLQnE4OLEqs3rr3eBa7kjT6ZLOSdWknoLPtAIzGedu1R/F2Q06veShmQZ
	YZQQTZj5cKvV/KfurRnAjkADUGQ7dngoOwu2jeWs=
Content-Type: multipart/mixed; boundary="===============4545159839706368931=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.4.3 SUCCEEDED
Message-ID: <010101a0ccf2f470-476c8261-1960-4a04-ada5-35160e4199b8-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246447

--===============4545159839706368931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.4.1-1.4.3.patch
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
From dc4416fb2e3b89fd294421a5b46d0c3fe24f9c3b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:10:25 +0000
Subject: [PATCH] python3-mako: upgrade 1.4.1 -> 1.4.3

.. changelog::
    :version: 1.4.3
    :released: Tue Sep 22 2026

    .. change::
        :tags: bug, tests
        :tickets: 441

        Fixed regression caused in 1.4.2 where tests added to the suite were
        unable to run directly on Windows, due to posix mechanics: the tests
        force
        ``os.path`` to ``posixpath``, whereas
        :meth:`.TemplateLookup.get_template` converts the configured directory
        using ``os.path.sep``.  These tests are now skipped on that platform,
        where the traversal check is instead exercised against ``ntpath``
        natively.

.. changelog::
    :version: 1.4.2
    :released: Tue Sep 22 2026

    .. change::
        :tags: bug, tests
        :tickets: 440

        Adjusted the test suite to accommodate for a change in Pygments 2.21.0
        where the ``HtmlFormatter`` now renders ``"`` and ``'`` characters
        literally rather than as HTML entities, which caused failures in tests
        that assert against the rendered output of
        :func:`.html_error_template`.

    .. change::
        :tags: bug, template
        :tickets: 441

        Fixed issue in :class:`.TemplateLookup` where a URI beginning with a
        drive
        designator (e.g. ``C:/../../secret.txt``) could bypass the directory
        traversal check on Windows, allowing reads of arbitrary files outside of
        the template directory.  The check in :class:`.Template` normalized the
        URI
        using ``os.path``, which on Windows is ``ntpath``; as ``ntpath`` splits
        the
        drive designator off and treats the remainder as rooted, the ``..``
        segments were absorbed before the check could inspect them.
        Normalization
        is now performed with ``posixpath``, which is the same module used by
        :meth:`.TemplateLookup.get_template` to resolve the URI to a file.
---
 .../python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-mako_1.4.1.bb => python3-mako_1.4.3.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.4.1.bb b/meta/recipes-devtools/python/python3-mako_1.4.3.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-mako_1.4.1.bb
rename to meta/recipes-devtools/python/python3-mako_1.4.3.bb
index 367a65271f..41bccec9eb 100644
--- a/meta/recipes-devtools/python/python3-mako_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c79ceff89df0a72f29bb0e1b6f0e36ed"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "d7904710b662996425a21627710c4777c45053146942cf8a7aebf757c92b8c27"
+SRC_URI[sha256sum] = "cd6537fe88d5fec315c55c2f8529bc4ce7a9a352ad7db3eeaa6a66e2dd4ec37a"
 
 CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
 
-- 
2.47.1


--===============4545159839706368931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-mako: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.4.3.tar.gz"
packages/x86-64-v3-poky-linux/python3-mako: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 365339 to 367652 (+1%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.4.1" to "1.4.3"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info -> /usr/lib/python3.14/site-packages/mako-1.4.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.4.3.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGV changed from 1.4.1 [default] to 1.4.3 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 652895 to 653267 (+0%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PV changed from "1.4.1" to "1.4.3"
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info moved to /usr/lib/python3.14/site-packages/mako-1.4.3.dist-info

--===============4545159839706368931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-mako-changelog.txt"

.. changelog::
    :version: 1.4.3
    :released: Tue Sep 22 2026

    .. change::
        :tags: bug, tests
        :tickets: 441

        Fixed regression caused in 1.4.2 where tests added to the suite were
        unable to run directly on Windows, due to posix mechanics: the tests
        force
        ``os.path`` to ``posixpath``, whereas
        :meth:`.TemplateLookup.get_template` converts the configured directory
        using ``os.path.sep``.  These tests are now skipped on that platform,
        where the traversal check is instead exercised against ``ntpath``
        natively.

.. changelog::
    :version: 1.4.2
    :released: Tue Sep 22 2026

    .. change::
        :tags: bug, tests
        :tickets: 440

        Adjusted the test suite to accommodate for a change in Pygments 2.21.0
        where the ``HtmlFormatter`` now renders ``"`` and ``'`` characters
        literally rather than as HTML entities, which caused failures in tests
        that assert against the rendered output of
        :func:`.html_error_template`.

    .. change::
        :tags: bug, template
        :tickets: 441

        Fixed issue in :class:`.TemplateLookup` where a URI beginning with a
        drive
        designator (e.g. ``C:/../../secret.txt``) could bypass the directory
        traversal check on Windows, allowing reads of arbitrary files outside of
        the template directory.  The check in :class:`.Template` normalized the
        URI
        using ``os.path``, which on Windows is ``ntpath``; as ``ntpath`` splits
        the
        drive designator off and treats the remainder as rooted, the ``..``
        segments were absorbed before the check could inspect them.
        Normalization
        is now performed with ``posixpath``, which is the same module used by
        :meth:`.TemplateLookup.get_template` to resolve the URI to a file.

--===============4545159839706368931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info -> /usr/lib/python3.14/site-packages/mako-1.4.3.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.4.3.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info moved to /usr/lib/python3.14/site-packages/mako-1.4.3.dist-info

--===============4545159839706368931==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.4.1-1.4.3.patch"

RnJvbSBkYzQ0MTZmYjJlM2I4OWZkMjk0NDIxYTViNDZkMGMzZmUyNGY5YzNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6MTA6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1ha286IHVwZ3JhZGUgMS40LjEgLT4gMS40LjMKCi4uIGNoYW5nZWxvZzo6CiAgICA6
dmVyc2lvbjogMS40LjMKICAgIDpyZWxlYXNlZDogVHVlIFNlcCAyMiAyMDI2CgogICAgLi4gY2hh
bmdlOjoKICAgICAgICA6dGFnczogYnVnLCB0ZXN0cwogICAgICAgIDp0aWNrZXRzOiA0NDEKCiAg
ICAgICAgRml4ZWQgcmVncmVzc2lvbiBjYXVzZWQgaW4gMS40LjIgd2hlcmUgdGVzdHMgYWRkZWQg
dG8gdGhlIHN1aXRlIHdlcmUKICAgICAgICB1bmFibGUgdG8gcnVuIGRpcmVjdGx5IG9uIFdpbmRv
d3MsIGR1ZSB0byBwb3NpeCBtZWNoYW5pY3M6IHRoZSB0ZXN0cwogICAgICAgIGZvcmNlCiAgICAg
ICAgYGBvcy5wYXRoYGAgdG8gYGBwb3NpeHBhdGhgYCwgd2hlcmVhcwogICAgICAgIDptZXRoOmAu
VGVtcGxhdGVMb29rdXAuZ2V0X3RlbXBsYXRlYCBjb252ZXJ0cyB0aGUgY29uZmlndXJlZCBkaXJl
Y3RvcnkKICAgICAgICB1c2luZyBgYG9zLnBhdGguc2VwYGAuICBUaGVzZSB0ZXN0cyBhcmUgbm93
IHNraXBwZWQgb24gdGhhdCBwbGF0Zm9ybSwKICAgICAgICB3aGVyZSB0aGUgdHJhdmVyc2FsIGNo
ZWNrIGlzIGluc3RlYWQgZXhlcmNpc2VkIGFnYWluc3QgYGBudHBhdGhgYAogICAgICAgIG5hdGl2
ZWx5LgoKLi4gY2hhbmdlbG9nOjoKICAgIDp2ZXJzaW9uOiAxLjQuMgogICAgOnJlbGVhc2VkOiBU
dWUgU2VwIDIyIDIwMjYKCiAgICAuLiBjaGFuZ2U6OgogICAgICAgIDp0YWdzOiBidWcsIHRlc3Rz
CiAgICAgICAgOnRpY2tldHM6IDQ0MAoKICAgICAgICBBZGp1c3RlZCB0aGUgdGVzdCBzdWl0ZSB0
byBhY2NvbW1vZGF0ZSBmb3IgYSBjaGFuZ2UgaW4gUHlnbWVudHMgMi4yMS4wCiAgICAgICAgd2hl
cmUgdGhlIGBgSHRtbEZvcm1hdHRlcmBgIG5vdyByZW5kZXJzIGBgImBgIGFuZCBgYCdgYCBjaGFy
YWN0ZXJzCiAgICAgICAgbGl0ZXJhbGx5IHJhdGhlciB0aGFuIGFzIEhUTUwgZW50aXRpZXMsIHdo
aWNoIGNhdXNlZCBmYWlsdXJlcyBpbiB0ZXN0cwogICAgICAgIHRoYXQgYXNzZXJ0IGFnYWluc3Qg
dGhlIHJlbmRlcmVkIG91dHB1dCBvZgogICAgICAgIDpmdW5jOmAuaHRtbF9lcnJvcl90ZW1wbGF0
ZWAuCgogICAgLi4gY2hhbmdlOjoKICAgICAgICA6dGFnczogYnVnLCB0ZW1wbGF0ZQogICAgICAg
IDp0aWNrZXRzOiA0NDEKCiAgICAgICAgRml4ZWQgaXNzdWUgaW4gOmNsYXNzOmAuVGVtcGxhdGVM
b29rdXBgIHdoZXJlIGEgVVJJIGJlZ2lubmluZyB3aXRoIGEKICAgICAgICBkcml2ZQogICAgICAg
IGRlc2lnbmF0b3IgKGUuZy4gYGBDOi8uLi8uLi9zZWNyZXQudHh0YGApIGNvdWxkIGJ5cGFzcyB0
aGUgZGlyZWN0b3J5CiAgICAgICAgdHJhdmVyc2FsIGNoZWNrIG9uIFdpbmRvd3MsIGFsbG93aW5n
IHJlYWRzIG9mIGFyYml0cmFyeSBmaWxlcyBvdXRzaWRlIG9mCiAgICAgICAgdGhlIHRlbXBsYXRl
IGRpcmVjdG9yeS4gIFRoZSBjaGVjayBpbiA6Y2xhc3M6YC5UZW1wbGF0ZWAgbm9ybWFsaXplZCB0
aGUKICAgICAgICBVUkkKICAgICAgICB1c2luZyBgYG9zLnBhdGhgYCwgd2hpY2ggb24gV2luZG93
cyBpcyBgYG50cGF0aGBgOyBhcyBgYG50cGF0aGBgIHNwbGl0cwogICAgICAgIHRoZQogICAgICAg
IGRyaXZlIGRlc2lnbmF0b3Igb2ZmIGFuZCB0cmVhdHMgdGhlIHJlbWFpbmRlciBhcyByb290ZWQs
IHRoZSBgYC4uYGAKICAgICAgICBzZWdtZW50cyB3ZXJlIGFic29yYmVkIGJlZm9yZSB0aGUgY2hl
Y2sgY291bGQgaW5zcGVjdCB0aGVtLgogICAgICAgIE5vcm1hbGl6YXRpb24KICAgICAgICBpcyBu
b3cgcGVyZm9ybWVkIHdpdGggYGBwb3NpeHBhdGhgYCwgd2hpY2ggaXMgdGhlIHNhbWUgbW9kdWxl
IHVzZWQgYnkKICAgICAgICA6bWV0aDpgLlRlbXBsYXRlTG9va3VwLmdldF90ZW1wbGF0ZWAgdG8g
cmVzb2x2ZSB0aGUgVVJJIHRvIGEgZmlsZS4KLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLW1ha29f
MS40LjEuYmIgPT4gcHl0aG9uMy1tYWtvXzEuNC4zLmJifSAgICAgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLW1ha29fMS40LjEuYmIgPT4gcHl0aG9uMy1tYWtvXzEu
NC4zLmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1tYWtvXzEuNC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW1ha29fMS40LjMuYmIKc2ltaWxhcml0eSBpbmRleCA4OCUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS40LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYWtvXzEuNC4zLmJiCmluZGV4IDM2
N2E2NTI3MWYuLjQxYmNjZWM5ZWIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYWtvXzEuNC4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYWtvXzEuNC4zLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hL
U1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1jNzljZWZmODlkZjBhNzJmMjliYjBlMWI2ZjBlMzZl
ZCIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0
aG9uLXB5dGVzdAogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc5MDQ3MTBiNjYyOTk2NDI1YTIx
NjI3NzEwYzQ3NzdjNDUwNTMxNDY5NDJjZjhhN2FlYmY3NTdjOTJiOGMyNyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJjZDY1MzdmZTg4ZDVmZWMzMTVjNTVjMmY4NTI5YmM0Y2U3YTlhMzUyYWQ3ZGIz
ZWVhYTZhNjZlMmRkNGVjMzdhIgogCiBDVkVfUFJPRFVDVCA9ICJtYWtvdGVtcGxhdGVzOm1ha28g
c3FsYWxjaGVteTptYWtvIgogCi0tIAoyLjQ3LjEKCg==

--===============4545159839706368931==--

