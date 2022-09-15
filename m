Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB0FECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 23:28:15 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.128.1663284489636388104
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 16:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=e9wXVO7H;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 q9-20020a17090a178900b0020265d92ae3so23880807pja.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 16:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=o5y9hMv6eucuckWE0YIZk66g4VebdGh93fYh6lgSmeg=;
        b=e9wXVO7HL+aYcVyxCsHbjOnVjGxyKkLNMN3DyPPGJG9lTjZbIbehHSy2XXYf+YT9d6
         Ry6RHZC0268JzpnceXehZbn8HaQIOfDhLklz7ZHPQPGmW5qT/CpSdZ97AwKR2V39qDVf
         4aP/qrX0xUE1XaeOPRZokb4TbfKHD5d87h+MNdXpP4gbCIaXfrk9O0VMZjRSGuioARKs
         /CsAoUP3psZBENLMwR/r7CNYbylSGZuQsPKYa6XzNssKE2dF4NF47uhK690KJJjsdFYH
         y6SU2Fkcoo67xuqb6abfegRfbISJuUpC4MjrRa2eZJFK6OCozuxiWqNZje3U1M93wint
         oenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=o5y9hMv6eucuckWE0YIZk66g4VebdGh93fYh6lgSmeg=;
        b=5q7uwEzCo1hdcHBXIJO9zsgAdS6Aru4Oo4uU+UytXbU3zWCH53xrS9kXXF+h8j+ery
         XHSQw30xnCoYNbZL9P7eEH+1mcoyyaOSBijFCvKtEz+/m8u7F+qS/QrBn8eAw9sVDBuz
         eIG9mUJSCUA0YdFp7zZCj/R7c2q6G6w45iK/BzJ3JDG9eJDBC/ue/JPzUYCW/wSdCZDD
         tD6g0mf5pl5+IIN0D6rksoMyZwLFyghsFx6X6WceF05Ham8/widgJ0gwt1M2C/FKwWVI
         c9FUuyKVmEFDTz/M3k3UU50/85MIlUuFPdypcfFtdmT+6GHjcoPYV0XZglQjsqxZSHCO
         oDig==
X-Gm-Message-State: ACrzQf1izFsmlpXraxJXJhBbNY7M59JMRvbnGU9He61Ns08lTW5d0qWi
	ryETiNBVN61cVasyn7Hxmnqorc79flVMQ+uF
X-Google-Smtp-Source: 
 AMsMyM5SUuEfkOwpHA/0A9nd9prkRabcXYJx7LmXqE/PjuyU+3azMF3yZom34bDKACPTzyXbcGT3XA==
X-Received: by 2002:a17:903:291:b0:172:f018:cdce with SMTP id
 j17-20020a170903029100b00172f018cdcemr1800391plr.91.1663284488547;
        Thu, 15 Sep 2022 16:28:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h185-20020a6283c2000000b0053e607a6bf0sm13032110pfe.43.2022.09.15.16.28.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 16:28:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Pull request (cover letter only)
Date: Thu, 15 Sep 2022 13:27:59 -1000
Message-Id: <cover.1663284424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 23:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170778

The following changes since commit bfce90b1260d07f01a8dc2998c9e63ca36d4ebbe:

  npm: use npm_registry to cache package (2022-09-06 07:10:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alejandro Hernandez Samaniego (1):
  rootfs.py: dont try to list installed packages for baremetal images

Alexandre Belloni (2):
  ruby: drop capstone support
  runqemu: display host uptime when starting

Joshua Watt (1):
  oeqa: qemurunner: Report UNIX Epoch timestamp on login

Khem Raj (2):
  autoconf: Fix strict prototype errors in generated tests
  autoconf: Update K & R stype functions

Kristian Amlie (1):
  externalsrc: Don't wipe out src dir when EXPORT_FUNCTIONS is used.

Martin Jansa (1):
  libxml2: Port gentest.py to Python-3

Pavel Zhukov (1):
  core-image.bbclass: Exclude openssh complementary packages

Peter Bergin (1):
  rootfs-postcommands.bbclass: avoid moving ssh host keys if etc is
    writable

Peter Kjellerstedt (1):
  cairo: Adapt the license information based on what is being built

Richard Purdie (3):
  gcc-multilib-config: Fix i686 toolchain relocation issues
  kernel: Always set CC and LD for the kernel build
  kernel: Use consistent make flags for menuconfig

wangmy (2):
  cracklib: upgrade 2.9.7 -> 2.9.8
  vala: upgrade 0.56.2 -> 0.56.3

 meta/classes/core-image.bbclass               |   4 +
 meta/classes/externalsrc.bbclass              |   8 +-
 meta/classes/kernel.bbclass                   |  16 +-
 meta/classes/rootfs-postcommands.bbclass      |  30 +-
 meta/lib/oe/rootfs.py                         |   4 +
 meta/lib/oeqa/utils/qemurunner.py             |   4 +-
 .../0001-Port-gentest.py-to-Python-3.patch    | 814 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  11 +
 ...ilers-that-moan-about-K-R-func-decls.patch | 138 +++
 .../autoconf/autoconf_2.71.bb                 |   1 +
 .../gcc/gcc-multilib-config.inc               |   2 +-
 ...001-Remove-dependency-on-libcapstone.patch |  36 +
 meta/recipes-devtools/ruby/ruby_3.1.2.bb      |   2 +-
 meta/recipes-devtools/vala/vala_0.56.2.bb     |   3 -
 meta/recipes-devtools/vala/vala_0.56.3.bb     |   3 +
 ...01-rules-Drop-using-register-keyword.patch | 278 ------
 ...rrect-parameter-types-to-Debug-calls.patch |  40 -
 .../{cracklib_2.9.7.bb => cracklib_2.9.8.bb}  |   4 +-
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |   6 +-
 scripts/runqemu                               |   6 +
 20 files changed, 1058 insertions(+), 352 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Port-gentest.py-to-Python-3.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.3.bb
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
 rename meta/recipes-extended/cracklib/{cracklib_2.9.7.bb => cracklib_2.9.8.bb} (83%)

-- 
2.25.1


