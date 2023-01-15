Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431E4C678DF
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 18:02:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145728.1673805744924004054
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jan 2023 10:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=M9DaRhPQ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185b698c930-7257818f-2cbb-453a-9ad8-a32dd8c581fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WXddWFllkHuzGEGIKmgzD0+Uy7CuZXw7XH1ymSipJ+w=;
	b=M9DaRhPQuw9zxI2ug8eG/AByzthk/55uD7cdbFPyN5t40rMoS4NPLKs+03fGCvj4
	q/uJrBvlujPcT+BveltK7dSr7mlLILD92mBXSkw5GDssGC3EpGIcd4rEXXcJhcA465T
	CkySqFR5XD/GC0giqlF6V+dpacyK2zF0Vm0mNMQM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1673805744;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WXddWFllkHuzGEGIKmgzD0+Uy7CuZXw7XH1ymSipJ+w=;
	b=LMZXqbYkCu/2JHMMHRMwM17E8rYRl/8i6fg1SBsT4DsjWPVLLzF0Oca0wulIfkdF
	BgUAecVxW+IDnq+T5Lt2AzhkvC0dnJo+75K73zTCtAsvCFfqNbFF7uvdxmonbH5sxhV
	MMgallroITRKdPIPq5BwBBQ4USE+W3hIQu3ZKW7c=
Content-Type: multipart/mixed; boundary="===============1519809894408133416=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mpg123: upgrading to 1.31.2 SUCCEEDED
Message-ID: <01010185b698c930-7257818f-2cbb-453a-9ad8-a32dd8c581fd-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jan 2023 18:02:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.01.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175936

--===============1519809894408133416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mpg123* to *1.31.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-mpg123-upgrade-1.31.1-1.31.2.patch
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
--===============1519809894408133416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/mpg123: SRC_URI changed from "https://www.mpg123.de/download/mpg123-1.31.1.tar.bz2" to "https://www.mpg123.de/download/mpg123-1.31.2.tar.bz2"
packages/core2-32-poky-linux/mpg123: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-dbg: PKGSIZE changed from 2009368 to 2009372 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-dev: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-dev: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-doc: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-doc: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-locale: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-locale: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-src: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123-src: PKGSIZE changed from 1857457 to 1857527 (+0%)
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123-staticdev: PV changed from "1.31.1" to "1.31.2"
packages/core2-32-poky-linux/mpg123/mpg123: PKGV changed from 1.31.1 [default] to 1.31.2 [default]
packages/core2-32-poky-linux/mpg123/mpg123: PV changed from "1.31.1" to "1.31.2"

--===============1519809894408133416==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-mpg123-upgrade-1.31.1-1.31.2.patch"

RnJvbSA4YzdlNjNlMGE2N2ZmZTg3YjZiOTZiNGU2ODRjNmE4NWY0MWI0YzhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSmFuIDIwMjMgMTY6NDA6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
cGcxMjM6IHVwZ3JhZGUgMS4zMS4xIC0+IDEuMzEuMgoKLS0tCiAuLi4vbXBnMTIzL3ttcGcxMjNf
MS4zMS4xLmJiID0+IG1wZzEyM18xLjMxLjIuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9tcGcxMjMve21wZzEyM18xLjMxLjEuYmIgPT4gbXBnMTIzXzEuMzEu
Mi5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMv
bXBnMTIzXzEuMzEuMS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL21wZzEyMy9tcGcxMjNf
MS4zMS4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL21wZzEyMy9tcGcxMjNfMS4zMS4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
bXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEuMzEuMi5iYgppbmRleCBhOGEyMzc3YmQ0Li4wYTJk
ODcwY2ZhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIz
XzEuMzEuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9tcGcxMjMvbXBnMTIzXzEu
MzEuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNFTlNFID0gIkxHUEwtMi4xLW9ubHkiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1lN2I5YzE1ZmNmYjk4NmFiYjRjYzVl
ODQwMGEyNDE2OSIKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5tcGcxMjMuZGUvZG93bmxvYWQv
JHtCUH0udGFyLmJ6MiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI1ZGNiMDkzNmVmZDQ0Y2I1ODM0
OThiNjU4NTg0NTIwNmYwMDJhN2IxOWQ1MDY2YTI2ODNiZTM2MTk1NGQ5NTVhIgorU1JDX1VSSVtz
aGEyNTZzdW1dID0gImIxN2YyMjkwNWUzMWY0M2I2YjQwMWRmZGY2YTcxZWQxMWJiN2QwNTZmNjhk
YjQ0OWQ3MGI5ZjlhZTgzOWM3ZGUiCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIm1wZzEyMy0o
P1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotLSAKMi4zNy4zCgo=

--===============1519809894408133416==--

