Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6384CA9EC0
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.7529.1685693432018974057
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Gr1zxzaa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101887b288181-d9c884d6-d4c7-4692-94ee-7a3fa2ee17e4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QM/YnweyzazhYPFmstxdJ9NL380GEak83Wt2H4ZYhpM=;
	b=Gr1zxzaayFka0MTdPm8756ulKE2HpjEb2Q3N0n/vcurqdAH1RG1n9i6se/Na+tIF
	hnKeZPichrPyzoe3vxOzLEm93jEzvmZf3hnsShwoTa3a82iyF6+kdB9DP3q91ZcnD6n
	OvFIP3ad2IpRpMHXtV5uAdeKuxO4LVEVB4lFt4Nw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693432;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QM/YnweyzazhYPFmstxdJ9NL380GEak83Wt2H4ZYhpM=;
	b=lkSN9CAo/+ZW39/+6zEf60qcUOYJfh3Zg5QaIus8hNF1u49K3PDPEygu3dV7ORBt
	WVthGaGJigkPaLyEDmZxgfV3BR8ZOm8LAnICl3TMlBaUPJr2UteHW4Xdp7JNiGBhT05
	bD8MuRJGtH4o5NDHSB0ZCZWJtd4X1HtKzXeBTuxE=
Content-Type: multipart/mixed; boundary="===============6015786670994929779=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 3.9.0 SUCCEEDED
Message-ID: <010101887b288181-d9c884d6-d4c7-4692-94ee-7a3fa2ee17e4-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:32 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182207

--===============6015786670994929779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flit-core* to *3.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.8.0-3.9.0.patch
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
--===============6015786670994929779==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.8.0-3.9.0.patch"

RnJvbSA3NjA5NzBiYWRmODJlNzFlODI3NjU1MDJhYjRjY2E3OGYzNjM5MGE1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxNDozMTozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtZmxpdC1jb3JlOiB1cGdyYWRlIDMuOC4wIC0+IDMuOS4wCgotLS0KIC4uLi97cHl0aG9u
My1mbGl0LWNvcmVfMy44LjAuYmIgPT4gcHl0aG9uMy1mbGl0LWNvcmVfMy45LjAuYmJ9ICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtZmxpdC1jb3JlXzMuOC4wLmJi
ID0+IHB5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mbGl0LWNvcmVfMy44LjAuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1mbGl0LWNvcmVfMy44LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1mbGl0LWNvcmVfMy45LjAuYmIKaW5kZXggMmU1YjFlODA2OS4uYjBi
ZWY0YjZiNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWZsaXQtY29yZV8zLjguMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJiCkBAIC04LDcgKzgsNyBAQCBCVUdUUkFDS0VSID0gImh0
dHBzOi8vZ2l0aHViLmNvbS9weXBhL2ZsaXQvaXNzdWVzIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00MWViNzhmYThhODcy
OTgzYTg4MmM2OTRhODMwNWYwOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQwZjJhOGY0YmQ0
NWRjNzk0YmVmYmY1ODM5ZWNjMGZkMzgzMGQ2NWE1N2JkNTJiNTk5NzU0MmZhYzVkNWU5MzciCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZDc1ZWRmNWViMzI0ZGEyMGQ1MzU3MGE2YTZmODdmNTFlNjA2
ZWVlODM4NDkyNWNkNjZhOTA2MTExNDA4NDRjNyIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9mbGl0
X2NvcmUKIAotLSAKMi4zOS4yCgo=

--===============6015786670994929779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

--===============6015786670994929779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-flit-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/flit/flit-3.8.0.tar.gz;downloadfilename=flit-3.8.0.tar.gz" to "https://files.pythonhosted.org/packages/source/f/flit/flit-3.9.0.tar.gz;downloadfilename=flit-3.9.0.tar.gz"
packages/core2-32-poky-linux/python3-flit-core: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dbg: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dbg: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-dev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-doc: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-doc: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-locale: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-locale: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-src: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-src: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-staticdev: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-staticdev: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core-tests: PKGSIZE changed from 87520 to 88427 (+1%)
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PKGV changed from 3.8.0 [default] to 3.9.0 [default]
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PV changed from "3.8.0" to "3.9.0"
packages/core2-32-poky-linux/python3-flit-core/python3-flit-core: PKGSIZE changed from 239828 to 241833 (+1%)
Changes to packages/core2-32-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.11/site-packages/flit_core-3.8.0.dist-info moved to /usr/lib/python3.11/site-packages/flit_core-3.9.0.dist-info

--===============6015786670994929779==--

