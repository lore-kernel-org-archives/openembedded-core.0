Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF82DC83005
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26244.1685610240244105072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118599334"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118599334"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82737CD7E1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:56 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A32E6D5B20
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id C3F9388851;
	Thu,  1 Jun 2023 18:03:54 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] lighttpd: upgrade 1.4.69 -> 1.4.71
Date: Thu,  1 Jun 2023 17:03:16 +0800
Message-Id: <1685610221-29015-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--9.558000-10.000000
X-TMASE-MatchedRID: CuF97AeNZaqjz0nOeth/yUIIxwDaU5mrqgfD4K0TFi3PixHeaP0/l43E
	akIoHWNd9GF0M6TbxPwvaeguP86NSBHIhFP89/z1SHCU59h5KrGDnmblFLAswk9kJVvPP+AkgVo
	qwS09PZZaVnPM5WIxz+oB0CEJugsQNQ8PpJIv6t51e7Xbb6Im2ncF/0kiqyh4h+COkGSdO5F1yy
	OjefcRRY4PdKLSI2eBulKl1NabNPvqlcL1cdvxj5ciNJzaqUX1jlRp8uau9oYCiXI7bHFUBT2xn
	wEa/vC69n6xBheV42zy3NHUi0it5fXNEkgZOg/O8G8CATEgS6alLADMASK8x+qPv6vI4LUsCynw
	lRtl8pif3fSLwuSR6ZoivvFVRdDkPOSvw+EpRpUgaafg6U60Iwv/9UzFeXITb3SJvQMX514djB1
	KZ6xMAD/tptSFn/ha/+S/yQLmqBBSN5j/GgtDwQ55FEYgJX09Y9ko4Ze3+hvONhUMZJakH13AY+
	lODtj70qz8LY8pKODRkrp47wnbLjbcBdSAvS61uce7gFxhKa0hBMJtJ3C24p8OacmNHZi70fQ69
	6+QqZl+oiL/xW+KNsyK5YNF2aoruDE3IDUSR5GV4tc/M7dU0WiatLqAxumkikvLPxTKpjhdh62X
	omCCb0AflWMrNL0Uw+vD7XNGaxwIvAiOB+JVcc69emDs42ddNi8L88UV9IC4GyTmeN+AbIRQJ08
	3LK5l4/E1xY60jUDOBTyZpi3ImTmpL9mXE1+sVtOGv6/35SVMkOX0UoduubKw8Hx0EGitcqfoMG
	P+CwQi+t+0AiFaYgB/8cibO8IYzA16DrgJTi6eAiCmPx4NwJuJ+Pb8n/VxLzP5snaeb1Qqtq5d3
	cxkNZUJ4/duyAWpw6vn54DUfiKZBZCfp/4/lq/cg3XnWuHQUZeC/hp86CE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182066

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
  * [mod_h2] HTTP/2 separate module; no longer builtin
  * [mod_magnet] fix static build using autoconf (fixes #3203)
  * [core] fix new use of posix_spawn with some glibc (fixes #3201)
  * [core] _WIN32 quiet compiler warnings 32-bit build
  * [core] check getaddrinfo EAI_ADDRFAMILY w/ glibc
  * [core] quiet lemon.c clang C2x warnings
  * [core] compile w/o posix_spawn() on iOS
  * [core] fix crash due to missing initialization (fixes #3207)
  * [core] request_init() separate static func
  * [multiple] remove some unused/redundant includes
  * [core] server.modules s/mod_compress/mod_deflate/
  * [core] preproc consistency #pragma GCC diagnostic
  * [core] update ls-hpack
  * [core] use empty value in srvconf.config_touched
  * [core] provide mimetype.assign default if unset
  * [mod_vhostdb_mysql] MySQL missing mysql_get_socket (fixes #3208)
  * [core] clarify comment
  * [autotools] chmod u+w configparser.c for lemon
  * [build] skip build separate modules for built-ins
  * [core] cache format secs for high prec errlog
  * [mod_maxminddb] check remote IP each request (fixes #3191)
  * [multiple] store ptrs to remote addr in request_st (#3192)
  * [mod_extforward] manage remote addr per request (fixes #3192)
  * [core] use C23 memset_explicit() were available
  * [mod_accesslog] %{mask}a to mask/anonymize IP
  * [core] cast to fix compiler error in prior commit
  * [scons] fix static build to include builtin_mods
  * [core] h2_recv_headers() tweak to reduce code size
  * [core] h2_get_stream_req() code reuse
  * [core] h2: remove obsolete comment
  * [core] h2 mark :status matching lsxpack enum value
  * [core] h2 match w/ lsxpack pseudo-header key only
  * [core] limit server.max-request-field-size <=65535
  * [core] permit shell HERE docs to specify config
  * [core] add members to http_header_parse_ctx
  * [mod_extforward] typo in comment
  * [mod_openssl] SSL_CTX_set_options() takes uint64_t
  * [core] reorder enum handler_t
  * [core] connection_handle_request_start_state()
  * [core] check chunk file open early in mmap viewadj (fixes #3197)
  * [core] h2 http_request_parse_header() tweak
  * [mod_extforward] recognize unix domain sockets (fixes #3198)
  * [mod_magnet] support ./configure --with-lua=luajit (#3199)
  * [core] remove instance of devel debug code
  * [core] quiet coverity warning
  * [core] connection_check_upgrade() h2_upgrade_h2c()
  * [core] CON_STATE_REQUEST_END transient state
  * [core] expose request_set_state() for internal use
  * [core] h2_send_goaway_graceful()
  * [core] h2_check_timeout()
  * [core] h2_process_streams()
  * [core] h2_recv_reqbody()
  * [core] HTTP_VERSION_3 enum value
  * [core] r->x union w/ structs for r->x.{h1}
  * [core] r->x union w/ structs for r->x.{h1,h2}
  * [core] http_dispatch[] tables for HTTP proto vers
  * [core] hxcon "base class" for h2con
  * [mod_h2] HTTP/2 module: mod_h2
  * [multiple] optimistic client read only if HTTP/1.x
  * [core] _WIN32 port compatibility headers
  * [core] _WIN32 impl of setenv(), unsetenv()
  * [multiple] _WIN32 protect code w/ HAVE_SYSLOG_H
  * [multiple] _WIN32 protect code w/ HAVE_FORK
  * [core] _WIN32 protect code w/ HAVE_IPV6
  * [multiple] _WIN32 protect code w/ HAVE_SYS_UN_H
  * [multiple] _WIN32 stat() compat sys-stat.h
  * [core] _WIN32 uid, gid compat
  * [core] _WIN32 signal-related compat
  * [multiple] _WIN32 misc compat
  * [core] _WIN32 minimal glob() impl for configfile.c
  * [core] _WIN32 use gmtime_s(), localtime_s()
  * [mod_dirlisting] _WIN32 Find*File()
  * [multiple] _WIN32 Find*File() sys-dirent.h
  * [core] _WIN32 sys-unistd.h to wrap <unistd.h>
  * [core] _WIN32 sys-wait.h to wrap <sys/wait.h>
  * [core] _WIN32 implementation of socketpair()
  * [core] _WIN32 fdevent_createprocess()
  * [core] _WIN32 socket-compat, filesystem-compat
  * [core] _WIN32 check WSAGetLastError() w/ sockets
  * [mod_cgi] _WIN32 use socketpair instead of pipe
  * [core] _WIN32 clock ticks and time
  * [core] _WIN32 alternative fdarray for Windows
  * [core] _WIN32 basic (very limited) getopt() impl
  * [tests] _WIN32 fcgi-responder.c, scgi-responder.c
  * [core] _WIN32 rename __WIN32 to _WIN32
  * [core] _WIN32 casts to quiet some VS warnings
  * [tests] _WIN32 use TMPDIR (or TEMP) for test files
  * [build] _WIN32 mingw build
  * [multiple] __MINGW32__ missing strftime() "%F %T"
  * [tests] _WIN32 adjustments in LightyTest.pm
  * [core] _WIN32 reset std streams at startup
  * [core] _WIN32 log_perror() with GetLastError()
  * [core] _WIN32 log_serror() for WSAGetLastError()
  * [core] _WIN32 use log_serror() for WSAGetLastError
  * [core] _WIN32 use rand_s() to init pseudo RNG
  * [core] _WIN32 fdevent_kill()
  * [multiple] _WIN32 use fdevent_kill()
  * [core] _WIN32 stat(), '/' and '\\' adjustments
  * [tests] _WIN32 cygwin test support
  * [mod_deflate] _WIN32 disable deflate.cache-dir
  * [mod_dirlisting] _WIN32 close files before unlink
  * [tests] _WIN32 close files before unlink
  * [core] _WIN32 close chunk temp files before unlink
  * [core] _WIN32 prefer WSAPoll()
  * [core] _WIN32 lighttpd winsvc
  * [core] _WIN32 custom fs funcs on UTF-8 paths
  * [core] _WIN32 scream UTF-8 at MS (does not matter)
  * [cmake] _WIN32 build more mods with BUILD_STATIC
  * [cmake] _WIN32 remove older build config
  * [core] _WIN32 use WSASend for writev-equiv on sock
  * [meson] static build option under cygwin
  * [build] _WIN32 __declspec(dllexport) *_plugin_init
  * [build] _WIN32 shared dll build (autotools, cmake)
  * [tests] _WIN32 skip time-sensitive tests during CI
  * [core] use posix_spawn() where available
  * [mod_cgi] comment about caching target dirname
  * [meson] update comment with build flags
  * [meson] check FORCE_{WOLFSSL,MBEDTLS}_CRYPTO
  * [mod_auth] warn if auth.require path never matches
  * [core] h1.[ch] collect some HTTP/1.x specific code
  * [core] noinline connection shutdown, reset
  * [TLS] $SERVER["socket"] inherit global ssl.engine
  * [mod_proxy] match "map-host-response" "-" w/ Host
  * [core] noinline stat_cache_sptree_find()
  * [core] rename http_kv funcs, reorder http_versions
  * [mod_cgi] move fd count to cgi_create_env()
  * [mod_cgi] reduce code size
  * [mod_cgi] do not issue trace if CGI closes input
  * [mod_cgi] cgi_create_err() cold err handling func
  * [core] always decr fd count upon socket close()
  * [mod_mbedtls] check MBEDTLS_DEBUG_C for debug func
  * [core] return pid_t from fdevent_waitpid()
  * [core] _WIN32 compile fix
  * [meson] build fix for builtin_mods
  * [core] move some shared funcs to call from modules
  * [build] move some files to call from modules
  * [mod_cgi] doubly-linked list of CGI pids
  * [mod_cgi] reuse fd already opened to /dev/null
  * [mod_cgi] reset upload_temp_file_size in CGI close
  * [tests] copy confs for running tests in alt dir
  * [scons] avoid dup mod_h2 module in static build
  * [autoconf] include fs_win32.h in hdrs for dpkg
  * [build] ifdef _WIN32 before include fs_win32.h
  * [mod_openssl] SSL_OP_ENABLE_KTLS_TX_ZEROCOPY_SENDFILE
  * [mod_dirlisting] _WIN32 fix fstat() after close()
  * [core] quiet coverity warning
  * [mod_openssl] FreeBSD: check "kern.ipc.tls.enable"
  * [core] fix HTTP/2 use of http_response_loop()
  * [mod_openssl] check kernel support for KTLS
  * [core] posix_spawnattr_setcwd_np() on QNX
  * [core] posix_spawn_file_actions_addclosefrom_np()
  * [core] Mac OS POSIX_SPAWN_CLOEXEC_DEFAULT
  * [core] modify use of posix_spawnattr_setsigdefault
  * [mod_dirlisting] _WIN32 compile fix
  * [core] fdevent_load_file() check if limit exceeded
  * [tests] tests/prepare.sh comment w/ alt build root
  * [core] treat mod_h2 as built-in module (for now)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lighttpd/{lighttpd_1.4.69.bb => lighttpd_1.4.71.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.69.bb => lighttpd_1.4.71.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.69.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.69.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
index 8570d85f5e..abab88aa44 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.69.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "16ac8db95e719629ba61949b99f8a26feba946a81d185215b28379bb4116b0b4"
+SRC_URI[sha256sum] = "b8b6915da20396fdc354df3324d5e440169b2e5ea7859e3a775213841325afac"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.34.1


