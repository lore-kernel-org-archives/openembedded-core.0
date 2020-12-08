Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.10890.1607444020209463566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 08:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kj28CyGC;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id v14so2508805wml.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 08:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oFV18YO9QPotBSSsUQTkGD1FPmIwBPA/Utd+TO4+OAo=;
        b=Kj28CyGC2JS5u1hcK1sakX0NBA2SHXgym3Z3inuMQ3qpOMRpgOqoCgFFLeS8CSp/2f
         +Vo7QQM45uV8wc9Yu/1ToRprDod3Iz0WjY7dTwXNG0qHrXU+s9bPzfGRW3kO/6PyWATw
         gXFjr9YDD+nIvBl/5tgfrUfQrZdzL7X7vywIQjum3Ug0Eo14pjsj+ij/n/JAhORYty3W
         x62gGXaaxiIJ1xvZIIAlcri4LHTon1xsvF+zRTAqeaFpO1Hpfa3I0bcU8d/Lm0jqAZEE
         sW4POZeG2VL8ZUeoLnHX/E82mukmH2LUx2ypbLs0/OvRR+mNB1MS5nw7kZV41tRnUeoU
         Hp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oFV18YO9QPotBSSsUQTkGD1FPmIwBPA/Utd+TO4+OAo=;
        b=Z13ptBWRFt2j+M6ONwrB9+CFvKfOxK5dQIGC53x/lEEGduwzJQ6yQXqb5KIOv1iRgs
         9twKOIogpRiR7sd7NQMFpe+ILY4CwJYXtrffL5wQ5DXarV71aYdbzjAJ3Mq1KuKvcPJF
         ZT+yFBS8l5s68WV/a2KHogbqZgt1dCTPGspZuXhsK7SqUnvqRe524li7ZydSmEfBi7/m
         tKfkvU61ZJM9h98utiksmiXLlG6TY3mga+uZqQ1uZIU1XZDJufF4EGmy5QVDtzEpbSi/
         Vf+cMCax6gQ/4wyMKCY8hvlOa7/pjBhM6rEQxXgG67EVEqg6ZUVkrsusW5wveGZF/LZr
         pF7A==
X-Gm-Message-State: AOAM532Q74MwuD228Uz4gLLRNsr7TwcN4FDCLznBtTGC8dsaJHsyW5PK
	45pr6m8TbeyaD++6OXKjrksgGok/rxA=
X-Google-Smtp-Source: ABdhPJybby5oeVjrdL6qhZUTV5wI4v/FqKjkKTTxNp5kccRYX+c/vC0SnXOJt6mzovIomqS7GLAwAA==
X-Received: by 2002:a1c:5654:: with SMTP id k81mr4597187wmb.100.1607444018496;
        Tue, 08 Dec 2020 08:13:38 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id 35sm15232307wrf.9.2020.12.08.08.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 08:13:37 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 5/8] gstreamer1.0-plugins-bad: remove unsupported plugins comment
Date: Tue,  8 Dec 2020 16:12:54 +0000
Message-Id: <20201208161257.949716-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208161257.949716-1-quaresma.jose@gmail.com>
References: <20201208161257.949716-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- all of the unsupported plugins are explicitly disabled on EXTRA_OEMESON

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb           | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index dbc9360e1c..adddceb799 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -85,13 +85,6 @@ PACKAGECONFIG[webrtcdsp]       = "-Dwebrtcdsp=enabled,-Dwebrtcdsp=disabled,webrt
 PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 PACKAGECONFIG[x265]            = "-Dx265=enabled,-Dx265=disabled,x265"
 
-# these plugins currently have no corresponding library in OE-core or meta-openembedded:
-#   androidmedia applemedia bs2b chromaprint d3dvideosink
-#   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
-#   mplex musepack nvdec nvenc ofa openexr openni2 opensles
-#   soundtouch spandsp teletext wasapi wildmidi winks
-#   winscreencap wpe
-
 EXTRA_OEMESON += " \
     -Ddoc=disabled \
     -Ddecklink=enabled \
-- 
2.29.2

