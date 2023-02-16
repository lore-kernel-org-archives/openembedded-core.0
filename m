Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB8CC6FD1E
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10290.1676508396807297188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Ezs6YE7A;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018657aff824-cb64bfab-0efb-4798-88d0-8380ca909955-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6wx8L1bAN1Ms+i+18pPp3JUxp41ZdRW3+55F8njJgwM=;
	b=Ezs6YE7AZTBGCREE0MJAWpS5744KyULHv0DporrbnXT3CmhygVVWtZdwKh+bvIO2
	qDOsXz+pzxgk2sWDxDavPvCP9DWJfU3oNX8AAa3PzQ2d6JZrlIxfjlvZwafvK/PhWzx
	H2wEkBI/6qSqa1JSoR5OkWTpgy4vxYT955Pbsloo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6wx8L1bAN1Ms+i+18pPp3JUxp41ZdRW3+55F8njJgwM=;
	b=RTIFtUh/nVbqyxuZZBbKnIdWQ+wKbNCYWSH7es5EBWgeb/rbfZkN52lUr7+l2PSC
	slt9+6KMbTtkttTYPojwcc9NeYqDIogxZaKsvHDXn7dkhz5MIYxHC1N/e3SovzDH5+1
	KZsaChzP2uLWCSY35ODH0lE913Pya80fbWD0L5EY=
Content-Type: multipart/mixed; boundary="===============8065362924123085447=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mmc-utils: upgrading to
 d4c2910981ff99b983734426dfa99632fb81ac6b SUCCEEDED
Message-ID: <0101018657aff824-cb64bfab-0efb-4798-88d0-8380ca909955-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177240

--===============8065362924123085447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mmc-utils* to *d4c2910981ff99b983734426dfa99632fb81ac6b* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mmc-utils-upgrade-to-latest-revision.patch
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
--===============8065362924123085447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mmc-utils: PKGV changed from 0.1+gitAUTOINC+c62dd8e415 [default] to 0.1+gitAUTOINC+d4c2910981 [default]
packages/core2-32-poky-linux/mmc-utils: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGSIZE changed from 233712 to 235268 (+1%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGSIZE changed from 215101 to 216175 (+0%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGSIZE changed from 139044 to 143172 (+3%)
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PV changed from "0.1+gitAUTOINC+c62dd8e415" to "0.1+gitAUTOINC+d4c2910981"

--===============8065362924123085447==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/mmc-utils/mmc-utils-dbg: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-dev: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-doc: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-locale: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-src: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils-staticdev: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981
packages/core2-32-poky-linux/mmc-utils/mmc-utils: PKGV changed from 0.1+git0+c62dd8e415 to 0.1+git0+d4c2910981

--===============8065362924123085447==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mmc-utils-upgrade-to-latest-revision.patch"

RnJvbSAzNTA2MzQ5MjNkN2QyNjBkMDZhZjg1MTVhMWIwMzk2MWI0ZGMwZDJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6MTU6MzkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
bWMtdXRpbHM6IHVwZ3JhZGUgdG8gbGF0ZXN0IHJldmlzaW9uCgotLS0KIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9tbWMvbW1jLXV0aWxzX2dpdC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9tbWMvbW1j
LXV0aWxzX2dpdC5iYgppbmRleCBkOTYyNTQ3M2Y1Li44YzQxYjc3ZmUxIDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvbW1jL21tYy11dGlsc19naXQuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL21tYy9tbWMtdXRpbHNfZ2l0LmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIkdQTC0yLjAtb25seSIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL21tYy5jO2JlZ2lu
bGluZT0xO2VuZGxpbmU9MjA7bWQ1PWZhZTMyNzkyZTIwZjRkMjdhZGUxYzVhNzYyZDE2YjdkIgog
CiBTUkNCUkFOQ0ggPz0gIm1hc3RlciIKLVNSQ1JFViA9ICJjNjJkZDhlNDE1YjEyY2M3ZjlhMzYy
ZGIyM2NkMzg0Y2FmNzdmZjAzIgorU1JDUkVWID0gImQ0YzI5MTA5ODFmZjk5Yjk4MzczNDQyNmRm
YTk5NjMyZmI4MWFjNmIiCiAKIFBWID0gIjAuMStnaXQke1NSQ1BWfSIKIAotLSAKMi4zNy4zCgo=

--===============8065362924123085447==--

