Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640E2C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 18:41:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web08.53.1649263082136645025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 09:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yXEuBadc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so3244888pjy.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hIxVqqVVs7UNUpNMVI1yXRKcgFl6QzZCS/gvimDBiCI=;
        b=yXEuBadcF6//enPbte1Z5J+j+HwzjToGk3K1BP2apDefQ8h4Wm3j3ujOG9GN89Q0//
         C5ifEwNfvVY1Yp8bcawDz1Jvo35rimjOyk5rAf0X8j6OPdlkuoXNoaqAsbkNjEutnPcK
         /0DTc33dX9yVYUAgXXgMS3qJjR9rVPhayorMTQj/pX0e3UFAtVe3rpXgjQgEoitUe+if
         AhqCIfJtNtKlZv6dwReT7SOp0sRu75PNmxv/2KPBa7F3D4AyDkFjNZar+mSoY0VPaEwb
         lK1aLpGk7DNK7O8Q7ALGFHHdI6/q79CJ/qz/yKELlw6t9a8qKDohghdeZqn20h2z+isQ
         Wpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hIxVqqVVs7UNUpNMVI1yXRKcgFl6QzZCS/gvimDBiCI=;
        b=kTx0y0s0lbvk6K1xt7oipz4G7t/hR4FEcj6qhPkh+xoIiW6pOo7puKyQ//wAl6M2+0
         ZBjLu98lG4CvhgmQm0SQJbn4zdnFKBpBCVVXZbHgwKbnbwkd4yABlIzkYZV4EGj7Ddga
         TI8btuyIpECGhfPCGb7mH2nxwpXPNIzHgffSuaTzXPkzvzGlHd1NlEputrWEp8m9ub79
         zj4XJuZ9OHtMJyjsgx1nnfBNobEOXFQBB1edrM7twfhdN/YsZVrBpEwm1leS2rv5yv27
         GBwGgykMAKa0Mk/51vPGBcrBSoaDn0IZ0c8gQzAzslce/Ej95jShTy0/Iy/UGzYRRSYb
         CA+Q==
X-Gm-Message-State: AOAM533WFldMjt+buHuJkm/zK8IXVIH2QdqdQ+LYJuMsK2+ZsK/jPom/
	fYI2VgKjhYLo4Nkm123czu8HgIxQhM4mtRA5+Fo=
X-Google-Smtp-Source: 
 ABdhPJz+Q+8C/8wmYDtRY1A+75P7UC+PAXNoVRTptD9sIi+xIWajN3hekDAAwZ6qtaNhBw5WVgBvHw==
X-Received: by 2002:a17:90b:1805:b0:1c7:ba88:9550 with SMTP id
 lw5-20020a17090b180500b001c7ba889550mr11100794pjb.16.1649263080926;
        Wed, 06 Apr 2022 09:38:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a056a00198b00b004fa7da68465sm19762842pfl.60.2022.04.06.09.37.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 09:38:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Pull request (cover letter only)
Date: Wed,  6 Apr 2022 06:37:47 -1000
Message-Id: <cover.1649262919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 18:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164091

The following changes since commit aa2bb4f62dd7e5c6fdf220264c3d62fbf2cc7d16:

  xserver-xorg: update to 1.20.14 (2022-03-29 11:43:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Davide Gardenal (1):
  go: backport patch fix for CVE-2021-38297

Martin Jansa (1):
  boost: fix native build with glibc-2.34

Oleksandr Kravchuk (1):
  tzdata: update to 2022a

Peter Kjellerstedt (1):
  python3-jinja2: Correct HOMEPAGE

Ralph Siemsen (2):
  bluez5: fix CVE-2022-0204
  bind: update to 9.11.37

Richard Purdie (1):
  mirrors: Add missing gitsm entries for yocto/oe mirrors

Ross Burton (1):
  grub: ignore CVE-2021-46705

 meta/classes/mirrors.bbclass                  |  2 +
 meta/recipes-bsp/grub/grub2.inc               |  2 +
 .../bind/{bind_9.11.36.bb => bind_9.11.37.bb} |  4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 .../bluez5/bluez5/CVE-2022-0204.patch         | 66 +++++++++++++
 meta/recipes-devtools/go/go-1.14.inc          |  2 +
 .../go/go-1.14/CVE-2021-38297.patch           | 97 +++++++++++++++++++
 .../python/python3-jinja2_2.11.3.bb           |  2 +-
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 ...e-warning-with-glibc-2.34-on-Linux-p.patch | 32 ++++++
 ...-elide-a-warning-that-caused-Solaris.patch | 24 +++++
 meta/recipes-support/boost/boost_1.72.0.bb    |  2 +
 12 files changed, 234 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.36.bb => bind_9.11.37.bb} (97%)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-0204.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-38297.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Fix-Wsign-compare-warning-with-glibc-2.34-on-Linux-p.patch
 create mode 100644 meta/recipes-support/boost/boost/0001-Revert-change-to-elide-a-warning-that-caused-Solaris.patch

-- 
2.25.1


