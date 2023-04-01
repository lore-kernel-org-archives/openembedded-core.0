Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DC4CA9EAC
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.32130.1680384534011207974
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cJAAUEWU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb925ac-3386b630-2b32-4095-9f67-9ceb98f6bce6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gmSWydzQ21uYz46f2uEmJN7jsr9lWbMma9WwYm/arY8=;
	b=cJAAUEWUIENdmXyKFjywkJAyZtjTB3b7VzS8xaxDTLgeiytwvlL8V7RQgJCbPwqi
	/QmW9cpkRpfkFiQ8V9oIhHoL4hmz4HrzTK9ZtUmr3+Kd7577TqxO7N+cjb4NNfaueCS
	AykAWUPck++RU4sEFI7vs78ZqFbXWRLh6dMdQUJg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384534;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gmSWydzQ21uYz46f2uEmJN7jsr9lWbMma9WwYm/arY8=;
	b=Xl+nbJEs5d7aV2NatV8WxScNK8rawAOjBps4atI7HOSITfBIUZREJ/8gcpRMO+6m
	I/HDHDU8tOjDm+Utv1XkEOkcYmwSnpqlbLRyZu5YYNacwA21PI5ml3MhpvBcsonfxAv
	WEcXD2U38tKcm6oW7nTKUX5tOfs9F+51oC/erZXI=
Content-Type: multipart/mixed; boundary="===============8310825747001534077=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-markdown: upgrading to 3.4.3 SUCCEEDED
Message-ID: <010101873eb925ac-3386b630-2b32-4095-9f67-9ceb98f6bce6-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179484

--===============8310825747001534077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-markdown* to *3.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-markdown-upgrade-3.4.1-3.4.3.patch
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
--===============8310825747001534077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-markdown: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown: SRC_URI changed from "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.4.1.tar.gz;downloadfilename=Markdown-3.4.1.tar.gz" to "https://files.pythonhosted.org/packages/source/M/Markdown/Markdown-3.4.3.tar.gz;downloadfilename=Markdown-3.4.3.tar.gz"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dbg: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-dev: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-doc: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-locale: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-src: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown-staticdev: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PV changed from "3.4.1" to "3.4.3"
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGSIZE changed from 639218 to 640362 (+0%)
packages/core2-32-poky-linux/python3-markdown/python3-markdown: PKGV changed from 3.4.1 [default] to 3.4.3 [default]
Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.11/site-packages/Markdown-3.4.1.dist-info moved to /usr/lib/python3.11/site-packages/Markdown-3.4.3.dist-info

--===============8310825747001534077==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-markdown-upgrade-3.4.1-3.4.3.patch"

RnJvbSBmMGIxYzAwYmJkZTkwNTQyNWM5ZTQ2ZGZlNWY1YzI4ZjAxYTljM2EwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAwOToyNTo1OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWFya2Rvd246IHVwZ3JhZGUgMy40LjEgLT4gMy40LjMKCi0tLQogLi4uL3tweXRob24z
LW1hcmtkb3duXzMuNC4xLmJiID0+IHB5dGhvbjMtbWFya2Rvd25fMy40LjMuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1tYXJrZG93bl8zLjQuMS5iYiA9
PiBweXRob24zLW1hcmtkb3duXzMuNC4zLmJifSAoODElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjQuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXJrZG93bl8zLjQuMy5iYgpzaW1pbGFyaXR5
IGluZGV4IDgxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtbWFya2Rvd25fMy40LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1tYXJrZG93bl8zLjQuMy5iYgppbmRleCBiMzk4Y2Q4YmM0Li4xNjI0ZTE1Zjk1
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWFya2Rv
d25fMy40LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
cmtkb3duXzMuNC4zLmJiCkBAIC02LDcgKzYsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLm1kO21kNT03NDVhYWFkMGM2OWM2MDAzOWU2MzhiZmY5ZmZjNTllZCIKIGluaGVy
aXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCiAKIFBZUElfUEFDS0FHRSA9ICJN
YXJrZG93biIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYjgwOTA4NmJiNmVmYWQ0MTYxNTZlMDBh
MGRhNjZmZTQ3NjE4YTVkNjkxOGRkNjg4ZjUzZjQwYzhlNGNmZWZmIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjhiZjEwMTE5OGUwMDRkYzkzZTg0YTEyYTczOTVlMzFhYWM2YTljOTk0Mjg0OGFlMWQ5
OWI5ZDcyY2Y5YjM1MjAiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKIAot
LSAKMi4zOS4yCgo=

--===============8310825747001534077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-markdown (sysroot):
  /usr/lib/python3.11/site-packages/Markdown-3.4.1.dist-info moved to /usr/lib/python3.11/site-packages/Markdown-3.4.3.dist-info

--===============8310825747001534077==--

