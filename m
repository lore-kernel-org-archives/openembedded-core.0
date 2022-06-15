Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F77FCCA496
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 13:03:46 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com
 (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web08.4461.1655298221818193907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 06:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dVkeIoo0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193,
 mailfrom: 01010181677663a5-d5ecc137-496d-424f-9ee5-bf4c27d24629-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tzDJlLn621yBWFV5iuX/dDaY3zBGcr1Dd68c2fd96/0=;
	b=dVkeIoo0GcmSoiTqD2LqpSbF6vfkgxi8OxK8hWOJqdtPtgFBNzdYhbh9phuwUKe7
	liTccrCRU1uf4v4TYi+Lu9oTTGyEyRAKMbFbpkd6+mom/DjZ2xwBBWcbPw0Cu7kUNYI
	Rst5VnJS+Sy182c5au1Gxb1tVGgt06UYdv5BMmvQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1655298221;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tzDJlLn621yBWFV5iuX/dDaY3zBGcr1Dd68c2fd96/0=;
	b=RtTMeTiSKUVkQWJT3Pf0vf3N7pL3b8bU7xNqZwXDr3nJKrL/04oX8ZDc/qegvoZs
	VCYpFA+gf9I/FhPtrSyROUgvftGct66k+Q3zR5l93+3mqtzfZJ7n+ebsbDjOQKbEl4y
	+vf9OHNBx1IMxEXbGFGYB/ZrPKPw5hbSmf2xuVyU=
Content-Type: multipart/mixed; boundary="===============3181363949776585628=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.65 SUCCEEDED
Message-ID: 
 <01010181677663a5-d5ecc137-496d-424f-9ee5-bf4c27d24629-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jun 2022 13:03:40 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.06.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 13:03:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166954

--===============3181363949776585628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.65* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.64-1.4.65.patch
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
--===============3181363949776585628==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.64-1.4.65.patch"

From 7f68102737c9b92dea6dce2d512730b0a55b07e4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jun 2022 09:44:43 +0000
Subject: [PATCH] lighttpd: upgrade 1.4.64 -> 1.4.65

---
 .../lighttpd/{lighttpd_1.4.64.bb => lighttpd_1.4.65.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.64.bb => lighttpd_1.4.65.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.64.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.64.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
index 8d2e77e011..10aa27f072 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.64.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.65.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "e1489d9fa7496fbf2e071c338b593b2300d38c23f1e5967e52c9ef482e1b0e26"
+SRC_URI[sha256sum] = "bf0fa68a629fbc404023a912b377e70049331d6797bcbb4b3e8df4c3b42328be"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.31.1


--===============3181363949776585628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.64.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.65.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2498536 to 2535520 (+1%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-access: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-alias: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evasive: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-evhost: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-expire: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGSIZE changed from 25936 to 30032 (+16%)
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-fastcgi: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-indexfile: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-redirect: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rewrite: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-scgi: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-secdownload: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-setenv: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-simple-vhost: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-staticfile: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-uploadprogress: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-usertrack: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2876126 to 2926407 (+2%)
packages/core2-32-poky-linux/lighttpd/lighttpd-src: FILELIST: directory renamed /usr/src/debug/lighttpd/1.4.64-r0/build/src -> /usr/src/debug/lighttpd/1.4.65-r0/build/src, directory renamed /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/compat -> /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/compat, directory renamed /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/ls-hpack -> /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/ls-hpack, removed "/usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/first.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/h2.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_access.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/configparser.y /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/algo_xxhash.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_
 userdir.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/sock_addr.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/network.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/connections.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_chunk.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_date.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/chunk.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdevent.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_alias.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/sr
 c/buffer.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_expire.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/keyvalue.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_redirect.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/data_config.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/algo_hmac.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_secdownload.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/ck.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/request.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4
 .64/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/gw_backend.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/network_write.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_evasive.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/configfile.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/log.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/vector.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_cgi.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/connections.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/chunk.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdevent_impl.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/plugin_config.h /usr/src/debug/lighttpd/1.4.64-r0/l
 ighttpd-1.4.64/src/network_write.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/ck.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/server.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/base64.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/keyvalue.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/stat_cache.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/base64.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/h2.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdlog.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.64-r0/li
 ghttpd-1.4.64/src/reqpool.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/rand.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/log.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/vector.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/response.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/base_decls.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/algo_md.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/buffer.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_etag.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/base.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.
 64/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/array.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdlog.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/algo_hmac.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_range.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/plugin.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/reqpool.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_header.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_kv.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/rand.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/burl.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_status.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_chunk.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_header.c /u
 sr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/status_counter.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_auth.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/burl.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/stat_cache.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/array.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_etag.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_uploadprogress.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/configfile.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_kv.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/response.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_ra
 nge.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/request.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/network.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/sock_addr.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/fdevent.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_cgi.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/gw_backend.h /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/http_date.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/mod_usertrack.c /usr/src/debug/lighttpd/1.4.64-r0/lighttpd-1.4.64/src/plugin.c", added "/usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/ck.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/keyvalue.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/response.h /u
 sr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/vector.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_expire.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_date.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_userdir.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_auth.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_etag.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_chunk.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_header.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdevent.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/keyvalue.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/buffer.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_etag.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http-header-glue.c /usr
 /src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/base.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_secdownload.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/first.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/base64.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/chunk.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/network.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/base_decls.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/burl.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/rand.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/network_write.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/configfile.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_ssi.c /usr/src/debug/
 lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/base64.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdevent_impl.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_range.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/server.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_status.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/network.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/request.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/reqpool.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/algo_xxhash.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_kv.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_cgi.c /usr/src/debug/lightt
 pd/1.4.65-r0/lighttpd-1.4.65/src/request.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/array.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_alias.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_chunk.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/sock_addr.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/algo_hmac.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/reqpool.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/plugin.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_range.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/plugin_config.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/gw_backend.c /usr/src/debug/li
 ghttpd/1.4.65-r0/lighttpd-1.4.65/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_header.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/h2.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/network_write.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_kv.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/connections.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/configfile.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/algo_splaytree.c 
 /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/stat_cache.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/h2.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_date.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/chunk.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/connections.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/buffer.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/rand.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/algo_md.h /
 usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/ck.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/response.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/gw_backend.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/burl.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_access.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_uploadprogress.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/stat_cache.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/algo_hmac.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/
 src/log.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/data_config.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/plugins.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_evasive.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_redirect.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdevent.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/configparser.y /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/log.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/vector.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_usertrack.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/array.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/plugin.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdlog.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/fdlog.c /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/http_cgi.h /usr/src/d
 ebug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/sock_addr.h /usr/src/debug/lighttpd/1.4.65-r0/lighttpd-1.4.65/src/algo_splaytree.h"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.64" to "1.4.65"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.64 [default] to 1.4.65 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 449900 to 453996 (+1%)
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.64" to "1.4.65"

--===============3181363949776585628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGSIZE changed from 25936 to 30032 (+16%)

--===============3181363949776585628==--

