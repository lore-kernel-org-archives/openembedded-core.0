Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C61C2BBC5
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:37 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.3939.1659679409293590817
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LIt/LlLS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101826c9a0207-870c2777-68b8-4b80-957e-d500efe1b386-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LZjLHrp9bxsbi9q+/mumxxiEpKq24DPYikiR/ZayHZs=;
	b=LIt/LlLSgxsEIrVDiLhIomEXIK+pkqP00Sjalsd0JzyXdMKl7V2r13s4ocErBYMl
	EUSWj92Eam5CnKLZrKMp5+724/UOQDnv7vIM66x2Q2b4YgKuq4WnhNiglG3fZIKjqHY
	WrB2oYV0a/oMoEzSoHmxjxmkgW/wTWi3NN8Xksw4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679408;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LZjLHrp9bxsbi9q+/mumxxiEpKq24DPYikiR/ZayHZs=;
	b=kyo/1mXZEpYgy7VaLYOtYrq1lDNZKP8wPcqdBHy15yewZGeEGpa5t9znYpZbvxVt
	jF+gxDy2cho5jde8SGUKt5VncmVk6b/AjHnibYFFA4i3nleiLFK1iZUnW5EEQMkDPwX
	wg6DULuYXtUbg+eFiPV4bX5PkvPBars2iz7H7lcU=
Content-Type: multipart/mixed; boundary="===============6335151882791355361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to 8399cff6a3b9bf15c6d1d9e0c905d1411f25f9b8
 SUCCEEDED
Message-ID: 
 <010101826c9a0207-870c2777-68b8-4b80-957e-d500efe1b386-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:28 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168915

--===============6335151882791355361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *8399cff6a3b9bf15c6d1d9e0c905d1411f25f9b8* has Succeeded.

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
--===============6335151882791355361==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-puzzles-upgrade-to-latest-revision.patch"

RnJvbSA4OWU1NWY4ZTNiYzU3OWRmYmM5ZDBlNTYwNDE5ZDRlMWZlOTFlZWQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgNSBBdWcgMjAyMiAwMzowMjo0OCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB1
enpsZXM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1zYXRv
L3B1enpsZXMvcHV6emxlc19naXQuYmIgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc2F0by9wdXp6
bGVzL3B1enpsZXNfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8vcHV6emxlcy9wdXp6bGVzX2dp
dC5iYgppbmRleCA2OGJkZWU4YjUyLi45ZTliY2QyZWVmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtc2F0by9wdXp6bGVzL3B1enpsZXNfZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1zYXRvL3B1
enpsZXMvcHV6emxlc19naXQuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIngxMSIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0LnRhcnRhcnVzLm9yZy9zaW1vbi9w
dXp6bGVzLmdpdDticmFuY2g9bWFpbiIKIAogVVBTVFJFQU1fQ0hFQ0tfQ09NTUlUUyA9ICIxIgot
U1JDUkVWID0gIjM4N2QzMjNkZDhkNTc5ZGIyYzkwYjQ5OWIzYjE5Zjc0NmNiZGJjZTUiCitTUkNS
RVYgPSAiODM5OWNmZjZhM2I5YmYxNWM2ZDFkOWUwYzkwNWQxNDExZjI1ZjliOCIKIFBFID0gIjIi
CiBQViA9ICIwLjArZ2l0JHtTUkNQVn0iCiAKLS0gCjIuMzEuMQoK

--===============6335151882791355361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3

--===============6335151882791355361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/puzzles: PKGV changed from 0.0+gitAUTOINC+387d323dd8 [default] to 0.0+gitAUTOINC+8399cff6a3 [default]
packages/core2-32-poky-linux/puzzles: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGSIZE changed from 13499884 to 13529324 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-dbg: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles-dev: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-dev: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles-doc: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-doc: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles-locale: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-locale: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGSIZE changed from 3483437 to 3484474 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles-src: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-src: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles-staticdev: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"
packages/core2-32-poky-linux/puzzles/puzzles: PKGSIZE changed from 6716866 to 6720962 (+0%)
packages/core2-32-poky-linux/puzzles/puzzles: PKGV changed from 0.0+git0+387d323dd8 to 0.0+git0+8399cff6a3
packages/core2-32-poky-linux/puzzles/puzzles: PV changed from "0.0+gitAUTOINC+387d323dd8" to "0.0+gitAUTOINC+8399cff6a3"

--===============6335151882791355361==--

