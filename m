Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web09.9655.1631282862181623884
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=1ImmSxHr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so2368797otq.7
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Y2SQ9xGmYg7YaYc6z3p66zo05bHvQiFSMn7nQ3FCVM=;
        b=1ImmSxHrRIFpdEnfwNtWKUBbc4Sdb5CAUyrJQzbz0D2j6FB+BlUWqW5ql3CMawJuzX
         tdpIrq8uyD/EkM+4scQFEuaXY3BrjGl33ycyfr0CEOapXN3NFf2gRMxEyT7scPYnv6/q
         g3B35VN2ck25XDvEJHAGQtQaDvF8kM7iHyaHt97vNLZj0wcpX/NzjFrZ91Hig3hC+sMK
         QTPho+zkmgxeRqF1N6eY8GYQ045ypITHd+o+4HxaFMyTDpBUOcD3JyHe6ZjbEXKkgu+U
         wJudtWtGw68nylTiI/rMMMxo9NLT/QBK1hxe2z9Jbt+Lu9qMiUrK0gdu8N8l9aOP2GQG
         TNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Y2SQ9xGmYg7YaYc6z3p66zo05bHvQiFSMn7nQ3FCVM=;
        b=BOnw/Av8TF5GEDznqh7PCJqtlaVu3jxS58WV46hGcmjWZTcJKwA1egmmmHOHh2SCsi
         LVzCsFpyLbefromzQwG+VMLqbRjqmk3zVPrNJTIwSalkCrZz407tcgsdrOFO9Fx7L5f4
         TSt8oKrF/OfnLh84AxGLd3Os+orlIyEilrr9VG/n3dFZU3lmQUsQ+c/1btb7TD8v+CR4
         cSgHXmT2bpx147+2W2stwrh23VXQyMJvfaMjY6V5HjjZfEy3hNTqk/2qoLif/Dsgejlx
         e0dgIr80kmh+KiKCJ+IpPAVHJhTh0/8nruT1a5QyssCtpYLzSYcs7DqJEIC+JvJKiS8n
         qMog==
X-Gm-Message-State: AOAM530Y18GuGYpleZQ5NwEU/7bd7YkFy1aMa1REw4OFAwKtsHGzGGqG
	iXz2G/cWcmb34ap9OukssLxHmY40+dDvynvt
X-Google-Smtp-Source: ABdhPJzX3MkuYA/jwnxf0JhCBdRbWwpniQE8mAAB+Tvtae/2nwfsZ5XiQlgnLb3wq7hL6X8nlVzKNQ==
X-Received: by 2002:a9d:724a:: with SMTP id a10mr4655149otk.323.1631282860800;
        Fri, 10 Sep 2021 07:07:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s198sm1248831oie.47.2021.09.10.07.07.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:07:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Fri, 10 Sep 2021 04:07:11 -1000
Message-Id: <cover.1631282682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2570

The following changes since commit fcc609d3bafef2f63039dc54c0fd0eaf062710a1:

  rt-tests: set branch name in SRC_URI (2021-09-08 04:50:47 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Armin Kuster (2):
  xserver-xorg: Security fix for CVE-2020-14360/-25712
  go: Several Security fixes

Ovidiu Panait (2):
  dbus-test: Remove EXTRA_OECONF_X configs
  dbus,dbus-test: Move common parts to dbus.inc

Richard Purdie (2):
  flex: Add CVE-2019-6293 to exclusions for checks
  go: Exclude CVE-2021-29923 from report list

Wang Mingyu (3):
  dbus: upgrade 1.12.16 -> 1.12.18
  dbus-test: upgrade 1.12.16 -> 1.12.18
  dbus: upgrade 1.12.18 -> 1.12.20

 .../distro/include/cve-extra-exclusions.inc   |   4 -
 ...s-test_1.12.16.bb => dbus-test_1.12.20.bb} |  42 +----
 meta/recipes-core/dbus/dbus.inc               |  34 ++++
 .../dbus/dbus/CVE-2020-12049.patch            |  78 ---------
 .../dbus/{dbus_1.12.16.bb => dbus_1.12.20.bb} |  40 +----
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   5 +
 meta/recipes-devtools/go/go-1.14.inc          |   9 ++
 .../go/go-1.14/CVE-2021-33196.patch           | 124 ++++++++++++++
 .../go/go-1.14/CVE-2021-33197.patch           | 152 ++++++++++++++++++
 .../go/go-1.14/CVE-2021-34558.patch           |  51 ++++++
 .../xserver-xorg/CVE-2020-14360.patch         | 132 +++++++++++++++
 .../xserver-xorg/CVE-2020-25712.patch         | 102 ++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   2 +
 13 files changed, 624 insertions(+), 151 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.12.16.bb => dbus-test_1.12.20.bb} (51%)
 create mode 100644 meta/recipes-core/dbus/dbus.inc
 delete mode 100644 meta/recipes-core/dbus/dbus/CVE-2020-12049.patch
 rename meta/recipes-core/dbus/{dbus_1.12.16.bb => dbus_1.12.20.bb} (75%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33196.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-33197.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-34558.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch

-- 
2.25.1

