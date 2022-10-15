Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB83EC64ED8
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.24559.1665871393398410313
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=nP0ZHJv7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac2f3f-39d0ace1-f8a1-4835-a71a-216ecccd46dc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ugMwRbpySMJoe99rkWGaoVvE7gFi4TvM04NF93oY7sY=;
	b=nP0ZHJv7KfdFLzer3IXQAXGx6kPVC5deW8qsJ7e1gDTOF4Q5PcT3L1FzwsPLD/VX
	pc730yScwzuq3aM7B/syaD1MLryd6ywiTJnjU7Pi5e0GJRlpCMArPu3HNW/EH1lBQRl
	VMVc4WzqUrH+SojFjBJ9nq7bxFlDVS/481RSgEx8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871392;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ugMwRbpySMJoe99rkWGaoVvE7gFi4TvM04NF93oY7sY=;
	b=Em64iTwBmPKHVuEB9+IBbzJ0ibZhnwJXokksx+gJA5S3FnoZmezKCL3Kinrf1bYO
	Rmsd/VW25i3MbWZXvNx+KpvI7yTtf4RM9Sylww+6i1ACSzgKe/zMR+FPHVIEXQI7RNE
	MUSwoNoFBsJyX/p59nOqxvirlJ5xuMZl56Zr7K6U=
Content-Type: multipart/mixed; boundary="===============8949670897070916912=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffstat: upgrading to 1.65 SUCCEEDED
Message-ID: <01010183ddac2f3f-39d0ace1-f8a1-4835-a71a-216ecccd46dc-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:12 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171759

--===============8949670897070916912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffstat* to *1.65* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffstat-upgrade-1.64-1.65.patch
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
--===============8949670897070916912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 558757 to 623782 (+12%)
packages/core2-32-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case44p1.ref /usr/lib/diffstat/ptest/testing/case46p9.ref /usr/lib/diffstat/ptest/testing/case43k.ref /usr/lib/diffstat/ptest/testing/case42p9.ref /usr/lib/diffstat/ptest/testing/case42Rp0.ref /usr/lib/diffstat/ptest/testing/case46u.ref /usr/lib/diffstat/ptest/testing/case42b.ref /usr/lib/diffstat/ptest/testing/case44r1.ref /usr/lib/diffstat/ptest/testing/case44.ref /usr/lib/diffstat/ptest/testing/case43.pat /usr/lib/diffstat/ptest/testing/case43p1.ref /usr/lib/diffstat/ptest/testing/case46f0.ref /usr/lib/diffstat/ptest/testing/case45Rp0.ref /usr/lib/diffstat/ptest/testing/case42r1.ref /usr/lib/diffstat/ptest/testing/case45p9.ref /usr/lib/diffstat/ptest/testing/case44Rp0.ref /usr/lib/diffstat/ptest/testing/case45R.ref /usr/lib/diffstat/ptest/testing/case44r2.ref /usr/lib/diffstat/ptest/testing/case43b.ref /usr/lib/diffstat/ptest/testing/case46.pat /usr/lib/diffstat/ptest/testing/cas
 e46Rp0.ref /usr/lib/diffstat/ptest/testing/case45.ref /usr/lib/diffstat/ptest/testing/case43r1.ref /usr/lib/diffstat/ptest/testing/case46r2.ref /usr/lib/diffstat/ptest/testing/case43f0.ref /usr/lib/diffstat/ptest/testing/case45u.ref /usr/lib/diffstat/ptest/testing/case43Rp0.ref /usr/lib/diffstat/ptest/testing/case42k.ref /usr/lib/diffstat/ptest/testing/case45.pat /usr/lib/diffstat/ptest/testing/case42.ref /usr/lib/diffstat/ptest/testing/case46k.ref /usr/lib/diffstat/ptest/testing/case46p1.ref /usr/lib/diffstat/ptest/testing/case43R.ref /usr/lib/diffstat/ptest/testing/case42p1.ref /usr/lib/diffstat/ptest/testing/case42R.ref /usr/lib/diffstat/ptest/testing/case43p9.ref /usr/lib/diffstat/ptest/testing/case44f0.ref /usr/lib/diffstat/ptest/testing/case46R.ref /usr/lib/diffstat/ptest/testing/case42u.ref /usr/lib/diffstat/ptest/testing/case45f0.ref /usr/lib/diffstat/ptest/testing/case42r2.ref /usr/lib/diffstat/ptest/testing/case44R.ref /usr/lib/diffstat/ptest/testing/case46b.ref /usr/lib/d
 iffstat/ptest/testing/case44.pat /usr/lib/diffstat/ptest/testing/case45b.ref /usr/lib/diffstat/ptest/testing/case43u.ref /usr/lib/diffstat/ptest/testing/case45r1.ref /usr/lib/diffstat/ptest/testing/case46r1.ref /usr/lib/diffstat/ptest/testing/case44b.ref /usr/lib/diffstat/ptest/testing/case45r2.ref /usr/lib/diffstat/ptest/testing/case42.pat /usr/lib/diffstat/ptest/testing/case42f0.ref /usr/lib/diffstat/ptest/testing/case45k.ref /usr/lib/diffstat/ptest/testing/case44k.ref /usr/lib/diffstat/ptest/testing/case46.ref /usr/lib/diffstat/ptest/testing/case43r2.ref /usr/lib/diffstat/ptest/testing/case44u.ref /usr/lib/diffstat/ptest/testing/case45p1.ref /usr/lib/diffstat/ptest/testing/case43.ref /usr/lib/diffstat/ptest/testing/case44p9.ref"

--===============8949670897070916912==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffstat-upgrade-1.64-1.65.patch"

RnJvbSA3YjNkNjNhMTdlMGUxMzFjMDI2ZmZjZGY3OGRjNmM2NzUxZTM0NzIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDg6MzQ6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmc3RhdDogdXBncmFkZSAxLjY0IC0+IDEuNjUKCi0tLQogLi4uL3tkaWZmc3RhdF8xLjY0LmJi
ID0+IGRpZmZzdGF0XzEuNjUuYmJ9ICAgIHwgMjMgKysrKysrKysrKysrKysrKystLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L3tkaWZmc3RhdF8xLjY0LmJiID0+IGRpZmZzdGF0XzEu
NjUuYmJ9ICg0NyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0
L2RpZmZzdGF0XzEuNjQuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0
YXRfMS42NS5iYgpzaW1pbGFyaXR5IGluZGV4IDQ3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZGlmZnN0YXQvZGlmZnN0YXRfMS42NC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0XzEuNjUuYmIKaW5kZXggNzE3ZjUwMzAzOS4uYzNl
ZjllNDYxNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L2RpZmZz
dGF0XzEuNjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RpZmZzdGF0L2RpZmZzdGF0
XzEuNjUuYmIKQEAgLTEsMyArMSwyMiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0g
dmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9s
bG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNl
bnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBh
bmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xp
Y2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmln
aHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcK
KyMgKysrIENPUFlJTkcKKyMgQEAgLTEsNCArMSw0IEBACisjIC1Db3B5cmlnaHQgMTk5NC0yMDE5
LDIwMjEgYnkgVGhvbWFzIEUuIERpY2tleQorIyArQ29weXJpZ2h0IDE5OTQtMjAyMSwyMDIyIGJ5
IFRob21hcyBFLiBEaWNrZXkKKyMgIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjICAKKyMgIFBlcm1p
c3Npb24gdG8gdXNlLCBjb3B5LCBtb2RpZnksIGFuZCBkaXN0cmlidXRlIHRoaXMgc29mdHdhcmUg
YW5kIGl0cworIyAKKyMKKwogU1VNTUFSWSA9ICJUb29sIHRvIHByb2R1Y2UgYSBzdGF0aXN0aWNz
IGJhc2VkIG9uIGEgZGlmZiIKIERFU0NSSVBUSU9OID0gImRpZmZzdGF0IHJlYWRzIHRoZSBvdXRw
dXQgb2YgZGlmZiBhbmQgZGlzcGxheXMgYSBoaXN0b2dyYW0gb2YgXAogdGhlIGluc2VydGlvbnMs
IGRlbGV0aW9ucywgYW5kIG1vZGlmaWNhdGlvbnMgcGVyLWZpbGUuIEl0IGlzIHVzZWZ1bCBmb3Ig
XApAQCAtNSwxNCArMjQsMTQgQEAgcmV2aWV3aW5nIGxhcmdlLCBjb21wbGV4IHBhdGNoIGZpbGVz
LiIKIEhPTUVQQUdFID0gImh0dHA6Ly9pbnZpc2libGUtaXNsYW5kLm5ldC9kaWZmc3RhdC8iCiBT
RUNUSU9OID0gImRldmVsIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9DT1BZSU5HO21kNT1mNjA1YjE5ODZjYzNiODA4ZWMwZTRmYTlkMGUwZjJkOSIKK0xJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY0NTA1OTQwNDlmMGVlZDEwNTJlNjM0
ZGRjYmVlYzI4IgogCiBTUkNfVVJJID0gImh0dHA6Ly9pbnZpc2libGUtbWlycm9yLm5ldC9hcmNo
aXZlcy8ke0JQTn0vJHtCUH0udGd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAg
ICAgICAgICAgIGZpbGU6Ly9hdm9pZC1jaGVjay11c2VyLWJyZWFrLWNjLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjhhZWUzOGQ5ZDJlMWQwNTkyNmU2YjU1
ODEwYTlkMmMyZGQ0MDdmMjRkNmEyNjczODc1NjNhNDQzNmUzZjdmYyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI4Y2YyNzQyNDkyNmRlYmNkODU5MjE3NTVjMzkxNTU1OTI4ODI0NGJkMTAzZjYyZDc0
MGRjNmI4M2I1NTdhMjhhIgogCiBpbmhlcml0IGF1dG90b29scyBnZXR0ZXh0IHB0ZXN0CiAKLS0g
CjIuMzEuMQoK

--===============8949670897070916912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffstat/diffstat-dbg: PKGSIZE changed from 115600 to 115984 (+0%)
packages/core2-32-poky-linux/diffstat/diffstat-dbg: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-dbg: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-dev: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-dev: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-doc: PKGSIZE changed from 9069 to 9066 (-0%)
packages/core2-32-poky-linux/diffstat/diffstat-doc: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-doc: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-locale: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-locale: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGSIZE changed from 558757 to 623782 (+12%)
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-ptest: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-ptest: FILELIST: added "/usr/lib/diffstat/ptest/testing/case42r1.ref /usr/lib/diffstat/ptest/testing/case46p9.ref /usr/lib/diffstat/ptest/testing/case45r2.ref /usr/lib/diffstat/ptest/testing/case42R.ref /usr/lib/diffstat/ptest/testing/case43f0.ref /usr/lib/diffstat/ptest/testing/case44Rp0.ref /usr/lib/diffstat/ptest/testing/case44.pat /usr/lib/diffstat/ptest/testing/case44r1.ref /usr/lib/diffstat/ptest/testing/case42k.ref /usr/lib/diffstat/ptest/testing/case46f0.ref /usr/lib/diffstat/ptest/testing/case46k.ref /usr/lib/diffstat/ptest/testing/case46u.ref /usr/lib/diffstat/ptest/testing/case45r1.ref /usr/lib/diffstat/ptest/testing/case44p1.ref /usr/lib/diffstat/ptest/testing/case45b.ref /usr/lib/diffstat/ptest/testing/case45k.ref /usr/lib/diffstat/ptest/testing/case43p9.ref /usr/lib/diffstat/ptest/testing/case45p9.ref /usr/lib/diffstat/ptest/testing/case44.ref /usr/lib/diffstat/ptest/testing/case43k.ref /usr/lib/diffstat/ptest/testing/case4
 3r2.ref /usr/lib/diffstat/ptest/testing/case44f0.ref /usr/lib/diffstat/ptest/testing/case43b.ref /usr/lib/diffstat/ptest/testing/case45Rp0.ref /usr/lib/diffstat/ptest/testing/case42.ref /usr/lib/diffstat/ptest/testing/case45p1.ref /usr/lib/diffstat/ptest/testing/case42Rp0.ref /usr/lib/diffstat/ptest/testing/case46r2.ref /usr/lib/diffstat/ptest/testing/case42f0.ref /usr/lib/diffstat/ptest/testing/case43R.ref /usr/lib/diffstat/ptest/testing/case42.pat /usr/lib/diffstat/ptest/testing/case43p1.ref /usr/lib/diffstat/ptest/testing/case44k.ref /usr/lib/diffstat/ptest/testing/case42p9.ref /usr/lib/diffstat/ptest/testing/case42u.ref /usr/lib/diffstat/ptest/testing/case43.ref /usr/lib/diffstat/ptest/testing/case46r1.ref /usr/lib/diffstat/ptest/testing/case44u.ref /usr/lib/diffstat/ptest/testing/case42p1.ref /usr/lib/diffstat/ptest/testing/case46R.ref /usr/lib/diffstat/ptest/testing/case45R.ref /usr/lib/diffstat/ptest/testing/case42r2.ref /usr/lib/diffstat/ptest/testing/case43Rp0.ref /usr/lib/
 diffstat/ptest/testing/case46.ref /usr/lib/diffstat/ptest/testing/case44p9.ref /usr/lib/diffstat/ptest/testing/case45u.ref /usr/lib/diffstat/ptest/testing/case45.pat /usr/lib/diffstat/ptest/testing/case46b.ref /usr/lib/diffstat/ptest/testing/case44r2.ref /usr/lib/diffstat/ptest/testing/case42b.ref /usr/lib/diffstat/ptest/testing/case46.pat /usr/lib/diffstat/ptest/testing/case43r1.ref /usr/lib/diffstat/ptest/testing/case44b.ref /usr/lib/diffstat/ptest/testing/case46p1.ref /usr/lib/diffstat/ptest/testing/case43u.ref /usr/lib/diffstat/ptest/testing/case43.pat /usr/lib/diffstat/ptest/testing/case44R.ref /usr/lib/diffstat/ptest/testing/case45f0.ref /usr/lib/diffstat/ptest/testing/case46Rp0.ref /usr/lib/diffstat/ptest/testing/case45.ref"
packages/core2-32-poky-linux/diffstat/diffstat-src: PKGSIZE changed from 85056 to 85350 (+0%)
packages/core2-32-poky-linux/diffstat/diffstat-src: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-src: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat-staticdev: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat-staticdev: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat/diffstat: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat/diffstat: PV changed from "1.64" to "1.65"
packages/core2-32-poky-linux/diffstat: SRC_URI changed from "http://invisible-mirror.net/archives/diffstat/diffstat-1.64.tgz file://run-ptest file://avoid-check-user-break-cc.patch" to "http://invisible-mirror.net/archives/diffstat/diffstat-1.65.tgz file://run-ptest file://avoid-check-user-break-cc.patch"
packages/core2-32-poky-linux/diffstat: PKGV changed from 1.64 [default] to 1.65 [default]
packages/core2-32-poky-linux/diffstat: PV changed from "1.64" to "1.65"

--===============8949670897070916912==--

