Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web12.148.1617899495784544796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FsFZHkQQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id n140so2757019oig.9
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Apr 2021 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFQPbeU29ghP6kosda/d8EfhmzTqvWzci5oqp0TwqN0=;
        b=FsFZHkQQkLot3vTXd49opT8JzoSgtPwYoMo/4faEWp7A3pJTZIShLfCggRz7LpCTBL
         CjOmgRVSwM2Hsw07HlPMBXD9Yb9ny7kaxZC+snubDtA5PAj5UjS+U6gAIvOGlcGA0MJV
         uRifpNAENaHgmrRyNYNi8tHKxG8kJnSqfVOuWR9P/5KYKEYtFrmcMkCzOHSyXhsKm9Bg
         omneQ+AXOmb8HRIkS0p+EtsL5AS0rVISYCZxL2o9y//uVWyx2ekiWOAmQCtTbwbghra4
         MQUnkdd4HlQ5/g58PEcLlzMxqd9Idcu4oZHzjF7nWtcEhWDPfc6Z1BBErjVUh2geOOQF
         ACTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rFQPbeU29ghP6kosda/d8EfhmzTqvWzci5oqp0TwqN0=;
        b=sODberT4TOjq0DqdDQWG9isuFa25BBNHERDrDIJjZ+NpoLj5BB4nR0qheLwnYb5vDq
         Gs829TUEx5b8Khs/hD7DVYZJ2bKtuL+oidvNtT1kIkWTrdLZKhZ8jKkV0Bbe8k/IL0d1
         maoVJS8cRwYHkyG4eZqQeDLJ+1sbseZBB9GsOxjgoBhPiSSG8i6RyMfhDyiAOdH5MF4g
         bJY+VXZmQznpv9IqC5gjs3u5VueHpxW6YkfkoOTn4owjKCzgm6v88iStx/7j8uDp9IZs
         1hStod4iubBbDRp7zxOg4MnIxmit29Z6Qy0wmcHm62y7VPc1n0nX1dDLLFj7Ug3oV2h+
         cWeg==
X-Gm-Message-State: AOAM532aUdhpUZcTMxyUr+7xHwlfkCvlWU8R5dHo/5KIx3GR0uWOimd1
	HOGWM+MmgxjiCjIpMjs0daoAXxSHLWvSKypUcGo=
X-Google-Smtp-Source: ABdhPJx2sjOu88VUjW2Gnlf6HojuIc8fzTyAU0Q+ZrfmhXIfxB7RfHB0Eq4cZXkagmX2JPdRc0JZSQ==
X-Received: by 2002:aca:bf82:: with SMTP id p124mr6707970oif.23.1617899494640;
        Thu, 08 Apr 2021 09:31:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id j10sm5546705oos.27.2021.04.08.09.31.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:31:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Thu,  8 Apr 2021 06:31:00 -1000
Message-Id: <cover.1617899121.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2031

except for a known autobuilder intermittent issue on qemuppc which passed on
subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/3261

The following changes since commit d044d9c0cb672c499059eb273e399ce4aee17e0d:

  image,populate_sdk_base: move 'func' flag setting for sdk command vars (2021-04-02 04:21:56 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (3):
  selftest/reproducible: enable world reproducibility test
  selftest/reproducible: add an exclusion list for items that are not
    yet reproducible
  selftest/reproducible: track unusued entries in the exclusion list

Guillaume Champagne (1):
  image-live.bbclass: optional depends when ROOTFS empty

Mike Crowe (1):
  curl: Patch CVE-2021-22876 & CVE-2021-22890

Peter Morrow (2):
  goarch: map target os to windows for mingw* TARGET_OS
  go_1.14: don't set -buildmode=pie when building for windows targets

Richard Purdie (3):
  selftest/reproducible: Sort the unused exclusion list
  diffoscope: Upgrade 136 -> 168
  diffoscope: Upgrade 168 -> 172

Steve Sakoman (1):
  selftest/reproducible: adjust exclusion list for dunfell

 meta/classes/go.bbclass                       |   8 +-
 meta/classes/goarch.bbclass                   |   2 +
 meta/classes/image-live.bbclass               |   2 +-
 meta/lib/oeqa/selftest/cases/reproducible.py  |  80 ++-
 meta/recipes-devtools/go/go_1.14.bb           |   8 +-
 .../curl/curl/CVE-2021-22876.patch            |  59 +++
 .../curl/curl/CVE-2021-22890.patch            | 464 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 .../{diffoscope_136.bb => diffoscope_172.bb}  |  15 +-
 9 files changed, 620 insertions(+), 20 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22876.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2021-22890.patch
 rename meta/recipes-support/diffoscope/{diffoscope_136.bb => diffoscope_172.bb} (46%)

-- 
2.25.1

