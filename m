Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D96FCA9EBF
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.7521.1685693431075334276
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T+STU9Q8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101887b28877b-9a99190b-b3fb-401f-9cfe-e9f0ab255eeb-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=1cijdSXkwZGj4nS98VH3elTqNt9LdBBmX3l2gE95Rec=;
	b=T+STU9Q8TzF9AiYtVVt96LJABb1qKcT2cbNb/XHFH5XFzBTbZmqtqAkGJni7+CeO
	4JbTd8Xn71H3Tc1nV8mJFH7rubSLzv6X+Bn7m8B5k+VcI8New9Bmg//AJqRvXGT5X6I
	AjePiTr5XaL2IJJN4e4bOuLjzyMwSCokw3Uqu8Lc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=1cijdSXkwZGj4nS98VH3elTqNt9LdBBmX3l2gE95Rec=;
	b=fhWBNNTTNCvYHGCRUathgAX5Jh3H70eum5Pd6/uvYNiWSjj0xyLfLzirPDbUzRxI
	WNalhRbijUEWlvqIpwBNBFJjIJrKBpEtZ83YVh00/GUe4ZMnkYp1YsM0lc4r8VJ6N2U
	wdbNWUuiTo3uaaDvF27dBrL9Z8MCiptieFaxemU8=
Content-Type: multipart/mixed; boundary="===============8394886080342633471=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.71 SUCCEEDED
Message-ID: <010101887b28877b-9a99190b-b3fb-401f-9cfe-e9f0ab255eeb-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182212

--===============8394886080342633471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.71* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.69-1.4.71.patch
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
--===============8394886080342633471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lighttpd: PACKAGES: removed "lighttpd-module-setenv lighttpd-module-scgi lighttpd-module-indexfile lighttpd-module-expire lighttpd-module-evhost lighttpd-module-alias lighttpd-module-staticfile lighttpd-module-rewrite lighttpd-module-fastcgi lighttpd-module-access lighttpd-module-simple-vhost lighttpd-module-redirect", added "lighttpd-module-h2"
Changes to packages/core2-32-poky-linux/lighttpd (sysroot):
  /usr/lib/lighttpd/mod_h2.so was added
  /usr/lib/lighttpd/mod_access.so was removed
  /usr/lib/lighttpd/mod_alias.so was removed
  /usr/lib/lighttpd/mod_evhost.so was removed
  /usr/lib/lighttpd/mod_expire.so was removed
  /usr/lib/lighttpd/mod_fastcgi.so was removed
  /usr/lib/lighttpd/mod_indexfile.so was removed
  /usr/lib/lighttpd/mod_redirect.so was removed
  /usr/lib/lighttpd/mod_rewrite.so was removed
  /usr/lib/lighttpd/mod_scgi.so was removed
  /usr/lib/lighttpd/mod_setenv.so was removed
  /usr/lib/lighttpd/mod_simple_vhost.so was removed
  /usr/lib/lighttpd/mod_staticfile.so was removed

--===============8394886080342633471==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.69-1.4.71.patch"

RnJvbSBmZTA4ZjEzNjkxNWZlOGY0MGJlZmJjMWI0M2IwYTY1YzNjOGVmYmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxOTo0MDozOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
Z2h0dHBkOiB1cGdyYWRlIDEuNC42OSAtPiAxLjQuNzEKCi0tLQogLi4uL2xpZ2h0dHBkL3tsaWdo
dHRwZF8xLjQuNjkuYmIgPT4gbGlnaHR0cGRfMS40LjcxLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBkL3tsaWdodHRwZF8xLjQuNjkuYmIgPT4gbGlnaHR0cGRf
MS40LjcxLmJifSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWdo
dHRwZC9saWdodHRwZF8xLjQuNjkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQv
bGlnaHR0cGRfMS40LjcxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNjkuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC9saWdodHRwZF8xLjQuNzEuYmIKaW5kZXggODU3
MGQ4NWY1ZS4uYWJhYjg4YWE0NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC42OS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjcxLmJiCkBAIC0xOSw3ICsxOSw3IEBAIFNSQ19VUkkgPSAiaHR0
cDovL2Rvd25sb2FkLmxpZ2h0dHBkLm5ldC9saWdodHRwZC9yZWxlYXNlcy0xLjQueC9saWdodHRw
ZC0ke1BWfS50CiAgICAgICAgICAgIGZpbGU6Ly9saWdodHRwZCBcCiAgICAgICAgICAgICIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjE2YWM4ZGI5NWU3MTk2MjliYTYxOTQ5Yjk5ZjhhMjZmZWJh
OTQ2YTgxZDE4NTIxNWIyODM3OWJiNDExNmIwYjQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjhi
NjkxNWRhMjAzOTZmZGMzNTRkZjMzMjRkNWU0NDAxNjliMmU1ZWE3ODU5ZTNhNzc1MjEzODQxMzI1
YWZhYyIKIAogREVQRU5EUyA9ICJ2aXJ0dWFsL2NyeXB0IgogCi0tIAoyLjM5LjIKCg==

--===============8394886080342633471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd: PACKAGES: removed "lighttpd-module-fastcgi lighttpd-module-evhost lighttpd-module-indexfile lighttpd-module-redirect lighttpd-module-setenv lighttpd-module-scgi lighttpd-module-rewrite lighttpd-module-staticfile lighttpd-module-alias lighttpd-module-expire lighttpd-module-simple-vhost lighttpd-module-access", added "lighttpd-module-h2"
packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.69.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.71.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: FILELIST: removed "/usr/lib/lighttpd/.debug/mod_simple_vhost.so /usr/lib/lighttpd/.debug/mod_rewrite.so /usr/lib/lighttpd/.debug/mod_setenv.so /usr/lib/lighttpd/.debug/mod_fastcgi.so /usr/lib/lighttpd/.debug/mod_alias.so /usr/lib/lighttpd/.debug/mod_expire.so /usr/lib/lighttpd/.debug/mod_scgi.so /usr/lib/lighttpd/.debug/mod_redirect.so /usr/lib/lighttpd/.debug/mod_indexfile.so /usr/lib/lighttpd/.debug/mod_evhost.so /usr/lib/lighttpd/.debug/mod_access.so /usr/lib/lighttpd/.debug/mod_staticfile.so", added "/usr/lib/lighttpd/.debug/mod_h2.so"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2435924 to 2329244 (-4%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: FILELIST: directory renamed /usr/src/debug/lighttpd/1.4.69-r0/src/compat -> /usr/src/debug/lighttpd/1.4.71-r0/src/compat, directory renamed /usr/src/debug/lighttpd/1.4.69-r0/src/ls-hpack -> /usr/src/debug/lighttpd/1.4.71-r0/src/ls-hpack, removed "/usr/src/debug/lighttpd/1.4.69-r0/src/mod_userdir.c /usr/src/debug/lighttpd/1.4.69-r0/src/network_write.c /usr/src/debug/lighttpd/1.4.69-r0/src/network_write.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_kv.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_kv.c /usr/src/debug/lighttpd/1.4.69-r0/src/ck.c /usr/src/debug/lighttpd/1.4.69-r0/src/h2.c /usr/src/debug/lighttpd/1.4.69-r0/src/keyvalue.c /usr/src/debug/lighttpd/1.4.69-r0/src/keyvalue.h /usr/src/debug/lighttpd/1.4.69-r0/src/ck.h /usr/src/debug/lighttpd/1.4.69-r0/src/h2.h /usr/src/debug/l
 ighttpd/1.4.69-r0/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_cgi.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_cgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_access.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_expire.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_status.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.69-r0/src/network.c /usr/src/debug/lighttpd/1.4.69-r0/src/network.h /usr/src/debug/lighttpd/1.4.69-r0/src/buffer.c /usr/src/debug/lighttpd/1.4.69-r0/src/buffer.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_chunk.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_range.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_chunk.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_range.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.69-r0/src/request.h /usr/src/debug/lighttpd/1.4.69-r0/src/request.c /usr/src/debug/l
 ighttpd/1.4.69-r0/src/fdlog.h /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdlog.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_alias.c /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.69-r0/src/data_config.c /usr/src/debug/lighttpd/1.4.69-r0/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.69-r0/src/server.c /usr/src/debug/lighttpd/1.4.69-r0/src/algo_md.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent.c /usr/src/debug/lighttpd/1.4.69-r0/src/first.h /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.69-r0/src/burl.h /usr/src/debug/lighttpd/1.4.69-r0/src/burl.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.69-r0/src/algo_xxhash.h /usr/src/debug/li
 ghttpd/1.4.69-r0/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.69-r0/src/chunk.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent_impl.c /usr/src/debug/lighttpd/1.4.69-r0/src/chunk.h /usr/src/debug/lighttpd/1.4.69-r0/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.69-r0/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.69-r0/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr.h /usr/src/debug/lighttpd/1.4.69-r0/src/rand.c /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr.c /usr/src/debug/lighttpd/1.4.69-r0/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.69-r0/src/rand.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.69-r0/src/gw_backend.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_header.h /usr/src/debug/lighttpd/1.4.69-r0/
 src/gw_backend.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_header.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_auth.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.69-r0/src/connections.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.69-r0/src/array.c /usr/src/debug/lighttpd/1.4.69-r0/src/plugin.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.69-r0/src/connections.h /usr/src/debug/lighttpd/1.4.69-r0/src/array.h /usr/src/debug/lighttpd/1.4.69-r0/src/plugin.h /usr/src/debug/lighttpd/1.4.69-r0/src/configparser.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.69-r0/src/response.h /usr/src/debug/lighttpd/1.4.69-r0/src/response.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.69-r0/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.69-r0/src/configfile.c /usr/s
 rc/debug/lighttpd/1.4.69-r0/src/configparser.y /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.69-r0/src/base.h /usr/src/debug/lighttpd/1.4.69-r0/src/configfile.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_date.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_etag.h /usr/src/debug/lighttpd/1.4.69-r0/src/base64.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_date.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_etag.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.69-r0/src/base64.c /usr/src/debug/lighttpd/1.4.69-r0/src/reqpool.c /usr/src/debug/lighttpd/1.4.69-r0/src/log.h /usr/src/debug/lighttpd/1.4.69-r0/src/log.c /usr/src/debug/lighttpd/1.4.69-r0/src/reqpool.h /usr/src/debug/lighttpd/1.4.69-r0/src/plugin_config.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_redirect.c /usr/src/debug/lighttpd/1.4.69-r0/src/plugins.h /usr/src/d
 ebug/lighttpd/1.4.69-r0/src/stat_cache.h /usr/src/debug/lighttpd/1.4.69-r0/src/base_decls.h /usr/src/debug/lighttpd/1.4.69-r0/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.69-r0/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.69-r0/src/stat_cache.c", added "/usr/src/debug/lighttpd/1.4.71-r0/src/mod_userdir.c /usr/src/debug/lighttpd/1.4.71-r0/src/network_write.c /usr/src/debug/lighttpd/1.4.71-r0/src/network_write.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.71-r0/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_kv.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.71-r0/src/http_kv.c /usr/src/debug/lighttpd/1.4.71-r0/src/ck.c /usr/src/debug/lighttpd/1.4.71-r0/src/h1.c /usr/src/debug/lighttpd/1.4.71-r0/src/h2.c /usr/src/debug/lighttpd/1.4.71-r0/src/keyvalue.c /usr/src/debug/lighttpd/1.4.71-r0/src/keyvalue.h /usr/src/debug/lighttpd/1.4.71-r0/src/ck.h /usr/s
 rc/debug/lighttpd/1.4.71-r0/src/h1.h /usr/src/debug/lighttpd/1.4.71-r0/src/h2.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.71-r0/src/http_cgi.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_cgi.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_access.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_expire.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_status.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.71-r0/src/network.c /usr/src/debug/lighttpd/1.4.71-r0/src/network.h /usr/src/debug/lighttpd/1.4.71-r0/src/buffer.c /usr/src/debug/lighttpd/1.4.71-r0/src/buffer.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_chunk.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_range.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_chunk.c /usr/src/debug/lighttpd/1.4.71-r0/src/http_range.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_extforward.c /usr/src/debug/l
 ighttpd/1.4.71-r0/src/request.h /usr/src/debug/lighttpd/1.4.71-r0/src/request.c /usr/src/debug/lighttpd/1.4.71-r0/src/fdlog.h /usr/src/debug/lighttpd/1.4.71-r0/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_alias.c /usr/src/debug/lighttpd/1.4.71-r0/src/fdlog.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.71-r0/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.71-r0/src/data_config.c /usr/src/debug/lighttpd/1.4.71-r0/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.71-r0/src/server.c /usr/src/debug/lighttpd/1.4.71-r0/src/algo_md.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.71-r0/src/fdevent.c /usr/src/debug/lighttpd/1.4.71-r0/src/first.h /usr/src/debug/lighttpd/1.4.71-r0/src/fdevent.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.71-r0/src/burl.h /usr/src/debug/lighttpd/1.4.71-r0/src/burl.c /usr/src/debug/lightt
 pd/1.4.71-r0/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.71-r0/src/algo_xxhash.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.71-r0/src/chunk.c /usr/src/debug/lighttpd/1.4.71-r0/src/fdevent_impl.c /usr/src/debug/lighttpd/1.4.71-r0/src/chunk.h /usr/src/debug/lighttpd/1.4.71-r0/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.71-r0/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.71-r0/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.71-r0/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.71-r0/src/sock_addr.h /usr/src/debug/lighttpd/1.4.71-r0/src/rand.c /usr/src/debug/lighttpd/1.4.71-r0/src/sock_addr.c /usr/src/debug/lighttpd/1.4.71-r0/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.71-r0/src/rand.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.71-r0/src/gw_
 backend.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_header.h /usr/src/debug/lighttpd/1.4.71-r0/src/gw_backend.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_auth.c /usr/src/debug/lighttpd/1.4.71-r0/src/http_header.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.71-r0/src/connections.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.71-r0/src/array.c /usr/src/debug/lighttpd/1.4.71-r0/src/plugin.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.71-r0/src/connections.h /usr/src/debug/lighttpd/1.4.71-r0/src/array.h /usr/src/debug/lighttpd/1.4.71-r0/src/plugin.h /usr/src/debug/lighttpd/1.4.71-r0/src/configparser.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.71-r0/src/response.h /usr/src/debug/lighttpd/1.4.71-r0/src/response.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_auth_api.h /usr/src/debu
 g/lighttpd/1.4.71-r0/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.71-r0/src/configfile.c /usr/src/debug/lighttpd/1.4.71-r0/src/configparser.y /usr/src/debug/lighttpd/1.4.71-r0/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.71-r0/src/base.h /usr/src/debug/lighttpd/1.4.71-r0/src/configfile.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_date.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_etag.h /usr/src/debug/lighttpd/1.4.71-r0/src/base64.h /usr/src/debug/lighttpd/1.4.71-r0/src/http_date.c /usr/src/debug/lighttpd/1.4.71-r0/src/http_etag.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.71-r0/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.71-r0/src/base64.c /usr/src/debug/lighttpd/1.4.71-r0/src/reqpool.c /usr/src/debug/lighttpd/1.4.71-r0/src/log.h /usr/src/debug/lighttpd/1.4.71-r0/src/log.c /usr/src/debug/lighttpd/1.4.71-r0/src/reqpool.h /usr/src/debug/lighttpd/1.4.71-r0/src/plugin_config.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_fastcgi.c /usr/src/debug/
 lighttpd/1.4.71-r0/src/mod_redirect.c /usr/src/debug/lighttpd/1.4.71-r0/src/plugins.h /usr/src/debug/lighttpd/1.4.71-r0/src/stat_cache.h /usr/src/debug/lighttpd/1.4.71-r0/src/base_decls.h /usr/src/debug/lighttpd/1.4.71-r0/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.71-r0/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.71-r0/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.71-r0/src/stat_cache.c"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2901711 to 2963312 (+2%)
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.69 [default] to 1.4.71 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.69" to "1.4.71"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 445800 to 429356 (-4%)
Changes to packages/core2-32-poky-linux/lighttpd (sysroot):
  /usr/lib/lighttpd/mod_h2.so was added
  /usr/lib/lighttpd/mod_access.so was removed
  /usr/lib/lighttpd/mod_alias.so was removed
  /usr/lib/lighttpd/mod_evhost.so was removed
  /usr/lib/lighttpd/mod_expire.so was removed
  /usr/lib/lighttpd/mod_fastcgi.so was removed
  /usr/lib/lighttpd/mod_indexfile.so was removed
  /usr/lib/lighttpd/mod_redirect.so was removed
  /usr/lib/lighttpd/mod_rewrite.so was removed
  /usr/lib/lighttpd/mod_scgi.so was removed
  /usr/lib/lighttpd/mod_setenv.so was removed
  /usr/lib/lighttpd/mod_simple_vhost.so was removed
  /usr/lib/lighttpd/mod_staticfile.so was removed

--===============8394886080342633471==--

