Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id D0D2F6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:04 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id oj9so1833495obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Somk8fQPf9dK2Qb/etw2eGfkR6Y9QohY1/gHAhVk9TQ=;
	b=MnXlzyCBeDOaP5Nxig6XAZ+dWGHMdvH0UQI96mCIHeSOlnlvEiTJOeVmNPkxHnJ7Ph
	soQpKCqfrMCMwmaHc/y1wP4YSYxxrELLliXJuvcOrKw/cfgXA/OIQE9KSd9dCz+qxe2E
	xYVzl/Z1LTUWz3xfzOCoDUibGZU3eGblO5pj4L6S8fhCK8weO5ayGkcLlv/ecTj/lEo2
	bZEjcvQIhK8cwLSXRFAg0fnflib45m4IzbDDdljDN8VeFdQAgattbwmkSJstHUtdUGJG
	+umrZu8g5JwdQ4LbM2BgNHqcb0KZ5bAP+H1yiTg3V6/Yc3H8+hlBOrUNBeRvVVlJPGkA
	wj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Somk8fQPf9dK2Qb/etw2eGfkR6Y9QohY1/gHAhVk9TQ=;
	b=Ka6zyYKC01MVuyStiYqrZDs47E3P04fxz3q3WAUk34r393BRDG8fS4kKCqk4q2/6um
	G1/X+2Onfpz/nxRgjIHzGyHHVHL5LKiJ4reqE6wC8JhzETE+Yy3MUgZUdzuBMOLWBBZ6
	A1QHaH8yKIoILAWHTdm3ZisHZvNzhxY4DjjszozgXDH26cfb/uhcyDi63qyUs9mItVrS
	Y/dGAf5FWLdOehcjzgdEcdaaebmd3F/lc0MAu27kv70lOcRm/+VUH05Le8oSAhwU27pt
	rIl/m20eQBRx9ztVFyJas0xVJw9LWoOt7XttTkUFznAfwnGglnuteIWNQp3Balb4GjbG
	Svwg==
X-Gm-Message-State: AG10YORfkRFphgMmHWNv1GIy/ip3qZensPFUVVE5x+WS+mE7sZT0aSCghi6FetSalqPJfQ==
X-Received: by 10.182.75.198 with SMTP id e6mr16591945obw.0.1453344245788;
	Wed, 20 Jan 2016 18:44:05 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:05 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:15 -0800
Message-Id: <1453344203-7118-18-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 17/25] gstreamer1.0-plugins-bad.inc: update hls dependency gnutls -> nettle
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:05 -0000

The HLS plugin requires AES decryption and links with nettle, not
with gnutls.

  http://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/configure.ac?h=1.6&id=7dee47fe39223d8a98615f03f34d9221f9e8a6c1#n3038

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 689d3ad..c4199bd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -33,7 +33,7 @@ PACKAGECONFIG[flite]           = "--enable-flite,--disable-flite,flite-alsa"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[gles2]           = "--enable-gles2,--disable-gles2,virtual/libgles2"
 PACKAGECONFIG[gtk]             = "--enable-gtk3,--disable-gtk3,gtk+3"
-PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,gnutls"
+PACKAGECONFIG[hls]             = "--enable-hls,--disable-hls,nettle"
 PACKAGECONFIG[libmms]          = "--enable-libmms,--disable-libmms,libmms"
 PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 PACKAGECONFIG[modplug]         = "--enable-modplug,--disable-modplug,libmodplug"
-- 
1.9.1


