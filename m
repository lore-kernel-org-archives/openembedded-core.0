Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F4BC433FE
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:54:13 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.426.1664643230076367317
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=huQTUzxq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101839477e75b-dd36990c-0ef0-42d3-b087-810f011e2e3a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NcFq64hfBRjnM/yQsXQc5zZcNoBiy8CV8vZizoOzYFs=;
	b=huQTUzxqIOqBhkhRLwbU8SwDB3hWTMwbptjP6PzvCqigGHWjjnobA2CV5hM6Lz21
	i8pa4S3dvQHF6JtryOVeH7qgqRs1efOXLix7WnbtpJ9dcZBPp+E5YH7KouyN6iafW3D
	E+7OdKGW0zdE+zZTqyeNvPaD8alJ2rz4oFe5+NhE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643229;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NcFq64hfBRjnM/yQsXQc5zZcNoBiy8CV8vZizoOzYFs=;
	b=hgAnjag4IMk1YQ5jSY+N1J963yjQuaHS63ZwRtJJmc/Y5iwYgBCcFG91yII33gwG
	FnwdyDoXxq5ccgpc/KSl533kPDLX1iZc2nUBhBNquH+O0XCvf4cX49vcbi6oYO+VlfE
	dcwT9w8/gywyu7xF39eaR+YMtaaWS/0+iV1qu6l4=
Content-Type: multipart/mixed; boundary="===============3969050617889542070=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sqlite3: upgrading to 3.39.4 SUCCEEDED
Message-ID: 
 <010101839477e75b-dd36990c-0ef0-42d3-b087-810f011e2e3a-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:54:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171346

--===============3969050617889542070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sqlite3* to *3.39.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sqlite3-upgrade-3.39.3-3.39.4.patch
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
--===============3969050617889542070==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sqlite3-upgrade-3.39.3-3.39.4.patch"

RnJvbSBjYjMyYzI4N2ZiZWY1Njc4ODQ3MjY0MGZiM2FhYzYzZWJlOWJiZmVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxNjo1MDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHNx
bGl0ZTM6IHVwZ3JhZGUgMy4zOS4zIC0+IDMuMzkuNAoKLS0tCiAuLi4vc3FsaXRlL3tzcWxpdGUz
XzMuMzkuMy5iYiA9PiBzcWxpdGUzXzMuMzkuNC5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9zcWxpdGUve3NxbGl0ZTNfMy4zOS4zLmJiID0+IHNxbGl0ZTNfMy4zOS40
LmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxp
dGUzXzMuMzkuMy5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuMzku
NC5iYgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9zcWxpdGUvc3FsaXRlM18zLjM5LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3NxbGl0ZS9zcWxpdGUzXzMuMzkuNC5iYgppbmRleCBmY2U0OTdlMGUxLi5mZWZhYjE2ZTY0IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvc3FsaXRlM18zLjM5LjMuYmIK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4zOS40LmJiCkBAIC00
LDcgKzQsNyBAQCBMSUNFTlNFID0gIlBEIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vc3Fs
aXRlMy5oO2VuZGxpbmU9MTE7bWQ1PTc4NmQzZGM1ODFlZmYwM2Y0ZmQ5ZTRhNzdlZDAwYzY2Igog
CiBTUkNfVVJJID0gImh0dHA6Ly93d3cuc3FsaXRlLm9yZy8yMDIyL3NxbGl0ZS1hdXRvY29uZi0k
e1NRTElURV9QVn0udGFyLmd6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjc4NjhmYjMwODJiZTNm
MmNmNDQ5MWM2ZmJhNmRlMmJkZGNiYzI5M2EzNWZlZmIwNjI0ZWUzYzEzZjAxNDIyYjkiCitTUkNf
VVJJW3NoYTI1NnN1bV0gPSAiZjMxZDQ0NWI0OGU2N2UyODRjZjIwNjcxN2NjMTcwYWI2M2NiZTRm
ZDdmNzlhODI3OTNiNzcyMjg1ZTc4ZmRiYiIKIAogIyAtMTkyNDIgaXMgb25seSBhbiBpc3N1ZSBp
biBzcGVjaWZpYyBkZXZlbG9wbWVudCBicmFuY2ggY29tbWl0cwogQ1ZFX0NIRUNLX0lHTk9SRSAr
PSAiQ1ZFLTIwMTktMTkyNDIiCi0tIAoyLjMxLjEKCg==

--===============3969050617889542070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sqlite3: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3: SRC_URI changed from "http://www.sqlite.org/2022/sqlite-autoconf-3390300.tar.gz" to "http://www.sqlite.org/2022/sqlite-autoconf-3390400.tar.gz"
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-dev: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-doc: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3-staticdev: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/libsqlite3: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/libsqlite3: PKGSIZE changed from 1463483 to 1467579 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/sqlite3-dbg: PKGSIZE changed from 4815156 to 4815720 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PV changed from "3.39.3" to "3.39.4"
packages/core2-32-poky-linux/sqlite3/sqlite3-src: PKGSIZE changed from 9896548 to 9897644 (+0%)
packages/core2-32-poky-linux/sqlite3/sqlite3: PKGV changed from 3.39.3 [default] to 3.39.4 [default]
packages/core2-32-poky-linux/sqlite3/sqlite3: PV changed from "3.39.3" to "3.39.4"

--===============3969050617889542070==--

