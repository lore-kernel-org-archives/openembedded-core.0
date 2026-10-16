Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A5D3CCA46D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:03:21 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15772.1792130599155495063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:03:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=lXItSToT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dbv6WKwK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a1434ec58e-365f63d9-a1da-4276-a851-d38acc962e55-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792130598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DtrszzRm2m7Q5K8nRkCFe5LMIvc4KiW70xBmVCo+/bo=;
	b=lXItSToTHrThRmI4iNlMOBo9bklo0NYcqgpIYILLfuMVPPN15Ve8igOytPr0XUs8
	srOZYbVcZ+NvnXz3BvAqZ8shhO5ImTyoUzoCsVEpG+/cC21IJPgcJ+hDbtZsT8TF20U
	XuteJqzb+b3+SAeYQtd8uwXON271z8EroF+zPvR4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792130598;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DtrszzRm2m7Q5K8nRkCFe5LMIvc4KiW70xBmVCo+/bo=;
	b=dbv6WKwKvUQaHR+i7c2ZT3HIvVMuT2Kd7MDjGvqJQLE/vmmZKF0ohH7//gfSMAr9
	W0LwrmgDxTfwnD86eJI5VRTB0IcWVqdikxn07zGqIMfYEAAQXPNmuoJN64xVISzBZUU
	5X+1Kd6OBlXvDYYVknx2kLup/f69BxfnhxWtLvY0=
Content-Type: multipart/mixed; boundary="===============4004360156642159863=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-tomlkit: upgrading to 0.15.2 SUCCEEDED
Message-ID: <010101a1434ec58e-365f63d9-a1da-4276-a851-d38acc962e55-000000@us-west-2.amazonses.com>
Date: Fri, 16 Oct 2026 06:03:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 06:03:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247966

--===============4004360156642159863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-tomlkit* to *0.15.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-tomlkit-upgrade-0.15.1-0.15.2.patch
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
From ea731fbb4c4c97ed17cb93ffb3d22abe5234fd2e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Oct 2026 05:48:14 +0000
Subject: [PATCH] python3-tomlkit: upgrade 0.15.1 -> 0.15.2

## [Unreleased]
## [0.15.2] - 2026-10-16
### Changed

- Write the ESC control character as `\u001b` instead of `\e`, which is only
  valid in TOML 1.1, so the output stays readable by TOML 1.0 parsers such as
  `tomllib`. ([#641]( ))
- `key_value()` now raises `UnexpectedCharError` on anything other than
  whitespace or a comment after the pair, instead of silently discarding it
  (e.g. `key_value("a = 1 b = 2")`), matching `parse()`. ([#594]( ))
- `integer()` given a string now validates it against the TOML integer grammar
  and keeps the original text, so grouping underscores (e.g. `integer("1_000")`)
  survive `dumps()`; strings that are not valid TOML integers (e.g. `"010"`) now
  raise `ValueError`. ([#336]( ))
- Add a `fold` argument to `DateTime` and `Time`, mirroring the stdlib, and
  carry `fold` through `item()`, arithmetic (including datetime subtraction) and
  `unwrap()`, so a folded local time no longer converts an hour off. ([#619]( ),
  [#623]( ), [#626]( ))
- Declare the project metadata in the PEP 621 `[project]` table; building from
  source now requires `poetry-core>=2.2.0`. ([#607]( ), [#609]( ))

### Fixed

- Fix valid TOML being rejected when an out-of-order table reopens an implicit
  super-table with a dotted key: `[a.b.c]` then `[a]` with `b.z = 1` extends the
  implicit `a.b` super-table rather than redefining it (stdlib `tomllib` accepts
  it), so it now parses and round-trips instead of raising `Redefinition of an
  existing table`. The concrete-table case (`[a.b]` then `[a]` `b.z = 1`) stays
  rejected. ([#565]( ))
- Fix uppercase `E` exponent after a leading-zero mantissa (e.g. `0E2`) being
  rejected as an invalid number while `0e2` parsed fine. ([#586]( ))
- Fix non-lowercase special floats (e.g. `Inf`, `NaN`, `-INF`) being accepted;
  TOML only allows lowercase `inf` and `nan`, so they now raise `ParseError`.
  ([#628]( ))
- Fix parse errors reporting the wrong line and column in documents with CRLF or
  mixed line endings. ([#642]( ))
- Fix `item()` reordering the keys of an inline table (dict-valued keys were
  forced last) under the default `sort_keys=False`. ([#546]( ))
- Fix `unwrap()` moving a key to the end after its value was replaced (e.g.
  `doc["b"] = 9`), while `dumps()` and `keys()` kept the original order.
  ([#591]( ))
- Fix appending a key to a parsed inline table that uses `", "` separators
  emitting a bare `","` for the new entry, leaving the table inconsistently
  spaced (e.g. `{x = 1, y = 2,z = 3}`). ([#595]( ))
- Fix an emptied array of tables being dropped from the output: it now renders
  as `key = []`, placed and keyed relative to the nearest table header so it
  parses back into the same table. ([#567]( ))
- Fix a single-line array whose last element is a trailing comment (e.g. from
  `add_line(value, comment=...)`) rendering its closing `]` on the comment line,
  producing unparseable output. ([#580]( ))
- Fix `del array[start:stop:step]` with a negative or omitted bound removing the
  wrong elements from the rendered output. ([#599]( ))
- Fix array slice assignment mutating the array before raising
  `ValueError("slice assignment is not supported")`. ([#600]( ))
- Fix `String.__add__` splicing the appended text into a basic string without
  escaping it, so appending a quote or backslash produced invalid TOML. ([#612](
  ))
- Fix a bare carriage return in a multiline string producing invalid TOML: it is
  now escaped as `\r` in a multiline basic string and rejected with
  `InvalidStringError` in a multiline literal string; CRLF line endings are left
  intact. ([#539]( ))
- Fix a tz-aware `datetime.time` rendering with a UTC offset (e.g.
  `07:32:00+02:00`), which TOML local times do not allow; it now renders as a
  local time. ([#613]( ))
- Fix arithmetic on a signed float producing `+-0.0` (e.g. `-1.5` times `0`),
  which does not parse. ([#629]( ))
- Fix two `Bool` items never comparing equal to each other; they now compare by
  value. ([#660]( ))

[unreleased]: https://github.com/python-poetry/tomlkit/compare/0.15.2...master
[0.15.2]: https://github.com/python-poetry/tomlkit/releases/tag/0.15.2
---
 .../{python3-tomlkit_0.15.1.bb => python3-tomlkit_0.15.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-tomlkit_0.15.1.bb => python3-tomlkit_0.15.2.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb b/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb
rename to meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
index b0c51f21c5..cf67cea552 100644
--- a/meta/recipes-devtools/python/python3-tomlkit_0.15.1.bb
+++ b/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tomlkit/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82"
 
-SRC_URI[sha256sum] = "e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97"
+SRC_URI[sha256sum] = "83e32755ba1d20d9340bd069ee97e9f6232ba2346b63ffcba425de01f7e327a6"
 
 inherit pypi python_poetry_core ptest-python-pytest
 
-- 
2.47.1


--===============4004360156642159863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: FILELIST: added "/usr/lib/python3-tomlkit/ptest/tests/test_types.py"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: FILELIST: directory renamed /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info -> /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-tomlkit (sysroot):
  /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info moved to /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info moved to /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/_version.py was added
  /usr/lib/python3.14/site-packages/pluggy/_caller.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_compat.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_config.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_decorators.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_execution.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_impl.py was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc was removed
Changes to packages/x86_64-linux/python3-tomlkit-native (sysroot):
  /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info moved to /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info

--===============4004360156642159863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-tomlkit-changelog.txt"

## [Unreleased]
## [0.15.2] - 2026-10-16
### Changed

- Write the ESC control character as `\u001b` instead of `\e`, which is only
  valid in TOML 1.1, so the output stays readable by TOML 1.0 parsers such as
  `tomllib`. ([#641]( ))
- `key_value()` now raises `UnexpectedCharError` on anything other than
  whitespace or a comment after the pair, instead of silently discarding it
  (e.g. `key_value("a = 1 b = 2")`), matching `parse()`. ([#594]( ))
- `integer()` given a string now validates it against the TOML integer grammar
  and keeps the original text, so grouping underscores (e.g. `integer("1_000")`)
  survive `dumps()`; strings that are not valid TOML integers (e.g. `"010"`) now
  raise `ValueError`. ([#336]( ))
- Add a `fold` argument to `DateTime` and `Time`, mirroring the stdlib, and
  carry `fold` through `item()`, arithmetic (including datetime subtraction) and
  `unwrap()`, so a folded local time no longer converts an hour off. ([#619]( ),
  [#623]( ), [#626]( ))
- Declare the project metadata in the PEP 621 `[project]` table; building from
  source now requires `poetry-core>=2.2.0`. ([#607]( ), [#609]( ))

### Fixed

- Fix valid TOML being rejected when an out-of-order table reopens an implicit
  super-table with a dotted key: `[a.b.c]` then `[a]` with `b.z = 1` extends the
  implicit `a.b` super-table rather than redefining it (stdlib `tomllib` accepts
  it), so it now parses and round-trips instead of raising `Redefinition of an
  existing table`. The concrete-table case (`[a.b]` then `[a]` `b.z = 1`) stays
  rejected. ([#565]( ))
- Fix uppercase `E` exponent after a leading-zero mantissa (e.g. `0E2`) being
  rejected as an invalid number while `0e2` parsed fine. ([#586]( ))
- Fix non-lowercase special floats (e.g. `Inf`, `NaN`, `-INF`) being accepted;
  TOML only allows lowercase `inf` and `nan`, so they now raise `ParseError`.
  ([#628]( ))
- Fix parse errors reporting the wrong line and column in documents with CRLF or
  mixed line endings. ([#642]( ))
- Fix `item()` reordering the keys of an inline table (dict-valued keys were
  forced last) under the default `sort_keys=False`. ([#546]( ))
- Fix `unwrap()` moving a key to the end after its value was replaced (e.g.
  `doc["b"] = 9`), while `dumps()` and `keys()` kept the original order.
  ([#591]( ))
- Fix appending a key to a parsed inline table that uses `", "` separators
  emitting a bare `","` for the new entry, leaving the table inconsistently
  spaced (e.g. `{x = 1, y = 2,z = 3}`). ([#595]( ))
- Fix an emptied array of tables being dropped from the output: it now renders
  as `key = []`, placed and keyed relative to the nearest table header so it
  parses back into the same table. ([#567]( ))
- Fix a single-line array whose last element is a trailing comment (e.g. from
  `add_line(value, comment=...)`) rendering its closing `]` on the comment line,
  producing unparseable output. ([#580]( ))
- Fix `del array[start:stop:step]` with a negative or omitted bound removing the
  wrong elements from the rendered output. ([#599]( ))
- Fix array slice assignment mutating the array before raising
  `ValueError("slice assignment is not supported")`. ([#600]( ))
- Fix `String.__add__` splicing the appended text into a basic string without
  escaping it, so appending a quote or backslash produced invalid TOML. ([#612](
  ))
- Fix a bare carriage return in a multiline string producing invalid TOML: it is
  now escaped as `\r` in a multiline basic string and rejected with
  `InvalidStringError` in a multiline literal string; CRLF line endings are left
  intact. ([#539]( ))
- Fix a tz-aware `datetime.time` rendering with a UTC offset (e.g.
  `07:32:00+02:00`), which TOML local times do not allow; it now renders as a
  local time. ([#613]( ))
- Fix arithmetic on a signed float producing `+-0.0` (e.g. `-1.5` times `0`),
  which does not parse. ([#629]( ))
- Fix two `Bool` items never comparing equal to each other; they now compare by
  value. ([#660]( ))

[unreleased]: https://github.com/python-poetry/tomlkit/compare/0.15.2...master
[0.15.2]: https://github.com/python-poetry/tomlkit/releases/tag/0.15.2

--===============4004360156642159863==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-tomlkit-upgrade-0.15.1-0.15.2.patch"

RnJvbSBlYTczMWZiYjRjNGM5N2VkMTdjYjkzZmZiM2QyMmFiZTUyMzRmZDJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgT2N0IDIwMjYgMDU6NDg6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXRvbWxraXQ6IHVwZ3JhZGUgMC4xNS4xIC0+IDAuMTUuMgoKIyMgW1VucmVsZWFzZWRd
CiMjIFswLjE1LjJdIC0gMjAyNi0xMC0xNgojIyMgQ2hhbmdlZAoKLSBXcml0ZSB0aGUgRVNDIGNv
bnRyb2wgY2hhcmFjdGVyIGFzIGBcdTAwMWJgIGluc3RlYWQgb2YgYFxlYCwgd2hpY2ggaXMgb25s
eQogIHZhbGlkIGluIFRPTUwgMS4xLCBzbyB0aGUgb3V0cHV0IHN0YXlzIHJlYWRhYmxlIGJ5IFRP
TUwgMS4wIHBhcnNlcnMgc3VjaCBhcwogIGB0b21sbGliYC4gKFsjNjQxXSggKSkKLSBga2V5X3Zh
bHVlKClgIG5vdyByYWlzZXMgYFVuZXhwZWN0ZWRDaGFyRXJyb3JgIG9uIGFueXRoaW5nIG90aGVy
IHRoYW4KICB3aGl0ZXNwYWNlIG9yIGEgY29tbWVudCBhZnRlciB0aGUgcGFpciwgaW5zdGVhZCBv
ZiBzaWxlbnRseSBkaXNjYXJkaW5nIGl0CiAgKGUuZy4gYGtleV92YWx1ZSgiYSA9IDEgYiA9IDIi
KWApLCBtYXRjaGluZyBgcGFyc2UoKWAuIChbIzU5NF0oICkpCi0gYGludGVnZXIoKWAgZ2l2ZW4g
YSBzdHJpbmcgbm93IHZhbGlkYXRlcyBpdCBhZ2FpbnN0IHRoZSBUT01MIGludGVnZXIgZ3JhbW1h
cgogIGFuZCBrZWVwcyB0aGUgb3JpZ2luYWwgdGV4dCwgc28gZ3JvdXBpbmcgdW5kZXJzY29yZXMg
KGUuZy4gYGludGVnZXIoIjFfMDAwIilgKQogIHN1cnZpdmUgYGR1bXBzKClgOyBzdHJpbmdzIHRo
YXQgYXJlIG5vdCB2YWxpZCBUT01MIGludGVnZXJzIChlLmcuIGAiMDEwImApIG5vdwogIHJhaXNl
IGBWYWx1ZUVycm9yYC4gKFsjMzM2XSggKSkKLSBBZGQgYSBgZm9sZGAgYXJndW1lbnQgdG8gYERh
dGVUaW1lYCBhbmQgYFRpbWVgLCBtaXJyb3JpbmcgdGhlIHN0ZGxpYiwgYW5kCiAgY2FycnkgYGZv
bGRgIHRocm91Z2ggYGl0ZW0oKWAsIGFyaXRobWV0aWMgKGluY2x1ZGluZyBkYXRldGltZSBzdWJ0
cmFjdGlvbikgYW5kCiAgYHVud3JhcCgpYCwgc28gYSBmb2xkZWQgbG9jYWwgdGltZSBubyBsb25n
ZXIgY29udmVydHMgYW4gaG91ciBvZmYuIChbIzYxOV0oICksCiAgWyM2MjNdKCApLCBbIzYyNl0o
ICkpCi0gRGVjbGFyZSB0aGUgcHJvamVjdCBtZXRhZGF0YSBpbiB0aGUgUEVQIDYyMSBgW3Byb2pl
Y3RdYCB0YWJsZTsgYnVpbGRpbmcgZnJvbQogIHNvdXJjZSBub3cgcmVxdWlyZXMgYHBvZXRyeS1j
b3JlPj0yLjIuMGAuIChbIzYwN10oICksIFsjNjA5XSggKSkKCiMjIyBGaXhlZAoKLSBGaXggdmFs
aWQgVE9NTCBiZWluZyByZWplY3RlZCB3aGVuIGFuIG91dC1vZi1vcmRlciB0YWJsZSByZW9wZW5z
IGFuIGltcGxpY2l0CiAgc3VwZXItdGFibGUgd2l0aCBhIGRvdHRlZCBrZXk6IGBbYS5iLmNdYCB0
aGVuIGBbYV1gIHdpdGggYGIueiA9IDFgIGV4dGVuZHMgdGhlCiAgaW1wbGljaXQgYGEuYmAgc3Vw
ZXItdGFibGUgcmF0aGVyIHRoYW4gcmVkZWZpbmluZyBpdCAoc3RkbGliIGB0b21sbGliYCBhY2Nl
cHRzCiAgaXQpLCBzbyBpdCBub3cgcGFyc2VzIGFuZCByb3VuZC10cmlwcyBpbnN0ZWFkIG9mIHJh
aXNpbmcgYFJlZGVmaW5pdGlvbiBvZiBhbgogIGV4aXN0aW5nIHRhYmxlYC4gVGhlIGNvbmNyZXRl
LXRhYmxlIGNhc2UgKGBbYS5iXWAgdGhlbiBgW2FdYCBgYi56ID0gMWApIHN0YXlzCiAgcmVqZWN0
ZWQuIChbIzU2NV0oICkpCi0gRml4IHVwcGVyY2FzZSBgRWAgZXhwb25lbnQgYWZ0ZXIgYSBsZWFk
aW5nLXplcm8gbWFudGlzc2EgKGUuZy4gYDBFMmApIGJlaW5nCiAgcmVqZWN0ZWQgYXMgYW4gaW52
YWxpZCBudW1iZXIgd2hpbGUgYDBlMmAgcGFyc2VkIGZpbmUuIChbIzU4Nl0oICkpCi0gRml4IG5v
bi1sb3dlcmNhc2Ugc3BlY2lhbCBmbG9hdHMgKGUuZy4gYEluZmAsIGBOYU5gLCBgLUlORmApIGJl
aW5nIGFjY2VwdGVkOwogIFRPTUwgb25seSBhbGxvd3MgbG93ZXJjYXNlIGBpbmZgIGFuZCBgbmFu
YCwgc28gdGhleSBub3cgcmFpc2UgYFBhcnNlRXJyb3JgLgogIChbIzYyOF0oICkpCi0gRml4IHBh
cnNlIGVycm9ycyByZXBvcnRpbmcgdGhlIHdyb25nIGxpbmUgYW5kIGNvbHVtbiBpbiBkb2N1bWVu
dHMgd2l0aCBDUkxGIG9yCiAgbWl4ZWQgbGluZSBlbmRpbmdzLiAoWyM2NDJdKCApKQotIEZpeCBg
aXRlbSgpYCByZW9yZGVyaW5nIHRoZSBrZXlzIG9mIGFuIGlubGluZSB0YWJsZSAoZGljdC12YWx1
ZWQga2V5cyB3ZXJlCiAgZm9yY2VkIGxhc3QpIHVuZGVyIHRoZSBkZWZhdWx0IGBzb3J0X2tleXM9
RmFsc2VgLiAoWyM1NDZdKCApKQotIEZpeCBgdW53cmFwKClgIG1vdmluZyBhIGtleSB0byB0aGUg
ZW5kIGFmdGVyIGl0cyB2YWx1ZSB3YXMgcmVwbGFjZWQgKGUuZy4KICBgZG9jWyJiIl0gPSA5YCks
IHdoaWxlIGBkdW1wcygpYCBhbmQgYGtleXMoKWAga2VwdCB0aGUgb3JpZ2luYWwgb3JkZXIuCiAg
KFsjNTkxXSggKSkKLSBGaXggYXBwZW5kaW5nIGEga2V5IHRvIGEgcGFyc2VkIGlubGluZSB0YWJs
ZSB0aGF0IHVzZXMgYCIsICJgIHNlcGFyYXRvcnMKICBlbWl0dGluZyBhIGJhcmUgYCIsImAgZm9y
IHRoZSBuZXcgZW50cnksIGxlYXZpbmcgdGhlIHRhYmxlIGluY29uc2lzdGVudGx5CiAgc3BhY2Vk
IChlLmcuIGB7eCA9IDEsIHkgPSAyLHogPSAzfWApLiAoWyM1OTVdKCApKQotIEZpeCBhbiBlbXB0
aWVkIGFycmF5IG9mIHRhYmxlcyBiZWluZyBkcm9wcGVkIGZyb20gdGhlIG91dHB1dDogaXQgbm93
IHJlbmRlcnMKICBhcyBga2V5ID0gW11gLCBwbGFjZWQgYW5kIGtleWVkIHJlbGF0aXZlIHRvIHRo
ZSBuZWFyZXN0IHRhYmxlIGhlYWRlciBzbyBpdAogIHBhcnNlcyBiYWNrIGludG8gdGhlIHNhbWUg
dGFibGUuIChbIzU2N10oICkpCi0gRml4IGEgc2luZ2xlLWxpbmUgYXJyYXkgd2hvc2UgbGFzdCBl
bGVtZW50IGlzIGEgdHJhaWxpbmcgY29tbWVudCAoZS5nLiBmcm9tCiAgYGFkZF9saW5lKHZhbHVl
LCBjb21tZW50PS4uLilgKSByZW5kZXJpbmcgaXRzIGNsb3NpbmcgYF1gIG9uIHRoZSBjb21tZW50
IGxpbmUsCiAgcHJvZHVjaW5nIHVucGFyc2VhYmxlIG91dHB1dC4gKFsjNTgwXSggKSkKLSBGaXgg
YGRlbCBhcnJheVtzdGFydDpzdG9wOnN0ZXBdYCB3aXRoIGEgbmVnYXRpdmUgb3Igb21pdHRlZCBi
b3VuZCByZW1vdmluZyB0aGUKICB3cm9uZyBlbGVtZW50cyBmcm9tIHRoZSByZW5kZXJlZCBvdXRw
dXQuIChbIzU5OV0oICkpCi0gRml4IGFycmF5IHNsaWNlIGFzc2lnbm1lbnQgbXV0YXRpbmcgdGhl
IGFycmF5IGJlZm9yZSByYWlzaW5nCiAgYFZhbHVlRXJyb3IoInNsaWNlIGFzc2lnbm1lbnQgaXMg
bm90IHN1cHBvcnRlZCIpYC4gKFsjNjAwXSggKSkKLSBGaXggYFN0cmluZy5fX2FkZF9fYCBzcGxp
Y2luZyB0aGUgYXBwZW5kZWQgdGV4dCBpbnRvIGEgYmFzaWMgc3RyaW5nIHdpdGhvdXQKICBlc2Nh
cGluZyBpdCwgc28gYXBwZW5kaW5nIGEgcXVvdGUgb3IgYmFja3NsYXNoIHByb2R1Y2VkIGludmFs
aWQgVE9NTC4gKFsjNjEyXSgKICApKQotIEZpeCBhIGJhcmUgY2FycmlhZ2UgcmV0dXJuIGluIGEg
bXVsdGlsaW5lIHN0cmluZyBwcm9kdWNpbmcgaW52YWxpZCBUT01MOiBpdCBpcwogIG5vdyBlc2Nh
cGVkIGFzIGBccmAgaW4gYSBtdWx0aWxpbmUgYmFzaWMgc3RyaW5nIGFuZCByZWplY3RlZCB3aXRo
CiAgYEludmFsaWRTdHJpbmdFcnJvcmAgaW4gYSBtdWx0aWxpbmUgbGl0ZXJhbCBzdHJpbmc7IENS
TEYgbGluZSBlbmRpbmdzIGFyZSBsZWZ0CiAgaW50YWN0LiAoWyM1MzldKCApKQotIEZpeCBhIHR6
LWF3YXJlIGBkYXRldGltZS50aW1lYCByZW5kZXJpbmcgd2l0aCBhIFVUQyBvZmZzZXQgKGUuZy4K
ICBgMDc6MzI6MDArMDI6MDBgKSwgd2hpY2ggVE9NTCBsb2NhbCB0aW1lcyBkbyBub3QgYWxsb3c7
IGl0IG5vdyByZW5kZXJzIGFzIGEKICBsb2NhbCB0aW1lLiAoWyM2MTNdKCApKQotIEZpeCBhcml0
aG1ldGljIG9uIGEgc2lnbmVkIGZsb2F0IHByb2R1Y2luZyBgKy0wLjBgIChlLmcuIGAtMS41YCB0
aW1lcyBgMGApLAogIHdoaWNoIGRvZXMgbm90IHBhcnNlLiAoWyM2MjldKCApKQotIEZpeCB0d28g
YEJvb2xgIGl0ZW1zIG5ldmVyIGNvbXBhcmluZyBlcXVhbCB0byBlYWNoIG90aGVyOyB0aGV5IG5v
dyBjb21wYXJlIGJ5CiAgdmFsdWUuIChbIzY2MF0oICkpCgpbdW5yZWxlYXNlZF06IGh0dHBzOi8v
Z2l0aHViLmNvbS9weXRob24tcG9ldHJ5L3RvbWxraXQvY29tcGFyZS8wLjE1LjIuLi5tYXN0ZXIK
WzAuMTUuMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9weXRob24tcG9ldHJ5L3RvbWxraXQvcmVsZWFz
ZXMvdGFnLzAuMTUuMgotLS0KIC4uLi97cHl0aG9uMy10b21sa2l0XzAuMTUuMS5iYiA9PiBweXRo
b24zLXRvbWxraXRfMC4xNS4yLmJifSAgICB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24ve3B5dGhvbjMtdG9tbGtpdF8wLjE1LjEuYmIgPT4gcHl0aG9uMy10b21sa2l0XzAuMTUuMi5i
Yn0gKDgzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdG9tbGtpdF8wLjE1LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdG9tbGtpdF8wLjE1LjIuYmIKc2ltaWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRvbWxraXRfMC4xNS4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdG9tbGtpdF8wLjE1LjIu
YmIKaW5kZXggYjBjNTFmMjFjNS4uY2Y2N2NlYTU1MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLXRvbWxraXRfMC4xNS4xLmJiCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10b21sa2l0XzAuMTUuMi5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9yZy9wcm9qZWN0L3RvbWxraXQvIgogTElD
RU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zMWFh
YzBkYmMxYmFiZDI3OGQ1Mzg2ZGFkYjdmOGU4MiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImUy
NWJiZjM4ODQzMDA1MjQ2MjEwYTEyOTgyNzc2ZjI3Zjk5Y2I5YmU2NzE2MGUxNDQzNGQwYzBkMjFl
ZTFlOTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODNlMzI3NTViYTFkMjBkOTM0MGJkMDY5ZWU5
N2U5ZjYyMzJiYTIzNDZiNjNmZmNiYTQyNWRlMDFmN2UzMjdhNiIKIAogaW5oZXJpdCBweXBpIHB5
dGhvbl9wb2V0cnlfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============4004360156642159863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 958 .bb files complete (0 cached, 958 parsed). 1993 targets, 66 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-a5d041262e0c4b87915618eca663a0b370bacc2b"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
meta                 = "tmp-auh-upgrades:a5d041262e0c4b87915618eca663a0b370bacc2b"
meta-yocto-bsp       
meta-poky            = "master:49a2b44583968d321b3195bfd0cb2232dff13950"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 559 Local 504 Mirrors 0 Missed 55 Current 309 (90% match, 93% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 313 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 315 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 330 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 338 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 343 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 356 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_26.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 379 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_qa_setscene)
NOTE: Running setscene task 389 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 390 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 393 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 868 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cython_3.2.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 414 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_package_write_deb_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-cython-native-3.2.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 435 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 443 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 449 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 467 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 471 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 474 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 484 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cython-native-3.2.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-26.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 486 of 868 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cython_3.2.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 487 of 868 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cython_3.2.9.bb:do_create_recipe_spdx_setscene)
NOTE: recipe python3-3.14.7-r0: task do_package_qa_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pluggy/1.6.0/temp/log.do_packagedata_setscene.534705
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 492 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_package_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cython-native-3.2.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-cython-native-3.2.9-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pip-26.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-iniconfig-2.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 494 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 495 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 500 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 501 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 502 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-cython-native-3.2.9-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-cython-native-3.2.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 525 of 868 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cython_3.2.9.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 529 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_setscene)
NOTE: Running setscene task 532 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_create_recipe_spdx_setscene)
NOTE: Running setscene task 547 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-cython-native-3.2.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 830 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_fetch)
NOTE: Running task 838 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_recipe_qa)
NOTE: Running task 839 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_recipe_qa)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 899 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_recipe_qa)
NOTE: recipe python3-3.14.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-cython-native-3.2.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 548 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 551 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 552 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 553 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 554 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 555 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_recipe_qa: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 556 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_spdx_setscene)
NOTE: Running task 922 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_unpack)
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_setscene: Started
NOTE: Running setscene task 571 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 583 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 585 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 588 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.20.3.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 591 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 972 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_patch)
NOTE: Running task 986 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_fetch)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 594 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: Running setscene task 595 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_create_recipe_spdx_setscene)
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 989 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_fetch)
NOTE: Running setscene task 600 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.196.bb:do_packagedata_setscene)
NOTE: Running setscene task 607 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe sed-4.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_fetch: Started
NOTE: recipe ptest-runner-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1024 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_fetch)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_fetch: Succeeded
NOTE: Running task 1057 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_unpack)
NOTE: recipe coreutils-9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1077 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 613 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.78.bb:do_packagedata_setscene)
NOTE: Running setscene task 615 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_fetch: Started
NOTE: Running task 1093 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_fetch)
NOTE: Running task 1095 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_fetch)
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1097 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1098 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_unpack)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_fetch: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 630 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1180 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_unpack)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_fetch: Succeeded
NOTE: Running setscene task 632 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_recipe_spdx_setscene)
NOTE: Running task 1198 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_unpack)
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_fetch: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 633 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 634 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 635 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 637 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_unpack: Succeeded
NOTE: Running task 1218 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_patch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-26.2.1-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.20.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_unpack: Started
NOTE: Running task 1220 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1231 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_unpack)
NOTE: Running task 1232 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_unpack)
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.196-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Started
NOTE: Running setscene task 647 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.78-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 648 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 649 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_unpack: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 653 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_patch: Started
NOTE: Running setscene task 656 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 657 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_create_recipe_spdx_setscene: Succeeded
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 663 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 668 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pip-26.2.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 1247 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_patch)
NOTE: Running task 1253 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_patch: Succeeded
NOTE: Running task 1254 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libyaml-0.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Started
NOTE: Running task 1262 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1281 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_patch)
NOTE: Running task 1296 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: Running task 1302 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_patch)
NOTE: Running setscene task 685 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 690 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.22.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 693 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.48.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 694 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.13.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1335 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_recipe_spdx)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_patch: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1336 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe python3-pip-26.2.1-r0: task do_patch: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1337 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_patch)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_patch: Succeeded
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Started
NOTE: Running task 1340 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_create_recipe_spdx)
NOTE: Running task 1341 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 704 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_packagedata_setscene)
NOTE: recipe libyaml-0.2.5-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-3.14.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 705 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_patch: Succeeded
NOTE: Running setscene task 707 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 708 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.7.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.48-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 710 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 711 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 712 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 713 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 714 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pip-26.2.1-r0: task do_patch: Succeeded
NOTE: Running setscene task 715 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 716 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 719 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-3.14.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 722 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_create_recipe_spdx: Succeeded
NOTE: Running setscene task 723 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.16.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_deploy_source_date_epoch unihash changed to dd0b2ce5d5b7125505ed03ec0e0aaa07bdd74d3d7dce0c3d1a362cabbe6092c1
NOTE: recipe libedit-20260512-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 716 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 718 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpsl/libpsl_0.23.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 719 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 720 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 726 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.54.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 736 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.54.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_4.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.21.0.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20260512-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 751 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.54.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 759 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.42.4.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.54.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 769 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpsl-0.23.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 771 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 776 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 780 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20260512-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 783 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.54.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 790 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 797 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 800 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-4.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.42.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 804 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_4.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.54.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1411 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1412 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1420 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1426 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_recipe_spdx)
NOTE: recipe attr-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20260512-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.54.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1445 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_create_recipe_spdx)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zlib-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-26.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_create_recipe_spdx: Started
NOTE: recipe openssl-4.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_create_recipe_spdx: Started
NOTE: Running setscene task 824 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.2.bb:do_packagedata_setscene)
NOTE: Running task 1482 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1483 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe ncurses-6.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pip-26.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_deploy_source_date_epoch unihash changed to ba877c5612f1a0e715f9701dce2ea49e5b316de9a849738e284d57a0ed871c5f
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 825 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 830 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_deploy_source_date_epoch unihash changed to 9a11a1d70e9fec8433ecee578435de6cc8c9888e5065ad6b883d6c16dad6ebb5
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 835 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1504 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libgcc-16.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 841 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-16.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 850 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_16.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-16.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.6+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 857 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.6+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 866 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 868 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1750 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1831 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1953 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2013 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2014 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2016 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2065 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2091 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure)
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2092 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_configure)
NOTE: Running task 2093 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_configure)
NOTE: recipe python3-pip-26.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2094 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_configure)
NOTE: recipe python3-colorama-0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2095 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_configure)
NOTE: Running task 2096 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_configure)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_configure: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Started
NOTE: Running task 2097 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_configure: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_configure: Succeeded
NOTE: Running task 2098 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_compile)
NOTE: recipe python3-pip-26.2.1-r0: task do_configure: Succeeded
NOTE: Running task 2099 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_configure_ptest_base)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2100 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_compile)
NOTE: recipe python3-colorama-0.4.6-r0: task do_configure: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2101 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_compile)
NOTE: Running task 2102 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_compile)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_compile: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2103 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 7e86448afe1b3e8fcf2e9f542240cb9b328cc75e1ab3c65f36609a2d1377b4f7
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash d5681adb438f1f5ce63d6c8031e04e213e8e4245f5df10a39b7a857bdfac91d8 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5d19ca15ccfc52c758f87c641898c048094c82dd7effd9d29a31d018aa0b03b2', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'd5681adb438f1f5ce63d6c8031e04e213e8e4245f5df10a39b7a857bdfac91d8'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 5d19ca15ccfc52c758f87c641898c048094c82dd7effd9d29a31d018aa0b03b2 -> d5681adb438f1f5ce63d6c8031e04e213e8e4245f5df10a39b7a857bdfac91d8 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_compile: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_compile: Succeeded
NOTE: Running task 2116 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_compile: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2117 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_install)
NOTE: Running task 2118 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_install)
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Started
NOTE: recipe python3-pip-26.2.1-r0: task do_install: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_compile: Succeeded
NOTE: Running task 2119 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_compile_ptest_base)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2120 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_install)
NOTE: recipe python3-colorama-0.4.6-r0: task do_install: Succeeded
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2121 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_install)
NOTE: Running task 2122 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_install: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_install: Succeeded
NOTE: Running task 2123 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_install_ptest_base)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_install_ptest_base: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 2124 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2125 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_populate_sysroot)
NOTE: Running task 2126 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_package)
NOTE: Running task 2127 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_populate_sysroot)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_package: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_package unihash changed to 7594ad066efdea3cdaaa7cb5488d5c859af30ff7dc04e917d40367d1b331acaa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata became valid
NOTE: Running setscene task 868 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running task 2128 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Started
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pip-26.2.1-r0: task do_install: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2130 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_package)
NOTE: recipe python3-pip-26.2.1-r0: task do_package: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_configure: Succeeded
NOTE: Running task 2131 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_configure_ptest_base)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package: Succeeded
NOTE: Running task 2132 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2133 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile)
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_packagedata unihash changed to d97d7e10e478d41b4cf614e05d1dec59b19be256cb8f8ee20a59b6ae91a1bdab
NOTE: Running task 2134 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_create_spdx)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pygments-2.21.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_package unihash changed to 01b2b16f56e48adc34daae31fc798bfff49722d4476ef2de5d68feb16bbbb197
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm became valid
NOTE: Running setscene task 864 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 865 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 866 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 867 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_9.1.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pytest-9.1.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 868 of 868 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.21.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pygments-2.21.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-pip-26.2.1-r0: task do_package: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package: Succeeded
NOTE: Running task 2140 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_packagedata)
NOTE: Running task 2141 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_packagedata)
NOTE: recipe python3-pip-26.2.1-r0: task do_packagedata: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile: Succeeded
NOTE: Running task 2142 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_compile_ptest_base)
NOTE: recipe python3-pip-26.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe libyaml-0.2.5-r0: task do_compile_ptest_base: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pip_26.2.1.bb:do_packagedata unihash changed to 5a5edefe0aeb04fa6f6e6419af52ca8d5912f7e06e03e713489850a89621fa3d
NOTE: Setscene tasks completed
NOTE: Running task 2143 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_write_ipk)
NOTE: Running task 2144 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_write_deb)
NOTE: Running task 2145 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_write_rpm)
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2146 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_qa)
NOTE: Running task 2147 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_create_spdx)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_qa: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2148 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install)
NOTE: recipe libyaml-0.2.5-r0: task do_install: Started
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_write_ipk unihash changed to c3d3fb66722f7e3d20099a61576767128019261d5973feb898cba6d402de19ba
NOTE: recipe libyaml-0.2.5-r0: task do_install: Succeeded
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_qa: Succeeded
NOTE: Running task 2149 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_install_ptest_base)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_qa unihash changed to 496474b31f516a6cd51d78d10bd8b413395831910de8735969a4822bc12861cf
NOTE: recipe libyaml-0.2.5-r0: task do_install_ptest_base: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_write_rpm unihash changed to 98b66f489e82d963622e4df40ef6cb3ec9a52776636b472402ba164d9cf217f4
NOTE: recipe libyaml-0.2.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2150 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_populate_sysroot)
NOTE: Running task 2151 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_package)
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Started
NOTE: recipe libyaml-0.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2152 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-poetry-core-2.5.0-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-poetry-core_2.5.0.bb:do_package_write_deb unihash changed to 43612528152bbc60ceb2ac7a298e1083b9429e812bf606e66e53c01f03146330
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2153 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_configure)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2154 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2155 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_compile)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile: Started
NOTE: recipe libyaml-0.2.5-r0: task do_package: Succeeded
NOTE: Running task 2156 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_packagedata)
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Started
NOTE: recipe libyaml-0.2.5-r0: task do_packagedata: Succeeded
NOTE: Running task 2157 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libyaml/libyaml_0.2.5.bb:do_create_spdx)
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Started
NOTE: recipe libyaml-0.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2158 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_compile_ptest_base)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2159 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_install)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install: Succeeded
NOTE: Running task 2160 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_install_ptest_base)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install_ptest_base: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2161 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package)
NOTE: Running task 2162 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_populate_sysroot)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package: Succeeded
NOTE: Running task 2163 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_packagedata)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_packagedata: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2164 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_create_spdx)
NOTE: Running task 2165 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_write_ipk)
NOTE: Running task 2166 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_write_deb)
NOTE: Running task 2167 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_write_rpm)
NOTE: Running task 2168 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_qa)
NOTE: Running task 2169 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_package_write_ipk)
NOTE: Running task 2170 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_package_write_deb)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_create_spdx: Started
NOTE: Running task 2171 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_package_write_rpm)
NOTE: Running task 2172 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_package_qa)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_ipk: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_deb: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_qa: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_qa: Started
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2173 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_create_package_spdx)
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pyyaml_6.0.3.bb:do_package_qa unihash changed to e305f4115627a96a3e30a1e4b24ee7d7108bbc1fc3483ae3853375e2153ad193
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_create_package_spdx: Started
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-pyyaml-6.0.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-tomlkit-0.15.2-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2174 of 2174 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-tomlkit_0.15.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2174 tasks of which 2060 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-src went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-dbg went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-ptest went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-staticdev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-dev went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-doc went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy-locale went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pluggy went backwards which would break package feeds (from 0:1.7.0-r0 to 0:1.6.0-r0) [version-going-backwards]
ERROR: python3-pluggy-1.6.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============4004360156642159863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-tomlkit: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/tomlkit/tomlkit-0.15.1.tar.gz" to "https://files.pythonhosted.org/packages/source/t/tomlkit/tomlkit-0.15.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-tomlkit: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dbg: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dbg: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dev: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-dev: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-doc: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-doc: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-locale: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-locale: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PKGSIZE changed from 448289 to 470383 (+5%)
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: FILELIST: added "/usr/lib/python3-tomlkit/ptest/tests/test_types.py"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-ptest: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-src: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-src: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-staticdev: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit-staticdev: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: PKGSIZE changed from 537607 to 552662 (+3%)
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: FILELIST: directory renamed /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info -> /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: PV changed from "0.15.1" to "0.15.2"
packages/x86-64-v3-poky-linux/python3-tomlkit/python3-tomlkit: PKGV changed from 0.15.1 [default] to 0.15.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-tomlkit (sysroot):
  /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info moved to /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info
Changes to packages/x86_64-linux/python3-pluggy-native (sysroot):
  /usr/lib/python3.14/site-packages/pluggy-1.7.0.dist-info moved to /usr/lib/python3.14/site-packages/pluggy-1.6.0.dist-info
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_version.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/pluggy/_version.py was added
  /usr/lib/python3.14/site-packages/pluggy/_caller.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_compat.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_config.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_decorators.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_execution.py was removed
  /usr/lib/python3.14/site-packages/pluggy/_impl.py was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_caller.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_compat.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_config.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_decorators.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_execution.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/pluggy/__pycache__/_impl.cpython-314.pyc was removed
Changes to packages/x86_64-linux/python3-tomlkit-native (sysroot):
  /usr/lib/python3.14/site-packages/tomlkit-0.15.1.dist-info moved to /usr/lib/python3.14/site-packages/tomlkit-0.15.2.dist-info

--===============4004360156642159863==--

