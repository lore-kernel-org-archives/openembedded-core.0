Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web09.1125.1617290949988163861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 08:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lOuCr6Vw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id m21-20020a9d7ad50000b02901b83efc84a0so2432439otn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Apr 2021 08:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YxCYKZSP+dan4ubnqUWzjEu/4M53IM+3XbNXdkZoyzI=;
        b=lOuCr6VwpT/yfQqslYdHfP9AOKfaRI21/vXX+wypZqYQuvoTM4faaFVAHs7DPemxM1
         HTAArBcRnmU7LaJ0XD0BX196GKjfadUjd2lHG2L5o0GrGY/Ws44x85Mdh46b7rTxJuo6
         5TQhGoRPiAbJeLQEw277jLH4tNYojH0YO2C1FtOMwFQ5Er7nTyPfi/SrQEK/TDDjmrMV
         mulbpZZq6xrETOgWBWmNGgiukNn+m7JFqs0CFAdIuo+PUqm/UlQINh8zIsz064dIkHHW
         dWba69MkNb/eNQbTv0szK3ZfDeGwYD+vu/wLBTykhNKm8bcKqH71Wokw5PYdP7B6wQAQ
         8pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YxCYKZSP+dan4ubnqUWzjEu/4M53IM+3XbNXdkZoyzI=;
        b=ttOeutpEoS+UcIyZnaHSQ39Ox6ez8WiYrP/XhdffnwO2pnVUmGpQt2ceqLHTlUAUjt
         XiYSelP5DOWtoSENpLO7bW+CdeObMp8/4++LznwpOTeuS1Hqa80TLzmfqYQN6J7UlHzW
         sedgStDDSQ+yms/eLhCJfCRAEm6Vro94lM/dHo9/BD94rySMOS7sgYZr5fW0gFqtjpBF
         732RXuvn4obtfMhSPSaNW63G2sDEO5QJ1+oQPy9O19lnNYgki1E7V8KVj+lse3D9AKJh
         oIZlruZYtY0F/69/D9UitDKdbeOrVcooOCMUjB1OvD0MrRAMhfQt8kowscxzkiBcaD62
         bXDw==
X-Gm-Message-State: AOAM532JTTHhW+HWxxitIKEcgmbJngIOe0tJeYPEzJMa63A1tmGevJxO
	gAqngHPe/dRiLSpS1tUGr5qWHPqdPkHvmr/pgjw=
X-Google-Smtp-Source: ABdhPJzZlQkiGXjEpzdFDo7N68oAnztojq3HL6V4yQXMmstY+9x5x0OgBQEyGykeBNVBz1iZ1Ud2nQ==
X-Received: by 2002:a9d:24c7:: with SMTP id z65mr7576358ota.243.1617290948845;
        Thu, 01 Apr 2021 08:29:08 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id u7sm1159610ooq.13.2021.04.01.08.29.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:29:08 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/15] bitbake.conf: correct description of HOSTTOOLS_DIR
Date: Thu,  1 Apr 2021 05:27:39 -1000
Message-Id: <4e17f9806f64301c942600b650b3dd5e34ca1838.1617290310.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617290309.git.steve@sakoman.com>
References: <cover.1617290309.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

HOSTTOOLS_DIR contains symlinks to host tools, not copies

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fb7692da7faa49b370680decbbaceaeb85b6889d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 697956eb49..76942d923b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -480,7 +480,7 @@ export PATH
 # Build utility info.
 ##################################################################
 
-# Directory where host tools are copied
+# Directory with symlinks to host tools used by build
 HOSTTOOLS_DIR = "${TMPDIR}/hosttools"
 
 # Tools needed to run builds with OE-Core
-- 
2.25.1

