Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.2890.1593155962603136859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 00:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=T7KwnDrE;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id dp18so8355812ejc.8
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 00:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxK58c+Vh+H3Z35Pagjv1PRtmpi3n/bBdKZD2kuRMT0=;
        b=T7KwnDrEadpdygTqTPpQIofXXsUitLTafIIwWToTf0R6F+Kipb78BsdzHMEd2D8YwM
         BW1PVAcpFL7AuIHuEojggnybdMP+Cuj5vG2py75ZXCKvC0dTA+f35RSmFayEDSxjqikS
         7Lu75RGo6daw3oUc365DrAVSWcsa4JNWN/yG9FQGm4Ob7vXS5cNrqu4RYrfnU2l+3Zyr
         DBMq7it/iTWf7WlDVMhw48JCVdFGu+4FHoUd1k2STdmIggj+gfcUsxyyWbXH4l05F/iq
         W3mMqEk2GSw3lebZHRxVLphzRMyCd8fBpZlFNx1OLwMe/oSvzWspXMvHSEeocvn/p7M2
         HWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxK58c+Vh+H3Z35Pagjv1PRtmpi3n/bBdKZD2kuRMT0=;
        b=tk105MFIN0yTA4CmZCJqgI+YLgnkREfVjfKRRjUl3dHo9cKYThSh9Ttpozyow0G8j8
         UoyfrfVqSIAOaRM7GoLyS+dFS1K4pvCbyE9Q4wvqirXZeMtqdawS/y4BEKp80wFljxbS
         Q6o14NKYZoB7wGLN3r7RbIxcLEuK/LnLF+y9shHTlpfSBG/QIaNTeBLzIsIqweddlXDk
         0yRFU+VRoB52RXvfVRw/V4K3zMsqYr5wanHAscxQYr3j3r/vESK0fPf9/P9qE0//zO8a
         N5mM2BWSvtuTiPkd2Er1KBGVZdA4J+ZxF4F+GLt2dFckdeY62UGsmMvA471x+0pOsc3w
         /g9w==
X-Gm-Message-State: AOAM5324mcNoCn6e6Ld7EWPUnowPaWKabCjDabZ3zpxQHQnPBdru4jzP
	6D2YxCkLNgWCMd85Hdet0lip+RpgyO0=
X-Google-Smtp-Source: ABdhPJzSvcACEOX6WkK15MxWZXqOh15C8R+v2/XzOsz+asaAtgcbzADqeN3KpDavAcwXDkQUF9KL+A==
X-Received: by 2002:a17:906:ccd3:: with SMTP id ot19mr1508509ejb.468.1593155960893;
        Fri, 26 Jun 2020 00:19:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id p4sm20826194edj.64.2020.06.26.00.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 00:19:20 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/30] alsa-ucm-conf: upgrade 1.2.2 -> 1.2.3
Date: Fri, 26 Jun 2020 09:18:33 +0200
Message-Id: <20200626071844.29134-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626071844.29134-1-alex.kanavin@gmail.com>
References: <20200626071844.29134-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../alsa/{alsa-ucm-conf_1.2.2.bb => alsa-ucm-conf_1.2.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-ucm-conf_1.2.2.bb => alsa-ucm-conf_1.2.3.bb} (85%)

diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.2.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.3.bb
similarity index 85%
rename from meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.2.bb
rename to meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.3.bb
index 1a524d49b2..19eeabff78 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.3.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7ebfd929bc85a51f16fa3c8c4db13faa2ea6ff2b2266fc36d6198bdafe73c40c"
+SRC_URI[sha256sum] = "1bc24da04bb27a75e323c9f0fb03e44705b6bb8a8baf255b94b41d457d590d00"
 
 inherit allarch
 
-- 
2.27.0

