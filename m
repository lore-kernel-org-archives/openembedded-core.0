Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.2561.1615661489048607069
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uVPQpcuB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso3135548oti.11
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7bGos3rAidgeMpUqKwo5MDkltDfCj7Hc8u+lvAfafgk=;
        b=uVPQpcuBOXAjHIb56cl2EHBJbq2gllF0UWuvhTL+/LSETqhzOtQSqOGcUa3UkE1B0Z
         13tuuk0qHZsuuyZUmT7TfEXgWigJV13BY4jsTLMxrm9DfX28gfzzvBu4zhtQDpxe1xyE
         HI59WZP3DjgnAQROPE4u0rtP2wjD/pEvHs0oAoADtw6KjyqBocnCJ9cXgjXEVgsCe8nf
         m0XYZ6rMp1qL7RW9psAzsQA8dgyOb1epGvb+H0aHBcHe45ja2Gvc4fG4jNIvhivxwddx
         Y1qQtIBd6FkbSRjFTFqXekER+tak6+BaHB22J8NRv36QKnVWGgoubZ1lLgchHwK6oIhH
         JNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7bGos3rAidgeMpUqKwo5MDkltDfCj7Hc8u+lvAfafgk=;
        b=MUYe7+4rDZK5DDBzbYQ/LsRUIcq+JGVCwCBfMi9tfQf2AazxNPcoTps86xy1SF2idL
         1p1zujlJENwluR5yuSIKbjSQWfAvI0mR83hMsKGfrtI+/Jt1YHg3VV/t8U5+/PJ6e7TU
         O87bzsYYgH3w9xKFxEvKxGWdzjz5Op8lqcP1myyJYxU3Q5c/GWpLXHEALTYk1vy6G5Ib
         XG4CiKD92BVylitFKZAFMIsGc3o3qsuw4BbI+fmqgsm4++zUpfDgFoWFYw3iYc7sr9xt
         o9VYuDzW2EkmGEyg21TBg7al82lIc8iaBJG706ExF/YN+N/QYrZ25HTJeKEDwcdUMbvH
         xWFg==
X-Gm-Message-State: AOAM533vhKmM1Ps5cJtXAPjL8I7UaPe/uaFrf1M9TljnzIcvKsF1bT/E
	h+eD6Lf7AzhN5Ll/AjCqMarT6MKwL1BPnaTb
X-Google-Smtp-Source: ABdhPJz72sP+b07fI45jXyqA+V0zaZDxYteEwbruDbwjeanmRDMy+LT/MTrbDNSbgvVCFKoEAdY63Q==
X-Received: by 2002:a05:6830:15cb:: with SMTP id j11mr7803591otr.126.1615661487882;
        Sat, 13 Mar 2021 10:51:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:27 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 19/38] meta/recipes-multimedia: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:08 -1000
Message-Id: <7711fc4e7a1513d54181939707c4a9e7e08c74fc.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab7a945f6e88db5cc2457823e2a6f942f30ab4e5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
index 9d9b1b8757..af9b2c5a97 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.3.bb
@@ -1,4 +1,5 @@
 SUMMARY = "VA-API support to GStreamer"
+HOMEPAGE = "https://gstreamer.freedesktop.org/"
 DESCRIPTION = "gstreamer-vaapi consists of a collection of VA-API \
 based plugins for GStreamer and helper libraries: `vaapidecode', \
 `vaapiconvert', and `vaapisink'."
-- 
2.25.1

