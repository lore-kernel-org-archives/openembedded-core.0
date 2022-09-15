Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01803C6FA99
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com
 (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web08.10731.1663251513253842752
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=g8V9xlhz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45,
 mailfrom: 010101834183fc1b-ed9ade01-6317-44a0-b7df-e565cd2be476-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hecHs4QQ3pOHrOjN6OAaiGb1Ffg2A/69xPruON6sJX0=;
	b=g8V9xlhzHHfNZ15nebfqJ+IaF7MIM5kAlIfWHbmGcEQS9HVcuK1p+yRhETaj4KTJ
	eg2fyKCN+moeE46bvb+GPCbAAWGZFD+xISLxEm0oKXgkr72oCFhLYtN3Obqt1bT1bf6
	9cshz3rv6PNp31MozhpSDw7Fd0GHlvMyU0+4HbcU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hecHs4QQ3pOHrOjN6OAaiGb1Ffg2A/69xPruON6sJX0=;
	b=gPzaRaWkh4P96nH0nB4BHF9OkEtKS7AM0LIi9VK5FCyjN+blfGnLr6SBne69uRyT
	9n1SwIWaLcv+gQ5xpiBYIhGSSlbKR5nJGvMIGAY1XAYw8qiyefKaaIyLvNiY01AE+V2
	QNf3zisbXnvGDw+w50LlKMUwHf7CCttsh5EWLsqM=
Content-Type: multipart/mixed; boundary="===============0238630686848410153=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-certifi: upgrading to 2022.9.14 SUCCEEDED
Message-ID: 
 <010101834183fc1b-ed9ade01-6317-44a0-b7df-e565cd2be476-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170723

--===============0238630686848410153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-certifi* to *2022.9.14* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-certifi-upgrade-2022.6.15-2022.9.14.patch
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
--===============0238630686848410153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.10/site-packages/certifi-2022.6.15.dist-info moved to /usr/lib/python3.10/site-packages/certifi-2022.9.14.dist-info

--===============0238630686848410153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-certifi: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.6.15.tar.gz" to "https://files.pythonhosted.org/packages/source/c/certifi/certifi-2022.9.14.tar.gz"
packages/core2-32-poky-linux/python3-certifi: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dbg: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-dev: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-doc: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-locale: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-src: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi-staticdev: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGV changed from 2022.6.15 [default] to 2022.9.14 [default]
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PV changed from "2022.6.15" to "2022.9.14"
packages/core2-32-poky-linux/python3-certifi/python3-certifi: PKGSIZE changed from 294999 to 301096 (+2%)
Changes to packages/core2-32-poky-linux/python3-certifi (sysroot):
  /usr/lib/python3.10/site-packages/certifi-2022.6.15.dist-info moved to /usr/lib/python3.10/site-packages/certifi-2022.9.14.dist-info

--===============0238630686848410153==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-certifi-upgrade-2022.6.15-2022.9.14.patch"

RnJvbSA5NDY4YjU3M2U4ZmI1MDI0NjRkMjE4YzFlODEzZTI3YmExNGQzZmJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6MTE6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNlcnRpZmk6IHVwZ3JhZGUgMjAyMi42LjE1IC0+IDIwMjIuOS4xNAoKLS0tCiAuLi4y
LjYuMTUuYmIgPT4gcHl0aG9uMy1jZXJ0aWZpXzIwMjIuOS4xNC5iYn0gfCAyNiArKysrKysrKysr
KysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNlcnRpZmlf
MjAyMi42LjE1LmJiID0+IHB5dGhvbjMtY2VydGlmaV8yMDIyLjkuMTQuYmJ9ICgyOCUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAy
Mi42LjE1LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlf
MjAyMi45LjE0LmJiCnNpbWlsYXJpdHkgaW5kZXggMjglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuNi4xNS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNlcnRpZmlfMjAyMi45LjE0LmJi
CmluZGV4IGY3ODQwOWIxNzcuLjU0ZTUwM2E5MzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1jZXJ0aWZpXzIwMjIuNi4xNS5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2VydGlmaV8yMDIyLjkuMTQuYmIKQEAgLTEs
MyArMSwyNSBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVl
biB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBs
ZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRo
ZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicg
dGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRl
ZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJQ0VOU0UK
KyMgQEAgLTYsNyArNiw3IEBACisjICBUaGlzIGlzIGEgYnVuZGxlIG9mIFguNTA5IGNlcnRpZmlj
YXRlcyBvZiBwdWJsaWMgQ2VydGlmaWNhdGUgQXV0aG9yaXRpZXMKKyMgIChDQSkuIFRoZXNlIHdl
cmUgYXV0b21hdGljYWxseSBleHRyYWN0ZWQgZnJvbSBNb3ppbGxhJ3Mgcm9vdCBjZXJ0aWZpY2F0
ZXMKKyMgIGZpbGUgKGNlcnRkYXRhLnR4dCkuICBUaGlzIGZpbGUgY2FuIGJlIGZvdW5kIGluIHRo
ZSBtb3ppbGxhIHNvdXJjZSB0cmVlOgorIyAtaHR0cDovL214ci5tb3ppbGxhLm9yZy9tb3ppbGxh
L3NvdXJjZS9zZWN1cml0eS9uc3MvbGliL2NrZncvYnVpbHRpbnMvY2VydGRhdGEudHh0P3Jhdz0x
IworIyAraHR0cHM6Ly9oZy5tb3ppbGxhLm9yZy9tb3ppbGxhLWNlbnRyYWwvZmlsZS90aXAvc2Vj
dXJpdHkvbnNzL2xpYi9ja2Z3L2J1aWx0aW5zL2NlcnRkYXRhLnR4dAorIyAgSXQgY29udGFpbnMg
dGhlIGNlcnRpZmljYXRlcyBpbiBQRU0gZm9ybWF0IGFuZCB0aGVyZWZvcmUKKyMgIGNhbiBiZSBk
aXJlY3RseSB1c2VkIHdpdGggY3VybCAvIGxpYmN1cmwgLyBwaHBfY3VybCwgb3Igd2l0aAorIyAg
YW4gQXBhY2hlK21vZF9zc2wgd2Vic2VydmVyIGZvciBTU0wgY2xpZW50IGF1dGhlbnRpY2F0aW9u
LgorIyAKKyMKKwogU1VNTUFSWSA9ICJQeXRob24gcGFja2FnZSBmb3IgcHJvdmlkaW5nIE1vemls
bGEncyBDQSBCdW5kbGUuIgogREVTQ1JJUFRJT04gPSAiVGhpcyBpbnN0YWxsYWJsZSBQeXRob24g
cGFja2FnZSBjb250YWlucyBhIENBIEJ1bmRsZSB0aGF0IHlvdSBjYW4gcmVmZXJlbmNlIGluIHlv
dXIgXAogUHl0aG9uIGNvZGUuIFRoaXMgaXMgdXNlZnVsIGZvciB2ZXJpZnlpbmcgSFRUUCByZXF1
ZXN0cywgZm9yIGV4YW1wbGUuICBUaGlzIGlzIHRoZSBzYW1lIENBIEJ1bmRsZSBcCkBAIC01LDkg
KzI3LDkgQEAgd2hpY2ggc2hpcHMgd2l0aCB0aGUgUmVxdWVzdHMgY29kZWJhc2UsIGFuZCBpcyBk
ZXJpdmVkIGZyb20gTW96aWxsYSBGaXJlZm94J3MgY2EKIEhPTUVQQUdFID0gIiBodHRwOi8vY2Vy
dGlmaS5pby8iCiAKIExJQ0VOU0UgPSAiSVNDIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
TElDRU5TRTttZDU9NjdkYTA3MTRjM2Y5NDcxMDY3YjcyOWVjYTZjOWZiZTgiCitMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT0zYzJiNzQwNDM2OWM1ODdjMzU1OWFmYjYwNGZj
ZTJmMiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjg0Yzg1YTkwNzhiMTExMDVmMDRmMzAzNmE5
NDgyYWUxMGU0NjIxNjE2ZGIzMTNmZTA0NWRkMjQ3NDNhMDgyMGQiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMzY5NzM4ODViOTU0MmU2YmQwMWRlYTI4N2IyYjRiM2IyMTIzNjMwN2M1NjMyNGZjYzNm
MTE2MGYyZDY1NWVkNSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzEuMQoK

--===============0238630686848410153==--

