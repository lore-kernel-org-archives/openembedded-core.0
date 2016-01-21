Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id F077360670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:52 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id oj9so1833260obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=U3A5d3W5KPpFJ0xUbC1h/sz653ctrunquqMlE3etiHY=;
	b=bm8poEQlQg8T9tzI92L9jX+ZmTXNdTXCRPy1Q0V1Rk8YrSzYveHk7pUXYkYrmKBKWe
	HZqI5H6FiqwFb3SqOSKSt1QhweUMlLvYDDvcGO/01HaG3i7Jeuwibs9dzc7kk2vLdhMF
	FJHpfSktEPx09fADluEhBLv0IEUfcGMNR19d+lxoKu8C4HI8LV4Oy9Ou2vqRic8NtQYc
	1b1luPE0p3G+3p2jnMT5JLgr/1qqpG11Qf+cvAuoAsymcept4JakcFYSp4TYc818pg6o
	Jvv0m6dRpGTw7znF253xP+YNSCEBK9g5uR81nF+n6rO1rPOrxik1V8Aix6/XWlENlfgY
	i18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=U3A5d3W5KPpFJ0xUbC1h/sz653ctrunquqMlE3etiHY=;
	b=YnQjAxQnuLvR96it7e6Wl4GZY2ZHkH3SGG2q/BVWCnVpx0tqTcc3xXH6QcbxwD+uEJ
	SEbqVw9zQMjwsGylnfjXgsfvhhnJPhgeuuc/rYzpANzRJ4wyX3hwyZTaE22FRMlb+CWZ
	y0P1qbFPxJOawXTXmFb5MpPk+jbQIm4eBLM+D4+/yjvplYiELbc7rbgtlpV9dwGXrMVd
	6iQdXPnxBqanfU37EC7AoeARtPe6b/mX7RR9mbxausIbZ6/BXCfxdxXS/dZ1O/1DSjX2
	PgF4IC81TSclwasSVZmw18d7A09TpfxgxCKcWSxtYyXIvcjsJW4ZcgHpkS2Vq8Q0flX3
	zbJg==
X-Gm-Message-State: ALoCoQmvr9FKuc3rpp8V6ZHl0w0Rn1ZeBXT1ZHeHQcDDKL1hJ0m/eANOEnrjsspmW4Y0qGywWj2KvFFCC28ttd9ycpG2JXVDOA==
X-Received: by 10.60.233.103 with SMTP id tv7mr31599759oec.13.1453344233910;
	Wed, 20 Jan 2016 18:43:53 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:53 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:09 -0800
Message-Id: <1453344203-7118-12-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 11/25] gstreamer1.0-rtsp-server.inc: minor formatting improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jan 2016 02:43:53 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
index 65b4876..608842a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server.inc
@@ -1,7 +1,8 @@
 SUMMARY = "A library on top of GStreamer for building an RTSP server"
+HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
 SECTION = "multimedia"
 LICENSE = "LGPLv2"
-HOMEPAGE = "http://cgit.freedesktop.org/gstreamer/gst-rtsp-server/"
+
 DEPENDS = "gstreamer1.0 libcgroup gstreamer1.0-plugins-base"
 
 PNREAL = "gst-rtsp-server"
@@ -11,4 +12,3 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
 inherit autotools pkgconfig upstream-version-is-even
-
-- 
1.9.1


