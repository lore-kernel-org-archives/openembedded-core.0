Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1A5C6FA86
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 19:11:06 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web09.1210.1663182661812950993
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EXpp5UqL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id k21so5545455pls.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 12:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=HrDQT5XzVkhh15cwyVSpKBjVtMfEhHb6RBIwXXcsu68=;
        b=EXpp5UqLgckqzQtbFseAWM9YoM4pVerV0pnllKNPdgVfJjTUOVzkaM3CsQJNVycNTa
         Q6zyWznt6z80VyXFoaVfE7G793WTzpu7bF2TXny1b3TMXpS9g66wKSbgE54bCYTiix3h
         u3r6rqsOpYoJOGGB0Bz16+o6PtyuQiJWuDUT7nKBaepBmA5gTwhGK+7/2kIUFslT/tk2
         bG3QdIGKWDqs8p3cegU8gJHODoCQYa1XLWWAqTuUBmiR/vTjdhoZeoqTM1yqpv7a4+Nn
         EHaZHLMXIKU60wh7YM1bufjvoz//rfcn1AMSw2j7QX8UoiWk82oJqGqvyZeAyo81InIG
         ZIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=HrDQT5XzVkhh15cwyVSpKBjVtMfEhHb6RBIwXXcsu68=;
        b=5yp7V6KkIRKB+K3LWP5nWGbQUWyJ9flZbPwsyakfAvQuuzHSPP7mtTc7inCe/ewxt1
         DA6AluytCXtcxlS3uvcJa+QaD3sZ4t8o1pCM0nWolskmYVU0EDlOfllGW6nvxf/uvPez
         kkjs1VkBlksdtxzt9fevDWLaYIhKtWzlrVQWk0E97Uy1OgWU20dSpK5uTeWrvPgj8qTC
         nLP7nWn4c4nod0+Zt/bPylpqG/7zaVKFRbeV2/uAWItCex0zaId7dP5+f+0Tj62rp1pa
         cglYU5149vYti8s1ho1Pv7klbqMvrvXKNpY1px09nKUB14dmzVr6DKx09ZH15d9STnTj
         hJ3g==
X-Gm-Message-State: ACrzQf2krzkZRliR7CRyK8W2yQ6yAtfTUAnauOuKemWjkbCgMuhOnwvq
	/4AUR2hOEJNtcOBqMhN3xLuGTCe5YQxT6l5/
X-Google-Smtp-Source: 
 AMsMyM5FSJhkdXr8egoUtP05EEbBnbQTD/3eaDtumPC2g5ZyASza/v51XDkESWHjW4VCrcnNvefHkA==
X-Received: by 2002:a17:902:6549:b0:178:12e9:8d7b with SMTP id
 d9-20020a170902654900b0017812e98d7bmr470803pln.14.1663182660565;
        Wed, 14 Sep 2022 12:11:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w14-20020aa7954e000000b00535e950aa28sm10551156pfq.131.2022.09.14.12.10.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 12:11:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] lighttpd: upgrade 1.4.64 -> 1.4.65
Date: Wed, 14 Sep 2022 09:10:31 -1000
Message-Id: 
 <da8fc1ce551be05f7745175ea52a8e7ee401b054.1663182524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663182524.git.steve@sakoman.com>
References: <cover.1663182524.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 19:11:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170671

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
  * [build] meson: fix typo in variable name
  * [build] autoconf: report if building with zstd
  * [build] meson -Dlua_version=... to specify lua ver
  * [core] avoid CCRandomGenerateBytes on MacOS <10.12 (fixes #3140)
  * [core] use diff var name w/ CCRandomGenerateBytes (fixes #3141)
  * [core] parse conf cmds with SHELL or /bin/sh
  * [core] fix HMAC with openssl 3.0
  * [mod_webdav] no COPYFILE_CLONE_FORCE on OSX <10.12 (fixes #3142)
  * [mod_deflate] fix to return 304 with If-None-Match (fixes #3143)
  * [core] Illumos epoll incompatible w/ lighttpd impl
  * [core] feature flag to allow Range w/ HTTP/1.0
  * [mod_mbedtls] set usekeysize for mbedtls 3.2.0+
  * [mod_deflate] collect mmap code
  * [mod_deflate] prototype using libdeflate w/ mmap
  * [mod_deflate] --with-libdeflate to use libdeflate
  * [mod_deflate] mark input bytes const
  * [core] sys-setjmp.[ch]
  * [mod_magnet] check lighty.result.content b4 setjmp
  * [core] include guard consistency in sys-time.h
  * [core] network_write_file_chunk_remap separate fn
  * [multiple] use new sys_setjmp_eval3() interface
  * [multiple] pedantic chunk.c checks for 0-len chunk
  * [multiple] shared code for struct chunk and mmap
  * [mod_deflate] use pread if available
  * [mod_deflate] improve loop compressing file chunk
  * [core] prep server_tag at startup for h2 resp hdr
  * [mod_magnet] defer req_env init unless needed
  * [mod_magnet] reset after error attaching content
  * [mod_magnet] lua_tointegerx() avoids raising error
  * [mod_mbedtls] use newer mbedtls 3.2.0+ interfaces
  * [mod_magnet] adjust hot path for more inlining
  * [mod_magnet] collect chk for magnet lua_State init
  * [mod_magnet] use type returned from lua_getfield()
  * [core] chunk_file_pread() to wrap pread()
  * [core] disable keep-alive if forcing HTTP/1.0 resp
  * [mod_magnet] use lua_getextraspace() to store r
  * [core] fall back to getauxval(AT_RANDOM), if avail
  * [mod_magnet] keep message handler on stack
  * [doc] update external links
  * [mod_magnet] pass lighty table index, defer pops
  * [mod_magnet] clear and reuse script-env table
  * [mod_magnet] clear stack when reloading script
  * [mod_magnet] use lua_isnoneornil() in interfaces
  * [mod_magnet] fix lighty.c.cookie_tokens()
  * [mod_magnet] fix lighty.c.urldec_query()
  * [mod_magnet] remove duplicated NULL checks
  * [mod_magnet] adjust magnet_lighty_result_get()
  * [mod_magnet] magnet_tmpbuf_acquire(),release()
  * [mod_magnet] lighty.c.quotedenc(),dec() funcs
  * [mod_magnet] fix header,content legacy table clear
  * [mod_cgi] cgi.local-redir request_reset thru fnptr
  * [core] isolate plugins_*() funcs to main server
  * [mod_wolfssl] wolfssl v5.0.0 defines DH_set0_pqg()
  * [mod_auth] save letter-case diff in require config
  * [mod_magnet] magnet_push_quoted_string shared code
  * [mod_magnet] lighty.c.header_tokens convenience fn
  * [core] fill in un.sun_path after accept() (fixes #3147)
  * [mod_extforward] adjust trust check for HTTP/2
  * [mod_proxy] adjust handling of legacy X-* headers
  * [core] permit env w/ blank value (fix regression)
  * [TLS] consistent debug.log-ssl-noise config type
  * [mod_magnet] allow removal of req_env elt via nil
  * [core] compiler workarounds for very old gcc,glibc
  * [mod_mbedtls] use newer mbedtls 3.2.0+ interfaces
  * [mod_ssi] check http_chunk_transfer_cqlen for err
  * [core] chunkqueue_steal() handle unexpected 0 len
  * [core] discard DATA from REFUSED_STREAM at h2 init
  * [multiple] WebSockets over HTTP/2 (fixes #3151)
  * [multiple] immed connect to backend for streaming
  * [core] ensure socket ready before checking connect
  * [core] reduce trace on Upgrade backend connection
  * [core] adjust when TCP_CORK used on TLS connection
  * [mod_cgi] disable input optim if might Upgrade
  * [mod_cgi] immed start CGI if Upgrade
  * [mod_wolfssl] wolfssl v5.0.0 adds ASN1_TIME_diff()
  * [mod_openssl] libressl v3.5.0 adds ASN1_TIME_diff
  * [TLS] warn if leaf cert read is inactive/expired
  * [core] stricter conformance w/ upcoming HTTP/2 rev
  * [build] -D_DEFAULT_SOURCE consistency in builds
  * [mod_extforward] support addtl IPv6 syntax w/ "[]"
  * [core] build fix for cygwin and lmingw
  * [core] short-circuit earlier parsing h2 trailers
  * [core] reformat h2.h for cleaner enum additions
  * [core] consolidate trace for log-state-handling
  * [core] request_config bitmasks for smaller struct
  * [core] prefix (=^), suffix (=$) config conditions (fixes #3153)
  * [core] tighten config parsing loop
  * [core] convert simple config cond regex to pre/sfx
  * [tests] able to run tests when built w/o pcre
  * [core] allow redirect,rewrite ext subst w/o pcre
  * [mod_sockproxy] reset http vers, avoid rare crash (fixes #3152)
  * [core] HTTP/2 PRIORITY_UPDATE frame (experimental)
  * [core] send HTTP/2 SETTINGS_NO_RFC7540_PRIORITIES
  * [core] stricter check of HTTP/2 GOAWAY frame size
  * [mod_mbedtls] use newer mbedtls 3.2.0+ interfaces
  * [mod_webdav] opt for partial PUT via copy/rename
  * [core] quiet compiler warning
  * [multiple] recognize HTTP QUERY method
  * [multiple] limit scope of socket config options
  * [core] fix config typo reading large int from str
  * [core] h2 prio sort urgency, incr, then stream id
  * [core] send Priority resp hdr w/ .css, .js re-prio
  * [multiple] reset http vers, avoid rare crash (fixes #3152)
  * [core] delay response to http auth invalid creds
  * [core] connection_state_machine_h2 only if con->h2
  * [core] default server.max-keep-alive-requests 1000
  * [mod_magnet] set script env in func first upvalue
  * [mod_magnet] rewrite lighty.r as table of userdata
  * [mod_status] con->h2 instead of r->http_version
  * [mod_setenv] cleanup user-provided hdr sloppiness
  * [core] remove func decls duplicated in plugin.h
  * [mod_status] fix counting of HTTP/2 bytes written
  * [mod_magnet] no local server port on unix domain
  * [mod_extforward] unix domain socket pedantic chks
  * [core] sketch support for abstract sockets
  * [mod_magnet] magnet_plugin_stats_table() fn
  * [mod_magnet] magnet_script_setup_global_state() fn
  * [mod_magnet] lighty.server.* table w/ new function
  * [mod_accesslog] do not double-count hdr len in %I
  * [mod_magnet] reduce magnet_env_get_id() scanning
  * [mod_magnet] tighten magnet_env_get_buffer_by_id()
  * [mod_status] reusable code for r->state strings
  * [core] reusable code for r->state strings
  * [mod_magnet] expose r->state to lua scripts
  * [mod_magnet] tighten magnet_env_set()
  * [mod_magnet] lighty.r.req_item[] accessors
  * [mod_magnet] expose r->keep_alive to lua scripts
  * [mod_magnet] lighty.c.hrtime high-resolution time
  * [mod_magnet] lighty.r.resp_body.get
  * [mod_magnet] deprecate r.req_attr["response.*]
  * [mod_magnet] separate funcs for uri_path_raw
  * [mod_magnet] lighty.c.stat high precision time
  * [mod_magnet] format multiline err traceback
  * [mod_magnet] adjust p->conf.stage checks
  * [mod_magnet] further isolate legacy API result tbl
  * [core] buffer_append_char() convenience func
  * [mod_accesslog] accesslog.escaping = "json"
  * [multiple] use buffer_append_char()
  * [mod_accesslog] remove begin/end tags from %{}t
  * [core] fix configparser_simplify_regex() comment
  * [multiple] simplify bytes_in/bytes_out accounting
  * [mod_accesslog] reorder fields in switch()
  * [core] remove unused srv->con_* counters
  * [mod_magnet] read-only access to r->server_name
  * [core] buffer_append_bs_escaped()
  * [core] buffer_append_string_c_escaped ASCII optim
  * [mod_magnet] backspace-escape encode/decode
  * [mod_status] display HTTP/2 control stream w/ reqs
  * [multiple] use preferred syntax for Content-Type
  * [doc] regenerate doc/config/conf.d/mime.conf
  * [multiple] rename status_counter -> plugin_stats
  * [core] feature-flag server.metrics-high-precision
  * [mod_magnet] quiet coverity false positive
  * [mod_wolfssl] compile fix for OpenWRT
  * [mod_webdav] If-None-Match: * on non-existent
  * [mod_magnet] r.req_body .collect .get .set .add
  * [mod_cgi] fix detection of failing error handler (fixes #3157)
  * [core] "url-invalid-utf8-reject" normalization opt
  * [mod_magnet] skip req body collect warn if modsec3
  * [build] update descriptions to remove old lua ver
  * [core] use current dir if context->basedir blank
  * [multiple] application/javascript text/javascript
  * [core] reset internal flags after graceful restart
  * [TLS] inherit ssl.engine from global scope
  * [core] avoid server.use-ipv6 warning after SIGUSR1
  * [mod_webdav] alt handling PROPFIND on collection
  * [mod_mbedtls] fix crt chain construction logic
  * [core] h2 SETTINGS_INITIAL_WINDOW_SIZE 64k (fixes #3089)
  * [core] increase session window size to 256k
  * [core] h2: avoid sending small WINDOW_UPDATE frames
  * [core] h2: avoid sending tiny DATA frames
  * [core] update cached tables with Priority header
  * [tests] test stubs for http_header.c and http_kv.c

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 47188fa0dc19f160085554360c81bd9f363837d5)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


