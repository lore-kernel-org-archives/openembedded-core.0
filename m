Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.10888.1607444018949869645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FwPodIeT;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id c1so4849406wrq.6
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t0ishiMqFrHE4NIsh6aiAat6vItDVrMpJAPmRU9qqIE=;
        b=FwPodIeTd9K2FcUG9232Cz1mmRAmwqhhHI5edwK0BqIpu/TpbG9UCMqLdYep7XgWmy
         zhq6NPSeShM9QlB5LMedQGazoY1tFis7BTQvQVHWAp9G48a/n8wpstgT6LSfqU1FzTj4
         xq5v3Yup+L6XU/le53X+ixZiAU9v2QLuJs6l4C5F+Q48+T23L6a0+pzHcpb5ZZDOqWIS
         tjMaJb6D0scOfUbFyWPTGMJgNn08K+eJQJfoRJJTIeVuTiBsxNvWkJi5PBeH9Gi+N83/
         xfpJADVY/yQj/7ChEfWHllWVsO9ziTCobccEzpoEEsOnJL8xGlai+/qzGFY80IamNuJS
         aEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t0ishiMqFrHE4NIsh6aiAat6vItDVrMpJAPmRU9qqIE=;
        b=We8G9POOv74nHppNjA+043ApCcM3JYVauR0lt1SefAbE2WOkhFFs0i4IUTYe1i4Zja
         yDTxvMhVbUU3p5uR/RRp28YBqwqG417LWR8kbegKL23bWQy8Rs2AYwfE/YJG8QlG5SaP
         2D8JL6aB9yBdRIAiYiDdMnJWnjr16QA1YD5WnQyfjOwj/qy2jLwF8dcOapDgkD8vD7mY
         lePE+kpMcvwiR4MoTFwOnruUhMgZCVBAUdDbZPiTrnh51f+60a0cg9oNMK6S4wRxJ5pY
         G86tQV1IZlnFfuzxr328RlErAXxmXpzMz2wOkA46U1NtvBPDPH+h6bm6yyvzNVxcxIl1
         G3ew==
X-Gm-Message-State: AOAM532Jkv+GTVmyWx+5fvtvbrTg1Yd9XCLohU9l23tzpDWkDzj8Txco
	3bh/CQoBaqeFQB7HIduVndy+ltV6pXI=
X-Google-Smtp-Source: ABdhPJwv2Y95+PpsXf4Ar4+JmYLWvDFmhm2ZjYll/tRjpOPoQGY5/xVoqVK7qnaKpdFDcb1cfIglKA==
X-Received: by 2002:adf:f74e:: with SMTP id z14mr12556832wrp.146.1607444017354;
        Tue, 08 Dec 2020 08:13:37 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:36 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 4/8] gstreamer1.0-plugins-bad: sctp plugin uses the internal usrsctp static lib
Date: Tue,  8 Dec 2020 16:12:53 +0000
Message-Id: <20201208161257.949716-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208161257.949716-1-quaresma.jose@gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usrsctp lib source code is provided in gstreamer plugins bad source tree
and it is builded staticaly for the sctp plugin.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 7016f73c92..dbc9360e1c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -65,7 +65,7 @@ PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdr
 PACKAGECONFIG[rsvg]            = "-Drsvg=enabled,-Drsvg=disabled,librsvg"
 PACKAGECONFIG[rtmp]            = "-Drtmp=enabled,-Drtmp=disabled,rtmpdump"
 PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
-PACKAGECONFIG[sctp]            = "-Dsctp=enabled,-Dsctp=disabled,usrsctp"
+PACKAGECONFIG[sctp]            = "-Dsctp=enabled,-Dsctp=disabled"
 PACKAGECONFIG[smoothstreaming] = "-Dsmoothstreaming=enabled,-Dsmoothstreaming=disabled,libxml2"
 PACKAGECONFIG[sndfile]         = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
 PACKAGECONFIG[srt]             = "-Dsrt=enabled,-Dsrt=disabled,srt"
-- 
2.29.2

