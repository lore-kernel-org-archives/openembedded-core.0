Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web08.9816.1607440131249948497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 07:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NFcIs2ri;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id t16so1273887wra.3
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 07:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5WYV3B2ffhes19Y7sVgE8beN5ix4hkrH8U41uXjRfPc=;
        b=NFcIs2riXfFOXd6BDsqhcnc8fbvBHkHfPgUvBhWVl7XmkUxd39raWjlZALZdz2atqn
         IDdnOxpK8zyjOuedF1xdEJ1ctXAaoOWodoFGxci/4/Cn8NoP/SJ1qFYnpJ6CzUqxJp3X
         pbFG65AGCe/PKW5QvOKa+TPxE6pWwdUrQLFN3AkT0rT4o9UygvCKZFbmf5KVzd6qY2Pp
         ElomwKtHs8rEMe3MPFr8AoqMd0MPf5SgTHK7HIIQnW4zjDXXgKr25xAoT6OwaPbYpWvT
         kdElQ4BqtEMwjMYfP4dU3URkKaGdNg96RZpg1CPcjXsxUM3b2T88hyP4tffmel0Wr5uK
         d/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5WYV3B2ffhes19Y7sVgE8beN5ix4hkrH8U41uXjRfPc=;
        b=XKOj0D9BgQAUAsMXcTZ1xQg0XL+PcUXQfBMmM0ZshPZFP9Dlj41wfqQqDJmlrEVSXc
         apyNza6SljzGSPGKvTuAbg1rOiaAEYL6VWNqWsZwn5a5ql31pwyE139faIbbEXONgZ3i
         hX6a+p/gs/5DQvUhtJmeJ3z/pOXUf5KIMPwkkGhk+kCX/mPixT2CGoHjkaspoD4ea8JW
         XMu3l153gBkopQjpB7alcKUmyhPasmv2CwUwt49T7NTn4LJ6fWfbAVKLZNzcgM7iDC0k
         o1xJZ+qU98N4CO7EikDup7S4S4JP2rX1iNi+SkwVLMlgp1zZJoloTmUWEcOkIOdak+oS
         RHTA==
X-Gm-Message-State: AOAM531O1k8YfthjoUcXnhmTK4b3JDEPfUlMx3yf/eBqTPh1OgxHsv4k
	sQiby9jckJYsRt27QuGH2ROBJQ6W2Zk=
X-Google-Smtp-Source: ABdhPJwBpIOGSC1E74FAJkocbDKklXzka+G3BnHwe2t/+/St+1u4PmOOdxP2shl8SvnX+4uHabU1TQ==
X-Received: by 2002:a5d:570e:: with SMTP id a14mr16438712wrv.126.1607440129490;
        Tue, 08 Dec 2020 07:08:49 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id h83sm4418607wmf.9.2020.12.08.07.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 07:08:48 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 5/8] gstreamer1.0-plugins-bad: remove unsupported plugins comment
Date: Tue,  8 Dec 2020 15:08:13 +0000
Message-Id: <20201208150816.744752-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208150816.744752-1-quaresma.jose@gmail.com>
References: <20201208150816.744752-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- all of the unsupported plugins are explicitly disabled on EXTRA_OEMESON

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb           | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.2.bb
index 24f2db81f7..70aa0b6126 100644
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

