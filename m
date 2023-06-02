Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94A0CA9EC8
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.7632.1685693432454653899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gNYFWvKs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b2885ac-7407ab87-87ff-4048-8442-8a6eed7f5ba6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nsIMN4tF4CVYiqtePmloX5hQ/9F9lg0C6DZUKl7wFRg=;
	b=gNYFWvKsuTUs/4txT6boTwhXJfues26xbBn4Vjj0uGXa8Xoqxacjk5EH56KFkydR
	uRIRofK2IAivKzlUDEeOD8rYbCp5GuIZhV/ag1rXSkUiIsaHeRu+DO3xRlNBsg3Muiv
	AU7ywrqX3XKfm+LtvKOw5JMrf/O90cOuVg6G71uw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nsIMN4tF4CVYiqtePmloX5hQ/9F9lg0C6DZUKl7wFRg=;
	b=XfkJX4xMAe8mDHmj5NVHXQbAXvpsl60x9Vt5RMAlZnbfxCCsMeEyaQAj/F95N5zO
	PxAKMRNMnIoHgrIWgcMCxo2Q1ELLyJDJcJ+CxEGGwtArsKee3+ElnCAbNhSFfyh70r7
	YsOkXjggcF/ZpYXn11k//GHi4GUzWZZIGdxHLVtQ=
Content-Type: multipart/mixed; boundary="===============1954810267854252475=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-typing-extensions: upgrading to 4.6.2 SUCCEEDED
Message-ID: <010101887b2885ac-7407ab87-87ff-4048-8442-8a6eed7f5ba6-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182204

--===============1954810267854252475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-typing-extensions* to *4.6.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-typing-extensions-upgrade-4.5.0-4.6.2.patch
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
--===============1954810267854252475==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-typing-extensions-upgrade-4.5.0-4.6.2.patch"

RnJvbSAyMTk4OGIyZTllNWIwZWEzZWM1ZmUxY2E0NTZlYmFiZTY4YTBlYzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNzowODo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnM6IHVwZ3JhZGUgNC41LjAgLT4gNC42LjIKCi0tLQogLi4u
Zy1leHRlbnNpb25zXzQuNS4wLmJiID0+IHB5dGhvbjMtdHlwaW5nLWV4dGVuc2lvbnNfNC42LjIu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy10eXBpbmctZXh0
ZW5zaW9uc180LjUuMC5iYiA9PiBweXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNi4yLmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy10
eXBpbmctZXh0ZW5zaW9uc180LjUuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjYuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdHlwaW5nLWV4
dGVuc2lvbnNfNC41LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy10eXBpbmctZXh0ZW5zaW9uc180LjYuMi5iYgppbmRleCA4MGY4N2NhZTg0Li5iZTQz
ZmU0YTY0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
dHlwaW5nLWV4dGVuc2lvbnNfNC41LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLXR5cGluZy1leHRlbnNpb25zXzQuNi4yLmJiCkBAIC0xNSw3ICsxNSw3IEBA
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWYxNmIzMjM5MTc5OTJlMGY4
YTZmMDA3MWJjOTkxM2UyIgogIyBUaGUgbmFtZSBvbiBQeVBpIGlzIHNsaWdodGx5IGRpZmZlcmVu
dC4KIFBZUElfUEFDS0FHRSA9ICJ0eXBpbmdfZXh0ZW5zaW9ucyIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjVjYjVmNGE3OTEzOWQ2OTk2MDdiM2VmNjIyYTFkZWRhZmE4NGUxMTVhYjAwMjRlMGQ5
YzA0NGE5NDc5Y2E3Y2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMDYwMDYyNDRjNzBhYzhlZTgz
ZmE4MjgyY2IxODhmNjk3YjhkYjI1YmM4YjRkZjA3YmUxODczYzQzODk3MDYwYyIKIAogaW5oZXJp
dCBweXBpIHB5dGhvbl9mbGl0X2NvcmUKIAotLSAKMi4zOS4yCgo=

--===============1954810267854252475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 207643 to 247599 (+19%)
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.5.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.6.2.dist-info

--===============1954810267854252475==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-typing-extensions: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions: SRC_URI changed from "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.5.0.tar.gz;downloadfilename=typing_extensions-4.5.0.tar.gz" to "https://files.pythonhosted.org/packages/source/t/typing_extensions/typing_extensions-4.6.2.tar.gz;downloadfilename=typing_extensions-4.6.2.tar.gz"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dbg: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-dev: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-doc: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-locale: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-src: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions-staticdev: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGSIZE changed from 207643 to 247599 (+19%)
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PV changed from "4.5.0" to "4.6.2"
packages/core2-32-poky-linux/python3-typing-extensions/python3-typing-extensions: PKGV changed from 4.5.0 [default] to 4.6.2 [default]
Changes to packages/core2-32-poky-linux/python3-typing-extensions (sysroot):
  /usr/lib/python3.11/site-packages/typing_extensions-4.5.0.dist-info moved to /usr/lib/python3.11/site-packages/typing_extensions-4.6.2.dist-info

--===============1954810267854252475==--

