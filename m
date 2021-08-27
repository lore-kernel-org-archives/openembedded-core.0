Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.1441.1630022592299856659
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 17:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ANTnEFox;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id j2so2814934pll.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 17:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeUazJCwCWhWc/n003U6/4luTEBb/boXF2AfXWXiAUw=;
        b=ANTnEFoxZI0uG6xbzUiYGNoYujvQsK7Zen/eE8kAqxTvE8Ucv0Os4AjBujsuOrn6dI
         QjMA+hVKkr5CQ6yB143KspigDhu+0Og3xioj7ClfG+H4IhYFrAVPhN86+fgutS+uHB8d
         6M62VueQ5ojGScu4TuM76qUwx2gACJyctUhp2Qc4gIADVMpTQYCgKiFOEghl5334wmCS
         D8p9CtTydFzTl3+hmPSShCoGCU9EAmFBxFBVeU9o+2Yz5c4gxwPeUcCpP8OXA5Csf9pe
         N2rQR06rXGc1VEaVBv8asy+24Q1hCLIXCYkkPopMAbT2lgaG8JXhIQbUUIxg8FZPwuMC
         9kDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EeUazJCwCWhWc/n003U6/4luTEBb/boXF2AfXWXiAUw=;
        b=fbVhleJdtWQIUk7cShEDnzsQrviRySKGB/uJ0XDGbWZe7jENaP1Mw+cyjDzGDtC08Y
         LwLI3VoCuzRwaUyS3L5Z9QQuRldmAS8bd8XmtsNbZeRsmDV9ZqxwvYTLYOm1jmEYCbJ6
         JC8ZrrRytXjP+ctWe8HLqnvRqzgZcNIcm0oSubn8VE87bRsIW2DQLc0t8AmweglZSSD6
         opiwE/aSuWF+fq+pKwyn814JknwW0zzDuREujbOyLqhYun56A0NJTcyHkUO3uo0wLQzO
         5pT1SC91gr2C/qPoM219ufS4VAMZTYt0z+k/GCiJHnFdfM9uIA0LitW+HrFuPBxNTY4A
         pZ9A==
X-Gm-Message-State: AOAM533nRuwh3XklhyMpmgFbwj30rS/CpWveLMWI2JFUpr7jotHfUeBG
	deWvyRHt05QHaPs/pCgFEOBZ0vWNLg0=
X-Google-Smtp-Source: ABdhPJwexH786HJN+gjVpMMHNOqqoOISbbARKSa/DDFeVI/ohHMX1djAoCZmqJU54bxaRIGuEXyemA==
X-Received: by 2002:a17:90a:8549:: with SMTP id a9mr18989409pjw.98.1630022591370;
        Thu, 26 Aug 2021 17:03:11 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:fe04:ee7:4da9:eb01])
        by smtp.gmail.com with ESMTPSA id k22sm3857531pff.154.2021.08.26.17.03.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 17:03:11 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [Dunfell][PATCH 0/1] Dunfell delayed patch
Date: Thu, 26 Aug 2021 17:03:08 -0700
Message-Id: <20210827000309.2004440-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch after Master gets fixed which should be shortly.

Armin Kuster (1):
  lz4: Security Fix for CVE-2021-3520

 .../lz4/files/CVE-2021-3520.patch             | 27 +++++++++++++++++++
 meta/recipes-support/lz4/lz4_1.9.2.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

-- 
2.25.1

