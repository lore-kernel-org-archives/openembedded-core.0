Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B9FC88CBF
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.3766.1684186747757284046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NrtHVLKg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010188215a5774-39ec3c43-13fc-408f-8b56-ae6715d2bd6d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3h78Xm6hcdO0mm7CN/EWoZJiIaHN0nuuwzKgtemj9zY=;
	b=NrtHVLKgTzURMU1jXcDC1VyvPUXpGMyynIWJfDLpxFgnRPrsF8wgyTLIcN6f1z+P
	385zdRX0Gbptv3oYstVT9BW1HX8H3Df+UB6OJHhucIM11XOtDtgPcVux5OP8vey7SxL
	/+zXZuWL8gjd7r6QTOznucOlhRhMhTXDNKN86uz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3h78Xm6hcdO0mm7CN/EWoZJiIaHN0nuuwzKgtemj9zY=;
	b=qOFPzeO7pRPaRUYaFdSGbarB7ZNwwCW7uWwI19F6Y5K4OoBOgDv4uKcT75ZgAXbj
	mQI/tTNUgroiHa261w9rsvddC2fayWLAl0RJdpleV0iyG9oZ87Y8s2NN/gBNgs6cTAy
	892z0eLkaq9BmMDjsWX+5YsEh3X9sVbvZYU70Ies=
Content-Type: multipart/mixed; boundary="===============0391215845874200758=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lighttpd: upgrading to 1.4.70 SUCCEEDED
Message-ID: <01010188215a5774-39ec3c43-13fc-408f-8b56-ae6715d2bd6d-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:08 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181337

--===============0391215845874200758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lighttpd* to *1.4.70* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lighttpd-upgrade-1.4.69-1.4.70.patch
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
--===============0391215845874200758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lighttpd: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd: SRC_URI changed from "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.69.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd" to "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.70.tar.xz file://index.html.lighttpd file://lighttpd.conf file://lighttpd"
packages/core2-32-poky-linux/lighttpd: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd: PACKAGES: removed "lighttpd-module-simple-vhost lighttpd-module-access lighttpd-module-scgi lighttpd-module-rewrite lighttpd-module-staticfile lighttpd-module-alias lighttpd-module-expire lighttpd-module-indexfile lighttpd-module-redirect lighttpd-module-setenv lighttpd-module-fastcgi lighttpd-module-evhost", added "lighttpd-module-h2"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGSIZE changed from 2406348 to 2426892 (+1%)
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-dbg: FILELIST: removed "/usr/lib/lighttpd/.debug/mod_evhost.so /usr/lib/lighttpd/.debug/mod_access.so /usr/lib/lighttpd/.debug/mod_staticfile.so /usr/lib/lighttpd/.debug/mod_expire.so /usr/lib/lighttpd/.debug/mod_scgi.so /usr/lib/lighttpd/.debug/mod_indexfile.so /usr/lib/lighttpd/.debug/mod_redirect.so /usr/lib/lighttpd/.debug/mod_fastcgi.so /usr/lib/lighttpd/.debug/mod_alias.so /usr/lib/lighttpd/.debug/mod_simple_vhost.so /usr/lib/lighttpd/.debug/mod_rewrite.so /usr/lib/lighttpd/.debug/mod_setenv.so", added "/usr/lib/lighttpd/.debug/mod_h2.so"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-dev: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-doc: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-locale: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-accesslog: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ajp13: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-auth: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-authn-file: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-cgi: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-deflate: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-dirlisting: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-extforward: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-openssl: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-proxy: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-rrdtool: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-sockproxy: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-ssi: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-status: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-userdir: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-vhostdb: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-webdav: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-module-wstunnel: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGSIZE changed from 2901711 to 2962725 (+2%)
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-src: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd-src: FILELIST: directory renamed /usr/src/debug/lighttpd/1.4.69-r0/src/compat -> /usr/src/debug/lighttpd/1.4.70-r0/src/compat, directory renamed /usr/src/debug/lighttpd/1.4.69-r0/src/ls-hpack -> /usr/src/debug/lighttpd/1.4.70-r0/src/ls-hpack, removed "/usr/src/debug/lighttpd/1.4.69-r0/src/gw_backend.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_alias.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.69-r0/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.69-r0/src/gw_backend.h /usr/src/debug/lighttpd/1.4.69-r0/src/first.h /usr/src/debug/lighttpd/1.4.69-r0/src/plugin_config.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_auth.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_redirect.c /usr/src/debug/lighttp
 d/1.4.69-r0/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.69-r0/src/base64.c /usr/src/debug/lighttpd/1.4.69-r0/src/base64.h /usr/src/debug/lighttpd/1.4.69-r0/src/configparser.y /usr/src/debug/lighttpd/1.4.69-r0/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/request.c /usr/src/debug/lighttpd/1.4.69-r0/src/rand.h /usr/src/debug/lighttpd/1.4.69-r0/src/configparser.c /usr/src/debug/lighttpd/1.4.69-r0/src/rand.c /usr/src/debug/lighttpd/1.4.69-r0/src/request.h /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent_impl.c /
 usr/src/debug/lighttpd/1.4.69-r0/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.69-r0/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.69-r0/src/ck.h /usr/src/debug/lighttpd/1.4.69-r0/src/h2.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_userdir.c /usr/src/debug/lighttpd/1.4.69-r0/src/ck.c /usr/src/debug/lighttpd/1.4.69-r0/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.69-r0/src/h2.c /usr/src/debug/lighttpd/1.4.69-r0/src/network_write.h /usr/src/debug/lighttpd/1.4.69-r0/src/array.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.69-r0/src/network_write.c /usr/src/debug/lighttpd/1.4.69-r0/src/array.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.69-r0/src/connections.h /usr/src/debug/lighttpd/1.4.69-r0/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.69-r0/src/connections.c /usr/src/debug/lighttpd/1.4.69-r0/src/plugins.h /usr/src/debug/lighttpd/1.4.69-r0/src/respon
 se.c /usr/src/debug/lighttpd/1.4.69-r0/src/network.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.69-r0/src/network.c /usr/src/debug/lighttpd/1.4.69-r0/src/response.h /usr/src/debug/lighttpd/1.4.69-r0/src/burl.c /usr/src/debug/lighttpd/1.4.69-r0/src/burl.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.69-r0/src/base.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_access.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_kv.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_expire.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_status.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_kv.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr.c /usr/src/debug/lighttpd/1.4.69-r0/src/sock_addr.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_date.c
  /usr/src/debug/lighttpd/1.4.69-r0/src/http_etag.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_etag.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_date.h /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent.c /usr/src/debug/lighttpd/1.4.69-r0/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.69-r0/src/algo_md.h /usr/src/debug/lighttpd/1.4.69-r0/src/base_decls.h /usr/src/debug/lighttpd/1.4.69-r0/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_chunk.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_range.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_chunk.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_range.h /usr/src/debug/lighttpd/1.4.69-r0/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.69-r0/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.69-r0/src/plugin.h /usr/src/debug/lighttpd/1.4.69-r0/src/algo_xxhash.h /usr/src/debug/lighttpd/1.4.69-r0/src/configfile.h /usr/src/debug/lighttpd/1.4.69-r0/sr
 c/server.c /usr/src/debug/lighttpd/1.4.69-r0/src/configfile.c /usr/src/debug/lighttpd/1.4.69-r0/src/plugin.c /usr/src/debug/lighttpd/1.4.69-r0/src/keyvalue.h /usr/src/debug/lighttpd/1.4.69-r0/src/data_config.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.69-r0/src/keyvalue.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_cgi.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdlog.c /usr/src/debug/lighttpd/1.4.69-r0/src/buffer.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_header.c /usr/src/debug/lighttpd/1.4.69-r0/src/fdlog.h /usr/src/debug/lighttpd/1.4.69-r0/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.69-r0/src/http_cgi.h /usr/src/debug/lighttpd/1.4.69-r0/src/http_header.h /usr/src/debug/lighttpd/1.4.69-r0/src/buffer.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.69-r0/src/mod_staticfile.c /usr/src/debug/lighttpd/1.4.69-r0/src/log.c /usr/src/debug/lighttpd/1.4.69-r0/s
 rc/chunk.h /usr/src/debug/lighttpd/1.4.69-r0/src/reqpool.h /usr/src/debug/lighttpd/1.4.69-r0/src/stat_cache.c /usr/src/debug/lighttpd/1.4.69-r0/src/reqpool.c /usr/src/debug/lighttpd/1.4.69-r0/src/chunk.c /usr/src/debug/lighttpd/1.4.69-r0/src/log.h /usr/src/debug/lighttpd/1.4.69-r0/src/stat_cache.h", added "/usr/src/debug/lighttpd/1.4.70-r0/src/gw_backend.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_alias.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_ajp13.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_proxy.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_extforward.c /usr/src/debug/lighttpd/1.4.70-r0/src/configfile-glue.c /usr/src/debug/lighttpd/1.4.70-r0/src/gw_backend.h /usr/src/debug/lighttpd/1.4.70-r0/src/first.h /usr/src/debug/lighttpd/1.4.70-r0/src/plugin_config.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_vhostdb_api.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_auth.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_vhostdb_api.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_redirect.c /usr/src/deb
 ug/lighttpd/1.4.70-r0/src/mod_ssi.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_indexfile.c /usr/src/debug/lighttpd/1.4.70-r0/src/sock_addr_cache.h /usr/src/debug/lighttpd/1.4.70-r0/src/sock_addr_cache.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_deflate.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_rewrite.c /usr/src/debug/lighttpd/1.4.70-r0/src/base64.c /usr/src/debug/lighttpd/1.4.70-r0/src/base64.h /usr/src/debug/lighttpd/1.4.70-r0/src/configparser.y /usr/src/debug/lighttpd/1.4.70-r0/src/fdlog_maint.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_openssl.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_rrdtool.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_fastcgi.c /usr/src/debug/lighttpd/1.4.70-r0/src/request.c /usr/src/debug/lighttpd/1.4.70-r0/src/rand.h /usr/src/debug/lighttpd/1.4.70-r0/src/configparser.c /usr/src/debug/lighttpd/1.4.70-r0/src/rand.c /usr/src/debug/lighttpd/1.4.70-r0/src/request.h /usr/src/debug/lighttpd/1.4.70-r0/src/fdevent_impl.h /usr/src/debug/lighttpd/1.4.70-r0/src/fdeven
 t_impl.c /usr/src/debug/lighttpd/1.4.70-r0/src/sys-crypto-md.h /usr/src/debug/lighttpd/1.4.70-r0/src/algo_splaytree.h /usr/src/debug/lighttpd/1.4.70-r0/src/ck.h /usr/src/debug/lighttpd/1.4.70-r0/src/h1.h /usr/src/debug/lighttpd/1.4.70-r0/src/h2.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_userdir.c /usr/src/debug/lighttpd/1.4.70-r0/src/ck.c /usr/src/debug/lighttpd/1.4.70-r0/src/algo_splaytree.c /usr/src/debug/lighttpd/1.4.70-r0/src/h1.c /usr/src/debug/lighttpd/1.4.70-r0/src/h2.c /usr/src/debug/lighttpd/1.4.70-r0/src/network_write.h /usr/src/debug/lighttpd/1.4.70-r0/src/array.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_vhostdb.c /usr/src/debug/lighttpd/1.4.70-r0/src/network_write.c /usr/src/debug/lighttpd/1.4.70-r0/src/array.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_cgi.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_simple_vhost.c /usr/src/debug/lighttpd/1.4.70-r0/src/connections.h /usr/src/debug/lighttpd/1.4.70-r0/src/http-header-glue.c /usr/src/debug/lighttpd/1.4.70-r0/src/connection
 s.c /usr/src/debug/lighttpd/1.4.70-r0/src/plugins.h /usr/src/debug/lighttpd/1.4.70-r0/src/response.c /usr/src/debug/lighttpd/1.4.70-r0/src/network.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_wstunnel.c /usr/src/debug/lighttpd/1.4.70-r0/src/network.c /usr/src/debug/lighttpd/1.4.70-r0/src/response.h /usr/src/debug/lighttpd/1.4.70-r0/src/burl.c /usr/src/debug/lighttpd/1.4.70-r0/src/burl.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_accesslog.c /usr/src/debug/lighttpd/1.4.70-r0/src/base.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_access.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_kv.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_evhost.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_expire.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_setenv.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_status.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_kv.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_webdav.c /usr/src/debug/lighttpd/1.4.70-r0/src/sock_addr.c /usr/src/debug/lighttpd/1.4.70-r0/src/sock_addr.h /usr/sr
 c/debug/lighttpd/1.4.70-r0/src/mod_sockproxy.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_date.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_etag.c /usr/src/debug/lighttpd/1.4.70-r0/src/fdevent.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_scgi.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_etag.h /usr/src/debug/lighttpd/1.4.70-r0/src/http_date.h /usr/src/debug/lighttpd/1.4.70-r0/src/fdevent.c /usr/src/debug/lighttpd/1.4.70-r0/src/sys-setjmp.c /usr/src/debug/lighttpd/1.4.70-r0/src/algo_md.h /usr/src/debug/lighttpd/1.4.70-r0/src/base_decls.h /usr/src/debug/lighttpd/1.4.70-r0/src/sys-setjmp.h /usr/src/debug/lighttpd/1.4.70-r0/src/http_chunk.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_range.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_chunk.h /usr/src/debug/lighttpd/1.4.70-r0/src/http_range.h /usr/src/debug/lighttpd/1.4.70-r0/src/fdevent_fdnode.c /usr/src/debug/lighttpd/1.4.70-r0/src/lighttpd-angel.c /usr/src/debug/lighttpd/1.4.70-r0/src/plugin.h /usr/src/debug/lighttpd/1.4.70-r0/src/algo_
 xxhash.h /usr/src/debug/lighttpd/1.4.70-r0/src/configfile.h /usr/src/debug/lighttpd/1.4.70-r0/src/server.c /usr/src/debug/lighttpd/1.4.70-r0/src/configfile.c /usr/src/debug/lighttpd/1.4.70-r0/src/plugin.c /usr/src/debug/lighttpd/1.4.70-r0/src/keyvalue.h /usr/src/debug/lighttpd/1.4.70-r0/src/data_config.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_auth_api.h /usr/src/debug/lighttpd/1.4.70-r0/src/keyvalue.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_auth_api.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_cgi.c /usr/src/debug/lighttpd/1.4.70-r0/src/fdlog.c /usr/src/debug/lighttpd/1.4.70-r0/src/buffer.h /usr/src/debug/lighttpd/1.4.70-r0/src/http_header.c /usr/src/debug/lighttpd/1.4.70-r0/src/fdlog.h /usr/src/debug/lighttpd/1.4.70-r0/src/mod_dirlisting.c /usr/src/debug/lighttpd/1.4.70-r0/src/http_cgi.h /usr/src/debug/lighttpd/1.4.70-r0/src/http_header.h /usr/src/debug/lighttpd/1.4.70-r0/src/buffer.c /usr/src/debug/lighttpd/1.4.70-r0/src/mod_authn_file.c /usr/src/debug/lighttpd/1.4.70-r0/src/
 mod_staticfile.c /usr/src/debug/lighttpd/1.4.70-r0/src/log.c /usr/src/debug/lighttpd/1.4.70-r0/src/chunk.h /usr/src/debug/lighttpd/1.4.70-r0/src/reqpool.h /usr/src/debug/lighttpd/1.4.70-r0/src/stat_cache.c /usr/src/debug/lighttpd/1.4.70-r0/src/reqpool.c /usr/src/debug/lighttpd/1.4.70-r0/src/chunk.c /usr/src/debug/lighttpd/1.4.70-r0/src/log.h /usr/src/debug/lighttpd/1.4.70-r0/src/stat_cache.h"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd-staticdev: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGSIZE changed from 449896 to 482664 (+7%)
packages/core2-32-poky-linux/lighttpd/lighttpd: PV changed from "1.4.69" to "1.4.70"
packages/core2-32-poky-linux/lighttpd/lighttpd: PKGV changed from 1.4.69 [default] to 1.4.70 [default]
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

--===============0391215845874200758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lighttpd: PACKAGES: removed "lighttpd-module-staticfile lighttpd-module-simple-vhost lighttpd-module-expire lighttpd-module-access lighttpd-module-redirect lighttpd-module-scgi lighttpd-module-alias lighttpd-module-rewrite lighttpd-module-setenv lighttpd-module-evhost lighttpd-module-fastcgi lighttpd-module-indexfile", added "lighttpd-module-h2"
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

--===============0391215845874200758==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lighttpd-upgrade-1.4.69-1.4.70.patch"

RnJvbSBhMTA2Mzk2YjViMGYxYTg3OTQ1ODMzOThhZDA5ZTRjNTgzMDZiYWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTQ6MzM6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWdodHRwZDogdXBncmFkZSAxLjQuNjkgLT4gMS40LjcwCgotLS0KIC4uLi9saWdodHRwZC97bGln
aHR0cGRfMS40LjY5LmJiID0+IGxpZ2h0dHBkXzEuNC43MC5iYn0gICAgICAgICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9saWdodHRwZC97bGlnaHR0cGRfMS40LjY5LmJiID0+IGxpZ2h0dHBk
XzEuNC43MC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGln
aHR0cGQvbGlnaHR0cGRfMS40LjY5LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpZ2h0dHBk
L2xpZ2h0dHBkXzEuNC43MC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjY5LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGlnaHR0cGQvbGlnaHR0cGRfMS40LjcwLmJiCmluZGV4IDg1
NzBkODVmNWUuLjM3ZThiZDI0NjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9s
aWdodHRwZC9saWdodHRwZF8xLjQuNjkuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xp
Z2h0dHBkL2xpZ2h0dHBkXzEuNC43MC5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0gImh0
dHA6Ly9kb3dubG9hZC5saWdodHRwZC5uZXQvbGlnaHR0cGQvcmVsZWFzZXMtMS40LngvbGlnaHR0
cGQtJHtQVn0udAogICAgICAgICAgICBmaWxlOi8vbGlnaHR0cGQgXAogICAgICAgICAgICAiCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxNmFjOGRiOTVlNzE5NjI5YmE2MTk0OWI5OWY4YTI2ZmVi
YTk0NmE4MWQxODUyMTViMjgzNzliYjQxMTZiMGI0IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjky
MWViZTFjZjRiNmI5ODk3ZTAzNzc5YWI3YTIzYTMxZjRiYTQwYTFhYmUyMDY3NTI1YzMzY2QzY2U2
MWZlODUiCiAKIERFUEVORFMgPSAidmlydHVhbC9jcnlwdCIKIAotLSAKMi4zOS4yCgo=

--===============0391215845874200758==--

