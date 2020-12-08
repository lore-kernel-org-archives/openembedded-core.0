Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9747.1607440126691067469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VKtZo3OX;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id a3so2645815wmb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rzMeH0jPgn5h2kwtQe5kW3nJQJ85va1qM5Din74Sw5Q=;
        b=VKtZo3OXvXC5cZN910rMii2n1OcpeyiO6EAHb0zOs02JQcPgsBewwO261Kcs4DDXGY
         pXiOirCzypCg1fL1tKYbp/EXMlKJQhHsg/TvDCAADb010qVDJGGqHubfkQiflT/Ycap6
         m67y20ABjTERQzDgwasibTuGxJciY1p8zvEI8o/Hw9YyTvR89BJO3WfmcN3gYt+IYTb2
         9Ji3GQnaGudZvkQskD2MRTVRdPfiP3jxAnxlHyLkJZZcyQMLflSE+A66sciSYEg629of
         PWudt10isZ2fhr0vJIN6J8MwSQHgddTGHpy9XbN3XxR1n2lUodxkXBWWLUKEDrFnpISU
         +JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzMeH0jPgn5h2kwtQe5kW3nJQJ85va1qM5Din74Sw5Q=;
        b=gqPTZDjngbbTsDhZXnEP42LT7U5vIiaYsfrZHe4dcbOcgoE8KiiINWLyvyGvXzs3A6
         1cVpH+RZELzuzNZXuafeUfHF9ceSGMSpOiejnUy/KeJkbLMYisDUHK8t7tIG3QQLqyAy
         ruSadtlUs0z85DIlPBkSwEmjQH8KYI7nTQy8gpzYc0jLIHAEgP4DYxJMjnv3bKUUnoy5
         O54R+G+fJZlRPULxQdsNPlDH0N+D2R/R6WQHDYfKfha77yg+aBWv1HdcJfjrQDji1/+F
         I5LwuhQMncO726A0QHQluCSHwcU4onRE2eSkLde/ctDU+fZ985jEMv1WhJWLLQWyhKQP
         jt2w==
X-Gm-Message-State: AOAM531OF3GA+E3BkEov8IOJ9xpIHcf7fV91ZvgLGkDWz3uTySenD5Zr
	KXhy65VIcCfMHbwWPh1WRSqggH78aC0=
X-Google-Smtp-Source: ABdhPJzqyAuywQ55mKCNNydRg3f6c8m70y6c//mSoUTYR5LkNFQukvlRGZIuFa+Q/Jz90he2n83KWQ==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr4350769wmd.6.1607440124829;
        Tue, 08 Dec 2020 07:08:44 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:44 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/8] gstreamer1.0-plugins-bad: add support for aom plugin
Date: Tue,  8 Dec 2020 15:08:10 +0000
Message-Id: <20201208150816.744752-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index f2b8a21abc..9de99f60e6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -27,6 +27,7 @@ PACKAGECONFIG ??= " \
     ttml uvch264 webp \
 "
 
+PACKAGECONFIG[aom]             = "-Daom=enabled,-Daom=disabled,aom"
 PACKAGECONFIG[assrender]       = "-Dassrender=enabled,-Dassrender=disabled,libass"
 PACKAGECONFIG[bluez]           = "-Dbluez=enabled,-Dbluez=disabled,bluez5"
 PACKAGECONFIG[bz2]             = "-Dbz2=enabled,-Dbz2=disabled,bzip2"
@@ -84,7 +85,7 @@ PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrt
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
-#   aom androidmedia applemedia bs2b chromaprint d3dvideosink
+#   androidmedia applemedia bs2b chromaprint d3dvideosink
 #   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
 #   mplex musepack nvdec nvenc ofa openexr openni2 opensles
 #   soundtouch spandsp teletext wasapi wildmidi winks
@@ -98,7 +99,6 @@ EXTRA_OEMESON += " \
     -Dipcpipeline=enabled \
     -Dnetsim=enabled \
     -Dshm=enabled \
-    -Daom=disabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Davtp=disabled \
-- 
2.29.2

