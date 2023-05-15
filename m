Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241A7C87FE2
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.3721.1684186750887102747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=eUpWt3gT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010188215a5d21-802f369f-8758-4af4-a805-2b02339b9537-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wTRtpFi93QrAk7CKrrQV22DjWhHOP07M68oljwoB+CA=;
	b=eUpWt3gTDSbgJiAcGNJM3G1Gla9ghRrvKon7FIvxudtXx6OyrXj0cbUajGQcdNJn
	m5rznjccFk6EFgE1mx4vHGmESrS6XA14R2HqHvBRYZHTOfz9sOwELbmQOHFHKklqIpl
	c3FkqpEw6eB9BIkMr8MH7/rysr4hcyRGNbVQZx9M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186750;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wTRtpFi93QrAk7CKrrQV22DjWhHOP07M68oljwoB+CA=;
	b=P+IlsrFF4xk0soihq88aVckaIYVncChFsC3j2oph2IZRtHJOvASRetdxm3l2NvOj
	mzSv0Deiq9S83DQbm8OL2MoxR8AYK8zJKd+rPCMT6Rrl9mAUDEAR1/HaopdC1EmL2QJ
	ttZmDImNMGE1xs8AH8iHHWJAEjPwFJ2pdmgCN4BM=
Content-Type: multipart/mixed; boundary="===============3757744932439010390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] xdpyinfo: upgrading to 1.3.4 SUCCEEDED
Message-ID: <01010188215a5d21-802f369f-8758-4af4-a805-2b02339b9537-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:10 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181368

--===============3757744932439010390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xdpyinfo* to *1.3.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-xdpyinfo-upgrade-1.3.3-1.3.4.patch
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
--===============3757744932439010390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/xdpyinfo: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo: SRC_URI changed from "https://www.x.org/releases//individual/app/xdpyinfo-1.3.3.tar.xz file://disable-xkb.patch" to "https://www.x.org/releases//individual/app/xdpyinfo-1.3.4.tar.xz file://disable-xkb.patch"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PKGSIZE changed from 59652 to 61192 (+3%)
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dbg: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-dev: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-doc: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-doc: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-locale: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-locale: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PKGSIZE changed from 45438 to 45378 (-0%)
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-src: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-staticdev: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo-staticdev: PV changed from "1.3.3" to "1.3.4"
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo: PKGV changed from 1.3.3 [default] to 1.3.4 [default]
packages/core2-32-poky-linux/xdpyinfo/xdpyinfo: PV changed from "1.3.3" to "1.3.4"

--===============3757744932439010390==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-xdpyinfo-upgrade-1.3.3-1.3.4.patch"

RnJvbSAyNzQ3YjU1ZGFmMjZlOWQ1MDZjMzkyZTQ1MzQ4NTM1MTA0MmU3NzNjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTk6Mjg6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB4
ZHB5aW5mbzogdXBncmFkZSAxLjMuMyAtPiAxLjMuNAoKLS0tCiAuLi4veG9yZy1hcHAve3hkcHlp
bmZvXzEuMy4zLmJiID0+IHhkcHlpbmZvXzEuMy40LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAve3hkcHlpbmZvXzEuMy4zLmJiID0+IHhkcHlpbmZvXzEu
My40LmJifSAoODglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFw
cC94ZHB5aW5mb18xLjMuMy5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5
aW5mb18xLjMuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDg4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MveG9yZy1hcHAveGRweWluZm9fMS4zLjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1ncmFwaGljcy94b3JnLWFwcC94ZHB5aW5mb18xLjMuNC5iYgppbmRleCBlNzVhODQwYjdk
Li5hYWE4YWE4OTAzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy1hcHAv
eGRweWluZm9fMS4zLjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3hvcmctYXBwL3hk
cHlpbmZvXzEuMy40LmJiCkBAIC0xNSw2ICsxNSw2IEBAIFBFID0gIjEiCiBTUkNfVVJJICs9ICJm
aWxlOi8vZGlzYWJsZS14a2IucGF0Y2giCiAKIFNSQ19VUklfRVhUID0gInh6IgotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjM1NmQ1ZmQ2MmYzZTk4ZWUzNmQ2YmVjZjFiMzJkNGFiNjExMmQ2MTgzMzlm
YjRiNTkyY2NmZmJkOWUwZmMyMDYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYThhZGE1ODFkYmQ3
MjY2NDQwZDdjMzc5NGZhODllZGY2Yjk5Yjg4NTdmYzJlOGMzMTA0MjY4NGYzYWY0ODIyYiIKIAog
RVhUUkFfT0VDT05GID0gIi0tZGlzYWJsZS14a2IiCi0tIAoyLjM5LjIKCg==

--===============3757744932439010390==--

