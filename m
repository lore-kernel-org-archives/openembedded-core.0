Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.11058.1603900076644360241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R4lMpwaT;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: yann.morin.1998@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id e2so33531wme.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 08:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cWpl3h6TYYEgsZQ1PBesew8ZedvHsZ6POoKx65rV/S0=;
        b=R4lMpwaTihdVDYlbx+cgINl+XpejZ2obcSlRtr9OUDq8TGN3mt1A5ByuPvGwSrhitN
         cKaODduoPvSD8QlOs/YZoSBZ7Z7DleSjB48lR0LVucqS2Q8qduntphTP4lOgSLpDO+P7
         UjmBFh+bL9k9s/IFMG9ApwsPPhD1zKxofDyZWBFhtE2nYD1ze9wGaDzUxrnQumR+yaIN
         lOaGoNcSqvxbGJSIcRyAnIQCgtSrA8R0e8ZfsgFEAOknEAxLSAB39TTkJbsIzqHuMBdp
         YLrieNppmh9B92BvesOfX2GburRg95/AeEytC42fOzwgQixS/68F8zZKqKdXhuQp83cr
         hBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=cWpl3h6TYYEgsZQ1PBesew8ZedvHsZ6POoKx65rV/S0=;
        b=il3cehHEfVAb0hIrpAzsj13kMFFsTs3DG0swh3bh6mmkBv4awDNfa0AtcHVU7715kI
         iDK051w7mYQN/OPQE96gjx/xfLer3LOEIV5ahwsXaIfzxUVTbmtl5qFlx/SrJWm7kTZc
         T086ls7gJ4xpz8Ni21/nmcrSL91puUp8X9thckekwBGEWQB3h40s09WI43cQBXmSvpcU
         b8iJr2lthfrnZQC10we4Nx7oHGgaXajNTzGHN5fFRuXGdPmere0ItKpjpJym5Y53ur1M
         0odhGjFkoOnwQ0j1JX5WExu+OtDZP40si/Yzw6kwUIvsSXi5ytoHRSrYWra7AQ9SMJYw
         9N/w==
X-Gm-Message-State: AOAM533YVxo1tRh/A2lyCuN6usX1YtcW3gEuXr5ubxS8VubVTSfKCRm+
	f+CXkk1bN6D0cOwTfrHWf2JtuvV3/nA=
X-Google-Smtp-Source: ABdhPJymKdx8VvJ4npij17r9+k/Pot4gbIZUcMot46PoOWRRaGuGVFFDIIK4tS7QWnZ1muDlW7gkMA==
X-Received: by 2002:a1c:a98c:: with SMTP id s134mr9498819wme.159.1603900074877;
        Wed, 28 Oct 2020 08:47:54 -0700 (PDT)
Return-Path: <yann.morin.1998@gmail.com>
Received: from localhost.localdomain ([2a01:cb19:8b51:cb00:d91a:f1f4:94c3:a2ef])
        by smtp.gmail.com with ESMTPSA id b1sm1740814wmd.43.2020.10.28.08.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:47:54 -0700 (PDT)
Sender: "Yann E. MORIN" <yann.morin.1998@gmail.com>
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>,
	Khem Raj <raj.khem@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Yann E . MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 0/2 v2] recipes-core/busybox: fixup licensing information (branch yem/busybox-licensing)
Date: Wed, 28 Oct 2020 16:47:53 +0100
Message-Id: <cover.1603900066.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
Content-Transfer-Encoding: 8bit

Hello All!

This small series adds a new common license, bzip2-1.0.4, to be used to
fix busybox' licensing information.

Changes v1 -> v2;
  - add bzip2-1.0.4 to the common-licenses  (Khem)

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (2):
      common-licenses: add bzip2-1.0.4
      recipes-core/busybox: fixup licensing information

 meta/files/common-licenses/bzip2-1.0.4 | 43 ++++++++++++++++++++++++++++++++++
 meta/recipes-core/busybox/busybox.inc  |  7 +++---
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta/files/common-licenses/bzip2-1.0.4

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
