Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF975C77B6E
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.12154.1678895727435057282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=XzSfL1a4;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010186e5fbc5d1-aefbf668-56b7-4d8f-9802-56939dfeec87-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NlJmEJn3l6e8bZb/0/ufI6Hi3lvZkmlRjNhESkVqkZg=;
	b=XzSfL1a48MYZ9VYNkjiT+SeAA4MeJWbjKxeoLPuWK+dSzMYimyEs88QAfIApm+iI
	s5+DMS7dgYJvJboR/szBdICQxXcoQmzrsCkWW20sZq17qKB9i2tpdKZ75EGdY0aPNl4
	ate30htU3yKbdx1iwU632iXZywf0m7N34z4FaIFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NlJmEJn3l6e8bZb/0/ufI6Hi3lvZkmlRjNhESkVqkZg=;
	b=nPP1A94RDVmS1eeBBFUbG3v7DWIVKuRCc4gyclGVii36MfhgO/LO4rHOgWAIgJJS
	hSLirO7hEldLSVvrm6D/fowVJxvMQpoiuy0jmvRWQsK0AuoBzxyfVLD8AHtEP3YJ3+H
	EmmvuxkCQOkBwMU6kaSJ/TcmCh5i/gMIbusl97M8=
Content-Type: multipart/mixed; boundary="===============1099339676146011545=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to adf2a098298f1aa73aca2c816174d5e63ff45a32
 SUCCEEDED
Message-ID: <01010186e5fbc5d1-aefbf668-56b7-4d8f-9802-56939dfeec87-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178632

--===============1099339676146011545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *adf2a098298f1aa73aca2c816174d5e63ff45a32* has Succeeded.

Next steps:
    - apply the patch: git am 0001-puzzles-upgrade-to-latest-revision.patch
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
--===============1099339676146011545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829

--===============1099339676146011545==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSAxN2UxMTk2M2Y4ZTUxNzk0N2Q2NTNhOWFhNzc5MDE4ZDRjNTQzYTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTQ6NDY6MzYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
dXp6bGVzOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtc2F0
by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXNhdG8vcHV6
emxlcy9wdXp6bGVzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1zYXRvL3B1enpsZXMvcHV6emxlc19n
aXQuYmIKaW5kZXggODdiNmZhYzAyNC4uYjhiMWQ3MjY1NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dpdC5iYgorKysgYi9tZXRhL3JlY2lwZXMtc2F0by9w
dXp6bGVzL3B1enpsZXNfZ2l0LmJiCkBAIC0xMCw3ICsxMCw3IEBAIFJFUVVJUkVEX0RJU1RST19G
RUFUVVJFUyA9ICJ4MTEiCiBTUkNfVVJJID0gImdpdDovL2dpdC50YXJ0YXJ1cy5vcmcvc2ltb24v
cHV6emxlcy5naXQ7YnJhbmNoPW1haW4iCiAKIFVQU1RSRUFNX0NIRUNLX0NPTU1JVFMgPSAiMSIK
LVNSQ1JFViA9ICI1YTQ5MWM1YWQzMzNlZjM0YzFlNzcxM2Y5MjBmNTFjYmIyMDVhZjYwIgorU1JD
UkVWID0gImFkZjJhMDk4Mjk4ZjFhYTczYWNhMmM4MTYxNzRkNWU2M2ZmNDVhMzIiCiBQRSA9ICIy
IgogUFYgPSAiMC4wK2dpdCR7U1JDUFZ9IgogCi0tIAoyLjM5LjIKCg==

--===============1099339676146011545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+5a491c5ad3 [default] to 0.0+gitAUTOINC+adf2a09829 [default]
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 14299436 to 14307356 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3542339 to 3554455 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+5a491c5ad3" to "0.0+gitAUTOINC+adf2a09829"
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+5a491c5ad3 to 0.0+git0+adf2a09829

--===============1099339676146011545==--

