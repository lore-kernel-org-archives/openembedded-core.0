Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.1824.1601938651307772336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2020 15:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EOCb9XyU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id o8so257013pll.4
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2020 15:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=seFHZUvtkbTsXwYTUemnQzPxGlmoHSduqcTPac6RgbU=;
        b=EOCb9XyU39/vyBIqd9SS92C8Ua8GItpJEfvux56+ybrXhm/A0frcMsJmvqOIiJt9qx
         wL4ROePNIC9Owg/hcdtWgsOIF5pSjlEGeOD+6L17fJFE4MazsUapRXsAhurrh/f8+G2G
         P+l6WAV84bcSk1hz1NQgIn7lSJVPoLuRgfe+JoWPO1NSiOuLybH4VQqYXPLCYsg31o+O
         2vAt412Wx9+YyTFW8RDKTtJr6vUDrgzaJ0rgKoqp4xJligWw6wnxXikdUf6LJO5m/cXe
         sokoeddAc9qm/ShdmPssnTBwByJ9lI4Iw1ZMhSrHNUszkMpvti2cfvN9xt6R17pHKDPd
         QvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=seFHZUvtkbTsXwYTUemnQzPxGlmoHSduqcTPac6RgbU=;
        b=BCepSaQZbBJ1cnNOAQYWSL64uoq86prUym/ufyW6eTpf0fkfAp0O0ISQxgxflVJYaz
         Lt4ytIhlEQS6DdWN0FKZOJ0VOgkDP5sU3HUlwgrLRhAGUbrygh3M9yaNBXA/HSQjBIaJ
         tL0NOyU+YCPda0U8S9lJ9hym6MiyQ4io8cfCyiK3Wk1ZfGMAZh6LFSYmOPD/YX2n3Gnz
         dDYIjpMpXJiN6VkuovqdjhDW4UvWFNU6DUCMbXY/FCP3QW4UXvGkbdZyAKmzBbXd4DfI
         PLt/i2wDCto0XTm7rVGur7NGuBpkpuAiWDRp0nOkeTGF123PPkTCaU1ULDsOLOSuIPqD
         bwWQ==
X-Gm-Message-State: AOAM532OsWvHEp0xCZAoa+cYFlJLbnuKK9RRt7nYaf3qLSlJweXkUM4X
	FM952gNm5Flz/facIGTCH8JCJoyoszsI3gwnL9E=
X-Google-Smtp-Source: ABdhPJw3OS7RZj7/bRQum9/WAvQGpGOt4+odgd5OtCnz9mvnjNbEB7GElqvuP5RQQ+BxTD4bro8O8w==
X-Received: by 2002:a17:902:d716:b029:d3:8e2a:1b5d with SMTP id w22-20020a170902d716b02900d38e2a1b5dmr606701ply.85.1601938650258;
        Mon, 05 Oct 2020 15:57:30 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s67sm1038881pfb.35.2020.10.05.15.57.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 15:57:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Patch review
Date: Mon,  5 Oct 2020 12:57:17 -1000
Message-Id: <cover.1601938491.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Thursday.

Passed a-full test on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1449

The following changes since commit b9296bdeaacc1dce97aac9c9bf0d70555bb36646:

  wic: Add 512 Byte alignment to --offset (2020-09-30 05:54:58 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Chee Yang Lee (1):
  perl: fix ptest test count

Tim Orling (1):
  oeqa/selftest/cases/devtool.py: avoid .pyc race

 meta/lib/oeqa/selftest/cases/devtool.py               | 3 ++-
 meta/recipes-devtools/perl/files/CVE-2020-12723.patch | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.17.1

