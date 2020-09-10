Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.20400.1599740600638517046
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UtMgMfeb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id y15so5608134wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zs4GOe+dTQ9k/03DD8S1L8Y/2nUzbV2WmsrC9ZedwYY=;
        b=UtMgMfebzY06qP6J2oghPe5YsGis7U2qql01Ims9dlE6NWARmLo2fHXTVUMWaNa0T+
         lxm/2wl5AuurL7IZqXU3GdSFlwu8ju/ZVMmWaS3Faz8eplCZnLTzh61KeDOTdpikzTEN
         LDhuJ/XHqHFt4ydHcI/SmFmy0msLFSBtzsLLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zs4GOe+dTQ9k/03DD8S1L8Y/2nUzbV2WmsrC9ZedwYY=;
        b=Sv2gBb8s7sLhJdhSIhLjFLmCzyFynNCwRVjrk20EP1zBzwVwTUJsaXT1/OxM/qHbnb
         b53JUJIEMJSwlALq+MK2hhvScL5bmCt6stQNXM0IXFTFwF2ETfiJAOta+rYQVTWDA2TA
         7nP7Cmz8vDLk6znhZo7b79WK1BfFY4PzGHaBMaWwox8ri1msZ/P4BxaVS21c7BoQKOSz
         Oua8v2bu1PJxP9K0s6kJWAM3jtylHLZ5gv50dUy70CJNSQP9n8m9yGVRQuI7u4rdX85Q
         8rjac0COrl6D2YNumoBijZW9M0PxcLfHfZLiIkyRK/5UJxFtiHy71hlGMX3x9p8eerDb
         AVeQ==
X-Gm-Message-State: AOAM533lSvg31JPXpWTCVb3H6WmQ3ukxEok1TTeZQz/FudR711SRVuEG
	njpQURi83y/Oq4qg3dZ7UGfoOMz9hw3y6Q==
X-Google-Smtp-Source: ABdhPJyyjkbOVkP+ubPHMAgXn0FQPDDGafZBODiOZSKf7OyddI3ZjQhTt7L44Lzek1cwgNB82KH+cg==
X-Received: by 2002:a7b:c4d9:: with SMTP id g25mr8184486wmk.15.1599740598888;
        Thu, 10 Sep 2020 05:23:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:18 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][warrior 13/22] buildtools-extended-tarball: add nativesdk-libxcrypt-dev
Date: Thu, 10 Sep 2020 13:22:57 +0100
Message-Id: <20200910122306.2040194-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

virtual/crypt-native is assume provided in bitbake.conf, so
buildtools-extended-tarball shoud provide crypt since it doesn't
use the host's headers/libraries.

[YOCTO #13714]

(From OE-Core rev: da948b25d5ef452fb35275d108e18d2a2829f4fb)

(From OE-Core rev: bc42406d83310398bc4d4db4244252411eff117d)

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 32a10198c93..94ed57585b7 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -28,6 +28,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
     nativesdk-python \
+    nativesdk-libxcrypt-dev \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

