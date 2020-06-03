Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.11778.1591184874085181630
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 04:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rH/XbInQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id e125so1133266lfd.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 04:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7gGi3mUWFEqS2W/qi+LDB7mwmGDqMDfwn3qVTYQEI0=;
        b=rH/XbInQc4fsND346K7fozILLhnJBUHf/Vd3wRf1Zh0H4ljjw8oHJUzq5ncw4QDT+G
         syBJpOIocHjIANY+9tnCllegq5ali/x2qU5bh7DeIe3Gx3mZV8wb6Xdhi3LUjZcDe1PA
         oVgRUBuiPWhoV+w6mNzIlUSJSdCj0LdK2c4tIEaAaw+KHm5If1bMfwo3i6+V7Nh5ofQJ
         br8sw002AcdpPy9dcEkJYN0LxCUBIpJbtgPnqJqppvK3CsYh7enIcN8OAMaomkXSR/FY
         BVKIlsliGttTZMGiOy49sZWQoj6wEgKjjDD/2w7E2Ih/zZucjOZoxfNwSgRD41jsq8vz
         yoZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=E7gGi3mUWFEqS2W/qi+LDB7mwmGDqMDfwn3qVTYQEI0=;
        b=YhkOV5meLdBUj/jvuRCddelD6EZkVuepBhezLt+xEQa5GSQjNFLkvwwqwlM/W0DVIv
         /8beuFOBUeWNPY348XgRMemtBI+uh2EBcVl36nXcUbgGrw+zeosU6t/NkAmLU7U1WlQA
         0pxwIGrCudEDWa6/qgtTZ7HofopfXQnB0NAi04T72Qzao536FbuRKMjNcjcTNn7+or7F
         Fgw/zS9YQxwFyBX/gHZFlLXBqNnFw4hmh7qhg39lBY+UvwgTaT0sScBvGH2zG8kRX/GM
         yU2kNqE8wY9g+izztMz7V7cbYxAIj0i8nziGI3rui/LJiz5uaX3m6VkMnXd8k9A8AR1W
         mXRw==
X-Gm-Message-State: AOAM533bTzPEgiFNANGgvg4/cqSBV5sUkhalGTevNFogNOhrzGcbAyNI
	zaWgj5i1LgkGMeGgZ1tqNk+Dim8+
X-Google-Smtp-Source: ABdhPJwAbq/HoLF76dQETJZJVW0LnQ1Hu5evj8HwOHbGmXjLdOzh6oRk5PVs7ScLGV46D5jCv7SRbA==
X-Received: by 2002:a19:6914:: with SMTP id e20mr2276081lfc.27.1591184872001;
        Wed, 03 Jun 2020 04:47:52 -0700 (PDT)
Return-Path: <liu.ming50@gmail.com>
Received: from localhost.localdomain ([2a00:801:3fb:ebd4:e18d:d2e7:773:e410])
        by smtp.gmail.com with ESMTPSA id q3sm403715ljc.110.2020.06.03.04.47.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 04:47:51 -0700 (PDT)
From: "Ming Liu" <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefan.agner@toradex.com,
	max.krummenacher@toradex.com,
	Ming Liu <ming.liu@toradex.com>
Subject: [OE-core] [PATCH V3 0/2] Introduce UBOOT_INITIAL_ENV/coding style fixes
Date: Wed,  3 Jun 2020 13:48:36 +0200
Message-Id: <20200603114838.13541-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <ming.liu@toradex.com>

Changes in V3:

1 Add UBOOT_INITIAL_ENV to FILES conditionally as suggested by Denys
  Dmytriyenko.

Ming Liu (2):
  u-boot.inc: fix some inconsistent coding style
  u-boot: introduce UBOOT_INITIAL_ENV

 meta/recipes-bsp/u-boot/u-boot.inc | 99 +++++++++++++++++-------------
 1 file changed, 57 insertions(+), 42 deletions(-)

-- 
2.26.2

