Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E8BC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:22:40 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.692.1787116959464326202
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OahDd3rS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4rJxwe5K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a01878b33d-41ebe42f-1186-449d-9d28-a3e2959f4417-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787116958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rHSvdy9I35z+7Vpl0RxH/KKchzZTSaVRtRoIQRGG5r0=;
	b=OahDd3rSDQMVk5EfoAZY1sLNnoHQmRq3oQwqFM3PUYNP3Ba4K7BWKaTN2PFUIgxR
	OSG6/74FBOevlq/AEB+ObbbeoH5022HRZgtfmeW6WVN6QUjC4xnj5mvkxiApJJWZR4g
	R/QQ7wj8hkW0vfaOp+d0aI9qAuPtsSwRNP3D6OtQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787116958;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rHSvdy9I35z+7Vpl0RxH/KKchzZTSaVRtRoIQRGG5r0=;
	b=4rJxwe5KQrxYWQ0ne0EPwyqgpj0P1AwgC9wUUzJP2hgweGQA/FN/LnxjHlPcjV2E
	Mi1nqpFMpgpwiRXAH212T8Z2XBCCalj/MoM8PqxgUiE7nsm1o5mwrYpqFPosaCf/WaD
	T8pcO44giExsqYLHpWNeL7jQxlLzYPMSSs38XxVc=
Content-Type: multipart/mixed; boundary="===============7891514888060421032=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-idna: upgrading to 3.19 SUCCEEDED
Message-ID: <010101a01878b33d-41ebe42f-1186-449d-9d28-a3e2959f4417-000000@us-west-2.amazonses.com>
Date: Wed, 19 Aug 2026 05:22:38 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.19-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 05:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243701

--===============7891514888060421032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-idna* to *3.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-idna-upgrade-3.18-3.19.patch
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
From ba0909596b79a38db6a3ae54bbce8d57d44a895a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 19 Aug 2026 05:07:56 +0000
Subject: [PATCH] python3-idna: upgrade 3.18 -> 3.19

Source: HISTORY.md

## 3.19 (2026-08-XX)

- Restore the `std3_rules` option, which had no effect since changes
  to UTS #46 processing in Unicode 16. Note that `uts46_remap()`
  defaults to enabling STD3 rules, so direct callers will see input
  containing non-LDH ASCII characters rejected again.
- Performance improvements to UTS #46 mapping, particularly for
  ASCII-only domains.
- Test on free-threaded CPython with the GIL disabled and document
  thread safety.
- Expose the Unicode version of the generated tables as
  `idna.unicode_version`, and show it in `idna --version`.
- Add `code`, `text`, `codepoint` and `position` attributes to
  `IDNAError` so that the failed rule and the offending character can
  be identified without parsing the exception message.
- The deprecated `transitional` argument to `encode()` and
  `uts46_remap()` is now completely ignored, and gives a deprecation warning
  for the latter.
- Reject A-labels that are not the canonical Punycode encoding of
  their U-label.
- Fix CONTEXTJ violations raising `IDNAError` instead of
  `InvalidCodepointContext`.
- Consistently raise `IDNAError` for empty labels and non-ASCII bytes
  passed to label helper functions and the incremental codec.
- Add property-based tests, extended fuzzing targets, coverage
  measurement, and CI checks that the data tables match the generator
  output.
- Various code quality and tooling improvements.

Thanks to stefan6419846, LouieLuNZ, and Salvatore Corvaglia for
contributions to this release.
---
 .../python/{python3-idna_3.18.bb => python3-idna_3.19.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.18.bb => python3-idna_3.19.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.18.bb b/meta/recipes-devtools/python/python3-idna_3.19.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-idna_3.18.bb
rename to meta/recipes-devtools/python/python3-idna_3.19.bb
index 70405819e7..b5a9716093 100644
--- a/meta/recipes-devtools/python/python3-idna_3.18.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.19.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause AND Python-2.0 AND Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9a6c29079fc90c29d80332f44d2625f2"
 
-SRC_URI[sha256sum] = "ffb385a7e039654cef1ab9ef32c6fafe283c0c0467bba1d9029738ce4a14a848"
+SRC_URI[sha256sum] = "5e0811a4383b21dc5838069f801c4fb62113b7447663d2530d2bd6e77b49bf15"
 
 inherit pypi python_flit_core ptest-python-pytest
 
-- 
2.47.1


--===============7891514888060421032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-idna: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna: SRC_URI changed from "https://files.pythonhosted.org/packages/source/i/idna/idna-3.18.tar.gz;downloadfilename=idna-3.18.tar.gz" to "https://files.pythonhosted.org/packages/source/i/idna/idna-3.19.tar.gz;downloadfilename=idna-3.19.tar.gz"
packages/x86-64-v3-poky-linux/python3-idna: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dbg: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-dev: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-doc: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-locale: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: FILELIST: added "/usr/lib/python3-idna/ptest/tests/test_idna_fuzz_targets.py /usr/lib/python3-idna/ptest/tests/test_idna_errors.py /usr/lib/python3-idna/ptest/tests/fuzz_idna_api.py /usr/lib/python3-idna/ptest/tests/test_idna_concurrency.py /usr/lib/python3-idna/ptest/tests/test_idna_properties.py /usr/lib/python3-idna/ptest/tests/fuzz_idna_codec.py"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: PKGSIZE changed from 1499519 to 1545330 (+3%)
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-src: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna-staticdev: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PV changed from "3.18" to "3.19"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.18.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.19.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/idna-3.18.dist-info -> /usr/lib/python3.14/site-packages/idna-3.19.dist-info
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGV changed from 3.18 [default] to 3.19 [default]
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: PKGSIZE changed from 497478 to 513794 (+3%)
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.18.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.19.dist-info

--===============7891514888060421032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-idna/python3-idna-ptest: FILELIST: added "/usr/lib/python3-idna/ptest/tests/fuzz_idna_codec.py /usr/lib/python3-idna/ptest/tests/test_idna_errors.py /usr/lib/python3-idna/ptest/tests/fuzz_idna_api.py /usr/lib/python3-idna/ptest/tests/test_idna_concurrency.py /usr/lib/python3-idna/ptest/tests/test_idna_properties.py /usr/lib/python3-idna/ptest/tests/test_idna_fuzz_targets.py"
packages/x86-64-v3-poky-linux/python3-idna/python3-idna: FILELIST: directory renamed /usr/lib/python3.14/site-packages/idna-3.18.dist-info/licenses -> /usr/lib/python3.14/site-packages/idna-3.19.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/idna-3.18.dist-info -> /usr/lib/python3.14/site-packages/idna-3.19.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-idna (sysroot):
  /usr/lib/python3.14/site-packages/idna-3.18.dist-info moved to /usr/lib/python3.14/site-packages/idna-3.19.dist-info

--===============7891514888060421032==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-idna-upgrade-3.18-3.19.patch"

RnJvbSBiYTA5MDk1OTZiNzlhMzhkYjZhM2FlNTRiYmNlOGQ1N2Q0NGE4OTVhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTkgQXVnIDIwMjYgMDU6MDc6NTYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWlkbmE6IHVwZ3JhZGUgMy4xOCAtPiAzLjE5CgpTb3VyY2U6IEhJU1RPUlkubWQKCiMj
IDMuMTkgKDIwMjYtMDgtWFgpCgotIFJlc3RvcmUgdGhlIGBzdGQzX3J1bGVzYCBvcHRpb24sIHdo
aWNoIGhhZCBubyBlZmZlY3Qgc2luY2UgY2hhbmdlcwogIHRvIFVUUyAjNDYgcHJvY2Vzc2luZyBp
biBVbmljb2RlIDE2LiBOb3RlIHRoYXQgYHV0czQ2X3JlbWFwKClgCiAgZGVmYXVsdHMgdG8gZW5h
YmxpbmcgU1REMyBydWxlcywgc28gZGlyZWN0IGNhbGxlcnMgd2lsbCBzZWUgaW5wdXQKICBjb250
YWluaW5nIG5vbi1MREggQVNDSUkgY2hhcmFjdGVycyByZWplY3RlZCBhZ2Fpbi4KLSBQZXJmb3Jt
YW5jZSBpbXByb3ZlbWVudHMgdG8gVVRTICM0NiBtYXBwaW5nLCBwYXJ0aWN1bGFybHkgZm9yCiAg
QVNDSUktb25seSBkb21haW5zLgotIFRlc3Qgb24gZnJlZS10aHJlYWRlZCBDUHl0aG9uIHdpdGgg
dGhlIEdJTCBkaXNhYmxlZCBhbmQgZG9jdW1lbnQKICB0aHJlYWQgc2FmZXR5LgotIEV4cG9zZSB0
aGUgVW5pY29kZSB2ZXJzaW9uIG9mIHRoZSBnZW5lcmF0ZWQgdGFibGVzIGFzCiAgYGlkbmEudW5p
Y29kZV92ZXJzaW9uYCwgYW5kIHNob3cgaXQgaW4gYGlkbmEgLS12ZXJzaW9uYC4KLSBBZGQgYGNv
ZGVgLCBgdGV4dGAsIGBjb2RlcG9pbnRgIGFuZCBgcG9zaXRpb25gIGF0dHJpYnV0ZXMgdG8KICBg
SUROQUVycm9yYCBzbyB0aGF0IHRoZSBmYWlsZWQgcnVsZSBhbmQgdGhlIG9mZmVuZGluZyBjaGFy
YWN0ZXIgY2FuCiAgYmUgaWRlbnRpZmllZCB3aXRob3V0IHBhcnNpbmcgdGhlIGV4Y2VwdGlvbiBt
ZXNzYWdlLgotIFRoZSBkZXByZWNhdGVkIGB0cmFuc2l0aW9uYWxgIGFyZ3VtZW50IHRvIGBlbmNv
ZGUoKWAgYW5kCiAgYHV0czQ2X3JlbWFwKClgIGlzIG5vdyBjb21wbGV0ZWx5IGlnbm9yZWQsIGFu
ZCBnaXZlcyBhIGRlcHJlY2F0aW9uIHdhcm5pbmcKICBmb3IgdGhlIGxhdHRlci4KLSBSZWplY3Qg
QS1sYWJlbHMgdGhhdCBhcmUgbm90IHRoZSBjYW5vbmljYWwgUHVueWNvZGUgZW5jb2Rpbmcgb2YK
ICB0aGVpciBVLWxhYmVsLgotIEZpeCBDT05URVhUSiB2aW9sYXRpb25zIHJhaXNpbmcgYElETkFF
cnJvcmAgaW5zdGVhZCBvZgogIGBJbnZhbGlkQ29kZXBvaW50Q29udGV4dGAuCi0gQ29uc2lzdGVu
dGx5IHJhaXNlIGBJRE5BRXJyb3JgIGZvciBlbXB0eSBsYWJlbHMgYW5kIG5vbi1BU0NJSSBieXRl
cwogIHBhc3NlZCB0byBsYWJlbCBoZWxwZXIgZnVuY3Rpb25zIGFuZCB0aGUgaW5jcmVtZW50YWwg
Y29kZWMuCi0gQWRkIHByb3BlcnR5LWJhc2VkIHRlc3RzLCBleHRlbmRlZCBmdXp6aW5nIHRhcmdl
dHMsIGNvdmVyYWdlCiAgbWVhc3VyZW1lbnQsIGFuZCBDSSBjaGVja3MgdGhhdCB0aGUgZGF0YSB0
YWJsZXMgbWF0Y2ggdGhlIGdlbmVyYXRvcgogIG91dHB1dC4KLSBWYXJpb3VzIGNvZGUgcXVhbGl0
eSBhbmQgdG9vbGluZyBpbXByb3ZlbWVudHMuCgpUaGFua3MgdG8gc3RlZmFuNjQxOTg0NiwgTG91
aWVMdU5aLCBhbmQgU2FsdmF0b3JlIENvcnZhZ2xpYSBmb3IKY29udHJpYnV0aW9ucyB0byB0aGlz
IHJlbGVhc2UuCi0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1pZG5hXzMuMTguYmIgPT4gcHl0aG9u
My1pZG5hXzMuMTkuYmJ9ICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97
cHl0aG9uMy1pZG5hXzMuMTguYmIgPT4gcHl0aG9uMy1pZG5hXzMuMTkuYmJ9ICg4NCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWlkbmFfMy4xOC5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTkuYmIKc2lt
aWxhcml0eSBpbmRleCA4NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWlkbmFfMy4xOC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWlkbmFfMy4xOS5iYgppbmRleCA3MDQwNTgxOWU3Li5iNWE5NzE2MDkzIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtaWRuYV8zLjE4
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1pZG5hXzMuMTku
YmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQQUdFID0gImh0dHBzOi8vZ2l0aHViLmNvbS9ramQvaWRu
YSIKIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlIEFORCBQeXRob24tMi4wIEFORCBVbmljb2RlLVRP
VSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UubWQ7bWQ1PTlhNmMyOTA3OWZj
OTBjMjlkODAzMzJmNDRkMjYyNWYyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZmZiMzg1YTdl
MDM5NjU0Y2VmMWFiOWVmMzJjNmZhZmUyODNjMGMwNDY3YmJhMWQ5MDI5NzM4Y2U0YTE0YTg0OCIK
K1NSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZTA4MTFhNDM4M2IyMWRjNTgzODA2OWY4MDFjNGZiNjIx
MTNiNzQ0NzY2M2QyNTMwZDJiZDZlNzdiNDliZjE1IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2Zs
aXRfY29yZSBwdGVzdC1weXRob24tcHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============7891514888060421032==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-idna-changelog.txt"

Changelog for python3-idna: 3.18 -> 3.19
Source: HISTORY.md

## 3.19 (2026-08-XX)

- Restore the `std3_rules` option, which had no effect since changes
  to UTS #46 processing in Unicode 16. Note that `uts46_remap()`
  defaults to enabling STD3 rules, so direct callers will see input
  containing non-LDH ASCII characters rejected again.
- Performance improvements to UTS #46 mapping, particularly for
  ASCII-only domains.
- Test on free-threaded CPython with the GIL disabled and document
  thread safety.
- Expose the Unicode version of the generated tables as
  `idna.unicode_version`, and show it in `idna --version`.
- Add `code`, `text`, `codepoint` and `position` attributes to
  `IDNAError` so that the failed rule and the offending character can
  be identified without parsing the exception message.
- The deprecated `transitional` argument to `encode()` and
  `uts46_remap()` is now completely ignored, and gives a deprecation warning
  for the latter.
- Reject A-labels that are not the canonical Punycode encoding of
  their U-label.
- Fix CONTEXTJ violations raising `IDNAError` instead of
  `InvalidCodepointContext`.
- Consistently raise `IDNAError` for empty labels and non-ASCII bytes
  passed to label helper functions and the incremental codec.
- Add property-based tests, extended fuzzing targets, coverage
  measurement, and CI checks that the data tables match the generator
  output.
- Various code quality and tooling improvements.

Thanks to stefan6419846, LouieLuNZ, and Salvatore Corvaglia for
contributions to this release.

--===============7891514888060421032==--

