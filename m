Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E73CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:00:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.34345.1697187642003942217
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="124340982"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="124340982"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:00:39 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 79CFADB3C1
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:00:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BD178CF7E0
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:00:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02834E2513;
	Fri, 13 Oct 2023 18:00:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.71 -> 1.4.72
Date: Fri, 13 Oct 2023 17:00:21 +0800
Message-Id: <1697187621-4279-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--5.193900-10.000000
X-TMASE-MatchedRID: ohQ8wxNAJ8qjz0nOeth/yUIIxwDaU5mrMC4zO7d4kaN3de2OoBqgwnHF
	wqdDb8At2GcSxE3tAndPBLaVQOnK5lR/KlnDpLSl9DGkDtq4vAxiMNd0z/HZU2fIvzHS0qU7M7/
	9n64JCs3B/W04jWeQ81E86H2xYcJgsHB8MxLZOckD2WXLXdz+AcJd4cnAlxP2qgN67rC7tupsL1
	05BnWNp1ppNBoXxD2IMdSdJxe5grjBEHYItXXAwN9JA2lmQRNU9CFB7klVg4f3bBqxmjinTYT21
	TydM0U2PRqXmp3pdXUkWgzjjL/xlPTxGqS5mxwxr7+qhZS/khkxXH/dlhvLv7wHu+XsbkzRf6O+
	FEJQpgAgQ5uWQ5ToACoOCLtIuRbjoqesYRoqSFkAPmNKDWsW0Gvaomg0i4KNvitJf2NjlOyLVFt
	k3Um5KHEgSCXhPACUarXesAIfZaLLA1fnU7DN+mU28RZK6quGJF8tFEtOdquBvntZWq2wbZKPVS
	CA9cWVH7iboQD+7I4x0CtCS3QUqTsCJhP41l19jhXy0Khej9KWrxIsNZE6hzABh2rVVNejcLedU
	KcF/px+sBQK6fssAGJ3beXCjAYc1w4ROForRsa/mux8PsfamTqgoAg1K1vwz4sR3mj9P5f5foTZ
	VKB975xlcN+ug9B/GX1xEes5hvhrFdvBEmTnvD9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xL8FHrw
	7frlurwUHN2woBLB2HBbLQQJ2inFXmAqsdcFc6nHbeBu5LnlV4BnlVId1nZsoi2XrUn/JQYMORu
	DWAmTfaY87m2dqxyAHAopEd76vsdkSF2oJxQ+jN/O5pbjV/9wHedlk3avUa2rM4Ow0qYmBw2PY2
	85mCQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  * [core] save config read from stdin across restart
  * [core] warn if daemonize w/o absolute config path
  * [mod_dirlisting] send Link w/ external css or js
  * [mod_dirlisting] fix missing header/readme (fixes #3211)
  * [core] ignore coverity warning
  * [core] ignore coverity warning
  * [core] reqpool.c:request_set_con()
  * [core] request_init_data() minor optim
  * [core] request.c:request_pool_{push,pop}
  * Revert "[core] h2 http_request_parse_header() tweak"
  * [core] enable config conditions on HTTP/2 PRI
  * [mod_webdav] extend symlink support (non-standard)
  * [mod_extforward] fix extforward.params config opt
  * [mod_authn_ldap] fix config auth.require group=... (fixes #3216)
  * [core] set CON_STATE_READ_POST for HTTP/2 reqbody
  * [core] chunkqueue_read_squash() returns cq->first
  * [core] get body from cq at offset in chunk
  * [doc] update stbuehler address
  * [tests] use sha crypt for fastcgi auth environment tests
  * [tests] drop des-crypt and crypt-md5 auth tests - deprecated/not available on various platforms
  * [core] code size: xxhash XXH_NO_STREAM
  * [core] fdevent_sh_exec()
  * [mod_dirlisting] http_dirlist_auto_layout_early_hints()
  * [mod_dirlisting] send 103 w/ external css or js
  * [mod_dirlisting] json output for /<path>/?json
  * [mod_dirlisting] include ETag with cached result
  * [core] import xxHash v0.8.2
  * [tests] move %ENV modifications into forked child
  * [mod_ssi] init hctx->wq to init alt cq tempdirs
  * [tests] initialize request_st cqs in tests
  * [core] chunkqueue_env_tmpdir()
  * [core] config_set_defaults() reduce code size
  * [tests] use current perl interpreter path for env.PERL in lighttpd.conf
  * [mod_deflate] code reuse to create temp file
  * [core] skip pwrite() to temp file if 0 len write
  * [core] store cq->tempdirs in stack var
  * [core] remove tempdirs ptr from struct chunkqueue
  * [core] treat upload_temp_file_size=0 as default sz
  * [core] hide unused var on _WIN32 compiler warning
  * [mod_nss] nspr include prefix portability(attempt)
  * [CI] scripts/ci-build.sh arg consistency;add meson
  * [CI] remove wolfssl from autobuild; let rest build
  * [CI] remove NSS from autobuild; let rest build
  * [CI] remove mbedtls from autobuild; let rest build
  * [mod_nss] nspr include prefix portability(attempt)
  * [CI] ci-build.sh: adjust meson; add pam, maxminddb
  * [CI] ci-build.sh: fix typo --with-pam
  * [CI] remove maxminddb from autobuild,cmake; let rest build
  * [CI] ci-build.sh re-enable additional dependencies
  * [core] optimize for non-Range requests
  * [core] allow larger number of Ranges if sorted
  * [tests] test_http_range.c
  * [core] attempt to quiet coverity warning
  * [build] packdist.sh now produces .md for www.l.n
  * [core] disable keep-alive if HTTP/1.1 CL and TE
  * [core] reject empty Content-Length for HTTP/1.x
  * [core] reject uppercase in unrecognized HTTP/2 hdr
  * [core] warn dynamic mods listed before staticfile
  * [core] dev-only internal request state debugging
  * [core] short-circuit connection_state_machine_loop
  * [core] reset connection-level state at con level
  * [core] optim for non-throttle writes
  * [core] remove connection_handle_write HTTP/1.x opt
  * [core] yield writing large HTTP/1.x on slow device
  * [core] tighten h2_process_streams()
  * [core] h2_process_streams() simpler loop to retire
  * [core] http_response_physical_pathinfo()
  * [core] http_response_prepare() tweaks
  * [meson] Fix 'getoption' meson typo
  * [core] use different getxattr() prototype on MacOS
  * [mod_deflate] do not compress any 1xx status
  * [core] http_response_304(), http_response_412()
  * [core] add config option to reject pathinfo
  * [core] expand mimetype.assign builtin defaults
  * [core] mark some cold routines noinline
  * [core] add config opt to send GOAWAY for bad auth
  * [core] show_features() show inotify or kqueue
  * [core] stat_cache_refresh_entry()
  * [core] splaytree: use all 32-bits of hash value
  * [core] splaytree: compare keys directly
  * [core] splaytree: splaytree_splay_nonnull()
  * [core] stat_cache: stat_cache_sptree_ndx()
  * [multiple] use splaytree_splay_nonnull()
  * [h2] comment struct h2con h2_sid member is unused
  * [mod_openssl] disable DH auto if DHParameters set
  * [mod_openssl] replace deprecated openssl funcs
  * [core] splaytree: splaytree_delete_splayed_node()
  * [multiple] use splaytree_delete_splayed_node()
  * [core] splaytree: splaytree_insert_splayed()
  * [multiple] use splaytree_insert_splayed()
  * [core] _WIN32 fs_win32_readlinkUTF8() (#3223)
  * [mod_magnet] lighty.c.readlink() (fixes #3223)
  * [core] add config option to reject pathinfo
  * [mod_dirlisting] send 103 Early Hints only for h2+
  * [mod_webdav] reject non-identity Content-Encoding
  * [scons] include mod_h2 in static builds (fixes #3224)
  * [core] http_request_validate_pseudohdrs comment
  * [core] comment out redundant code
  * [core] reset addtl state b4 dynamic error handler
  * [core] reject Connection hdr in h2 as soon as seen
  * [mod_h2] process headers for debug
  * [mod_h2] comments and behavior for h2spec tests
  * [multiple] mark func __attribute_returns_nonnull__
  * [core] expand mimetype.assign builtin defaults
  * [core] warn if IPv6 socket not supported
  * [mod_simple_vhost,mod_evhost] check host strict
  * [mod_simple_vhost,mod_evhost] minor code transform
  * [mod_magnet] quiet 32-bit compiler warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
index 3959f88b98..87058719f9 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "b8b6915da20396fdc354df3324d5e440169b2e5ea7859e3a775213841325afac"
+SRC_URI[sha256sum] = "f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


