Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C664CC4167B
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:01 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.16779.1667744275469728674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=SePPDL9p;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id h193so8283296pgc.10
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAEoW55D7oZYtSTeo45gph2YKzWlpdWF5VMPD7k/WLU=;
        b=SePPDL9pCpc9KzsJyD+uVYoKeLCbsayg3cyOOeoBdJJCWUCB/tfnBQQ1mi19bZnPVX
         9eJz4FTqVj6KtB883d2Cgc0xgLmMN+BgES74smLHjhf9Kr4I3EHVlce4hIZ6xDZqf/ke
         47sFOPc28WhatH692A1jP7Cjm08yqh8or4hY4V9h+aAvkxWxMkvXYUi5O9YlXxsm3J2A
         Gi9t4iJEi8fa25uwJPtLE7CXigmX6FLHXojeVc0Bh9170Q8ebz8uq7c4yfL0qvrO4g7/
         ASOEyH71+ISzfOnccBVMxebWjISdFQ5x9CJojMOXcr5NG3tKL9iGoV1CIyEheXR0pT2a
         0q7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAEoW55D7oZYtSTeo45gph2YKzWlpdWF5VMPD7k/WLU=;
        b=UBN4mF/i0ve/6XVLlP7Cj70/xilvT9JTCbudxKsWN2QA9dleeF+DcZUM01j6/rbmcJ
         l5azcPGfm4AKH7omXC4+M2sFfw65ZDAcxOaFkLD4re2y8S52C5k4Phow4Jrtpp+MLh3k
         yQa9oOKVju6a/8b6yPaQ1S0ZB8wRQMR5fPxnt8MTspXn66FgOE/IBOZQaiGUF67nrlbC
         Xy1fkgcdLXmu8HtjxNClHJ8hGpDxlD0aib4kDQ/RH9yhJuuoS0jUD5DN3nk9cW4FjWxx
         GmjTywx7yvvJJVtHKWSHhdj4BMIna4nHZyF5Wo2jZaO94copWpzsBflfB3rRijJdKiIe
         m6lg==
X-Gm-Message-State: ACrzQf2oE11ucR5Eessp9YaYi7k1euZmKQ8z1IttRi4c0LGgUsh+zM7d
	bGOoK+51roAuttgkY+3+xRtHPfh+Ps4g+y09
X-Google-Smtp-Source: AMsMyM7aiQoUQrpbJiHL7q4md6JZ55YKM5NmhjGJQDulIZEKmJmDbh4nKl/YRFDSAhS6AP6OQRFsvg==
X-Received: by 2002:a63:81c2:0:b0:46f:f73e:127e with SMTP id t185-20020a6381c2000000b0046ff73e127emr23808916pgd.250.1667744274414;
        Sun, 06 Nov 2022 06:17:54 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.17.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:17:54 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 12/34] lighttpd: upgrade 1.4.66 -> 1.4.67
Date: Sun,  6 Nov 2022 04:16:55 -1000
Message-Id: <d099203a342b8bbb35656b84c6488e8131cc8648.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172780

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


