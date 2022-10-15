Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F905C6377C
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.24222.1665871393260707658
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dKHsI0jq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010183ddac3505-27b2bbfd-d6ea-4200-8dec-bb068bbfb612-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Kb5AgdpFADIpl+JfYUWCI4ZH3sRBx2l0wbQJf8EU+ZA=;
	b=dKHsI0jqMknlbxy9m6FFzgzfTDfq95S1Vhy8Xvo6t8OX/Q4U0Dp0O/tczc5FwDvW
	/YuVvXimvYJ4dNfYQlV+OnigNknYAmS1Gab3QdHKcB/VFIgtlUNv7eHGHL5RAM/QPwL
	uFJZMC1KcnkH9w+Tc4cQEOR4x6ebOmeztor9L8go=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Kb5AgdpFADIpl+JfYUWCI4ZH3sRBx2l0wbQJf8EU+ZA=;
	b=S+e0ueNCW6NyhqHGtlb6m1+lVZ0zPR/urZRfHxwUXq2ZkBD/Xa23jckB2Gx1EZyo
	R91yYhk2JEPefYfBAldy+IhNRcyml2izlvHyXGWzyAjfzD9jiZlC90B0iBgp4h8SbjC
	hRjN02okIeeVAMWbHAUk60E5bYwim9VcaaiDbol4=
Content-Type: multipart/mixed; boundary="===============0549085196794408296=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-zipp: upgrading to 3.9.0 SUCCEEDED
Message-ID: <01010183ddac3505-27b2bbfd-d6ea-4200-8dec-bb068bbfb612-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171802

--===============0549085196794408296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-zipp* to *3.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-zipp-upgrade-3.8.1-3.9.0.patch
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
--===============0549085196794408296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.10/site-packages/zipp-3.8.1.dist-info moved to /usr/lib/python3.10/site-packages/zipp-3.9.0.dist-info

--===============0549085196794408296==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-zipp-upgrade-3.8.1-3.9.0.patch"

RnJvbSAyYTBjNDEyNjY3ZmZlNjcwY2NlMjYzYTBlNGI0MjYzYzYwOGUzMmRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTE6MTM6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXppcHA6IHVwZ3JhZGUgMy44LjEgLT4gMy45LjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy16aXBwXzMuOC4xLmJiID0+IHB5dGhvbjMtemlwcF8zLjkuMC5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy16aXBwXzMuOC4xLmJiID0+IHB5dGhv
bjMtemlwcF8zLjkuMC5iYn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjguMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy16aXBwXzMuOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy16aXBwXzMuOC4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjkuMC5i
YgppbmRleCBmYTJmN2JjZjkwLi4wMGM1NWNiZTdmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjguMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtemlwcF8zLjkuMC5iYgpAQCAtMyw3ICszLDcgQEAgSE9N
RVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2phcmFjby96aXBwIgogTElDRU5TRSA9ICJNSVQi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03YTcxMjZlMDY4MjA2Mjkw
ZjNmZTlmOGQ2YzcxM2VhNiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjA1YjQ1ZjFlZThmODA3
ZDBjYzkyODQ4NWNhNDBhMDdjYjQ5MWNmMDkyZmY1ODdjMGRmOWNiMWZkMTU0ODQ4ZDIiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiM2E3YWY5MWMzZGI0MGVjNzJkZDlkMTU0YWUxOGUwMDhjNjllZmU4
Y2E4OGRkZTRmOWE3MzFiYjgyZmUyZjllYiIKIAogREVQRU5EUyArPSAiJHtQWVRIT05fUE59LXNl
dHVwdG9vbHMtc2NtLW5hdGl2ZSIKIAotLSAKMi4zMS4xCgo=

--===============0549085196794408296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-zipp: SRC_URI changed from "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/z/zipp/zipp-3.9.0.tar.gz"
packages/core2-32-poky-linux/python3-zipp: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dbg: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-dev: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-doc: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-locale: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-src: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp-staticdev: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGSIZE changed from 22959 to 24395 (+6%)
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PV changed from "3.8.1" to "3.9.0"
packages/core2-32-poky-linux/python3-zipp/python3-zipp: PKGV changed from 3.8.1 [default] to 3.9.0 [default]
Changes to packages/core2-32-poky-linux/python3-zipp (sysroot):
  /usr/lib/python3.10/site-packages/zipp-3.8.1.dist-info moved to /usr/lib/python3.10/site-packages/zipp-3.9.0.dist-info

--===============0549085196794408296==--

