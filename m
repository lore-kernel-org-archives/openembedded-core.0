Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA82C4167B
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:38 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.11589.1634657676830781834
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LR3HEdh3;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 y74-20020a1c7d4d000000b00322f53b9bbfso3341913wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4WGlBKXWpOzFITC0+R0wAVYKpmRCz2UKHkLfzvnrlq4=;
        b=LR3HEdh3kuh01x3GbG0iS4ioue2YdM+ir6qSVMzotqixPyR5C/fX+E0g8R/lRMG0RQ
         M8kMkrr3ZqDZgi8wMIVgmJuu4FumH0y+N5b0AFGkDhY7CxxsUP3k5+VslxkxxO9AR4YL
         CcYY7hprCHqWbIvOGXFlClUaQZ5TKco8IR+LkV5EoA/YwWndWVCnmiUqV87oxwZza3vK
         WCSTM1lHJq4HSOOuNbM9g/bwawXEU/SwI9KYa3AinoOFe22JoeBEG3gcbJZDf4SMLgu1
         WZGURcJq2I6IjRtHdlAWpBAQtM6li+rOlc/LSdjo5kwq5p4HbXLimXmbzocPEZug5Nu0
         5cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4WGlBKXWpOzFITC0+R0wAVYKpmRCz2UKHkLfzvnrlq4=;
        b=OmBB5CLeixYu+iPlSz+RgunvXYXr8NNNoxxpm3BKKawRvSPdMgvjfJjLZdsISevsyq
         XzTCPuRxVMXzh+eEXnac5bv0kGe/MgFzlhqOMYhAtF+FdPjfgLW7hmedWS8I2Ta6IXeP
         vvFqGIdAN8Lo6kwDx5s4BHey4DCgps2eZ4bx9eTy4RkKFNs2WQmYkpOri0wwcFJqJ4Wu
         aK7QS/cn4XN/Pd8ueUMWJ+kfT8uHzN20spT8i/DfId2loHkpetRocKEmjNQoD2rTOHQH
         XHqx8F+UqfKm875Fh6Eo54qBNJ+35+biQMlr6wb67Qpdzj3kwpYJ6yLy0FHB0e60HM+n
         x0dQ==
X-Gm-Message-State: AOAM532fY7QxRFQUQmy2nvUyHciZNzhvTQEoJcA72ilQQMkOTRKSW24l
	cERRiV+chC2cAnLKeYDtpUd3aV6VkfQ=
X-Google-Smtp-Source: 
 ABdhPJzMZkVJiizjpyFLY9Q1B1ghA/qkZtJUS7FxrsPJzrdHRts86iFnPgvYBe5SNzPDaDDnJ8MmMQ==
X-Received: by 2002:a7b:c858:: with SMTP id c24mr6605644wml.171.1634657675261;
        Tue, 19 Oct 2021 08:34:35 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH 16/65] curl: update 7.78.0 -> 7.79.1
Date: Tue, 19 Oct 2021 17:33:30 +0200
Message-Id: <20211019153419.3319802-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157135

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../curl/curl/cve-2021-22945.patch            |  34 --
 .../curl/curl/cve-2021-22946.patch            | 332 ----------------
 .../curl/curl/cve-2021-22947.patch            | 355 ------------------
 .../curl/{curl_7.78.0.bb => curl_7.79.1.bb}   |   7 +-
 4 files changed, 2 insertions(+), 726 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/cve-2021-22945.patch
 delete mode 100644 meta/recipes-support/curl/curl/cve-2021-22946.patch
 delete mode 100644 meta/recipes-support/curl/curl/cve-2021-22947.patch
 rename meta/recipes-support/curl/{curl_7.78.0.bb => curl_7.79.1.bb} (94%)

diff --git a/meta/recipes-support/curl/curl/cve-2021-22945.patch b/meta/recipes-support/curl/curl/cve-2021-22945.patch
deleted file mode 100644
index 2cbe110332..0000000000
--- a/meta/recipes-support/curl/curl/cve-2021-22945.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-CVE: CVE-2021-22945
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 92cb3059dab2f9ef3e6ea614dad5c86917d19807 Mon Sep 17 00:00:00 2001
-From: z2_ on hackerone <>
-Date: Tue, 24 Aug 2021 09:50:33 +0200
-Subject: [PATCH 1/3] mqtt: clear the leftovers pointer when sending succeeds
-
-CVE-2021-22945
-
-Bug: https://curl.se/docs/CVE-2021-22945.html
----
- lib/mqtt.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/lib/mqtt.c b/lib/mqtt.c
-index f077e6c3d..fcd40b41e 100644
---- a/lib/mqtt.c
-+++ b/lib/mqtt.c
-@@ -128,6 +128,10 @@ static CURLcode mqtt_send(struct Curl_easy *data,
-     mq->sendleftovers = sendleftovers;
-     mq->nsend = nsend;
-   }
-+  else {
-+    mq->sendleftovers = NULL;
-+    mq->nsend = 0;
-+  }
-   return result;
- }
- 
--- 
-2.25.1
-
diff --git a/meta/recipes-support/curl/curl/cve-2021-22946.patch b/meta/recipes-support/curl/curl/cve-2021-22946.patch
deleted file mode 100644
index 1a4b3e1144..0000000000
--- a/meta/recipes-support/curl/curl/cve-2021-22946.patch
+++ /dev/null
@@ -1,332 +0,0 @@
-CVE: CVE-2021-22946
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 089e18aefcee9b5093a96e9e1aa92751dde1f991 Mon Sep 17 00:00:00 2001
-From: Patrick Monnerat <patrick@monnerat.net>
-Date: Wed, 8 Sep 2021 11:56:22 +0200
-Subject: [PATCH 2/3] ftp,imap,pop3: do not ignore --ssl-reqd
-
-In imap and pop3, check if TLS is required even when capabilities
-request has failed.
-
-In ftp, ignore preauthentication (230 status of server greeting) if TLS
-is required.
-
-Bug: https://curl.se/docs/CVE-2021-22946.html
-
-CVE-2021-22946
----
- lib/ftp.c               |  9 ++++---
- lib/imap.c              | 24 ++++++++----------
- lib/pop3.c              | 33 +++++++++++-------------
- tests/data/Makefile.inc |  2 ++
- tests/data/test984      | 56 +++++++++++++++++++++++++++++++++++++++++
- tests/data/test985      | 54 +++++++++++++++++++++++++++++++++++++++
- tests/data/test986      | 53 ++++++++++++++++++++++++++++++++++++++
- 7 files changed, 195 insertions(+), 36 deletions(-)
- create mode 100644 tests/data/test984
- create mode 100644 tests/data/test985
- create mode 100644 tests/data/test986
-
-diff --git a/lib/ftp.c b/lib/ftp.c
-index 1a699de59..08d18ca74 100644
---- a/lib/ftp.c
-+++ b/lib/ftp.c
-@@ -2681,9 +2681,12 @@ static CURLcode ftp_statemachine(struct Curl_easy *data,
-     /* we have now received a full FTP server response */
-     switch(ftpc->state) {
-     case FTP_WAIT220:
--      if(ftpcode == 230)
--        /* 230 User logged in - already! */
--        return ftp_state_user_resp(data, ftpcode, ftpc->state);
-+      if(ftpcode == 230) {
-+        /* 230 User logged in - already! Take as 220 if TLS required. */
-+        if(data->set.use_ssl <= CURLUSESSL_TRY ||
-+           conn->bits.ftp_use_control_ssl)
-+          return ftp_state_user_resp(data, ftpcode, ftpc->state);
-+      }
-       else if(ftpcode != 220) {
-         failf(data, "Got a %03d ftp-server response when 220 was expected",
-               ftpcode);
-diff --git a/lib/imap.c b/lib/imap.c
-index ab4d412ee..efc0420ce 100644
---- a/lib/imap.c
-+++ b/lib/imap.c
-@@ -935,22 +935,18 @@ static CURLcode imap_state_capability_resp(struct Curl_easy *data,
-       line += wordlen;
-     }
-   }
--  else if(imapcode == IMAP_RESP_OK) {
--    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
--      /* We don't have a SSL/TLS connection yet, but SSL is requested */
--      if(imapc->tls_supported)
--        /* Switch to TLS connection now */
--        result = imap_perform_starttls(data, conn);
--      else if(data->set.use_ssl == CURLUSESSL_TRY)
--        /* Fallback and carry on with authentication */
--        result = imap_perform_authentication(data, conn);
--      else {
--        failf(data, "STARTTLS not supported.");
--        result = CURLE_USE_SSL_FAILED;
--      }
-+  else if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
-+    /* PREAUTH is not compatible with STARTTLS. */
-+    if(imapcode == IMAP_RESP_OK && imapc->tls_supported && !imapc->preauth) {
-+      /* Switch to TLS connection now */
-+      result = imap_perform_starttls(data, conn);
-     }
--    else
-+    else if(data->set.use_ssl <= CURLUSESSL_TRY)
-       result = imap_perform_authentication(data, conn);
-+    else {
-+      failf(data, "STARTTLS not available.");
-+      result = CURLE_USE_SSL_FAILED;
-+    }
-   }
-   else
-     result = imap_perform_authentication(data, conn);
-diff --git a/lib/pop3.c b/lib/pop3.c
-index 5fdd6f3e0..f97e10eab 100644
---- a/lib/pop3.c
-+++ b/lib/pop3.c
-@@ -741,28 +741,23 @@ static CURLcode pop3_state_capa_resp(struct Curl_easy *data, int pop3code,
-       }
-     }
-   }
--  else if(pop3code == '+') {
--    if(data->set.use_ssl && !conn->ssl[FIRSTSOCKET].use) {
--      /* We don't have a SSL/TLS connection yet, but SSL is requested */
--      if(pop3c->tls_supported)
--        /* Switch to TLS connection now */
--        result = pop3_perform_starttls(data, conn);
--      else if(data->set.use_ssl == CURLUSESSL_TRY)
--        /* Fallback and carry on with authentication */
--        result = pop3_perform_authentication(data, conn);
--      else {
--        failf(data, "STLS not supported.");
--        result = CURLE_USE_SSL_FAILED;
--      }
--    }
--    else
--      result = pop3_perform_authentication(data, conn);
--  }
-   else {
-     /* Clear text is supported when CAPA isn't recognised */
--    pop3c->authtypes |= POP3_TYPE_CLEARTEXT;
-+    if(pop3code != '+')
-+      pop3c->authtypes |= POP3_TYPE_CLEARTEXT;
- 
--    result = pop3_perform_authentication(data, conn);
-+    if(!data->set.use_ssl || conn->ssl[FIRSTSOCKET].use)
-+      result = pop3_perform_authentication(data, conn);
-+    else if(pop3code == '+' && pop3c->tls_supported)
-+      /* Switch to TLS connection now */
-+      result = pop3_perform_starttls(data, conn);
-+    else if(data->set.use_ssl <= CURLUSESSL_TRY)
-+      /* Fallback and carry on with authentication */
-+      result = pop3_perform_authentication(data, conn);
-+    else {
-+      failf(data, "STLS not supported.");
-+      result = CURLE_USE_SSL_FAILED;
-+    }
-   }
- 
-   return result;
-diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
-index 163696962..5cd092192 100644
---- a/tests/data/Makefile.inc
-+++ b/tests/data/Makefile.inc
-@@ -118,6 +118,8 @@ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
- test963 test964 test965 test966 test967 test968 test969 test970 test971 \
- test972 \
- \
-+test984 test985 test986 \
-+\
- test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
- test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
- test1016 test1017 test1018 test1019 test1020 test1021 test1022 test1023 \
-diff --git a/tests/data/test984 b/tests/data/test984
-new file mode 100644
-index 000000000..e573f23c1
---- /dev/null
-+++ b/tests/data/test984
-@@ -0,0 +1,56 @@
-+<testcase>
-+<info>
-+<keywords>
-+IMAP
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+REPLY CAPABILITY A001 BAD Not implemented
-+</servercmd>
-+</reply>
-+
-+#
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+imap
-+</server>
-+ <name>
-+IMAP require STARTTLS with failing capabilities
-+ </name>
-+ <command>
-+imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:secret --ssl-reqd
-+</command>
-+<file name="log/upload%TESTNUMBER">
-+Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST)
-+From: Fred Foobar <foobar@example.COM>
-+Subject: afternoon meeting
-+To: joe@example.com
-+Message-Id: <B27397-0100000@example.COM>
-+MIME-Version: 1.0
-+Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
-+
-+Hello Joe, do you think we can meet at 3:30 tomorrow?
-+</file>
-+</client>
-+
-+#
-+# Verify data after the test has been "shot"
-+<verify>
-+# 64 is CURLE_USE_SSL_FAILED
-+<errorcode>
-+64
-+</errorcode>
-+<protocol>
-+A001 CAPABILITY
-+</protocol>
-+</verify>
-+</testcase>
-diff --git a/tests/data/test985 b/tests/data/test985
-new file mode 100644
-index 000000000..d0db4aadf
---- /dev/null
-+++ b/tests/data/test985
-@@ -0,0 +1,54 @@
-+<testcase>
-+<info>
-+<keywords>
-+POP3
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+REPLY CAPA -ERR Not implemented
-+</servercmd>
-+<data nocheck="yes">
-+From: me@somewhere
-+To: fake@nowhere
-+
-+body
-+
-+--
-+  yours sincerely
-+</data>
-+</reply>
-+
-+#
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+pop3
-+</server>
-+ <name>
-+POP3 require STARTTLS with failing capabilities
-+ </name>
-+ <command>
-+pop3://%HOSTIP:%POP3PORT/%TESTNUMBER -u user:secret --ssl-reqd
-+ </command>
-+</client>
-+
-+#
-+# Verify data after the test has been "shot"
-+<verify>
-+# 64 is CURLE_USE_SSL_FAILED
-+<errorcode>
-+64
-+</errorcode>
-+<protocol>
-+CAPA
-+</protocol>
-+</verify>
-+</testcase>
-diff --git a/tests/data/test986 b/tests/data/test986
-new file mode 100644
-index 000000000..a709437a4
---- /dev/null
-+++ b/tests/data/test986
-@@ -0,0 +1,53 @@
-+<testcase>
-+<info>
-+<keywords>
-+FTP
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+REPLY welcome 230 Welcome
-+REPLY AUTH 500 unknown command
-+</servercmd>
-+</reply>
-+
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+ftp
-+</server>
-+ <name>
-+FTP require STARTTLS while preauthenticated
-+ </name>
-+<file name="log/test%TESTNUMBER.txt">
-+data
-+    to
-+      see
-+that FTPS
-+works
-+  so does it?
-+</file>
-+ <command>
-+--ssl-reqd --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/test%TESTNUMBER.txt -u user:secret
-+</command>
-+</client>
-+
-+# Verify data after the test has been "shot"
-+<verify>
-+# 64 is CURLE_USE_SSL_FAILED
-+<errorcode>
-+64
-+</errorcode>
-+<protocol>
-+AUTH SSL
-+AUTH TLS
-+</protocol>
-+</verify>
-+</testcase>
--- 
-2.25.1
-
diff --git a/meta/recipes-support/curl/curl/cve-2021-22947.patch b/meta/recipes-support/curl/curl/cve-2021-22947.patch
deleted file mode 100644
index 8a5031275a..0000000000
--- a/meta/recipes-support/curl/curl/cve-2021-22947.patch
+++ /dev/null
@@ -1,355 +0,0 @@
-CVE: CVE-2021-22947
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From aefa7370cb02801a571d51287d290d67068998b8 Mon Sep 17 00:00:00 2001
-From: Patrick Monnerat <patrick@monnerat.net>
-Date: Tue, 7 Sep 2021 13:26:42 +0200
-Subject: [PATCH 3/3] ftp,imap,pop3,smtp: reject STARTTLS server response
- pipelining
-
-If a server pipelines future responses within the STARTTLS response, the
-former are preserved in the pingpong cache across TLS negotiation and
-used as responses to the encrypted commands.
-
-This fix detects pipelined STARTTLS responses and rejects them with an
-error.
-
-CVE-2021-22947
-
-Bug: https://curl.se/docs/CVE-2021-22947.html
----
- lib/ftp.c               |  3 +++
- lib/imap.c              |  4 +++
- lib/pop3.c              |  4 +++
- lib/smtp.c              |  4 +++
- tests/data/Makefile.inc |  2 +-
- tests/data/test980      | 52 ++++++++++++++++++++++++++++++++++++
- tests/data/test981      | 59 +++++++++++++++++++++++++++++++++++++++++
- tests/data/test982      | 57 +++++++++++++++++++++++++++++++++++++++
- tests/data/test983      | 52 ++++++++++++++++++++++++++++++++++++
- 9 files changed, 236 insertions(+), 1 deletion(-)
- create mode 100644 tests/data/test980
- create mode 100644 tests/data/test981
- create mode 100644 tests/data/test982
- create mode 100644 tests/data/test983
-
-diff --git a/lib/ftp.c b/lib/ftp.c
-index 08d18ca74..0b9c9b732 100644
---- a/lib/ftp.c
-+++ b/lib/ftp.c
-@@ -2743,6 +2743,9 @@ static CURLcode ftp_statemachine(struct Curl_easy *data,
-     case FTP_AUTH:
-       /* we have gotten the response to a previous AUTH command */
- 
-+      if(pp->cache_size)
-+        return CURLE_WEIRD_SERVER_REPLY; /* Forbid pipelining in response. */
-+
-       /* RFC2228 (page 5) says:
-        *
-        * If the server is willing to accept the named security mechanism,
-diff --git a/lib/imap.c b/lib/imap.c
-index efc0420ce..d1a48d7e3 100644
---- a/lib/imap.c
-+++ b/lib/imap.c
-@@ -964,6 +964,10 @@ static CURLcode imap_state_starttls_resp(struct Curl_easy *data,
- 
-   (void)instate; /* no use for this yet */
- 
-+  /* Pipelining in response is forbidden. */
-+  if(data->conn->proto.imapc.pp.cache_size)
-+    return CURLE_WEIRD_SERVER_REPLY;
-+
-   if(imapcode != IMAP_RESP_OK) {
-     if(data->set.use_ssl != CURLUSESSL_TRY) {
-       failf(data, "STARTTLS denied");
-diff --git a/lib/pop3.c b/lib/pop3.c
-index f97e10eab..a06acb7b8 100644
---- a/lib/pop3.c
-+++ b/lib/pop3.c
-@@ -772,6 +772,10 @@ static CURLcode pop3_state_starttls_resp(struct Curl_easy *data,
-   CURLcode result = CURLE_OK;
-   (void)instate; /* no use for this yet */
- 
-+  /* Pipelining in response is forbidden. */
-+  if(data->conn->proto.pop3c.pp.cache_size)
-+    return CURLE_WEIRD_SERVER_REPLY;
-+
-   if(pop3code != '+') {
-     if(data->set.use_ssl != CURLUSESSL_TRY) {
-       failf(data, "STARTTLS denied");
-diff --git a/lib/smtp.c b/lib/smtp.c
-index 1a3da1559..9b9403b3d 100644
---- a/lib/smtp.c
-+++ b/lib/smtp.c
-@@ -835,6 +835,10 @@ static CURLcode smtp_state_starttls_resp(struct Curl_easy *data,
-   CURLcode result = CURLE_OK;
-   (void)instate; /* no use for this yet */
- 
-+  /* Pipelining in response is forbidden. */
-+  if(data->conn->proto.smtpc.pp.cache_size)
-+    return CURLE_WEIRD_SERVER_REPLY;
-+
-   if(smtpcode != 220) {
-     if(data->set.use_ssl != CURLUSESSL_TRY) {
-       failf(data, "STARTTLS denied, code %d", smtpcode);
-diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
-index 5cd092192..c524b993e 100644
---- a/tests/data/Makefile.inc
-+++ b/tests/data/Makefile.inc
-@@ -118,7 +118,7 @@ test954 test955 test956 test957 test958 test959 test960 test961 test962 \
- test963 test964 test965 test966 test967 test968 test969 test970 test971 \
- test972 \
- \
--test984 test985 test986 \
-+test980 test981 test982 test983 test984 test985 test986 \
- \
- test1000 test1001 test1002 test1003 test1004 test1005 test1006 test1007 \
- test1008 test1009 test1010 test1011 test1012 test1013 test1014 test1015 \
-diff --git a/tests/data/test980 b/tests/data/test980
-new file mode 100644
-index 000000000..97567f856
---- /dev/null
-+++ b/tests/data/test980
-@@ -0,0 +1,52 @@
-+<testcase>
-+<info>
-+<keywords>
-+SMTP
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+CAPA STARTTLS
-+AUTH PLAIN
-+REPLY STARTTLS 454 currently unavailable\r\n235 Authenticated\r\n250 2.1.0 Sender ok\r\n250 2.1.5 Recipient ok\r\n354 Enter mail\r\n250 2.0.0 Accepted
-+REPLY AUTH 535 5.7.8 Authentication credentials invalid
-+</servercmd>
-+</reply>
-+
-+#
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+smtp
-+</server>
-+ <name>
-+SMTP STARTTLS pipelined server response
-+ </name>
-+<stdin>
-+mail body
-+</stdin>
-+ <command>
-+smtp://%HOSTIP:%SMTPPORT/%TESTNUMBER --mail-rcpt recipient@example.com --mail-from sender@example.com -u user:secret --ssl --sasl-ir -T -
-+</command>
-+</client>
-+
-+#
-+# Verify data after the test has been "shot"
-+<verify>
-+# 8 is CURLE_WEIRD_SERVER_REPLY
-+<errorcode>
-+8
-+</errorcode>
-+<protocol>
-+EHLO %TESTNUMBER
-+STARTTLS
-+</protocol>
-+</verify>
-+</testcase>
-diff --git a/tests/data/test981 b/tests/data/test981
-new file mode 100644
-index 000000000..2b98ce42a
---- /dev/null
-+++ b/tests/data/test981
-@@ -0,0 +1,59 @@
-+<testcase>
-+<info>
-+<keywords>
-+IMAP
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+CAPA STARTTLS
-+REPLY STARTTLS A002 BAD currently unavailable\r\nA003 OK Authenticated\r\nA004 OK Accepted
-+REPLY LOGIN A003 BAD Authentication credentials invalid
-+</servercmd>
-+</reply>
-+
-+#
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+imap
-+</server>
-+ <name>
-+IMAP STARTTLS pipelined server response
-+ </name>
-+ <command>
-+imap://%HOSTIP:%IMAPPORT/%TESTNUMBER -T log/upload%TESTNUMBER -u user:secret --ssl
-+</command>
-+<file name="log/upload%TESTNUMBER">
-+Date: Mon, 7 Feb 1994 21:52:25 -0800 (PST)
-+From: Fred Foobar <foobar@example.COM>
-+Subject: afternoon meeting
-+To: joe@example.com
-+Message-Id: <B27397-0100000@example.COM>
-+MIME-Version: 1.0
-+Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
-+
-+Hello Joe, do you think we can meet at 3:30 tomorrow?
-+</file>
-+</client>
-+
-+#
-+# Verify data after the test has been "shot"
-+<verify>
-+# 8 is CURLE_WEIRD_SERVER_REPLY
-+<errorcode>
-+8
-+</errorcode>
-+<protocol>
-+A001 CAPABILITY
-+A002 STARTTLS
-+</protocol>
-+</verify>
-+</testcase>
-diff --git a/tests/data/test982 b/tests/data/test982
-new file mode 100644
-index 000000000..9e07cc0b3
---- /dev/null
-+++ b/tests/data/test982
-@@ -0,0 +1,57 @@
-+<testcase>
-+<info>
-+<keywords>
-+POP3
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+CAPA STLS USER
-+REPLY STLS -ERR currently unavailable\r\n+OK user accepted\r\n+OK authenticated
-+REPLY PASS -ERR Authentication credentials invalid
-+</servercmd>
-+<data nocheck="yes">
-+From: me@somewhere
-+To: fake@nowhere
-+
-+body
-+
-+--
-+  yours sincerely
-+</data>
-+</reply>
-+
-+#
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+pop3
-+</server>
-+ <name>
-+POP3 STARTTLS pipelined server response
-+ </name>
-+ <command>
-+pop3://%HOSTIP:%POP3PORT/%TESTNUMBER -u user:secret --ssl
-+ </command>
-+</client>
-+
-+#
-+# Verify data after the test has been "shot"
-+<verify>
-+# 8 is CURLE_WEIRD_SERVER_REPLY
-+<errorcode>
-+8
-+</errorcode>
-+<protocol>
-+CAPA
-+STLS
-+</protocol>
-+</verify>
-+</testcase>
-diff --git a/tests/data/test983 b/tests/data/test983
-new file mode 100644
-index 000000000..300ec459c
---- /dev/null
-+++ b/tests/data/test983
-@@ -0,0 +1,52 @@
-+<testcase>
-+<info>
-+<keywords>
-+FTP
-+STARTTLS
-+</keywords>
-+</info>
-+
-+#
-+# Server-side
-+<reply>
-+<servercmd>
-+REPLY AUTH 500 unknown command\r\n500 unknown command\r\n331 give password\r\n230 Authenticated\r\n257 "/"\r\n200 OK\r\n200 OK\r\n200 OK\r\n226 Transfer complete
-+REPLY PASS 530 Login incorrect
-+</servercmd>
-+</reply>
-+
-+# Client-side
-+<client>
-+<features>
-+SSL
-+</features>
-+<server>
-+ftp
-+</server>
-+ <name>
-+FTP STARTTLS pipelined server response
-+ </name>
-+<file name="log/test%TESTNUMBER.txt">
-+data
-+    to
-+      see
-+that FTPS
-+works
-+  so does it?
-+</file>
-+ <command>
-+--ssl --ftp-ssl-control ftp://%HOSTIP:%FTPPORT/%TESTNUMBER -T log/test%TESTNUMBER.txt -u user:secret -P %CLIENTIP
-+</command>
-+</client>
-+
-+# Verify data after the test has been "shot"
-+<verify>
-+# 8 is CURLE_WEIRD_SERVER_REPLY
-+<errorcode>
-+8
-+</errorcode>
-+<protocol>
-+AUTH SSL
-+</protocol>
-+</verify>
-+</testcase>
--- 
-2.25.1
-
diff --git a/meta/recipes-support/curl/curl_7.78.0.bb b/meta/recipes-support/curl/curl_7.79.1.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.78.0.bb
rename to meta/recipes-support/curl/curl_7.79.1.bb
index 3f736d8da6..919777ce36 100644
--- a/meta/recipes-support/curl/curl_7.78.0.bb
+++ b/meta/recipes-support/curl/curl_7.79.1.bb
@@ -11,12 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
 SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
-           file://cve-2021-22945.patch \
-           file://cve-2021-22946.patch \
-           file://cve-2021-22947.patch \
-"
+           "
 
-SRC_URI[sha256sum] = "98530b317dc95ccb324bbe4f834f07bb642fbc393b794ddf3434f246a71ea44a"
+SRC_URI[sha256sum] = "de62c4ab9a9316393962e8b94777a570bb9f71feb580fb4475e412f2f9387851"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.20.1


