Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE7F65CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 15:21:20 +0000 (UTC)
Received: by wixw10 with SMTP id w10so72389610wix.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 08:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=raGcMqhKdzYLwjroBWsPNRt7wXheDdt293IwZwpQzUc=;
	b=ZHSQupxxP8YbKaJVVFjjkSAxaSL3un5vtZdXTUzrVNGcv4KFBcbRJdUwW8n3FsNTAz
	hoiJ++F4GlgQRRThTjnfM05Bn/QU/C8hGq8la9EOD/ATiEd7dlt1AX4mB3pvzWNSr1ta
	w/Uz0MHRKgtumTMTtSdj8YjmrhxkCoLzy+PmYJ0kOzVtTbB+zV+mxNKpsxihHJtcQwpX
	m3PKvJS4ZOcK8OYv12RHv/21ILGQBX82NkdbBeAN8fug5MgO8IxD8E3Mql0g70WupLFY
	yzadfEZC8G8jSlHVc4FjsLRr9/ZQuHAxR1XXBxTQM9FdcWS4tGVN9OlDuuQzA12OGePq
	4dTg==
X-Gm-Message-State: ALoCoQnAFixdwa0Pg+ZngmF6/hI4ok9VEfYKr5UoIuH5c7IgBOIX0Tfr+8uyYBxjj4v3qX0Diy4+
X-Received: by 10.194.11.9 with SMTP id m9mr150423134wjb.82.1426778481781;
	Thu, 19 Mar 2015 08:21:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id s5sm2786488wia.1.2015.03.19.08.21.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Mar 2015 08:21:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 15:18:24 +0000
Message-Id: <1426778304-10674-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libav: add PACKAGECONFIG for VA-API
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
X-List-Received-Date: Thu, 19 Mar 2015 15:21:21 -0000

Intel BSPs want to enable VA-API support so add a PACKAGECONFIG statement to
enable it if required.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/libav/libav.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multimedia/libav/libav.inc
index 21c29fc..a2f0b81 100644
--- a/meta/recipes-multimedia/libav/libav.inc
+++ b/meta/recipes-multimedia/libav/libav.inc
@@ -47,6 +47,7 @@ PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[schroedinger] = "--enable-libschroedinger,--disable-libschroedinger,schroedinger"
 PACKAGECONFIG[speex] = "--enable-libspeex,--disable-libspeex,speex"
 PACKAGECONFIG[theora] = "--enable-libtheora,--disable-libtheora,libtheora"
+PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x11] = "--enable-x11grab,--disable-x11grab,virtual/libx11 libxfixes libxext xproto virtual/libsdl"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
-- 
1.7.10.4


