Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9944C6FA8B
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:32 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com
 (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10759.1663251512236926679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lJ9s43MX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23,
 mailfrom: 010101834183f81f-01141f99-d18c-4db7-91b4-a1bce2916ba7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FuK1w03Dn5PGdsyyTFZ9GTioGKT46P/R7yRbS5/befo=;
	b=lJ9s43MX74TvJEz9vkGWfqyDyYvXn4SxYoL+gxvTYbHJur4qwPFNCKKAL3AX1UVS
	+vNb4wjNyTbfiiIdMtncwCGmMgdPaVj8Sskxq2ukmYUL3Csl0DuWn74YU0VF4BHDYdi
	KHoSZ/MzhEyUM5+CZng03am5wzlpyt9X2Op2BvOc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251511;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FuK1w03Dn5PGdsyyTFZ9GTioGKT46P/R7yRbS5/befo=;
	b=cg7kPGjVBAaNnC6rnGhiqvyZnkC6mJYt6cdEd0PeI7d86vnF6GWYz6ifoUIv0xtg
	FQBJw6bUGgNiQ3mz73swGRa8jhtg0QXs8KMoLMAUBScNFW5KKDZ7iJxxkoqzyS0Z7ZK
	zPohE4fCEp9tl3vIrZ7MsmY/cSR16dCjLzlo3dxM=
Content-Type: multipart/mixed; boundary="===============7744232215269814694=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf-archive: upgrading to 2022.09.03 SUCCEEDED
Message-ID: 
 <010101834183f81f-01141f99-d18c-4db7-91b4-a1bce2916ba7-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170700

--===============7744232215269814694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *autoconf-archive* to *2022.09.03* has Succeeded.

Next steps:
    - apply the patch: git am 0001-autoconf-archive-upgrade-2022.02.11-2022.09.03.patch
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
--===============7744232215269814694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/all-poky-linux/autoconf-archive/autoconf-archive: FILELIST: added "/usr/share/aclocal/ax_boost_json.m4"
Changes to packages/all-poky-linux/autoconf-archive (sysroot):
  /usr/share/aclocal/ax_boost_json.m4 was added
Changes to packages/x86_64-linux/autoconf-archive-native (sysroot):
  /usr/share/aclocal/ax_boost_json.m4 was added

--===============7744232215269814694==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PV changed from "2022.02.11" to "2022.09.03"
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGSIZE changed from 46695 to 46804 (+0%)
packages/all-poky-linux/autoconf-archive/autoconf-archive-doc: PKGV changed from 2022.02.11 [default] to 2022.09.03 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PV changed from "2022.02.11" to "2022.09.03"
packages/all-poky-linux/autoconf-archive/autoconf-archive-src: PKGV changed from 2022.02.11 [default] to 2022.09.03 [default]
packages/all-poky-linux/autoconf-archive/autoconf-archive: FILELIST: added "/usr/share/aclocal/ax_boost_json.m4"
packages/all-poky-linux/autoconf-archive/autoconf-archive: PV changed from "2022.02.11" to "2022.09.03"
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGSIZE changed from 2117825 to 2126266 (+0%)
packages/all-poky-linux/autoconf-archive/autoconf-archive: PKGV changed from 2022.02.11 [default] to 2022.09.03 [default]
packages/all-poky-linux/autoconf-archive: PV changed from "2022.02.11" to "2022.09.03"
packages/all-poky-linux/autoconf-archive: SRC_URI changed from "https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2022.02.11.tar.xz" to "https://ftp.gnu.org/gnu/autoconf-archive/autoconf-archive-2022.09.03.tar.xz"
packages/all-poky-linux/autoconf-archive: PKGV changed from 2022.02.11 [default] to 2022.09.03 [default]
Changes to packages/all-poky-linux/autoconf-archive (sysroot):
  /usr/share/aclocal/ax_boost_json.m4 was added
Changes to packages/x86_64-linux/autoconf-archive-native (sysroot):
  /usr/share/aclocal/ax_boost_json.m4 was added

--===============7744232215269814694==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-autoconf-archive-upgrade-2022.02.11-2022.09.03.patch"

RnJvbSA1NGNmMWU3ODQ4NjI1NDE4YTYzMGJjYTE2YTFlN2UxMzNiNDJlZDBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDc6MDE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
dXRvY29uZi1hcmNoaXZlOiB1cGdyYWRlIDIwMjIuMDIuMTEgLT4gMjAyMi4wOS4wMwoKLS0tCiAu
Li5vbmYtYXJjaGl2ZV8yMDIyLjAyLjExLmJiID0+IGF1dG9jb25mLWFyY2hpdmVfMjAyMi4wOS4w
My5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS97YXV0b2Nv
bmYtYXJjaGl2ZV8yMDIyLjAyLjExLmJiID0+IGF1dG9jb25mLWFyY2hpdmVfMjAyMi4wOS4wMy5i
Yn0gKDg1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJj
aGl2ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjIuMDIuMTEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjIuMDkuMDMuYmIKc2ltaWxh
cml0eSBpbmRleCA4NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2F1dG9jb25m
LWFyY2hpdmUvYXV0b2NvbmYtYXJjaGl2ZV8yMDIyLjAyLjExLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYXV0b2NvbmYtYXJjaGl2ZS9hdXRvY29uZi1hcmNoaXZlXzIwMjIuMDku
MDMuYmIKaW5kZXggNDdiZjIzODBmMC4uNjU5NWFjOThiYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2F1dG9jb25mLWFyY2hpdmUvYXV0b2NvbmYtYXJjaGl2ZV8yMDIyLjAyLjEx
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hdXRvY29uZi1hcmNoaXZlL2F1dG9jb25m
LWFyY2hpdmVfMjAyMi4wOS4wMy5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9MTFjYzJkM2VlNTc0ZjlkNmI3ZWU3OTdiZGNlNGQ0MjMgXAog
ICAgIGZpbGU6Ly9DT1BZSU5HLkVYQ0VQVElPTjttZDU9ZmRlZjE2OGViZmYzYmMyZjEzNjY0YzM2
NWE1ZmI1MTUiCiAKIFNSQ19VUkkgPSAiJHtHTlVfTUlSUk9SfS8ke0JQTn0vJHtCUE59LSR7UFZ9
LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3OGE2MWI2MTFlMmVlYjU1YTg5ZTAzOThl
MGNlMzg3YmNhZjU3ZmUyZGQ1M2M2ZmU0MjcxMzBmNzc3YWQxZThjIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImUwNzQ1NGYwMGQ4Y2FlNzkwN2JlZDQyZDA3NDc3OTg5Mjc4MDk5NDc2ODRkOTRjMzcy
MDdhNGQ2M2EzMmY0MjMiCiAKIGluaGVyaXQgYXV0b3Rvb2xzIGFsbGFyY2ggdGV4aW5mbwogCi0t
IAoyLjMxLjEKCg==

--===============7744232215269814694==--

