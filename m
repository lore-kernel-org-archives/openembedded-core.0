Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.3909.1603919187391395006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Dptnfx1f;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id dk16so284371ejb.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x5/jUIO/Pdo5f6PjBkapRVwgfA1UOJnvfnc0CbcL8/M=;
        b=Dptnfx1fg9u1MMUTkqb72LJPe4M22EbqVolYkwK9sYbipLXT71QzjHxhq3JHAPh2v7
         cnyQBaKiWe/MDQzGbD8CK5A1HatOxFfT03OwFXCYWR/RKS3kYEgjEsoNJEH+loi7WrRm
         hRVZq5L96mFAa4B3QIkfW2YHr9SUfq4TpVhRiBuG2O1goKlBwwbpUrhsrcCXVNpMQwc+
         H0qLo/36rQEg8NgZOH4LDX7qusQG1MjwSKT9X/brfBzB2ABeWKczLGW+2aMe4XRWOPkt
         E8Sy4wVtEPkZ0oV542NrZOIhJGPAb4FXnwzC1181uXcsxKcDfaAm1ZqE5oLtqWoyOvmp
         DpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x5/jUIO/Pdo5f6PjBkapRVwgfA1UOJnvfnc0CbcL8/M=;
        b=C9L9wI4ioj8p6HRumUElgeEEGfafdqsW/3XFTt00qjNzqOl2V6SitWss7xLHIq+2Wc
         l1dduf+1+N4KnjxIRoUhVg4iXNgunW6wggeCLhTb+rWYgq3yecsUTjdcEUqGXpuQRNW0
         K3o9JvN3npjyEzVkxsfjh4gH/9EVEIUSit7a/JEkTRL0Pqi+3sy22ZMYfmTLIcmIxiXI
         QDZ/k4LJNpOYLlooC4tCP8g6TcKocRffO9u2XkcaADmhq+e1UzvDkJPi/CPmwHhO8lNn
         XAEChe7UiZEaY2DfSFIry0LzfzDGyC/V2oGkPOScJX1ZwwsXVoxNcTrJP9uIZD1fvEQp
         Al4A==
X-Gm-Message-State: AOAM532roIMz0OkhYFCiozhFFANmKsoDMmSeP0/L06OlMW6hCwe4waAf
	FGcE/wdi3aa5CpMrJCcw5/kzGKjw8Q66Sw==
X-Google-Smtp-Source: ABdhPJyZSNmRc90yjjkR5b7+YEu37BnrEsc0qtbURVwHMwgSGZMElwTZdpZR39FbPIHRMAQsQ3D7RA==
X-Received: by 2002:a17:906:c43:: with SMTP id t3mr951636ejf.219.1603919185437;
        Wed, 28 Oct 2020 14:06:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/33] gnutls: update 3.16.4 -> 3.16.5
Date: Wed, 28 Oct 2020 22:05:47 +0100
Message-Id: <20201028210558.21070-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...se-to-GPLv2.1-to-keep-with-LICENSE-f.patch |  90 --------------
 .../gnutls/gnutls/CVE-2020-24659.patch        | 117 ------------------
 .../{gnutls_3.6.14.bb => gnutls_3.6.15.bb}    |   6 +-
 3 files changed, 2 insertions(+), 211 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
 delete mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.14.bb => gnutls_3.6.15.bb} (91%)

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
deleted file mode 100644
index a610abf9b5..0000000000
--- a/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From c0ae3f659c6c130d151378ba4d7d861e3b7b970f Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@cn.fujitsu.com>
-Date: Wed, 8 Jul 2020 14:50:27 +0900
-Subject: [PATCH] Modied the license to GPLv2.1+ to keep with LICENSE file.
-
-Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
-Please reference to https://gitlab.com/gnutls/gnutls/-/issues/1018.
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/1285].
----
- lib/x509/krb5.c | 20 +++++++++++---------
- lib/x509/krb5.h | 20 +++++++++++---------
- 2 files changed, 22 insertions(+), 18 deletions(-)
-
-diff --git a/lib/x509/krb5.c b/lib/x509/krb5.c
-index 7fe84e6..d68c737 100644
---- a/lib/x509/krb5.c
-+++ b/lib/x509/krb5.c
-@@ -1,21 +1,23 @@
- /*
-  * Copyright (C) 2015 Red Hat, Inc.
-  *
-+ * Author: Nikos Mavrogiannopoulos
-+ *
-  * This file is part of GnuTLS.
-  *
-- * GnuTLS is free software: you can redistribute it and/or modify it
-- * under the terms of the GNU General Public License as published by
-- * the Free Software Foundation, either version 3 of the License, or
-- * (at your option) any later version.
-+ * The GnuTLS is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public License
-+ * as published by the Free Software Foundation; either version 2.1 of
-+ * the License, or (at your option) any later version.
-  *
-- * GnuTLS is distributed in the hope that it will be useful, but
-+ * This library is distributed in the hope that it will be useful, but
-  * WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- * General Public License for more details.
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with this program.  If not, see <https://www.gnu.org/licenses/>
-  *
-- * You should have received a copy of the GNU General Public License
-- * along with this program.  If not, see
-- * <https://www.gnu.org/licenses/>.
-  */
- 
- #include <config.h>
-diff --git a/lib/x509/krb5.h b/lib/x509/krb5.h
-index d8926af..815bb28 100644
---- a/lib/x509/krb5.h
-+++ b/lib/x509/krb5.h
-@@ -1,21 +1,23 @@
- /*
-  * Copyright (C) 2015 Red Hat, Inc.
-  *
-+ * Author: Nikos Mavrogiannopoulos
-+ *
-  * This file is part of GnuTLS.
-  *
-- * GnuTLS is free software: you can redistribute it and/or modify it
-- * under the terms of the GNU General Public License as published by
-- * the Free Software Foundation, either version 3 of the License, or
-- * (at your option) any later version.
-+ * The GnuTLS is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public License
-+ * as published by the Free Software Foundation; either version 2.1 of
-+ * the License, or (at your option) any later version.
-  *
-- * GnuTLS is distributed in the hope that it will be useful, but
-+ * This library is distributed in the hope that it will be useful, but
-  * WITHOUT ANY WARRANTY; without even the implied warranty of
-  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- * General Public License for more details.
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public License
-+ * along with this program.  If not, see <https://www.gnu.org/licenses/>
-  *
-- * You should have received a copy of the GNU General Public License
-- * along with this program.  If not, see
-- * <https://www.gnu.org/licenses/>.
-  */
- 
- #ifndef GNUTLS_LIB_X509_KRB5_H
--- 
-2.17.1
-
diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch b/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
deleted file mode 100644
index 1702325e66..0000000000
--- a/meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch
+++ /dev/null
@@ -1,117 +0,0 @@
-From 29ee67c205855e848a0a26e6d0e4f65b6b943e0a Mon Sep 17 00:00:00 2001
-From: Daiki Ueno <ueno@gnu.org>
-Date: Sat, 22 Aug 2020 17:19:39 +0200
-Subject: [PATCH] handshake: reject no_renegotiation alert if handshake is
- incomplete
-
-If the initial handshake is incomplete and the server sends a
-no_renegotiation alert, the client should treat it as a fatal error
-even if its level is warning.  Otherwise the same handshake
-state (e.g., DHE parameters) are reused in the next gnutls_handshake
-call, if it is called in the loop idiom:
-
-  do {
-          ret = gnutls_handshake(session);
-  } while (ret < 0 && gnutls_error_is_fatal(ret) == 0);
-
-Signed-off-by: Daiki Ueno <ueno@gnu.org>
-CVE: CVE-2020-24659
-Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls.git]
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
----
- lib/gnutls_int.h                              |   1 +
- lib/handshake.c                               |  48 +++++++++++++-----
- 2 files changed, 36 insertions(+), 13 deletions(-)
-
-diff --git a/lib/gnutls_int.h b/lib/gnutls_int.h
-index bb6c19713..31cec5c0c 100644
---- a/lib/gnutls_int.h
-+++ b/lib/gnutls_int.h
-@@ -1370,6 +1370,7 @@ typedef struct {
- #define HSK_RECORD_SIZE_LIMIT_RECEIVED (1<<26) /* server: record_size_limit extension was seen but not accepted yet */
- #define HSK_OCSP_REQUESTED (1<<27) /* server: client requested OCSP stapling */
- #define HSK_CLIENT_OCSP_REQUESTED (1<<28) /* client: server requested OCSP stapling */
-+#define HSK_SERVER_HELLO_RECEIVED (1<<29) /* client: Server Hello message has been received */
- 
- 	/* The hsk_flags are for use within the ongoing handshake;
- 	 * they are reset to zero prior to handshake start by gnutls_handshake. */
-diff --git a/lib/handshake.c b/lib/handshake.c
-index b40f84b3d..ce2d160e2 100644
---- a/lib/handshake.c
-+++ b/lib/handshake.c
-@@ -2051,6 +2051,8 @@ read_server_hello(gnutls_session_t session,
- 	if (ret < 0)
- 		return gnutls_assert_val(ret);
- 
-+	session->internals.hsk_flags |= HSK_SERVER_HELLO_RECEIVED;
-+
- 	return 0;
- }
- 
-@@ -2575,16 +2577,42 @@ int gnutls_rehandshake(gnutls_session_t session)
- 	return 0;
- }
- 
-+/* This function checks whether the error code should be treated fatal
-+ * or not, and also does the necessary state transition.  In
-+ * particular, in the case of a rehandshake abort it resets the
-+ * handshake's internal state.
-+ */
- inline static int
- _gnutls_abort_handshake(gnutls_session_t session, int ret)
- {
--	if (((ret == GNUTLS_E_WARNING_ALERT_RECEIVED) &&
--	     (gnutls_alert_get(session) == GNUTLS_A_NO_RENEGOTIATION))
--	    || ret == GNUTLS_E_GOT_APPLICATION_DATA)
--		return 0;
-+	switch (ret) {
-+	case GNUTLS_E_WARNING_ALERT_RECEIVED:
-+		if (gnutls_alert_get(session) == GNUTLS_A_NO_RENEGOTIATION) {
-+			/* The server always toleretes a "no_renegotiation" alert. */
-+			if (session->security_parameters.entity == GNUTLS_SERVER) {
-+				STATE = STATE0;
-+				return ret;
-+			}
-+
-+			/* The client should tolerete a "no_renegotiation" alert only if:
-+			 * - the initial handshake has completed, or
-+			 * - a Server Hello is not yet received
-+			 */
-+			if (session->internals.initial_negotiation_completed ||
-+			    !(session->internals.hsk_flags & HSK_SERVER_HELLO_RECEIVED)) {
-+				STATE = STATE0;
-+				return ret;
-+			}
- 
--	/* this doesn't matter */
--	return GNUTLS_E_INTERNAL_ERROR;
-+			return gnutls_assert_val(GNUTLS_E_UNEXPECTED_PACKET);
-+		}
-+		return ret;
-+	case GNUTLS_E_GOT_APPLICATION_DATA:
-+		STATE = STATE0;
-+		return ret;
-+	default:
-+		return ret;
-+	}
- }
- 
- 
-@@ -2747,13 +2774,7 @@ int gnutls_handshake(gnutls_session_t session)
- 	}
- 
- 	if (ret < 0) {
--		/* In the case of a rehandshake abort
--		 * we should reset the handshake's internal state.
--		 */
--		if (_gnutls_abort_handshake(session, ret) == 0)
--			STATE = STATE0;
--
--		return ret;
-+		return _gnutls_abort_handshake(session, ret);
- 	}
- 
- 	/* clear handshake buffer */
--- 
-2.17.0
-
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.15.bb
similarity index 91%
rename from meta/recipes-support/gnutls/gnutls_3.6.14.bb
rename to meta/recipes-support/gnutls/gnutls_3.6.15.bb
index 51578b4b3b..71118bd389 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.15.bb
@@ -19,11 +19,9 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
-           file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
-           file://CVE-2020-24659.patch \
-"
+           "
 
-SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
+SRC_URI[sha256sum] = "0ea8c3283de8d8335d7ae338ef27c53a916f15f382753b174c18b45ffd481558"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.29.0

