Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB0ACA9EC1
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7537.1685693433978752036
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HD4CpPv3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b2882b0-24507d7c-af59-4d86-987c-17e825e286ac-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IdY9ekhkU8qVZ7nkp1cENdZgF+ukAXYtRmt5ZpeHyFk=;
	b=HD4CpPv3bv0EptNu9ouA7PLd/6hYsrfu3uAziHaKSX9YQVyyaQUeM0YlfK5+Lqia
	DI2nmg32a/uV/WrweN81eNBNcScUbPLVRX/yPcnlnSoJpBO6ch0mUx5VGCvTeNCojLS
	YLXlQJUVo/tN1XaJ7vhwHcNnlnahnTrLb7jRA6tU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IdY9ekhkU8qVZ7nkp1cENdZgF+ukAXYtRmt5ZpeHyFk=;
	b=jgNPXIG72VAhI/xudwVW6Y3baRVOjE8UMJQVw21Tk5s/5sxjkW7N7Z9GrTz4cAwA
	khX0dK0NgUAlUMZ/wk+sMfk6MXSCD7xD1c6udeY7/A5bnqkfjSZi0gAgtuS4b4bhiRk
	/Vjejk1+gqu2sFnE7RbKlZMcONbgWSr7qnMu4/g0=
Content-Type: multipart/mixed; boundary="===============1956103783467748297=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-psutil: upgrading to 5.9.5 SUCCEEDED
Message-ID: <010101887b2882b0-24507d7c-af59-4d86-987c-17e825e286ac-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182213

--===============1956103783467748297==
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
--===============1956103783467748297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-psutil (sysroot):
  /usr/lib/python3.11/site-packages/psutil-5.9.4.dist-info moved to /usr/lib/python3.11/site-packages/psutil-5.9.5.dist-info

--===============1956103783467748297==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-psutil-upgrade-5.9.4-5.9.5.patch"

RnJvbSBiMGQ4YTk2MzlkZTlkNDY4ZjhjN2E2NjA5YjAwNDUzNDQyODk4Y2NmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNjowMzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHN1dGlsOiB1cGdyYWRlIDUuOS40IC0+IDUuOS41CgotLS0KIC4uLnN1dGlsXzUuOS40
LmJiID0+IHB5dGhvbjMtcHN1dGlsXzUuOS41LmJifSB8IDI1ICsrKysrKysrKysrKysrKysrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHN1dGlsXzUuOS40LmJiID0+
IHB5dGhvbjMtcHN1dGlsXzUuOS41LmJifSAoNDclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0aWxfNS45LjQuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHN1dGlsXzUuOS41LmJiCnNpbWlsYXJpdHkgaW5kZXgg
NDclCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wc3V0
aWxfNS45LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wc3V0aWxfNS45LjUuYmIKaW5kZXggMDE5ZWEyZGVjMS4uNzZjN2I3ZWY1YSAxMDA2NDQKLS0t
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

--===============1956103783467748297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-psutil: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.4.tar.gz;downloadfilename=psutil-5.9.4.tar.gz" to "https://files.pythonhosted.org/packages/source/p/psutil/psutil-5.9.5.tar.gz;downloadfilename=psutil-5.9.5.tar.gz"
packages/core2-32-poky-linux/python3-psutil: PV changed from "5.9.4" to "5.9.5"
packages/core2-32-poky-linux/python3-psutil: PKGV changed from 5.9.4 [default] to 5.9.5 [default]
packages/core2-32-poky-linux/python3-psutil/python3-psutil-dbg: PKGSIZE changed from 93392 to 93384 (-0%)
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

--===============1956103783467748297==--

