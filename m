Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B20FC433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 00:12:19 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.605.1643069530944930551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 16:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=f7k0yoNy;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643069529; i=@fujitsu.com;
	bh=xI5N6fYt3vLsF25V8n/Ab0fmb9D54xN84ykxmqjTMYc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=f7k0yoNyjsmymsuuFjiaUlTUHzTC/dVtLno7W4HI6Lvg/07vpFeag+Thh/1Sc7QkB
	 6lsgH1lISIn1Z/2GieV2QTkHFtfSaPYK0makaWrrK6yLQwZY6gujAH/XR10D8MLBPB
	 Hu7o+96HiJdhTlh4A/Al6FTu3Y1Ym0RMX6CX/NWMLTUsiwiDmEhhcfrtMRe+ZQRkp2
	 EhldtGoE0hZZXYd299obmiBumNxzuMHlbAhyZurf3J3n1DSwQplFiaU+Rcjm0ixOy4
	 5eBoRPFtj7Z4fipt+Vq4Em/4yEsn3mnpAf9HZLYPwDQ6bvLq1BBCA1udUHSnNHJsaO
	 BkDJ00czAVeWw==
Received: from [100.115.38.159] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id A9/63-29321-8504FE16;
 Tue, 25 Jan 2022 00:12:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSTfC4X2
  iwY9/HBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bMI3vZC3bEVey79Yu1gXFOYBcjJ4eQwGNG
  ia//c7sYuYDs80wS6xres0A4Jxglfqy8zQxSxSagJjH91g3WLkYODhEBPYmr/0RBwswCKhIvf
  vewg9jCArYS2/f0MILYLAKqEt8aNrGA2LwCjhIPVtxnArElBBQkpjx8DzaSU8BJ4uiEdlaIIx
  wltsyYygZRLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6QmDWrDWqmmsTVc5uYJzAKzkLSPgt
  J+wJGplWM1klFmekZJbmJmTm6hgYGuoaGprrGxrqG5pZ6iVW6iXqppbrlqcUlukZ6ieXFeqnF
  xXrFlbnJOSl6eaklmxiBQZxSrLh5B+PElT/1DjFKcjApifIaW71PFOJLyk+pzEgszogvKs1JL
  T7EKMPBoSTBe9wGKCdYlJqeWpGWmQOMKJi0BAePkgjvSTugNG9xQWJucWY6ROoUoy7H65afO5
  iFWPLy81KlxHm7DIGKBECKMkrz4EbAovsSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeDpB
  VPJl5JXCbXgEdwQR0xO/z70COKElESEk1MBnll8TuNtHsiDY6pN+9/9mDE3JfTNf0R79aYXDi
  Y6Lv13rP06zqWp6z7/76aN1Yl3Hq7n7rnJ7wRKWXQu8SGz9OOOu4eZ+P0f81vsHtk6f9PHn7a
  8dbycAHVrsedK/ffvH8hyN5pm3nvizzTeX5pb7++aebriJbeHqNAu4qz33zuLOT/831EyJv/k
  dEPYtar6b5ZtOis9ErrjM7eb0pX3/1ZOb+aZ/2bG48eG3jljs31BoZYuNmn3A2PPaTL8v4W9m
  zN/ssZlrdD3dYaZG0VdumhuvUvJ1/jT4pvFMUvjzva/CLBSwVNWdkm43dn7Xk1uw71jDt2PsJ
  +wNsCjx/+eb8P5d2Mf+adPyEY2nzZRY+UGIpzkg01GIuKk4EAA1pyldpAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1643069527!35716!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11585 invoked from network); 25 Jan 2022 00:12:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 00:12:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AFC8B100353
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A15EC10033A
	for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 00:12:07 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 00:11:48 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.63 -> 1.4.64
Date: Tue, 25 Jan 2022 08:11:34 +0800
Message-ID: <1643069496-5684-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
References: <1643069496-5684-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 00:12:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160906

0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
removed since it's included in 1.4.64.

with_gdbm, with_memcached
removed since they're not applicable in 1.4.64. 

Changelog:
=========
Important changes
 remove deprecated modules, bugfixes, CVE-2022-22707 (rare configs)

Behavior Changes
 (previously announced and scheduled)

 -graceful restart/shutdown timeout changed from 0 (disabled) to 8 seconds
  configure an alternative with:
  server.feature-flags += ("server.graceful-shutdown-timeout" => 8)
  build: lighttpd defaults to -with-pcre2 instead of -with-pcre
  pcre2 is current. pcre is no longer maintained.
  Explicitly specify -with-pcre in build to use pcre instead of pcre2.
 -deprecated modules (previously announced) have been removed
  mod_authn_mysql
  mod_mysql_vhost
  mod_cml
  mod_flv_streaming
  mod_geoip
  mod_trigger_b4_dl
  https://wiki.lighttpd.net/Docs_ConfigurationOptions#Deprecated
  suggests migration steps for replacements, if needed

Changes from 1.4.63
 [core] fix trace issued for loading mod_auth (fixes #3121)
 [meson] need -lrt with glibc < 2.17 (fixes #3120)
 [core] adjust time jump detection (fixes #3123)
 [core] make setrlimit() warn, not fatal
 [core] add remote IP to some error msgs (fixes #3122)
 [mod_webdav] If-None-Match on non-existent entity
 [build] check getxattr before attr_get and -lattr
 [doc] SELinux: setsebool -P httpd_setrlimit on
 [build] create sha512sum file with release
 [build] CI builds now use make -j 2
 [core] http_response_send_file() takes const path
 [core] use ETag response header to check cachable
 [core] add more const to stat_cache_update_entry()
 [multiple] remove r->physical.etag
 [mod_magnet] interface to http_response_send_file
 [build] add headers for sendfile() detect on MacOS
 [core] http_response_write_prepare optimization
 [core] define static_assert for uClibc (fixes #3127)
 [build] -Wno-implicit-fallthrough for ls-hpack
 [core] ignore pcre2 "bad JIT option" warning
 [build] pcre2: use pkg-config before pcre2-config
 [core] http_response_has_error_handler()
 [core] consolidate request restart loop check
 [core] defer retrieving Last-Modified until needed
 [mod_dirlisting] fix logic inversion in cache
 [core] mark expect cond in http_response_send_file
 [core] connection_handle_read_state() tweak
 [core] connection_state_machine_loop() tweaks
 [core] connection_state_machine_h2() tweaks
 [core] quiet coverity noise
 [core] use lower limit for max-fds if !setrlimit
 [build] do not check for prctl; HAVE_PRCTL unused
 [core] server.core-files support on FreeBSD (fixes #3128)
 [mod_extforward] support longer PROXY v2 TLV vec
 [mod_webdav] detect truncated copy_file_range()
 [mod_webdav] copy_file_range() new in FreeBSD 13
 [mod_webdav] copy_file_range() new in FreeBSD 13
 [build] feature consistency between build types
 [build] cmake build now defaults to C11
 [core] CCRandomGenerateBytes() for rand on macOS (fixes #3129)
 [multiple] remove long-deprecated modules
 [build] default -with-pcre2 unless -with-pcre
 [core] "server.graceful-shutdown-timeout" => 8
 [build] adjust trace for regex-conditionals
 [build] update tests/SConscript
 [core] errno_t detection on Illumos
 [build] cmake build now defaults to C11
 [build] meson: find pcre2 w/o pkg-config
 [core] define EXTENSIONS on Illumos
 [build] cmake,meson socket libs for win32, Illumos (fixes #3130)
 [core] hide bsd_accept_filter code on OpenBSD (fixes #3131)
 [core] errno_t and rsize_t detection on Illumos
 [mod_webdav] copy acceleration
 [mod_webdav] define HAVE_RENAMEAT2 earlier
 [build] meson misdetects mempcpy on some platforms
 [build] cmake: skip "-Wl,-export-dynamic" Illumos
 [build] adjust .gitignore for macOS
 [build] meson crypt and dl detection on *BSD (fixes #3133)
 [core] /dev/null is a symlink on Illumos (fixes #3132)
 [core] server.core-files support for solaris (fixes #3135)
 [build] feature consistency between build types
 [build] Haiku build fix (fixes #3136)
 [lemon] silence coverity warnings
 [cmake] raise minimum version to 3.7
 [cmake] add address/undefined sanitize compile options
 [asan tests] fix memory leaks
 [array] use speaking names for array "fn" vtables for better debugging experience
 [ci] add cmake-asan build type
 [core] buffer_copy_string() use "" if s is NULL
 [mod_authn_gssapi] code reuse: fdevent_mkostemp()
 [mod_authn_gssapi] reduce KRB5CCNAME mem alloc
 [build] adjust help strings for pcre2 default
 [core] (const char *) for srvconf.modules_dir
 [multiple] remove buffer_init_string()
 [multiple] remove buffer_init_buffer()
 [mod_extforward] fix out-of-bounds (OOB) write (fixes #3134)
 [build] use -fstack-protector-strong w/ extra warn
 [build] collect Sun-specific headers and funcs
 [build] collect Sun-specific headers and funcs
 [build] rm redundant check for -lnetwork on Haiku
 [build] check headers before some funcs
 [core] allow LISTEN_PID to be ppid if TRACEME (fixes #3137)
 [core] allow tests/tmp/bind.conf override (#3137)
 [mod_webdav] no sys/ioctl.h on _WIN32
 [tests] _WIN32 adjustments in LightyTest.pm
 [tests] revert _WIN32 adjustments in LightyTest.pm
 [mod_gnutls] lift size check out of DN loop
 [mod_mbedtls] lift size check out of DN loop
 [mbedtls] save (mbedtls_ssl_config *) in hctx
 [multiple] permit UTF-8 in SSL_CLIENT_S_DN_*
 [mod_openssl] do not esc UTF-8 in cert subject
 [mod_mbedtls] reconstruct SSL_CLIENT_S_DN
 [mod_mbedtls] changes to build with mbedtls 3.0.0
 [mod_mbedtls] remove use of out_left in mbedtls 3
 [mod_mbedtls] mbedtls_ssl_conf_groups for 3.1.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ix-out-of-bounds-OOB-write-fixes-313.patch | 97 -------------------
 ...{lighttpd_1.4.63.bb => lighttpd_1.4.64.bb} |  5 +-
 2 files changed, 1 insertion(+), 101 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.63.bb => lighttpd_1.4.64.bb} (91%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch b/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
deleted file mode 100644
index f4e93d1065..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-Upstream-Status: Backport
-CVE: CVE-2022-22707
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 27103f3f8b1a2857aa45b889e775435f7daf141f Mon Sep 17 00:00:00 2001
-From: povcfe <povcfe@qq.com>
-Date: Wed, 5 Jan 2022 11:11:09 +0000
-Subject: [PATCH] [mod_extforward] fix out-of-bounds (OOB) write (fixes #3134)
-
-(thx povcfe)
-
-(edited: gstrauss)
-
-There is a potential remote denial of service in lighttpd mod_extforward
-under specific, non-default and uncommon 32-bit lighttpd mod_extforward
-configurations.
-
-Under specific, non-default and uncommon lighttpd mod_extforward
-configurations, a remote attacker can trigger a 4-byte out-of-bounds
-write of value '-1' to the stack. This is not believed to be exploitable
-in any way beyond triggering a crash of the lighttpd server on systems
-where the lighttpd server has been built 32-bit and with compiler flags
-which enable a stack canary -- gcc/clang -fstack-protector-strong or
--fstack-protector-all, but bug not visible with only -fstack-protector.
-
-With standard lighttpd builds using -O2 optimization on 64-bit x86_64,
-this bug has not been observed to cause adverse behavior, even with
-gcc/clang -fstack-protector-strong.
-
-For the bug to be reachable, the user must be using a non-default
-lighttpd configuration which enables mod_extforward and configures
-mod_extforward to accept and parse the "Forwarded" header from a trusted
-proxy. At this time, support for RFC7239 Forwarded is not common in CDN
-providers or popular web server reverse proxies. It bears repeating that
-for the user to desire to configure lighttpd mod_extforward to accept
-"Forwarded", the user must also be using a trusted proxy (in front of
-lighttpd) which understands and actively modifies the "Forwarded" header
-sent to lighttpd.
-
-lighttpd natively supports RFC7239 "Forwarded"
-hiawatha natively supports RFC7239 "Forwarded"
-
-nginx can be manually configured to add a "Forwarded" header
-https://www.nginx.com/resources/wiki/start/topics/examples/forwarded/
-
-A 64-bit build of lighttpd on x86_64 (not known to be affected by bug)
-in front of another 32-bit lighttpd will detect and reject a malicious
-"Forwarded" request header, thereby thwarting an attempt to trigger
-this bug in an upstream 32-bit lighttpd.
-
-The following servers currently do not natively support RFC7239 Forwarded:
-nginx
-apache2
-caddy
-node.js
-haproxy
-squid
-varnish-cache
-litespeed
-
-Given the general dearth of support for RFC7239 Forwarded in popular
-CDNs and web server reverse proxies, and given the prerequisites in
-lighttpd mod_extforward needed to reach this bug, the number of lighttpd
-servers vulnerable to this bug is estimated to be vanishingly small.
-Large systems using reverse proxies are likely running 64-bit lighttpd,
-which is not known to be adversely affected by this bug.
-
-In the future, it is desirable for more servers to implement RFC7239
-Forwarded.  lighttpd developers would like to thank povcfe for reporting
-this bug so that it can be fixed before more CDNs and web servers
-implement RFC7239 Forwarded.
-
-x-ref:
-  "mod_extforward plugin has out-of-bounds (OOB) write of 4-byte -1"
-  https://redmine.lighttpd.net/issues/3134
-  (not yet written or published)
-  CVE-2022-22707
----
- src/mod_extforward.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mod_extforward.c b/src/mod_extforward.c
-index ba957e04..fdaef7f6 100644
---- a/src/mod_extforward.c
-+++ b/src/mod_extforward.c
-@@ -715,7 +715,7 @@ static handler_t mod_extforward_Forwarded (request_st * const r, plugin_data * c
-         while (s[i] == ' ' || s[i] == '\t') ++i;
-         if (s[i] == ';') { ++i; continue; }
-         if (s[i] == ',') {
--            if (j >= (int)(sizeof(offsets)/sizeof(int))) break;
-+            if (j >= (int)(sizeof(offsets)/sizeof(int))-1) break;
-             offsets[++j] = -1; /*("offset" separating params from next proxy)*/
-             ++i;
-             continue;
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.64.bb
similarity index 91%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.64.bb
index 6359310772..8d2e77e011 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.63.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.64.bb
@@ -14,13 +14,12 @@ RRECOMMENDS:${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
-           file://0001-mod_extforward-fix-out-of-bounds-OOB-write-fixes-313.patch \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "2aef7f0102ebf54a1241a1c3ea8976892f8684bfb21697c9fffb8de0e2d6eab9"
+SRC_URI[sha256sum] = "e1489d9fa7496fbf2e071c338b593b2300d38c23f1e5967e52c9ef482e1b0e26"
 
 DEPENDS = "virtual/crypt"
 
@@ -39,8 +38,6 @@ PACKAGECONFIG[zlib] = "-Dwith_zlib=true,-Dwith_zlib=false,zlib"
 PACKAGECONFIG[bzip2] = "-Dwith_bzip=true,-Dwith_bzip=false,bzip2"
 PACKAGECONFIG[webdav-props] = "-Dwith_webdav_props=true,-Dwith_webdav_props=false,libxml2 sqlite3"
 PACKAGECONFIG[webdav-locks] = "-Dwith_webdav_locks=true,-Dwith_webdav_locks=false,util-linux"
-PACKAGECONFIG[gdbm] = "-Dwith_gdbm=true,-Dwith_gdbm=false,gdbm"
-PACKAGECONFIG[memcache] = "-Dwith_memcached=true,-Dwith_memcached=false,libmemcached"
 PACKAGECONFIG[lua] = "-Dwith_lua=true,-Dwith_lua=false,lua"
 PACKAGECONFIG[zstd] = "-Dwith_zstd=true,-Dwith_zstd=false,zstd"
 
-- 
2.25.1


