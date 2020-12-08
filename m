Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.9750.1607440133745639653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=byFYlWrG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id c198so2346748wmd.0
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9nVSiGyS005oH6Y2DRqfNTQXTwyvq9jw8kI8xJRwg2M=;
        b=byFYlWrGvKX6Wb4fRhlklPK3LvhmJ9HkdTtLtZzuAHKkV5XWdl+i8MU31AFXd97g4f
         0W44q2nHH44rELFqiqPIQvsqtgzqBrdvt/sR1eZ+QxdbrpxFPGzjUewgT8TgBTU0efEp
         s8BACVZr3ViJSjVpkVpOI9S8tXflmnHijFiwIAM78rFXISHR/puK/lSiZvPmYvwN32rJ
         DDSRapaSdw+Rq9zrWmYkhnTfsdrdUiSnr6Lt1zicgZsvGbnDIATOX39jiKoL2NLw033E
         4I6P8rMGca3FQhhXOb4ndwz/91hV7pWZQ6SQin85AInLVcoHTRzqBYXZzrnlc4Rdn5P6
         /u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9nVSiGyS005oH6Y2DRqfNTQXTwyvq9jw8kI8xJRwg2M=;
        b=AMtGItgmpvEZQkZx7/oyoYr43r9yduXmSEJRtsvf2l7xaxd8IPnowiXMhe6u1wmvIT
         sEe6myDVy/78Wx7lYMS9btAK4cdas7YKfkLXIAY8DU9/gLvbWzw5V6fEimXB+z4ckonf
         U7qTJpJukyxbaHGjrWI+hXq3aG0VeMiPQNFLEksLZi4f8TSwGSnCC1qs5LyD0VoB/bM5
         7PWqfisFdbHoMRDBEyYb4t8LebWpeL/uS+fdygS8S4nN3OtQgF3r5Ijw3Y24gBoRA+RL
         fFbMyeJ/sXBa4ehcpVImS6eSswUxkey5yvyuY392u7yuqHfTTkDTo48keeAfsinqxKns
         PhCA==
X-Gm-Message-State: AOAM5336hjs0VX37V00DPXYkZ2sTa/COAy7USysrdgg/nsAfa0oxtB3l
	WSXI1fO6gkjCY4aTn4BhtBVGYJxqFUo=
X-Google-Smtp-Source: ABdhPJxk3rFOFemohj/38QnmrZaN27VWgeMdlmRfayppGkVmAuNPLqCH649IQpaA4rDy0KhM5LP2Gw==
X-Received: by 2002:a1c:40c:: with SMTP id 12mr4232073wme.40.1607440131988;
        Tue, 08 Dec 2020 07:08:51 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:51 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 7/8] gstreamer1.0-plugins-bad: transcode plugin external deps is always present
Date: Tue,  8 Dec 2020 15:08:15 +0000
Message-Id: <20201208150816.744752-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

it only needs gstreamer-pbutils-1.0 from gst-plugins-base

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 58604d33a2..f0764e0852 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -92,6 +92,7 @@ EXTRA_OEMESON += " \
     -Dfbdev=enabled \
     -Dipcpipeline=enabled \
     -Dshm=enabled \
+    -Dtranscode=enabled \
     -Dandroidmedia=disabled \
     -Dapplemedia=disabled \
     -Davtp=disabled \
-- 
2.29.2

