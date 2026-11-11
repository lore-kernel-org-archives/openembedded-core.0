Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5578.1794387803668830109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=R11toNDS;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so17373345e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387802; x=1794992602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6aQBoSfHu8+9ID9NUlHNwzNWSDkFw9barSE1k11kPYs=;
        b=R11toNDSNmNTIt78xb9Xf06gAoGtcKiRVJsoDfbhxT4jl8oo1QmxzmauU2DYU1u4Yg
         TcE930jMAfWeLeEJ514w5OxTECMiuHJMNk71ASe11L3Xj4dJ3rEfZr8ol4aYH0pntduO
         SemcC0hDHbqQ5T3bdfd1rjAX0Ap14S2Dquyd5nXdw9fW0kNV6Z0nwGxN5L42Me01Atzh
         yaeuDfnMszTlcOaY5vEuGmJ/vvolm0pNVWtAv01evUPhAvMpjG+ZrUV0eo6TqHbp/EsM
         y43tuAR1Fk3Lr1b2lpC2olS6qtJQ0kOYDC9TuQZ3lc87ixIAOVh76jJ8v3KCzcsdvP78
         YBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387802; x=1794992602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6aQBoSfHu8+9ID9NUlHNwzNWSDkFw9barSE1k11kPYs=;
        b=vEtHeV1W2G833niJk5oXkmL5Nzfhq46eci0zdOy9rnEBaqS5jJKdUzgv2Web5RyDSh
         2LAZtKTdd4JJbeZGfYlpFpkmi8/lB33Qs4jgWTMy0ogxtfRPsusrnBAKc7XhbwzHLW/E
         +yxuP6/lf1dcpAo6/juQy+2PjkMGsVhJRhMcw7oK2xFblmH10DFpjzdANdmvlbm1U9jj
         w/6HZWR29UrnOT5CimnlQe/u3VrQPBD4xXPku/FXbMjCDYYMbcg+5XRj/CSmOv5vNGNO
         jwzi9sdHByuYtT4Ukc1ASyBvvTbTuww/sfbpUBxrslpFBtH19o1RRFeRtcnVESxSc585
         b/1g==
X-Gm-Message-State: APuU4Z8jFegPI9TZaZjAWA+2vh7ErtZpfYG4Wj/XacjrUUA2Be4hWvFy
	p/8zRRDeMkvY9zvmu+miX5dDQki72k+JrnBJMcIgu7V2ovoNKtePeKms62LIXp7qNpLkWk7LwPs
	isw3H3D8=
X-Gm-Gg: AYBFou2/oMlLTW0dfNuHuyuoWFd/LQGEEiCq2boRN58KiloAWfzKIUJivZAGhooH6Hm
	N+uW0eSAQfFFwx0gGnTSZs/Zk47fqX9damwg2Xh04qLsdvhlDHV4ooFL+eUDUw7nu5IWmmwxLub
	2nppxQmRz88LFeiLrAEhnBGNgfDNOOU8t3kNBhf2n6Vn6MamcwAW3vSyEHvvZx6IwGkZq2Bhfyt
	tpD9F32WbjSpy0/Iby8DxL60yj4rXIdLR6T2hxmP9aqPgr+THJT4L9RbbSpz9noX3aiJqgX4Chr
	ip6wgzBljibqkZYAYkr11RjR4pbwLMbNnn3hI1NsJVAQeYWIc9t6vcvey5epgHjX8DB4aqryJ6L
	k7Xctkp+3g8hzcQLGeekvxzR1shAq2t9GErIyBrbNDG5ZYLigbk/DLAEoNThIUANfiJ8mN7E0xP
	DjaT1OarhzRx6P95jVaRH+lkRDH/bD4PHkJKlq/HzAjxJTw5ncbRPahLqFH46t92XINE0qBnNAF
	GKxlChPU/xDIy47v5Iuzkg9bpRqe1l9pbodvJt0q4lIo0tCZCxoGcWOHnaVcS2ro4sncxl7a8sU
	Isx1DByrNZ+N8tjFzMO0VYJGiBZL1I+1nJHx7udT+/LZxVLIxUTwSzRTzHAtZqQO5gNule//gnV
	08MrUqEQhUvvpf6kBYXiTz5X/y90vmg==
X-Received: by 2002:a05:600c:3b04:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4ba091aa686mr29830225e9.0.1794387801822;
        Wed, 11 Nov 2026 01:03:21 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 05/35] bluez5: Fix u128_to_string skipping data[4]
Date: Wed, 11 Nov 2026 10:02:31 +0100
Message-ID: <f88e78304c75c20ea96a742f60033632ca10c719.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249977
Content-Type: text/plain; charset="utf-8"

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

data[3] was used twice, skipping data[4] in the output string.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...p-Fix-u128_to_string-skipping-data-4.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index db650acdd03..75d76cf96de 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -80,6 +80,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
            file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
+           file://0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
new file mode 100644
index 00000000000..338bc228c16
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-obexd-pbap-Fix-u128_to_string-skipping-data-4.patch
@@ -0,0 +1,33 @@
+From 198f4e0785644cea2b2154b383fc4ad354707947 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Wed, 23 Sep 2026 11:29:57 +0800
+Subject: [PATCH] obexd/pbap: Fix u128_to_string skipping data[4]
+
+u128_to_string uses data[3] twice causing data[4] to be skipped and
+DatabaseIdentifier, PrimaryCounter and SecondaryCounter properties to
+be printed with wrong values.
+
+Fixes: 5ee26d43c65c ("obexd/client: Add DatabaseIdentifier property")
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/8b4a4176063831476bc9244d20f43b552e4b5554]
+Assisted-by: opencode:claude-sonnet-5
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ obexd/client/pbap.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
+index 0f575e61e..d89b6aafa 100644
+--- a/obexd/client/pbap.c
++++ b/obexd/client/pbap.c
+@@ -1098,7 +1098,7 @@ static int u128_to_string(uint8_t *data, char *str, size_t len)
+ 	return snprintf(str, len, "%02X%02X%02X%02X%02X%02X%02X%02X"
+ 					"%02X%02X%02X%02X%02X%02X%02X%02X",
+ 					data[0], data[1], data[2], data[3],
+-					data[3], data[5], data[6], data[7],
++					data[4], data[5], data[6], data[7],
+ 					data[8], data[9], data[10], data[11],
+ 					data[12], data[13], data[14], data[15]);
+ }
+-- 
+2.34.1
+
