Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.18908.1603023030982088877
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2020 05:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CS9cxw0d;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id h7so8347136wre.4
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2020 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bSr2/7u4vWzhAPE5VOiBauAobNSrCAmrvAb42xFhP6I=;
        b=CS9cxw0dpfIGu1qsJ09obKWmpzdo+v2JIQPCMcfD/KMA0Siur5Cn7/yD+0lA8TCY3d
         DPg/MW7VZ7Gp7aqwhcp2fq4UfpEdhShbu42TFWEmIR72ChpMMT/b7endZObl0mkStgx9
         M1QaYwAdKMQLvd0Tejsv9aYIL7cfUxApCp1cbRW09Li9X2engkjnwRr1xiCLEmM84DYY
         6qksPQCr7k85w9MLauemk4q/kF1ryt6piy8a+h0wGkvbHgyDR5i6RNcLYCzCk9v8QuEj
         v/WXRQwBjYNZUQa0aX9R+NRlU32Znk9qiEVxsmiOTV0pmeTRAZttet/O1U53w/bZf+Tj
         Qt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bSr2/7u4vWzhAPE5VOiBauAobNSrCAmrvAb42xFhP6I=;
        b=WqtHHQncQ6QtgXh6Hks1zEdZC4G5qXVG8O4jrcAfLTZE2ue8qcH8NUbWOyMZjPl3WA
         soeEXTPvtcH0UlgeFW0PMwRxYDZAhrNEU5UF0vlOBe/CiKia1FzAe3TBGJrE+kT6KxAV
         LhONN66Bo/T3BNsQRhlOueBfDE8sgArMRjm4e6OT/a6RehTSUl5QxbOd+w00YF6MfI8V
         IqZErAs309Fm2wH6ne5Ctnh7cxVVT+uxTNKV60cwK+gnOaASgoZagB3m2p/6Qo8Drztt
         9apfuHXDKDKxXtJ7LOAA5N5iDUBqcvGWpSgOvymZYnZzAYPsoflhDf+Kqr6qAFgQshSO
         Y1Pg==
X-Gm-Message-State: AOAM531JoUtHFeDhjs6aHSoBscxs/hSLJTrOXg9XbvfByDFU4S4uMRIS
	C04XWPMhvrCiVqVFnODd+YjJ8IV//VQ6Gg==
X-Google-Smtp-Source: ABdhPJz79SFukjopcwnZGn5xkVlKQvOY0FexyIk1Yg74qlMAiOJ/BTmSDO1iqxAxR1A1CoWrBkg+aQ==
X-Received: by 2002:adf:ed49:: with SMTP id u9mr14081994wro.88.1603023029248;
        Sun, 18 Oct 2020 05:10:29 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id z18sm9511084wrs.82.2020.10.18.05.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:10:28 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v3 10/20] gstreamer1.0-plugins-bad: add new meson options as PACKAGECONFIG
Date: Sun, 18 Oct 2020 13:09:52 +0100
Message-Id: <20201018121002.1417335-11-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018121002.1417335-1-quaresma.jose@gmail.com>
References: <20201018121002.1417335-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 903ca920f2..8f9036b8ec 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -73,6 +73,7 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+PACKAGECONFIG[va]              = "-Dva=enabled,-Dva=disabled,libva"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader shaderc-native"
@@ -81,6 +82,7 @@ PACKAGECONFIG[webp]            = "-Dwebp=enabled,-Dwebp=disabled,libwebp"
 PACKAGECONFIG[webrtc]          = "-Dwebrtc=enabled,-Dwebrtc=disabled,libnice"
 PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrtc-audio-processing"
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
+PACKAGECONFIG[v4l2codecs]      = "-D-Dv4l2codecs=enabled,-Dv4l2codecs=disabled,libgudev"
 
 # these plugins currently have no corresponding library in OE-core or meta-openembedded:
 #   aom androidmedia applemedia bs2b chromaprint d3dvideosink
-- 
2.28.0

