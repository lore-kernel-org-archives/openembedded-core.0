Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CC7C4743C
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.348.1664643227339181344
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b7ErMKuQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101839477db94-4c673179-56c6-484f-9d9c-bb8fe1733119-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=s+5fDoBIl7J9G12IPBZWCfcMUW8v/XcYFiPipcCziq0=;
	b=b7ErMKuQetF30tgrKIZBULeZ6DiihFBlJGt+nvvhhDK7H3vsGksG6xUdQHlPTGtO
	AFqaorkczM2IEVJm+rHouPqMuC9QHT7VAMoYtrHsK7RjJmfNM4y1DT/kCAnIAjEdf9/
	BuQ/tX4w3n1AU3yVzCT02UaO1+n8eXZetxu0OFAc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643226;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=s+5fDoBIl7J9G12IPBZWCfcMUW8v/XcYFiPipcCziq0=;
	b=OKYfU55RFgt3uvnAdtMZBSKJH0irws8crUoQG+TdXZpE1zLewjRZQFzJeB0QzSZ4
	MwPGz49le8PErDP4KE62yNUCh4D4USI5QvecThzQcNnx1UJKDwmPWe8LhJI5la49APB
	yoW3LXrQAAVfNzBtEPoNjiyevb6uDW7WN8v/UriU=
Content-Type: multipart/mixed; boundary="===============3635078607830595270=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 38.0.1 SUCCEEDED
Message-ID: 
 <010101839477db94-4c673179-56c6-484f-9d9c-bb8fe1733119-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:46 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171278

--===============3635078607830595270==
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
--===============3635078607830595270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.1.dist-info, removed "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc", added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_version.pem /usr/l
 ib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der"
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

--===============3635078607830595270==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-37.0.4-38.0.1.patch"

RnJvbSBmYWE4YmM3MjdkYjk0ZDJkN2ZiZWYwZjA4ZmExZGZmNzY2ZTNmMWNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAwODoxMDozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUgMzcuMC40IC0+IDM4LjAuMQoKLS0t
CiAuLi52ZWN0b3JzXzM3LjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4
LjAuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzXzM3LjAuNC5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
XzM4LjAuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzcuMC40LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM4LjAuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzcuMC40LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzgu
MC4xLmJiCmluZGV4IDI3MGQ4Y2VjYTYuLjQzZTk2YjQ4NDQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zNy4wLjQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzXzM4LjAuMS5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBO
T1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFz
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRo
ZSBzYW1lIHRpbWUKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVhNjE0MDA1MTBlMjg5MzdhNTY1
NGI0MGM2ZWE0ZTNlNTkzYzVhYWYwYzIwODFjNWI5MTJmMGU3Y2Y4ODNlYTgiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiMDQzMWZkMTA3YzFmYmFkMDM3NzcwNGE3MDUxOTQ1YjNiMzkxMTY5ZmRkYzRm
NmZhMGJkNGVkYzZiNmUyMzVkZCIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0
b3JzIgogCi0tIAoyLjMxLjEKCg==

--===============3635078607830595270==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-37.0.4.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-38.0.1.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "37.0.4" to "38.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 37.0.4 [default] to 38.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 74825906 to 75124827 (+0%)
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.10/site-packages/cryptography_vectors-37.0.4.dist-info -> /usr/lib/python3.10/site-packages/cryptography_vectors-38.0.1.dist-info, removed "/usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__init__.cpython-39.pyc /usr/lib/python3.10/site-packages/cryptography_vectors/__pycache__/__about__.cpython-39.pyc", added "/usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-anonymous-sig.der /usr/lib/python3.10/site-packages/cryptography_vectors/asymmetric/PKCS8/rsa_pss_2048_pub.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/long-form-name-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/bad-version.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/requests/long-form-attribute.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_bad_ve
 rsion.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/badssl-sct-none-hash.der /usr/lib/python3.10/site-packages/cryptography_vectors/ciphers/AES/OCB3/openssl.txt /usr/lib/python3.10/site-packages/cryptography_vectors/x509/cryptography-scts-tbs-precert.der /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/rsa_pss_cert.pem /usr/lib/python3.10/site-packages/cryptography_vectors/x509/custom/crl_almost_10k.pem"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "37.0.4" to "38.0.1"
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

--===============3635078607830595270==--

