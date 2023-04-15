Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16924C7EE22
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.13539.1681581687596893355
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Vc95Zp1i;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101878614403c-cd29b81d-a7bd-4d82-a87c-8f1416a412ae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Hh6XcSSe0K8e7Lwhvct16uM/TfpgawIJ/ZjSpQ5ufuU=;
	b=Vc95Zp1iKi3/lgH9HLiXrr1nc3Ge8w9L7HBDIhkAvbobuXi35zLXyPFwmGk7KXqM
	rHm0aCHA+PF2iuiRs3SOQ98LkFj7Twq0DpmYe9hORaRffI8rLlnocxrApipoyLGeV0S
	EbOLeUhylauZexrlYf1xb96wAD8n/FfW1EGJcBCI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581686;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Hh6XcSSe0K8e7Lwhvct16uM/TfpgawIJ/ZjSpQ5ufuU=;
	b=qCZm5HxlOzuy5HtKT2gepAJCWZrjsqvIWW5lJ7r5tzPMObUnjS51WJX5oJYQZ7ut
	dIeIkULQk49gHPpBMWS6dqAakcfhVpXqEJuF4ACD2WiIpcoZ7jPcn1iV0x5WCQ3xqYn
	jrvKaOCXdkeXz3crOjPTqsmxD8u6jh6D6K2RnaNs=
Content-Type: multipart/mixed; boundary="===============1348733978004067180=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.22.2 SUCCEEDED
Message-ID: <010101878614403c-cd29b81d-a7bd-4d82-a87c-8f1416a412ae-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180101

--===============1348733978004067180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.22.0-1.22.2.patch
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
--===============1348733978004067180==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.22.0-1.22.2.patch"

RnJvbSBkODU2NjU3YmFmNWE4ODQzNTUyNWMzNTc1MmZjODgzNDUyOTdkYjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTY6NDE6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXI6IHVwZ3JhZGUgMS4yMi4wIC0+IDEuMjIuMgoKLS0tCiAu
Li5ydHNwLXNlcnZlcl8xLjIyLjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjIu
Mi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjIyLjAuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjIu
Mi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjIuMC5iYiBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4yLmJiCnNpbWls
YXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4wLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjIu
Mi5iYgppbmRleCBmOTQzYzgyOWM0Li4wMmMyYmFkYzJhIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjIuMC5i
YgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0
c3Atc2VydmVyXzEuMjIuMi5iYgpAQCAtMTAsNyArMTAsNyBAQCBQTlJFQUwgPSAiZ3N0LXJ0c3At
c2VydmVyIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9z
cmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BWfS50YXIueHoiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICJhZWEyNGVlYjU5ZWU1ZmFkZmFjMzU1ZGUyZjdjZWNiNTE5NjZjM2UxNDdlNWFkN2NmYjRj
MzE0ZjFhNDA4NmVkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJiZTRhZWNmYjg4NzEwMTAwZWE3
MTE1ZWQwMjE2NDAzZTgwOTQzNDRlYmYxNDYwOTQyNzFiOGQ0ZDczODI4YmYiCiAKIFMgPSAiJHtX
T1JLRElSfS8ke1BOUkVBTH0tJHtQVn0iCiAKLS0gCjIuMzkuMgoK

--===============1348733978004067180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1150088 to 1150180 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGSIZE changed from 1173100 to 1173126 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.2.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2202.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2200.0 to libgstrtspserver-1.0.so.0.2202.0
  /usr/lib/libgstrtspserver-1.0.so.0.2200.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2202.0

--===============1348733978004067180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2202.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2200.0 to libgstrtspserver-1.0.so.0.2202.0
  /usr/lib/libgstrtspserver-1.0.so.0.2200.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2202.0

--===============1348733978004067180==--

