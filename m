Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D07CC7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 14:45:18 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.24052.1677681915887177465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 06:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=OZ9Kd2xG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101869da274b5-a50fe8b1-0bfc-4898-b969-e9e2bd237613-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LN8MxSdTZxDHxKSTCkv1sNMxVtZWVVghYx52dUuFPsE=;
	b=OZ9Kd2xGo9ZqIMZCW4Qdpk6kr7dSGWCBdh2Vi5G5W7ewosoHn3ojamTTfs7bxCok
	tsB+xahf6tIJTas4dbnSZIC8brTCmiTYefZUxDcop30cNBaze+wBvjZ/sksb7O2Bbcs
	omCb7PFNyoRcgqop5kU8g1KZUDrF2ac4L3Jd4kDs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1677681915;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LN8MxSdTZxDHxKSTCkv1sNMxVtZWVVghYx52dUuFPsE=;
	b=anUfAJa4jzJJkrBLNEAqYhF+J3S+7V1h9WCKpeIZmrAI8UxpWHolxpBIPUmx2xjc
	aeKEC/pyqrlLomP7d0QqFhaFrnu227cUVnErjgo473ZYUBZkp30eDOlWxM3DXcdfkh1
	uRzM2bIiyBjpmd0L1TtfDDtx9PmgSa8L0mj/nJLs=
Content-Type: multipart/mixed; boundary="===============0830755095773148171=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 237 SUCCEEDED
Message-ID: <010101869da274b5-a50fe8b1-0bfc-4898-b969-e9e2bd237613-000000@us-west-2.amazonses.com>
Date: Wed, 1 Mar 2023 14:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 14:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177932

--===============0830755095773148171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *diffoscope* to *237* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-235-237.patch
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
--===============0830755095773148171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (0 cached, 895 parsed). 1698 targets, 49 skipped, 0 masked, 0 errors.
Removing 113 recipes from the core2-32 sysroot...done.
Removing 121 recipes from the qemux86 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host i686-poky-linux-musl (not in COMPATIBLE_HOST)

--===============0830755095773148171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dbg: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-dev: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-doc: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-locale: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-src: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1406020 to 1406155 (+0%)
packages/core2-32-poky-linux/diffoscope/diffoscope: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope/diffoscope: PV changed from "235" to "237"
packages/core2-32-poky-linux/diffoscope: PKGV changed from 235 [default] to 237 [default]
packages/core2-32-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-235.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-237.tar.gz"
packages/core2-32-poky-linux/diffoscope: PV changed from "235" to "237"
Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-235.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-237.dist-info

--===============0830755095773148171==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-235-237.patch"

RnJvbSA2OWNkYzdjNWI2NDQ3YjAyZmI1MmE5OTM1YjdkOGE3YmEyNWI2ZTA5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBNYXIgMjAyMyAxNDoxMjozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjM1IC0+IDIzNwoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yMzUuYmIgPT4gZGlmZm9zY29wZV8yMzcuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzIzNS5iYiA9PiBkaWZmb3Njb3BlXzIz
Ny5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjM1LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzIzNy5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjM1LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjM3LmJiCmluZGV4IGU0Y2MyYTk1
YjguLjgzOGYzYTdjYzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yMzUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzIzNy5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIzMjc5ZjY2MzdmMWU5Zjc1N2NhOWI4YzI4NzBlZDc5Y2VlYWQ1OTcxZTVhMTVkOTUyYTA1
NzliMmI0NTcyMGEyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlhZGUwYzhlNDNmYzZlZGQ4OWZl
N2MzYzFiZDUwMjBkMGNmNmVjNDRmZDEyMGM3ZTNiODg3ZWJiZWU1ODhhMzUiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJiaW51dGlscyB2aW0gc3F1YXNoZnMtdG9vbHMgcHl0aG9uMy1saWJhcmNoaXZl
LWMgcHl0aG9uMy1tYWdpYyBweXRob24zLXJwbSIKIAotLSAKMi4zOS4yCgo=

--===============0830755095773148171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.11/site-packages/diffoscope-235.dist-info moved to /usr/lib/python3.11/site-packages/diffoscope-237.dist-info

--===============0830755095773148171==--

