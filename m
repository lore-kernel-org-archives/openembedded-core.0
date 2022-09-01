Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFBEC6FA87
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 13:59:55 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web12.12464.1662040786452331550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 06:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dVWy7DFq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 01010182f959c9f2-7675d3b9-4bbc-4ef7-be6b-29aaa6b0d000-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ke7VUIY9/kg/9+HYBLTBP5VFJgC4lrLyOK13qIq4SMY=;
	b=dVWy7DFqAWnb4NaN3x3h3QXgQJ+LwXHv7+EuebJc7O4kEEQ2nvqILOtWHwrlpktZ
	pNLu9zKcxXUz+YmKuPHyNI6jbz88jbZxZBjERANuuej/3uSh68B2MjoduCzriTii/nK
	MX3hrrwBys+4SjTH2aUyS7d/HKR2G2S1hslGvzeU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1662040787;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ke7VUIY9/kg/9+HYBLTBP5VFJgC4lrLyOK13qIq4SMY=;
	b=Vj5RErfzj7s6uRSD+0B1sDcKjTuMO9a/mcxQSNCDR2Y74CG7T5FYQW1RCHaGA9LB
	RuOfrC2vxL0EmumKI9H7Hf2UFKeqPOtcgEZBMLHyVnYzjIUMscQJP9MM6EZp3LOUz5R
	aOaMcIDNTKOB3ozBeksjbUEesmNnJU40CVhoUdgE=
Content-Type: multipart/mixed; boundary="===============2967735686535529848=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nghttp2: upgrading to 1.49.0 SUCCEEDED
Message-ID: 
 <01010182f959c9f2-7675d3b9-4bbc-4ef7-be6b-29aaa6b0d000-000000@us-west-2.amazonses.com>
Date: Thu, 1 Sep 2022 13:59:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.09.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170208

--===============2967735686535529848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nghttp2* to *1.49.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-nghttp2-upgrade-1.48.0-1.49.0.patch
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
--===============2967735686535529848==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nghttp2-upgrade-1.48.0-1.49.0.patch"

RnJvbSBjMTc4Y2IzMmUwNWE0N2U3N2Y2NWY3ZTgwOTVhMzNiNmZkNTI4MDBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBTZXAgMjAyMiAxMzo1NjozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5n
aHR0cDI6IHVwZ3JhZGUgMS40OC4wIC0+IDEuNDkuMAoKLS0tCiAuLi4vbmdodHRwMi97bmdodHRw
Ml8xLjQ4LjAuYmIgPT4gbmdodHRwMl8xLjQ5LjAuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9uZ2h0dHAyL3tuZ2h0dHAyXzEuNDguMC5iYiA9PiBuZ2h0dHAyXzEuNDku
MC5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9uZ2h0dHAyL25n
aHR0cDJfMS40OC4wLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEu
NDkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS40OC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9uZ2h0dHAyL25naHR0cDJfMS40OS4wLmJiCmluZGV4IDRmZjNhYjgyOWIuLmI3YmNkMGVj
ZTAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L25naHR0cDIvbmdodHRwMl8xLjQ4
LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbmdodHRwMi9uZ2h0dHAyXzEuNDkuMC5i
YgpAQCAtMTAsNyArMTAsNyBAQCBTUkNfVVJJID0gIlwKICAgICBodHRwczovL2dpdGh1Yi5jb20v
bmdodHRwMi9uZ2h0dHAyL3JlbGVhc2VzL2Rvd25sb2FkL3Yke1BWfS9uZ2h0dHAyLSR7UFZ9LnRh
ci54eiBcCiAgICAgZmlsZTovLzAwMDEtZmV0Y2gtb2NzcC1yZXNwb25zZS11c2UtcHl0aG9uMy5w
YXRjaCBcCiAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDdkOGYzMGVlNGYxYmM2MjE1NjZkMTAz
NjJjYTFiM2FjODNhMzM1YzYzZGE3MTQ0OTQ3YzgwNjc3MmQwMTZlNCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJiMGNmZDQ5MmJiZjBiMTMxYzQ3MmU4ZjY1MDFjOWY0ZWU4MmI1MWI2ODEzMGY0N2Iy
NzhjMGI3Yzk4NDhhNjZlIgogCiBpbmhlcml0IGNtYWtlIG1hbnBhZ2VzIHB5dGhvbjNuYXRpdmUK
IFBBQ0tBR0VDT05GSUdbbWFucGFnZXNdID0gIiIKLS0gCjIuMzEuMQoK

--===============2967735686535529848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/nghttp2: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2: SRC_URI changed from "https://github.com/nghttp2/nghttp2/releases/download/v1.48.0/nghttp2-1.48.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch" to "https://github.com/nghttp2/nghttp2/releases/download/v1.49.0/nghttp2-1.49.0.tar.xz file://0001-fetch-ocsp-response-use-python3.patch"
packages/core2-32-poky-linux/nghttp2/libnghttp2: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/libnghttp2: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.22.0", added "/usr/lib/libnghttp2.so.14.23.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-client: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-client: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: PKGSIZE changed from 462772 to 463624 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-dbg: FILELIST: removed "/usr/lib/.debug/libnghttp2.so.14.22.0", added "/usr/lib/.debug/libnghttp2.so.14.23.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-dev: PKGSIZE changed from 206660 to 207176 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-doc: PKGSIZE changed from 179794 to 179861 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-locale: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-locale: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-proxy: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-proxy: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-server: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-server: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2-src: PKGSIZE changed from 1005413 to 1006030 (+0%)
packages/core2-32-poky-linux/nghttp2/nghttp2-staticdev: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2-staticdev: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
packages/core2-32-poky-linux/nghttp2/nghttp2: PV changed from "1.48.0" to "1.49.0"
packages/core2-32-poky-linux/nghttp2/nghttp2: PKGV changed from 1.48.0 [default] to 1.49.0 [default]
Changes to packages/core2-32-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.22.0 to libnghttp2.so.14.23.0
  /usr/lib/libnghttp2.so.14.22.0 moved to /usr/lib/libnghttp2.so.14.23.0

--===============2967735686535529848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/nghttp2/libnghttp2: FILELIST: removed "/usr/lib/libnghttp2.so.14.22.0", added "/usr/lib/libnghttp2.so.14.23.0"
Changes to packages/core2-32-poky-linux/nghttp2 (sysroot):
  /usr/lib/libnghttp2.so.14 changed symlink target from libnghttp2.so.14.22.0 to libnghttp2.so.14.23.0
  /usr/lib/libnghttp2.so.14.22.0 moved to /usr/lib/libnghttp2.so.14.23.0

--===============2967735686535529848==--

