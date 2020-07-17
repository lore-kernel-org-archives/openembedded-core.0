Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.12687.1594996748018029692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qfhuCDRY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id b92so6449609pjc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zVmSp1IdnmpQ/I35h5gAzq0NDo0psFP4qbaJknbQc6k=;
        b=qfhuCDRYsRCITpfAYyABfrrPnMo1NeRdhdksQyHN6j7QsFDWs3Qegy3QAcV0x//ONt
         2+fHFRVmFheR8NGRAoJywkDGHdngE7xS79Ah6zw/HAFWkWoO8tsPlcChsJcvu4sh5ZWL
         fUrIOswKH/JmIf95K/u/iz1FXYQSTPr34tta6pYK+8KR/EABpPVD3+xPGnmYAE4vh7Yw
         n92Vne3vEcNIx+ZfInZEV/X1baiskaKQ7zEoQFV8owSyyrE0qyczxgczXB4iWXKpDXMG
         OMtwoLaXYxxlPGMsSObt32D/e30sR7K/OLE51BpKNEH2hxrasayPcrGhz9GKqddOZ8np
         6wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zVmSp1IdnmpQ/I35h5gAzq0NDo0psFP4qbaJknbQc6k=;
        b=M+z9pCwECr9YMGxJbc1JT3WckaSmDwQiV5VMDDi1ebAV2VsJHJ8GSZ4Te/lbvwYTTG
         v3Cb+aeTz1R9Srjw/iLA+uDzOhJbeQ/EeS6CvdQh4zNzxJ/3A+bLIxGIXuDrGpM617Qy
         iH4Zo7c4jQ3oQMLGVk1/qrFtBAcCRMVRFYPoli5bmZkEUNQrOqTPN8Zo8Rtvyo5hRA0g
         eMzhTCqmTMWrVH80hW4rxtXuHXKT1qJmen7uFKxWgmzNdtpvGgP3soplT+pJQdTe5VuX
         sEKynJMF//O2P4mJlTAV4hd+E4SVZDN3dw4l+QedZ3xVbtxTg4yGBY5tR6sCcNTouwtn
         tm7g==
X-Gm-Message-State: AOAM530RS1+pDLssW1iVFq1fX+M9k4zcdc0RCus3iIGIJrSN9RN0daHx
	9U2Wfz1sN0N9/ZgeBtCInDP3MmpPq18=
X-Google-Smtp-Source: ABdhPJxapOsxcscdZPlxx94EiMRFghDfuxej5KgU2fFvVbpq/NB2787kSd2OtP7rSoglBFmGEO58PA==
X-Received: by 2002:a17:902:820a:: with SMTP id x10mr7841614pln.135.1594996747130;
        Fri, 17 Jul 2020 07:39:07 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.39.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:39:06 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/20] babeltrace: correct the git SRC_URI
Date: Fri, 17 Jul 2020 04:37:22 -1000
Message-Id: <5dd3d61c5c739f31cb87a3c0c924c617b432e8a9.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

The previous one seems to be gone.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b9995f8a8f08bbcb1e0915a7420ec7fb5623d604)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb | 2 +-
 meta/recipes-kernel/lttng/babeltrace_1.5.8.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
index 0791c654f9..7777f9b39b 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6a458c13f18385b7bc5069a6d7b176e"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-2.0 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.0 \
 	   file://run-ptest \
 	   file://0001-tests-do-not-run-test-applications-from-.libs.patch \
            file://0001-Make-manpages-multilib-identical.patch \
diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
index 4d2492a170..9e5d3a7a97 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.linuxfoundation.org/diamon/babeltrace.git;branch=stable-1.5 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
 	   file://run-ptest \
 	  "
 SRCREV = "054a54ae10b01a271afc4f19496c041b10fb414c"
-- 
2.17.1

