Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F72EC64E7B
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:05:46 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.5324.1668517537088408424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:05:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BArvH+Xq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101847b652277-a4062e0c-efe4-48bf-8b53-33373feb6ba5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WvGsY0/DFDRw0VYied3FYIwyJOX05L5Ib6RElGX2Kjo=;
	b=BArvH+XqOw1pCenlr6hlnEqVWz379TPtqKCjK3TJbLRXDeynXb0nXsRv306/DN49
	4isVZkizQbXZCO2XBQBmyEOSsVUBH/J3xrYkfKpZ4/Yi51Ng+JfNuBeIizw1XqkmLQF
	OGewBQK6gKxLvxekdUslS/zyugM/br9sZJ3R+Tro=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1668517536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WvGsY0/DFDRw0VYied3FYIwyJOX05L5Ib6RElGX2Kjo=;
	b=IyGWPgockTLUGt9QuIvirQ6Qxf7BifNH4eo7bgUaj7PRY5wkqY5ufCbx+ziE6aJ4
	5W/F0jxr9hzi7fjfA4wFEjbanYoHpYe5jGCafnN15oJx47U7KhB59d/5Q/P85IddkOk
	2oTCk0KWTVj55BBVOVsvwfjyKkitMHSVyJt9MuXM=
Content-Type: multipart/mixed; boundary="===============3206813366678641640=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wayland-protocols: upgrading to 1.29 SUCCEEDED
Message-ID: <010101847b652277-a4062e0c-efe4-48bf-8b53-33373feb6ba5-000000@us-west-2.amazonses.com>
Date: Tue, 15 Nov 2022 13:05:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:05:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173326

--===============3206813366678641640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wayland-protocols* to *1.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wayland-protocols-upgrade-1.27-1.29.patch
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
--===============3206813366678641640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/xwayland-shell was added
  /usr/share/wayland-protocols/staging/xwayland-shell/xwayland-shell-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xwayland-shell/xwayland-shell-v1.xml"

--===============3206813366678641640==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wayland-protocols-upgrade-1.27-1.29.patch"

RnJvbSAyMWU0MTU4ODhiNmUzMmQ1NmQwYTAwMmU5MmI1OGUxN2UxNGNhYmI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgTm92IDIwMjIgMTA6NTQ6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB3
YXlsYW5kLXByb3RvY29sczogdXBncmFkZSAxLjI3IC0+IDEuMjkKCi0tLQogLi4uL3t3YXlsYW5k
LXByb3RvY29sc18xLjI3LmJiID0+IHdheWxhbmQtcHJvdG9jb2xzXzEuMjkuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQve3dheWxhbmQtcHJvdG9jb2xzXzEuMjcuYmIg
PT4gd2F5bGFuZC1wcm90b2NvbHNfMS4yOS5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjI3LmJiIGIvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5bGFuZC1wcm90b2NvbHNfMS4yOS5iYgpzaW1pbGFy
aXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mvd2F5bGFuZC93
YXlsYW5kLXByb3RvY29sc18xLjI3LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3Mv
d2F5bGFuZC93YXlsYW5kLXByb3RvY29sc18xLjI5LmJiCmluZGV4IDUyMjNhMTNmMWEuLmMxZmRi
YmI4YjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy93YXlsYW5kL3dheWxhbmQt
cHJvdG9jb2xzXzEuMjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3dheWxhbmQvd2F5
bGFuZC1wcm90b2NvbHNfMS4yOS5iYgpAQCAtMTAsNyArMTAsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jN2IxMmI2NzAyZGEzOGNhMDI4YWNlNTRhYWUzZDQ4NCBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9zdGFibGUvcHJlc2VudGF0aW9uLXRpbWUvcHJl
c2VudGF0aW9uLXRpbWUueG1sO2VuZGxpbmU9MjY7bWQ1PTQ2NDZjZDdkOWVkYzlmYTU1ZGI5NDFm
MmQzYTdkYzUzIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy93
YXlsYW5kL3dheWxhbmQtcHJvdG9jb2xzLy0vcmVsZWFzZXMvJHtQVn0vZG93bmxvYWRzL3dheWxh
bmQtcHJvdG9jb2xzLSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI5MDQ2ZjEw
YTQyNWQ0ZTJhMDA5NjVhMDNhY2ZiNmIzZmI1NzVhNTY1MDNhYzcyYzJiODY4MjFjNjk2NTMzNzVj
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImUyNWU5YWI3NWFjNzM2NzA0ZGRlZmU5MmU4ZjlhYzg3
MzBiZWFiNmY1NjRkYjYyZjdhZDY5NWJiYTRmZjllZDgiCiAKIFVQU1RSRUFNX0NIRUNLX1VSSSA9
ICJodHRwczovL3dheWxhbmQuZnJlZWRlc2t0b3Aub3JnL3JlbGVhc2VzLmh0bWwiCiAKLS0gCjIu
MzEuMQoK

--===============3206813366678641640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/wayland-protocols: PV changed from "1.27" to "1.29"
packages/all-poky-linux/wayland-protocols: PKGV changed from 1.27 [default] to 1.29 [default]
packages/all-poky-linux/wayland-protocols: SRC_URI changed from "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.27/downloads/wayland-protocols-1.27.tar.xz" to "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/1.29/downloads/wayland-protocols-1.29.tar.xz"
Changes to packages/all-poky-linux/wayland-protocols (sysroot):
  /usr/share/wayland-protocols/staging/xwayland-shell was added
  /usr/share/wayland-protocols/staging/xwayland-shell/xwayland-shell-v1.xml was added
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PV changed from "1.27" to "1.29"
packages/all-poky-linux/wayland-protocols/wayland-protocols-src: PKGV changed from 1.27 [default] to 1.29 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: PV changed from "1.27" to "1.29"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGV changed from 1.27 [default] to 1.29 [default]
packages/all-poky-linux/wayland-protocols/wayland-protocols: FILELIST: added "/usr/share/wayland-protocols/staging/xwayland-shell/xwayland-shell-v1.xml"
packages/all-poky-linux/wayland-protocols/wayland-protocols: PKGSIZE changed from 488910 to 497479 (+2%)

--===============3206813366678641640==--

