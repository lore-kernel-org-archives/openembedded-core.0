Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B256BC64EC4
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web09.24561.1665871393771325708
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dn8WXTYe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010183ddac31be-8677797f-5d18-4974-ad87-03fb2c328e02-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ofSzny/ZA4CdtD/nU32TqmRSghffFq6QMAlFVxkAQs0=;
	b=dn8WXTYeVk8rgjNOGJiSRzghB5d+JtgAOjqwhQMyeHYTmanvtKWJt77VgEeM8ipN
	/KWA7XlMz/m68wUEa7fVVuH14hJ2oCNHFkSQafT6Bt2RhRyEyZFQws3LRkTy5ocVaPl
	tf7ml9PPlOxjgld5+vI8baYEnd56Q62uwGeiFSj8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ofSzny/ZA4CdtD/nU32TqmRSghffFq6QMAlFVxkAQs0=;
	b=O7MMjod85oYfFJPMMwYJ9Psx7qGj18e/lVG0jAedmEWLWXbE8KaNoSxSwnIQd8Pv
	tHjAGwymhNlmYOsxS3rpQfQRt8a1EYKkk4lYGmYgbgX5ETjWnQV/ZTMDyMd0qwybQNN
	AMDpOk7wTxKRc5YGFUlsaa1XIol518P9akttg3zA=
Content-Type: multipart/mixed; boundary="===============1319989441800504803=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 38.0.2 SUCCEEDED
Message-ID: <01010183ddac31be-8677797f-5d18-4974-ad87-03fb2c328e02-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171769

--===============1319989441800504803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *38.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-37.0.4-38.0.2.patch
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
--===============1319989441800504803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.2.dist-info, removed "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc", added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem /usr/lib/
 python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.2.dist-info
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

--===============1319989441800504803==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-37.0.4-38.0.2.patch"

RnJvbSAxYjVmYjVkMzZhMzYzY2E3YjlmYWQzOWM2YzMzMTcwNDUzNTU2NWUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMDk6NTY6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDM3LjAuNCAtPiAzOC4wLjIKCi0t
LQogLi4udmVjdG9yc18zNy4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18z
OC4wLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc18zNy4wLjQuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c18zOC4wLjIuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM3LjAuNC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zOC4wLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM3LjAuNC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4
LjAuMi5iYgppbmRleCAyNzBkOGNlY2E2Li5lYzAwOGVhODBiIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzcuMC40
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc18zOC4wLjIuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1YTYxNDAwNTEwZTI4OTM3YTU2
NTRiNDBjNmVhNGUzZTU5M2M1YWFmMGMyMDgxYzViOTEyZjBlN2NmODgzZWE4IgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImViNjM3YzdkODJlZDdkM2E2YWRkMjBhN2YxMDBjZDU0YzYyYzA3MjdkZTVl
ZjExNzczYjA4MDcwY2ZjYThkZDEiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zMS4xCgo=

--===============1319989441800504803==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-38.0.2.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "37.0.4" to "38.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 37.0.4 [default] to 38.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.2.dist-info, removed "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc", added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der 
 /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74825906 to 75124827 (+0%)
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "37.0.4" to "38.0.2"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info moved to /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.2.dist-info
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

--===============1319989441800504803==--

