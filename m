Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FFEC4708B
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:19 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.24225.1665871394517647008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VqSo2zsU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010183ddac3a0f-48758b4e-ec95-4844-8499-0a033536d963-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=h71uLoEiL47EW3QgttWhf8vGtHjHmhh7imxzE0fXK3w=;
	b=VqSo2zsUFxLy+awf4iVXTiZ9XgDfCs+Y1LB9Nwv7avfmkYM9R+3wV0XIJbQC05qf
	L/2adnK+or+mq8uYCY7FguF8CaXSgFgJ7jCkO5kGZ7YKFFfiCo8lEU5szYy5taYdX2p
	KTL4Mkwv1PwDPT1d3duwkeNNEi63wX3ITG8Wmj8s=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=h71uLoEiL47EW3QgttWhf8vGtHjHmhh7imxzE0fXK3w=;
	b=YMPXXUU6x3eT8UyGCN17FP0zOtAUuoJtZPeUqF+HSGcQa+/mu2j2O0vi+J9Kz9WX
	WGQEc+zbBGhOzhZxdJHcLw9fkMHPRfETolt+LLpuksSpO4vKfQxQHrYWK1iuMe8OpPk
	W1qGmebCqIz6Ktbr2ZvCyiuakZCLpGsL3CvRZGgc=
Content-Type: multipart/mixed; boundary="===============0732452905059421815=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva-initial: upgrading to 2.16.0 FAILED
Message-ID: <01010183ddac3a0f-48758b4e-ec95-4844-8499-0a033536d963-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171829

--===============0732452905059421815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva-initial* to *2.16.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  finish -f libva-initial /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva
NOTE: Starting bitbake server...
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1661 entries from dependency cache.
Parsing recipes...done.
Parsing of 886 .bb files complete (885 cached, 1 parsed). 1664 targets, 35 skipped, 0 masked, 0 errors.

Summary: There was 1 WARNING message.

INFO: No patches or local source files needed updating
INFO: Cleaning sysroot for recipe libva-initial...
ERROR: Command 'bitbake -c clean libva-initial' failed, output:
WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1664 entries from dependency cache.
Parsing recipes...
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.

If you wish, you may specify -n/--no-clean to skip running this command when resetting


Next steps:
    - apply the patch: git am 0001-libva-initial-upgrade-2.15.0-2.16.0.patch
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
--===============0732452905059421815==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-initial-upgrade-2.15.0-2.16.0.patch"

RnJvbSA0OTg2Zjg2MGYxYjU2MDM1ZjEyZmUzOTJhMmJmYTZlODc4MWU0ZTY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTU6NTM6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YS1pbml0aWFsOiB1cGdyYWRlIDIuMTUuMCAtPiAyLjE2LjAKCi0tLQogLi4uL2xpYnZhL2xp
YnZhLWluaXRpYWxfMi4xNS4wLmJiICAgICAgICAgICAgIHwgIDggLS0tLQogbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluYyAgICAgICAgIHwgMzcgLS0tLS0tLS0tLS0tLS0tLS0t
LQogMiBmaWxlcyBjaGFuZ2VkLCA0NSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEtaW5pdGlhbF8yLjE1LjAuYmIKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4xNS4w
LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLWluaXRpYWxfMi4xNS4wLmJi
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0NTMwOTY4MjJmLi4wMDAwMDAwMDAwCi0t
LSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS1pbml0aWFsXzIuMTUuMC5iYgor
KysgL2Rldi9udWxsCkBAIC0xLDggKzAsMCBAQAotcmVxdWlyZSBsaWJ2YS5pbmMKLQotUEFDS0FH
RUNPTkZJRyA/PSAiIgotCi1kb19pbnN0YWxsOmFwcGVuZCAoKSB7Ci0Jcm0gLWYgJHtEfSR7bGli
ZGlyfS8qLnNvKgotfQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEv
bGlidmEuaW5jIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhLmluYwpkZWxldGVk
IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggNzM1ZjJmY2E1Yi4uMDAwMDAwMDAwMAotLS0gYS9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCisrKyAvZGV2L251bGwKQEAgLTEsMzcg
KzAsMCBAQAotU1VNTUFSWSA9ICJWaWRlbyBBY2NlbGVyYXRpb24gKFZBKSBBUEkgZm9yIExpbnV4
IgotREVTQ1JJUFRJT04gPSAiVmlkZW8gQWNjZWxlcmF0aW9uIEFQSSAoVkEgQVBJKSBpcyBhIGxp
YnJhcnkgKGxpYlZBKSBcCi1hbmQgQVBJIHNwZWNpZmljYXRpb24gd2hpY2ggZW5hYmxlcyBhbmQg
cHJvdmlkZXMgYWNjZXNzIHRvIGdyYXBoaWNzIFwKLWhhcmR3YXJlIChHUFUpIGFjY2VsZXJhdGlv
biBmb3IgdmlkZW8gcHJvY2Vzc2luZyBvbiBMaW51eCBhbmQgVU5JWCBcCi1iYXNlZCBvcGVyYXRp
bmcgc3lzdGVtcy4gQWNjZWxlcmF0ZWQgcHJvY2Vzc2luZyBpbmNsdWRlcyB2aWRlbyBcCi1kZWNv
ZGluZywgdmlkZW8gZW5jb2RpbmcsIHN1YnBpY3R1cmUgYmxlbmRpbmcgYW5kIHJlbmRlcmluZy4g
VGhlIFwKLXNwZWNpZmljYXRpb24gd2FzIG9yaWdpbmFsbHkgZGVzaWduZWQgYnkgSW50ZWwgZm9y
IGl0cyBHTUEgKEdyYXBoaWNzIFwKLU1lZGlhIEFjY2VsZXJhdG9yKSBzZXJpZXMgb2YgR1BVIGhh
cmR3YXJlLCB0aGUgQVBJIGlzIGhvd2V2ZXIgbm90IFwKLWxpbWl0ZWQgdG8gR1BVcyBvciBJbnRl
bCBzcGVjaWZpYyBoYXJkd2FyZSwgYXMgb3RoZXIgaGFyZHdhcmUgYW5kIFwKLW1hbnVmYWN0dXJl
cnMgY2FuIGFsc28gZnJlZWx5IHVzZSB0aGlzIEFQSSBmb3IgaGFyZHdhcmUgYWNjZWxlcmF0ZWQg
XAotdmlkZW8gZGVjb2RpbmcuIgotCi1IT01FUEFHRSA9ICJodHRwczovLzAxLm9yZy9saW51eG1l
ZGlhL3ZhYXBpIgotQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vaW50ZWwvbGlidmEv
aXNzdWVzIgotCi1TRUNUSU9OID0gIngxMSIKLUxJQ0VOU0UgPSAiTUlUIgotCi1TUkNfVVJJID0g
IiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9saWJ2YS0ke1BWfS50YXIuYnoyIgot
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmU0ODk0MGY5NGFjYjBhZjU4
MmU1ZWYwMzUzNzgwMGYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjU4ZWQ0MDk0NThkM2U3YTAw
MGUxOTA4YmM4NTI2MTk2MTVlZTZhOTMzMzU5Yzc0NWZjZDkzZWIzZTQ2MWVjYSIKLQotUyA9ICIk
e1dPUktESVJ9L2xpYnZhLSR7UFZ9IgotCi1HSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRo
dWIuY29tL2ludGVsL2xpYnZhL3JlbGVhc2VzIgotCi1ERVBFTkRTID0gImxpYmRybSIKLQotaW5o
ZXJpdCBtZXNvbiBwa2djb25maWcgZ2l0aHViLXJlbGVhc2VzCi0KLVBBQ0tBR0VDT05GSUdbeDEx
XSA9ICItRHdpdGhfeDExPXllcywtRHdpdGhfeDExPW5vLHZpcnR1YWwvbGlieDExIGxpYnhleHQg
bGlieGZpeGVzIgotUEFDS0FHRUNPTkZJR1tnbHhdID0gIi1Ed2l0aF9nbHg9eWVzLC1Ed2l0aF9n
bHg9bm8sdmlydHVhbC9tZXNhIgotCi1QQUNLQUdFQ09ORklHW3dheWxhbmRdID0gIi1Ed2l0aF93
YXlsYW5kPXllcywtRHdpdGhfd2F5bGFuZD1ubyx3YXlsYW5kLW5hdGl2ZSB3YXlsYW5kIgotCi1C
QkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCi0KLS0gCjIuMzEuMQoK

--===============0732452905059421815==--

