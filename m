Return-Path: <scott.branden@broadcom.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id F229460EC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:25:40 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b9so3223856pgk.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=kS4QKePr8F+AOPtodMoZO6PMKn7+nTF8YN7z0i/pq4E=;
	b=h5n6NSHgZAXgJLS9R/OojO4VSZ8oSV6VDa/Kfv5TaUbebc+O2+LhNRqzHf1D9TnRG5
	RgjTVgf0r0ZRm6+9UybP2SRu1Pr+6rR0QXLK1zrvNaxoi5ltvjDIWgupUrbdEGKG3IRo
	TwDJ9TtDKzAG2ZdTkgxnJ7hPYj7FjKA5limy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kS4QKePr8F+AOPtodMoZO6PMKn7+nTF8YN7z0i/pq4E=;
	b=ow7TOKF7dv3qJPRJOBqT1jGjkDma4EzIFEzXt0uwbFykw9NcxdPoyRl53DgWX50i1Y
	JOFt5kltDGWGw/vy3jRxm8ztRIOmghUGtgp75zkYydx2ltHljl2iHso6jeBsqy4NyAWu
	5u1cJ2efDlR1jkr/wb9Q9pWePLVI+2NTYAMAwBAAujlr1KmqDuzjPjtQR52KelXVBExl
	K76Qc5hdGiHlaRPXIcakv+VmI3R58OnVyi9tGPmiWtrNFVppWXQ2/ArJYFISx3GmVIZ3
	llpr3ZFQNuD8RxqOR2B8OR9WrCavx6o5jkyqsOtImNH5cZvlR68BmIwTvxDIwSfeHZC6
	jerQ==
X-Gm-Message-State: APjAAAVsmHMFX2ZNfKkbJykFIAtpsY4G4avbcR3xBcvBoZ6ulsrnvIO7
	5kmxSMjbJHPsWs43/RfAB/x6HQ2vzmdqAmzJrYIUhSYLZHUGrBSnkJ1H32mlP5BS+EPIVuzn9kX
	VMsEX9xWhl3OW8VtU2siS+BT8k10A6Pomh58zCj2+9F/WKAxybGQo32P5bM/Nk/DC3+Gpyj947q
	nlCQHuNxrmGclNJUT0e8ElLRdFbnY=
X-Google-Smtp-Source: APXvYqynDIER9e+/RDXCB4HUY/jBrB3GThA347g8kP4pMVH/pz2JPy0x+txi5k1Nouh0pXvfrLu1nw==
X-Received: by 2002:a63:8f49:: with SMTP id r9mr19133207pgn.190.1581611141735; 
	Thu, 13 Feb 2020 08:25:41 -0800 (PST)
Received: from lbrmn-lnxub113.broadcom.net ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	y10sm3693804pfq.110.2020.02.13.08.25.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 08:25:40 -0800 (PST)
From: Scott Branden <scott.branden@broadcom.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Feb 2020 08:25:33 -0800
Message-Id: <20200213162533.3755-1-scott.branden@broadcom.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] ffmpeg: add PACKAGECONFIG support for x265
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
X-List-Received-Date: Thu, 13 Feb 2020 16:25:41 -0000

Add PACKAGECONFIG support for x265 in ffmpeg.

Signed-off-by: Scott Branden <scott.branden@broadcom.com>
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
index a3cf0c1a37..20a8249b02 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
@@ -74,6 +74,7 @@ PACKAGECONFIG[vaapi] = "--enable-vaapi,--disable-vaapi,libva"
 PACKAGECONFIG[vdpau] = "--enable-vdpau,--disable-vdpau,libvdpau"
 PACKAGECONFIG[vpx] = "--enable-libvpx,--disable-libvpx,libvpx"
 PACKAGECONFIG[x264] = "--enable-libx264,--disable-libx264,x264"
+PACKAGECONFIG[x265] = "--enable-libx265,--disable-libx265,x265"
 PACKAGECONFIG[xcb] = "--enable-libxcb,--disable-libxcb,libxcb"
 PACKAGECONFIG[xv] = "--enable-outdev=xv,--disable-outdev=xv,libxv"
 PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
-- 
2.17.1


