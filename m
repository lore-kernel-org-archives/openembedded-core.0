Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.43958.1622467009371659225
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 06:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cSaILoOm;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id k4so11164228qkd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 06:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Syi/qPbnAbOgKBkHcWPxarC4Am9bIVRpEBp0CypVOmY=;
        b=cSaILoOmk25Xx7pJAMjCwT+3rOONEhzWnspE+1R1qSP/AqlaGqXEiGR0ZCNGfjVQpn
         1fm0cFRUV7xmhhzuuQb4OO+NVAE2Sd+3IUB3zQxITRavf4eIrg8Z+FRn9mFZ/gi2hG8I
         K945uHyw/W4A9Yzv7ng4mR0lGwb4nX5epRD6F/GtQIE3SZWSdaS5sg5eoVqFccxAFpz9
         mam5hdVfDcEzbkVz85G/rlipsFHBaxj+t6ypOMWlZVkSUPXv0TNr21FGDz7djafbDPn3
         wKv7VraR1MkUuGiY16LxmGDMXRKkobchMaL3Hel1IeMCsPeqybv8FtU4KXYzqDOSm6QK
         rWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Syi/qPbnAbOgKBkHcWPxarC4Am9bIVRpEBp0CypVOmY=;
        b=dnjtJ6sp0iiFzdaMFfBoNxDWBGoz8WVn8qIwia9jnG9ek2XMO5xpTlj3xRkltxFMZd
         D66SI5jE21B29Os5vUxFIy5NF7PKLAJXP7ss/fBGb9nzkdNhUWUsNQ34ZaeLdGOi+Nma
         c8dWDAoBQkJfSx/hUgNrLmgO6fMFWDDkTE5X2hgU6pTkXQQjgm+Dvb6oxbqXO3YfP2Un
         cvYEmR2wXOMJg72Q7XTKfeBN6GPSRyZdp+U4mTjIIO4hOuovDvWNZjsEYBr4iJuYI5u4
         ssYt+CIK/aAEbT9sj16rIOm8eUUcwLkg21zQ4t5z0VY8HCtKyiWrQcpS6567LcwXRpNF
         +Knw==
X-Gm-Message-State: AOAM531NQ5zhibkMKqdIXs+NIAO7R3Akl/JDyF5aimbW+JqU3OgZVfh6
	RNfzAh/cu3Nrqi/wZ10nnB8=
X-Google-Smtp-Source: ABdhPJwbRJ2rCIQL/Q3StLs1H5QPCuUBgkG/m3osQ+cYLZfho1Vo08oZxWM0qjiRVKNCzHnsZ/wJ1g==
X-Received: by 2002:a37:6682:: with SMTP id a124mr16075623qkc.83.1622467008458;
        Mon, 31 May 2021 06:16:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id u11sm3008622qkk.12.2021.05.31.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:16:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: -stable and -dev updates
Date: Mon, 31 May 2021 09:16:42 -0400
Message-Id: <cover.1622466879.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

-rc4 has rolled in for 5.13, which is about the time that I normally make
it the -dev kernel version. I've been testing it locally since -rc1, so
it is good to go.

So we bump that version, as well as grab the latest -stable kernel updates
for the active versions.

Cheers,

Bruce

The following changes since commit 40d3366bea8d2417e89a37c6f2d38e1542160342:

  flex: correct license information (2021-05-28 06:41:03 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto-dev: bump to v5.13+
  linux-yocto/5.4: update to v5.4.120
  linux-yocto/5.10: update to v5.10.41
  linux-yocto/5.4: update to v5.4.123

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 7 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.19.1

