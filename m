Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web09.4294.1612322649865131509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RlEc2sto;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id r77so22098924qka.12
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3ysgnqFl0taIRFgu+uwdqXrCaSpc0UtP7eWw8VYj+A=;
        b=RlEc2stoEb5o0POa4ai3X2xKz+fZtKz9FqrXr+Sb5k3s8mUl3AQ4xy1wGoYRNJblnW
         Rs7BCoikYZkRMr6jV4fxm0rYCviZ0Z3dkphvECm4L1XPVFXnFjlJ59jKxxLPXxjosX31
         mxjRUDgzVvjPWNIsHEx4lypOu4DfThGiyGErdmja0hSnXlWruDyKpzv7XfRI9wjRJS5J
         UoqTWrTgmTvQmW8pQ6/fG06mct/mSUIep1UEt2zD9aehzVTjtnNR6EmCByXR+qyxDzMS
         JmAoSW0euZPDzubdr1us0Xr2JE57jyxSRRwzhBxQjExkwzbmouRGjemGcWEv4B+YtCtw
         Yb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b3ysgnqFl0taIRFgu+uwdqXrCaSpc0UtP7eWw8VYj+A=;
        b=YS/Rwn3qfUXLP1Ci6Hx7DVR3HWHJvVnFHRcyPHDahaCeKRZsDiVfdp47IGZRSepXyV
         5ptWcTmlHbTB8OFTAzBIn2dJKtKMav5WUph8x16IB/IEtzmnfx36AWc1JalyMLPUHfMU
         zcf/v4fu7MEwRdsr/wfFsNY3FU/ZNsEUwk3BFWs2JlLQfW0LT/2hnCLPwL50GaHuGFIk
         mW4Zu+R7Idvs6t5EzPGI8sPt8SNECN1dYlbmQ0oAdkb/7WW0ap9Ry7hnW7/lZUnP7qZM
         96N9KZ/S2TvQ4DwtzwpShwfApp16YTqwFbhEPSDkwLYwzbu54OOTRejQGtPkjISdBToT
         tYFg==
X-Gm-Message-State: AOAM533EBG//37nM7PsLBUxkz3Tmxnc7CR9x7uI/FmwoSWA0brmh5KC0
	ocnRFxOq+Gmi7RWxwS1bBwY=
X-Google-Smtp-Source: ABdhPJyoDDsYn84SfN2DuH/JEGPyciVtUNIO6HPU45bk18NubOnpRgAujYqFLM5UMnPVJMHw0Occpw==
X-Received: by 2002:a37:8485:: with SMTP id g127mr804525qkd.233.1612322648952;
        Tue, 02 Feb 2021 19:24:08 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:08 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8]: linux-yocto: consolidated pull request
Date: Tue,  2 Feb 2021 22:23:58 -0500
Message-Id: <cover.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here is the next round of -stable updates, some configuration tweaks,
-rt bug fixes and the binutils patches identified by Khem.

I didn't pick up any issues in my local build/boot testing.

Cheers,

Bruce

The following changes since commit e45227cb2c9e8506a35cb9c97a867e50c4d70962:

  shaderc: add spirv-headers as dependencie (2021-01-29 15:59:40 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.10: update to v5.10.8
  linux-yocto/5.4: update to v5.4.90
  linux-yocto-rt/5.10: fix 5.10-rt build breakage
  linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
  linux-yocto/5.10: update to v5.10.10
  linux-yocto/5.10: update to v5.10.12
  linux-yocto/5.4: update to v5.4.94
  linux-yocto/5.10: binutils 2.36 fixues

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1

