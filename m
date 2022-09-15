Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA4A2CCA473
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.10729.1663251513125131822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ggm7/R+O;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 010101834183fd0e-bc118041-5357-4c45-ad5c-0b2675a41c1e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6ERcvDMWiO2/BUYj2qVzeykvuiHOlFi1AxLaA7TT+CM=;
	b=Ggm7/R+OwXzuBTjImzTQlKGSYtrJNhhdngd28ZjDzx3RiRe0DIxhrku//4E/IuwL
	CkRrHvLzru1yMceRKcBBZyiZ9j3crY7f2nnihYPWCpVWedwrhhTtucDeMFBFjH/8Fgh
	q7cshkbwsUvtNfH4HlSIMxE3H9R7h6ir1CY/Xz6o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6ERcvDMWiO2/BUYj2qVzeykvuiHOlFi1AxLaA7TT+CM=;
	b=e2Amhf4EqxcuUDyvipYWJBFKFfyTmsEqFgDx6/rC+LTWUiuSKVDyEJbAqpMWcRXR
	JP5S5Yau48kdGF+bk7jYqMqwpTvRBBuRDnYpLSbfC/HNyzcESPik5fqAlEb3ZZgh/uW
	xxdmsSss5J3XKKSMcPCtd9M4jXr5nQtHCXPskZB4=
Content-Type: multipart/mixed; boundary="===============0112586546180996967=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 38.0.1 SUCCEEDED
Message-ID: 
 <010101834183fd0e-bc118041-5357-4c45-ad5c-0b2675a41c1e-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:32 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170715

--===============0112586546180996967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *38.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-37.0.4-38.0.1.patch
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
--===============0112586546180996967==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-37.0.4-38.0.1.patch"

RnJvbSBiMWFjN2FiOWRhYTg5YTBkNTA0OTk1MDMyYWIzODIxYTc4OGQ4ZWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDk6NDY6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDM3LjAuNCAtPiAzOC4wLjEKCi0t
LQogLi4udmVjdG9yc18zNy4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18z
OC4wLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc18zNy4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c18zOC4wLjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM3LjAuNC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zOC4wLjEuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM3LjAuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4
LjAuMS5iYgppbmRleCAyNzBkOGNlY2E2Li40M2U5NmI0ODQ0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzcuMC40
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc18zOC4wLjEuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YTYxNDAwNTEwZTI4OTM3YTU2
NTRiNDBjNmVhNGUzZTU5M2M1YWFmMGMyMDgxYzViOTEyZjBlN2NmODgzZWE4IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjA0MzFmZDEwN2MxZmJhZDAzNzc3MDRhNzA1MTk0NWIzYjM5MTE2OWZkZGM0
ZjZmYTBiZDRlZGM2YjZlMjM1ZGQiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zMS4xCgo=

--===============0112586546180996967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.1.dist-info, removed "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc", added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt /usr/lib/py
 thon3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.1.dist-info
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc was removed
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc was removed

--===============0112586546180996967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-38.0.1.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.1.dist-info, removed "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc", added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der /usr/lib/pyth
 on3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74825906 to 75124827 (+0%)
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.1.dist-info
  /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem was added
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc was removed
  /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc was removed

--===============0112586546180996967==--

