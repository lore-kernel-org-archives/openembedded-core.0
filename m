Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88B1C71134
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:18 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.20183.1672605967764916109
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=n9MxgDKk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101856f15a2b8-a13a041f-8762-4d98-b4c4-b171bbda6232-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=E4GZmBPmhy7JrfS0XX7ANzVYs/u1+mirOwUL6myeQ7M=;
	b=n9MxgDKkw+sfZlM/I8KqDwXqoS/9ryCm7T7P/cSt9ATKEPnYsY7lR6cS+mAr6umc
	FQCfpkDNvWjj0jut7jCO7/KQ+Wb/8wASfJPkxhEstnFfhlTvJdl9LBxm9OuYJ9uwjjC
	OPJbl9MldzUee8eMokfIhxvVJ9I8o/wvhHjmumH0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605967;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=E4GZmBPmhy7JrfS0XX7ANzVYs/u1+mirOwUL6myeQ7M=;
	b=H0Ib1Ps6s9Ytzg428OVbROEIfO6MlMhYRuKdBoGnwxMfOEkXoMDRD9FK6pcihRKf
	CZfT+aaDb6zRcHfwkqGup/jTuWlB3zJ8ykpTiNsV1Z74f+AKzs/86hP462CEa1TIykZ
	Av1ZSQNblCYkG7qi79maQzSlKvEJ7R0hSC1eFwiI=
Content-Type: multipart/mixed; boundary="===============5464322370999258289=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.11.0 SUCCEEDED
Message-ID: <010101856f15a2b8-a13a041f-8762-4d98-b4c4-b171bbda6232-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:07 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175274

--===============5464322370999258289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.10.0-3.11.0.patch
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
--===============5464322370999258289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 31684 to 35974 (+14%)
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.11.0.dist-info

--===============5464322370999258289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.10.0.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.11.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 31684 to 35974 (+14%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.10.0" to "3.11.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.10.0 [default] to 3.11.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.11/site-packages/zipp-3.10.0.dist-info moved to /usr/lib/python3.11/site-packages/zipp-3.11.0.dist-info

--===============5464322370999258289==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.10.0-3.11.0.patch"

RnJvbSAwMTdmYWQxN2U5YzQyNDg4NWIyYTUxOTk2ZmZlNWZlOWMwZDBjNzMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAxMDo0ODo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtemlwcDogdXBncmFkZSAzLjEwLjAgLT4gMy4xMS4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtemlwcF8zLjEwLjAuYmIgPT4gcHl0aG9uMy16aXBwXzMuMTEuMC5iYn0gICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtemlwcF8zLjEwLjAuYmIgPT4gcHl0
aG9uMy16aXBwXzMuMTEuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjEwLjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjExLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NSUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xMC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8z
LjExLjAuYmIKaW5kZXggNTZkOGU3MDZjOC4uNzBlYmFmYzE2OCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXppcHBfMy4xMC4wLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuMTEuMC5iYgpAQCAtMyw3ICsz
LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2phcmFjby96aXBwIgogTElDRU5T
RSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03YTcxMjZl
MDY4MjA2MjkwZjNmZTlmOGQ2YzcxM2VhNiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdhNzI2
MmZkOTMwYmQzZTM2YzUwYjlhNjQ4OTdhZWMzZmFmZmYzZGZkZWVjOTYyM2FlMjJiNDBlOTNmOTli
YjgiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYTdhMjJlMDU5MjkyOTBhNjc0MDE0NDBiMzk2OTBh
ZTY1NjMyNzliY2VkNWYzMTQ2MDlkOWQwMzc5OGY1Njc2NiIKIAogREVQRU5EUyArPSAiJHtQWVRI
T05fUE59LXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIAotLSAKMi4zNy4zCgo=

--===============5464322370999258289==--

