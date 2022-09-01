Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3BEC6FA8C
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web08.12628.1662040787616829742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QXiYrInP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 01010182f959c7f7-baa51aa5-0a65-4eb7-8df0-ba3b5388ec70-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1WgwvzSH6K+9crfMw8c/5oEVWgITVZs7oc+R+PTJCiw=;
	b=QXiYrInPCtIKcKPz+cQdBgXIEyZRjONJoeeidJODOkCmSwXf3xfB3gzXFT2wQt5V
	7c5InlWXMiF5nDhX5RYW9pclSY2H/pWX18XyjlRe1FRhjmUWD+OeMbJ/iRCfICA/2Qc
	IOSOJ1uME3c0E3+uqE1BPjqsUJYvLERObCHNh5fo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1WgwvzSH6K+9crfMw8c/5oEVWgITVZs7oc+R+PTJCiw=;
	b=VrGEzvqkVp149bVfj1+AV57lfFSE4K21wAPLFue0cGpS08/RykDtl4axceqwBgXg
	g1lwhbcEs3UvOC9bGgloHsj6gPkL5O2nO1h3JPPim+LS8IcEg9lmsuVxEy4vr37GyZ5
	d9mK8Ud5+T1XtdkG0xRc8iQHpbGW1wkandZUdqbg=
Content-Type: multipart/mixed; boundary="===============0200804789365587566=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libwpe: upgrading to 1.12.3 SUCCEEDED
Message-ID: 
 <01010182f959c7f7-baa51aa5-0a65-4eb7-8df0-ba3b5388ec70-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170204

--===============0200804789365587566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libwpe* to *1.12.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libwpe-upgrade-1.12.2-1.12.3.patch
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
--===============0200804789365587566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libwpe: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe: SRC_URI changed from "https://wpewebkit.org/releases/libwpe-1.12.2.tar.xz file://0001-Fix-build-failure-due-to-libc-using-libc-functions.patch" to "https://wpewebkit.org/releases/libwpe-1.12.3.tar.xz"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dbg: FILELIST: removed "/usr/lib/.debug/libwpe-1.0.so.1.6.2", added "/usr/lib/.debug/libwpe-1.0.so.1.6.3"
packages/core2-32-poky-linux/libwpe/libwpe-dbg: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe/libwpe-dev: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe-dev: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe/libwpe-doc: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe-doc: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe/libwpe-locale: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe-locale: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe/libwpe-src: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe-src: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe-staticdev: PV changed from "1.12.2" to "1.12.3"
packages/core2-32-poky-linux/libwpe/libwpe: PKGV changed from 1.12.2 [default] to 1.12.3 [default]
packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.6.2", added "/usr/lib/libwpe-1.0.so.1.6.3"
packages/core2-32-poky-linux/libwpe/libwpe: PV changed from "1.12.2" to "1.12.3"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.6.2 to libwpe-1.0.so.1.6.3
  /usr/lib/libwpe-1.0.so.1.6.2 moved to /usr/lib/libwpe-1.0.so.1.6.3

--===============0200804789365587566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libwpe/libwpe: FILELIST: removed "/usr/lib/libwpe-1.0.so.1.6.2", added "/usr/lib/libwpe-1.0.so.1.6.3"
Changes to packages/core2-32-poky-linux/libwpe (sysroot):
  /usr/lib/libwpe-1.0.so.1 changed symlink target from libwpe-1.0.so.1.6.2 to libwpe-1.0.so.1.6.3
  /usr/lib/libwpe-1.0.so.1.6.2 moved to /usr/lib/libwpe-1.0.so.1.6.3

--===============0200804789365587566==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libwpe-upgrade-1.12.2-1.12.3.patch"

RnJvbSA4YjFiODdlZGM5ZTdjYjdmYWRhMTE3ZmQ0OWMzN2ZhZWRjZjBkOWYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMjoxNjowNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YndwZTogdXBncmFkZSAxLjEyLjIgLT4gMS4xMi4zCgotLS0KIC4uLnVyZS1kdWUtdG8tbGliYy11
c2luZy1saWJjLWZ1bmN0aW9ucy5wYXRjaCB8IDQyIC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi97
bGlid3BlXzEuMTIuMi5iYiA9PiBsaWJ3cGVfMS4xMi4zLmJifSAgICB8ICA2ICstLQogMiBmaWxl
cyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQ2IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUg
MTAwNjQ0IG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGUvMDAwMS1GaXgtYnVpbGQtZmFp
bHVyZS1kdWUtdG8tbGliYy11c2luZy1saWJjLWZ1bmN0aW9ucy5wYXRjaAogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zYXRvL3dlYmtpdC97bGlid3BlXzEuMTIuMi5iYiA9PiBsaWJ3cGVfMS4xMi4zLmJi
fSAoNzIlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGUvMDAw
MS1GaXgtYnVpbGQtZmFpbHVyZS1kdWUtdG8tbGliYy11c2luZy1saWJjLWZ1bmN0aW9ucy5wYXRj
aCBiL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGUvMDAwMS1GaXgtYnVpbGQtZmFpbHVy
ZS1kdWUtdG8tbGliYy11c2luZy1saWJjLWZ1bmN0aW9ucy5wYXRjaApkZWxldGVkIGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggNmQyN2I0ODM1ZC4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvbGlid3BlLzAwMDEtRml4LWJ1aWxkLWZhaWx1cmUtZHVlLXRvLWxpYmMtdXNp
bmctbGliYy1mdW5jdGlvbnMucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSw0MiArMCwwIEBACi1G
cm9tIGNjZjhhNThjMzUzNmNhMGU2Mjc0OGUwZWE0Nzc1MTRlMTRkODIxYmMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCi1Gcm9tOiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlh
LmNvbT4KLURhdGU6IFRodSwgNCBBdWcgMjAyMiAxMjoxOTowNSArMDMwMAotU3ViamVjdDogW1BB
VENIXSBGaXggYnVpbGQgZmFpbHVyZSBkdWUgdG8gbGliYysrIHVzaW5nIGxpYmMgZnVuY3Rpb25z
Ci0KLUluY2x1ZGUgdGhlICJhbGxvYy1wcml2YXRlLmgiIGhlYWRlciBhZnRlciB0aGUgQysrIHN0
YW5kYXJkIGxpYnJhcnkKLWhlYWRlcnMuIFRoaXMgc2lkZXN0ZXBzIGJ1aWxkIGZhaWx1cmVzIGNh
dXNlZCBieSBpbXBsZW1lbnRhdGlvbnMgb2YKLXN0ZDo6bWFwIGFuZCBzdGQ6OnN0cmluZyB3aGlj
aCB1c2UgbGliYyBtZW1vcnkgYWxsb2NhdGlvbiBmdW5jdGlvbnMKLWluIGV4cGFuZGVkIHRlbXBs
YXRlcyBhZnRlciB0aGV5IGhhdmUgYmVlbiBtYXJrZWQgd2l0aCB0aGUgInBvaXNvbiIKLXByYWdt
YS4KLQotRml4ZXMgIzExNQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0Ci1TaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPgotLS0tCi0gc3JjL3Bh
c3RlYm9hcmQtZ2VuZXJpYy5jcHAgfCA5ICsrKysrKy0tLQotIDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvcGFzdGVib2Fy
ZC1nZW5lcmljLmNwcCBiL3NyYy9wYXN0ZWJvYXJkLWdlbmVyaWMuY3BwCi1pbmRleCA4NmZlNGVl
Li5hMzU3MDI3IDEwMDY0NAotLS0tIGEvc3JjL3Bhc3RlYm9hcmQtZ2VuZXJpYy5jcHAKLSsrKyBi
L3NyYy9wYXN0ZWJvYXJkLWdlbmVyaWMuY3BwCi1AQCAtMjYsMTIgKzI2LDE1IEBACi0gCi0gI2lu
Y2x1ZGUgInBhc3RlYm9hcmQtcHJpdmF0ZS5oIgotIAotLSNpbmNsdWRlICJhbGxvYy1wcml2YXRl
LmgiCi0tI2luY2x1ZGUgPGNzdGRsaWI+Ci0tI2luY2x1ZGUgPGNzdHJpbmc+Ci0gI2luY2x1ZGUg
PG1hcD4KLSAjaW5jbHVkZSA8c3RyaW5nPgotIAotKy8vIFdlIG5lZWQgdG8gaW5jbHVkZSB0aGlz
IGhlYWRlciBsYXN0LCBpbiBvcmRlciB0byBhdm9pZCB0ZW1wbGF0ZSBleHBhbnNpb25zCi0rLy8g
ZnJvbSB0aGUgQysrIHN0YW5kYXJkIGxpYnJhcnkgaGFwcGVuaW5nIGFmdGVyIGl0IGZvcmJpZHMg
dXNhZ2Ugb2YgdGhlIGxpYmMKLSsvLyBtZW1vcnkgZnVuY3Rpb25zLgotKyNpbmNsdWRlICJhbGxv
Yy1wcml2YXRlLmgiCi0rI2luY2x1ZGUgPGNzdHJpbmc+Ci0rCi0gbmFtZXNwYWNlIEdlbmVyaWMg
ewotIHVzaW5nIFBhc3RlYm9hcmQgPSBzdGQ6Om1hcDxzdGQ6OnN0cmluZywgc3RkOjpzdHJpbmc+
OwotIH0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xMi4y
LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L2xpYndwZV8xLjEyLjMuYmIKc2ltaWxhcml0
eSBpbmRleCA3MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L2xpYndwZV8x
LjEyLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xMi4z
LmJiCmluZGV4IGUyM2E5YWMzMmQuLjc3Y2E1MTdlZjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC9saWJ3cGVfMS4xMi4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3dl
YmtpdC9saWJ3cGVfMS4xMi4zLmJiCkBAIC0xMCwxMCArMTAsOCBAQCBpbmhlcml0IGNtYWtlIGZl
YXR1cmVzX2NoZWNrIHBrZ2NvbmZpZwogCiBSRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgPSAib3Bl
bmdsIgogCi1TUkNfVVJJID0gImh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxlYXNlcy8ke0JQTn0t
JHtQVn0udGFyLnh6IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtRml4LWJ1aWxkLWZhaWx1cmUt
ZHVlLXRvLWxpYmMtdXNpbmctbGliYy1mdW5jdGlvbnMucGF0Y2ggXAotICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiNGFjNGZkMGE4YjU2MmI3MjFiZmZkMGY0NmFlOWYwNmMyYjVh
MzExNDQwNzU4MTk3OGJlODc1YTlkNjUxNjQyYSIKK1NSQ19VUkkgPSAiaHR0cHM6Ly93cGV3ZWJr
aXQub3JnL3JlbGVhc2VzLyR7QlBOfS0ke1BWfS50YXIueHoiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYjg0ZmRiZmJjODQ5Y2U0ZmRmMDg0YmIyOGI1OGU1NDYzYjFiNGI2Y2M4ZjIwMGRjNzdiNDFm
ODU0NWQ1MzI5ZCIKIAogIyBUaGlzIGlzIGEgdHdlYWsgb2YgdXBzdHJlYW0tdmVyc2lvbi1pcy1l
dmVuIG5lZWRlZCBiZWNhdXNlCiAjIGlwc3RyZWFtIGRpcmVjdG9yeSBjb250YWlucyB0YXJiYWxs
cyBmb3Igb3RoZXIgY29tcG9uZW50cyBhcyB3ZWxsLgotLSAKMi4zMS4xCgo=

--===============0200804789365587566==--

