Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27AC4CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:03:22 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15770.1792130598954709477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TGu3Eb5S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jp4/1IKR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1434ec4bd-05ca3c08-423d-4f34-b5e6-fe8e44feaa64-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792130598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hD4qmXXTHADwXY5D6wrm1OYV1Qurj14eZTwKvB2CGzY=;
	b=TGu3Eb5SMqlS5HDdBSuxBVLB6SVRrXuoPqm9CS380/XIxkM1YLu2Q3BQgZSGkbUf
	unpNp/SVbomHv2v7fXimL0Kp41VRiEylW+EomddnfnXZnqoxre9glIPd5GgNOxcDDqm
	GIj/KInuBgJFz2kZCzRQy6jPo/kzp9vjROo8QVSM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792130598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hD4qmXXTHADwXY5D6wrm1OYV1Qurj14eZTwKvB2CGzY=;
	b=jp4/1IKROTTB+YtlX8xKEZa24qbq1hTRCxjisnJR0f1ZoHAJhWXXmRy2hLeeLdHi
	Og48qzY59iB+yugRNLugMgvagEpEXjUNr3Z0AAydJnsiO4tgB5nsk3CKvvrDmO2bUuE
	qz12+iyQ4vsVkNQ9cc7Gd4IiLnSdSXLBOZhlz2jw=
Content-Type: multipart/mixed; boundary="===============7795706715045112137=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pluggy: upgrading to 1.7.0 SUCCEEDED
Message-ID: <010101a1434ec4bd-05ca3c08-423d-4f34-b5e6-fe8e44feaa64-000000@us-west-2.amazonses.com>
Date: Fri, 16 Oct 2026 06:03:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247963

--===============7795706715045112137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pluggy* to *1.7.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pluggy-upgrade-1.6.0-1.7.0.patch
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
From 4627cc9f626c65bd9937cd1f59ec5e51797eee73 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Oct 2026 05:44:36 +0000
Subject: [PATCH] python3-pluggy: upgrade 1.6.0 -> 1.7.0

pluggy 1.7.0 (2026-10-14)
=========================

Deprecations and Removals
-------------------------

- `#632 < >`_: Hookspec methods defined without ``self`` as the first parameter
  now emit a :class:`DeprecationWarning`. Add ``self`` as the first parameter or
  use ``@staticmethod``.

Features
--------

- `#170 < >`_: Hookspecs can now declare default values for arguments, using the
  usual ``def myhook(myarg="default")`` syntax.
  This is mainly a backward compatibility feature, to allow a hookspec to add
  new parameters to an existing hook without breaking existing *callers*.
  See :ref:`hookspec_arg_default` for details.

- `#729 < >`_: Tracing now adds detail where ``str()`` is ambiguous: empty
  strings and strings containing
  whitespace are quoted, and enums and paths show their ``repr()``.

  A value spanning several lines is now displayed as a block instead of running
  into the
  surrounding trace.

Bug Fixes
---------

- `#629 < >`_: Fix hooks failing to register on Python 3.14+ when type
  annotations use forward references.

- `#315 < >`_: Source archives created by ``git archive`` (including GitHub's
  "Source code" downloads) now carry version information, so building pluggy
  from them no longer fails with a missing version.

- `#442 < >`_: With the addition of default values for hookspec arguments, we
  also changed the precedence of default values for *hookimpl* arguments.
  Previously, if a hookimpl function declared a default for an argument, it was
  always used, even if the *hook call* passed an explicit value.
  Now the precedence is changed to: hook call passed value > hookspec default
  value > hookimpl default value.
  See :ref:`hookimpl_arg_defaults`.

- `#701 < >`_: Hookimpls and hookspecs are now discovered via
  :func:`inspect.getattr_static`, so
  properties, ``cached_property`` and other descriptors are no longer executed
  while
  scanning a plugin. Hooks declared through such a descriptor are not supported.

  As a side effect, ``@hookimpl``/``@hookspec`` applied *above* ``@classmethod``
  or
  ``@staticmethod`` is now picked up; previously the marker sat on the wrapper
  where
  ``getattr()`` never saw it. Callables stored directly on a plugin instance --
  in its
  ``__dict__`` or in a ``__slots__`` slot -- keep being called exactly as
  ``getattr()``
  returned them, i.e. without an implicit ``self``.

- `#431 < >`_: Fix ``HookCaller._remove_plugin()`` to remove all hook
  implementations for a plugin in a single call, instead of only the first one.
  Also fix ``PluginManager.get_hookcallers()`` to not return duplicate
  ``HookCaller`` entries when a plugin has multiple implementations on the same
  hook (e.g. via ``specname``).

- `#695 < >`_: Fixed :func:`~pluggy.PluginManager.subset_hook_caller()` not
  excluding removed plugins which use :func:`@hookiml(specname="...")
  <pluggy.HookimplMarker>`.

- `#424 < >`_: Tracing no longer breaks hook execution when a traced object has
  a broken ``__repr__``
  or ``__str__``. Such a value is now rendered as
  ``<[RuntimeError(...) raised in str()] Broken object at 0x...>``, in the same
  style
  pytest uses for unpresentable objects, instead of propagating the exception
  out of the
  hook call.

- `#681 < >`_: Tracing no longer crashes with ``UnicodeEncodeError`` when a hook
  argument or return
  value contains lone surrogates; they are escaped with ``backslashreplace``
  before the
  message reaches the writer. Trace output is otherwise unchanged.

- `#727 < >`_: Fix the warning for hookspec arguments missing from a hook call
  being attributed to pluggy's own frame instead of to the code making the call.
  This affected ``HookCaller.__call__``, ``call_historic`` and ``call_extra``.

- `#731 < >`_: :func:`PluginManager.register(None)
  <pluggy.PluginManager.register>` is now ignored instead of having some weird
  behaviors.

- `#733 < >`_: :meth:`PluginManager.register() <pluggy.PluginManager.register>`
  now validates all hook implementations of a plugin before registering any of
  them, so a plugin that fails validation no longer stays partially registered.

- `#755 < >`_: Skip already registered entry-point plugins without evaluating
  the plugin object's truthiness.

- `#757 < >`_: Restore the project URLs in the package metadata, which were lost
  in pluggy 1.6.0 when the packaging configuration moved to ``pyproject.toml``.
  Links to the documentation, changelog, issue tracker and funding page were
  added as well.

- `#759 < >`_: :meth:`PluginManager.unregister()
  <pluggy.PluginManager.unregister>` now raises :exc:`ValueError` when both
  ``plugin`` and ``name`` are given but refer to different plugins, instead of
  removing one plugin's hook implementations and another plugin's registry
  entry.
  It also fully unregisters plugin objects that are falsy (e.g. define
  ``__len__`` returning ``0``); previously their name stayed in the registry.

- `#186 < >`_: Fixed broken external documentation references in

[Changelog truncated as it exceeds 5000 characters;
the full changelog can be found in an attachment to the AUH email]
---
 .../python/{python3-pluggy_1.6.0.bb => python3-pluggy_1.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pluggy_1.6.0.bb => python3-pluggy_1.7.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb b/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
rename to meta/recipes-devtools/python/python3-pluggy_1.7.0.bb
index b8e4bbc75b..55d6383fa1 100644
--- a/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pluggy_1.7.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pytest-dev/pluggy"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1c8206d16fd5cc02fa9b0bb98955e5c2"
 
-SRC_URI[sha256sum] = "7dcc130b76258d33b90f61b658791dede3486c3e6bfb003ee5c9bfb396dd22f3"
+SRC_URI[sha256sum] = "d1eaa46ebb595891b860ab086b4d09c8588af65ebd4361b8e8f4bb8920b90ba8"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============7795706715045112137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-ptest: PKGSIZE changed from 68167 to 115136 (+69%)
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy: PKGSIZE changed from 149335 to 185103 (+24%)
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info -> /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info, removed "/usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/_version.py", added "/usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/_config.py /usr/lib/python3.14/site-packages/pluggy/_caller.py /usr/lib/python3.14/site-packages/pluggy/_decorators.py /usr/lib/python3.14/site-packages/pluggy/_compat.py /usr/lib/python3.14/site-packages/pluggy/_execu
 tion.py /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/_impl.py /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pluggy (sysroot):
  /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info
  /usr/lib/python3.14/site-packages/pluggy/_caller.py was added
  /usr/lib/python3.14/site-packages/pluggy/_compat.py was added
  /usr/lib/python3.14/site-packages/pluggy/_config.py was added
  /usr/lib/python3.14/site-packages/pluggy/_decorators.py was added
  /usr/lib/python3.14/site-packages/pluggy/_execution.py was added
  /usr/lib/python3.14/site-packages/pluggy/_impl.py was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/_version.py was removed
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info
  /usr/lib/python3.14/site-packages/pluggy/_caller.py was added
  /usr/lib/python3.14/site-packages/pluggy/_compat.py was added
  /usr/lib/python3.14/site-packages/pluggy/_config.py was added
  /usr/lib/python3.14/site-packages/pluggy/_decorators.py was added
  /usr/lib/python3.14/site-packages/pluggy/_execution.py was added
  /usr/lib/python3.14/site-packages/pluggy/_impl.py was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/_version.py was removed

--===============7795706715045112137==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pluggy-upgrade-1.6.0-1.7.0.patch"

RnJvbSA0NjI3Y2M5ZjYyNmM2NWJkOTkzN2NkMWY1OWVjNWU1MTc5N2VlZTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjYgMDU6NDQ6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBsdWdneTogdXBncmFkZSAxLjYuMCAtPiAxLjcuMAoKcGx1Z2d5IDEuNy4wICgyMDI2
LTEwLTE0KQo9PT09PT09PT09PT09PT09PT09PT09PT09CgpEZXByZWNhdGlvbnMgYW5kIFJlbW92
YWxzCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KCi0gYCM2MzIgPCA+YF86IEhvb2tzcGVjIG1l
dGhvZHMgZGVmaW5lZCB3aXRob3V0IGBgc2VsZmBgIGFzIHRoZSBmaXJzdCBwYXJhbWV0ZXIKICBu
b3cgZW1pdCBhIDpjbGFzczpgRGVwcmVjYXRpb25XYXJuaW5nYC4gQWRkIGBgc2VsZmBgIGFzIHRo
ZSBmaXJzdCBwYXJhbWV0ZXIgb3IKICB1c2UgYGBAc3RhdGljbWV0aG9kYGAuCgpGZWF0dXJlcwot
LS0tLS0tLQoKLSBgIzE3MCA8ID5gXzogSG9va3NwZWNzIGNhbiBub3cgZGVjbGFyZSBkZWZhdWx0
IHZhbHVlcyBmb3IgYXJndW1lbnRzLCB1c2luZyB0aGUKICB1c3VhbCBgYGRlZiBteWhvb2sobXlh
cmc9ImRlZmF1bHQiKWBgIHN5bnRheC4KICBUaGlzIGlzIG1haW5seSBhIGJhY2t3YXJkIGNvbXBh
dGliaWxpdHkgZmVhdHVyZSwgdG8gYWxsb3cgYSBob29rc3BlYyB0byBhZGQKICBuZXcgcGFyYW1l
dGVycyB0byBhbiBleGlzdGluZyBob29rIHdpdGhvdXQgYnJlYWtpbmcgZXhpc3RpbmcgKmNhbGxl
cnMqLgogIFNlZSA6cmVmOmBob29rc3BlY19hcmdfZGVmYXVsdGAgZm9yIGRldGFpbHMuCgotIGAj
NzI5IDwgPmBfOiBUcmFjaW5nIG5vdyBhZGRzIGRldGFpbCB3aGVyZSBgYHN0cigpYGAgaXMgYW1i
aWd1b3VzOiBlbXB0eQogIHN0cmluZ3MgYW5kIHN0cmluZ3MgY29udGFpbmluZwogIHdoaXRlc3Bh
Y2UgYXJlIHF1b3RlZCwgYW5kIGVudW1zIGFuZCBwYXRocyBzaG93IHRoZWlyIGBgcmVwcigpYGAu
CgogIEEgdmFsdWUgc3Bhbm5pbmcgc2V2ZXJhbCBsaW5lcyBpcyBub3cgZGlzcGxheWVkIGFzIGEg
YmxvY2sgaW5zdGVhZCBvZiBydW5uaW5nCiAgaW50byB0aGUKICBzdXJyb3VuZGluZyB0cmFjZS4K
CkJ1ZyBGaXhlcwotLS0tLS0tLS0KCi0gYCM2MjkgPCA+YF86IEZpeCBob29rcyBmYWlsaW5nIHRv
IHJlZ2lzdGVyIG9uIFB5dGhvbiAzLjE0KyB3aGVuIHR5cGUKICBhbm5vdGF0aW9ucyB1c2UgZm9y
d2FyZCByZWZlcmVuY2VzLgoKLSBgIzMxNSA8ID5gXzogU291cmNlIGFyY2hpdmVzIGNyZWF0ZWQg
YnkgYGBnaXQgYXJjaGl2ZWBgIChpbmNsdWRpbmcgR2l0SHViJ3MKICAiU291cmNlIGNvZGUiIGRv
d25sb2Fkcykgbm93IGNhcnJ5IHZlcnNpb24gaW5mb3JtYXRpb24sIHNvIGJ1aWxkaW5nIHBsdWdn
eQogIGZyb20gdGhlbSBubyBsb25nZXIgZmFpbHMgd2l0aCBhIG1pc3NpbmcgdmVyc2lvbi4KCi0g
YCM0NDIgPCA+YF86IFdpdGggdGhlIGFkZGl0aW9uIG9mIGRlZmF1bHQgdmFsdWVzIGZvciBob29r
c3BlYyBhcmd1bWVudHMsIHdlCiAgYWxzbyBjaGFuZ2VkIHRoZSBwcmVjZWRlbmNlIG9mIGRlZmF1
bHQgdmFsdWVzIGZvciAqaG9va2ltcGwqIGFyZ3VtZW50cy4KICBQcmV2aW91c2x5LCBpZiBhIGhv
b2tpbXBsIGZ1bmN0aW9uIGRlY2xhcmVkIGEgZGVmYXVsdCBmb3IgYW4gYXJndW1lbnQsIGl0IHdh
cwogIGFsd2F5cyB1c2VkLCBldmVuIGlmIHRoZSAqaG9vayBjYWxsKiBwYXNzZWQgYW4gZXhwbGlj
aXQgdmFsdWUuCiAgTm93IHRoZSBwcmVjZWRlbmNlIGlzIGNoYW5nZWQgdG86IGhvb2sgY2FsbCBw
YXNzZWQgdmFsdWUgPiBob29rc3BlYyBkZWZhdWx0CiAgdmFsdWUgPiBob29raW1wbCBkZWZhdWx0
IHZhbHVlLgogIFNlZSA6cmVmOmBob29raW1wbF9hcmdfZGVmYXVsdHNgLgoKLSBgIzcwMSA8ID5g
XzogSG9va2ltcGxzIGFuZCBob29rc3BlY3MgYXJlIG5vdyBkaXNjb3ZlcmVkIHZpYQogIDpmdW5j
OmBpbnNwZWN0LmdldGF0dHJfc3RhdGljYCwgc28KICBwcm9wZXJ0aWVzLCBgYGNhY2hlZF9wcm9w
ZXJ0eWBgIGFuZCBvdGhlciBkZXNjcmlwdG9ycyBhcmUgbm8gbG9uZ2VyIGV4ZWN1dGVkCiAgd2hp
bGUKICBzY2FubmluZyBhIHBsdWdpbi4gSG9va3MgZGVjbGFyZWQgdGhyb3VnaCBzdWNoIGEgZGVz
Y3JpcHRvciBhcmUgbm90IHN1cHBvcnRlZC4KCiAgQXMgYSBzaWRlIGVmZmVjdCwgYGBAaG9va2lt
cGxgYC9gYEBob29rc3BlY2BgIGFwcGxpZWQgKmFib3ZlKiBgYEBjbGFzc21ldGhvZGBgCiAgb3IK
ICBgYEBzdGF0aWNtZXRob2RgYCBpcyBub3cgcGlja2VkIHVwOyBwcmV2aW91c2x5IHRoZSBtYXJr
ZXIgc2F0IG9uIHRoZSB3cmFwcGVyCiAgd2hlcmUKICBgYGdldGF0dHIoKWBgIG5ldmVyIHNhdyBp
dC4gQ2FsbGFibGVzIHN0b3JlZCBkaXJlY3RseSBvbiBhIHBsdWdpbiBpbnN0YW5jZSAtLQogIGlu
IGl0cwogIGBgX19kaWN0X19gYCBvciBpbiBhIGBgX19zbG90c19fYGAgc2xvdCAtLSBrZWVwIGJl
aW5nIGNhbGxlZCBleGFjdGx5IGFzCiAgYGBnZXRhdHRyKClgYAogIHJldHVybmVkIHRoZW0sIGku
ZS4gd2l0aG91dCBhbiBpbXBsaWNpdCBgYHNlbGZgYC4KCi0gYCM0MzEgPCA+YF86IEZpeCBgYEhv
b2tDYWxsZXIuX3JlbW92ZV9wbHVnaW4oKWBgIHRvIHJlbW92ZSBhbGwgaG9vawogIGltcGxlbWVu
dGF0aW9ucyBmb3IgYSBwbHVnaW4gaW4gYSBzaW5nbGUgY2FsbCwgaW5zdGVhZCBvZiBvbmx5IHRo
ZSBmaXJzdCBvbmUuCiAgQWxzbyBmaXggYGBQbHVnaW5NYW5hZ2VyLmdldF9ob29rY2FsbGVycygp
YGAgdG8gbm90IHJldHVybiBkdXBsaWNhdGUKICBgYEhvb2tDYWxsZXJgYCBlbnRyaWVzIHdoZW4g
YSBwbHVnaW4gaGFzIG11bHRpcGxlIGltcGxlbWVudGF0aW9ucyBvbiB0aGUgc2FtZQogIGhvb2sg
KGUuZy4gdmlhIGBgc3BlY25hbWVgYCkuCgotIGAjNjk1IDwgPmBfOiBGaXhlZCA6ZnVuYzpgfnBs
dWdneS5QbHVnaW5NYW5hZ2VyLnN1YnNldF9ob29rX2NhbGxlcigpYCBub3QKICBleGNsdWRpbmcg
cmVtb3ZlZCBwbHVnaW5zIHdoaWNoIHVzZSA6ZnVuYzpgQGhvb2tpbWwoc3BlY25hbWU9Ii4uLiIp
CiAgPHBsdWdneS5Ib29raW1wbE1hcmtlcj5gLgoKLSBgIzQyNCA8ID5gXzogVHJhY2luZyBubyBs
b25nZXIgYnJlYWtzIGhvb2sgZXhlY3V0aW9uIHdoZW4gYSB0cmFjZWQgb2JqZWN0IGhhcwogIGEg
YnJva2VuIGBgX19yZXByX19gYAogIG9yIGBgX19zdHJfX2BgLiBTdWNoIGEgdmFsdWUgaXMgbm93
IHJlbmRlcmVkIGFzCiAgYGA8W1J1bnRpbWVFcnJvciguLi4pIHJhaXNlZCBpbiBzdHIoKV0gQnJv
a2VuIG9iamVjdCBhdCAweC4uLj5gYCwgaW4gdGhlIHNhbWUKICBzdHlsZQogIHB5dGVzdCB1c2Vz
IGZvciB1bnByZXNlbnRhYmxlIG9iamVjdHMsIGluc3RlYWQgb2YgcHJvcGFnYXRpbmcgdGhlIGV4
Y2VwdGlvbgogIG91dCBvZiB0aGUKICBob29rIGNhbGwuCgotIGAjNjgxIDwgPmBfOiBUcmFjaW5n
IG5vIGxvbmdlciBjcmFzaGVzIHdpdGggYGBVbmljb2RlRW5jb2RlRXJyb3JgYCB3aGVuIGEgaG9v
awogIGFyZ3VtZW50IG9yIHJldHVybgogIHZhbHVlIGNvbnRhaW5zIGxvbmUgc3Vycm9nYXRlczsg
dGhleSBhcmUgZXNjYXBlZCB3aXRoIGBgYmFja3NsYXNocmVwbGFjZWBgCiAgYmVmb3JlIHRoZQog
IG1lc3NhZ2UgcmVhY2hlcyB0aGUgd3JpdGVyLiBUcmFjZSBvdXRwdXQgaXMgb3RoZXJ3aXNlIHVu
Y2hhbmdlZC4KCi0gYCM3MjcgPCA+YF86IEZpeCB0aGUgd2FybmluZyBmb3IgaG9va3NwZWMgYXJn
dW1lbnRzIG1pc3NpbmcgZnJvbSBhIGhvb2sgY2FsbAogIGJlaW5nIGF0dHJpYnV0ZWQgdG8gcGx1
Z2d5J3Mgb3duIGZyYW1lIGluc3RlYWQgb2YgdG8gdGhlIGNvZGUgbWFraW5nIHRoZSBjYWxsLgog
IFRoaXMgYWZmZWN0ZWQgYGBIb29rQ2FsbGVyLl9fY2FsbF9fYGAsIGBgY2FsbF9oaXN0b3JpY2Bg
IGFuZCBgYGNhbGxfZXh0cmFgYC4KCi0gYCM3MzEgPCA+YF86IDpmdW5jOmBQbHVnaW5NYW5hZ2Vy
LnJlZ2lzdGVyKE5vbmUpCiAgPHBsdWdneS5QbHVnaW5NYW5hZ2VyLnJlZ2lzdGVyPmAgaXMgbm93
IGlnbm9yZWQgaW5zdGVhZCBvZiBoYXZpbmcgc29tZSB3ZWlyZAogIGJlaGF2aW9ycy4KCi0gYCM3
MzMgPCA+YF86IDptZXRoOmBQbHVnaW5NYW5hZ2VyLnJlZ2lzdGVyKCkgPHBsdWdneS5QbHVnaW5N
YW5hZ2VyLnJlZ2lzdGVyPmAKICBub3cgdmFsaWRhdGVzIGFsbCBob29rIGltcGxlbWVudGF0aW9u
cyBvZiBhIHBsdWdpbiBiZWZvcmUgcmVnaXN0ZXJpbmcgYW55IG9mCiAgdGhlbSwgc28gYSBwbHVn
aW4gdGhhdCBmYWlscyB2YWxpZGF0aW9uIG5vIGxvbmdlciBzdGF5cyBwYXJ0aWFsbHkgcmVnaXN0
ZXJlZC4KCi0gYCM3NTUgPCA+YF86IFNraXAgYWxyZWFkeSByZWdpc3RlcmVkIGVudHJ5LXBvaW50
IHBsdWdpbnMgd2l0aG91dCBldmFsdWF0aW5nCiAgdGhlIHBsdWdpbiBvYmplY3QncyB0cnV0aGlu
ZXNzLgoKLSBgIzc1NyA8ID5gXzogUmVzdG9yZSB0aGUgcHJvamVjdCBVUkxzIGluIHRoZSBwYWNr
YWdlIG1ldGFkYXRhLCB3aGljaCB3ZXJlIGxvc3QKICBpbiBwbHVnZ3kgMS42LjAgd2hlbiB0aGUg
cGFja2FnaW5nIGNvbmZpZ3VyYXRpb24gbW92ZWQgdG8gYGBweXByb2plY3QudG9tbGBgLgogIExp
bmtzIHRvIHRoZSBkb2N1bWVudGF0aW9uLCBjaGFuZ2Vsb2csIGlzc3VlIHRyYWNrZXIgYW5kIGZ1
bmRpbmcgcGFnZSB3ZXJlCiAgYWRkZWQgYXMgd2VsbC4KCi0gYCM3NTkgPCA+YF86IDptZXRoOmBQ
bHVnaW5NYW5hZ2VyLnVucmVnaXN0ZXIoKQogIDxwbHVnZ3kuUGx1Z2luTWFuYWdlci51bnJlZ2lz
dGVyPmAgbm93IHJhaXNlcyA6ZXhjOmBWYWx1ZUVycm9yYCB3aGVuIGJvdGgKICBgYHBsdWdpbmBg
IGFuZCBgYG5hbWVgYCBhcmUgZ2l2ZW4gYnV0IHJlZmVyIHRvIGRpZmZlcmVudCBwbHVnaW5zLCBp
bnN0ZWFkIG9mCiAgcmVtb3Zpbmcgb25lIHBsdWdpbidzIGhvb2sgaW1wbGVtZW50YXRpb25zIGFu
ZCBhbm90aGVyIHBsdWdpbidzIHJlZ2lzdHJ5CiAgZW50cnkuCiAgSXQgYWxzbyBmdWxseSB1bnJl
Z2lzdGVycyBwbHVnaW4gb2JqZWN0cyB0aGF0IGFyZSBmYWxzeSAoZS5nLiBkZWZpbmUKICBgYF9f
bGVuX19gYCByZXR1cm5pbmcgYGAwYGApOyBwcmV2aW91c2x5IHRoZWlyIG5hbWUgc3RheWVkIGlu
IHRoZSByZWdpc3RyeS4KCi0gYCMxODYgPCA+YF86IEZpeGVkIGJyb2tlbiBleHRlcm5hbCBkb2N1
bWVudGF0aW9uIHJlZmVyZW5jZXMgaW4KCltDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2Vl
ZHMgNTAwMCBjaGFyYWN0ZXJzOwp0aGUgZnVsbCBjaGFuZ2Vsb2cgY2FuIGJlIGZvdW5kIGluIGFu
IGF0dGFjaG1lbnQgdG8gdGhlIEFVSCBlbWFpbF0KLS0tCiAuLi4vcHl0aG9uL3tweXRob24zLXBs
dWdneV8xLjYuMC5iYiA9PiBweXRob24zLXBsdWdneV8xLjcuMC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBsdWdneV8xLjYuMC5iYiA9PiBweXRob24zLXBs
dWdneV8xLjcuMC5iYn0gKDgwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtcGx1Z2d5XzEuNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXBsdWdneV8xLjcuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDgwJQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGx1Z2d5XzEuNi4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGx1Z2d5XzEu
Ny4wLmJiCmluZGV4IGI4ZTRiYmM3NWIuLjU1ZDYzODNmYTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wbHVnZ3lfMS42LjAuYmIKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBsdWdneV8xLjcuMC5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5dGVzdC1kZXYvcGx1Z2d5Igog
TElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0x
YzgyMDZkMTZmZDVjYzAyZmE5YjBiYjk4OTU1ZTVjMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjdkY2MxMzBiNzYyNThkMzNiOTBmNjFiNjU4NzkxZGVkZTM0ODZjM2U2YmZiMDAzZWU1YzliZmIz
OTZkZDIyZjMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDFlYWE0NmViYjU5NTg5MWI4NjBhYjA4
NmI0ZDA5Yzg1ODhhZjY1ZWJkNDM2MWI4ZThmNGJiODkyMGI5MGJhOCIKIAogREVQRU5EUyArPSAi
cHl0aG9uMy1zZXR1cHRvb2xzLXNjbS1uYXRpdmUiCiAKLS0gCjIuNDcuMQoK

--===============7795706715045112137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pluggy-changelog.txt"

pluggy 1.7.0 (2026-10-14)
=========================

Deprecations and Removals
-------------------------

- `#632 < >`_: Hookspec methods defined without ``self`` as the first parameter
  now emit a :class:`DeprecationWarning`. Add ``self`` as the first parameter or
  use ``@staticmethod``.

Features
--------

- `#170 < >`_: Hookspecs can now declare default values for arguments, using the
  usual ``def myhook(myarg="default")`` syntax.
  This is mainly a backward compatibility feature, to allow a hookspec to add
  new parameters to an existing hook without breaking existing *callers*.
  See :ref:`hookspec_arg_default` for details.

- `#729 < >`_: Tracing now adds detail where ``str()`` is ambiguous: empty
  strings and strings containing
  whitespace are quoted, and enums and paths show their ``repr()``.

  A value spanning several lines is now displayed as a block instead of running
  into the
  surrounding trace.

Bug Fixes
---------

- `#629 < >`_: Fix hooks failing to register on Python 3.14+ when type
  annotations use forward references.

- `#315 < >`_: Source archives created by ``git archive`` (including GitHub's
  "Source code" downloads) now carry version information, so building pluggy
  from them no longer fails with a missing version.

- `#442 < >`_: With the addition of default values for hookspec arguments, we
  also changed the precedence of default values for *hookimpl* arguments.
  Previously, if a hookimpl function declared a default for an argument, it was
  always used, even if the *hook call* passed an explicit value.
  Now the precedence is changed to: hook call passed value > hookspec default
  value > hookimpl default value.
  See :ref:`hookimpl_arg_defaults`.

- `#701 < >`_: Hookimpls and hookspecs are now discovered via
  :func:`inspect.getattr_static`, so
  properties, ``cached_property`` and other descriptors are no longer executed
  while
  scanning a plugin. Hooks declared through such a descriptor are not supported.

  As a side effect, ``@hookimpl``/``@hookspec`` applied *above* ``@classmethod``
  or
  ``@staticmethod`` is now picked up; previously the marker sat on the wrapper
  where
  ``getattr()`` never saw it. Callables stored directly on a plugin instance --
  in its
  ``__dict__`` or in a ``__slots__`` slot -- keep being called exactly as
  ``getattr()``
  returned them, i.e. without an implicit ``self``.

- `#431 < >`_: Fix ``HookCaller._remove_plugin()`` to remove all hook
  implementations for a plugin in a single call, instead of only the first one.
  Also fix ``PluginManager.get_hookcallers()`` to not return duplicate
  ``HookCaller`` entries when a plugin has multiple implementations on the same
  hook (e.g. via ``specname``).

- `#695 < >`_: Fixed :func:`~pluggy.PluginManager.subset_hook_caller()` not
  excluding removed plugins which use :func:`@hookiml(specname="...")
  <pluggy.HookimplMarker>`.

- `#424 < >`_: Tracing no longer breaks hook execution when a traced object has
  a broken ``__repr__``
  or ``__str__``. Such a value is now rendered as
  ``<[RuntimeError(...) raised in str()] Broken object at 0x...>``, in the same
  style
  pytest uses for unpresentable objects, instead of propagating the exception
  out of the
  hook call.

- `#681 < >`_: Tracing no longer crashes with ``UnicodeEncodeError`` when a hook
  argument or return
  value contains lone surrogates; they are escaped with ``backslashreplace``
  before the
  message reaches the writer. Trace output is otherwise unchanged.

- `#727 < >`_: Fix the warning for hookspec arguments missing from a hook call
  being attributed to pluggy's own frame instead of to the code making the call.
  This affected ``HookCaller.__call__``, ``call_historic`` and ``call_extra``.

- `#731 < >`_: :func:`PluginManager.register(None)
  <pluggy.PluginManager.register>` is now ignored instead of having some weird
  behaviors.

- `#733 < >`_: :meth:`PluginManager.register() <pluggy.PluginManager.register>`
  now validates all hook implementations of a plugin before registering any of
  them, so a plugin that fails validation no longer stays partially registered.

- `#755 < >`_: Skip already registered entry-point plugins without evaluating
  the plugin object's truthiness.

- `#757 < >`_: Restore the project URLs in the package metadata, which were lost
  in pluggy 1.6.0 when the packaging configuration moved to ``pyproject.toml``.
  Links to the documentation, changelog, issue tracker and funding page were
  added as well.

- `#759 < >`_: :meth:`PluginManager.unregister()
  <pluggy.PluginManager.unregister>` now raises :exc:`ValueError` when both
  ``plugin`` and ``name`` are given but refer to different plugins, instead of
  removing one plugin's hook implementations and another plugin's registry
  entry.
  It also fully unregisters plugin objects that are falsy (e.g. define
  ``__len__`` returning ``0``); previously their name stayed in the registry.

- `#186 < >`_: Fixed broken external documentation references in the list of
  projects using pluggy.

Trivial/Internal Changes
------------------------

- `#417 < >`_: Fix the ``tox -e docs`` build, which failed under ``sphinx-build
  -W`` because nitpicky mode reported unresolved references to the private
  names.

- `#590 < >`_: The ``pluggy.__version__`` variable is now dynamically provided
  via a module-level ``__getattr__`` implementation, using ``importlib`` to
  obtain the installed version.

- `#691 < >`_: Fix outdated links in ``README.rst``.

- `#703 < >`_: The internal ``pluggy._hooks`` module was split into role-
  specific modules
  (``_caller``, ``_config``, ``_decorators``, ``_execution`` and ``_impl``).
  ``pluggy._hooks`` remains as a re-export shim, and the public API is
  unchanged.

- `#776 < >`_: Building ``pluggy`` without git metadata now yields the
  placeholder version ``1.6.0+fallback`` instead of failing, so Dependabot
  relocks no longer resolve ``pluggy`` as ``0.0.0`` and silently downgrade
  pytest and tox in ``uv.lock``. ``tox`` was dropped from the ``dev`` dependency
  group; run it as a tool with ``uvx tox``.

- `#544 < >`_: Correctly pass :class:`StopIteration` through hook wrappers.
- `#573 < >`_: Fix python 3.14 SyntaxError by rearranging code.
      def my_hook_impl(arg):
          return my_hook_impl(arg)
          yield from my_hook_impl(arg)

--===============7795706715045112137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pluggy: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pluggy/pluggy-1.6.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pluggy/pluggy-1.7.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pluggy: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-dbg: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-dbg: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-dev: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-dev: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-doc: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-doc: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-locale: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-locale: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-ptest: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-ptest: PKGSIZE changed from 68167 to 115136 (+69%)
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-ptest: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-src: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-src: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-staticdev: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy-staticdev: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info -> /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/_version.py", added "/usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc /usr/lib/python3.14/site-packages/pluggy/_impl.py /usr/lib/python3.14/site-packages/pluggy/_decorator
 s.py /usr/lib/python3.14/site-packages/pluggy/_config.py /usr/lib/python3.14/site-packages/pluggy/_caller.py /usr/lib/python3.14/site-packages/pluggy/_compat.py /usr/lib/python3.14/site-packages/pluggy/_execution.py /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy: PV changed from "1.6.0" to "1.7.0"
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy: PKGSIZE changed from 149335 to 185103 (+24%)
packages/x86-64-v3-poky-linux/python3-pluggy/python3-pluggy: PKGV changed from 1.6.0 [default] to 1.7.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-pluggy (sysroot):
  /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info
  /usr/lib/python3.14/site-packages/pluggy/_caller.py was added
  /usr/lib/python3.14/site-packages/pluggy/_compat.py was added
  /usr/lib/python3.14/site-packages/pluggy/_config.py was added
  /usr/lib/python3.14/site-packages/pluggy/_decorators.py was added
  /usr/lib/python3.14/site-packages/pluggy/_execution.py was added
  /usr/lib/python3.14/site-packages/pluggy/_impl.py was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/_version.py was removed
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info moved to /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info
  /usr/lib/python3.14/site-packages/pluggy/_caller.py was added
  /usr/lib/python3.14/site-packages/pluggy/_compat.py was added
  /usr/lib/python3.14/site-packages/pluggy/_config.py was added
  /usr/lib/python3.14/site-packages/pluggy/_decorators.py was added
  /usr/lib/python3.14/site-packages/pluggy/_execution.py was added
  /usr/lib/python3.14/site-packages/pluggy/_impl.py was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/_version.py was removed

--===============7795706715045112137==--

