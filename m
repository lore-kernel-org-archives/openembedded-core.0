Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.4723.1604009366843359328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 15:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MIUVgJbb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id c20so3529982pfr.8
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2020 15:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=QSijGF76wC4KWFUNqhx7FfLPegv5k2r1seEk5cG4FvA=;
        b=MIUVgJbbfrzfSn56YHr7OqP3/OFRT+CN446zAyNnzOvY1K2LgB78eb0UK3o2rH5EG2
         cMchYz1p0z3WcLUCtaNl/6Nr5A4mYmUMXRifVIE3y/fKNQP8mRPKfhOPsWd+/XE1LAvD
         hA40+7zmL0BdA1yNIgs8XV+5F4Q6hevSup2apVyJwR42FZvH4rcwB2i8ZEP6rveJTVJh
         gS8wWFAHIxhkc+nn/oxERFBQiwLvK6d3s0zi1Qll8Gx/RYCj5+IgwpTomAfsDQ7xNPnf
         f1IgfTHllIH3D4Ay3Uy2vBk0rVqUNTXZSw732OikOYelnXt3+bKa6kUR0aSl+KMbDH/P
         01TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=QSijGF76wC4KWFUNqhx7FfLPegv5k2r1seEk5cG4FvA=;
        b=hDhZBr6/9qF25CG3RLznuIgmEQbmQAgff1fHXvhk9USQPNJ8XplMV8h37s1X4TmONb
         KQ/h0c+oIFsL+8LvqE5oEE2i4scg1H28hVDrgVpk8ASf8NishbU88+Ekj9znthMvIKPx
         NYwoAu52jiGhPCPEAAc6VcNK0U80ev5xP4cgpNUb8Tj7nb46G910WsYj2/YEYzlTRnJ4
         oIBaMHN+4Rm7Aye5jhBrXIic1Hos6HhVDQOHfe9l2T7ELK2XK+tGhRL2UAG139UCZA0X
         LdzIf0XPD0m56tDwl9oJwsq6nK6vtLXY0M0IErLMdUTEDnsSS80wy2ondWMfN5fyFWvX
         5SpQ==
X-Gm-Message-State: AOAM5327fzo7RcuWQEZHN+JFxzpzmnlRJ1JW2c5d2npAFYFpo1uTHEt4
	oxzjwUF44D4zgdvORrC8CQCkBT3SqRJWnsoF
X-Google-Smtp-Source: ABdhPJwFyyb8QA2Bitn9Ibloh/XhSHcl6Ao69EY1lxbXuPxE+96PvQZY67AKA2q9Mq46RBM+kcdXXw==
X-Received: by 2002:a63:ee02:: with SMTP id e2mr5485974pgi.287.1604009365727;
        Thu, 29 Oct 2020 15:09:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e20sm3643638pfi.30.2020.10.29.15.09.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 15:09:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Patch review
Date: Thu, 29 Oct 2020 12:09:07 -1000
Message-Id: <cover.1604009130.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this set of patches for dunfell and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1521

The following changes since commit 8a367cbbf092339a8c82c680a2565567b594b6c6:

  glib-2.0: fix parsing of slim encoded tzdata (2020-10-26 15:06:51 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  nasm: update 2.14.02 -> 2.15.03 for CVE fixes

Steve Sakoman (1):
  qemu: fix CVE-2019-20175

 .../nasm/nasm/0001-stdlib-Add-strlcat.patch   |  28 ++--
 .../0002-Add-debug-prefix-map-option.patch    | 129 +++++++-----------
 .../nasm/nasm/CVE-2018-19755.patch            | 116 ----------------
 .../nasm/nasm/CVE-2019-14248.patch            |  43 ------
 .../nasm/{nasm_2.14.02.bb => nasm_2.15.03.bb} |  10 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2019-20175.patch            |  94 +++++++++++++
 7 files changed, 161 insertions(+), 260 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2018-19755.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
 rename meta/recipes-devtools/nasm/{nasm_2.14.02.bb => nasm_2.15.03.bb} (56%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-20175.patch

-- 
2.17.1

