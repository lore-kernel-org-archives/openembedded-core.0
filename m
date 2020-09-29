Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.1623.1601402848189989211
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 11:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rims5eaU;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: toertel@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id p9so16334417ejf.6
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2020 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKgD2wCoz6ViOKqT+D/p7yokPynAE8kM3GEM96VzwVs=;
        b=Rims5eaUs4C94S8QRggb/GHXxHHQx+3SiG+3T32/kILyZdMICb4kp/yDUcq26J4qlE
         B3QE7vcbb+UO0VVYA90kaodgJv2Cg53qbBcjg0wcpNc+BQJEZFUehJPu8zr08rHKBNdC
         hUnx0xLCGnH7lm8T2y6Tcf7OBepWikSOwtAuGmwrXcqmGbvVE7CLe6fzVttS7n+5Vm6y
         bWZERZnsf+PU253QJAFaD3+DJ584QttXXsO+66D+c4i2H0YodduLr4pR/G6efBsrwcc6
         +fJ9aDWK3S0yNWsBQx2Rtlhpg2QEMfYCZqpBd8bn81UshGZUjUm0PiC9K4GEnhw7EHyU
         hs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VKgD2wCoz6ViOKqT+D/p7yokPynAE8kM3GEM96VzwVs=;
        b=unrfWo6xejckSirdcD4h8S3NII88Mr+yTGEqbPP35jyCg6tq4mNRPU8YSEO2lz+6wI
         81tX3dJx4lHQohytxW3n5fwLuAlDhJz6XkDYIZTlf4r51rG/P9/JGl8eExtfc8QHfDNU
         CguYSbPxvxsE4DVvZRla/3hfrLdvWb9M5wVZ0VgL5TzAupMikeB7mlH73anQHk0XxD+3
         11iXVzfIjlYLuES26DIr7Fk69Q/4SKq1hgRjSm0VjFWuxUrid1OLK5kV5ku/C6IMc7yS
         h2sYrRoy9qVrdYRKSDBsmIht2BcA6qBqePqAI436LfAm35bsjyyyX7+oR4k5miQon/lh
         3hMQ==
X-Gm-Message-State: AOAM531QXzi6QCcXYI8Pm+RL3KmTEbsimkcegRJ9Kg8vKJxugBO+fCgr
	gqo8ZCzz3SEfgXja7HZJblQgLEe0NMI=
X-Google-Smtp-Source: ABdhPJyGK2G80Hr5up0n6lKQWSAP0LAshZqoINlyDG8M9Np/YWeFszyFXBL7IMEpL24eR0Q8KiJzag==
X-Received: by 2002:a17:906:1b58:: with SMTP id p24mr5364036ejg.77.1601402846161;
        Tue, 29 Sep 2020 11:07:26 -0700 (PDT)
Return-Path: <toertel@gmail.com>
Received: from gigabyte.fritz.box (p200300cfaf370e0015ade9fb9385734a.dip0.t-ipconnect.de. [2003:cf:af37:e00:15ad:e9fb:9385:734a])
        by smtp.gmail.com with ESMTPSA id o15sm5635859ejr.1.2020.09.29.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:07:25 -0700 (PDT)
From: "Mark Jonas" <toertel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: pidge@toganlabs.com,
	Mark Jonas <toertel@gmail.com>
Subject: [PATCH 0/2] Map license names PSF and PSFv2 to PSF-2.0
Date: Tue, 29 Sep 2020 20:06:57 +0200
Message-Id: <20200929180659.7060-1-toertel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to SDPX.org "Python License 2.0" is the overall Python
license, which is comprised of several licenses. "Python Software
Foundation License 2.0" is part of the complete Python license, but is
also used independently by some projects.

So far the license names PSF and PSFv2 found in LICENSE are mapped to
to Python-2.0. This patch maps PSF and PSFv2 to PSF-2.0 und thus
corrects the impression that Python-2.0 and PSF-2.0 are synonymous.

Mark Jonas (2):
  Add license text for PSF-2.0
  Map license names PSF and PSFv2 to PSF-2.0

 meta/conf/licenses.conf            |  6 ++--
 meta/files/common-licenses/PSF-2.0 | 49 ++++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/files/common-licenses/PSF-2.0

--
2.25.1
