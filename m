Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37038.1793167559205654508
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YyVgVI9q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=xmUAQ46z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a1811d85ed-1f81b68f-62a2-4676-8d95-d9f5003f4e2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167558;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=yZMksJGkKlcm9IwpqbaLFSOeB8geZAS0+I6jiwmDjbo=;
	b=YyVgVI9qK2/Ix6BXtO719YK8NWaKe5OiYh5FphRZ+RkN8JPZM+1UfqwX4KPIhgRJ
	hxWAl/+md2Z3V5E5fKre8FVnjbius+lzcjKgW5ipgo/ifga+ZHzhuLaNnxgGtt3MTsH
	92xi50KdUxW3it88i4PBFN2M/UFZOHznnm54oank=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167558;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=yZMksJGkKlcm9IwpqbaLFSOeB8geZAS0+I6jiwmDjbo=;
	b=xmUAQ46zWkiJoNB03i+ZGiktRSPMhQtNI8lETvC8eXnLr2JXSubyyHrSfzbbpUAN
	KP5uprfrPnt+njtDXdvzRbmf2tpD+SsmXn+6GRJuAL8zDbIMO9elIW2B/PeTUS5gCNm
	QmXLwo16LkUi74E672O5KizPHMN1jjNLoayOoDF0=
Content-Type: multipart/mixed; boundary="===============4313833347922808641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 1.2.6 SUCCEEDED
Message-ID: <010101a1811d85ed-1f81b68f-62a2-4676-8d95-d9f5003f4e2f-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:05:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248774

--===============4313833347922808641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *createrepo-c* to *1.2.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-1.2.5-1.2.6.patch
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
From 859dd42880c69ec3e63bf46a06ecdbb6b0f6313e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 05:28:40 +0000
Subject: [PATCH] createrepo-c: upgrade 1.2.5 -> 1.2.6

Release 1.2.6
spec: Stop building Python documentation
python tests: add missing shebang to run_unittests.sh.in
Make default compression method configurable at build time
doc: Omit modularity-related texts if built without modularity support
Test structured control character validation
Reject illegal characters in un-modifiable fields
1.x specific compatibility code for backporting errors
Strip control characters on package header parse
Fix archive size value for v6 packages
Update Python package build config on 1.x.x-maint
---
 ...0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch | 4 ++--
 .../{createrepo-c_1.2.5.bb => createrepo-c_1.2.6.bb}          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.5.bb => createrepo-c_1.2.6.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index e2f90644c2..88eb22d253 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,4 +1,4 @@
-From 71df5a5471081cf2338f9f046cdc51d064534297 Mon Sep 17 00:00:00 2001
+From 5684a44dd48f82e00c356383137f0aad9d796466 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
@@ -13,7 +13,7 @@ Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index 05ac89f9f491f93367283974ea38b5e314f0c5b6..44e38b386abc1c8eb135721d89509c649fdc6297 100644
+index 05ac89f..44e38b3 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
 @@ -48,7 +48,7 @@ IF (SKBUILD)
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.6.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.6.bb
index 7ffb7bce66..cb604c7884 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.5.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.6.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=1.x.x-ma
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "6a48c5f599d30a20d15ea13b1dea82a86734d3d2"
+SRCREV = "7ab2c171f9aeab908f5fa19c3680deb4848e0649"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"
-- 
2.47.1


--===============4313833347922808641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1616576 to 1623480 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.1.2.5", added "/usr/lib/.debug/libcreaterepo_c.so.1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 147161 to 148497 (+1%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PKGSIZE changed from 16360 to 16374 (+0%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1290812 to 1298880 (+1%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: FILELIST: directory renamed /usr/src/debug/createrepo-c/1.2.5/src/python -> /usr/src/debug/createrepo-c/1.2.6/src/python, directory renamed /usr/src/debug/createrepo-c/1.2.5/src -> /usr/src/debug/createrepo-c/1.2.6/src
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 572037 to 576133 (+1%)
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: FILELIST: directory renamed /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info -> /usr/lib/python3.14/site-packages/createrepo_c-1.2.6.dist-info, removed "/usr/lib/libcreaterepo_c.so.1.2.5", added "/usr/lib/libcreaterepo_c.so.1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
packages/x86-64-v3-poky-linux/createrepo-c: SRC_URI changed from "git://github.com/rpm-software-management/createrepo_c;branch=1.x.x-maint;protocol=https;tag=1.2.5 file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch" to "git://github.com/rpm-software-management/createrepo_c;branch=1.x.x-maint;protocol=https;tag=1.2.6 file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch"
packages/x86-64-v3-poky-linux/createrepo-c: PV changed from "1.2.5" to "1.2.6"
packages/x86-64-v3-poky-linux/createrepo-c: PKGV changed from 1.2.5 [default] to 1.2.6 [default]
Changes to packages/x86-64-v3-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.5 to libcreaterepo_c.so.1.2.6
  /usr/lib/libcreaterepo_c.so.1.2.5 moved to /usr/lib/libcreaterepo_c.so.1.2.6
  /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info moved to /usr/lib/python3.14/site-packages/createrepo_c-1.2.6.dist-info

--===============4313833347922808641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="createrepo-c-changelog.txt"

Release 1.2.6
spec: Stop building Python documentation
python tests: add missing shebang to run_unittests.sh.in
Make default compression method configurable at build time
doc: Omit modularity-related texts if built without modularity support
Test structured control character validation
Reject illegal characters in un-modifiable fields
1.x specific compatibility code for backporting errors
Strip control characters on package header parse
Fix archive size value for v6 packages
Update Python package build config on 1.x.x-maint

--===============4313833347922808641==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-1.2.5-1.2.6.patch"

RnJvbSA4NTlkZDQyODgwYzY5ZWMzZTYzYmY0NmEwNmVjZGJiNmIwZjYzMTNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDU6Mjg6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBj
cmVhdGVyZXBvLWM6IHVwZ3JhZGUgMS4yLjUgLT4gMS4yLjYKClJlbGVhc2UgMS4yLjYKc3BlYzog
U3RvcCBidWlsZGluZyBQeXRob24gZG9jdW1lbnRhdGlvbgpweXRob24gdGVzdHM6IGFkZCBtaXNz
aW5nIHNoZWJhbmcgdG8gcnVuX3VuaXR0ZXN0cy5zaC5pbgpNYWtlIGRlZmF1bHQgY29tcHJlc3Np
b24gbWV0aG9kIGNvbmZpZ3VyYWJsZSBhdCBidWlsZCB0aW1lCmRvYzogT21pdCBtb2R1bGFyaXR5
LXJlbGF0ZWQgdGV4dHMgaWYgYnVpbHQgd2l0aG91dCBtb2R1bGFyaXR5IHN1cHBvcnQKVGVzdCBz
dHJ1Y3R1cmVkIGNvbnRyb2wgY2hhcmFjdGVyIHZhbGlkYXRpb24KUmVqZWN0IGlsbGVnYWwgY2hh
cmFjdGVycyBpbiB1bi1tb2RpZmlhYmxlIGZpZWxkcwoxLnggc3BlY2lmaWMgY29tcGF0aWJpbGl0
eSBjb2RlIGZvciBiYWNrcG9ydGluZyBlcnJvcnMKU3RyaXAgY29udHJvbCBjaGFyYWN0ZXJzIG9u
IHBhY2thZ2UgaGVhZGVyIHBhcnNlCkZpeCBhcmNoaXZlIHNpemUgdmFsdWUgZm9yIHY2IHBhY2th
Z2VzClVwZGF0ZSBQeXRob24gcGFja2FnZSBidWlsZCBjb25maWcgb24gMS54LngtbWFpbnQKLS0t
CiAuLi4wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9u
LnBhdGNoIHwgNCArKy0tCiAuLi4ve2NyZWF0ZXJlcG8tY18xLjIuNS5iYiA9PiBjcmVhdGVyZXBv
LWNfMS4yLjYuYmJ9ICAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0
ZXJlcG8tYy97Y3JlYXRlcmVwby1jXzEuMi41LmJiID0+IGNyZWF0ZXJlcG8tY18xLjIuNi5iYn0g
KDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2Ny
ZWF0ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQtUFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmct
cHl0aG9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NyZWF0ZXJlcG8tYy9jcmVhdGVy
ZXBvLWMvMDAwMS1Eby1ub3Qtc2V0LVBZVEhPTl9JTlNUQUxMX0RJUi1ieS1ydW5uaW5nLXB5dGhv
bi5wYXRjaAppbmRleCBlMmY5MDY0NGMyLi44OGViMjJkMjUzIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tYy8wMDAxLURvLW5vdC1zZXQt
UFlUSE9OX0lOU1RBTExfRElSLWJ5LXJ1bm5pbmctcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jLzAwMDEtRG8tbm90LXNldC1Q
WVRIT05fSU5TVEFMTF9ESVItYnktcnVubmluZy1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDcxZGY1YTU0NzEwODFjZjIzMzhmOWYwNDZjZGM1MWQwNjQ1MzQyOTcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDU2ODRhNDRkZDQ4ZjgyZTAwYzM1NjM4MzEzN2YwYWFkOWQ3
OTY0NjYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMzAgRGVjIDIwMTYgMTg6MzE6MDIg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IHNldCBQWVRIT05fSU5TVEFMTF9ESVIgYnkg
cnVubmluZyBweXRob24KQEAgLTEzLDcgKzEzLDcgQEAgU2lnbmVkLW9mZi1ieTogTW9yaXR6IEhh
YXNlIDxNb3JpdHouSGFhc2VAYm13LmRlPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvc3JjL3B5dGhvbi9DTWFrZUxpc3RzLnR4
dCBiL3NyYy9weXRob24vQ01ha2VMaXN0cy50eHQKLWluZGV4IDA1YWM4OWY5ZjQ5MWY5MzM2NzI4
Mzk3NGVhMzhiNWUzMTRmMGM1YjYuLjQ0ZTM4YjM4NmFiYzFjOGViMTM1NzIxZDg5NTA5YzY0OWZk
YzYyOTcgMTAwNjQ0CitpbmRleCAwNWFjODlmLi40NGUzOGIzIDEwMDY0NAogLS0tIGEvc3JjL3B5
dGhvbi9DTWFrZUxpc3RzLnR4dAogKysrIGIvc3JjL3B5dGhvbi9DTWFrZUxpc3RzLnR4dAogQEAg
LTQ4LDcgKzQ4LDcgQEAgSUYgKFNLQlVJTEQpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJlcG8tY18xLjIuNS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jcmVhdGVyZXBvLWMvY3JlYXRlcmVwby1jXzEuMi42LmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9jcmVhdGVyZXBvLWMvY3Jl
YXRlcmVwby1jXzEuMi41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRl
cmVwby1jL2NyZWF0ZXJlcG8tY18xLjIuNi5iYgppbmRleCA3ZmZiN2JjZTY2Li5jYjYwNGM3ODg0
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2NyZWF0ZXJl
cG8tY18xLjIuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvY3JlYXRlcmVwby1jL2Ny
ZWF0ZXJlcG8tY18xLjIuNi5iYgpAQCAtOCw3ICs4LDcgQEAgU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5hZ2VtZW50L2NyZWF0ZXJlcG9fYzticmFuY2g9MS54Lngt
bWEKICAgICAgICAgICAgZmlsZTovLzAwMDEtRG8tbm90LXNldC1QWVRIT05fSU5TVEFMTF9ESVIt
YnktcnVubmluZy1weXRob24ucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ1JFViA9ICI2YTQ4
YzVmNTk5ZDMwYTIwZDE1ZWExM2IxZGVhODJhODY3MzRkM2QyIgorU1JDUkVWID0gIjdhYjJjMTcx
ZjlhZWFiOTA4ZjVmYTE5YzM2ODBkZWI0ODQ4ZTA2NDkiCiAKIERFUEVORFMgPSAiZXhwYXQgY3Vy
bCBnbGliLTIuMCBsaWJ4bWwyIG9wZW5zc2wgYnppcDIgemxpYiBmaWxlIHNxbGl0ZTMgeHogcnBt
IgogREVQRU5EUzphcHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBmaWxlLXJlcGxhY2VtZW50LW5hdGl2
ZSIKLS0gCjIuNDcuMQoK

--===============4313833347922808641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/createrepo-c/createrepo-c: FILELIST: directory renamed /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info -> /usr/lib/python3.14/site-packages/createrepo_c-1.2.6.dist-info, removed "/usr/lib/libcreaterepo_c.so.1.2.5", added "/usr/lib/libcreaterepo_c.so.1.2.6"
Changes to packages/x86-64-v3-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.1 changed symlink target from libcreaterepo_c.so.1.2.5 to libcreaterepo_c.so.1.2.6
  /usr/lib/libcreaterepo_c.so.1.2.5 moved to /usr/lib/libcreaterepo_c.so.1.2.6
  /usr/lib/python3.14/site-packages/createrepo_c-1.2.5.dist-info moved to /usr/lib/python3.14/site-packages/createrepo_c-1.2.6.dist-info

--===============4313833347922808641==--
