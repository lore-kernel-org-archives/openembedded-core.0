Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AAC1C88C95
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:25:52 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.107885.1682976349145953553
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZTvCHTZ3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010187d93520d2-e794f628-2bc2-4dcb-b5f3-232a2adee244-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7Wtq5Hk+F9RCEO7+kVYSmVzv5nlBMF46CRTDsoyCj6A=;
	b=ZTvCHTZ32f31VoZ2dlumRRCahpUyYzD0UpjFBVY9O3BynjhpX22LFwZHcfNJRU69
	ZK48bFiy+5CB0w+117Y/+DKtz+sUAiQyYBs5UgmxbMrLC8dKK8VbVS5Qm14H43QiVcb
	UZpvuaR2/Hm4u59lauWGWZ0w+TyO+yOuygMp6vck=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976350;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7Wtq5Hk+F9RCEO7+kVYSmVzv5nlBMF46CRTDsoyCj6A=;
	b=e1/+M+QqWNQoHFKcA0hTYEgdG0HlmbKGGJSEFp0DY1LgCN7A74DWh2YHHzTTK1gw
	pgDnmLwehI5R/EoHfa47BCPlH0TCXoPDZw3ACtFMEN7lWShxWuXinN62tXqSVgxv3Hf
	sPNZAXy88AZhsSTDOJxShDLl/7wFsMN7+mKHzJyE=
Content-Type: multipart/mixed; boundary="===============3812346657423797565=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-setuptools-rust: upgrading to 1.6.0 SUCCEEDED
Message-ID: <01010187d93520d2-e794f628-2bc2-4dcb-b5f3-232a2adee244-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180632

--===============3812346657423797565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-setuptools-rust* to *1.6.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-setuptools-rust-upgrade-1.5.2-1.6.0.patch
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
--===============3812346657423797565==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-setuptools-rust-upgrade-1.5.2-1.6.0.patch"

RnJvbSBkYzZlZGJiODJmOGRlMDcxYjllMGMzOGU4MjFhOGQ0YjExNjVmYmVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxMTo0Njo0MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0OiB1cGdyYWRlIDEuNS4yIC0+IDEuNi4wCgotLS0KIC4uLmV0
dXB0b29scy1ydXN0XzEuNS4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNi4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc2V0dXB0b29scy1y
dXN0XzEuNS4yLmJiID0+IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0XzEuNi4wLmJifSAoOTIlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRv
b2xzLXJ1c3RfMS41LjIuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c2V0dXB0b29scy1ydXN0XzEuNi4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3RfMS41
LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZXR1
cHRvb2xzLXJ1c3RfMS42LjAuYmIKaW5kZXggNTAyOTY3ZmQyMC4uY2JlNmFjNTg4YSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNldHVwdG9vbHMtcnVz
dF8xLjUuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2V0
dXB0b29scy1ydXN0XzEuNi4wLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTAxMWNkOTJlNzAyZGQ5ZTZiMWEyNjE1N2I2ZmQ1M2Y1Igog
U1JDX1VSSSA9ICIke1BZUElfU1JDX1VSSX0gXAogICAgICAgICAgICBodHRwczovL2ZpbGVzLnB5
dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvNjcvMDgvZTFhYTJjNTgyYzYyYWM3NmU0ZDYwZjhlNDU0
YmQzYmJhOTMzNzgxYTA2YTg4YjRlMzg3OTc0NDU4MjJhL3NldHVwdG9vbHMtcnVzdC0ke1BWfS50
YXIuZ3ogXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZDhkYWNjYjE0ZGMw
ZWFlMWI2YjZlYjNlY2VmNzk2NzViZDM3YjQwNjUzNjlmNzljMzUzOTNkZDVjNTU2NTJjNyIKK1NS
Q19VUklbc2hhMjU2c3VtXSA9ICJjODZlNzM0ZGVhYzMzMDU5Nzk5OGJmYmMwOGRhNDUxODdlNmIy
NzgzN2UyM2JkOTFlYWRiMzIwNzMyMzkyMjYyIgogCiBpbmhlcml0IGNhcmdvIHB5cGkgcHl0aG9u
X3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0tIAoyLjM5LjIKCg==

--===============3812346657423797565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-setuptools-rust: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz;downloadfilename=setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.5.2.tar.gz;downloadfilename=setuptools-rust-1.5.2.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.5.2.tar.gz" to "https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.6.0.tar.gz;downloadfilename=setuptools-rust-1.6.0.tar.gz https://files.pythonhosted.org/packages/source/s/setuptools-rust/setuptools-rust-1.6.0.tar.gz;downloadfilename=setuptools-rust-1.6.0.tar.gz https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-1.6.0.tar.gz"
packages/core2-32-poky-linux/python3-setuptools-rust: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dbg: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-dev: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-doc: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-locale: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-src: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust-staticdev: PV changed from "1.5.2" to "1.6.0"
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGV changed from 1.5.2 [default] to 1.6.0 [default]
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PKGSIZE changed from 154279 to 156404 (+1%)
packages/core2-32-poky-linux/python3-setuptools-rust/python3-setuptools-rust: PV changed from "1.5.2" to "1.6.0"
Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.5.2.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.6.0.dist-info

--===============3812346657423797565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-setuptools-rust (sysroot):
  /usr/lib/python3.11/site-packages/setuptools_rust-1.5.2.dist-info moved to /usr/lib/python3.11/site-packages/setuptools_rust-1.6.0.dist-info

--===============3812346657423797565==--

