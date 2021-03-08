Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.39149.1615222048795467777
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SlJRX/82;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id q20so7498904pfu.8
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 08:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dg6/sPGwdow5qIYE19v2PEQ2UHRTLWnl/oG3v+iWzVI=;
        b=SlJRX/82nVb04xI1p8XhiO+mW9p1K0zKsgJTr9IRr3bXHIzF6ZLOT1biv/LTyF14pH
         L/POGPtR5WnKJJwNMM2MwdlkFNAQL1TKZwc9lC8i2XriB0SmrRbeZ2xU2sO0ZI0o1w4u
         NVDz70QX4M1ZJExemKlMSh2mVnl53NXDFq5aIFd+ZjpJSLLd4sZsbneEeHt2szxW0X+u
         l22H/OSqZfSN3hKd8hJjGw05GqqK0UVRxWFuR+/7X7SOi6ZV+NPPIAtJlLpaQGJmcrSs
         K/U7oF8k4+qIPF0Pe5rJC8vqEvQu+R4FQAbNkJn6WAEAQsxoWd2vK25xiiq9eDN3S+XR
         fHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Dg6/sPGwdow5qIYE19v2PEQ2UHRTLWnl/oG3v+iWzVI=;
        b=Tt64MdCjDBxeyjwlguhpyRgjWBe2Naq3lGueLsXkiFRHCiAGFhGh61WCU4PVWk/04F
         qEN5Yr/D4IDEb4EDAvRy/66SADG7FpR4MmRDn2po9ApTGDA2rZD7kWz7BpD2vjZa/uvQ
         fuLEXkFVctzdfiOWiFPZtyUE9ZFWHsQDDB5rg8i5e6gN4wUm1HpQQAr18gqnRtVaCM+D
         wYdDUUPZNTBmQLItLUPY1/d+PXqBtKQtsEu/5Na/5z62Bh8TOKWErB6WG5TMWBYq8/OY
         IYR0Wm2OTJ8Ss41INP/ah6WPEEWBRlaaqRxunQUvpF13SC5j3eG2AsSVdfR3DjclmkWg
         /uUw==
X-Gm-Message-State: AOAM532KJA25g6izBwr3ps5K39cWDEFXo/2D2Oy4FXfzKX2AfPAZdKpl
	jVKfH52Slqs4vVbl0AgkIPytdbRw3KUU0OERx6E=
X-Google-Smtp-Source: ABdhPJxC0KBg+dEr2OllRuLUnlEhg1+UOUW2JAc6zdvJcqdxNUJpJ4Q0lBhrQpH35aNYTMuF2B+yPQ==
X-Received: by 2002:a63:d70e:: with SMTP id d14mr18602882pgg.291.1615222047411;
        Mon, 08 Mar 2021 08:47:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e12sm11256506pjj.23.2021.03.08.08.47.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:47:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Patch review
Date: Mon,  8 Mar 2021 06:47:16 -1000
Message-Id: <cover.1615221849.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Wednesday.

Passed a-full and meta-oe on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1948
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1014

The following changes since commit cf22f3831488b346195e049ace92e153d18660db:

  meta/recipes-core: Add HOMEPAGE / DESCRIPTION (2021-03-05 04:40:01 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Michael Halstead (2):
  yocto-uninative.inc: version 2.11 updates glibc to 2.33
  yocto-uninative.inc: version 3.0 incorporate seccomp filter workaround

 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1

