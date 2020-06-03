Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.4521.1591214862831887265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 13:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=r+KcK96C;
 spf=pass (domain: konsulko.com, ip: 209.85.128.42, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f42.google.com with SMTP id q25so3404604wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/OMyI0DiC03sc4qr37IgHb7opC+F8AF9IqH2PL/xcA=;
        b=r+KcK96Crjaad2Q/t1p1Ee0r7f2mpHq7HDTjgHdAJ234CrCG+AJvCZ91myRftNuo0X
         26Ne1QZRg8zlAPyAvtMrDZ48qxna4iIU+C7r7d3vsIW6+K+omssXZc2d3Uh4LIYYwzt5
         pakehnEfJkITolsBBJ3Si7qS1WTMfQhUL53I8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9/OMyI0DiC03sc4qr37IgHb7opC+F8AF9IqH2PL/xcA=;
        b=rykCW7L43yOEVRD4iKQIBERWNEv4n2bfBeNsX6rf4DqnAm/oFAs+zvMrHXUlXfifmv
         UnzTit+6KJtcZnkN9dvDKq3B/wycDq+SHnoK6+kl4/xSP0BnMFUbubT0IYF0qYMLsDbe
         sUrd7MjvgA1opHbMQ2dxR0/Ep4i7DG0UWOj7Cx3Lk8y2GU89H9OIOIP2q6VXxID0BMB2
         OOg9P4m5nXXkZe3HtxKdwSv57BtH7i5z5Dg5AU+DU3t4gO9RjlmzJMjcXquyWmCpzdx9
         Y/MDE99CWTYNo3E+s04nWv5xLYW6QJvM1yyLgfeD1ioYMzO9Y49pVHLp/HszsCg2uhI3
         gzzA==
X-Gm-Message-State: AOAM533VRi1uNgm7VtRApb8xCtAxxVjz2pBQ9bY9Ef+lcLZSp02neacH
	ESA2CNCK/VEyN4A95TBWfuELXTosfLLedw==
X-Google-Smtp-Source: ABdhPJwdLpp89z8pkwYcByo/ekwxMq1odvBlGVnotHh/Og1b3bHQh2gajwOiv2S9mDuszsApVGM4PA==
X-Received: by 2002:a7b:c393:: with SMTP id s19mr744435wmj.92.1591214861017;
        Wed, 03 Jun 2020 13:07:41 -0700 (PDT)
Return-Path: <pbarker@konsulko.com>
Received: from ar2.home.b5net.uk ([213.48.11.149])
        by smtp.gmail.com with ESMTPSA id y19sm4186338wmi.6.2020.06.03.13.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 13:07:40 -0700 (PDT)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 0/3] oe-selftest improvements
Date: Wed,  3 Jun 2020 21:07:35 +0100
Message-Id: <20200603200738.23534-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches add some extra options to oe-selftest and fix the test
case patching logic discussed with RP on IRC.

The last patch may fix [1] but further confirmation is needed.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13815 

Paul Barker (3):
  oe-selftest: Allow overriding the build directory used for tests
  oe-selftest: Support verbose log output
  oe-selftest: Recursively patch test case paths

 meta/lib/oeqa/core/context.py     |  2 ++
 meta/lib/oeqa/selftest/context.py | 25 +++++++++++++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.26.2

