Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C4CC4321E
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 15:37:21 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.86.1667835433406239769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Nov 2022 07:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=kOo47U2W;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id gw22so10932683pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 07:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAEoW55D7oZYtSTeo45gph2YKzWlpdWF5VMPD7k/WLU=;
        b=kOo47U2WbQ2g6O3HpbVQbbxD0zgo8mg7L9yc2xXRVwKUGVyHgAE2iGcf9pkju404wr
         7oscNEoUPjqhx/ZK6hLMSwmaLTCl/K4EPF25tD19gg/REw4yizOheaGDcqr8UQ/uoIKA
         1ctxf2n2Zz020TXSkCSeAlVM5TI+GylBkH0B8C2da8MinlkR6Yyal/PZPjawOaQltSL7
         rYBRBDDQ1zFnZ+6+tFP5DLBecZ2p4/0Xvqi2ZR3HXmqxEa8OC+rad71zEplM3t7qv5w3
         6wFVPueOqiSzRCITeuHnxnguqzjDNlnUYFYyFcCqNiC4HCbHgttEmMjuhlFfyB9KhPTs
         oNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAEoW55D7oZYtSTeo45gph2YKzWlpdWF5VMPD7k/WLU=;
        b=zlaERdiNul65qxpQeqET/F06Rceh3eGCr2gOclHZPZku8wqCNdHxno7EZeQ6l0g+df
         maDUKJCKp18dv4ft2QwzI05zIG1os3piOkI5oJ3QDzav7QvpfYBOCjQj9mrT6B06JFpS
         lhOd6GXRw2QIp8SAHhW0Mir4bEr25AF1AnsJO7EIbaFejuumQwi6771bCxlyNkRFd1g5
         bm7tnXBFEZh3QAgFIsdxEUq9HmSUyZwdLzO6jchmxeHPbeb2FTfspmMusbF5/iKZfbqT
         0Ju0QiNGVEFwv+6Gc5OxOsB5aXhDubr13iymPJzD5OdgT0f0XpZv01uaUuBLikwrFYV4
         Dd/w==
X-Gm-Message-State: ACrzQf1/uvwfMktsMCeX524VigCPdNQFeA17sVH5FTzL8Fvl2Zq94GjZ
	fTXRQWN2Ta7y576Z6ysNw0nHLqGtWum8hdMr
X-Google-Smtp-Source: AMsMyM4IbNd/G19jt2VR7M2bG573qfXp42nv/ainrr6+6ngmcCaJbiWk+GeB3TxWuFpymJTCbMfjVw==
X-Received: by 2002:a17:902:d4c1:b0:186:e426:ff12 with SMTP id o1-20020a170902d4c100b00186e426ff12mr50374060plg.132.1667835432397;
        Mon, 07 Nov 2022 07:37:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id v2-20020aa799c2000000b00561dcfa700asm4628627pfi.107.2022.11.07.07.37.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 07:37:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/25] lighttpd: upgrade 1.4.66 -> 1.4.67
Date: Mon,  7 Nov 2022 05:36:28 -1000
Message-Id: <da59d2883b8b0af2e6e435c630e74ae3732a6ad0.1667834972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667834972.git.steve@sakoman.com>
References: <cover.1667834972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Nov 2022 15:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172908

From: wangmy <wangmy@fujitsu.com>

Changelog:
=============
  * Update comment about TCP_INFO on OpenBSD
  * [mod_ajp13] fix crash with bad response headers (fixes #3170)
  * [core] handle RDHUP when collecting chunked body
  * [core] tweak streaming request body to backends
  * [core] handle ENOSPC with pwritev() (#3171)
  * [core] manually calculate off_t max (fixes #3171)
  * [autoconf] force large file support (#3171)
  * [multiple] quiet coverity warnings using casts
  * [meson] add license keyword to project declaration

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7a399862bb2e1503fbffa18e7ec0767643f76132)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lighttpd/lighttpd/CVE-2022-41556.patch    | 31 -------------------
 ...{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.66.bb => lighttpd_1.4.67.bb} (96%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch b/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
deleted file mode 100644
index 284a5a3ea9..0000000000
--- a/meta/recipes-extended/lighttpd/lighttpd/CVE-2022-41556.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-CVE: CVE-2022-41556
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From b18de6f9264f914f7bf493abd3b6059343548e50 Mon Sep 17 00:00:00 2001
-From: Glenn Strauss <gstrauss@gluelogic.com>
-Date: Sun, 11 Sep 2022 22:31:34 -0400
-Subject: [PATCH] [core] handle RDHUP when collecting chunked body
-
-handle RDHUP as soon as RDHUP detected when collecting HTTP/1.1 chunked
-request body (and when not streaming request body to backend)
-
-x-ref:
-  https://github.com/lighttpd/lighttpd1.4/pull/115
----
- src/gw_backend.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/gw_backend.c b/src/gw_backend.c
-index df9d8217..5db56287 100644
---- a/src/gw_backend.c
-+++ b/src/gw_backend.c
-@@ -2228,7 +2228,7 @@ handler_t gw_handle_subrequest(request_st * const r, void *p_d) {
-                  *  and module is flagged to stream request body to backend) */
-                 return (r->conf.stream_request_body & FDEVENT_STREAM_REQUEST)
-                   ? http_response_reqbody_read_error(r, 411)
--                  : HANDLER_WAIT_FOR_EVENT;
-+                  : (rc == HANDLER_GO_ON) ? HANDLER_WAIT_FOR_EVENT : rc;
-             }
- 
-             if (hctx->wb_reqlen < -1 && r->reqbody_length >= 0) {
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
similarity index 96%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
index 78978105b2..838881f238 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.66.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.67.bb
@@ -14,13 +14,12 @@ RRECOMMENDS:${PN} = "lighttpd-module-access \
                      lighttpd-module-accesslog"
 
 SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.xz \
-           file://CVE-2022-41556.patch \
            file://index.html.lighttpd \
            file://lighttpd.conf \
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "47ac6e60271aa0196e65472d02d019556dc7c6d09df3b65df2c1ab6866348e3b"
+SRC_URI[sha256sum] = "7e04d767f51a8d824b32e2483ef2950982920d427d1272ef4667f49d6f89f358"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.25.1


