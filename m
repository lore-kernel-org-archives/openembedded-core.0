Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FA5C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:00:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7456.1789020026051369672
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=nWy1WzkK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=TR7Dumhr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a089e730b9-7249b1ad-2593-4071-b244-96b9ea48ba4c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789020025;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hok/FvtI11SG0fB0ddIJiS3pKa3vfVhKIPOS+PrBp50=;
	b=nWy1WzkKKjjkh0cHcjbz5j9K3gEg0IXgh+xvyl1QbyjtQ2m8YRPu987oq4lNKuoR
	o5gDIDVBDuC9KzM6jL4Sm4tDjOiW2nDafj0YKMkELjmGkUvqfGpGlQvHc8IaQ0kWOOa
	2Dk79DqCX/77PfY1qI6QW36i6od2zPHFM13kL+KM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789020025;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hok/FvtI11SG0fB0ddIJiS3pKa3vfVhKIPOS+PrBp50=;
	b=TR7Dumhr/MU+lIknnlgSu4XZXNxEQzaoWghYhx11RdF3gM062MBGiHiBEJgOG1q1
	Y2orZlcKV/8soiebDPmiQQiG6eTOrHwuHEBpC/h8mon0d/7E581ECqpchONLp2x/HS6
	Z8/fZhlQSSEilsXbO/mFgpzPyptM/AUkH86oLVo4=
Content-Type: multipart/mixed; boundary="===============5968276626147200853=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Kris Gavvala <kris.gavvala@windriver.com>, 
	Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap-ng,libcap-ng-python: upgrading to 0.9.6,0.9.6 SUCCEEDED
Message-ID: <010101a089e730b9-7249b1ad-2593-4071-b244-96b9ea48ba4c-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2026 06:00:25 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.10-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245531

--===============5968276626147200853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libcap-ng,libcap-ng-python* to *0.9.6,0.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libcap-ng-libcap-ng-python-upgrade-0.9.5-0.9.6-0.9.5.patch
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
From fbd6a7cc7bb8c4e6f2c77ff89a4f308362f3a9d1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Sep 2026 05:22:50 +0000
Subject: [PATCH] libcap-ng,libcap-ng-python: upgrade 0.9.5 -> 0.9.6,0.9.5 ->
 0.9.6

Source: ChangeLog

0.9.6
- Fix supplementary group changes in capng_change_id
- Reduce cap-audit size and memory use; builds now require llvm-strip
- Preserve capability evidence during cap-audit shutdown
- In cap-audit, fix optional SETPCAP false positives w/o hiding required caps
- Fix ambient capabilities and capability list handling in cap-audit --service
- In cap-audit, reject unsupported systemd unit syntax
- Fix tree branch drawing for repeated socket owners in netcap --advanced
- Fix utility builds with musl libc
- Ensure capng_change_id is multi-thread safe

Source: ChangeLog

0.9.6
- Fix supplementary group changes in capng_change_id
- Reduce cap-audit size and memory use; builds now require llvm-strip
- Preserve capability evidence during cap-audit shutdown
- In cap-audit, fix optional SETPCAP false positives w/o hiding required caps
- Fix ambient capabilities and capability list handling in cap-audit --service
- In cap-audit, reject unsupported systemd unit syntax
- Fix tree branch drawing for repeated socket owners in netcap --advanced
- Fix utility builds with musl libc
- Ensure capng_change_id is multi-thread safe
---
 .../{libcap-ng-python_0.9.5.bb => libcap-ng-python_0.9.6.bb}    | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.5.bb => libcap-ng_0.9.6.bb}        | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.5.bb => libcap-ng-python_0.9.6.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.5.bb => libcap-ng_0.9.6.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.6.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.6.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 2a31be6f4d..0f3179f59f 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "9ae44402f4c405f08b9dd5ec070127d0d92afee4"
+SRCREV = "c382c641ca5730442289c09d3c3d30cc2c8635a9"
 
 inherit lib_package autotools pkgconfig bash-completion
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.5.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.6.bb
-- 
2.47.1


--===============5968276626147200853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PKGSIZE changed from 1923 to 2219 (+15%)
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============5968276626147200853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libcap-ng-python-changelog.txt"

Changelog for libcap-ng-python: 0.9.5 -> 0.9.6
Source: ChangeLog

0.9.6
- Fix supplementary group changes in capng_change_id
- Reduce cap-audit size and memory use; builds now require llvm-strip
- Preserve capability evidence during cap-audit shutdown
- In cap-audit, fix optional SETPCAP false positives w/o hiding required caps
- Fix ambient capabilities and capability list handling in cap-audit --service
- In cap-audit, reject unsupported systemd unit syntax
- Fix tree branch drawing for repeated socket owners in netcap --advanced
- Fix utility builds with musl libc
- Ensure capng_change_id is multi-thread safe

--===============5968276626147200853==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libcap-ng-libcap-ng-python-upgrade-0.9.5-0.9.6-0.9.5.patch"

RnJvbSBmYmQ2YTdjYzdiYjhjNGU2ZjJjNzdmZjg5YTRmMzA4MzYyZjNhOWQxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgU2VwIDIwMjYgMDU6MjI6NTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJjYXAtbmcsbGliY2FwLW5nLXB5dGhvbjogdXBncmFkZSAwLjkuNSAtPiAwLjkuNiwwLjkuNSAt
PgogMC45LjYKClNvdXJjZTogQ2hhbmdlTG9nCgowLjkuNgotIEZpeCBzdXBwbGVtZW50YXJ5IGdy
b3VwIGNoYW5nZXMgaW4gY2FwbmdfY2hhbmdlX2lkCi0gUmVkdWNlIGNhcC1hdWRpdCBzaXplIGFu
ZCBtZW1vcnkgdXNlOyBidWlsZHMgbm93IHJlcXVpcmUgbGx2bS1zdHJpcAotIFByZXNlcnZlIGNh
cGFiaWxpdHkgZXZpZGVuY2UgZHVyaW5nIGNhcC1hdWRpdCBzaHV0ZG93bgotIEluIGNhcC1hdWRp
dCwgZml4IG9wdGlvbmFsIFNFVFBDQVAgZmFsc2UgcG9zaXRpdmVzIHcvbyBoaWRpbmcgcmVxdWly
ZWQgY2FwcwotIEZpeCBhbWJpZW50IGNhcGFiaWxpdGllcyBhbmQgY2FwYWJpbGl0eSBsaXN0IGhh
bmRsaW5nIGluIGNhcC1hdWRpdCAtLXNlcnZpY2UKLSBJbiBjYXAtYXVkaXQsIHJlamVjdCB1bnN1
cHBvcnRlZCBzeXN0ZW1kIHVuaXQgc3ludGF4Ci0gRml4IHRyZWUgYnJhbmNoIGRyYXdpbmcgZm9y
IHJlcGVhdGVkIHNvY2tldCBvd25lcnMgaW4gbmV0Y2FwIC0tYWR2YW5jZWQKLSBGaXggdXRpbGl0
eSBidWlsZHMgd2l0aCBtdXNsIGxpYmMKLSBFbnN1cmUgY2FwbmdfY2hhbmdlX2lkIGlzIG11bHRp
LXRocmVhZCBzYWZlCgpTb3VyY2U6IENoYW5nZUxvZwoKMC45LjYKLSBGaXggc3VwcGxlbWVudGFy
eSBncm91cCBjaGFuZ2VzIGluIGNhcG5nX2NoYW5nZV9pZAotIFJlZHVjZSBjYXAtYXVkaXQgc2l6
ZSBhbmQgbWVtb3J5IHVzZTsgYnVpbGRzIG5vdyByZXF1aXJlIGxsdm0tc3RyaXAKLSBQcmVzZXJ2
ZSBjYXBhYmlsaXR5IGV2aWRlbmNlIGR1cmluZyBjYXAtYXVkaXQgc2h1dGRvd24KLSBJbiBjYXAt
YXVkaXQsIGZpeCBvcHRpb25hbCBTRVRQQ0FQIGZhbHNlIHBvc2l0aXZlcyB3L28gaGlkaW5nIHJl
cXVpcmVkIGNhcHMKLSBGaXggYW1iaWVudCBjYXBhYmlsaXRpZXMgYW5kIGNhcGFiaWxpdHkgbGlz
dCBoYW5kbGluZyBpbiBjYXAtYXVkaXQgLS1zZXJ2aWNlCi0gSW4gY2FwLWF1ZGl0LCByZWplY3Qg
dW5zdXBwb3J0ZWQgc3lzdGVtZCB1bml0IHN5bnRheAotIEZpeCB0cmVlIGJyYW5jaCBkcmF3aW5n
IGZvciByZXBlYXRlZCBzb2NrZXQgb3duZXJzIGluIG5ldGNhcCAtLWFkdmFuY2VkCi0gRml4IHV0
aWxpdHkgYnVpbGRzIHdpdGggbXVzbCBsaWJjCi0gRW5zdXJlIGNhcG5nX2NoYW5nZV9pZCBpcyBt
dWx0aS10aHJlYWQgc2FmZQotLS0KIC4uLi97bGliY2FwLW5nLXB5dGhvbl8wLjkuNS5iYiA9PiBs
aWJjYXAtbmctcHl0aG9uXzAuOS42LmJifSAgICB8IDAKIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YmNhcC1uZy9saWJjYXAtbmcuaW5jICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9saWJj
YXAtbmcve2xpYmNhcC1uZ18wLjkuNS5iYiA9PiBsaWJjYXAtbmdfMC45LjYuYmJ9ICAgICAgICB8
IDAKIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcve2xpYmNhcC1uZy1weXRob25fMC45LjUu
YmIgPT4gbGliY2FwLW5nLXB5dGhvbl8wLjkuNi5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvbGliY2FwLW5nL3tsaWJjYXAtbmdfMC45LjUuYmIgPT4gbGliY2FwLW5nXzAu
OS42LmJifSAoMTAwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAt
bmcvbGliY2FwLW5nLXB5dGhvbl8wLjkuNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC1uZy9saWJjYXAtbmctcHl0aG9uXzAuOS42LmJiCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nLXB5dGhvbl8w
LjkuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1u
Zy1weXRob25fMC45LjYuYmIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYmNh
cC1uZy9saWJjYXAtbmcuaW5jIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNh
cC1uZy5pbmMKaW5kZXggMmEzMWJlNmY0ZC4uMGYzMTc5ZjU5ZiAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMKKysrIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZy5pbmMKQEAgLTgsNyArOCw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTk0ZDU1ZDUxMmE5YmEzNmNhYTliN2RmMDc5
YmFlMTlmIFwKIAkJICAgIGZpbGU6Ly9DT1BZSU5HLkxJQjttZDU9ZTNlZGEwMWQ5ODE1ZjhkMjRh
YWUyZGJkODliNjhiMDYiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9zdGV2ZWdydWJi
L2xpYmNhcC1uZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9Igot
U1JDUkVWID0gIjlhZTQ0NDAyZjRjNDA1ZjA4YjlkZDVlYzA3MDEyN2QwZDkyYWZlZTQiCitTUkNS
RVYgPSAiYzM4MmM2NDFjYTU3MzA0NDIyODljMDlkM2MzZDMwY2MyYzg2MzVhOSIKIAogaW5oZXJp
dCBsaWJfcGFja2FnZSBhdXRvdG9vbHMgcGtnY29uZmlnIGJhc2gtY29tcGxldGlvbgogCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJjYXAtbmcvbGliY2FwLW5nXzAuOS41LmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2FwLW5nL2xpYmNhcC1uZ18wLjkuNi5iYgpzaW1p
bGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGliY2Fw
LW5nL2xpYmNhcC1uZ18wLjkuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGli
Y2FwLW5nL2xpYmNhcC1uZ18wLjkuNi5iYgotLSAKMi40Ny4xCgo=

--===============5968276626147200853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libcap-ng-python: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.5" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bash-completion: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bash-completion: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-bin: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dbg: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-dev: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-doc: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-locale: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: FILELIST: directory renamed /usr/src/debug/libcap-ng-python/0.9.5/bindings/python3 -> /usr/src/debug/libcap-ng-python/0.9.6/bindings/python3
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-src: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python-staticdev: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng-python/libcap-ng-python: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng: SRC_URI changed from "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.5" to "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PKGSIZE changed from 1923 to 2219 (+15%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bash-completion: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-bin: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGSIZE changed from 367088 to 367344 (+0%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dbg: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-dev: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-doc: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-locale: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGSIZE changed from 224012 to 215373 (-4%)
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: FILELIST: directory renamed /usr/src/debug/libcap-ng/0.9.5/utils -> /usr/src/debug/libcap-ng/0.9.6/utils, directory renamed /usr/src/debug/libcap-ng/0.9.5/src -> /usr/src/debug/libcap-ng/0.9.6/src
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-src: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng-staticdev: PV changed from "0.9.5" to "0.9.6"
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PKGV changed from 0.9.5 [default] to 0.9.6 [default]
packages/x86-64-v3-poky-linux/libcap-ng/libcap-ng: PV changed from "0.9.5" to "0.9.6"
Changes to packages/x86_64-linux/elfutils-native (sysroot):
  /usr/bin/eu-stackprof was added

--===============5968276626147200853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libcap-ng-changelog.txt"

Changelog for libcap-ng: 0.9.5 -> 0.9.6
Source: ChangeLog

0.9.6
- Fix supplementary group changes in capng_change_id
- Reduce cap-audit size and memory use; builds now require llvm-strip
- Preserve capability evidence during cap-audit shutdown
- In cap-audit, fix optional SETPCAP false positives w/o hiding required caps
- Fix ambient capabilities and capability list handling in cap-audit --service
- In cap-audit, reject unsupported systemd unit syntax
- Fix tree branch drawing for repeated socket owners in netcap --advanced
- Fix utility builds with musl libc
- Ensure capng_change_id is multi-thread safe

--===============5968276626147200853==--

