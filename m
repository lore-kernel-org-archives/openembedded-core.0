Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2969.1794721856172776795
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Nov 2026 21:50:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=H45t1bfD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dUse5m4a;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1ddc236b7-a4c39e29-e52e-4730-a71a-a72809314193-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794721855;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=dMYq+IISWORc3/ZPQOz61MVOWHftvdBOQj+CoQpREfo=;
	b=H45t1bfDmlEl4dXXpmspFVukqt63Zg59VLlaYr/xJR/qXSaj0J9wMjYwacnasLXw
	Z+gUDB74OTO8ZdHmDaKF4F+1Two1MKintabG2WxsTvZBD/SWS085pCnhvSf9GH3oozG
	joLj4KhvCsvTvjTdibKtQ3+gbj8yW7vd3p6UnjIU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794721855;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=dMYq+IISWORc3/ZPQOz61MVOWHftvdBOQj+CoQpREfo=;
	b=dUse5m4aWtrflFRPl6tL0hAS4iOaGyQKbf1puZXCULhjEWMGkb2Ozi67QSKMbaFa
	auSjJM7cfEaK+78rwdukHfG+APWs0HDhDjBO6RauJwGMi1DaUamIUIkQaMTgKPl/2jd
	qr7ywMKmwQAXdiHSLe/VO6Lnqo+JAoi4QHEUsK/0=
Content-Type: multipart/mixed; boundary="===============4668140529734298275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] utfcpp: upgrading to 5.0.0 SUCCEEDED
Message-ID: <010101a1ddc236b7-a4c39e29-e52e-4730-a71a-a72809314193-000000@us-west-2.amazonses.com>
Date: Sun, 15 Nov 2026 05:50:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 05:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250227

--===============4668140529734298275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *utfcpp* to *5.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-utfcpp-upgrade-4.2.1-5.0.0.patch
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
From e6971f99512cd5f8fbbe9973223105df39382dd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Nov 2026 05:50:49 +0000
Subject: [PATCH] utfcpp: upgrade 4.2.1 -> 5.0.0

Release 5.0.0
iterator16 - iterator class for UTF-16
replace_invalid16 modern C++ versions
advance16() and distance16()
prior16()
peek_next16()
Fix -Wcharacter-conversion in unchecked::next under C++20.
Modern adapters for "valid16" functions
Checked replace_invalid16()
replace_invalid16() function
is_valid16() function.
find_invalid16
---
 .../recipes-support/utfcpp/{utfcpp_4.2.1.bb => utfcpp_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.2.1.bb => utfcpp_5.0.0.bb} (94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb b/meta/recipes-support/utfcpp/utfcpp_5.0.0.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
rename to meta/recipes-support/utfcpp/utfcpp_5.0.0.bb
index e891b7fc57..5cfdc8d40d 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_5.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c \
 SRC_URI = "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-SRCREV = "3d1ff6dbf54e471c846dff55dda6c8ee10c0ee5c"
+SRCREV = "3218d78a228e45b362d5b499d8dc9f60e6ce2e59"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============4668140529734298275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/utfcpp: SRC_URI changed from "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v4.2.1 file://run-ptest" to "git://github.com/nemtrif/utfcpp;protocol=https;branch=master;tag=v5.0.0 file://run-ptest"
packages/x86-64-v3-poky-linux/utfcpp: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 3602928 to 4028136 (+12%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 64747 to 76715 (+18%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-doc: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-locale: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 336873 to 390145 (+16%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: FILELIST: directory renamed /usr/src/debug/utfcpp/4.2.1/source/utf8 -> /usr/src/debug/utfcpp/5.0.0/source/utf8, directory renamed /usr/src/debug/utfcpp/4.2.1/tests -> /usr/src/debug/utfcpp/5.0.0/tests
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 107333 to 129720 (+21%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-staticdev: PKGV changed from 4.2.1 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PV changed from "4.2.1" to "5.0.0"
packages/x86-64-v3-poky-linux/utfcpp/utfcpp: PKGV changed from 4.2.1 [default] to 5.0.0 [default]

--===============4668140529734298275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="utfcpp-changelog.txt"

Release 5.0.0
iterator16 - iterator class for UTF-16
replace_invalid16 modern C++ versions
advance16() and distance16()
prior16()
peek_next16()
Fix -Wcharacter-conversion in unchecked::next under C++20.
Modern adapters for "valid16" functions
Checked replace_invalid16()
replace_invalid16() function
is_valid16() function.
find_invalid16

--===============4668140529734298275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dbg: PKGSIZE changed from 3602928 to 4028136 (+12%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-dev: PKGSIZE changed from 64747 to 76715 (+18%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-ptest: PKGSIZE changed from 336873 to 390145 (+16%)
packages/x86-64-v3-poky-linux/utfcpp/utfcpp-src: PKGSIZE changed from 107333 to 129720 (+21%)

--===============4668140529734298275==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-utfcpp-upgrade-4.2.1-5.0.0.patch"

RnJvbSBlNjk3MWY5OTUxMmNkNWY4ZmJiZTk5NzMyMjMxMDVkZjM5MzgyZGQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgTm92IDIwMjYgMDU6NTA6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSB1
dGZjcHA6IHVwZ3JhZGUgNC4yLjEgLT4gNS4wLjAKClJlbGVhc2UgNS4wLjAKaXRlcmF0b3IxNiAt
IGl0ZXJhdG9yIGNsYXNzIGZvciBVVEYtMTYKcmVwbGFjZV9pbnZhbGlkMTYgbW9kZXJuIEMrKyB2
ZXJzaW9ucwphZHZhbmNlMTYoKSBhbmQgZGlzdGFuY2UxNigpCnByaW9yMTYoKQpwZWVrX25leHQx
NigpCkZpeCAtV2NoYXJhY3Rlci1jb252ZXJzaW9uIGluIHVuY2hlY2tlZDo6bmV4dCB1bmRlciBD
KysyMC4KTW9kZXJuIGFkYXB0ZXJzIGZvciAidmFsaWQxNiIgZnVuY3Rpb25zCkNoZWNrZWQgcmVw
bGFjZV9pbnZhbGlkMTYoKQpyZXBsYWNlX2ludmFsaWQxNigpIGZ1bmN0aW9uCmlzX3ZhbGlkMTYo
KSBmdW5jdGlvbi4KZmluZF9pbnZhbGlkMTYKLS0tCiAuLi4vcmVjaXBlcy1zdXBwb3J0L3V0ZmNw
cC97dXRmY3BwXzQuMi4xLmJiID0+IHV0ZmNwcF81LjAuMC5iYn0gfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC91dGZjcHAve3V0ZmNwcF80LjIuMS5iYiA9PiB1dGZjcHBfNS4wLjAuYmJ9ICg5NCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF80LjIuMS5i
YiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3V0ZmNwcC91dGZjcHBfNS4wLjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNw
cF80LjIuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvdXRmY3BwL3V0ZmNwcF81
LjAuMC5iYgppbmRleCBlODkxYjdmYzU3Li41Y2ZkYzhkNDBkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC91dGZjcHAvdXRmY3BwXzQuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3V0ZmNwcC91dGZjcHBfNS4wLjAuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZTQyMjRjY2FlY2IxNGQ5NDJjNzFkMzFiZWYy
MGQ3OGMgXAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL25lbXRyaWYvdXRmY3BwO3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYXN0ZXI7dGFnPXYke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly9y
dW4tcHRlc3QiCiAKLVNSQ1JFViA9ICIzZDFmZjZkYmY1NGU0NzFjODQ2ZGZmNTVkZGE2YzhlZTEw
YzBlZTVjIgorU1JDUkVWID0gIjMyMThkNzhhMjI4ZTQ1YjM2MmQ1YjQ5OWQ4ZGM5ZjYwZTZjZTJl
NTkiCiAKIGluaGVyaXQgY21ha2UgcHRlc3QKIAotLSAKMi40Ny4xCgo=

--===============4668140529734298275==--
