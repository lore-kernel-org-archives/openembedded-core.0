Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B09C32764
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.6459.1660589820968544550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=JpxCGj5S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010182a2ddc953-befdd478-c30b-4b2a-a2f3-888c11607870-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3gOcwPny6fjJzmFvVYyHfh7SrxCiP5MN0QWNUKD7DV0=;
	b=JpxCGj5SjxpIRiGmd0+SsU3dvgDWJLbPuG4Gv5Il64YriMUOCb1UuEnEy9eELZam
	T5nKZNPtqRVzSvK+b+4X3Biv7LtD9+KHh8i0fmjTbJOoUYYA+FfL8QXz9XFXavLjii+
	GvZ8TA3l0dW6XuuNXy+a7oSZirrY77N54DwigEf8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3gOcwPny6fjJzmFvVYyHfh7SrxCiP5MN0QWNUKD7DV0=;
	b=EwOHqqpPZ/gSKnwlvwtsCteuLrsCmKE21qZIWg4z2x+7PvXNb5cMRRkJx+PQYD0g
	UyazIagbKoInwTu2kdaCEDsajW4uRw0TZxMzyNJx4cqE9ipRnlI95W6pMh08tirQRbg
	Cl+39mZu4fgVJo5UbhlAQfbfjitZt23i8QalpKPI=
Content-Type: multipart/mixed; boundary="===============9216921480888940530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pbr: upgrading to 5.10.0 SUCCEEDED
Message-ID: 
 <01010182a2ddc953-befdd478-c30b-4b2a-a2f3-888c11607870-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169378

--===============9216921480888940530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pbr* to *5.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pbr-upgrade-5.9.0-5.10.0.patch
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
--===============9216921480888940530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pbr: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.9.0.tar.gz file://0001-change-shebang-to-python3.patch" to "https://files.pythonhosted.org/packages/source/p/pbr/pbr-5.10.0.tar.gz file://0001-change-shebang-to-python3.patch"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dbg: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-dev: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-doc: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-locale: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-src: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr-staticdev: PV changed from "5.9.0" to "5.10.0"
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGSIZE changed from 531879 to 532972 (+0%)
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PKGV changed from 5.9.0 [default] to 5.10.0 [default]
packages/core2-32-poky-linux/python3-pbr/python3-pbr: PV changed from "5.9.0" to "5.10.0"
Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/AUTHORS was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/AUTHORS was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/WHEEL was removed

--===============9216921480888940530==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pbr-upgrade-5.9.0-5.10.0.patch"

RnJvbSBjNjhiOWZlOTRiNTFlNDI3OTA0Y2M2OTAzYWZlZjA5N2ExZjMxOTNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDg6Mzc6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBicjogdXBncmFkZSA1LjkuMCAtPiA1LjEwLjAKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wYnJfNS45LjAuYmIgPT4gcHl0aG9uMy1wYnJfNS4xMC4wLmJifSAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYnJfNS45LjAuYmIgPT4gcHl0aG9u
My1wYnJfNS4xMC4wLmJifSAoMzMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1wYnJfNS45LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtcGJyXzUuMTAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDMzJQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuOS4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuMTAuMC5iYgpp
bmRleCBjOTNiNzFkYmQzLi4wMjJmODM0OTAxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGJyXzUuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1wYnJfNS4xMC4wLmJiCkBAIC0xLDQgKzEsNCBAQAogaW5oZXJp
dCBzZXR1cHRvb2xzMwogcmVxdWlyZSBweXRob24tcGJyLmluYwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZThkY2EyZjRiNDM1NjBlZGVmNTg4MTM5NjlmNTJhNTZjZWYwMjMxNDZjYmI4OTMxNjI2
ZGI4MGU2YzFjNDMwOCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjZmNjNGZmOGU2OTgyNTZmYzE3
ZWEzZmY3OTY0NzhiMDUwODUyNTg1YWE1YmFlNzllY2QwNWIyYWI3YjM5YjlhIgotLSAKMi4zMS4x
Cgo=

--===============9216921480888940530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pbr (sysroot):
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/AUTHORS was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/LICENSE was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/pbr-5.10.0.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/AUTHORS was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/entry_points.txt was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/pbr-5.9.0.dist-info/WHEEL was removed

--===============9216921480888940530==--

