Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web08.9814.1607440130331949073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kVsu0JL4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id y23so2679008wmi.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DXhScxbvAWOlPnmtxt6nbqyetB+oTpT48Is0HVdHpTI=;
        b=kVsu0JL43M2xM4/qnz0czq5Urx3ZuTYM2h+4SpiL1GkCf7YiKCi1d8JtWTSGz3H0Ik
         dUYen+aKUSVS6QPh8apHqKT8ps3CzALXfEagX+SFRUsyeU/7n5C5v1aGPku2xcO/dEgI
         bKgQ98zwmB2jopVYPFGyl7yXYj2dg6+ISu1YWLQcDir1QrBVJRjKgoR9yHMG9ei6USXK
         E7eQvz8tx/1eM+YtltvCryBF5P9pYW5NIiTzSLM1Jv3yJqSQCkJM9ztXgCs/9ni5Twkt
         DKxF2t+p0oxkOVhZcjr6Qj1Auofbe27VodBl4Jc8H2VLsG0VQReD68Dyml0FgWuL0eEf
         RG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DXhScxbvAWOlPnmtxt6nbqyetB+oTpT48Is0HVdHpTI=;
        b=ogc/67j2gHKg4kn1UeyKUDKAVqa7gO5g1yp4n0sEZqWekik2M9knS+UxiFl9g1uSmz
         Lry/u5hh+roTRxyI5yLS88pjxZiHBYzdldsFiRx4jixfR5PqlPYSAbRgSUnh8WVsNx8e
         cv5Voh6iLijBUJZ/7UiNuZdbu8KrozLs+YHDbQU99qvO0i65hoIH61/p5viHbDbvSMk/
         VTWDpiVG2IgVKL+UiMBZqZmx+QYgNPnohrQCgfbfMWKBBnzkscSeNGC+9RDmt9Oy7b9t
         jYm4sSLDb2o6Kjk2Goc9vLU3Occ9PDNpCYkynIdpqBnl3ePqUlKT/nFWFJs/v8edJpIC
         62qQ==
X-Gm-Message-State: AOAM531qwk4X9P7T3P6NE7eLVJKj2T3wu7Ay3TL1AxEbIxJ3kpVHN7no
	oaVdt9zpvZQsMHcyvSquD/yXnmcrbV8=
X-Google-Smtp-Source: ABdhPJxRkTroDLyKx9/im8mnB5yft8RdLRETwRuvRNKvIy/FvPnAHuDo0NSDVjpXNg6P6N+7YaQOGg==
X-Received: by 2002:a05:600c:210e:: with SMTP id u14mr4359843wml.48.1607440128191;
        Tue, 08 Dec 2020 07:08:48 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:47 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 4/8] gstreamer1.0-plugins-bad: don't use the internal usrsctp on sctp plugin
Date: Tue,  8 Dec 2020 15:08:12 +0000
Message-Id: <20201208150816.744752-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 7016f73c92..24f2db81f7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
@@ -65,7 +65,7 @@ PACKAGECONFIG[resindvd]        = "-Dresindvd=enabled,-Dresindvd=disabled,libdvdr
 PACKAGECONFIG[rsvg]            = "-Drsvg=enabled,-Drsvg=disabled,librsvg"
 PACKAGECONFIG[rtmp]            = "-Drtmp=enabled,-Drtmp=disabled,rtmpdump"
 PACKAGECONFIG[sbc]             = "-Dsbc=enabled,-Dsbc=disabled,sbc"
-PACKAGECONFIG[sctp]            = "-Dsctp=enabled,-Dsctp=disabled,usrsctp"
+PACKAGECONFIG[sctp]            = "-Dsctp=enabled -Dsctp-internal-usrsctp=disabled,-Dsctp=disabled,usrsctp"
 PACKAGECONFIG[smoothstreaming] = "-Dsmoothstreaming=enabled,-Dsmoothstreaming=disabled,libxml2"
 PACKAGECONFIG[sndfile]         = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
 PACKAGECONFIG[srt]             = "-Dsrt=enabled,-Dsrt=disabled,srt"
-- 
2.29.2

