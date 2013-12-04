Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5CED26DF3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 15:35:54 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so13450937wgh.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 07:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tnF5LoVGV0zVWfuT4Q62hYygjnfD7bZNGw+ROdjW4SE=;
	b=KU9BLSUW0NMpjTljnmsxIaz+63LlDJrQMy7hTDV2oy1TR+T48lQXBfhrE4qE3Y7bGA
	AIHesXgOnEJY0CGATguEUic12Q2NqrjKUlECTuFa9Lk0at9oDC1ZAx5z70noaTXOKal9
	VDI5DP+PhBH8cr+hXnVexgGnuX5VtmD+yF9VbXgjsJOeKUyuQCiuTt/Bef/g/Wp28gJe
	aIPIsBkB8LOVZ1do/nyYodktI0VLrbx2+cTBTH8C25VF+/XMd0OOBQEgBmv4L3tm1qjL
	yZ2QVRn2Rf+E1IioklYGVHuWTkl3dS2/xGMYuRU2IvdS7mMRSW4Hn7uaEWCVVV1vGXiJ
	G4bg==
X-Gm-Message-State: ALoCoQlX91sntcHoPZcpwSLM6NfzY8OgjhxsIfDdySJhgV42Mto1xEiSqnQlvk3EDCbsJEsfyh4e
X-Received: by 10.180.185.101 with SMTP id fb5mr7858990wic.11.1386171353740;
	Wed, 04 Dec 2013 07:35:53 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm7982684wic.4.2013.12.04.07.35.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 07:35:53 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 15:35:42 +0000
Message-Id: <1386171342-7213-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
References: <1386171342-7213-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] xserver: remove unrecognised options
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
X-List-Received-Date: Wed, 04 Dec 2013 15:35:54 -0000

--disable-xorgcfg was removed in 2008.

--with-fontdir was renamed to --with-fontrootdir in 2009 and the default value
is good.

--disable-xf86misc was removed in 2008.

--disable-acfb, -ccfb and -mcfb should have been --disable-afb, -cfb, -mfb, and
were removed in 2008.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc |    6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 969b84e..ebfb814 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -102,12 +102,7 @@ EXTRA_OECONF += "--with-fop=no \
                  --without-xmlto \
                  --with-pic \
                  --disable-static \
-                 --disable-acfb \
-                 --disable-ccfb \
-                 --disable-mcfb \
                  --disable-xinerama \
-                 --disable-xf86misc \
-                 --disable-xorgcfg \
                  --disable-record \
                  --disable-dmx \
                  --disable-xnest \
@@ -117,7 +112,6 @@ EXTRA_OECONF += "--with-fop=no \
                  --with-int10=x86emu \
                  --sysconfdir=/etc/X11 \
                  --localstatedir=/var \
-                 --with-fontdir=${datadir}/fonts/X11 \
                  --with-xkb-output=/var/lib/xkb \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
-- 
1.7.10.4


