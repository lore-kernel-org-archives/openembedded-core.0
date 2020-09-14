Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.61403.1600092762477725117
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SeCja/Gp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id w7so12755978pfi.4
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=r1YvDxiFSjUte9IAB4Z0vnhYUvSLe58o0XBPMqFj+PY=;
        b=SeCja/Gprb8cZjtH9ncUZHTQquR2XHjbS6oGb8WEQf1oXGIv3Cp/ipu58X0x0bwbpZ
         QeUz9HaXOD3Gv7eU+RcOlRnPsfZ8JiZNQC+skvx8tic6MIvcC1kul8oEs0u1iR82GGR6
         9oxWGMI/HvBI7QWGa8UJfytsftX2HnjMXiw21IePddZO0f2yM8lcy7XoB3SiAlqHQ+OV
         VBBlqPOCYAaQtABlpiQts5oBMXTXPOEyqsSmx78LVqz27Ga8ko/E/3EcO3qbHh8WysI6
         apMWZWqGl+CVHMbZqXBMXGlAWLtKgokP5pusdzjgwMWmG1pwzJyqXvDHmnVZYfyRJNOq
         u5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=r1YvDxiFSjUte9IAB4Z0vnhYUvSLe58o0XBPMqFj+PY=;
        b=O+0zWO6+uFebliHFG+rF0c8ges3rn0O43T8Mo4VGNsaVnwRGDT/C+9kBF41mSWvKm/
         7N9llnmmJLG/+WXkhsaYYMiSflxEchRcrcgSMynVzurGf1qArRYiLSuKgf0/PiZGo7Pf
         b9xaCCXRVFGy7PFDdmcIJSc/zipeZUXyYmuftBo35y6tEH+5cyURBhavQEN3SAInYdbA
         IuV+QRGOIbGiIYWL05I4Xvjyuc9G0YpQhOcWsqM5p8LHz4MFGKZRTac+WN48pVe001er
         k8B+SQbeT/MpeOvhKbmwFTu/81Z0q6jh6TWZVdZ7gE7dXRHbV/0Xl1svf1TNQpXh8lDJ
         DrDA==
X-Gm-Message-State: AOAM531v86jLl2Wg4UjZ0FzY1dPEdP/X0d2We3Ds1eSJRvK6j9XYStjd
	8g5ZdZzhsBpVAlJHhDRx9/P2PQfHWj/hFa+ru6M=
X-Google-Smtp-Source: ABdhPJzXuN/Zgtd1e7M2lkKkZSGaMziOwoERanJ6ZsxjllivTKOODgHcZVDYef6N/xq2qeUdU4v3VA==
X-Received: by 2002:a17:902:50d:b029:d1:9bc8:18fe with SMTP id 13-20020a170902050db02900d19bc818femr15174401plf.16.1600092761531;
        Mon, 14 Sep 2020 07:12:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.12.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/24] gnutls: CVE-2020-24659
Date: Mon, 14 Sep 2020 04:11:33 -1000
Message-Id: <874aaa5bb70d9cb60337589ed7a41a0478cefec9.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1600092418.git.steve@sakoman.com>
References: <cover.1600092418.git.steve@sakoman.com>

From: Zhixiong Chi <zhixiong.chi@windriver.com>

Backport the CVE patch from the usptream:
https://gitlab.com/gnutls/gnutls.git
commit 29ee67c205855e848a0a26e6d0e4f65b6b943e0a

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 84b1bc500e318657cb7a8a189b59cc63bc91dca3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gnutls/gnutls/CVE-2020-24659.patch        | 117 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch b/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
new file mode 100644
index 0000000000..1702325e66
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
@@ -0,0 +1,117 @@
+From 29ee67c205855e848a0a26e6d0e4f65b6b943e0a Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Sat, 22 Aug 2020 17:19:39 +0200
+Subject: [PATCH] handshake: reject no_renegotiation alert if handshake is
+ incomplete
+
+If the initial handshake is incomplete and the server sends a
+no_renegotiation alert, the client should treat it as a fatal error
+even if its level is warning.  Otherwise the same handshake
+state (e.g., DHE parameters) are reused in the next gnutls_handshake
+call, if it is called in the loop idiom:
+
+  do {
+          ret = gnutls_handshake(session);
+  } while (ret < 0 && gnutls_error_is_fatal(ret) == 0);
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+CVE: CVE-2020-24659
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls.git]
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ lib/gnutls_int.h                              |   1 +
+ lib/handshake.c                               |  48 +++++++++++++-----
+ 2 files changed, 36 insertions(+), 13 deletions(-)
+
+diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
+index bb6c19713..31cec5c0c 100644
+--- a/lib/gnutls_int.h
++++ b/lib/gnutls_int.h
+@@ -1370,6 +1370,7 @@ typedef struct {
+ #define HSK_RECORD_SIZE_LIMIT_RECEIVED (1<<26) /* server: record_size_limit extension was seen but not accepted yet */
+ #define HSK_OCSP_REQUESTED (1<<27) /* server: client requested OCSP stapling */
+ #define HSK_CLIENT_OCSP_REQUESTED (1<<28) /* client: server requested OCSP stapling */
++#define HSK_SERVER_HELLO_RECEIVED (1<<29) /* client: Server Hello message has been received */
+ 
+ 	/* The hsk_flags are for use within the ongoing handshake;
+ 	 * they are reset to zero prior to handshake start by gnutls_handshake. */
+diff --git a/lib/handshake.c b/lib/handshake.c
+index b40f84b3d..ce2d160e2 100644
+--- a/lib/handshake.c
++++ b/lib/handshake.c
+@@ -2051,6 +2051,8 @@ read_server_hello(gnutls_session_t session,
+ 	if (ret < 0)
+ 		return gnutls_assert_val(ret);
+ 
++	session->internals.hsk_flags |= HSK_SERVER_HELLO_RECEIVED;
++
+ 	return 0;
+ }
+ 
+@@ -2575,16 +2577,42 @@ int gnutls_rehandshake(gnutls_session_t session)
+ 	return 0;
+ }
+ 
++/* This function checks whether the error code should be treated fatal
++ * or not, and also does the necessary state transition.  In
++ * particular, in the case of a rehandshake abort it resets the
++ * handshake's internal state.
++ */
+ inline static int
+ _gnutls_abort_handshake(gnutls_session_t session, int ret)
+ {
+-	if (((ret == GNUTLS_E_WARNING_ALERT_RECEIVED) &&
+-	     (gnutls_alert_get(session) == GNUTLS_A_NO_RENEGOTIATION))
+-	    || ret == GNUTLS_E_GOT_APPLICATION_DATA)
+-		return 0;
++	switch (ret) {
++	case GNUTLS_E_WARNING_ALERT_RECEIVED:
++		if (gnutls_alert_get(session) == GNUTLS_A_NO_RENEGOTIATION) {
++			/* The server always toleretes a "no_renegotiation" alert. */
++			if (session->security_parameters.entity == GNUTLS_SERVER) {
++				STATE = STATE0;
++				return ret;
++			}
++
++			/* The client should tolerete a "no_renegotiation" alert only if:
++			 * - the initial handshake has completed, or
++			 * - a Server Hello is not yet received
++			 */
++			if (session->internals.initial_negotiation_completed ||
++			    !(session->internals.hsk_flags & HSK_SERVER_HELLO_RECEIVED)) {
++				STATE = STATE0;
++				return ret;
++			}
+ 
+-	/* this doesn't matter */
+-	return GNUTLS_E_INTERNAL_ERROR;
++			return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET);
++		}
++		return ret;
++	case GNUTLS_E_GOT_APPLICATION_DATA:
++		STATE = STATE0;
++		return ret;
++	default:
++		return ret;
++	}
+ }
+ 
+ 
+@@ -2747,13 +2774,7 @@ int gnutls_handshake(gnutls_session_t session)
+ 	}
+ 
+ 	if (ret < 0) {
+-		/* In the case of a rehandshake abort
+-		 * we should reset the handshake's internal state.
+-		 */
+-		if (_gnutls_abort_handshake(session, ret) == 0)
+-			STATE = STATE0;
+-
+-		return ret;
++		return _gnutls_abort_handshake(session, ret);
+ 	}
+ 
+ 	/* clear handshake buffer */
+-- 
+2.17.0
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index cc0454a561..51578b4b3b 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -20,6 +20,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
+           file://CVE-2020-24659.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.17.1

