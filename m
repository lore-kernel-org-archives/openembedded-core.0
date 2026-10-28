Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37041.1793167562262920824
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Dxb5TZ3t;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=JsmL51ap;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1811d9243-b70b46ff-7e49-4e60-88f9-48e0c74a342b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yavJpcgEFePLFAtq39e79Vedk1UxnjdQ2IomuMzZpn0=;
	b=Dxb5TZ3tLngWpks5CaSaPx6P/WUgLD5xgsV2Aca8ZfltRT971KI+QnOut2A5s0dv
	c0py10X00SX4WS9CxoUQvnX0UyVSht2rHXNCCH924zfqXfQj3x/LC/94/8ZJIKnLfci
	pseXTjQmap1cxIKc0bUHUX7JU8TswE+JkbL2dC2Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yavJpcgEFePLFAtq39e79Vedk1UxnjdQ2IomuMzZpn0=;
	b=JsmL51apxj9dO8mDzXajEVPwqe2DBQsO+tfhhcBuFLreOWE1O8ak15ZaQJAWK5se
	zMBiuTTQCSooFOlPiKm2LUVyJgNmyZEc/7PeCcGHxzSzUmgHONBy2sn8Ao+mWuB8A56
	WK3mcWZ39Ai2ID+eRW+13czYddgmOMgkaZ+y2Hx8=
Content-Type: multipart/mixed; boundary="===============7934798243132493805=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.6.5 SUCCEEDED
Message-ID: <010101a1811d9243-b70b46ff-7e49-4e60-88f9-48e0c74a342b-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248778

--===============7934798243132493805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyasn1* to *0.6.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.6.4-0.6.5.patch
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
From 6a7f5064f64cfabf58d16a973a4618010bb7cc91 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 05:54:05 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.6.4 -> 0.6.5

Revision 0.6.5, released 26-10-2026
---------------------------------------

- GHSA-mm57-4v3p-rchx: Decoded binary REAL mantissas in linear time
  instead of repeatedly shifting a growing integer and slicing the
  remaining bytes (thanks for reporting, manus-use, manus-pi, ucsurf,
  adriank31)
- GHSA-2qm8-x737-gmw5: Reassembled constructed BIT STRING fragments
  in linear time while preserving their decoded bit values, including
  intermediate fragment padding (thanks for reporting, manus-use)
- GHSA-9m75-vc3g-4x39: Reassembled constructed OCTET STRING and
  character-string fragments and indefinite-length ANY content in
  linear time. Nested constructed OCTET STRING fragments now contribute
  their decoded octets (thanks for reporting, alimony, manus-pi, adriank31)
- GHSA-fm9c-5rcf-2q5p: Bounded schemaless container type tracking
  after two distinct tag sets to prevent quadratic CPU use from
  colliding long tag IDs (thanks for reporting, droideck)
---
 .../python/{python3-pyasn1_0.6.4.bb => python3-pyasn1_0.6.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.4.bb => python3-pyasn1_0.6.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
index 086a21ffe8..08b8255a8f 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.4.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "9c447d8431c947fe4c8febc4ed9e760bc29011a5b01e5c74b67025bd9fb8ce81"
+SRC_URI[sha256sum] = "6b11616a6bcf3a40e635f082bb232fa57b5e0dd7f517bd7ddd69ec3794508a47"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.47.1


--===============7934798243132493805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-pyasn1: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_decoder_schemaless.py"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 342710 to 355946 (+4%)
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.5.dist-info
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.6.4" to "0.6.5"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.6.4 [default] to 0.6.5 [default]
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 832755 to 835166 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.5.dist-info

--===============7934798243132493805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pyasn1-changelog.txt"

Revision 0.6.5, released 26-10-2026
---------------------------------------

- GHSA-mm57-4v3p-rchx: Decoded binary REAL mantissas in linear time
  instead of repeatedly shifting a growing integer and slicing the
  remaining bytes (thanks for reporting, manus-use, manus-pi, ucsurf,
  adriank31)
- GHSA-2qm8-x737-gmw5: Reassembled constructed BIT STRING fragments
  in linear time while preserving their decoded bit values, including
  intermediate fragment padding (thanks for reporting, manus-use)
- GHSA-9m75-vc3g-4x39: Reassembled constructed OCTET STRING and
  character-string fragments and indefinite-length ANY content in
  linear time. Nested constructed OCTET STRING fragments now contribute
  their decoded octets (thanks for reporting, alimony, manus-pi, adriank31)
- GHSA-fm9c-5rcf-2q5p: Bounded schemaless container type tracking
  after two distinct tag sets to prevent quadratic CPU use from
  colliding long tag IDs (thanks for reporting, droideck)

--===============7934798243132493805==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.6.4-0.6.5.patch"

RnJvbSA2YTdmNTA2NGY2NGNmYWJmNThkMTZhOTczYTQ2MTgwMTBiYjdjYzkxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDU6NTQ6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5YXNuMTogdXBncmFkZSAwLjYuNCAtPiAwLjYuNQoKUmV2aXNpb24gMC42LjUsIHJl
bGVhc2VkIDI2LTEwLTIwMjYKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CgotIEdIU0EtbW01Ny00djNwLXJjaHg6IERlY29kZWQgYmluYXJ5IFJFQUwgbWFudGlzc2FzIGlu
IGxpbmVhciB0aW1lCiAgaW5zdGVhZCBvZiByZXBlYXRlZGx5IHNoaWZ0aW5nIGEgZ3Jvd2luZyBp
bnRlZ2VyIGFuZCBzbGljaW5nIHRoZQogIHJlbWFpbmluZyBieXRlcyAodGhhbmtzIGZvciByZXBv
cnRpbmcsIG1hbnVzLXVzZSwgbWFudXMtcGksIHVjc3VyZiwKICBhZHJpYW5rMzEpCi0gR0hTQS0y
cW04LXg3MzctZ213NTogUmVhc3NlbWJsZWQgY29uc3RydWN0ZWQgQklUIFNUUklORyBmcmFnbWVu
dHMKICBpbiBsaW5lYXIgdGltZSB3aGlsZSBwcmVzZXJ2aW5nIHRoZWlyIGRlY29kZWQgYml0IHZh
bHVlcywgaW5jbHVkaW5nCiAgaW50ZXJtZWRpYXRlIGZyYWdtZW50IHBhZGRpbmcgKHRoYW5rcyBm
b3IgcmVwb3J0aW5nLCBtYW51cy11c2UpCi0gR0hTQS05bTc1LXZjM2ctNHgzOTogUmVhc3NlbWJs
ZWQgY29uc3RydWN0ZWQgT0NURVQgU1RSSU5HIGFuZAogIGNoYXJhY3Rlci1zdHJpbmcgZnJhZ21l
bnRzIGFuZCBpbmRlZmluaXRlLWxlbmd0aCBBTlkgY29udGVudCBpbgogIGxpbmVhciB0aW1lLiBO
ZXN0ZWQgY29uc3RydWN0ZWQgT0NURVQgU1RSSU5HIGZyYWdtZW50cyBub3cgY29udHJpYnV0ZQog
IHRoZWlyIGRlY29kZWQgb2N0ZXRzICh0aGFua3MgZm9yIHJlcG9ydGluZywgYWxpbW9ueSwgbWFu
dXMtcGksIGFkcmlhbmszMSkKLSBHSFNBLWZtOWMtNXJjZi0ycTVwOiBCb3VuZGVkIHNjaGVtYWxl
c3MgY29udGFpbmVyIHR5cGUgdHJhY2tpbmcKICBhZnRlciB0d28gZGlzdGluY3QgdGFnIHNldHMg
dG8gcHJldmVudCBxdWFkcmF0aWMgQ1BVIHVzZSBmcm9tCiAgY29sbGlkaW5nIGxvbmcgdGFnIElE
cyAodGhhbmtzIGZvciByZXBvcnRpbmcsIGRyb2lkZWNrKQotLS0KIC4uLi9weXRob24ve3B5dGhv
bjMtcHlhc24xXzAuNi40LmJiID0+IHB5dGhvbjMtcHlhc24xXzAuNi41LmJifSB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHlhc24xXzAuNi40LmJiID0+IHB5dGhv
bjMtcHlhc24xXzAuNi41LmJifSAoODMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC42LjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi41LmJiCnNpbWlsYXJpdHkgaW5kZXggODMlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC42
LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFz
bjFfMC42LjUuYmIKaW5kZXggMDg2YTIxZmZlOC4uMDhiODI1NWE4ZiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuNC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi41LmJiCkBAIC0z
LDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwOi8vcHlhc24xLnNvdXJjZWZvcmdlLm5ldC8iCiBM
SUNFTlNFID0gIkJTRC0yLUNsYXVzZSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UucnN0O21kNT0xOTBmNzkyNTM5MDhjOTg2ZTZjYWNmMzgwYzNhNWY2ZCIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjljNDQ3ZDg0MzFjOTQ3ZmU0YzhmZWJjNGVkOWU3NjBiYzI5MDExYTViMDFl
NWM3NGI2NzAyNWJkOWZiOGNlODEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNmIxMTYxNmE2YmNm
M2E0MGU2MzVmMDgyYmIyMzJmYTU3YjVlMGRkN2Y1MTdiZDdkZGQ2OWVjMzc5NDUwOGE0NyIKIAog
aW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEgcHRlc3QtcHl0aG9uLXB5
dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============7934798243132493805==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: added "/usr/lib/python3-pyasn1/ptest/tests/codec/test_decoder_schemaless.py"
packages/x86-64-v3-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info/licenses -> /usr/lib/python3.14/site-packages/pyasn1-0.6.5.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info -> /usr/lib/python3.14/site-packages/pyasn1-0.6.5.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.14/site-packages/pyasn1-0.6.4.dist-info moved to /usr/lib/python3.14/site-packages/pyasn1-0.6.5.dist-info

--===============7934798243132493805==--
