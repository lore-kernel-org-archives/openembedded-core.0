Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232DBC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 06:52:58 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2756.1790319174725099571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Sep 2026 23:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PtX8pomv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=wog3uVJH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0d756a09b-aaa6c8fc-07cc-4951-a12e-bfe65722270b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790319173;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=Y8WF62vApws3nlu7pRQmhPi2IanKRPUW1k70ui33yMw=;
	b=PtX8pomvK79Uk4b9dOgFH4tX8QH7IzppQTXs/yr3NWE/pBHp91LStuo2Iu7UP0F0
	ksFL6u3t0nnk4zJ5CIKlp35xMXJamm4nEfnOm6jlXi5DpbG6UNzJt/KNc9x+vwQ0U0x
	nRhHBOxiyRYBaL7TlIHlH6nSLVK5qW1k373e2tM4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790319173;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=Y8WF62vApws3nlu7pRQmhPi2IanKRPUW1k70ui33yMw=;
	b=wog3uVJHdcCkvNtOD0GWHiwSssd7JpnOiNBTX1stHj8T7jlKdgPWvO+TJvVXtbnB
	czVfPTi31JhAM1lzVD/YdqOyOJ/GxuRgMRB2vHycJ32fyJY8xRbcrYhPIP/YVXkOwHp
	94JuZfIc06f7xEOpcDRTvOKZMAV3HwS06+3htOpI=
Content-Type: multipart/mixed; boundary="===============3955404213459684487=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpam: upgrading to 1.7.3 SUCCEEDED
Message-ID: <010101a0d756a09b-aaa6c8fc-07cc-4951-a12e-bfe65722270b-000000@us-west-2.amazonses.com>
Date: Fri, 25 Sep 2026 06:52:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.25-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 06:52:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246601

--===============3955404213459684487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpam* to *1.7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpam-upgrade-1.7.2-1.7.3.patch
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
From 6f63de51711b4d309ef64faec9dbd666fb40930f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 25 Sep 2026 05:28:13 +0000
Subject: [PATCH] libpam: upgrade 1.7.2 -> 1.7.3

Release 1.7.3
---
 meta/recipes-extended/pam/{libpam_1.7.2.bb => libpam_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/pam/{libpam_1.7.2.bb => libpam_1.7.3.bb} (98%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.2.bb b/meta/recipes-extended/pam/libpam_1.7.3.bb
similarity index 98%
rename from meta/recipes-extended/pam/libpam_1.7.2.bb
rename to meta/recipes-extended/pam/libpam_1.7.3.bb
index e268ff4faa..31e14a724a 100644
--- a/meta/recipes-extended/pam/libpam_1.7.2.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.3.bb
@@ -24,7 +24,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
+SRC_URI[sha256sum] = "2ce4765fd49df6693771ef2941f81e33d8ee14b94a81a5c7b369aa3b137b85a5"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-- 
2.47.1


--===============3955404213459684487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpam-changelog.txt"

Release 1.7.3

--===============3955404213459684487==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpam-upgrade-1.7.2-1.7.3.patch"

RnJvbSA2ZjYzZGU1MTcxMWI0ZDMwOWVmNjRmYWVjOWRiZDY2NmZiNDA5MzBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMjUgU2VwIDIwMjYgMDU6Mjg6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwYW06IHVwZ3JhZGUgMS43LjIgLT4gMS43LjMKClJlbGVhc2UgMS43LjMKLS0tCiBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvcGFtL3tsaWJwYW1fMS43LjIuYmIgPT4gbGlicGFtXzEuNy4zLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9wYW0ve2xpYnBhbV8xLjcuMi5iYiA9PiBsaWJwYW1f
MS43LjMuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9s
aWJwYW1fMS43LjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvcGFtL2xpYnBhbV8xLjcuMy5i
YgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
cGFtL2xpYnBhbV8xLjcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9s
aWJwYW1fMS43LjMuYmIKaW5kZXggZTI2OGZmNGZhYS4uMzFlMTRhNzI0YSAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjIuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3BhbS9saWJwYW1fMS43LjMuYmIKQEAgLTI0LDcgKzI0LDcgQEAgU1JDX1VS
SSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvdiR7UFZ9L0xpbnV4LVBBTS0ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vcGFtLXZvbGF0aWxlcy5jb25mIFwKICAgICAgICAg
ICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2Q4NmI2MzgzZmI1ZmQ5ZWI5NTc4ZDJjZDQ3
ZDkyODAxMTkxZjRiZjNmOWJjNjE0MTliZmVmYzhhYTFlNTMxYSIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyY2U0NzY1ZmQ0OWRmNjY5Mzc3MWVmMjk0MWY4MWUzM2Q4ZWUxNGI5NGE4MWE1YzdiMzY5
YWEzYjEzN2I4NWE1IgogCiBERVBFTkRTID0gImJpc29uLW5hdGl2ZSBmbGV4LW5hdGl2ZSBsaWJ4
bWwyLW5hdGl2ZSB2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjQ3LjEKCg==

--===============3955404213459684487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpam: PACKAGES: added "libpam-locale-kab"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-lt: PKGSIZE changed from 558 to 3384 (+506%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sr: PKGSIZE changed from 9013 to 13147 (+46%)

--===============3955404213459684487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpam: PACKAGES: added "libpam-locale-kab"
packages/x86-64-v3-poky-linux/libpam: SRC_URI changed from "https://github.com/linux-pam/linux-pam/releases/download/v1.7.2/Linux-PAM-1.7.2.tar.xz file://99_pam file://pam.d/common-account file://pam.d/common-auth file://pam.d/common-password file://pam.d/common-session file://pam.d/common-session-noninteractive file://pam.d/other file://run-ptest file://pam-volatiles.conf" to "https://github.com/linux-pam/linux-pam/releases/download/v1.7.3/Linux-PAM-1.7.3.tar.xz file://99_pam file://pam.d/common-account file://pam.d/common-auth file://pam.d/common-password file://pam.d/common-session file://pam.d/common-session-noninteractive file://pam.d/other file://run-ptest file://pam-volatiles.conf"
packages/x86-64-v3-poky-linux/libpam: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-dbg: PKGSIZE changed from 2183232 to 2189184 (+0%)
packages/x86-64-v3-poky-linux/libpam/libpam-dbg: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-dbg: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-dev: PKGSIZE changed from 51153 to 51193 (+0%)
packages/x86-64-v3-poky-linux/libpam/libpam-dev: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-dev: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-doc: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-doc: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-af: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-af: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-am: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-am: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ar: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ar: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-as: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-as: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-az: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-az: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-be: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-be: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bg: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bg: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bn-in: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bn-in: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bn: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bn: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bs: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-bs: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ca: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ca: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-cs: PKGSIZE changed from 10214 to 10615 (+4%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-cs: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-cs: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-cy: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-cy: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-da: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-da: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-de-ch: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-de-ch: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-de: PKGSIZE changed from 10379 to 10462 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-de: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-de: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-el: PKGSIZE changed from 1807 to 1936 (+7%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-el: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-el: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-eo: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-eo: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-es: PKGSIZE changed from 10562 to 10642 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-es: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-es: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-et: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-et: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-eu: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-eu: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fa: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fa: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fi: PKGSIZE changed from 10241 to 10323 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fi: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fi: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-fr: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ga: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ga: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-gl: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-gl: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-gu: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-gu: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-he: PKGSIZE changed from 11023 to 11101 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-he: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-he: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hi: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hi: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hr: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hu: PKGSIZE changed from 10616 to 10695 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hu: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-hu: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ia: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ia: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-id: PKGSIZE changed from 9916 to 9997 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-id: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-id: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-is: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-is: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-it: PKGSIZE changed from 10208 to 10286 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-it: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-it: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ja: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ja: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ka: PKGSIZE changed from 15556 to 15696 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ka: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ka: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kk: PKGSIZE changed from 12817 to 12932 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kk: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kk: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-km: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-km: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kn: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kn: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ko: PKGSIZE changed from 10664 to 10765 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ko: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ko: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kw-gb: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-kw-gb: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ky: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ky: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-lt: PKGSIZE changed from 558 to 3384 (+506%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-lt: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-lt: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-lv: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-lv: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-mk: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-mk: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ml: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ml: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-mn: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-mn: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-mr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-mr: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ms: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ms: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-my: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-my: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nb: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nb: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ne: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ne: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nl: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nl: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nn: PKGSIZE changed from 9401 to 9942 (+6%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nn: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-nn: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-or: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-or: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pa: PKGSIZE changed from 14680 to 14846 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pa: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pa: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pl: PKGSIZE changed from 10431 to 10498 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pl: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pl: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pt-br: PKGSIZE changed from 9987 to 10056 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pt-br: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pt-br: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pt: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-pt: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ro: PKGSIZE changed from 10695 to 10775 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ro: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ro: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ru: PKGSIZE changed from 13453 to 13691 (+2%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ru: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ru: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-si: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-si: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sk: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sk: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sl: PKGSIZE changed from 10293 to 10364 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sl: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sl: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sq: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sq: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sr+latin: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sr+latin: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sr: PKGSIZE changed from 9013 to 13147 (+46%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sr: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sv: PKGSIZE changed from 10040 to 10117 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sv: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-sv: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ta: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ta: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-te: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-te: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-tg: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-tg: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-th: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-th: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-tr: PKGSIZE changed from 10139 to 10215 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-tr: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-tr: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-uk: PKGSIZE changed from 13491 to 13604 (+1%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-uk: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-uk: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ur: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-ur: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-vi: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-vi: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-yo: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-yo: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-cn: PKGSIZE changed from 9070 to 9479 (+5%)
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-cn: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-cn: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-hk: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-hk: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-tw: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zh-tw: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zu: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-locale-zu: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-ptest: PKGSIZE changed from 274595 to 274195 (-0%)
packages/x86-64-v3-poky-linux/libpam/libpam-ptest: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-ptest: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-runtime: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-runtime: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-src: PKGSIZE changed from 1061044 to 1064901 (+0%)
packages/x86-64-v3-poky-linux/libpam/libpam-src: FILELIST: directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_namespace -> /usr/src/debug/libpam/1.7.3/modules/pam_namespace, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_usertype -> /usr/src/debug/libpam/1.7.3/modules/pam_usertype, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_canonicalize_user -> /usr/src/debug/libpam/1.7.3/modules/pam_canonicalize_user, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_limits -> /usr/src/debug/libpam/1.7.3/modules/pam_limits, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_rootok -> /usr/src/debug/libpam/1.7.3/modules/pam_rootok, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_securetty -> /usr/src/debug/libpam/1.7.3/modules/pam_securetty, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_succeed_if -> /usr/src/debug/libpam/1.7.3/modules/pam_succeed_if, directory renamed /usr/src/debug/libpam/1.7.2/libpam_internal -> /usr/src/debug/l
 ibpam/1.7.3/libpam_internal, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_echo -> /usr/src/debug/libpam/1.7.3/modules/pam_echo, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_rhosts -> /usr/src/debug/libpam/1.7.3/modules/pam_rhosts, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_faillock -> /usr/src/debug/libpam/1.7.3/modules/pam_faillock, directory renamed /usr/src/debug/libpam/1.7.2/libpam/include/security -> /usr/src/debug/libpam/1.7.3/libpam/include/security, directory renamed /usr/src/debug/libpam/1.7.2/libpam_misc -> /usr/src/debug/libpam/1.7.3/libpam_misc, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_localuser -> /usr/src/debug/libpam/1.7.3/modules/pam_localuser, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_debug -> /usr/src/debug/libpam/1.7.3/modules/pam_debug, directory renamed /usr/src/debug/libpam/1.7.2/libpam/include -> /usr/src/debug/libpam/1.7.3/libpam/include, directory renamed /usr/src/debug/libpam/1.7.2/mo
 dules/pam_loginuid -> /usr/src/debug/libpam/1.7.3/modules/pam_loginuid, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_time -> /usr/src/debug/libpam/1.7.3/modules/pam_time, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_stress -> /usr/src/debug/libpam/1.7.3/modules/pam_stress, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_wheel -> /usr/src/debug/libpam/1.7.3/modules/pam_wheel, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_motd -> /usr/src/debug/libpam/1.7.3/modules/pam_motd, directory renamed /usr/src/debug/libpam/1.7.2/libpam_internal/include -> /usr/src/debug/libpam/1.7.3/libpam_internal/include, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_mail -> /usr/src/debug/libpam/1.7.3/modules/pam_mail, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_pwhistory -> /usr/src/debug/libpam/1.7.3/modules/pam_pwhistory, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_filter/upperLOWER -> /usr/src/debug/libpam/1.7.3/modu
 les/pam_filter/upperLOWER, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_issue -> /usr/src/debug/libpam/1.7.3/modules/pam_issue, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_umask -> /usr/src/debug/libpam/1.7.3/modules/pam_umask, directory renamed /usr/src/debug/libpam/1.7.2/libpam -> /usr/src/debug/libpam/1.7.3/libpam, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_filter -> /usr/src/debug/libpam/1.7.3/modules/pam_filter, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_setquota -> /usr/src/debug/libpam/1.7.3/modules/pam_setquota, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_listfile -> /usr/src/debug/libpam/1.7.3/modules/pam_listfile, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_shells -> /usr/src/debug/libpam/1.7.3/modules/pam_shells, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_timestamp -> /usr/src/debug/libpam/1.7.3/modules/pam_timestamp, directory renamed /usr/src/debug/libpam/1.7.2/modules/pa
 m_unix -> /usr/src/debug/libpam/1.7.3/modules/pam_unix, directory renamed /usr/src/debug/libpam/1.7.2/libpamc -> /usr/src/debug/libpam/1.7.3/libpamc, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_exec -> /usr/src/debug/libpam/1.7.3/modules/pam_exec, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_group -> /usr/src/debug/libpam/1.7.3/modules/pam_group, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_mkhomedir -> /usr/src/debug/libpam/1.7.3/modules/pam_mkhomedir, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_keyinit -> /usr/src/debug/libpam/1.7.3/modules/pam_keyinit, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_nologin -> /usr/src/debug/libpam/1.7.3/modules/pam_nologin, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_env -> /usr/src/debug/libpam/1.7.3/modules/pam_env, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_warn -> /usr/src/debug/libpam/1.7.3/modules/pam_warn, directory renamed /usr/src/debug/libpam/1
 .7.2/libpam_misc/include/security -> /usr/src/debug/libpam/1.7.3/libpam_misc/include/security, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_ftp -> /usr/src/debug/libpam/1.7.3/modules/pam_ftp, directory renamed /usr/src/debug/libpam/1.7.2/tests -> /usr/src/debug/libpam/1.7.3/tests, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_access -> /usr/src/debug/libpam/1.7.3/modules/pam_access, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_xauth -> /usr/src/debug/libpam/1.7.3/modules/pam_xauth, directory renamed /usr/src/debug/libpam/1.7.2/libpamc/include/security -> /usr/src/debug/libpam/1.7.3/libpamc/include/security, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_deny -> /usr/src/debug/libpam/1.7.3/modules/pam_deny, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_faildelay -> /usr/src/debug/libpam/1.7.3/modules/pam_faildelay, directory renamed /usr/src/debug/libpam/1.7.2/modules/pam_permit -> /usr/src/debug/libpam/1.7.3/modules/pam_pe
 rmit
packages/x86-64-v3-poky-linux/libpam/libpam-src: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-src: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-staticdev: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-staticdev: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam-xtests: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam-xtests: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/libpam: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/libpam: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-filter-upperlower: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-filter-upperlower: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-access: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-access: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-canonicalize-user: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-canonicalize-user: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-debug: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-debug: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-deny: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-deny: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-echo: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-echo: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-env: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-env: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-exec: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-exec: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-faildelay: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-faildelay: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-faillock: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-faillock: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-filter: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-filter: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-ftp: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-ftp: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-group: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-group: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-issue: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-issue: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-keyinit: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-keyinit: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-limits: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-limits: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-listfile: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-listfile: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-localuser: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-localuser: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-loginuid: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-loginuid: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-mail: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-mail: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-mkhomedir: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-mkhomedir: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-motd: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-motd: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-namespace: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-namespace: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-nologin: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-nologin: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-permit: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-permit: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-pwhistory: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-pwhistory: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-rhosts: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-rhosts: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-rootok: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-rootok: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-securetty: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-securetty: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-setquota: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-setquota: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-shells: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-shells: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-stress: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-stress: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-succeed-if: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-succeed-if: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-time: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-time: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-timestamp: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-timestamp: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-umask: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-umask: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-unix: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-unix: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-usertype: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-usertype: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-warn: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-warn: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-wheel: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-wheel: PV changed from "1.7.2" to "1.7.3"
packages/x86-64-v3-poky-linux/libpam/pam-plugin-xauth: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/x86-64-v3-poky-linux/libpam/pam-plugin-xauth: PV changed from "1.7.2" to "1.7.3"

--===============3955404213459684487==--

