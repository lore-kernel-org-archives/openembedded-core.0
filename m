Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8434.1795671539044980499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 21:38:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=M6G11KB1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=toQvYNRv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a2165d3910-8629d1cf-0eab-493e-b5f9-b2b0947b6d90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795671538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AMSJaS8E8nXIX6O0k89ESWKkgy2mUSCmeE7P7EFQw/M=;
	b=M6G11KB1Ypls66n3eFjdAiW1xjB+orI+m3Omgr3R/6/U2YQZv8PLgFYtQA55twVB
	h//ZOOiA5y29VQcdG2vJH+bKMVV4k0/OotcDIWZaUadmWPJQfH5nGgrnsCf/TaKMoTW
	qERfgyNDqRSh+es4XMrpmYCDqQmCU0NTMiavZw3o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795671538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AMSJaS8E8nXIX6O0k89ESWKkgy2mUSCmeE7P7EFQw/M=;
	b=toQvYNRv5gbiGNMgenhYAwFK5MzpwavTz/Ic+CyQ/2SksZL+843Q0LtvsnmjmrXv
	MOPpHvQ5jTDyi4NcjYLOZq0Vy34l8QJP88nmjNUn8RZ0C5X5Jgaosibi6/qIZUlk943
	gs3xzDdnFJPB6vMeU99cuV9RsbRMUYpTI2t2Ge5w=
Content-Type: multipart/mixed; boundary="===============7618327475375672837=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.22.1 SUCCEEDED
Message-ID: <010101a2165d3910-8629d1cf-0eab-493e-b5f9-b2b0947b6d90-000000@us-west-2.amazonses.com>
Date: Thu, 26 Nov 2026 05:38:57 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.26-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251273

--===============7618327475375672837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *librepo* to *1.22.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-librepo-upgrade-1.22.0-1.22.1.patch
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
From 1632c0d4b146b3f910107401b128d25c6f247ee6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 26 Nov 2026 05:20:46 +0000
Subject: [PATCH] librepo: upgrade 1.22.0 -> 1.22.1

1.22.1      2026-11-24

Fixes:
- Make downloading a repository signature uncached, the same as we already
  download the repository metadata file. This should decrease a probability
  that the signature won't match the metadata file.
- Fix compiler warnings with libxml2-2.14.0.
---
 ...2-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch | 2 +-
 .../librepo/{librepo_1.22.0.bb => librepo_1.22.1.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/librepo/{librepo_1.22.0.bb => librepo_1.22.1.bb} (94%)

diff --git a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
index 2b6c1c85b4..02c64ecb99 100644
--- a/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
+++ b/meta/recipes-devtools/librepo/librepo/0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch
@@ -1,4 +1,4 @@
-From 66610d0a0c683ecdd2f39e3936f88624452590c1 Mon Sep 17 00:00:00 2001
+From 018909b0f28dca97edeaadde8a3a13ca786dd295 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:05:36 +0200
 Subject: [PATCH] Do not try to obtain PYTHON_INSTALL_DIR by running python.
diff --git a/meta/recipes-devtools/librepo/librepo_1.22.0.bb b/meta/recipes-devtools/librepo/librepo_1.22.1.bb
similarity index 94%
rename from meta/recipes-devtools/librepo/librepo_1.22.0.bb
rename to meta/recipes-devtools/librepo/librepo_1.22.1.bb
index 2d9b1db16b..8f392de012 100644
--- a/meta/recipes-devtools/librepo/librepo_1.22.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.22.1.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git;branch=master;pr
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            "
 
-SRCREV = "d665398754be6fe270d0a70c3db2ea5c3b917e68"
+SRCREV = "dc24c108114e660284ce9938104c5491502d8941"
 
 DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
-- 
2.47.1


--===============7618327475375672837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="librepo-changelog.txt"

1.22.1      2026-11-24

Fixes:
- Make downloading a repository signature uncached, the same as we already
  download the repository metadata file. This should decrease a probability
  that the signature won't match the metadata file.
- Fix compiler warnings with libxml2-2.14.0.

--===============7618327475375672837==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-librepo-upgrade-1.22.0-1.22.1.patch"

RnJvbSAxNjMyYzBkNGIxNDZiM2Y5MTAxMDc0MDFiMTI4ZDI1YzZmMjQ3ZWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMDU6MjA6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJyZXBvOiB1cGdyYWRlIDEuMjIuMCAtPiAxLjIyLjEKCjEuMjIuMSAgICAgIDIwMjYtMTEtMjQK
CkZpeGVzOgotIE1ha2UgZG93bmxvYWRpbmcgYSByZXBvc2l0b3J5IHNpZ25hdHVyZSB1bmNhY2hl
ZCwgdGhlIHNhbWUgYXMgd2UgYWxyZWFkeQogIGRvd25sb2FkIHRoZSByZXBvc2l0b3J5IG1ldGFk
YXRhIGZpbGUuIFRoaXMgc2hvdWxkIGRlY3JlYXNlIGEgcHJvYmFiaWxpdHkKICB0aGF0IHRoZSBz
aWduYXR1cmUgd29uJ3QgbWF0Y2ggdGhlIG1ldGFkYXRhIGZpbGUuCi0gRml4IGNvbXBpbGVyIHdh
cm5pbmdzIHdpdGggbGlieG1sMi0yLjE0LjAuCi0tLQogLi4uMi1Eby1ub3QtdHJ5LXRvLW9idGFp
bi1QWVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoIHwgMiArLQogLi4uL2xpYnJl
cG8ve2xpYnJlcG9fMS4yMi4wLmJiID0+IGxpYnJlcG9fMS4yMi4xLmJifSAgICAgICAgICAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8ve2xpYnJlcG9fMS4yMi4wLmJiID0+
IGxpYnJlcG9fMS4yMi4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9saWJyZXBvL2xpYnJlcG8vMDAwMi1Eby1ub3QtdHJ5LXRvLW9idGFpbi1QWVRIT05fSU5T
VEFMTF9ESVItYnktcnVubmluZy1wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJl
cG8vbGlicmVwby8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1i
eS1ydW5uaW5nLXAucGF0Y2gKaW5kZXggMmI2YzFjODViNC4uMDJjNjRlY2I5OSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5vdC10cnkt
dG8tb2J0YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwby8wMDAyLURvLW5vdC10cnktdG8tb2J0
YWluLVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDY2NjEwZDBhMGM2ODNlY2RkMmYzOWUzOTM2Zjg4NjI0NDUyNTkwYzEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDAxODkwOWIwZjI4ZGNhOTdlZGVhYWRkZThhM2ExM2NhNzg2
ZGQyOTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MDU6MzYg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHRyeSB0byBvYnRhaW4gUFlUSE9OX0lOU1RB
TExfRElSIGJ5IHJ1bm5pbmcgcHl0aG9uLgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2xpYnJlcG8vbGlicmVwb18xLjIyLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGli
cmVwby9saWJyZXBvXzEuMjIuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbGlicmVwby9saWJyZXBvXzEuMjIuMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJlcG8vbGlicmVwb18xLjIyLjEuYmIKaW5kZXggMmQ5
YjFkYjE2Yi4uOGYzOTJkZTAxMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xp
YnJlcG8vbGlicmVwb18xLjIyLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2xpYnJl
cG8vbGlicmVwb18xLjIyLjEuYmIKQEAgLTksNyArOSw3IEBAIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0
aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9saWJyZXBvLmdpdDticmFuY2g9bWFzdGVy
O3ByCiAgICAgICAgICAgIGZpbGU6Ly8wMDAyLURvLW5vdC10cnktdG8tb2J0YWluLVBZVEhPTl9J
TlNUQUxMX0RJUi1ieS1ydW5uaW5nLXAucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9
ICJkNjY1Mzk4NzU0YmU2ZmUyNzBkMGE3MGMzZGIyZWE1YzNiOTE3ZTY4IgorU1JDUkVWID0gImRj
MjRjMTA4MTE0ZTY2MDI4NGNlOTkzODEwNGM1NDkxNTAyZDg5NDEiCiAKIERFUEVORFMgPSAiY3Vy
bCBnbGliLTIuMCBvcGVuc3NsIGF0dHIgZ3BnbWUgbGlieG1sMiIKIAotLSAKMi40Ny4xCgo=

--===============7618327475375672837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/librepo: SRC_URI changed from "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.22.0 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch" to "git://github.com/rpm-software-management/librepo.git;branch=master;protocol=https;tag=1.22.1 file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch"
packages/x86-64-v3-poky-linux/librepo: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGSIZE changed from 985784 to 985696 (-0%)
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo-dbg: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo-dev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo-doc: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo-locale: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGSIZE changed from 758498 to 758509 (+0%)
packages/x86-64-v3-poky-linux/librepo/librepo-src: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo-src: FILELIST: directory renamed /usr/src/debug/librepo/1.22.0/librepo/python -> /usr/src/debug/librepo/1.22.1/librepo/python, directory renamed /usr/src/debug/librepo/1.22.0/librepo -> /usr/src/debug/librepo/1.22.1/librepo
packages/x86-64-v3-poky-linux/librepo/librepo-src: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo-staticdev: PKGV changed from 1.22.0 [default] to 1.22.1 [default]
packages/x86-64-v3-poky-linux/librepo/librepo: PV changed from "1.22.0" to "1.22.1"
packages/x86-64-v3-poky-linux/librepo/librepo: PKGV changed from 1.22.0 [default] to 1.22.1 [default]

--===============7618327475375672837==--
