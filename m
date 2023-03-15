Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D03C7EE32
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:32 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.12145.1678895726066347615
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=jQ8OytN+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010186e5fbba76-bb21f2b5-1cb6-418a-9e74-6cc9b4798c19-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+s5v+bxM4jXD1+dEfAsWoR1fkU8Bgplikqmu8v39nwg=;
	b=jQ8OytN+eDIaS0t5MZdhNKHqssgLakn6q1KQWoiV/1DmEks94cayaxkZqGRIjXeE
	2iQ32NBe/KqL0NWXI0+sRR3bohOb1Qr7bSq5rHk3jHyJepCi5v23QCmZWzcC2tgPOde
	AKBTX9kuKEcogeIfi97JsNfv3G9FrTTohKOm2RSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895725;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+s5v+bxM4jXD1+dEfAsWoR1fkU8Bgplikqmu8v39nwg=;
	b=oSKFriekB1MymwGoFz5O6KOS9DivsFDTjJ6438GxsyWUBpGzs9GOz13q8EpBUmyf
	aClneoQVo/FIqZtnLb7jZrHrctEAcYbD0YsCyRaVyjC0lx9JbfGfJt4k/nONI1Uj/CJ
	7xJ6UkcNT/tRdJ7oZgH/S/5WKeDSL0gf71HsNJX4=
Content-Type: multipart/mixed; boundary="===============1308951910428272088=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-poetry-core: upgrading to 1.5.2 SUCCEEDED
Message-ID: <01010186e5fbba76-bb21f2b5-1cb6-418a-9e74-6cc9b4798c19-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178600

--===============1308951910428272088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-poetry-core* to *1.5.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-poetry-core-upgrade-1.5.1-1.5.2.patch
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
--===============1308951910428272088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.11/site-packages/poetry_core-1.5.1.dist-info moved to /usr/lib/python3.11/site-packages/poetry_core-1.5.2.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.11/site-packages/poetry_core-1.5.1.dist-info moved to /usr/lib/python3.11/site-packages/poetry_core-1.5.2.dist-info

--===============1308951910428272088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-poetry-core: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/poetry-core/poetry_core-1.5.1.tar.gz;downloadfilename=poetry_core-1.5.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/poetry-core/poetry_core-1.5.2.tar.gz;downloadfilename=poetry_core-1.5.2.tar.gz"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-dbg: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-dev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-dev: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-doc: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-doc: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-locale: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-locale: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-src: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-src: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core-staticdev: PV changed from "1.5.1" to "1.5.2"
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core: PKGV changed from 1.5.1 [default] to 1.5.2 [default]
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core: PKGSIZE changed from 3760951 to 3760843 (-0%)
packages/core2-32-poky-linux/python3-poetry-core/python3-poetry-core: PV changed from "1.5.1" to "1.5.2"
Changes to packages/core2-32-poky-linux/python3-poetry-core (sysroot):
  /usr/lib/python3.11/site-packages/poetry_core-1.5.1.dist-info moved to /usr/lib/python3.11/site-packages/poetry_core-1.5.2.dist-info
Changes to packages/x86_64-linux/python3-poetry-core-native (sysroot):
  /usr/lib/python3.11/site-packages/poetry_core-1.5.1.dist-info moved to /usr/lib/python3.11/site-packages/poetry_core-1.5.2.dist-info

--===============1308951910428272088==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-poetry-core-upgrade-1.5.1-1.5.2.patch"

RnJvbSAxYWQxMGNmMzUyZmE1ZWUyYzQzMjEzZmZjZjEyMmM1ZjllYzFkODZiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMDg6MDM6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBvZXRyeS1jb3JlOiB1cGdyYWRlIDEuNS4xIC0+IDEuNS4yCgotLS0KIC4uLnl0aG9u
My1wb2V0cnktY29yZV8xLjUuMS5iYiA9PiBweXRob24zLXBvZXRyeS1jb3JlXzEuNS4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS41
LjEuYmIgPT4gcHl0aG9uMy1wb2V0cnktY29yZV8xLjUuMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS41LjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS41
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzEuNS4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcG9ldHJ5LWNvcmVfMS41LjIuYmIKaW5kZXgg
OTUyZmZlZjk5ZC4uNzM4Yjk3ODY5MCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBvZXRyeS1jb3JlXzEuNS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1wb2V0cnktY29yZV8xLjUuMi5iYgpAQCAtMTksNyArMTks
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIlwKICAgICBmaWxlOi8vc3JjL3BvZXRyeS9jb3JlL192
ZW5kb3IvdHlwaW5nX2V4dGVuc2lvbnMuTElDRU5TRTttZDU9ZjE2YjMyMzkxNzk5MmUwZjhhNmYw
MDcxYmM5OTEzZTIgXAogIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDE4ODcyNjEzNTg4NjNm
MjU4MzFmYTBhZDFmZTdlNDUxZmMzMmQxYzgxZmNmNzcxMGJhNTE3NGNjMDA0N2M2ZCIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICJjNjU1NmMzYjFlYzViODY2OGU2ZWY1YTQ0OTQ3MjZiYzQxZDMxOTA3
MzM5NDI1ZTE5NGU3OGE2MTc4NDM2YzE0IgogCiBpbmhlcml0IHB5dGhvbl9wb2V0cnlfY29yZSBw
eXBpCiBQWVBJX0FSQ0hJVkVfTkFNRSA9ICJwb2V0cnlfY29yZS0ke1BWfS4ke1BZUElfUEFDS0FH
RV9FWFR9IgotLSAKMi4zOS4yCgo=

--===============1308951910428272088==--

