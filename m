Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A94CD98E2
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 05:18:52 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123076.1781500723928275526
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 22:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=S4R6oB9q;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pM2JRwDv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019ec9b7bfc9-9f8f4b90-4a3a-48e0-a800-c08dc0464e36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781500723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TOcf68DDZ12xLttuICY0l0FORvQiZGgegdik9LrFgtE=;
	b=S4R6oB9qqy4ASUJqxADg6mcNzIDK7S4ymgyf/0/ne7L2IxHBvg40mehgyMGMXgdm
	cbOCTk2VpepBLi3XMt8MpIE6UufAl7+kvQg/HKgoQZEG08OjMTDGMLIvvssYiefC1Pv
	k04XT6cy8JC6QW3Af2BRUj5ayrluuqoOvz6A9gY4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781500723;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TOcf68DDZ12xLttuICY0l0FORvQiZGgegdik9LrFgtE=;
	b=pM2JRwDv9gNgJwrl9iW8v62DXeEIkBAVVBNzXy0VV6UkGzij5TEcFItVmY2pnEf9
	TiYXFoQ8XsMyz2TC2SLcnSsp6sj1JpagO1NlXA4tJtLr8rJNUtoLeDYmypb+kJZ5zre
	Kai+5U/OGBL6KBtKOz4v/JVdcRUEUqMbRQRJyeYI=
Content-Type: multipart/mixed; boundary="===============1823386574261481163=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lighttpd: upgrading to 1.4.83 SUCCEEDED
Message-ID: <0101019ec9b7bfc9-9f8f4b90-4a3a-48e0-a800-c08dc0464e36-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jun 2026 05:18:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 05:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238804

--===============1823386574261481163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lighttpd* to *1.4.83* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.82-1.4.83.patch
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

-- >8 --
From bcc570afa29a699bf0e9cfedb657a294ac33b34c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jun 2026 05:09:46 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.82 -> 1.4.83

---
 .../lighttpd/{lighttpd_1.4.82.bb => lighttpd_1.4.83.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.82.bb => lighttpd_1.4.83.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
index 8221d30283..a1a7bee227 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.82.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.83.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "abfe74391f9cbd66ab154ea07e64f194dbe7e906ef4ed47eb3b0f3b46246c962"
+SRC_URI[sha256sum] = "b3f878156480079f8a93903bd24d456074a0fbedb9b4d99fcd65df33b1f566f0"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.47.1


--===============1823386574261481163==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.82-1.4.83.patch"

RnJvbSBiY2M1NzBhZmEyOWE2OTliZjBlOWNmZWRiNjU3YTI5NGFjMzNiMzRjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVuIDIwMjYgMDU6MDk6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuODIgLT4gMS40LjgzCgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjgyLmJiID0+IGxpZ2h0dHBkXzEuNC44My5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjgyLmJiID0+IGxpZ2h0dHBk
XzEuNC44My5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjgyLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC44My5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgyLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjgzLmJiCmluZGV4IDgy
MjFkMzAyODMuLmExYTdiZWUyMjcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuODIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC44My5iYgpAQCAtMTYsNyArMTYsNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJhYmZlNzQzOTFmOWNiZDY2YWIxNTRlYTA3ZTY0ZjE5NGRi
ZTdlOTA2ZWY0ZWQ0N2ViM2IwZjNiNDYyNDZjOTYyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImIz
Zjg3ODE1NjQ4MDA3OWY4YTkzOTAzYmQyNGQ0NTYwNzRhMGZiZWRiOWI0ZDk5ZmNkNjVkZjMzYjFm
NTY2ZjAiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi40Ny4xCgo=

--===============1823386574261481163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: RDEPENDS: added "glibc (['>= 2.43+git0+e9517114ac'])"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGSIZE changed from 26592 to 22496 (-15%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGSIZE changed from 34784 to 26592 (-24%)

--===============1823386574261481163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/lighttpd: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.82.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.83.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2946856 to 2981456 (+1%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-h2: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-openssl: PKGSIZE changed from 59360 to 63456 (+7%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGSIZE changed from 14152 to 14304 (+1%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-sockproxy: RDEPENDS: added "glibc (['>= 2.43+git0+e9517114ac'])"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-status: PKGSIZE changed from 26592 to 22496 (-15%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGSIZE changed from 34784 to 26592 (-24%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 3179909 to 3229831 (+2%)
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-src: FILELIST: directory renamed /usr/src/debug/lighttpd/1.4.82/src/compat -> /usr/src/debug/lighttpd/1.4.83/src/compat, directory renamed /usr/src/debug/lighttpd/1.4.82/src/ls-hpack -> /usr/src/debug/lighttpd/1.4.83/src/ls-hpack, removed "/usr/src/debug/lighttpd/1.4.82/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.82/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.82/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.82/src/connections.h /usr/src/debug/lighttpd/1.4.82/src/connections.c /usr/src/debug/lighttpd/1.4.82/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.82/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.82/src/network_write.c /usr/src/debug/lighttpd/1.4.82/src/configparser.y /usr/src/debug/lighttpd/1.4.82/src/network_write.h /usr/src/debug/lighttpd/1.4.82/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.82/src/configparser.c /usr/src/debug/lighttpd/1.4.82/src/gw_backend.c /usr/src/debug/lighttpd/1.4.82/src/mod_rrdtool.c /usr
 /src/debug/lighttpd/1.4.82/src/data_config.c /usr/src/debug/lighttpd/1.4.82/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.82/src/gw_backend.h /usr/src/debug/lighttpd/1.4.82/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.82/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.82/src/plugins.h /usr/src/debug/lighttpd/1.4.82/src/fdevent_impl.c /usr/src/debug/lighttpd/1.4.82/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.82/src/h2.c /usr/src/debug/lighttpd/1.4.82/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.82/src/h2.h /usr/src/debug/lighttpd/1.4.82/src/base64.c /usr/src/debug/lighttpd/1.4.82/src/http_range.h /usr/src/debug/lighttpd/1.4.82/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.82/src/base64.h /usr/src/debug/lighttpd/1.4.82/src/http_range.c /usr/src/debug/lighttpd/1.4.82/src/http_header.h /usr/src/debug/lighttpd/1.4.82/src/http_date.h /usr/src/debug/lighttpd/1.4.82/src/http_date.c /usr/src/debug/lighttpd/1.4.82/src/http_header.c /usr/src/debug/lighttpd/1.4.82/src/mod_simple_vhost.c
  /usr/src/debug/lighttpd/1.4.82/src/plugin_config.h /usr/src/debug/lighttpd/1.4.82/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.82/src/sock_addr.h /usr/src/debug/lighttpd/1.4.82/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.82/src/sock_addr.c /usr/src/debug/lighttpd/1.4.82/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.82/src/base_decls.h /usr/src/debug/lighttpd/1.4.82/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.82/src/mod_redirect.c /usr/src/debug/lighttpd/1.4.82/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.82/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.82/src/http_etag.h /usr/src/debug/lighttpd/1.4.82/src/algo_md.h /usr/src/debug/lighttpd/1.4.82/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.82/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.82/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.82/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.82/src/http_etag.c /usr/src/debug/lighttpd/1.4.82/src/h1.h /usr/src/debug/lighttpd/1.4.82/src/h1.c /usr/src/debug/lighttpd/1.4.82/
 src/mod_userdir.c /usr/src/debug/lighttpd/1.4.82/src/keyvalue.h /usr/src/debug/lighttpd/1.4.82/src/algo_xxhash.h /usr/src/debug/lighttpd/1.4.82/src/keyvalue.c /usr/src/debug/lighttpd/1.4.82/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.82/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.82/src/array.c /usr/src/debug/lighttpd/1.4.82/src/chunk.c /usr/src/debug/lighttpd/1.4.82/src/fdlog.c /usr/src/debug/lighttpd/1.4.82/src/mod_alias.c /usr/src/debug/lighttpd/1.4.82/src/chunk.h /usr/src/debug/lighttpd/1.4.82/src/array.h /usr/src/debug/lighttpd/1.4.82/src/fdlog.h /usr/src/debug/lighttpd/1.4.82/src/first.h /usr/src/debug/lighttpd/1.4.82/src/stat_cache.c /usr/src/debug/lighttpd/1.4.82/src/base.h /usr/src/debug/lighttpd/1.4.82/src/burl.h /usr/src/debug/lighttpd/1.4.82/src/rand.h /usr/src/debug/lighttpd/1.4.82/src/stat_cache.h /usr/src/debug/lighttpd/1.4.82/src/burl.c /usr/src/debug/lighttpd/1.4.82/src/rand.c /usr/src/debug/lighttpd/1.4.82/src/http_cgi.h /usr/src/debug/lighttpd/1.4.82/src/buff
 er.h /usr/src/debug/lighttpd/1.4.82/src/http_cgi.c /usr/src/debug/lighttpd/1.4.82/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.82/src/buffer.c /usr/src/debug/lighttpd/1.4.82/src/server.c /usr/src/debug/lighttpd/1.4.82/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.82/src/request.c /usr/src/debug/lighttpd/1.4.82/src/reqpool.h /usr/src/debug/lighttpd/1.4.82/src/request.h /usr/src/debug/lighttpd/1.4.82/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.82/src/reqpool.c /usr/src/debug/lighttpd/1.4.82/src/log.h /usr/src/debug/lighttpd/1.4.82/src/mod_access.c /usr/src/debug/lighttpd/1.4.82/src/log.c /usr/src/debug/lighttpd/1.4.82/src/plugin.h /usr/src/debug/lighttpd/1.4.82/src/response.h /usr/src/debug/lighttpd/1.4.82/src/mod_expire.c /usr/src/debug/lighttpd/1.4.82/src/response.c /usr/src/debug/lighttpd/1.4.82/src/plugin.c /usr/src/debug/lighttpd/1.4.82/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.82/src/http_kv.h /usr/src/debug/lighttpd/1.4.82/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.82/
 src/configfile.c /usr/src/debug/lighttpd/1.4.82/src/http_kv.c /usr/src/debug/lighttpd/1.4.82/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.82/src/configfile.h /usr/src/debug/lighttpd/1.4.82/src/http_chunk.h /usr/src/debug/lighttpd/1.4.82/src/http_chunk.c /usr/src/debug/lighttpd/1.4.82/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.82/src/mod_status.c /usr/src/debug/lighttpd/1.4.82/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.82/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.82/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.82/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.82/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.82/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.82/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.82/src/network.h /usr/src/debug/lighttpd/1.4.82/src/mod_auth.c /usr/src/debug/lighttpd/1.4.82/src/network.c /usr/src/debug/lighttpd/1.4.82/src/fdevent.c /usr/src/debug/lighttpd/1.4.82/src/ck.h /usr/src/debug/lighttpd/1.4.82/src/fdevent.h /usr/src/debug/lighttpd/1.4.8
 2/src/ck.c", added "/usr/src/debug/lighttpd/1.4.83/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.83/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.83/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.83/src/connections.h /usr/src/debug/lighttpd/1.4.83/src/connections.c /usr/src/debug/lighttpd/1.4.83/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.83/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.83/src/network_write.c /usr/src/debug/lighttpd/1.4.83/src/configparser.y /usr/src/debug/lighttpd/1.4.83/src/network_write.h /usr/src/debug/lighttpd/1.4.83/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.83/src/configparser.c /usr/src/debug/lighttpd/1.4.83/src/gw_backend.c /usr/src/debug/lighttpd/1.4.83/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.83/src/data_config.c /usr/src/debug/lighttpd/1.4.83/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.83/src/gw_backend.h /usr/src/debug/lighttpd/1.4.83/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.83/src/fdevent_impl.h /usr/src/debug/light
 tpd/1.4.83/src/plugins.h /usr/src/debug/lighttpd/1.4.83/src/fdevent_impl.c /usr/src/debug/lighttpd/1.4.83/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.83/src/h2.c /usr/src/debug/lighttpd/1.4.83/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.83/src/h2.h /usr/src/debug/lighttpd/1.4.83/src/base64.c /usr/src/debug/lighttpd/1.4.83/src/http_range.h /usr/src/debug/lighttpd/1.4.83/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.83/src/base64.h /usr/src/debug/lighttpd/1.4.83/src/http_range.c /usr/src/debug/lighttpd/1.4.83/src/http_status.c /usr/src/debug/lighttpd/1.4.83/src/http_header.h /usr/src/debug/lighttpd/1.4.83/src/http_date.h /usr/src/debug/lighttpd/1.4.83/src/http_date.c /usr/src/debug/lighttpd/1.4.83/src/http_header.c /usr/src/debug/lighttpd/1.4.83/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.83/src/http_status.h /usr/src/debug/lighttpd/1.4.83/src/plugin_config.h /usr/src/debug/lighttpd/1.4.83/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.83/src/sock_addr.h /usr/src/debug/lighttpd/1
 .4.83/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.83/src/sock_addr.c /usr/src/debug/lighttpd/1.4.83/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.83/src/base_decls.h /usr/src/debug/lighttpd/1.4.83/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.83/src/mod_redirect.c /usr/src/debug/lighttpd/1.4.83/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.83/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.83/src/http_etag.h /usr/src/debug/lighttpd/1.4.83/src/algo_md.h /usr/src/debug/lighttpd/1.4.83/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.83/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.83/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.83/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.83/src/http_etag.c /usr/src/debug/lighttpd/1.4.83/src/h1.h /usr/src/debug/lighttpd/1.4.83/src/h1.c /usr/src/debug/lighttpd/1.4.83/src/mod_userdir.c /usr/src/debug/lighttpd/1.4.83/src/keyvalue.h /usr/src/debug/lighttpd/1.4.83/src/algo_xxhash.h /usr/src/debug/lighttpd/1.4.83/src/keyvalue.c /usr/src/d
 ebug/lighttpd/1.4.83/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.83/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.83/src/array.c /usr/src/debug/lighttpd/1.4.83/src/chunk.c /usr/src/debug/lighttpd/1.4.83/src/fdlog.c /usr/src/debug/lighttpd/1.4.83/src/mod_alias.c /usr/src/debug/lighttpd/1.4.83/src/chunk.h /usr/src/debug/lighttpd/1.4.83/src/array.h /usr/src/debug/lighttpd/1.4.83/src/fdlog.h /usr/src/debug/lighttpd/1.4.83/src/first.h /usr/src/debug/lighttpd/1.4.83/src/stat_cache.c /usr/src/debug/lighttpd/1.4.83/src/base.h /usr/src/debug/lighttpd/1.4.83/src/burl.h /usr/src/debug/lighttpd/1.4.83/src/rand.h /usr/src/debug/lighttpd/1.4.83/src/stat_cache.h /usr/src/debug/lighttpd/1.4.83/src/burl.c /usr/src/debug/lighttpd/1.4.83/src/rand.c /usr/src/debug/lighttpd/1.4.83/src/http_cgi.h /usr/src/debug/lighttpd/1.4.83/src/buffer.h /usr/src/debug/lighttpd/1.4.83/src/http_cgi.c /usr/src/debug/lighttpd/1.4.83/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.83/src/buffer.c /usr/src/debug/lighttpd/1.4.
 83/src/server.c /usr/src/debug/lighttpd/1.4.83/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.83/src/request.c /usr/src/debug/lighttpd/1.4.83/src/reqpool.h /usr/src/debug/lighttpd/1.4.83/src/request.h /usr/src/debug/lighttpd/1.4.83/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.83/src/reqpool.c /usr/src/debug/lighttpd/1.4.83/src/log.h /usr/src/debug/lighttpd/1.4.83/src/mod_access.c /usr/src/debug/lighttpd/1.4.83/src/log.c /usr/src/debug/lighttpd/1.4.83/src/plugin.h /usr/src/debug/lighttpd/1.4.83/src/response.h /usr/src/debug/lighttpd/1.4.83/src/mod_expire.c /usr/src/debug/lighttpd/1.4.83/src/response.c /usr/src/debug/lighttpd/1.4.83/src/plugin.c /usr/src/debug/lighttpd/1.4.83/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.83/src/http_kv.h /usr/src/debug/lighttpd/1.4.83/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.83/src/configfile.c /usr/src/debug/lighttpd/1.4.83/src/http_kv.c /usr/src/debug/lighttpd/1.4.83/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.83/src/configfile.h /usr/src/de
 bug/lighttpd/1.4.83/src/http_chunk.h /usr/src/debug/lighttpd/1.4.83/src/http_chunk.c /usr/src/debug/lighttpd/1.4.83/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.83/src/mod_status.c /usr/src/debug/lighttpd/1.4.83/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.83/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.83/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.83/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.83/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.83/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.83/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.83/src/network.h /usr/src/debug/lighttpd/1.4.83/src/mod_auth.c /usr/src/debug/lighttpd/1.4.83/src/network.c /usr/src/debug/lighttpd/1.4.83/src/fdevent.c /usr/src/debug/lighttpd/1.4.83/src/ck.h /usr/src/debug/lighttpd/1.4.83/src/fdevent.h /usr/src/debug/lighttpd/1.4.83/src/ck.c"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.82 [default] to 1.4.83 [default]
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PV changed from "1.4.82" to "1.4.83"
packages/x86-64-v3-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 407960 to 412150 (+1%)

--===============1823386574261481163==--

