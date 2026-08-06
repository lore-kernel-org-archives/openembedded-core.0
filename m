Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AD9C55838
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13882.1785997453278226987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DoHiyEx6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Z11Evq1S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019fd5be721c-9e51c73e-db96-48cf-abea-58c1d5deb2ba-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FXoIZdQsdqDA1w/zvF+lT5+pdzUGElFB4tYUckGW0J4=;
	b=DoHiyEx6mth+ErY5A2QGRNZ/B2/np9kd+1O3dEYUT9C6KYJ9IB6jghOIvvXOTV8z
	dM3a+vvfdqFOI/0f1B40mX5o4sPxDvVBuBhAWe11AyiF5cBlNf7KIDRMxRVVxLBg+ft
	9RcDiAaSLLzxL4tYVNSNtenFtq1hOF5jto6fjju4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FXoIZdQsdqDA1w/zvF+lT5+pdzUGElFB4tYUckGW0J4=;
	b=Z11Evq1SniNCpDHjfZSsATplqcCFw50GD2lJkfiBj1E8+aCq/Yn4yO5GsLUIqNym
	FvcIZp4B7yQ2YDruNLeCePvz81qLata43h5FVowiwW8c2cg8AafnzNlr0sNz4F9/KdD
	avd93zyRRZGHATucs7BB75+t+OozseO+SldlcwJQ=
Content-Type: multipart/mixed; boundary="===============4678114893128588396=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-mako: upgrading to 1.4.1 SUCCEEDED
Message-ID: <0101019fd5be721c-9e51c73e-db96-48cf-abea-58c1d5deb2ba-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:15 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242904

--===============4678114893128588396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-mako* to *1.4.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-mako-upgrade-1.3.12-1.4.1.patch
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
From 6005c125b43753b427b7d10e9ed099a81be5fb19 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 6 Aug 2026 05:41:45 +0000
Subject: [PATCH] python3-mako: upgrade 1.3.12 -> 1.4.1

Source: doc/build/changelog.rst

1.4
===

.. changelog::
    :version: 1.4.1
    :released: Wed Aug 5 2026

    .. change::
        :tags: bug, installation
        :tickets: 438

        Fixed issue in the 1.4.0 packaging where the repository's internal
        ``tools/`` directory was detected by setuptools package discovery and
        installed as a top-level ``tools`` package into site-packages, shadowing
        unrelated ``tools`` packages belonging to other applications.  Package
        discovery is now limited to the ``mako`` package explicitly.

.. changelog::
    :version: 1.4.0
    :released: Tue Aug 4 2026

    .. change::
        :tags: bug, ext
        :tickets: 393

        The minimum Lingua version supported by :class:`.LinguaMakoExtractor` is
        now 4.16.  The test suite had continued to pin Lingua below 4 long after
        the extractor itself was repaired to work with Lingua 4 in version 1.2.0,
        with the result that the plugin was no longer covered by tests at all; the
        pinned version additionally imports ``pkg_resources`` at startup, which is
        not present in current setuptools releases and left the package
        unimportable.  Lingua 4.16 resolves entry points using
        ``importlib.metadata``, so no deprecated ``pkg_resources`` usage remains.

    .. change::
        :tags: bug, exceptions
        :tickets: 437

        Fixed issue where formatting a traceback for an exception raised inside a
        template compiled from a string would emit ``DeprecationWarning: Module
        globals is missing a __spec__.loader`` on Python 3.15.  Modules for such
        templates were created without a module spec, which Python's
        :mod:`linecache` module consults for every frame while a traceback is
        being built; the warning was raised from within traceback formatting
        itself, disrupting the error report for applications that configure
        warnings as errors.  These modules are now given a spec with a loader that
        provides the generated module source, which additionally allows the
        generated source lines to be displayed in tracebacks produced by the
        standard library where previously no source was available.

    .. change::
        :tags: changed, examples

        The ``examples/bench`` folder has been removed as it used mostly
        long-obsolete template engines.  The ``examples/wsgi/run_wsgi.py`` example
        has been updated to remove the use of the removed-in-Python-3.13 ``cgi``
        module, and to be runnable as a module from the project root.

    .. change::
        :tags: bug, exceptions
        :tickets: 430, 245, 428

        A series of fixes involving syntax warnings and exceptions found
        during template lexing / compilation:

        * Warnings raised while a template is compiled, which in practice means
          ``SyntaxWarning``, now report the filename and line number of the
          template rather than a line within the

[Changelog truncated as it exceeds 3000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 ...3-mako_1.3.12.bb => python3-mako_1.4.1.bb} | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-mako_1.3.12.bb => python3-mako_1.4.1.bb} (39%)

diff --git a/meta/recipes-devtools/python/python3-mako_1.3.12.bb b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
similarity index 39%
rename from meta/recipes-devtools/python/python3-mako_1.3.12.bb
rename to meta/recipes-devtools/python/python3-mako_1.4.1.bb
index b2c1a8dad8..a47af2d724 100644
--- a/meta/recipes-devtools/python/python3-mako_1.3.12.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
@@ -1,14 +1,33 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -1,4 +1,4 @@
+# -Copyright 2006-2025 the Mako authors and contributors <see AUTHORS file>.
+# +Copyright 2006-2026 the Mako authors and contributors <see AUTHORS file>.
+#  
+#  Permission is hereby granted, free of charge, to any person obtaining a copy of
+#  this software and associated documentation files (the "Software"), to deal in
+# 
+#
+
 SUMMARY = "Templating library for Python"
 HOMEPAGE = "http://www.makotemplates.org/"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=73026b50800163bd3c75cfdc121d9eb5"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c79ceff89df0a72f29bb0e1b6f0e36ed"
 
 PYPI_PACKAGE = "mako"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-SRC_URI[sha256sum] = "9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a"
+SRC_URI[sha256sum] = "d7904710b662996425a21627710c4777c45053146942cf8a7aebf757c92b8c27"
 
 RDEPENDS:${PN} = "python3-html \
                   python3-markupsafe \
-- 
2.47.1


--===============4678114893128588396==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-mako-upgrade-1.3.12-1.4.1.patch"

RnJvbSA2MDA1YzEyNWI0Mzc1M2I0MjdiN2QxMGU5ZWQwOTlhODFiZTVmYjE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNiBBdWcgMjAyNiAwNTo0MTo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFrbzogdXBncmFkZSAxLjMuMTIgLT4gMS40LjEKClNvdXJjZTogZG9jL2J1aWxkL2No
YW5nZWxvZy5yc3QKCjEuNAo9PT0KCi4uIGNoYW5nZWxvZzo6CiAgICA6dmVyc2lvbjogMS40LjEK
ICAgIDpyZWxlYXNlZDogV2VkIEF1ZyA1IDIwMjYKCiAgICAuLiBjaGFuZ2U6OgogICAgICAgIDp0
YWdzOiBidWcsIGluc3RhbGxhdGlvbgogICAgICAgIDp0aWNrZXRzOiA0MzgKCiAgICAgICAgRml4
ZWQgaXNzdWUgaW4gdGhlIDEuNC4wIHBhY2thZ2luZyB3aGVyZSB0aGUgcmVwb3NpdG9yeSdzIGlu
dGVybmFsCiAgICAgICAgYGB0b29scy9gYCBkaXJlY3Rvcnkgd2FzIGRldGVjdGVkIGJ5IHNldHVw
dG9vbHMgcGFja2FnZSBkaXNjb3ZlcnkgYW5kCiAgICAgICAgaW5zdGFsbGVkIGFzIGEgdG9wLWxl
dmVsIGBgdG9vbHNgYCBwYWNrYWdlIGludG8gc2l0ZS1wYWNrYWdlcywgc2hhZG93aW5nCiAgICAg
ICAgdW5yZWxhdGVkIGBgdG9vbHNgYCBwYWNrYWdlcyBiZWxvbmdpbmcgdG8gb3RoZXIgYXBwbGlj
YXRpb25zLiAgUGFja2FnZQogICAgICAgIGRpc2NvdmVyeSBpcyBub3cgbGltaXRlZCB0byB0aGUg
YGBtYWtvYGAgcGFja2FnZSBleHBsaWNpdGx5LgoKLi4gY2hhbmdlbG9nOjoKICAgIDp2ZXJzaW9u
OiAxLjQuMAogICAgOnJlbGVhc2VkOiBUdWUgQXVnIDQgMjAyNgoKICAgIC4uIGNoYW5nZTo6CiAg
ICAgICAgOnRhZ3M6IGJ1ZywgZXh0CiAgICAgICAgOnRpY2tldHM6IDM5MwoKICAgICAgICBUaGUg
bWluaW11bSBMaW5ndWEgdmVyc2lvbiBzdXBwb3J0ZWQgYnkgOmNsYXNzOmAuTGluZ3VhTWFrb0V4
dHJhY3RvcmAgaXMKICAgICAgICBub3cgNC4xNi4gIFRoZSB0ZXN0IHN1aXRlIGhhZCBjb250aW51
ZWQgdG8gcGluIExpbmd1YSBiZWxvdyA0IGxvbmcgYWZ0ZXIKICAgICAgICB0aGUgZXh0cmFjdG9y
IGl0c2VsZiB3YXMgcmVwYWlyZWQgdG8gd29yayB3aXRoIExpbmd1YSA0IGluIHZlcnNpb24gMS4y
LjAsCiAgICAgICAgd2l0aCB0aGUgcmVzdWx0IHRoYXQgdGhlIHBsdWdpbiB3YXMgbm8gbG9uZ2Vy
IGNvdmVyZWQgYnkgdGVzdHMgYXQgYWxsOyB0aGUKICAgICAgICBwaW5uZWQgdmVyc2lvbiBhZGRp
dGlvbmFsbHkgaW1wb3J0cyBgYHBrZ19yZXNvdXJjZXNgYCBhdCBzdGFydHVwLCB3aGljaCBpcwog
ICAgICAgIG5vdCBwcmVzZW50IGluIGN1cnJlbnQgc2V0dXB0b29scyByZWxlYXNlcyBhbmQgbGVm
dCB0aGUgcGFja2FnZQogICAgICAgIHVuaW1wb3J0YWJsZS4gIExpbmd1YSA0LjE2IHJlc29sdmVz
IGVudHJ5IHBvaW50cyB1c2luZwogICAgICAgIGBgaW1wb3J0bGliLm1ldGFkYXRhYGAsIHNvIG5v
IGRlcHJlY2F0ZWQgYGBwa2dfcmVzb3VyY2VzYGAgdXNhZ2UgcmVtYWlucy4KCiAgICAuLiBjaGFu
Z2U6OgogICAgICAgIDp0YWdzOiBidWcsIGV4Y2VwdGlvbnMKICAgICAgICA6dGlja2V0czogNDM3
CgogICAgICAgIEZpeGVkIGlzc3VlIHdoZXJlIGZvcm1hdHRpbmcgYSB0cmFjZWJhY2sgZm9yIGFu
IGV4Y2VwdGlvbiByYWlzZWQgaW5zaWRlIGEKICAgICAgICB0ZW1wbGF0ZSBjb21waWxlZCBmcm9t
IGEgc3RyaW5nIHdvdWxkIGVtaXQgYGBEZXByZWNhdGlvbldhcm5pbmc6IE1vZHVsZQogICAgICAg
IGdsb2JhbHMgaXMgbWlzc2luZyBhIF9fc3BlY19fLmxvYWRlcmBgIG9uIFB5dGhvbiAzLjE1LiAg
TW9kdWxlcyBmb3Igc3VjaAogICAgICAgIHRlbXBsYXRlcyB3ZXJlIGNyZWF0ZWQgd2l0aG91dCBh
IG1vZHVsZSBzcGVjLCB3aGljaCBQeXRob24ncwogICAgICAgIDptb2Q6YGxpbmVjYWNoZWAgbW9k
dWxlIGNvbnN1bHRzIGZvciBldmVyeSBmcmFtZSB3aGlsZSBhIHRyYWNlYmFjayBpcwogICAgICAg
IGJlaW5nIGJ1aWx0OyB0aGUgd2FybmluZyB3YXMgcmFpc2VkIGZyb20gd2l0aGluIHRyYWNlYmFj
ayBmb3JtYXR0aW5nCiAgICAgICAgaXRzZWxmLCBkaXNydXB0aW5nIHRoZSBlcnJvciByZXBvcnQg
Zm9yIGFwcGxpY2F0aW9ucyB0aGF0IGNvbmZpZ3VyZQogICAgICAgIHdhcm5pbmdzIGFzIGVycm9y
cy4gIFRoZXNlIG1vZHVsZXMgYXJlIG5vdyBnaXZlbiBhIHNwZWMgd2l0aCBhIGxvYWRlciB0aGF0
CiAgICAgICAgcHJvdmlkZXMgdGhlIGdlbmVyYXRlZCBtb2R1bGUgc291cmNlLCB3aGljaCBhZGRp
dGlvbmFsbHkgYWxsb3dzIHRoZQogICAgICAgIGdlbmVyYXRlZCBzb3VyY2UgbGluZXMgdG8gYmUg
ZGlzcGxheWVkIGluIHRyYWNlYmFja3MgcHJvZHVjZWQgYnkgdGhlCiAgICAgICAgc3RhbmRhcmQg
bGlicmFyeSB3aGVyZSBwcmV2aW91c2x5IG5vIHNvdXJjZSB3YXMgYXZhaWxhYmxlLgoKICAgIC4u
IGNoYW5nZTo6CiAgICAgICAgOnRhZ3M6IGNoYW5nZWQsIGV4YW1wbGVzCgogICAgICAgIFRoZSBg
YGV4YW1wbGVzL2JlbmNoYGAgZm9sZGVyIGhhcyBiZWVuIHJlbW92ZWQgYXMgaXQgdXNlZCBtb3N0
bHkKICAgICAgICBsb25nLW9ic29sZXRlIHRlbXBsYXRlIGVuZ2luZXMuICBUaGUgYGBleGFtcGxl
cy93c2dpL3J1bl93c2dpLnB5YGAgZXhhbXBsZQogICAgICAgIGhhcyBiZWVuIHVwZGF0ZWQgdG8g
cmVtb3ZlIHRoZSB1c2Ugb2YgdGhlIHJlbW92ZWQtaW4tUHl0aG9uLTMuMTMgYGBjZ2lgYAogICAg
ICAgIG1vZHVsZSwgYW5kIHRvIGJlIHJ1bm5hYmxlIGFzIGEgbW9kdWxlIGZyb20gdGhlIHByb2pl
Y3Qgcm9vdC4KCiAgICAuLiBjaGFuZ2U6OgogICAgICAgIDp0YWdzOiBidWcsIGV4Y2VwdGlvbnMK
ICAgICAgICA6dGlja2V0czogNDMwLCAyNDUsIDQyOAoKICAgICAgICBBIHNlcmllcyBvZiBmaXhl
cyBpbnZvbHZpbmcgc3ludGF4IHdhcm5pbmdzIGFuZCBleGNlcHRpb25zIGZvdW5kCiAgICAgICAg
ZHVyaW5nIHRlbXBsYXRlIGxleGluZyAvIGNvbXBpbGF0aW9uOgoKICAgICAgICAqIFdhcm5pbmdz
IHJhaXNlZCB3aGlsZSBhIHRlbXBsYXRlIGlzIGNvbXBpbGVkLCB3aGljaCBpbiBwcmFjdGljZSBt
ZWFucwogICAgICAgICAgYGBTeW50YXhXYXJuaW5nYGAsIG5vdyByZXBvcnQgdGhlIGZpbGVuYW1l
IGFuZCBsaW5lIG51bWJlciBvZiB0aGUKICAgICAgICAgIHRlbXBsYXRlIHJhdGhlciB0aGFuIGEg
bGluZSB3aXRoaW4gdGhlCgpbQ2hhbmdlbG9nIHRydW5jYXRlZCBhcyBpdCBleGNlZWRzIDMwMDAg
Y2hhcmFjdGVyczsKdGhlIGZ1bGwgY2hhbmdlbG9nIGNhbiBiZSBmb3VuZCBpbiBhbiBhdHRhY2ht
ZW50IHRvIHRoZSBBVUggZW1haWxdCi0tLQogLi4uMy1tYWtvXzEuMy4xMi5iYiA9PiBweXRob24z
LW1ha29fMS40LjEuYmJ9IHwgMjMgKysrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQs
IDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYWtvXzEuMy4xMi5iYiA9PiBweXRob24zLW1ha29fMS40
LjEuYmJ9ICgzOSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLW1ha29fMS4zLjEyLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLW1ha29fMS40LjEuYmIKc2ltaWxhcml0eSBpbmRleCAzOSUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1ha29fMS4zLjEyLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFrb18xLjQuMS5iYgppbmRleCBi
MmMxYThkYWQ4Li5hNDdhZjJkNzI0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWFrb18xLjMuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW1ha29fMS40LjEuYmIKQEAgLTEsMTQgKzEsMzMgQEAKKyMgRklYTUU6
IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9v
bCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRo
ZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNF
TlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUg
Y29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdM
aWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5n
ZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBMSUNFTlNFCisjIEBAIC0xLDQgKzEsNCBAQAor
IyAtQ29weXJpZ2h0IDIwMDYtMjAyNSB0aGUgTWFrbyBhdXRob3JzIGFuZCBjb250cmlidXRvcnMg
PHNlZSBBVVRIT1JTIGZpbGU+LgorIyArQ29weXJpZ2h0IDIwMDYtMjAyNiB0aGUgTWFrbyBhdXRo
b3JzIGFuZCBjb250cmlidXRvcnMgPHNlZSBBVVRIT1JTIGZpbGU+LgorIyAgCisjICBQZXJtaXNz
aW9uIGlzIGhlcmVieSBncmFudGVkLCBmcmVlIG9mIGNoYXJnZSwgdG8gYW55IHBlcnNvbiBvYnRh
aW5pbmcgYSBjb3B5IG9mCisjICB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lhdGVkIGRvY3VtZW50
YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAKKyMKKwogU1VNTUFS
WSA9ICJUZW1wbGF0aW5nIGxpYnJhcnkgZm9yIFB5dGhvbiIKIEhPTUVQQUdFID0gImh0dHA6Ly93
d3cubWFrb3RlbXBsYXRlcy5vcmcvIgogU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNF
ID0gIk1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTczMDI2YjUw
ODAwMTYzYmQzYzc1Y2ZkYzEyMWQ5ZWI1IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElD
RU5TRTttZDU9Yzc5Y2VmZjg5ZGYwYTcyZjI5YmIwZTFiNmYwZTM2ZWQiCiAKIFBZUElfUEFDS0FH
RSA9ICJtYWtvIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YSBw
dGVzdC1weXRob24tcHl0ZXN0CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5Zjc3OGU5MzI4OWJk
NDEwYmIzNWRhYWRlYjRmYzY2ZDk1YTc0NmYwYjc1Nzc3Yjk0MjA4OGI3ZmQ3YWY1NTBhIgorU1JD
X1VSSVtzaGEyNTZzdW1dID0gImQ3OTA0NzEwYjY2Mjk5NjQyNWEyMTYyNzcxMGM0Nzc3YzQ1MDUz
MTQ2OTQyY2Y4YTdhZWJmNzU3YzkyYjhjMjciCiAKIFJERVBFTkRTOiR7UE59ID0gInB5dGhvbjMt
aHRtbCBcCiAgICAgICAgICAgICAgICAgICBweXRob24zLW1hcmt1cHNhZmUgXAotLSAKMi40Ny4x
Cgo=

--===============4678114893128588396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info -> /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/WHEEL was removed

--===============4678114893128588396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-mako: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/mako/mako-1.3.12.tar.gz;downloadfilename=mako-1.3.12.tar.gz" to "https://files.pythonhosted.org/packages/source/m/mako/mako-1.4.1.tar.gz;downloadfilename=mako-1.4.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-mako: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dbg: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-dev: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-doc: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-locale: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PKGSIZE changed from 355474 to 365339 (+3%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-ptest: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-src: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako-staticdev: PV changed from "1.3.12" to "1.4.1"
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGV changed from 1.3.12 [default] to 1.4.1 [default]
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: FILELIST: directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info -> /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses -> /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PKGSIZE changed from 648756 to 652895 (+1%)
packages/x86-64-v3-poky-linux/python3-mako/python3-mako: PV changed from "1.3.12" to "1.4.1"
Changes to packages/x86-64-v3-poky-linux/python3-mako (sysroot):
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/entry_points.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/licenses/LICENSE was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/top_level.txt was added
  /usr/lib/python3.14/site-packages/mako-1.4.1.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/entry_points.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/licenses/LICENSE was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/top_level.txt was removed
  /usr/lib/python3.14/site-packages/mako-1.3.12.dist-info/WHEEL was removed

--===============4678114893128588396==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-mako-changelog.txt"

Changelog for python3-mako: 1.3.12 -> 1.4.1
Source: doc/build/changelog.rst

1.4
===

.. changelog::
    :version: 1.4.1
    :released: Wed Aug 5 2026

    .. change::
        :tags: bug, installation
        :tickets: 438

        Fixed issue in the 1.4.0 packaging where the repository's internal
        ``tools/`` directory was detected by setuptools package discovery and
        installed as a top-level ``tools`` package into site-packages, shadowing
        unrelated ``tools`` packages belonging to other applications.  Package
        discovery is now limited to the ``mako`` package explicitly.

.. changelog::
    :version: 1.4.0
    :released: Tue Aug 4 2026

    .. change::
        :tags: bug, ext
        :tickets: 393

        The minimum Lingua version supported by :class:`.LinguaMakoExtractor` is
        now 4.16.  The test suite had continued to pin Lingua below 4 long after
        the extractor itself was repaired to work with Lingua 4 in version 1.2.0,
        with the result that the plugin was no longer covered by tests at all; the
        pinned version additionally imports ``pkg_resources`` at startup, which is
        not present in current setuptools releases and left the package
        unimportable.  Lingua 4.16 resolves entry points using
        ``importlib.metadata``, so no deprecated ``pkg_resources`` usage remains.

    .. change::
        :tags: bug, exceptions
        :tickets: 437

        Fixed issue where formatting a traceback for an exception raised inside a
        template compiled from a string would emit ``DeprecationWarning: Module
        globals is missing a __spec__.loader`` on Python 3.15.  Modules for such
        templates were created without a module spec, which Python's
        :mod:`linecache` module consults for every frame while a traceback is
        being built; the warning was raised from within traceback formatting
        itself, disrupting the error report for applications that configure
        warnings as errors.  These modules are now given a spec with a loader that
        provides the generated module source, which additionally allows the
        generated source lines to be displayed in tracebacks produced by the
        standard library where previously no source was available.

    .. change::
        :tags: changed, examples

        The ``examples/bench`` folder has been removed as it used mostly
        long-obsolete template engines.  The ``examples/wsgi/run_wsgi.py`` example
        has been updated to remove the use of the removed-in-Python-3.13 ``cgi``
        module, and to be runnable as a module from the project root.

    .. change::
        :tags: bug, exceptions
        :tickets: 430, 245, 428

        A series of fixes involving syntax warnings and exceptions found
        during template lexing / compilation:

        * Warnings raised while a template is compiled, which in practice means
          ``SyntaxWarning``, now report the filename and line number of the
          template rather than a line within the generated module, and are no
          longer reported twice.  This applies equally to templates compiled from a
          string, from a file, and to a module file in a
          :paramref:`.Template.module_directory`, as does a warning raised while
          the module level code of a ``<%! %>`` block runs.  Warnings raised while
          a template renders continue to report the location within the generated
          module.

          To do this, Mako replaces ``warnings.showwarning`` while a template is
          compiled.  As that name is global to the process, an unrelated warning
          displayed by another thread during that window may also be passed through
          Mako's hook, which shows any warning it does not recognize unchanged.
          (:ticket:`430`)

        * The ``SyntaxException`` raised for a syntax error in Python code spanning
          several lines of a template, such as that within a ``<% %>`` or ``<%! %>``
          block, is now reported against the line the error is on, rather than
          against the line on which the block begins.  The line reported for code
          that occupies a single line, such as an expression or a control line, is
          unchanged. (:ticket:`245`)

        * The ``SyntaxException`` raised for a tag or expression that is never
          closed is now reported against the line the construct begins on, rather
          than the point at which the search for the closing token gave up, which
          for an unclosed construct is the end of the template.  The message of the
          exception is amended to indicate that the position given is where the
          unterminated construct begins. (:ticket:`428`)

    .. change::
        :tags: changed, installation

        Minimum MarkupSafe dependency version bumped from 0.9.2 to 2.0.

    .. change::
        :tags: changed, tests

        The test suite now runs via nox.  The old tox.ini remains however nox will
        be the only system that's maintained.

    .. change::
        :tags: changed, installation

        Project metadata has been migrated to :pep:`621` ``pyproject.toml``-based
        configuration.  ``setup.cfg`` remains only for the ``[mako_testing]``
        section used by Mako's own test suite.   The build requirements
        now set the minimum setuptools version at 77.0.0 in order to build Mako
        from source.

    .. change::
        :tags: changed, installation

        Minimum Python version is now 3.10.  Mako 1.4.0 has been tested up through
        Python 3.15.0b4.

--===============4678114893128588396==--

