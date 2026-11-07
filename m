Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4629.1794032729861983374
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 22:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H43tp3Ew;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h9UY46Hs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1b4af0261-709cb3d2-2840-4ebf-839a-7487a23415ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794032730;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=V10aedAG7NyjGXg9PFgGdPYxwtujKt8mKZcTRKXvduo=;
	b=H43tp3EwAwWJ5RURGdgrxfXqUzo13xXSiunlkvCYpYW5XBlwTII2vL6JBn4qwl1I
	HcR2XWSzrc5WbF0H3HnDZeTDXUIJkqyjmmUG3ioCraZxPkArnsxt2Oxdho/s/736XoM
	dMKYKVjeUyQO+b30nNHu8xSuyXjsdIy9ExfZy3qY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794032730;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=V10aedAG7NyjGXg9PFgGdPYxwtujKt8mKZcTRKXvduo=;
	b=h9UY46Hs1mGDZ5viM1A9PHQDvfRGZHiYY9ekwqSlORh+7KzWtQJKmOUSCI7Qxk8x
	JvXbCPmMXbF67PkOycmHLqzfD/IbXWEaLz4Bs9oFQ4kwPHT/l2IoaxUzpMr764jVbVF
	Y+yFtqHgi81CDRYz2oGMODNKFNPsJFXKGCDyrsXI=
Content-Type: multipart/mixed; boundary="===============4352567970912377541=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-click: upgrading to 8.5.1 SUCCEEDED
Message-ID: <010101a1b4af0261-709cb3d2-2840-4ebf-839a-7487a23415ad-000000@us-west-2.amazonses.com>
Date: Sat, 7 Nov 2026 06:25:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.07-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 06:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249724

--===============4352567970912377541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-click* to *8.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-click-upgrade-8.5.0-8.5.1.patch
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
From e9438f93708d095d69c2a4fb5a5e2153fc1d23df Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 7 Nov 2026 05:32:46 +0000
Subject: [PATCH] python3-click: upgrade 8.5.0 -> 8.5.1

## Version 8.5.1
Released 2026-11-09

- Fix `copy.deepcopy()` and `pickle` on a `Parameter`, `Option` or `Command`.
  {pr}`3805`
- A `KeyboardInterrupt` arriving while `Command.main()` reports an abort or an
  error,
  or while it exits, no longer escapes as an unhandled traceback. The command
  still
  exits with the intended code; only the message may be lost. {issue}`3802`
- Add {meth}`Option.get_help_spec`, which returns the option's left help
  column even when the option is hidden. {meth}`Option.get_help_record` still
  returns `None` for hidden options, so help screens are unchanged. {pr}`3821`
- The `Positional arguments` help section lists every argument of the command,
  not only the documented ones. An argument with no `help` gets an empty
  description, the same way an option with no `help` does. {pr}`3860`
- {meth}`Argument.get_help_record` always returns a tuple. It used to return
  `None` for an argument with no `help`. {pr}`3860`
- Document which types are inferred from `default`, and what an unrecognized
  `type` callable does to a command-line value. {issue}`3036` {pr}`3808`
- `path_type` narrows the converted value's type for `convert` and `prompt`.
  {issue}`3822` {pr}`3858`
- {class}`Parameter` accepts a new `help` argument and {class}`Option` and
  {class}`Argument`
  inherits it. {meth}`Parameter.to_info_dict` now reports `help` for every kind
  of parameter.
  {pr}`3861`
- A command's short help no longer stops at an abbreviation such as `vs.` or
  `e.g.`
  inside the first sentence. A period ends the sentence only when it closes the
  text
  or the next word does not start in lowercase. {pr}`3865`
- With `show_envvar=True`, an option's error message now prints all variables of
  an
  `envvar` sequence instead of the `repr` of the sequence. {pr}`3884`
- An empty `envvar`, such as `[]` or `""`, shows the same help and error message
  as
  no `envvar` when `show_envvar=True`. The help screen used to show `[env var:
  ]`.
  {pr}`3884`
- Align command's deprecated help text to options and arguments: do not
  translate the
  command's own help text, only the `(DEPRECATED)` label. {pr}`3901`

  does not. The feature set of {func}`version_option` is now frozen. {pr}`3581`
---
 .../python/{python3-click_8.5.0.bb => python3-click_8.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.5.0.bb => python3-click_8.5.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.5.0.bb b/meta/recipes-devtools/python/python3-click_8.5.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.5.0.bb
rename to meta/recipes-devtools/python/python3-click_8.5.1.bb
index d6017e3d7b..29cf0714d0 100644
--- a/meta/recipes-devtools/python/python3-click_8.5.0.bb
+++ b/meta/recipes-devtools/python/python3-click_8.5.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://click.pocoo.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1fa98232fd645608937a0fdc82e999b8"
 
-SRC_URI[sha256sum] = "ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9b54021bb272e34"
+SRC_URI[sha256sum] = "9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104fa56aaaeb072b4"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============4352567970912377541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-click-changelog.txt"

## Version 8.5.1
Released 2026-11-09

- Fix `copy.deepcopy()` and `pickle` on a `Parameter`, `Option` or `Command`.
  {pr}`3805`
- A `KeyboardInterrupt` arriving while `Command.main()` reports an abort or an
  error,
  or while it exits, no longer escapes as an unhandled traceback. The command
  still
  exits with the intended code; only the message may be lost. {issue}`3802`
- Add {meth}`Option.get_help_spec`, which returns the option's left help
  column even when the option is hidden. {meth}`Option.get_help_record` still
  returns `None` for hidden options, so help screens are unchanged. {pr}`3821`
- The `Positional arguments` help section lists every argument of the command,
  not only the documented ones. An argument with no `help` gets an empty
  description, the same way an option with no `help` does. {pr}`3860`
- {meth}`Argument.get_help_record` always returns a tuple. It used to return
  `None` for an argument with no `help`. {pr}`3860`
- Document which types are inferred from `default`, and what an unrecognized
  `type` callable does to a command-line value. {issue}`3036` {pr}`3808`
- `path_type` narrows the converted value's type for `convert` and `prompt`.
  {issue}`3822` {pr}`3858`
- {class}`Parameter` accepts a new `help` argument and {class}`Option` and
  {class}`Argument`
  inherits it. {meth}`Parameter.to_info_dict` now reports `help` for every kind
  of parameter.
  {pr}`3861`
- A command's short help no longer stops at an abbreviation such as `vs.` or
  `e.g.`
  inside the first sentence. A period ends the sentence only when it closes the
  text
  or the next word does not start in lowercase. {pr}`3865`
- With `show_envvar=True`, an option's error message now prints all variables of
  an
  `envvar` sequence instead of the `repr` of the sequence. {pr}`3884`
- An empty `envvar`, such as `[]` or `""`, shows the same help and error message
  as
  no `envvar` when `show_envvar=True`. The help screen used to show `[env var:
  ]`.
  {pr}`3884`
- Align command's deprecated help text to options and arguments: do not
  translate the
  command's own help text, only the `(DEPRECATED)` label. {pr}`3901`

  does not. The feature set of {func}`version_option` is now frozen. {pr}`3581`

--===============4352567970912377541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-click: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/click/click-8.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/c/click/click-8.5.1.tar.gz"
packages/x86-64-v3-poky-linux/python3-click: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dbg: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-dev: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-doc: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-locale: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGSIZE changed from 689535 to 730369 (+6%)
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/tests/test_types.py /usr/lib/python3-click/ptest/docs/standalone-apps.md", added "/usr/lib/python3-click/ptest/tests/test_types/test_convert_type.py /usr/lib/python3-click/ptest/tests/test_types/test_ParamType.py /usr/lib/python3-click/ptest/docs/standalone-apps-nuitka.md /usr/lib/python3-click/ptest/docs/standalone-apps-briefcase.md /usr/lib/python3-click/ptest/tests/test_exceptions/test_FileError.py /usr/lib/python3-click/ptest/tests/test_exceptions/__init__.py /usr/lib/python3-click/ptest/tests/test_types/test_FuncParamType.py /usr/lib/python3-click/ptest/tests/test_types/test_FloatRange.py /usr/lib/python3-click/ptest/tests/test_types/__init__.py /usr/lib/python3-click/ptest/tests/test_types/test_IntRange.py /usr/lib/python3-click/ptest/tests/typing/typing_path.py /usr/lib/python3-click/ptest/tests/test_abort_interrupt.py /usr/lib/python3-click/ptest/tests/test_types/t
 est_File.py /usr/lib/python3-click/ptest/tests/test_types/test_Choice.py /usr/lib/python3-click/ptest/tests/test_types/test_Path.py"
packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-src: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click-staticdev: PV changed from "8.5.0" to "8.5.1"
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGSIZE changed from 1034447 to 1040403 (+1%)
packages/x86-64-v3-poky-linux/python3-click/python3-click: PKGV changed from 8.5.0 [default] to 8.5.1 [default]
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.5.0.dist-info -> /usr/lib/python3.14/site-packages/click-8.5.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.5.1.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-click/python3-click: PV changed from "8.5.0" to "8.5.1"
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.5.0.dist-info moved to /usr/lib/python3.14/site-packages/click-8.5.1.dist-info

--===============4352567970912377541==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-click-upgrade-8.5.0-8.5.1.patch"

RnJvbSBlOTQzOGY5MzcwOGQwOTVkNjljMmE0ZmI1YTVlMjE1M2ZjMWQyM2RmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgNyBOb3YgMjAyNiAwNTozMjo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY2xpY2s6IHVwZ3JhZGUgOC41LjAgLT4gOC41LjEKCiMjIFZlcnNpb24gOC41LjEKUmVs
ZWFzZWQgMjAyNi0xMS0wOQoKLSBGaXggYGNvcHkuZGVlcGNvcHkoKWAgYW5kIGBwaWNrbGVgIG9u
IGEgYFBhcmFtZXRlcmAsIGBPcHRpb25gIG9yIGBDb21tYW5kYC4KICB7cHJ9YDM4MDVgCi0gQSBg
S2V5Ym9hcmRJbnRlcnJ1cHRgIGFycml2aW5nIHdoaWxlIGBDb21tYW5kLm1haW4oKWAgcmVwb3J0
cyBhbiBhYm9ydCBvciBhbgogIGVycm9yLAogIG9yIHdoaWxlIGl0IGV4aXRzLCBubyBsb25nZXIg
ZXNjYXBlcyBhcyBhbiB1bmhhbmRsZWQgdHJhY2ViYWNrLiBUaGUgY29tbWFuZAogIHN0aWxsCiAg
ZXhpdHMgd2l0aCB0aGUgaW50ZW5kZWQgY29kZTsgb25seSB0aGUgbWVzc2FnZSBtYXkgYmUgbG9z
dC4ge2lzc3VlfWAzODAyYAotIEFkZCB7bWV0aH1gT3B0aW9uLmdldF9oZWxwX3NwZWNgLCB3aGlj
aCByZXR1cm5zIHRoZSBvcHRpb24ncyBsZWZ0IGhlbHAKICBjb2x1bW4gZXZlbiB3aGVuIHRoZSBv
cHRpb24gaXMgaGlkZGVuLiB7bWV0aH1gT3B0aW9uLmdldF9oZWxwX3JlY29yZGAgc3RpbGwKICBy
ZXR1cm5zIGBOb25lYCBmb3IgaGlkZGVuIG9wdGlvbnMsIHNvIGhlbHAgc2NyZWVucyBhcmUgdW5j
aGFuZ2VkLiB7cHJ9YDM4MjFgCi0gVGhlIGBQb3NpdGlvbmFsIGFyZ3VtZW50c2AgaGVscCBzZWN0
aW9uIGxpc3RzIGV2ZXJ5IGFyZ3VtZW50IG9mIHRoZSBjb21tYW5kLAogIG5vdCBvbmx5IHRoZSBk
b2N1bWVudGVkIG9uZXMuIEFuIGFyZ3VtZW50IHdpdGggbm8gYGhlbHBgIGdldHMgYW4gZW1wdHkK
ICBkZXNjcmlwdGlvbiwgdGhlIHNhbWUgd2F5IGFuIG9wdGlvbiB3aXRoIG5vIGBoZWxwYCBkb2Vz
LiB7cHJ9YDM4NjBgCi0ge21ldGh9YEFyZ3VtZW50LmdldF9oZWxwX3JlY29yZGAgYWx3YXlzIHJl
dHVybnMgYSB0dXBsZS4gSXQgdXNlZCB0byByZXR1cm4KICBgTm9uZWAgZm9yIGFuIGFyZ3VtZW50
IHdpdGggbm8gYGhlbHBgLiB7cHJ9YDM4NjBgCi0gRG9jdW1lbnQgd2hpY2ggdHlwZXMgYXJlIGlu
ZmVycmVkIGZyb20gYGRlZmF1bHRgLCBhbmQgd2hhdCBhbiB1bnJlY29nbml6ZWQKICBgdHlwZWAg
Y2FsbGFibGUgZG9lcyB0byBhIGNvbW1hbmQtbGluZSB2YWx1ZS4ge2lzc3VlfWAzMDM2YCB7cHJ9
YDM4MDhgCi0gYHBhdGhfdHlwZWAgbmFycm93cyB0aGUgY29udmVydGVkIHZhbHVlJ3MgdHlwZSBm
b3IgYGNvbnZlcnRgIGFuZCBgcHJvbXB0YC4KICB7aXNzdWV9YDM4MjJgIHtwcn1gMzg1OGAKLSB7
Y2xhc3N9YFBhcmFtZXRlcmAgYWNjZXB0cyBhIG5ldyBgaGVscGAgYXJndW1lbnQgYW5kIHtjbGFz
c31gT3B0aW9uYCBhbmQKICB7Y2xhc3N9YEFyZ3VtZW50YAogIGluaGVyaXRzIGl0LiB7bWV0aH1g
UGFyYW1ldGVyLnRvX2luZm9fZGljdGAgbm93IHJlcG9ydHMgYGhlbHBgIGZvciBldmVyeSBraW5k
CiAgb2YgcGFyYW1ldGVyLgogIHtwcn1gMzg2MWAKLSBBIGNvbW1hbmQncyBzaG9ydCBoZWxwIG5v
IGxvbmdlciBzdG9wcyBhdCBhbiBhYmJyZXZpYXRpb24gc3VjaCBhcyBgdnMuYCBvcgogIGBlLmcu
YAogIGluc2lkZSB0aGUgZmlyc3Qgc2VudGVuY2UuIEEgcGVyaW9kIGVuZHMgdGhlIHNlbnRlbmNl
IG9ubHkgd2hlbiBpdCBjbG9zZXMgdGhlCiAgdGV4dAogIG9yIHRoZSBuZXh0IHdvcmQgZG9lcyBu
b3Qgc3RhcnQgaW4gbG93ZXJjYXNlLiB7cHJ9YDM4NjVgCi0gV2l0aCBgc2hvd19lbnZ2YXI9VHJ1
ZWAsIGFuIG9wdGlvbidzIGVycm9yIG1lc3NhZ2Ugbm93IHByaW50cyBhbGwgdmFyaWFibGVzIG9m
CiAgYW4KICBgZW52dmFyYCBzZXF1ZW5jZSBpbnN0ZWFkIG9mIHRoZSBgcmVwcmAgb2YgdGhlIHNl
cXVlbmNlLiB7cHJ9YDM4ODRgCi0gQW4gZW1wdHkgYGVudnZhcmAsIHN1Y2ggYXMgYFtdYCBvciBg
IiJgLCBzaG93cyB0aGUgc2FtZSBoZWxwIGFuZCBlcnJvciBtZXNzYWdlCiAgYXMKICBubyBgZW52
dmFyYCB3aGVuIGBzaG93X2VudnZhcj1UcnVlYC4gVGhlIGhlbHAgc2NyZWVuIHVzZWQgdG8gc2hv
dyBgW2VudiB2YXI6CiAgXWAuCiAge3ByfWAzODg0YAotIEFsaWduIGNvbW1hbmQncyBkZXByZWNh
dGVkIGhlbHAgdGV4dCB0byBvcHRpb25zIGFuZCBhcmd1bWVudHM6IGRvIG5vdAogIHRyYW5zbGF0
ZSB0aGUKICBjb21tYW5kJ3Mgb3duIGhlbHAgdGV4dCwgb25seSB0aGUgYChERVBSRUNBVEVEKWAg
bGFiZWwuIHtwcn1gMzkwMWAKCiAgZG9lcyBub3QuIFRoZSBmZWF0dXJlIHNldCBvZiB7ZnVuY31g
dmVyc2lvbl9vcHRpb25gIGlzIG5vdyBmcm96ZW4uIHtwcn1gMzU4MWAKLS0tCiAuLi4vcHl0aG9u
L3tweXRob24zLWNsaWNrXzguNS4wLmJiID0+IHB5dGhvbjMtY2xpY2tfOC41LjEuYmJ9ICAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNsaWNrXzguNS4wLmJiID0+
IHB5dGhvbjMtY2xpY2tfOC41LjEuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguNS4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguNS4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjUuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNs
aWNrXzguNS4xLmJiCmluZGV4IGQ2MDE3ZTNkN2IuLjI5Y2YwNzE0ZDAgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjUuMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfOC41LjEuYmIKQEAgLTgs
NyArOCw3IEBAIEhPTUVQQUdFID0gImh0dHA6Ly9jbGljay5wb2Nvby5vcmcvIgogTElDRU5TRSA9
ICJCU0QtMy1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDtt
ZDU9MWZhOTgyMzJmZDY0NTYwODkzN2EwZmRjODJlOTk5YjgiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJiYTBkMjA4OWRlNzVlYTAzMTBlMmRkZTAzMTYwZTZjYTEwMDA5OTQ3ZmI5NWExODJmOWI1
NDAyMWJiMjcyZTM0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjliYmZhZGE3NjcwM2ZkMWQ3ODRi
ODNlZWEwMTJlM2U4YzZhMDAxYTg3NjU0M2VmMTA0ZmE1NmFhYWViMDcyYjQiCiAKIGluaGVyaXQg
cHlwaSBweXRob25fZmxpdF9jb3JlIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40Ny4xCgo=

--===============4352567970912377541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-click/python3-click-ptest: FILELIST: removed "/usr/lib/python3-click/ptest/docs/standalone-apps.md /usr/lib/python3-click/ptest/tests/test_types.py", added "/usr/lib/python3-click/ptest/tests/test_types/__init__.py /usr/lib/python3-click/ptest/tests/test_types/test_FuncParamType.py /usr/lib/python3-click/ptest/tests/test_exceptions/__init__.py /usr/lib/python3-click/ptest/tests/test_abort_interrupt.py /usr/lib/python3-click/ptest/tests/typing/typing_path.py /usr/lib/python3-click/ptest/tests/test_types/test_File.py /usr/lib/python3-click/ptest/tests/test_types/test_Choice.py /usr/lib/python3-click/ptest/tests/test_types/test_Path.py /usr/lib/python3-click/ptest/docs/standalone-apps-briefcase.md /usr/lib/python3-click/ptest/tests/test_types/test_ParamType.py /usr/lib/python3-click/ptest/tests/test_exceptions/test_FileError.py /usr/lib/python3-click/ptest/tests/test_types/test_IntRange.py /usr/lib/python3-click/ptest/tests/test_types/test_FloatRang
 e.py /usr/lib/python3-click/ptest/tests/test_types/test_convert_type.py /usr/lib/python3-click/ptest/docs/standalone-apps-nuitka.md"
packages/x86-64-v3-poky-linux/python3-click/python3-click: FILELIST: directory renamed /usr/lib/python3.14/site-packages/click-8.5.0.dist-info -> /usr/lib/python3.14/site-packages/click-8.5.1.dist-info, directory renamed /usr/lib/python3.14/site-packages/click-8.5.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/click-8.5.1.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-click (sysroot):
  /usr/lib/python3.14/site-packages/click-8.5.0.dist-info moved to /usr/lib/python3.14/site-packages/click-8.5.1.dist-info

--===============4352567970912377541==--
