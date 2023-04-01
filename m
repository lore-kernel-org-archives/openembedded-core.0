Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904FDC88CBD
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.32124.1680384534535511736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OaMhCXNl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101873eb924d6-b85d50f2-1547-4856-848e-d436f3dd1245-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=y4FOPHjIz8TJfslS5C5GVWLGRpiCYO9cLTIUrQjIcYI=;
	b=OaMhCXNltYH5FLrGt2866FJ+zfJOzgay0GuSfMiug44g43POnAWq9grlz2Xfnd5v
	+/iTwrroUN8xCTEbTIwM63Tlkrxv4h/1Jv6Ej/gcTotXa0XRhJoVAGsDgdi6AbFNHAo
	zmWfIQmxkcOIqV22XAcov8m99l/bqoi2YoUKCSpc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=y4FOPHjIz8TJfslS5C5GVWLGRpiCYO9cLTIUrQjIcYI=;
	b=c903zVbVF8G5xV/2p54jCGN7loJiDLI6B3TD73tDvJnThOudmHAahgSQk2hAeu+d
	H7lcAUsK4/BqVnmjqdlOAVsjcqmNzbuMagjH51RFqkBZEuIQ7GCfHH7CNTiZZfDLJke
	bN5Hi1RJrsCZmvCUoHqc3as9Y3fVjjkg6iksRFrc=
Content-Type: multipart/mixed; boundary="===============0487141039301665092=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 40.0.1 SUCCEEDED
Message-ID: <010101873eb924d6-b85d50f2-1547-4856-848e-d436f3dd1245-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179494

--===============0487141039301665092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *40.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-39.0.2-40.0.1.patch
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
--===============0487141039301665092==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-39.0.2-40.0.1.patch"

RnJvbSBlODIwZWFlZGRjMzZjYTllYTcyMjZiMDAyYzExNTExYzM2ZTNlYmRmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwOToxMToyNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnM6IHVwZ3JhZGUgMzkuMC4yIC0+IDQwLjAuMQoKLS0t
CiAuLi52ZWN0b3JzXzM5LjAuMi5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQw
LjAuMS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWNyeXB0
b2dyYXBoeS12ZWN0b3JzXzM5LjAuMi5iYiA9PiBweXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3Jz
XzQwLjAuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzkuMC4yLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQwLjAuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzkuMC4yLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfNDAu
MC4xLmJiCmluZGV4IDc5NWUyN2Y3NWIuLmFhMzA1ZGQ3MzYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc18zOS4wLjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBo
eS12ZWN0b3JzXzQwLjAuMS5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRTttZDU9OGMzNjE3ZGI0ZmI2ZmFlMDFmMWQyNTNhYjkxNTExZTQgXAogIyBO
T1RFOiBNYWtlIHN1cmUgdG8ga2VlcCB0aGlzIHJlY2lwZSBhdCB0aGUgc2FtZSB2ZXJzaW9uIGFz
IHB5dGhvbjMtY3J5cHRvZ3JhcGh5CiAjICAgICAgIFVwZ3JhZGUgYm90aCByZWNpcGVzIGF0IHRo
ZSBzYW1lIHRpbWUKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImE2OGYxMDZmN2E0MzIyY2YxZTdl
ZDUxZTNmYzZkNWMxZTBiMTFkMzM3ZWQ5MThlYzg3OWU4YWZlMGMyYTUyMjAiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiODQ2MDcwNmI1YjVkMGNlNGE4NTU3MWNhMzM4OWNmODhmNzAwYmI2YTBjNjEz
M2RjOWZlMGY1YTJmNWJkYTA0MSIKIAogUFlQSV9QQUNLQUdFID0gImNyeXB0b2dyYXBoeV92ZWN0
b3JzIgogCi0tIAoyLjM5LjIKCg==

--===============0487141039301665092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-39.0.2.tar.gz;downloadfilename=cryptography_vectors-39.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-40.0.1.tar.gz;downloadfilename=cryptography_vectors-40.0.1.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 75079978 to 75099381 (+0%)
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "39.0.2" to "40.0.1"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.1.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p521.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-broken-signature-key-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p384.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-extensions.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-extension.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/
 certs/dsa-p256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha1.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/crl_inner_outer_mismatch.der /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/mismatch_inner_outer_sig_algorithm.der /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-empty-principals.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha512.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-dsa.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.with_headers.pem /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-invalid-cert-type.pub /usr/lib/python3.11/site-packages/cryptography_vector
 s/asymmetric/OpenSSH/certs/p256-rsa-sha256.pub"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 39.0.2 [default] to 40.0.1 [default]
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.1.dist-info
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/dsa-p256.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-dsa.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-broken-signature-key-type.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-crit-opts.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-extension.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-empty-principals.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-invalid-cert-type.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-crit-opts.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-extensions.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p384.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p521.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha1.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha256.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha512.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.with_headers.pem was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/crl_inner_outer_mismatch.der was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/mismatch_inner_outer_sig_algorithm.der was added

--===============0487141039301665092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.1.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-extensions.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/dsa-p256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p521.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-dsa.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.with_headers.pem /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-empty-principals.pub /usr/lib/pyt
 hon3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha1.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-invalid-cert-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-extension.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p384.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/crl_inner_outer_mismatch.der /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha512.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-broken-signature-key-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509
 /custom/mismatch_inner_outer_sig_algorithm.der"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.1.dist-info
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/dsa-p256.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-dsa.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-broken-signature-key-type.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-crit-opts.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-extension.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-empty-principals.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-invalid-cert-type.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-crit-opts.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-extensions.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p384.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p521.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha1.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha256.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha512.pub was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.with_headers.pem was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/crl_inner_outer_mismatch.der was added
  /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/mismatch_inner_outer_sig_algorithm.der was added

--===============0487141039301665092==--

