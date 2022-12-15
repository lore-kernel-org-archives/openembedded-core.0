Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4169C71147
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.144498.1671136351560061297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=e7l3iVvy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010185177d1393-80e3d8b5-a5f8-48b6-98f8-474bac73ac06-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aNC/MYhrSla8SCXx1KkZDq8qBlXgQ5vDIjafZAGYjm0=;
	b=e7l3iVvyOtFPJD9jBsKeNIePycXTNUm7Kh7HSX+QJV7uYlxIMwUL+2QsW++BchHx
	LmmYjuFPQbv2TRNSOzHFQ947fO0iMViZGZ0NX49VPHqD3aEociMj69P+P+qwMU40Cge
	RRcXCxbVxYp9GVpg7u18OKrJa3GDXVrUZEXkXfTo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aNC/MYhrSla8SCXx1KkZDq8qBlXgQ5vDIjafZAGYjm0=;
	b=ZAIsxbWo0KFsMHvGLU6uNp95OSnFb104LriTPFvPwvxqAvm/HU3DCFTD6XnG7Cmy
	GT5Jt/Aga2hla+typE0BwKzQX3K5bTJ5nVoyJo4GC5Lov/FfkPHvnJDRVQHWuCDLKxi
	RktkuwHaQ9fnWjvIEPW5xv6n+pEiXATY1X4/U29c=
Content-Type: multipart/mixed; boundary="===============8361197157126673021=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-lxml: upgrading to 4.9.2 SUCCEEDED
Message-ID: <01010185177d1393-80e3d8b5-a5f8-48b6-98f8-474bac73ac06-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174641

--===============8361197157126673021==
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
--===============8361197157126673021==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-lxml-upgrade-4.9.1-4.9.2.patch"

RnJvbSBkZmYxOWY1NTNmMTZiMTRiNmUxY2Y2ZjZmYWU5MDg3NGU1MWMzN2M3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTE6MjA6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWx4bWw6IHVwZ3JhZGUgNC45LjEgLT4gNC45LjIKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1seG1sXzQuOS4xLmJiID0+IHB5dGhvbjMtbHhtbF80LjkuMi5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1seG1sXzQuOS4xLmJiID0+IHB5dGhv
bjMtbHhtbF80LjkuMi5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1seG1sXzQuOS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1seG1sXzQuOS4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMi5i
YgppbmRleCA5MmEzMGY3OTA3Li5jN2YxZTFmYzNjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbHhtbF80LjkuMi5iYgpAQCAtMTgsNyArMTgsNyBAQCBM
SUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFUy50eHQ7bWQ1PWU0YzA0NWViYWQ5NThl
YWQ0YjQ4MDA4ZjcwODM4NDAzIFwKIAogREVQRU5EUyArPSAibGlieG1sMiBsaWJ4c2x0IgogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmU3NDliMDUyYmI3MjMzZmU1ZDA3MmZjYjU0OTIyMWE4Y2Ix
YTE2NzI1YzQ3YzM3ZTQyYjBiOWNiM2ZmMmMzZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNDU1
Y2ZhZWI3YWM3MDMzOGIzMjU3ZjQxZTIxZjA3MjRmNGI1YjBjMGU3NzAyZGE2N2VlNmMzNjQwODM1
YjY3IgogCiBTUkNfVVJJICs9ICIke1BZUElfU1JDX1VSSX0iCiBpbmhlcml0IHBrZ2NvbmZpZyBw
eXBpIHNldHVwdG9vbHMzCi0tIAoyLjM3LjMKCg==

--===============8361197157126673021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-lxml: SRC_URI changed from "https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.1.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.1.tar.gz" to "https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.2.tar.gz https://files.pythonhosted.org/packages/source/l/lxml/lxml-4.9.2.tar.gz"
packages/core2-32-poky-linux/python3-lxml: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dbg: PKGSIZE changed from 12543932 to 12543444 (-0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dev: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-dev: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-doc: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-doc: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-locale: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-locale: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml-src: PKGSIZE changed from 16757568 to 16769767 (+0%)
packages/core2-32-poky-linux/python3-lxml/python3-lxml-staticdev: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml-staticdev: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PV changed from "4.9.1" to "4.9.2"
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGV changed from 4.9.1 [default] to 4.9.2 [default]
packages/core2-32-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.11/site-packages/lxml-4.9.1.dist-info -> /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info, added "/usr/lib/python3.11/site-packages/lxml/debug.pxi /usr/lib/python3.11/site-packages/lxml/nsclasses.pxi /usr/lib/python3.11/site-packages/lxml/relaxng.pxi /usr/lib/python3.11/site-packages/lxml/xpath.pxi /usr/lib/python3.11/site-packages/lxml/xinclude.pxi /usr/lib/python3.11/site-packages/lxml/dtd.pxi /usr/lib/python3.11/site-packages/lxml/etree.pyx /usr/lib/python3.11/site-packages/lxml/parser.pxi /usr/lib/python3.11/site-packages/lxml/objectpath.pxi /usr/lib/python3.11/site-packages/lxml/objectify.pyx /usr/lib/python3.11/site-packages/lxml/xmlerror.pxi /usr/lib/python3.11/site-packages/lxml/serializer.pxi /usr/lib/python3.11/site-packages/lxml/saxparser.pxi /usr/lib/python3.11/site-packages/lxml/parsertarget.pxi /usr/lib/python3.11/site-packages/lxml/cleanup.pxi /usr/lib/python3.11/
 site-packages/lxml/xmlschema.pxi /usr/lib/python3.11/site-packages/lxml/xslt.pxi /usr/lib/python3.11/site-packages/lxml/iterparse.pxi /usr/lib/python3.11/site-packages/lxml/proxy.pxi /usr/lib/python3.11/site-packages/lxml/readonlytree.pxi /usr/lib/python3.11/site-packages/lxml/docloader.pxi /usr/lib/python3.11/site-packages/lxml/xmlid.pxi /usr/lib/python3.11/site-packages/lxml/classlookup.pxi /usr/lib/python3.11/site-packages/lxml/extensions.pxi /usr/lib/python3.11/site-packages/lxml/schematron.pxi /usr/lib/python3.11/site-packages/lxml/apihelpers.pxi /usr/lib/python3.11/site-packages/lxml/xsltext.pxi /usr/lib/python3.11/site-packages/lxml/public-api.pxi"
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 4319155 to 5102057 (+18%)
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

--===============8361197157126673021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-lxml/python3-lxml: FILELIST: directory renamed /usr/lib/python3.11/site-packages/lxml-4.9.1.dist-info -> /usr/lib/python3.11/site-packages/lxml-4.9.2.dist-info, added "/usr/lib/python3.11/site-packages/lxml/xmlschema.pxi /usr/lib/python3.11/site-packages/lxml/public-api.pxi /usr/lib/python3.11/site-packages/lxml/iterparse.pxi /usr/lib/python3.11/site-packages/lxml/xpath.pxi /usr/lib/python3.11/site-packages/lxml/extensions.pxi /usr/lib/python3.11/site-packages/lxml/etree.pyx /usr/lib/python3.11/site-packages/lxml/xmlid.pxi /usr/lib/python3.11/site-packages/lxml/parsertarget.pxi /usr/lib/python3.11/site-packages/lxml/serializer.pxi /usr/lib/python3.11/site-packages/lxml/schematron.pxi /usr/lib/python3.11/site-packages/lxml/apihelpers.pxi /usr/lib/python3.11/site-packages/lxml/relaxng.pxi /usr/lib/python3.11/site-packages/lxml/readonlytree.pxi /usr/lib/python3.11/site-packages/lxml/xmlerror.pxi /usr/lib/python3.11/site-packages/lxml/debug.pxi /usr/l
 ib/python3.11/site-packages/lxml/classlookup.pxi /usr/lib/python3.11/site-packages/lxml/objectify.pyx /usr/lib/python3.11/site-packages/lxml/docloader.pxi /usr/lib/python3.11/site-packages/lxml/parser.pxi /usr/lib/python3.11/site-packages/lxml/saxparser.pxi /usr/lib/python3.11/site-packages/lxml/nsclasses.pxi /usr/lib/python3.11/site-packages/lxml/objectpath.pxi /usr/lib/python3.11/site-packages/lxml/xinclude.pxi /usr/lib/python3.11/site-packages/lxml/xsltext.pxi /usr/lib/python3.11/site-packages/lxml/proxy.pxi /usr/lib/python3.11/site-packages/lxml/cleanup.pxi /usr/lib/python3.11/site-packages/lxml/dtd.pxi /usr/lib/python3.11/site-packages/lxml/xslt.pxi"
packages/core2-32-poky-linux/python3-lxml/python3-lxml: PKGSIZE changed from 4319155 to 5102057 (+18%)
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

--===============8361197157126673021==--

