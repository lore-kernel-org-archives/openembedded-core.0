Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25281C47087
	for <webhook@archiver.kernel.org>; Sat,  1 Oct 2022 16:53:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.483.1664643228267071605
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Oct 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=bbruDXPY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101839477df29-9fba0db5-b586-487e-9c12-edbc968cb801-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+a3SdzhdEjhqmjFN79VquhZui91q3FClv0GdeZWK9cE=;
	b=bbruDXPYDWGHSYE0kWPjw80fCKu5jPb4d8XRtZ5IhpD5i2kvpxVVLMblQA1mUBOO
	0FitA56HbHEjz7VMsZoeCyfnAJhJdoKAVXioKL6Bv1N+bhnKbar1ipvYT904LTy6jD4
	uSzpeS5P8M0CLmRYipYUJbdHOjKYeQKdTQBaxcc4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1664643227;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+a3SdzhdEjhqmjFN79VquhZui91q3FClv0GdeZWK9cE=;
	b=PoCOdB58kUYeULj8zNTQ5NRGC1IBwHvdOP+S6gNiltJ6xuFcEeNeH6xOTydhoE5L
	MXb6phKVOVFUM5+6B/D0wO10tpfO0O6+SJBqdH+jlkbcuqPMt7KtJeXToIMwGqMKREK
	Uy/j1uygqyv6aq443/JNtQVUDqt5/iv1o5+dDgM0=
Content-Type: multipart/mixed; boundary="===============5374060491990200505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.67 SUCCEEDED
Message-ID: 
 <010101839477df29-9fba0db5-b586-487e-9c12-edbc968cb801-000000@us-west-2.amazonses.com>
Date: Sat, 1 Oct 2022 16:53:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.10.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Oct 2022 16:53:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171301

--===============5374060491990200505==
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
--===============5374060491990200505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.66" to "1.4.67"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.66 [default] to 1.4.67 [default]
packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.66.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.67.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
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

--===============5374060491990200505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.66-1.4.67.patch"

RnJvbSBjNTA1ZTJkNzhlM2JmMDk5YTUzOWRmNWE4NDA0Mjk4M2Y5NGUxNmY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBPY3QgMjAyMiAxMDoxMzozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC42NiAtPiAxLjQuNjcKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNjYuYmIgPT4gbGlnaHR0cGRfMS40LjY3LmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNjYuYmIgPT4gbGlnaHR0cGRf
MS40LjY3LmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNjYuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40LjY3LmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNjYuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNjcuYmIKaW5kZXggODAx
MTYyODY3Yy4uODM4ODgxZjIzOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC42Ni5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY3LmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ3YWM2ZTYwMjcxYWEwMTk2ZTY1NDcyZDAyZDAxOTU1NmRj
N2M2ZDA5ZGYzYjY1ZGYyYzFhYjY4NjYzNDhlM2IiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Uw
NGQ3NjdmNTFhOGQ4MjRiMzJlMjQ4M2VmMjk1MDk4MjkyMGQ0MjdkMTI3MmVmNDY2N2Y0OWQ2Zjg5
ZjM1OCIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjMxLjEKCg==

--===============5374060491990200505==--

