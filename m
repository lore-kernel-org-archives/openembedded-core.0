Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36492.1795585771384351184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VzNC1wPg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Ko6XMjZf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a211408d5d-c67fc70e-35bd-492d-8957-54ed430bedeb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585773;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=HuGD5ZocrEvCUA+HSCTqV94rNIgxITXP+V5pk1DDu0Q=;
	b=VzNC1wPgIGzb/vDuqycSXhstNNBnoWDgEaSb5I+llnkmj1myfWAB47wl1fBUCob7
	OkYs73VqeCjCIr5Gkc/wJYjwWtO8RAX3eLP0nFPBfsxeOYZHx2RI26dGXgEOrb9bmV1
	Lbns0yHIJGeAZdpEOZVp793DNqJNzEKv7mRrWrFI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585773;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=HuGD5ZocrEvCUA+HSCTqV94rNIgxITXP+V5pk1DDu0Q=;
	b=Ko6XMjZfq978x9DYBv4vyJUbkfpu9vaO7+fK+Ufg+H0WFYzSkWI/wdQL3lEizQQF
	tDbtoIFV4ugJtU7zm324OBRWZgRlcBQ/s5w3J2lokFpOJlWsFB7ULzfi//oz5i6f9r3
	00Xp8886E88sJSl4pSxR+QDUaKZYJwfGc/mAmiYY=
Content-Type: multipart/mixed; boundary="===============3302229656992367844=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 5.0.3 SUCCEEDED
Message-ID: <010101a211408d5d-c67fc70e-35bd-492d-8957-54ed430bedeb-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:32 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251157

--===============3302229656992367844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *screen* to *5.0.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-screen-upgrade-5.0.2-5.0.3.patch
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
From 49f9d1a065bb6dd2c8adb1cfbc74b496d147acef Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:41:06 +0000
Subject: [PATCH] screen: upgrade 5.0.2 -> 5.0.3

Version 5.0.3 (25/11/26):
---
 .../screen/{screen_5.0.2.bb => screen_5.0.3.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.2.bb => screen_5.0.3.bb} (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.2.bb b/meta/recipes-extended/screen/screen_5.0.3.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.2.bb
rename to meta/recipes-extended/screen/screen_5.0.3.bb
index b88d3e7346..b9831cafae 100644
--- a/meta/recipes-extended/screen/screen_5.0.2.bb
+++ b/meta/recipes-extended/screen/screen_5.0.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            "
 
-SRC_URI[sha256sum] = "ca9a2c7e240919bc7ac12124593ae4529bb4eb5f7349d8857829b7e3f0b3b332"
+SRC_URI[sha256sum] = "941c98ffecdca4bff4bbd1cd6f08fbd18967353affc46521040a999dafbd39a2"
 
 inherit autotools-brokensep texinfo
 
-- 
2.47.1


--===============3302229656992367844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/screen: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen: SRC_URI changed from "https://ftpmirror.gnu.org//screen/screen-5.0.2.tar.gz file://screen.pam" to "https://ftpmirror.gnu.org//screen/screen-5.0.3.tar.gz file://screen.pam"
packages/x86-64-v3-poky-linux/screen: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen-dbg: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-dbg: PKGSIZE changed from 1373128 to 1375192 (+0%)
packages/x86-64-v3-poky-linux/screen/screen-dbg: FILELIST: removed "/usr/bin/.debug/screen-5.0.2", added "/usr/bin/.debug/screen-5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-dbg: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen-dev: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-dev: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen-doc: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-doc: PKGSIZE changed from 166092 to 166062 (-0%)
packages/x86-64-v3-poky-linux/screen/screen-doc: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen-locale: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-locale: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen-src: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-src: PKGSIZE changed from 957472 to 959727 (+0%)
packages/x86-64-v3-poky-linux/screen/screen-src: FILELIST: directory renamed /usr/src/debug/screen/5.0.2 -> /usr/src/debug/screen/5.0.3
packages/x86-64-v3-poky-linux/screen/screen-src: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen-staticdev: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen-staticdev: PKGV changed from 5.0.2 [default] to 5.0.3 [default]
packages/x86-64-v3-poky-linux/screen/screen: PV changed from "5.0.2" to "5.0.3"
packages/x86-64-v3-poky-linux/screen/screen: PKGSIZE changed from 757093 to 761189 (+1%)
packages/x86-64-v3-poky-linux/screen/screen: FILELIST: removed "/usr/bin/screen-5.0.2", added "/usr/bin/screen-5.0.3"
packages/x86-64-v3-poky-linux/screen/screen: PKGV changed from 5.0.2 [default] to 5.0.3 [default]

--===============3302229656992367844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/screen/screen: FILELIST: removed "/usr/bin/screen-5.0.2", added "/usr/bin/screen-5.0.3"

--===============3302229656992367844==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-screen-upgrade-5.0.2-5.0.3.patch"

RnJvbSA0OWY5ZDFhMDY1YmI2ZGQyYzhhZGIxY2ZiYzc0YjQ5NmQxNDdhY2VmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6NDE6MDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
Y3JlZW46IHVwZ3JhZGUgNS4wLjIgLT4gNS4wLjMKClZlcnNpb24gNS4wLjMgKDI1LzExLzI2KToK
LS0tCiAuLi4vc2NyZWVuL3tzY3JlZW5fNS4wLjIuYmIgPT4gc2NyZWVuXzUuMC4zLmJifSAgICAg
ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2NyZWVuL3tzY3JlZW5fNS4w
LjIuYmIgPT4gc2NyZWVuXzUuMC4zLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9zY3JlZW4vc2NyZWVuXzUuMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L3NjcmVlbi9zY3JlZW5fNS4wLjMuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3NjcmVlbi9zY3JlZW5fNS4wLjIuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4vc2NyZWVuXzUuMC4zLmJiCmluZGV4IGI4OGQzZTcz
NDYuLmI5ODMxY2FmYWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4v
c2NyZWVuXzUuMC4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4vc2NyZWVu
XzUuMC4zLmJiCkBAIC0yMCw3ICsyMCw3IEBAIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS9zY3Jl
ZW4vc2NyZWVuLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgICR7QGJiLnV0aWxzLmNvbnRhaW5z
KCdESVNUUk9fRkVBVFVSRVMnLCAncGFtJywgJ2ZpbGU6Ly9zY3JlZW4ucGFtJywgJycsIGQpfSBc
CiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNhOWEyYzdlMjQwOTE5YmM3
YWMxMjEyNDU5M2FlNDUyOWJiNGViNWY3MzQ5ZDg4NTc4MjliN2UzZjBiM2IzMzIiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiOTQxYzk4ZmZlY2RjYTRiZmY0YmJkMWNkNmYwOGZiZDE4OTY3MzUzYWZm
YzQ2NTIxMDQwYTk5OWRhZmJkMzlhMiIKIAogaW5oZXJpdCBhdXRvdG9vbHMtYnJva2Vuc2VwIHRl
eGluZm8KIAotLSAKMi40Ny4xCgo=

--===============3302229656992367844==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="screen-changelog.txt"

Version 5.0.3 (25/11/26):

--===============3302229656992367844==--
