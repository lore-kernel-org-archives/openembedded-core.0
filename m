Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4723C3276E
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.6261.1660589820620957461
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LTD140f3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 01010182a2ddc71e-bc1b5b1c-cee7-40dc-8f53-5653d724c8be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gtj1tSGGr0YH1Mpk1aTo5V5GaFbiKi2o7DV5854oK/o=;
	b=LTD140f3Y6QEaexHRWWfqc0l/hgVfvsHjCwXkfunEQ33xfK0LFJY/pW0BVOJuRdX
	DwnQFqOnZRBFHN/UlwzWUAeExUZTzAJ2hFXnzSikrN3wOLlkm/L//iFb6cViREUzbyH
	zKf9NSeEKn+E2ugJvTer1ujZPwaXk+PHgOSixY0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gtj1tSGGr0YH1Mpk1aTo5V5GaFbiKi2o7DV5854oK/o=;
	b=egJdcpaKvLjKM5UKutae9uBAuprppad0L6yxSJCk9uUtwNsDuUy2ajkwoX6bx9O/
	GQi/TLA2We1wQqulS87+q6L+FtxD6p+eRuvBrnRkO34pwU85j2IBwpuzXiURanyPO7H
	maVF/hrav7TNnFtZcLHnEKNiYCIfes2Q5m0m/Vuc=
Content-Type: multipart/mixed; boundary="===============4381368271991067377=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] git: upgrading to 2.37.2 SUCCEEDED
Message-ID: 
 <01010182a2ddc71e-bc1b5b1c-cee7-40dc-8f53-5653d724c8be-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:56:59 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169369

--===============4381368271991067377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *git* to *2.37.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-git-upgrade-2.37.1-2.37.2.patch
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
--===============4381368271991067377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/git/git-bash-completion: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-bash-completion: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-dbg: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-dbg: PKGSIZE changed from 69630736 to 69641712 (+0%)
packages/core2-32-poky-linux/git/git-dbg: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-dev: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-dev: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-doc: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-doc: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-locale: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-locale: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-perltools: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-perltools: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-src: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-src: PKGSIZE changed from 8731618 to 8736766 (+0%)
packages/core2-32-poky-linux/git/git-src: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-staticdev: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-staticdev: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git-tk: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git-tk: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/git: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/git: PKGSIZE changed from 24203658 to 24221194 (+0%)
packages/core2-32-poky-linux/git/git: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git/gitweb: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git/gitweb: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git: PV changed from "2.37.1" to "2.37.2"
packages/core2-32-poky-linux/git: PKGV changed from 2.37.1 [default] to 2.37.2 [default]
packages/core2-32-poky-linux/git: SRC_URI changed from "https://cdn.kernel.org/pub/software/scm/git/git-2.37.1.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch" to "https://cdn.kernel.org/pub/software/scm/git/git-2.37.2.tar.gz;name=tarball file://fixsort.patch file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch"

--===============4381368271991067377==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-git-upgrade-2.37.1-2.37.2.patch"

RnJvbSA5MWE5ZDA1NjNiYWY1YTY2MTJmNjM2NjM1NDI1OWM2NjZjOWQ2MDcyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMDc6NDY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
aXQ6IHVwZ3JhZGUgMi4zNy4xIC0+IDIuMzcuMgoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2l0L3tnaXRfMi4zNy4xLmJiID0+IGdpdF8yLjM3LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dpdC97Z2l0XzIuMzcuMS5iYiA9PiBnaXRfMi4zNy4yLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8yLjM3LjEuYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzcuMi5iYgppbmRleCA1ZDI1MjRhMWRh
Li5iNzg1OGUyZTQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2l0L2dpdF8y
LjM3LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dpdC9naXRfMi4zNy4yLmJiCkBA
IC0xNjUsNCArMTY1LDQgQEAgRVhUUkFfT0VDT05GICs9ICJhY19jdl9zbnByaW50Zl9yZXR1cm5z
X2JvZ3VzPW5vIFwKICAgICAgICAgICAgICAgICAgIgogRVhUUkFfT0VNQUtFICs9ICJOT19HRVRU
RVhUPTEiCiAKLVNSQ19VUklbdGFyYmFsbC5zaGEyNTZzdW1dID0gIjdkZGVkOTZhNTJlNzk5NmNl
OTBkZDc0YTE4N2FlYzE3NTczN2Y2ODBkYzA2M2YzZjMzYzg5MzJjZjVjOGQ4MDkiCitTUkNfVVJJ
W3RhcmJhbGwuc2hhMjU2c3VtXSA9ICI0YzQyODkwOGUzYTJkY2E0MTc0ZGY2ZWY0OWFjYzk5NWE0
ZmRiMWI0NTIwNWEyYzc5Nzk0NDg3YTMzYmMwNmU1IgotLSAKMi4zMS4xCgo=

--===============4381368271991067377==--

