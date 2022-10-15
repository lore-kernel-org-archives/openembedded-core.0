Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10094C6370E
	for <webhook@archiver.kernel.org>; Sat, 15 Oct 2022 22:03:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web12.24541.1665871395295854415
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Oct 2022 15:03:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hZfu6mQW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 01010183ddac373f-df1b946f-686e-472a-bd27-67c0bd921412-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8QH96BSmZg9KOOwIe514RdtyqBlfWdsIOziPOF3/fJo=;
	b=hZfu6mQWRg45Lc2GBYVAbFbZ5snbN9W/uJGdZfYCwVttxvYETbNflEeX1eUDRHju
	SlFl8meYkZnAvwENQqRzLC3HNg0wX8+0tXrlZQTrEMX/S8Iu1hG5YfyKZThkzqS5h7/
	urQczYFjeJLJaSEzY2l1paJmVDzYmzCFzYFPuK7Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1665871394;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8QH96BSmZg9KOOwIe514RdtyqBlfWdsIOziPOF3/fJo=;
	b=G+QQHB71VTa7g0dNG04JgoJG9V2bcdpOs/3f2muqylNH7fCv2wUx4XCeBADKXGgW
	FQjlSOEloWDfgCjC/oCUZxT7Dsi/RtBseAr+HgeIB8UTEBczwMTWaZyCbq2ZyQRtBIq
	9tCcgprXdHJkbiwkD7rOlnCoN7XO05BSzpkO6gPg=
Content-Type: multipart/mixed; boundary="===============6282974476476906643=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.67 SUCCEEDED
Message-ID: <01010183ddac373f-df1b946f-686e-472a-bd27-67c0bd921412-000000@us-west-2.amazonses.com>
Date: Sat, 15 Oct 2022 22:03:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Oct 2022 22:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171810

--===============6282974476476906643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.67* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.66-1.4.67.patch
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
--===============6282974476476906643==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.66-1.4.67.patch"

RnJvbSA1NWM3NWFkMTJmMDIyM2JhMDkxZjFhMjJhMzczZGNiOWE2YzIxNjlhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgT2N0IDIwMjIgMTI6MzI6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNjYgLT4gMS40LjY3CgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjY2LmJiID0+IGxpZ2h0dHBkXzEuNC42Ny5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjY2LmJiID0+IGxpZ2h0dHBk
XzEuNC42Ny5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY2LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC42Ny5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY2LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY3LmJiCmluZGV4IDgw
MTE2Mjg2N2MuLjgzODg4MWYyMzggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC42Ny5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0N2FjNmU2MDI3MWFhMDE5NmU2NTQ3MmQwMmQwMTk1NTZk
YzdjNmQwOWRmM2I2NWRmMmMxYWI2ODY2MzQ4ZTNiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdl
MDRkNzY3ZjUxYThkODI0YjMyZTI0ODNlZjI5NTA5ODI5MjBkNDI3ZDEyNzJlZjQ2NjdmNDlkNmY4
OWYzNTgiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi4zMS4xCgo=

--===============6282974476476906643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.66.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.67.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2543440 to 2545032 (+0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2933298 to 2934912 (+0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.66 [default] to 1.4.67 [default]

--===============6282974476476906643==--

