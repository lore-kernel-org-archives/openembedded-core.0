Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B180C88CBB
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.13805.1681581685421186378
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WDtUsSh3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018786143791-248a65cd-d8a4-4760-a8c8-cbcab443bcbf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8lT7GgBEm5rBvLtftqtqVzV/JRkmPH6GKIBaRLCEGyk=;
	b=WDtUsSh3f0Hd/Bx99t40Wi7+/85k7ozsCBQe0uQx+IThjeCD6FG3frlmz/wMgZpX
	kmCb4Ny4zfPfRQgKFiqh7mrb2uyGfw3pUJz4PKqZW3nVfsKn4+PuIxrc8WXEPJTDfuQ
	S6iBIawalXP2mIAFDDBBDpUW3Pp4+jD8LKVrwGgk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581684;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8lT7GgBEm5rBvLtftqtqVzV/JRkmPH6GKIBaRLCEGyk=;
	b=U1q5yc2Z48BIORdKARKahuW65SdizOlhOJst4dg/WJPhj12PlIwNdG/nykr8jvl7
	O7TVFxHnkiE056s8dw5pAjw+AvkE/iEDESt0OgrGsY7Vfh16haZXHFcFZkOC813zKCm
	ERLT3Mrw96jxlXAWmJjsF8YkxqfoPlQg0gpsS7jg=
Content-Type: multipart/mixed; boundary="===============0775727469551200916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-dtschema: upgrading to 2023.4 SUCCEEDED
Message-ID: <0101018786143791-248a65cd-d8a4-4760-a8c8-cbcab443bcbf-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180043

--===============0775727469551200916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-dtschema* to *2023.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-dtschema-upgrade-2023.1-2023.4.patch
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
--===============0775727469551200916==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-dtschema-upgrade-2023.1-2023.4.patch"

RnJvbSBjNzljNDFjYjE3M2UyNTc4ZWIyYTIwNGRjMWY5NDY2YTRmMTgzYzhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTA6MjE6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWR0c2NoZW1hOiB1cGdyYWRlIDIwMjMuMSAtPiAyMDIzLjQKCi0tLQogLi4uL3tweXRo
b24zLWR0c2NoZW1hXzIwMjMuMS5iYiA9PiBweXRob24zLWR0c2NoZW1hXzIwMjMuNC5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjEu
YmIgPT4gcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjQuYmJ9ICg4MyUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuMS5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1kdHNjaGVtYV8yMDIzLjQuYmIKc2lt
aWxhcml0eSBpbmRleCA4MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWR0c2NoZW1hXzIwMjMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWR0c2NoZW1hXzIwMjMuNC5iYgppbmRleCA3NGNhNTVjZjA0Li5m
ODc1NjNmYWNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtZHRzY2hlbWFfMjAyMy4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1kdHNjaGVtYV8yMDIzLjQuYmIKQEAgLTcsNyArNyw3IEBAIGluaGVyaXQgcHlwaSBz
ZXR1cHRvb2xzMwogCiBQWVBJX1BBQ0tBR0UgPSAiZHRzY2hlbWEiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI4ZmM4YzI2OWU0YzU3ZTlkMDA4YWY3YjMyY2QzM2I3N2FmZDRlYTFhYzk1NTJiY2Zh
OTZiNDFiOWUwYzUyNTg2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZkYWVmYjhmNTQ0MDNiNGQ4
Mjk2MWIzMzQ2NTcxMjAwNTcxNzQ3YWIwMTk1MGZkMzZjMWY2OTk1MGZhN2E4Y2YiCiAKIERFUEVO
RFMgKz0gInB5dGhvbjMtc2V0dXB0b29scy1zY20tbmF0aXZlIgogUkRFUEVORFM6JHtQTn0gKz0g
InB5dGhvbjMtcnVhbWVsLXlhbWwgcHl0aG9uMy1qc29uc2NoZW1hIHB5dGhvbjMtcmZjMzk4NyIK
LS0gCjIuMzkuMgoK

--===============0775727469551200916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-dtschema: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.1.tar.gz;downloadfilename=dtschema-2023.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/dtschema/dtschema-2023.4.tar.gz;downloadfilename=dtschema-2023.4.tar.gz"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dbg: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-dev: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-doc: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-locale: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-src: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema-staticdev: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PV changed from "2023.1" to "2023.4"
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGV changed from 2023.1 [default] to 2023.4 [default]
packages/core2-32-poky-linux/python3-dtschema/python3-dtschema: PKGSIZE changed from 294712 to 299315 (+2%)
Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info moved to /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info

--===============0775727469551200916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-dtschema (sysroot):
  /usr/lib/python3.11/site-packages/dtschema-2023.1.dist-info moved to /usr/lib/python3.11/site-packages/dtschema-2023.4.dist-info

--===============0775727469551200916==--

