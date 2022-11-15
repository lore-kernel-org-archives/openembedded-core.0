Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E57FC6370A
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.5196.1668517536485165573
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QLvPDZGK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101847b652338-3d82c96f-2cd5-4108-89dd-bb35983aefcd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3rTNOLPkn9zPNx52NmSrMd81M3WTYTDVYHN7g3+E5Z4=;
	b=QLvPDZGK+fj0qgj43/1L9d3Yuz0wuB+vqZdWK1hhn3li9YAeiB04UMNEeS5QkJQ/
	N632BWm1pX1Hc729hbZyxYwXXg3uQ3PenrvL901kDvlBTmqRCrwpFUoIdJpmWMRy7WP
	q9RS61GLUQVAe2hYD+QMFvLczPIWXW82NDzostDM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3rTNOLPkn9zPNx52NmSrMd81M3WTYTDVYHN7g3+E5Z4=;
	b=cY5ytr58bHbXW8olZwuplxYREeTDse1iDJqRP7IaYSr9N61RIMWUamQPQ5sSryEi
	W20cNi3V4C9jOTOJQRbXHAr2zuTb839vfsgVXLZ0Y034cW7oDHKMrNZO0cXJvCoe3B+
	iOXxJWHR/H9w03X8nvsDMgLvhAnzKrJFbcIx94pc=
Content-Type: multipart/mixed; boundary="===============6446024489331049977=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Victor Kamensky <victor.kamensky7@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemtap: upgrading to 4.8 FAILED
Message-ID: <010101847b652338-3d82c96f-2cd5-4108-89dd-bb35983aefcd-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173327

--===============6446024489331049977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemtap* to *4.8* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-systemtap-upgrade-4.7-4.8.patch
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
--===============6446024489331049977==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1665 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb: Unable to get checksum for systemtap-uprobes SRC_URI entry python-3.11.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/qemux86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/qemuall/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/i686/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-uprobes/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-native_git.bb: Unable to get checksum for nativesdk-systemtap-native SRC_URI entry python-3.11.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
ERROR: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap_git.bb: Unable to get checksum for nativesdk-systemtap SRC_URI entry python-3.11.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/poky/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/x86-64/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap-4.8/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/systemtap/python-3.11.patch
/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/systemtap/files/python-3.11.patch
ERROR: Parsing halted due to errors, see error messages above

--===============6446024489331049977==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemtap-upgrade-4.7-4.8.patch"

RnJvbSAwYjE2YzhhNWUyMTJlM2ExNmNmZjg5YjE1ODBjZjFjYmYwMmRhZmM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTI6MDM6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
eXN0ZW10YXA6IHVwZ3JhZGUgNC43IC0+IDQuOAoKLS0tCiAuLi4vc3lzdGVtdGFwL3N5c3RlbXRh
cC9weXRob24tMy4xMS5wYXRjaCAgICAgfCAzNyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4vcmVj
aXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIgfCAgNSArKy0KIC4uLi9zeXN0
ZW10YXAvc3lzdGVtdGFwX2dpdC5pbmMgICAgICAgICAgICAgICB8ICA0ICstCiAzIGZpbGVzIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2
NDQgbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwL3B5dGhvbi0zLjExLnBh
dGNoCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFw
L3B5dGhvbi0zLjExLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVt
dGFwL3B5dGhvbi0zLjExLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA2ZTBj
OTdiOGQ2Li4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5
c3RlbXRhcC9weXRob24tMy4xMS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDM3ICswLDAgQEAK
LUZyb20gMDY5ZTEwOWM5NWQxYWZjYTE3Y2QzNzgxYjM5ZjIyMGNmOGIzOTk3OCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKLUZyb206IFN0YW4gQ294IDxzY294QHJlZGhhdC5jb20+Ci1EYXRlOiBX
ZWQsIDEzIEp1bCAyMDIyIDA5OjQ5OjUxIC0wNDAwCi1TdWJqZWN0OiBbUEFUQ0ggMS8xXSBweXRo
b24gMy4xMSByZW1vdmVkIGRpcmVjdCBhY2Nlc3MgdG8gUHlGcmFtZU9iamVjdAotIG1lbWJlcnMK
LQotVGFrZSBpbnRvIGFjY291bnQgdGhlIGNoYW5nZSBpbiBQeUZyYW1lT2JqZWN0IGRlZmluaXRp
b24gdG8gYWxsb3cKLWJ1aWxkaW5nIHN5c3RlbXRhcCB3aXRoIHB5dGhvbiAzLjExLiAgQWRkaXRp
b25hbCBzdXBwb3J0IGZvciBweXRob24KLTMuMTEgaXMgZm9ydGhjb21pbmcuCi0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0Lz9wPXN5c3RlbXRh
cC5naXQ7YT1jb21taXQ7aD0wNjllMTA5Yzk1ZDFhZmNhMTdjZDM3ODFiMzlmMjIwY2Y4YjM5OTc4
XQotU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4K
LS0tLQotIHB5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNEVC5jIHwgNiArKysrKysKLSAxIGZpbGUg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCi0KLWRpZmYgLS1naXQgYS9weXRob24vSGVscGVyU0RU
L19IZWxwZXJTRFQuYyBiL3B5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNEVC5jCi1pbmRleCA5Njdj
YjYwNzcuLjRkMjg3MTMyZSAxMDA2NDQKLS0tLSBhL3B5dGhvbi9IZWxwZXJTRFQvX0hlbHBlclNE
VC5jCi0rKysgYi9weXRob24vSGVscGVyU0RUL19IZWxwZXJTRFQuYwotQEAgLTE0LDcgKzE0LDEz
IEBACi0gLy8gUFIyNTg0MTogZW5zdXJlIHRoYXQgdGhlIGxpYkhlbHBlclNEVC5zbyBmaWxlIGNv
bnRhaW5zIGRlYnVnaW5mbwotIC8vIGZvciB0aGUgdGFwc2V0IGhlbHBlciBmdW5jdGlvbnMsIHNv
IHRoZXkgZG9uJ3QgaGF2ZSB0byBsb29rIGludG8gbGlicHl0aG9uKgotICNpbmNsdWRlIDxmcmFt
ZW9iamVjdC5oPgotKy8vIHB5dGhvbiAzLjExIHJlbW92ZWQgZGlyZWN0IGFjY2VzcyB0byBQeUZy
YW1lT2JqZWN0IG1lbWJlcnMKLSsvLyBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjExL3doYXRz
bmV3LzMuMTEuaHRtbCNjLWFwaS1jaGFuZ2VzCi0rI2lmIFBZX01BSk9SX1ZFUlNJT04gPD0gMyAm
JiBQWV9NSU5PUl9WRVJTSU9OIDwgMTEKLSBQeUZyYW1lT2JqZWN0IF9kdW1teV9mcmFtZTsKLSsj
ZWxzZQotKy8vUHlGcmFtZU9iamVjdCAqX2R1bW15X2ZyYW1lOwotKyNlbmRpZgotICNpbmNsdWRl
IDxvYmplY3QuaD4KLSBQeVZhck9iamVjdCBfZHVtbXlfdmFyOwotICNpbmNsdWRlIDxkaWN0b2Jq
ZWN0Lmg+Ci0tLSAKLTIuMzEuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL3N5
c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAv
c3lzdGVtdGFwX2dpdC5iYgppbmRleCAwNzJmY2IzMTBhLi41ZGQzZmU4ZGViIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1rZXJuZWwvc3lzdGVtdGFwL3N5c3RlbXRhcF9naXQuYmIKQEAgLTYsNyArNiwx
MCBAQCBIT01FUEFHRSA9ICJodHRwczovL3NvdXJjZXdhcmUub3JnL3N5c3RlbXRhcC8iCiAKIHJl
cXVpcmUgc3lzdGVtdGFwX2dpdC5pbmMKIAotU1JDX1VSSSArPSAiIFwKK1NSQ19VUkkgKz0gImdp
dDovL3NvdXJjZXdhcmUub3JnL2dpdC9zeXN0ZW10YXAuZ2l0O2JyYW5jaD1tYXN0ZXIgXAorICAg
ICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtbGV0LWNvbmZpZ3VyZS13cml0ZS1hLXB5dGhvbi1s
b2NhdGlvbi1pbnRvLXRoLnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtSW5zdGFsbC1w
eXRob24tbW9kdWxlcy10by1jb3JyZWN0LWxpYnJhcnktZGlyLnBhdGNoIFwKKyAgICAgICAgICAg
ZmlsZTovLzAwMDEtc3RhcHJ1bi1zdGFwYnBmLWRvbi10LXN1cHBvcnQtaW5zdGFsbGluZy1hLW5v
bi1yb290LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtaW1wcm92ZS1yZXByb2R1Y2li
aWxpdHktZm9yLWMtY29tcGlsaW5nLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtc3Rh
cHJ1bi1hZGRyZXNzLW5jdXJzZXMtNi4zLWZhaWx1cmVzLnBhdGNoIFwKICAgICAgICAgICAgIgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9zeXN0ZW10YXAvc3lzdGVtdGFwX2dpdC5p
bmMgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYwppbmRl
eCBiMDVhNWEyYjBkLi5lY2U4YmFjZTk2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVs
L3N5c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYworKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL3N5
c3RlbXRhcC9zeXN0ZW10YXBfZ2l0LmluYwpAQCAtMSw3ICsxLDcgQEAKIExJQ0VOU0UgPSAiR1BM
LTIuMC1vbmx5IgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVl
NGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCi1TUkNSRVYgPSAiMGMzMzVhNzVhNzg5ZmY0NGI1
MTRlNTY3ZDQ1ODg4MWUxNWNjMjgzZCIKLVBWID0gIjQuNyIKK1NSQ1JFViA9ICJiMTc2YWZiMmU0
OTExOWVmODQ0ZDE5M2QyN2IwNzUyYTZkODRmZThmIgorUFYgPSAiNC44IgogCiBTUkNfVVJJID0g
ImdpdDovL3NvdXJjZXdhcmUub3JnL2dpdC9zeXN0ZW10YXAuZ2l0O2JyYW5jaD1tYXN0ZXIgXAog
ICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3QtbGV0LWNvbmZpZ3VyZS13cml0ZS1hLXB5dGhv
bi1sb2NhdGlvbi1pbnRvLXRoLnBhdGNoIFwKLS0gCjIuMzEuMQoK

--===============6446024489331049977==--

