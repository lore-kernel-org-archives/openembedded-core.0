Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E30EC77B60
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.12296.1678895725912462232
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=G8SCTR2W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010186e5fbc688-a8629238-13f0-4bd8-920b-6c94796ad8f8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8S5z8aJUswictWtgNlw5El/TDp+bsMUCKHkJMy4f5wY=;
	b=G8SCTR2W8+nSJT6fFmjTUpCLNcVhGpvikg+rF5oJl0ma78y3gNLkCdLpW97SNi6L
	XUT2RzZ+PbYOwYTnv0OSvB4aO3/5PK96igbuNxLpzikNjaQRNM/Qs2/qXSIlV1Rb07a
	fuGVaySo/eHxbmrTWvuDlBVUorLb81LaOy6SsxtQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895728;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8S5z8aJUswictWtgNlw5El/TDp+bsMUCKHkJMy4f5wY=;
	b=bdE2rtx9P5GBBcYYbW7O4HJnrkkg67k+eq90uLT55EoaWD7TTvpg0qpPheBrTpot
	1Xwf0W/ACKqYyYE8QvdW8sC+8xWb2DzqO/Bs41+Aht0cbdDFYSZQ94phUlL/6A/I/JZ
	94p+KQS8VBL2Olfc0FmPDZCucrvSmev1Oo6JLc4A=
Content-Type: multipart/mixed; boundary="===============2219752574204555581=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wpebackend-fdo: upgrading to 1.14.1 SUCCEEDED
Message-ID: <01010186e5fbc688-a8629238-13f0-4bd8-920b-6c94796ad8f8-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:28 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178638

--===============2219752574204555581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wpebackend-fdo* to *1.14.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.14.0-1.14.1.patch
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
--===============2219752574204555581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.9.2 to libWPEBackend-fdo-1.0.so.1.9.3
  /usr/lib/libWPEBackend-fdo-1.0.so.1.9.2 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.9.3
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.2", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.3"

--===============2219752574204555581==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.14.0-1.14.1.patch"

RnJvbSBmYjg5YjYxZmIwYzgxODI2M2FmZGEyMDRkZGQ4NWQ5MWYxODkwYjMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTQ6NTA6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
cGViYWNrZW5kLWZkbzogdXBncmFkZSAxLjE0LjAgLT4gMS4xNC4xCgotLS0KIC4uLi97d3BlYmFj
a2VuZC1mZG9fMS4xNC4wLmJiID0+IHdwZWJhY2tlbmQtZmRvXzEuMTQuMS5iYn0gICAgICB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC97d3BlYmFja2VuZC1mZG9fMS4xNC4wLmJiID0+IHdw
ZWJhY2tlbmQtZmRvXzEuMTQuMS5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNC4wLmJiIGIvbWV0YS9yZWNpcGVzLXNhdG8v
d2Via2l0L3dwZWJhY2tlbmQtZmRvXzEuMTQuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNC4wLmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNC4x
LmJiCmluZGV4IDcwODIwMTA0M2IuLjlmMmVhMGI3ZGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1zYXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjE0LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVz
LXNhdG8vd2Via2l0L3dwZWJhY2tlbmQtZmRvXzEuMTQuMS5iYgpAQCAtMTMsNyArMTMsNyBAQCBp
bmhlcml0IG1lc29uIGZlYXR1cmVzX2NoZWNrIHBrZ2NvbmZpZwogUkVRVUlSRURfRElTVFJPX0ZF
QVRVUkVTID0gIm9wZW5nbCIKIAogU1JDX1VSSSA9ICJodHRwczovL3dwZXdlYmtpdC5vcmcvcmVs
ZWFzZXMvJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlNzViMGNi
MmM3MTQ1NDQ4NDE2ZTg2OTYwMTNkODg4M2Y2NzVjNjZjMTFlZDc1MGUwNjg2NWVmZWM1ODA5MTU1
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAxOTM4ZGQ5M2M2MmIzYTQ3YjE4ZGQxM2M3MGQ1MDQ5
MGE4YjhhNmNhZWMyM2M4NTUwYTNkYmRiY2M2YmJiNTAiCiAKICMgRXNwZWNpYWxseSBoZWxwcyBj
b21waWxpbmcgd2l0aCBjbGFuZyB3aGljaCBlbmFibGUgdGhpcyBhcyBlcnJvciB3aGVuCiAjIHVz
aW5nIGMrKzExCi0tIAoyLjM5LjIKCg==

--===============2219752574204555581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wpebackend-fdo: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo: SRC_URI changed from "https://wpewebkit.org/releases/wpebackend-fdo-1.14.0.tar.xz" to "https://wpewebkit.org/releases/wpebackend-fdo-1.14.1.tar.xz"
Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.9.2 to libWPEBackend-fdo-1.0.so.1.9.3
  /usr/lib/libWPEBackend-fdo-1.0.so.1.9.2 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.9.3
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGSIZE changed from 1471744 to 1472248 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: FILELIST: removed "/usr/lib/.debug/libWPEBackend-fdo-1.0.so.1.9.2", added "/usr/lib/.debug/libWPEBackend-fdo-1.0.so.1.9.3"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGSIZE changed from 336403 to 336547 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PV changed from "1.14.0" to "1.14.1"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGV changed from 1.14.0 [default] to 1.14.1 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.2", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.3"

--===============2219752574204555581==--

