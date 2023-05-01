Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4436AC88C99
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.107894.1682976350938683793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RpDu4H23;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010187d9351fe7-38ef6cf4-046a-4404-a4bc-176ac7b6f07b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=J0MsZeSwXT19/b8/bP3Of8ZPIqeSaM+vI2kgmqL7aaI=;
	b=RpDu4H23GzUS+h6zVYmn/dXN5hNFwHyHhl1WbUgJqzzRxU0PdRwfkKh8SOmann0S
	F+kr9pliDt1HBocGF/0hGFt/tFSDwwQuB7JejMK6J6zv1YkTvM0VMHu1L90DquVZ91n
	6mopC9ElQqr8epbnXVETP4GyH9QxhpCIXkvn67ww=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=J0MsZeSwXT19/b8/bP3Of8ZPIqeSaM+vI2kgmqL7aaI=;
	b=HpDzrBG9IZS07D0akGUhZeieyTyvqTC1vFI4uq1At5WzkyqOtQmd70g1stfJpEZj
	Yr8wQLZGZkxJHScMbW0zvhSqXRjkxpN3+au3ZmQ/qRJ1S7BurPnu5lKUfxADakLj2M6
	el37f2UzfHIalbXQlJgjsZ7DlE6Sj67diXKsRYcw=
Content-Type: multipart/mixed; boundary="===============7379995312817748697=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.5 SUCCEEDED
Message-ID: <01010187d9351fe7-38ef6cf4-046a-4404-a4bc-176ac7b6f07b-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180628

--===============7379995312817748697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-psutil* to *5.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-psutil-upgrade-5.9.4-5.9.5.patch
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
--===============7379995312817748697==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-5.9.4-5.9.5.patch"

RnJvbSBhZWIyMjA1YjU3MzM4NjlkZDM0NjI2MTg5NzkxYzAwNjE3ZmE0NmViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTozNDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHN1dGlsOiB1cGdyYWRlIDUuOS40IC0+IDUuOS41CgotLS0KIC4uLnN1dGlsXzUuOS40
LmJiID0+IHB5dGhvbjMtcHN1dGlsXzUuOS41LmJifSB8IDI1ICsrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHN1dGlsXzUuOS40LmJiID0+
IHB5dGhvbjMtcHN1dGlsXzUuOS41LmJifSAoNDglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNS45LjQuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS41LmJiCnNpbWlsYXJpdHkgaW5kZXgg
NDglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0
aWxfNS45LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wc3V0aWxfNS45LjUuYmIKaW5kZXggYzA5NzdjNzRkMy4uYTc1Mzk3M2U4YSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBzdXRpbF81LjkuNC5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS41LmJi
CkBAIC0xLDkgKzEsMzAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBo
YXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBp
cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0
LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1h
cml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVw
ZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJz
IHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFCisjICsrKyBM
SUNFTlNFCisjIEBAIC0xLDYgKzEsNiBAQAorIyAgQlNEIDMtQ2xhdXNlIExpY2Vuc2UKKyMgIAor
IyAtQ29weXJpZ2h0IChjKSAyMDA5LCBKYXkgTG9kZW4sIERhdmUgRGFlc2NobGVyLCBHaWFtcGFv
bG8gUm9kb2xhJworIyArQ29weXJpZ2h0IChjKSAyMDA5LCBKYXkgTG9kZW4sIERhdmUgRGFlc2No
bGVyLCBHaWFtcGFvbG8gUm9kb2xhCisjICBBbGwgcmlnaHRzIHJlc2VydmVkLgorIyAgCisjICBS
ZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGluIHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9y
IHdpdGhvdXQgbW9kaWZpY2F0aW9uLAorIyAKKyMKKwogU1VNTUFSWSA9ICJBIGNyb3NzLXBsYXRm
b3JtIHByb2Nlc3MgYW5kIHN5c3RlbSB1dGlsaXRpZXMgbW9kdWxlIGZvciBQeXRob24iCiBMSUNF
TlNFID0gIkJTRC0zLUNsYXVzZSIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PWUzNWZkOWYyNzFkMTlkNWY3NDJmMjBhOWQxZjhiYjhiIgorTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9YTljNzIxMTNhODQzZDBkNzMyYTBhYzFjMjAwZDgxYjEiCiBI
T01FUEFHRSA9ICJodHRwczovL3B5cGkub3JnL3Byb2plY3QvcHN1dGlsLyIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjNkN2Y5NzM5ZWI0MzVkNGIxMzM4OTQ0YWJlMjNmNDk1ODRiZGU1Mzk1ZjI3
NDg3ZDJlZTI1YWQ5YTg3NzRhNjIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTQxMDYzOGU0ZGYz
OWM1NGQ5NTdmYzUxY2UwMzA0OGFjZDhlNmQ2MGFiYzBmNTEwN2FmNTFlNWZiNTY2ZWIzYyIKIAog
aW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzkuMgoK

--===============7379995312817748697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-psutil: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.4.tar.gz;downloadfilename=psutil-5.9.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.5.tar.gz;downloadfilename=psutil-5.9.5.tar.gz"
packages/core2-32-poky-linux/python3-psutil: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 92332 to 92324 (-0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dev: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-doc: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-locale: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGSIZE changed from 60876 to 61218 (+1%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-src: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-staticdev: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGSIZE changed from 1322696 to 1342645 (+2%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil-tests: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGSIZE changed from 865576 to 869047 (+0%)
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil/python3-psutil: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.4.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info

--===============7379995312817748697==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.4.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info

--===============7379995312817748697==--

