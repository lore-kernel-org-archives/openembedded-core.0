Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD0C7EE32
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.30007.1675272855312608339
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CblEA5Vc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101860e0b1ba9-a18b6d59-3686-4285-9ea6-041838e31ec4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bKSene3VKgVi0joa1M+/NKAkx0m8NEk8t+siOKD47pw=;
	b=CblEA5Vcwmosa7aYlvAPDl5QOhwI5+MwSwLA/0f7Fj7WGoHeuU6XXCAD7NZkz4FN
	3k8+fMDKjU6RsZ3fRVOxYBMB6Bwn3Rj2Fo1saQ5IdbEJrEVXBVYn2WCa5imt5WVZeA7
	Bz2CU3fSTVz5RH22tzbbjylA34Tp8vr7O6ZAgaRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272854;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bKSene3VKgVi0joa1M+/NKAkx0m8NEk8t+siOKD47pw=;
	b=Po0yTaZIQ3L5eTTYw2WBCce0cHHbo4hz5Tcyi0bpPbQWy1KBwBXhZMLlqO2I0ku1
	Ab1//S3Yl91/uALX5g7rkA2ZxthixgVYqu0HGTkQmKBynNHr5YApl+12m4T//xX+tuT
	SMQtu5Wlzxy4fZbBnQKVVY+cI5RX+2rtKq5Kp1CE=
Content-Type: multipart/mixed; boundary="===============8550897303522011389=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pathspec: upgrading to 0.11.0 SUCCEEDED
Message-ID: <010101860e0b1ba9-a18b6d59-3686-4285-9ea6-041838e31ec4-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176589

--===============8550897303522011389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pathspec* to *0.11.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pathspec-upgrade-0.10.3-0.11.0.patch
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
--===============8550897303522011389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pathspec: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.10.3.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pathspec/pathspec-0.11.0.tar.gz"
packages/core2-32-poky-linux/python3-pathspec: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dbg: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-dev: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-doc: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-locale: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-src: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec-staticdev: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PV changed from "0.10.3" to "0.11.0"
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGV changed from 0.10.3 [default] to 0.11.0 [default]
packages/core2-32-poky-linux/python3-pathspec/python3-pathspec: PKGSIZE changed from 156939 to 157448 (+0%)
Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.3.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.11.0.dist-info

--===============8550897303522011389==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pathspec-upgrade-0.10.3-0.11.0.patch"

RnJvbSBjZGE4MDFkMTA2ODhkODQ1NjZlMjQyYjkxYjYxYmFjNmU0YmEyNmU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxMTozNDo0NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGF0aHNwZWM6IHVwZ3JhZGUgMC4xMC4zIC0+IDAuMTEuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtcGF0aHNwZWNfMC4xMC4zLmJiID0+IHB5dGhvbjMtcGF0aHNwZWNfMC4xMS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXBhdGhzcGVjXzAuMTAuMy5i
YiA9PiBweXRob24zLXBhdGhzcGVjXzAuMTEuMC5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMC4xMC4zLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBhdGhzcGVjXzAuMTEuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtcGF0aHNwZWNfMC4xMC4zLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGF0aHNwZWNfMC4xMS4wLmJiCmluZGV4IGJkMWU3ZTM2MzkuLmJm
MGRmYmQ3MjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1wYXRoc3BlY18wLjEwLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLXBhdGhzcGVjXzAuMTEuMC5iYgpAQCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZl
bC9weXRob24iCiBMSUNFTlNFID0gIk1QTC0yLjAiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT04MTVjYTU5OWM5ZGYyNDdhMGM3ZjYxOWJhYjEyM2RhZCIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjU2MjAwZGU0MDc3ZDlkMDc5MTQ2NWFhOTA5NWEwMWQ0MjE4NjFlNDA1
YjUwOTY5NTUwNTFkZWVmZDY5N2Q2ZjYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjRkMzM4ZDRl
MDkxNGU5MWMxNzkyMzIxZTY5MDdiNWE1OTNmMWFiMTg1MWRlN2ZjMjY5NTU3YTIxYjMwZWJiYyIK
IAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLS0gCjIuMzcuMwoK

--===============8550897303522011389==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pathspec (sysroot):
  /usr/lib/python3.11/site-packages/pathspec-0.10.3.dist-info moved to /usr/lib/python3.11/site-packages/pathspec-0.11.0.dist-info

--===============8550897303522011389==--

