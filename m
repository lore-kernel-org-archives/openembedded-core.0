Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5F3CA9ED9
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:18 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.3767.1684186747851624979
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=URyllXCF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188215a50d8-bfbbeda9-d4b2-46b6-9e15-c8fea41bbcaa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=m3fAUNvfe8kDx4nOmivZNxcDyFTn2+N7sSl/Bsz9jZ4=;
	b=URyllXCF0XH+NUgA3zEjVZ7BZ9QFW3gS9c+3L9rmGAbXRq9DhD0P4RQagoITQ5Ih
	IFlRoSuBidUHCTNt1OZDnuV1ZL6pxTwrjpvzBIyUYjN9MiVB7BFQrVtmZ8iI1v4XLXH
	UUqTsBvLlPhAiI46W/a6BvAaWYqAHTpFA58nM7rI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186747;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=m3fAUNvfe8kDx4nOmivZNxcDyFTn2+N7sSl/Bsz9jZ4=;
	b=HFZzJyVUtQ8pPxhv9PbruDCe/5TZYzImhBAnkr6qlnywRCc0ik5yyTUD58M3igJK
	31CKPhIvXdy9P3l6318j/VN/bfWD2rP/kJkK96vDggfLyVxusK8VsNb/fjnfTIBPxpV
	FT3tsFq/EbAnM8rIA7jywfK9BsDX4HIrLOB9TtVE=
Content-Type: multipart/mixed; boundary="===============2941187903456351087=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-cryptography-vectors: upgrading to 40.0.2 SUCCEEDED
Message-ID: <01010188215a50d8-bfbbeda9-d4b2-46b6-9e15-c8fea41bbcaa-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181307

--===============2941187903456351087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cryptography-vectors* to *40.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-cryptography-vectors-upgrade-39.0.2-40.0.2.patch
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
--===============2941187903456351087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors: SRC_URI changed from "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-39.0.2.tar.gz;downloadfilename=cryptography_vectors-39.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/c/cryptography_vectors/cryptography_vectors-40.0.2.tar.gz;downloadfilename=cryptography_vectors-40.0.2.tar.gz"
packages/core2-32-poky-linux/python3-cryptography-vectors: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dbg: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-dev: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-doc: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-locale: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-src: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors-staticdev: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGV changed from 39.0.2 [default] to 40.0.2 [default]
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.2.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/dsa-p256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.with_headers.pem /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p521.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-extension.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-empty-principals.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p384.pub /usr/lib/python3.11/site-pac
 kages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-dsa.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha1.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-invalid-cert-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-extensions.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/crl_inner_outer_mismatch.der /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-broken-signature-key-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha512.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509
 /custom/mismatch_inner_outer_sig_algorithm.der"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PV changed from "39.0.2" to "40.0.2"
packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: PKGSIZE changed from 75079978 to 75099381 (+0%)
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.2.dist-info
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

--===============2941187903456351087==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-cryptography-vectors/python3-cryptography-vectors: FILELIST: directory renamed /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info -> /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.2.dist-info, added "/usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-broken-signature-key-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-duplicate-extension.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-crit-opts.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/crl_inner_outer_mismatch.der /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/O
 penSSH/certs/p256-p384.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha512.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-invalid-cert-type.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p521.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-rsa-sha1.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-non-lexical-extensions.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/cryptography.io.with_headers.pem /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/p256-p256-empty-principals.pub /usr/lib/python3.11/site-packages/cryptography_vectors/asymmetric/OpenSSH/certs/dsa-p256.pub /usr/lib/python3.11/site-packages/cryptography_vectors/x509/custom/mismatch_inner_outer_sig_algorithm.der /usr/lib/python3.11/site-packages/cryptography
 _vectors/asymmetric/OpenSSH/certs/p256-dsa.pub"
Changes to packages/core2-32-poky-linux/python3-cryptography-vectors (sysroot):
  /usr/lib/python3.11/site-packages/cryptography_vectors-39.0.2.dist-info moved to /usr/lib/python3.11/site-packages/cryptography_vectors-40.0.2.dist-info
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

--===============2941187903456351087==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-cryptography-vectors-upgrade-39.0.2-40.0.2.patch"

RnJvbSA4OTFhNDcyNzIzMzEzMGY4MzcwOWRmNTM1NThjYjA4ZTI0NmU3NDhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTA6MjI6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzOiB1cGdyYWRlIDM5LjAuMiAtPiA0MC4wLjIKCi0t
LQogLi4udmVjdG9yc18zOS4wLjIuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180
MC4wLjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1jcnlw
dG9ncmFwaHktdmVjdG9yc18zOS4wLjIuYmIgPT4gcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9y
c180MC4wLjIuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5LjAuMi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFwaHktdmVjdG9yc180MC4wLjIuYmIK
c2ltaWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzM5LjAuMi5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWNyeXB0b2dyYXBoeS12ZWN0b3JzXzQw
LjAuMi5iYgppbmRleCA3OTVlMjdmNzViLi41ZDMyNmE0ZTI3IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY3J5cHRvZ3JhcGh5LXZlY3RvcnNfMzkuMC4y
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jcnlwdG9ncmFw
aHktdmVjdG9yc180MC4wLjIuYmIKQEAgLTksNyArOSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAi
ZmlsZTovL0xJQ0VOU0U7bWQ1PThjMzYxN2RiNGZiNmZhZTAxZjFkMjUzYWI5MTUxMWU0IFwKICMg
Tk9URTogTWFrZSBzdXJlIHRvIGtlZXAgdGhpcyByZWNpcGUgYXQgdGhlIHNhbWUgdmVyc2lvbiBh
cyBweXRob24zLWNyeXB0b2dyYXBoeQogIyAgICAgICBVcGdyYWRlIGJvdGggcmVjaXBlcyBhdCB0
aGUgc2FtZSB0aW1lCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhNjhmMTA2ZjdhNDMyMmNmMWU3
ZWQ1MWUzZmM2ZDVjMWUwYjExZDMzN2VkOTE4ZWM4NzllOGFmZTBjMmE1MjIwIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImE4MWI4Nzc5MDcyMzYyYTgyMzFkNWU3MTFiYzEwOTVmZGI2NTUyMTI1ZWRm
MjgwN2NkYzJhNTkwNzhiZTBjOWEiCiAKIFBZUElfUEFDS0FHRSA9ICJjcnlwdG9ncmFwaHlfdmVj
dG9ycyIKIAotLSAKMi4zOS4yCgo=

--===============2941187903456351087==--

