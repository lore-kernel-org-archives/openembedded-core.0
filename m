Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web09.8189.1620831567849475614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 07:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RgF0p60r;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id b25so17281397oic.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OUvADhLprt96qyN6eAxXZ/jPz3dkPBy3ogZqLiW/YGg=;
        b=RgF0p60rmIC9i1sR1hkTqagDxp+6Qk7ib8BY1laydPbBQX5JVYFOn9VZzgQgvJtJaN
         ZLUcMUx7KKWE/hnJqSviPa77xOT2RCQtamrY4x+9w7FumnZ3ky3OSPfW1NgQE+Aa2H2h
         hZoNkJ0Dy5ReL9ykyXDBklsD0I66E02W317jaHLLQlIyq3a6Co1psSxV48gpkOCphoLD
         oSU3/W9SJwSSPs6kZQKa1YNppr6iyV6psKTaCxcOdbLddNIFkx8yGyshdd5YfnauE+2d
         FiACWV+gocRT4e0B2Eok+X6caJYITpRTz9LrMKCZGd4Ukb9wHv4SxCBsr7Wsh8psMIw6
         eILA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OUvADhLprt96qyN6eAxXZ/jPz3dkPBy3ogZqLiW/YGg=;
        b=cdDu+LPgqF39MpICbKmgvSIwQjLftN8rZuYuP27oxy6yTaQHCxDMQ3F1mxmXPpBmk1
         nNiLcRKLYLJe32CqXwHVsgm4Vsgglr2qDEzZPnTBsDDVO3he1dzX3055RhAax7j0UWNv
         D7HOHrc7v3y06BFtyLPPfiDeZMc4ZsYnp75l0mBzbXK6X75J38c7EdOQCGDxBwGxg47M
         paw5WXpaC/t6+JY5BdGLlHLwGl4wG0iQ99PDl+fiaPhJNxog7kAlagDx3oyrreCO4Zxg
         BHDPuxhThwxYOmk+XjfAwLG6P3sa2EUxGF1dzR66XK1sLZqW8fhHoA37LzKYukN7Qlv8
         ctgQ==
X-Gm-Message-State: AOAM531ThaPGBg3JIG0c7d/PWax7yFczOEjouK4DdlqC0iCwnxrHRl9R
	zoluiwVEaWnUe3fGYhzqpTE6JEPbTCkddPMtvb4=
X-Google-Smtp-Source: ABdhPJxfFV9kgg2YHudJ5JtVIak22v1/vfRaF4zmPsceJmB7RfOJM45BBn2siaJkNgQD5ThX+3jRqQ==
X-Received: by 2002:aca:df87:: with SMTP id w129mr26723891oig.128.1620831566829;
        Wed, 12 May 2021 07:59:26 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id 21sm1678otg.4.2021.05.12.07.59.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 07:59:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/22] dejagnu: needs expect at runtime
Date: Wed, 12 May 2021 04:57:00 -1000
Message-Id: <4e1a1fc3b032cc571c85bb10f3a55720eccd3c66.1620831171.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620831171.git.steve@sakoman.com>
References: <cover.1620831171.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@gmail.com>

runtest return an error due to missing expect on the target.
Add expect as runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9a3a08edc1efcbe7b02e80be98370792d3c6cc2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
index 0a007bb2cd..ce242c3593 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
 DEPENDS += "expect-native"
+RDEPENDS_${PN} = "expect"
 
 inherit autotools
 
-- 
2.25.1

