Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB9DC71153
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 20:46:19 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.20667.1672605967260574376
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 12:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ShSBORKe;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101856f15a03f-317cb735-3065-4847-b547-094cca97a584-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wKDRBogYUUju+lHNDcE+nY2wen1ltX6QZfSWb6u7bU8=;
	b=ShSBORKeDp4m6Ci4ddYvLsKuYiAq4tbU/1irIsBcUfytrDCH7lEu/nvFa17bHN4q
	VmgolZmXfr2Ac57huGr4I0vRiANfEODyPIcwkpwXBm9tp17W7NZtyku5bwAnX/TivYN
	RarruaLy9His+2JkKK9gcuxr+/VbXlvZ9LwvCTtc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1672605966;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wKDRBogYUUju+lHNDcE+nY2wen1ltX6QZfSWb6u7bU8=;
	b=kQJIHW9q9o3tpbSKYrkMKpGDT6RWeaWtwN5RopY5BdLKm+Lb1tTOPIvThB3SFmCN
	Rn/eTuMsK+aAvaRZS6TahLY7TjRrrInDuttnUFVrps3J2UXep7fonu26RIKefdUmLHC
	gt7+m42LMl6G6CjrjYeCbldgqtRNVGF1lGQP+/ls=
Content-Type: multipart/mixed; boundary="===============8540091803953374526=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 4.9.2 SUCCEEDED
Message-ID: <010101856f15a03f-317cb735-3065-4847-b547-094cca97a584-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jan 2023 20:46:06 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 20:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175261

--===============8540091803953374526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-lxml* to *4.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-lxml-upgrade-4.9.1-4.9.2.patch
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
--===============8540091803953374526==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-4.9.1-4.9.2.patch"

RnJvbSA0NDk1YmRiYjk3YTI4YjU5MjdkYjJmNzI4NWVjNjA2M2Y5ZjZiNjU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKYW4gMjAyMyAwOTozMzoyMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbHhtbDogdXBncmFkZSA0LjkuMSAtPiA0LjkuMgoKLS0tCiAuLi4vcHl0aG9uL3tweXRo
b24zLWx4bWxfNC45LjEuYmIgPT4gcHl0aG9uMy1seG1sXzQuOS4yLmJifSAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWx4bWxfNC45LjEuYmIgPT4gcHl0aG9u
My1seG1sXzQuOS4yLmJifSAoOTUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1seG1sXzQuOS4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWx4bWxfNC45LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWx4bWxfNC45LjEuYmIKcmVu
YW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzQuOS4yLmJi
CmluZGV4IDkyYTMwZjc5MDcuLmM3ZjFlMWZjM2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzQuOS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzQuOS4yLmJiCkBAIC0xOCw3ICsxOCw3IEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0VTLnR4dDttZDU9ZTRjMDQ1ZWJhZDk1OGVh
ZDRiNDgwMDhmNzA4Mzg0MDMgXAogCiBERVBFTkRTICs9ICJsaWJ4bWwyIGxpYnhzbHQiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJmZTc0OWIwNTJiYjcyMzNmZTVkMDcyZmNiNTQ5MjIxYThjYjFh
MTY3MjVjNDdjMzdlNDJiMGI5Y2IzZmYyYzNmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI0NTVj
ZmFlYjdhYzcwMzM4YjMyNTdmNDFlMjFmMDcyNGY0YjViMGMwZTc3MDJkYTY3ZWU2YzM2NDA4MzVi
NjciCiAKIFNSQ19VUkkgKz0gIiR7UFlQSV9TUkNfVVJJfSIKIGluaGVyaXQgcGtnY29uZmlnIHB5
cGkgc2V0dXB0b29sczMKLS0gCjIuMzcuMwoK

--===============8540091803953374526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 4316672 to 5098986 (+18%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.11/site-packages/lxml-4.9.1.dist-info -> /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info, added "/usr/lib/python3.11/site-packages/lxml/saxparser.pxi /usr/lib/python3.11/site-packages/lxml/readonlytree.pxi /usr/lib/python3.11/site-packages/lxml/relaxng.pxi /usr/lib/python3.11/site-packages/lxml/xmlid.pxi /usr/lib/python3.11/site-packages/lxml/etree.pyx /usr/lib/python3.11/site-packages/lxml/xmlerror.pxi /usr/lib/python3.11/site-packages/lxml/iterparse.pxi /usr/lib/python3.11/site-packages/lxml/xinclude.pxi /usr/lib/python3.11/site-packages/lxml/xslt.pxi /usr/lib/python3.11/site-packages/lxml/public-api.pxi /usr/lib/python3.11/site-packages/lxml/classlookup.pxi /usr/lib/python3.11/site-packages/lxml/debug.pxi /usr/lib/python3.11/site-packages/lxml/proxy.pxi /usr/lib/python3.11/site-packages/lxml/xmlschema.pxi /usr/lib/python3.11/site-packages/lxml/xsltext.pxi /usr/lib/python3.11
 /site-packages/lxml/dtd.pxi /usr/lib/python3.11/site-packages/lxml/cleanup.pxi /usr/lib/python3.11/site-packages/lxml/objectpath.pxi /usr/lib/python3.11/site-packages/lxml/parser.pxi /usr/lib/python3.11/site-packages/lxml/docloader.pxi /usr/lib/python3.11/site-packages/lxml/schematron.pxi /usr/lib/python3.11/site-packages/lxml/extensions.pxi /usr/lib/python3.11/site-packages/lxml/xpath.pxi /usr/lib/python3.11/site-packages/lxml/serializer.pxi /usr/lib/python3.11/site-packages/lxml/objectify.pyx /usr/lib/python3.11/site-packages/lxml/nsclasses.pxi /usr/lib/python3.11/site-packages/lxml/parsertarget.pxi /usr/lib/python3.11/site-packages/lxml/apihelpers.pxi"
Changes to packages/core2-32-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.11/site-packages/lxml-4.9.1.dist-info moved to /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info
  /usr/lib/python3.11/site-packages/lxml/apihelpers.pxi was added
  /usr/lib/python3.11/site-packages/lxml/classlookup.pxi was added
  /usr/lib/python3.11/site-packages/lxml/cleanup.pxi was added
  /usr/lib/python3.11/site-packages/lxml/debug.pxi was added
  /usr/lib/python3.11/site-packages/lxml/docloader.pxi was added
  /usr/lib/python3.11/site-packages/lxml/dtd.pxi was added
  /usr/lib/python3.11/site-packages/lxml/etree.pyx was added
  /usr/lib/python3.11/site-packages/lxml/extensions.pxi was added
  /usr/lib/python3.11/site-packages/lxml/iterparse.pxi was added
  /usr/lib/python3.11/site-packages/lxml/nsclasses.pxi was added
  /usr/lib/python3.11/site-packages/lxml/objectify.pyx was added
  /usr/lib/python3.11/site-packages/lxml/objectpath.pxi was added
  /usr/lib/python3.11/site-packages/lxml/parser.pxi was added
  /usr/lib/python3.11/site-packages/lxml/parsertarget.pxi was added
  /usr/lib/python3.11/site-packages/lxml/proxy.pxi was added
  /usr/lib/python3.11/site-packages/lxml/public-api.pxi was added
  /usr/lib/python3.11/site-packages/lxml/readonlytree.pxi was added
  /usr/lib/python3.11/site-packages/lxml/relaxng.pxi was added
  /usr/lib/python3.11/site-packages/lxml/saxparser.pxi was added
  /usr/lib/python3.11/site-packages/lxml/schematron.pxi was added
  /usr/lib/python3.11/site-packages/lxml/serializer.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xinclude.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xmlerror.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xmlid.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xmlschema.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xpath.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xsltext.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xslt.pxi was added

--===============8540091803953374526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-lxml: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.2.tar.gz"
packages/core2-32-poky-linux/python3-lxml: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 12543932 to 12543444 (-0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 16757568 to 16769767 (+0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 4316672 to 5098986 (+18%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.11/site-packages/lxml-4.9.1.dist-info -> /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info, added "/usr/lib/python3.11/site-packages/lxml/parsertarget.pxi /usr/lib/python3.11/site-packages/lxml/parser.pxi /usr/lib/python3.11/site-packages/lxml/xmlerror.pxi /usr/lib/python3.11/site-packages/lxml/proxy.pxi /usr/lib/python3.11/site-packages/lxml/xpath.pxi /usr/lib/python3.11/site-packages/lxml/relaxng.pxi /usr/lib/python3.11/site-packages/lxml/apihelpers.pxi /usr/lib/python3.11/site-packages/lxml/debug.pxi /usr/lib/python3.11/site-packages/lxml/xinclude.pxi /usr/lib/python3.11/site-packages/lxml/extensions.pxi /usr/lib/python3.11/site-packages/lxml/schematron.pxi /usr/lib/python3.11/site-packages/lxml/etree.pyx /usr/lib/python3.11/site-packages/lxml/objectify.pyx /usr/lib/python3.11/site-packages/lxml/docloader.pxi /usr/lib/python3.11/site-packages/lxml/dtd.pxi /usr/lib/python3.11/s
 ite-packages/lxml/objectpath.pxi /usr/lib/python3.11/site-packages/lxml/serializer.pxi /usr/lib/python3.11/site-packages/lxml/xslt.pxi /usr/lib/python3.11/site-packages/lxml/readonlytree.pxi /usr/lib/python3.11/site-packages/lxml/saxparser.pxi /usr/lib/python3.11/site-packages/lxml/classlookup.pxi /usr/lib/python3.11/site-packages/lxml/public-api.pxi /usr/lib/python3.11/site-packages/lxml/xsltext.pxi /usr/lib/python3.11/site-packages/lxml/nsclasses.pxi /usr/lib/python3.11/site-packages/lxml/xmlschema.pxi /usr/lib/python3.11/site-packages/lxml/xmlid.pxi /usr/lib/python3.11/site-packages/lxml/cleanup.pxi /usr/lib/python3.11/site-packages/lxml/iterparse.pxi"
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
Changes to packages/core2-32-poky-linux/python3-lxml (sysroot):
  /usr/lib/python3.11/site-packages/lxml-4.9.1.dist-info moved to /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info
  /usr/lib/python3.11/site-packages/lxml/apihelpers.pxi was added
  /usr/lib/python3.11/site-packages/lxml/classlookup.pxi was added
  /usr/lib/python3.11/site-packages/lxml/cleanup.pxi was added
  /usr/lib/python3.11/site-packages/lxml/debug.pxi was added
  /usr/lib/python3.11/site-packages/lxml/docloader.pxi was added
  /usr/lib/python3.11/site-packages/lxml/dtd.pxi was added
  /usr/lib/python3.11/site-packages/lxml/etree.pyx was added
  /usr/lib/python3.11/site-packages/lxml/extensions.pxi was added
  /usr/lib/python3.11/site-packages/lxml/iterparse.pxi was added
  /usr/lib/python3.11/site-packages/lxml/nsclasses.pxi was added
  /usr/lib/python3.11/site-packages/lxml/objectify.pyx was added
  /usr/lib/python3.11/site-packages/lxml/objectpath.pxi was added
  /usr/lib/python3.11/site-packages/lxml/parser.pxi was added
  /usr/lib/python3.11/site-packages/lxml/parsertarget.pxi was added
  /usr/lib/python3.11/site-packages/lxml/proxy.pxi was added
  /usr/lib/python3.11/site-packages/lxml/public-api.pxi was added
  /usr/lib/python3.11/site-packages/lxml/readonlytree.pxi was added
  /usr/lib/python3.11/site-packages/lxml/relaxng.pxi was added
  /usr/lib/python3.11/site-packages/lxml/saxparser.pxi was added
  /usr/lib/python3.11/site-packages/lxml/schematron.pxi was added
  /usr/lib/python3.11/site-packages/lxml/serializer.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xinclude.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xmlerror.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xmlid.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xmlschema.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xpath.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xsltext.pxi was added
  /usr/lib/python3.11/site-packages/lxml/xslt.pxi was added

--===============8540091803953374526==--

