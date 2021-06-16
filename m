Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.11.1623876537880987665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 13:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qvk2vqKk;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id l2so224794qtq.10
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UtV3piUhOzbrNusKXuFq00VeWlp7yU2zydQNlQVITbE=;
        b=qvk2vqKk18AKQYaDbRNnotybW0qDD2AV11pAg7x8FK0c7FoFFCi9/c3ocsWGmMO4kD
         2dQAj0PqBriFjmaajpTXneAZsTYwzPRM32rCPZ1zjigwJXhUhNYihjdIqrbmIJVhfMfE
         9qPQ9eacv4WTe6uBlZ/S9pW/XGLhililj3+uxf73VAwHAW2Z4RpMFhdzkRbBGXPy5o0j
         Sz9BAF6SEDKFDsskIuUyG7ZVqDQx42w3C5PrAIZluAlR23bn1OaZCzznyijVQrBv1tqv
         o4t0N/tIUrxWmI8s0LvH1RCCKtlOaLv54rjLitIHUZo545mbd4ITIWL1E++JFqw0WwjF
         iv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UtV3piUhOzbrNusKXuFq00VeWlp7yU2zydQNlQVITbE=;
        b=ciTvk4erxZEtJ1g3xAXkE8RNqC0RBUyNT294tSSdprk+wU+sU4XGmFhyxYdyO21xLu
         ZVbPFCbKmNs3Z+kg7q+2DIbO3UST60mpaj0X9CH4JIqphNNn2J2pA4p9QEKUUlMHGf54
         HtxfR8BL4vR43ZvpkRyBGWZCqzvvaBLaQVd3CBykZYT4iVHt3MFhLZoTG18z1NCKChuS
         OLFaOq9GSXXZ1I5th3qKawvO2FvcOcWr7R7Q8x2WWXfiR9MpkQbaIB6reVBWVb1YGLf9
         yGdYn8GjVZ+/mG0KUS3VfTh/Ecbvsqvyr0gX/fob5coB6p/hyvnD4WDIi0sGys3k0OAi
         TzKA==
X-Gm-Message-State: AOAM530O3TlzPXVOfCRuyVol+admtvl9XjO1zEiJoBLOKOgg6cnnADcH
	t67ZHMIxmFGNW3qvO4xuUhs=
X-Google-Smtp-Source: ABdhPJwB3k+/lwJYmTNB50vGr8bGh6/mY0NOTWZacrKTfEYd2IcJoaDJ/YdvBPG7Xu8aKNgiDP0o6A==
X-Received: by 2002:a05:622a:11cd:: with SMTP id n13mr1707370qtk.233.1623876536907;
        Wed, 16 Jun 2021 13:48:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id d10sm300237qko.73.2021.06.16.13.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 13:48:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] kernel-yocto: consolidated pull request
Date: Wed, 16 Jun 2021 16:48:48 -0400
Message-Id: <cover.1623876372.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's my queued set of update to linux -yocto. These are -stable, and of
course the AB INT fix provided by paulg.

The other change is one to the -dev kernel that allows the single AUTOREV
recipe to continue to work in older releases as we march through newer
kernels in master. Some users ran into this problem recently, and have
tested/confirmed the fix. There's no change to anyone but a linux-yocto-dev
kernel consumer.

Cheers,

Bruce

The following changes since commit 682ddc5f2a2493e5c7760c0745dacd24fe975479:

  releases: put release number after "Release Series" (2021-06-14 22:45:33 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto-dev: base AUTOREV on specified version
  linux-yocto/5.4: update to v5.4.124
  linux-yocto/5.10: restore aufs
  linux-yocto/5.10: update to v5.10.43
  linux-yocto/5.4: update to v5.4.125
  linux-yocto/5.10: cgroup1: fix leaked context root causing sporadic
    NULL deref in LTP

 meta/classes/kernel-yocto.bbclass             | 24 +++++++++++++++++++
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 7 files changed, 61 insertions(+), 37 deletions(-)

-- 
2.19.1

