Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 939ABECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 17:19:20 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.8826.1663348758281238060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qdJxZn7k;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id q63so20935476pga.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 10:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=VqKaM4ip7h0IhoaHKcC2oFMIk0y0SuUozikBmUWCqGg=;
        b=qdJxZn7kzNK7mJ5FhXq4jcflFHy1vm89YXwgyy6haijuWHhLxwpQH7YmCV22/X6OEf
         2hjWqSztC3GwOOMuHCXUm+WaBm+Mt9X7RzY7lA0eTikjnQEVZjIzAz3/v4xaIzrD6y/r
         lbiRz9Cm9+3/NtLQrW1yOiYFVPzf4FHYsCF0STb/+k+yOTptrv/WMYl2pyCiHrPzdv5q
         s4eX5NkE4Vo2Er8TNYwBVv0yl3jVE2/ejeCReTsZwwlymRWsml8SNNSttfL3uJLrry0Z
         RDXqkXnGIFM5Z/BDBELSgYtTs+ERiizc8hjR3vXB8YFBlnj9jL3ga9f2wO6+om2bfNGK
         5p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=VqKaM4ip7h0IhoaHKcC2oFMIk0y0SuUozikBmUWCqGg=;
        b=vW47DdPTFFQ0zLjVNPeiYfq35PCs1pQpS7xi7IZtBuc5P8fwKX+y1bP7lCEh/DLsc4
         lPOAnN0lW+X85+63vPTPWAAJGWfrwuHruS1PtzBs8iEHlSKXwcKSF8S0Q5jlU5OskdrH
         t/hzGGqGlNmkceRZLSPJ2kK4zDRlvyeGhleo2O/bvk1ViMd41EjQqcKhvfvgM8uuEFDB
         QRMpDxn83/b8Oz2nOc5zrQckqttntw5iG4X7qxiIgtWqLUL3OtWCOtmFGUU8U3XfBrEF
         Dh0i7gFr8Q5CtdBhzWqCYcukkrHHdm6XeJBfL0FUKYi1jnDUEjEs6/lvMY4XhzFff10f
         seiA==
X-Gm-Message-State: ACrzQf0uA1zA7uyYcEPcPwzJwVQ6v0M0ZXoZTBs1eO+cuUsW6vQfJqZ0
	Wx7eeeW5KZ0huXqD7D0Ws2n/kbVppC4vqPcF
X-Google-Smtp-Source: 
 AMsMyM6BO7RqzPP4hEzUaSOAZz61uiP5kKNqT3nXlMiddZ7pRcVeguejOi/coYZTBGINFGfiW9lukQ==
X-Received: by 2002:a05:6a00:4287:b0:543:7bae:55f7 with SMTP id
 bx7-20020a056a00428700b005437bae55f7mr6504608pfb.58.1663348757014;
        Fri, 16 Sep 2022 10:19:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 jo21-20020a170903055500b001767f6f04efsm15025259plb.242.2022.09.16.10.19.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 10:19:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Pull request (cover letter only)
Date: Fri, 16 Sep 2022 07:19:06 -1000
Message-Id: <cover.1663348646.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 17:19:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170795

The following changes since commit 2cf26e2e5a83d2b2efd01de34c11da07eeb9c8f9:

  binutils : CVE-2022-38533 (2022-09-13 05:35:33 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Chee Yang Lee (2):
  gst-plugins-good: fix several CVE
  go: fix and ignore several CVEs

Richard Purdie (1):
  vim: Upgrade 9.0.0341 -> 9.0.0453

 meta/recipes-devtools/go/go-1.14.inc          |  10 +
 .../go/go-1.14/CVE-2021-27918.patch           | 191 ++++++++++++++++
 .../go/go-1.14/CVE-2021-36221.patch           | 101 +++++++++
 .../go/go-1.14/CVE-2021-39293.patch           |  79 +++++++
 .../go/go-1.14/CVE-2021-41771.patch           |  86 +++++++
 .../CVE-2022-1920.patch                       |  59 +++++
 .../CVE-2022-1921.patch                       |  69 ++++++
 .../CVE-2022-1922-1923-1924-1925.patch        | 214 ++++++++++++++++++
 .../CVE-2022-2122.patch                       |  60 +++++
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   4 +
 .../gstreamer/gstreamer1.0_1.16.3.bb          |   7 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 12 files changed, 882 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-27918.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-36221.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-39293.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-41771.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1920.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1921.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-1922-1923-1924-1925.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2022-2122.patch

-- 
2.25.1


