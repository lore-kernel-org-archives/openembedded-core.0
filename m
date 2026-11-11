Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5596.1794387800016281697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 01:03:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=a8fEcQ2c;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso20228985e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 01:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794387798; x=1794992598; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A6ALfuBkKFSyd08eY756kxmq016kK63NatAuKWod26U=;
        b=a8fEcQ2cPProQVVHSnXS+wxa5v//57xu9AswajIt0oU0Gz4GG0SKuEh0SkqvUPVlNl
         UTt/gPAs0zgTpWtkx78QbtsKLxMTfFuxM446TVH3hXJjJHJ/xIb4TG2APMENww1HjFQz
         a4JbbZajfETHubj7zJn1cF/6qbMwTvWV6b/buaN1raPmKkc6VFg+R5vKN5UW3UcbH/2z
         HUyMQfGUHNaDPKJRWkChSkmtfqf1RDygzaN4UY2IOH7AiOl1jOh7i5m2Wu+DzDmwL+xQ
         7UhtdnEgm+reVSxJXsIi+c+g/JBAoCO0KxzmK3A9+2wh8Oo5zFlVC05Qdx63fxW2isJx
         hN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387798; x=1794992598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A6ALfuBkKFSyd08eY756kxmq016kK63NatAuKWod26U=;
        b=aEekDObwPa8bYSbtLSvA1ZSq2feED30ThhoMSVYATQlPqsJiAFEOmYbMuOuQNlDYog
         tgp73AkSkVdY3S3oEbeFSXwAC9JO8cEGE33Ha3h+7jZja4G3mgTErJxNHyEiTg5R4ig/
         VnM31UbGjTjPQkwfRocHK1dOScAPXdxnL8bljs/hHJ2mIA2viGC6ldCO1crfYqyRsCqd
         4Kf2vJVuNH/AjtA+C2jKdkfD+jdSA6i5lzgSq2RNRyYBslGG7LcUoWjvB7VakfKYNbeT
         ptvMuekwZUsJ6X0T9lVqvE+snPLq6gue4rmd94NMT6yVfYgHF8NTLzXWaHUSTcmXbbti
         ssMQ==
X-Gm-Message-State: APuU4Z+02KZEe6hcKx1yl6vgdTHHmLZ56Qg54jXXrMdKtwpdOUnaNZdY
	Wud0YpEHVdDpVDXo2wzJPgazEUBhsqyRUs0mEQtGyZaTVfItQ/QJ8xA/Y8K5i0cBTLAFbXicUQh
	htRUm1WY=
X-Gm-Gg: AYBFou0f9aGIDMWPZV11fGiOArf4oi9q9EIXMi1HxRfKcM/9eoe5OHcc+oiTMPnvesu
	300FaxyYmGPIOUUTb9xw6AzQOAm+u6WnaeeDuaqYU+g6UZrLtBpKNz/Uf63TffTNLEaHq4no212
	YiIHcg9WuyDbAVOvUhrONKA9D+8bnfF5fbeyiUjYFx/DI4dst8vvyHI/adHENg7zWAWUYxWL2fb
	o8N9TmBMYIXVrp4Esy57/oHLGKG2vz4nuJK7/0lsrPmixQf8zLILkJ1G7VqriEmAhFmna250cqM
	TUQ39ZnlUs6Y5Wp+0km/5vpeHVrDUCc8tfQktCGgvgLLAFf9i81ZBv2pHqafFfhD0Pkxmelcn80
	riItpkvCp/ySVeS+X94KNUHP7v36Ok+g3KZYdE8aKUlxMkN12/eC78hGfqlmJaRNXugAK+5u/nn
	HcAoSwxzE5sz+BmHekl/avjQVmFmzPMQiVexntUY3Ly0vmiUt3P0jjzmhHi6OMiosKR/tGTdfEo
	0VVQfUE0iLI3pUceVnhrEzwmDAj0dyVfdQvFgGjhZkkAe3PPUlVJ2D1/fLXz8zMwPLw5RvIuGWi
	p6MfkXYTJuJhSGv4nIkbOTCIVc0HS0RqS8GAm58r+jfDVfL9ygSswBKJJ4HLgyMNUWvKFclUr3h
	8Ji846VwuUVYA5KEhTWGuA2yt6GN9
X-Received: by 2002:a05:600c:190a:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4ba0931ed3amr30937945e9.4.1794387798182;
        Wed, 11 Nov 2026 01:03:18 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm147623675e9.9.2026.11.11.01.03.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:03:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 02/35] bluez5: Fix GET_CONFIGURATION cmd
Date: Wed, 11 Nov 2026 10:02:28 +0100
Message-ID: <c1358e7ab7933b8a96e76e3ff2be5452946119ae.1794387482.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1794387482.git.yoann.congal@smile.fr>
References: <cover.1794387482.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249974
Content-Type: text/plain; charset="utf-8"

From: Jinwang Li <jinwang.li@oss.qualcomm.com>

Check the resolved stream instead of an always-NULL sep pointer
when testing for BAD_ACP_SEID.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 169269d3771..7e05bda4f13 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -77,6 +77,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
+           file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
new file mode 100644
index 00000000000..3226ba39bec
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
@@ -0,0 +1,36 @@
+From 8e5ca68aeee22970e3ccf3bbb30c050938ba09a2 Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Mon, 8 Jun 2026 13:29:22 +0200
+Subject: [PATCH] avdtp: Fix GET_CONFIGURATION cmd
+
+This fixes AVDTP/SNK/ACP/SIG/SMG/BV-12-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/60437c06560e46d211aaf99620cc9510dfd8081f]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index d475a545e..7cfc9a80d 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1641,7 +1641,6 @@ static gboolean avdtp_getconf_cmd(struct avdtp *session, uint8_t transaction,
+ 					struct seid_req *req, int size)
+ {
+ 	GSList *l;
+-	struct avdtp_local_sep *sep = NULL;
+ 	struct avdtp_stream *stream;
+ 	int rsp_size;
+ 	uint8_t err;
+@@ -1656,7 +1655,7 @@ static gboolean avdtp_getconf_cmd(struct avdtp *session, uint8_t transaction,
+ 	memset(buf, 0, sizeof(buf));
+ 
+ 	stream = find_stream_by_lseid(session, req->acp_seid);
+-	if (!sep) {
++	if (!stream) {
+ 		err = AVDTP_BAD_ACP_SEID;
+ 		goto failed;
+ 	}
+-- 
+2.34.1
+
