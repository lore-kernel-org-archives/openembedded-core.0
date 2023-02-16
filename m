Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43180C76196
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:46 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.10300.1676508398444803529
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IgO9hlLE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018657b00068-e82cddbe-b8c3-4b3d-860c-af6da8a8b50a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XuiFoJGxu1SOM7Jx9j/ts9D/np6y/HoyS/ievkR9WO8=;
	b=IgO9hlLECBklXAj2iI8yiAgU4yeCMQF+p6+kaWQfSu+ZGUrbi9ToiuPUt5lrduWk
	xa2HOMyiAtPqHPRizjpT/WlVDa2n6Tuf/ruw/hb6K/ysy28ivu/9r7ODmly8eKUBUDc
	5D9xdOBGQk3F0jgV38GLkL+GmuQYvxc+VslzhR/c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XuiFoJGxu1SOM7Jx9j/ts9D/np6y/HoyS/ievkR9WO8=;
	b=QtAJBO4f7NktdpWXVdU2ZhfmHvuZTHQQqqJhR6lgy+ON5uQB+xfaJ/SJMkUPgXxu
	roGs5HP6hrj7ZrzLA/G/ePiwmbZRG7ErSohse05DxWQ/ICsA/RYkYhkinlISFNPGBt3
	N0/UgsTF3WfzK9XOebhmBfQZCAnilEs/bjlG2ZUs=
Content-Type: multipart/mixed; boundary="===============3940490152827019325=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Adrian Bunk <bunk@kernel.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wireless-regdb: upgrading to 2023.02.13 SUCCEEDED
Message-ID: <0101018657b00068-e82cddbe-b8c3-4b3d-860c-af6da8a8b50a-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177263

--===============3940490152827019325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wireless-regdb* to *2023.02.13* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wireless-regdb-upgrade-2022.08.12-2023.02.13.patch
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
--===============3940490152827019325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wireless-regdb: SRC_URI changed from "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2022.08.12.tar.xz" to "https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2023.02.13.tar.xz"
packages/all-poky-linux/wireless-regdb: PKGV changed from 2022.08.12 [default] to 2023.02.13 [default]
packages/all-poky-linux/wireless-regdb: PV changed from "2022.08.12" to "2023.02.13"
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PKGV changed from 2022.08.12 [default] to 2023.02.13 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-src: PV changed from "2022.08.12" to "2023.02.13"
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGSIZE changed from 5774 to 5858 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PKGV changed from 2022.08.12 [default] to 2023.02.13 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb-static: PV changed from "2022.08.12" to "2023.02.13"
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGSIZE changed from 6787 to 6871 (+1%)
packages/all-poky-linux/wireless-regdb/wireless-regdb: PKGV changed from 2022.08.12 [default] to 2023.02.13 [default]
packages/all-poky-linux/wireless-regdb/wireless-regdb: PV changed from "2022.08.12" to "2023.02.13"

--===============3940490152827019325==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wireless-regdb-upgrade-2022.08.12-2023.02.13.patch"

RnJvbSA1NGI5NTVkOWY5NDI0MWU2OTcyOTUzNDc3OTNlMzU3YTM2MDIyYTE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjI6MDU6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
aXJlbGVzcy1yZWdkYjogdXBncmFkZSAyMDIyLjA4LjEyIC0+IDIwMjMuMDIuMTMKCi0tLQogLi4u
aXJlbGVzcy1yZWdkYl8yMDIyLjA4LjEyLmJiID0+IHdpcmVsZXNzLXJlZ2RiXzIwMjMuMDIuMTMu
YmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1yZWdkYi97d2lyZWxlc3MtcmVn
ZGJfMjAyMi4wOC4xMi5iYiA9PiB3aXJlbGVzcy1yZWdkYl8yMDIzLjAyLjEzLmJifSAoOTQlKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIvd2lyZWxlc3Mt
cmVnZGJfMjAyMi4wOC4xMi5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMy4wMi4xMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNzLXJlZ2RiXzIw
MjIuMDguMTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvd2lyZWxlc3MtcmVnZGIv
d2lyZWxlc3MtcmVnZGJfMjAyMy4wMi4xMy5iYgppbmRleCAzNTdlNzlkN2UxLi5jZTYwMTU0ZjFl
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL3dpcmVsZXNzLXJlZ2RiL3dpcmVsZXNz
LXJlZ2RiXzIwMjIuMDguMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC93aXJlbGVzcy1y
ZWdkYi93aXJlbGVzcy1yZWdkYl8yMDIzLjAyLjEzLmJiCkBAIC01LDcgKzUsNyBAQCBMSUNFTlNF
ID0gIklTQyIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTA3YzRmNmRl
YTM4NDViMDJhMThkYzAwYzhjODc2OTljIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvcHViL3NvZnR3YXJlL25ldHdvcmsvJHtCUE59LyR7QlB9LnRhci54eiIKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICI1OWM4ZjdkMTc5NjZkYjcxYjI3ZjkwZTczNWVlOGY1YjQyY2EzNTI3Njk0
YThjNWU2ZTliNTZiZDM3OWMzYjg0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZlODFlOGE4Njk0
ZGM0NzUzYTQ1MDg3YTFjNGM3ZTFiNDhkZWU1YTU5ZjVmNzk2Y2UzNzRlYTU1MGYwYjJlNzMiCiAK
IGluaGVyaXQgYmluX3BhY2thZ2UgYWxsYXJjaAogCi0tIAoyLjM3LjMKCg==

--===============3940490152827019325==--

