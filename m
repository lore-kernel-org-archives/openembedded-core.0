Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.1229.1604335815347660356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MPQENWxp;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id e18so3872367edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=efPDvwW4kXh7Kl0bck0ZTEZ/FSWIToY9D8eMfZUkni0=;
        b=MPQENWxphgwzKnkZ7jqmAmEIQgRNb147obuBwt2mucBS3aO2lf4Qx28QUAa5efR0DJ
         URlLrZjiV7kAiiq1JM1XYRoSV9AAyRMSQxtRKpaOZHPn7hUamFrDuG7mmNRU7H4tpqQN
         fvIk9cgNcCu7zJMOmz+6C8J8VurP8IYCVbeCq8GWhqVailxW9WZlrW/gKfRSuFdOO/NN
         7L7FhHfPl83gkqM6V0lxS8leZ4W40V+1eh+oNRYQO7Uzh9aIPvMYTtrEYkj/BnUaI0EE
         NaQ6AFqMri2+m6mFclJ0D9dWxiBGsEOg9yoOm11ANn86G/at6LibaLDMK4ciHh9h8sO3
         PVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=efPDvwW4kXh7Kl0bck0ZTEZ/FSWIToY9D8eMfZUkni0=;
        b=CyCUSeLTBh8MFJ/ojJz9OgdlPYuSzcoZqolbKLXxHksTJlfVf2zsWokEKPrq32GUAm
         Hh0jtEf+U4pb5gkpG2zhujch6nxVm2s7/jVjkVzjlP8s+kV4lY8ciSNw5pc6lk3Hf5c2
         xSddzkRB91TpWDb5OQlW2GJRmOOm8PoTyto65G+uLBU1oeRUZX7ruM7POQbu3CtqAU/L
         UCetPakRLoNWs0ZQ9/ZNEV8EQAq/ug8wJguVVny/2qSP10AM0q1sz+J/6PBMlcCZZVE9
         GZ7lieCwi0/Y6o1KrMfBhTOzpoo4cIJ7eZ58/vY87h88EGTZqmJyFrjd8Bu7DQdOr3/B
         3qJA==
X-Gm-Message-State: AOAM530lgMriVTwbCKIGP6GJUOXclAH7Jvuf25AcffN9xmPnP6EYJm/J
	wjfAzj+xErUsCGg040wIvWQIpxNxgsf8iQ==
X-Google-Smtp-Source: ABdhPJz+BNrLUCMPY0CXqG1JgAZIeCnrY/5PaapeMmUxknxOKGwyzzkDyWFzjzIRGsVhrr989+P/6g==
X-Received: by 2002:a50:a6d0:: with SMTP id f16mr16906960edc.135.1604335813697;
        Mon, 02 Nov 2020 08:50:13 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:13 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 63/80] stress-ng: upgrade 0.11.21 -> 0.11.23
Date: Mon,  2 Nov 2020 17:48:50 +0100
Message-Id: <20201102164907.27572-63-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../stress-ng/{stress-ng_0.11.21.bb => stress-ng_0.11.23.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.21.bb => stress-ng_0.11.23.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.21.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.21.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
index 71671dd046..f09bb24737 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.21.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.23.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "ee44b71aba20e9c7d10ec4768efa2245d12579fa17e08b9314c17f06f785ae39"
+SRC_URI[sha256sum] = "c0a76147a02f4c31af1fb4b9b7e0b90ac8bbd8590ccb54264d5cbe046c769cd2"
 
 DEPENDS = "coreutils-native"
 
-- 
2.29.0

