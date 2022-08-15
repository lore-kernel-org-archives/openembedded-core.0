Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 854CBC2BB41
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:02 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com
 (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web09.6465.1660589821419989386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GCWcfbUq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191,
 mailfrom: 01010182a2ddcad7-77c0db4b-0e96-4248-8e4b-f9ee920516da-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6mGSz8BIwk0+VIVacauUyb/3cr/3RX0sQMb4mginhq8=;
	b=GCWcfbUqB8e7S8pXY9G8rjNCVlZiJeu71NyzGsuaolfNgi4iRpXEk/BpOtbo9S5x
	fVO9ZC4I8Ld15rP3sHmORJJxAN5/Z9e2S8b+IBYtv1tlPuADunrGWmsEIJCZFp2rHZX
	vV8BELe2ITHyHnrZMhlH9dpUOTLvNcrIU2VpKCaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589820;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6mGSz8BIwk0+VIVacauUyb/3cr/3RX0sQMb4mginhq8=;
	b=BYPH5FCkNv+YYqRqDosWDc3uEanzMKdnQJL0U82MQ89qffxmK3BGEYaxk2zektL1
	yZroOvy6T3f/h8oimi36zuctk6cwBSHq8d2eZzEmT4D445MxTToPkOXTdnw3T4DWNzV
	D6/ZHTmmf1cV4YmLYUAzg7KT6Fn1P6kV1rE8UrFU=
Content-Type: multipart/mixed; boundary="===============3101808214916293867=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.66 SUCCEEDED
Message-ID: 
 <01010182a2ddcad7-77c0db4b-0e96-4248-8e4b-f9ee920516da-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:00 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169386

--===============3101808214916293867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.66* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.65-1.4.66.patch
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
--===============3101808214916293867==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.65-1.4.66.patch"

RnJvbSBhNDk0Yzc2N2FiNzBmMzA5MjcxNWNhMWNmOGJhNjNmM2UwNjNkMjRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTA6Mjc6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNjUgLT4gMS40LjY2CgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjY1LmJiID0+IGxpZ2h0dHBkXzEuNC42Ni5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjY1LmJiID0+IGxpZ2h0dHBk
XzEuNC42Ni5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY1LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC42Ni5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY1LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY2LmJiCmluZGV4IDEw
YWEyN2YwNzIuLjgwMTE2Mjg2N2MgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC42Ni5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiZjBmYTY4YTYyOWZiYzQwNDAyM2E5MTJiMzc3ZTcwMDQ5
MzMxZDY3OTdiY2JiNGIzZThkZjRjM2I0MjMyOGJlIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ3
YWM2ZTYwMjcxYWEwMTk2ZTY1NDcyZDAyZDAxOTU1NmRjN2M2ZDA5ZGYzYjY1ZGYyYzFhYjY4NjYz
NDhlM2IiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi4zMS4xCgo=

--===============3101808214916293867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.65.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.66.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2534632 to 2540668 (+0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2926407 to 2933298 (+0%)
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.65 [default] to 1.4.66 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 449900 to 453996 (+1%)
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.65" to "1.4.66"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.65 [default] to 1.4.66 [default]

--===============3101808214916293867==--

