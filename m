Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B2AC64EAE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.874.1667349633845509364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SgUBjMIA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018435c858ab-0536d9af-4888-4f14-ac97-a3c5014e1d54-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qpce4sYZvHqXRO83UdL1k/+uh5FVi8y5BEUWXIpRlfU=;
	b=SgUBjMIA82npWwjyLjreNOwmkglvKD1KMi001CAz3yJ4+yWFxHooTk0wN9c7u1PT
	1zHwLvSvfPEhIXkdKBCmk9MVv7GSmfIK4mnZOApxJClMdSXEGzWju173dDCEUpbjk6t
	kqNCWN7Z+JKnXmZinarDHyVKcHQeEF+Ex54HFVzs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349633;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qpce4sYZvHqXRO83UdL1k/+uh5FVi8y5BEUWXIpRlfU=;
	b=jSf+Kc7QLeWOTBze4FMQwmdJ8mu9OQ67epGOT2lr2Qt7nFhqmEDtNcZcwdtZA65n
	oEfwT0eAl06U60DNAcmWzMafls4bhniLzLhg4VCtMJwWzCs00JPdnUeJG/6J30KWw1c
	oifjbDYmRwdAoeUcedVkTE17IH7f1k3EVUCuka+g=
Content-Type: multipart/mixed; boundary="===============2961290967714798130=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest-subtests: upgrading to 0.9.0 SUCCEEDED
Message-ID: <0101018435c858ab-0536d9af-4888-4f14-ac97-a3c5014e1d54-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172437

--===============2961290967714798130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest-subtests* to *0.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-subtests-upgrade-0.8.0-0.9.0.patch
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
--===============2961290967714798130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-pytest-subtests: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest-subtests/pytest-subtests-0.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest-subtests/pytest-subtests-0.9.0.tar.gz"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dbg: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-dev: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-doc: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-locale: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-src: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests-staticdev: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PV changed from "0.8.0" to "0.9.0"
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGV changed from 0.8.0 [default] to 0.9.0 [default]
packages/core2-32-poky-linux/python3-pytest-subtests/python3-pytest-subtests: PKGSIZE changed from 30060 to 29662 (-1%)
Changes to packages/core2-32-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.11/site-packages/pytest_subtests-0.8.0.dist-info moved to /usr/lib/python3.11/site-packages/pytest_subtests-0.9.0.dist-info

--===============2961290967714798130==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-subtests-upgrade-0.8.0-0.9.0.patch"

RnJvbSBiMzJiOGZmMDM4MDRmZDE2MmEyZmU2NTRhNTFiMzEzNzAzYWIyYzZmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMDo1MjoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcHl0ZXN0LXN1YnRlc3RzOiB1cGdyYWRlIDAuOC4wIC0+IDAuOS4wCgotLS0KIC4uLnl0
ZXN0LXN1YnRlc3RzXzAuOC4wLmJiID0+IHB5dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuOS4wLmJi
fSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcHl0ZXN0LXN1YnRl
c3RzXzAuOC4wLmJiID0+IHB5dGhvbjMtcHl0ZXN0LXN1YnRlc3RzXzAuOS4wLmJifSAoODYlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Qt
c3VidGVzdHNfMC44LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0LXN1YnRlc3RzXzAuOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3Qtc3VidGVzdHNfMC44
LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRl
c3Qtc3VidGVzdHNfMC45LjAuYmIKaW5kZXggYjA5MjkxMmIzMi4uYmZhZmYzOTA3NyAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdC1zdWJ0ZXN0
c18wLjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0
ZXN0LXN1YnRlc3RzXzAuOS4wLmJiCkBAIC03LDcgKzcsNyBAQCBCVUdUUkFDS0VSID0gImh0dHBz
Oi8vZ2l0aHViLmNvbS9weXRlc3QtZGV2L3B5dGVzdC1zdWJ0ZXN0cy9pc3N1ZXMiCiBMSUNFTlNF
ID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTI0MmI0ZTE3
ZmEyODdkY2Y3YWVmMzcyZjZiYzNkY2IxIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDZlYjM3
NjAyMmU5MjY5NTA4MTZjY2MyMzUwMmRlMzI3N2FkY2MxMzk2NjUyZGRiMzMyOGNlMDI4OTA1MmM0
ZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJjMDMxN2NkNWY2YTVlYjNlOTU3ZTg5ZGJlNGZjMzMy
MmE5YWZkZGJhMmRiODQxNDM1NWVkMmEyY2I5MWE4NDRlIgogCiBpbmhlcml0IHB5cGkgc2V0dXB0
b29sczMKIAotLSAKMi4zMS4xCgo=

--===============2961290967714798130==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-pytest-subtests (sysroot):
  /usr/lib/python3.11/site-packages/pytest_subtests-0.8.0.dist-info moved to /usr/lib/python3.11/site-packages/pytest_subtests-0.9.0.dist-info

--===============2961290967714798130==--

