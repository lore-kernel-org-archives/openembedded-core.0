Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7287C6FD37
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 14:18:43 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.10760.1663251512805785796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 07:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=AoPqsh6v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 010101834183f9f9-175c68bb-f64f-410b-89c1-f77f44b23f35-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=B6R0JePmQ2dAA3P+hpZNY2EZLxVcMKTjRdowlsynjt8=;
	b=AoPqsh6vo3losa2Lh9b1W75XcmNmvVWlok/8eoiDjEi6BVcplGR9rT/5YGnrWdvi
	MCLyIA+RCQ90QQrBc4wrQSzQvymCum7VQejtVkvZHt0bre2nRSGAkMpE7IiclFz7GOc
	GhtTz1TaU0kw/snU6CurUeO/MiBYmIFsevPVCKMc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1663251512;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=B6R0JePmQ2dAA3P+hpZNY2EZLxVcMKTjRdowlsynjt8=;
	b=WaxVApLGIyjin/Man0qf+7ocCIjlbTLStg9THTS9BIh7kuQ8Zh0HVOyDs/0LLxrA
	yJVSUk1CX6N+QHwuimBty/0Jvm3ddyhwklfHRDA1LFJxLknt7mti9lUqZg640OMiICn
	fdrOjoltBHqxlxEZskIewIGRvPpe+ZupWDdpqSmI=
Content-Type: multipart/mixed; boundary="===============6202056348295568169=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.37.3 SUCCEEDED
Message-ID: 
 <010101834183f9f9-175c68bb-f64f-410b-89c1-f77f44b23f35-000000@us-west-2.amazonses.com>
Date: Thu, 15 Sep 2022 14:18:31 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 14:18:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170710

--===============6202056348295568169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.37.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.37.2-2.37.3.patch
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
--===============6202056348295568169==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 69653568 to 69676644 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-src: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8736766 to 8740756 (+0%)
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/git: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/git: PKGSIZE changed from 24221194 to 24229612 (+0%)
packages/core2-32-poky-linux/git/git: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.37.2" to "2.37.3"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.37.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.37.3.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"
packages/core2-32-poky-linux/git: PKGV changed from 2.37.2 [default] to 2.37.3 [default]
packages/core2-32-poky-linux/git: PV changed from "2.37.2" to "2.37.3"

--===============6202056348295568169==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.37.2-2.37.3.patch"

RnJvbSBjOTliNDg0YzNjYTM4MjE1MDViMWJjNTk0MjczMTQxYWM2YmJjM2YyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgU2VwIDIwMjIgMDg6MjE6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi4zNy4yIC0+IDIuMzcuMwoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi4zNy4yLmJiID0+IGdpdF8yLjM3LjMuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuMzcuMi5iYiA9PiBnaXRfMi4zNy4zLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM3LjIuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMy5iYgppbmRleCBiNzg1OGUyZTQ2
Li4yZWVkODVlODA3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjM3LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zNy4zLmJiCkBA
IC0xNjUsNCArMTY1LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjRjNDI4OTA4ZTNhMmRjYTQx
NzRkZjZlZjQ5YWNjOTk1YTRmZGIxYjQ1MjA1YTJjNzk3OTQ0ODdhMzNiYzA2ZTUiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICIxODFmNjU1ODcxNTVlYTQ4YzY4MmY2MzEzNTY3OGVjNTMw
NTVhZGYxNTMyNDI4NzUyOTEyZDM1NmU0NmI2NGE4IgotLSAKMi4zMS4xCgo=

--===============6202056348295568169==--

