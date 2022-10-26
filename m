Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F87CC38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 23:03:25 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.399.1666825401383057387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 16:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eF0wGfmh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id c2so7510821plz.11
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 16:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qdw3xptH7fi9wjB1dn5bB8JekjklX3CqrXQqKs8fUpU=;
        b=eF0wGfmhZc0ho2ZRdStPO2iG//0Qto4sROLSVEz3gI8d6nzbHkU8ogvqvPYfGKEs6Y
         jii/sjO609j1Kuxr53P7wLbAPiGD18j2Bortf3igaMETa6jr8QGx9t23Eu8E6m/9UXcN
         uYbQZfG76YYQaIJivqL5Of7uKfu9EEm7uK+LvnOKNFv431P2Vj4H+yWgQLL860fywCbs
         VM6MXDg1nzs9euNndp3YemhxPtwGFgkF+gPQCEx0kw2yemfHV484wH6U0Gq5U20pHY+M
         uZRxclwMPg5gl3hn2oB4WOgeqRYUCt/W0jvP2+MyubNNxuYfo0Y3yM8jjMEfXro4DXwO
         p4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdw3xptH7fi9wjB1dn5bB8JekjklX3CqrXQqKs8fUpU=;
        b=GHyFY29L/A8Gr/xajPh6FG+ClkQbFr15Y2OeqIDTOgjnRsvngPgyDfiOW/IXQZjlPi
         8oBz9U5H8oUhOMFsRXVLzvBY2dIOMlx7qX7A0y89nm8IkL42gDqOEnXPAkyN6hP5Nr1V
         7BwtxIXSvxSc1FV3SsEMTRVwb3sNPrnyucPZU0riPGCIw0B8ygxJAEblJdYcJHsnzFnU
         JqcUsqHXC6crB0Xx2wY9MP5L3XTbFnaI0VQMAsCMFelEOx5QoNXGieB9noRtkVWusF0y
         lenFHhFfeWdMSKuk1LQcuGqFdiuUP+F7Y4ZpvxaYlomCahaj9venaWVhWFsNaqTq07sI
         qzjA==
X-Gm-Message-State: ACrzQf0XjJgK0ZSHOHNXNBH8Zeks9znIwu7wxVevbsAaq/t1OdVJycOX
	0cUvr2NxIkqrammG6i4CyaLn7CMBvHswWQsI
X-Google-Smtp-Source: AMsMyM4kWZ0DBMcnvDx641BGInLRG4noS0cufXn6he6RYRp2oFcHt3+H0DDXRep9G006K/BUhBtsEw==
X-Received: by 2002:a17:903:2596:b0:186:a395:c4bd with SMTP id jb22-20020a170903259600b00186a395c4bdmr19418776plb.60.1666825400020;
        Wed, 26 Oct 2022 16:03:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id 185-20020a6206c2000000b0056bb7d90f0fsm3461641pfg.182.2022.10.26.16.03.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 16:03:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Wed, 26 Oct 2022 13:03:09 -1000
Message-Id: <cover.1666825236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 23:03:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172177

The following changes since commit dbad46a0079843b380cf3dda6008b12ab9526688:

  build-appliance-image: Update to dunfell head revision (2022-10-06 23:23:20 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.216
  linux-yocto/5.4: update to v5.4.219

Hitendra Prajapati (2):
  dhcp: Fix CVE-2022-2928 & CVE-2022-2929
  qemu: CVE-2021-3750 hcd-ehci: DMA reentrancy issue leads to
    use-after-free

John Edward Broadbent (1):
  externalsrc: git submodule--helper list unsupported

Michael Halstead (1):
  uninative: Upgrade to 3.7 to work with glibc 2.36

Omkar (1):
  dbus: upgrade 1.12.22 -> 1.12.24

Paul Eggleton (1):
  classes/kernel-fitimage: add ability to add additional signing options

Richard Purdie (1):
  qemu: Avoid accidental librdmacm linkage

Steve Sakoman (5):
  selftest: skip virgl test on ubuntu 22.04
  qemu: Avoid accidental libvdeplug linkage
  qemu: Add PACKAGECONFIG for rbd
  devtool: add HostKeyAlgorithms option to ssh and scp commands
  selftest: skip virgl test on all Alma Linux

Tim Orling (1):
  python3: upgrade 3.8.13 -> 3.8.14

wangmy (1):
  dbus: upgrade 1.12.20 -> 1.12.22

 meta/classes/externalsrc.bbclass              |  19 +-
 meta/classes/kernel-fitimage.bbclass          |   6 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   6 +-
 .../dhcp/dhcp/CVE-2022-2928.patch             | 120 ++++++++++++
 .../dhcp/dhcp/CVE-2022-2929.patch             |  40 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |   2 +
 ...s-test_1.12.20.bb => dbus-test_1.12.24.bb} |   0
 meta/recipes-core/dbus/dbus.inc               |   3 +-
 .../dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb} |   0
 .../python/python3/CVE-2021-28861.patch       | 135 -------------
 .../{python3_3.8.13.bb => python3_3.8.14.bb}  |   5 +-
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2021-3750.patch             | 180 ++++++++++++++++++
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 scripts/lib/devtool/deploy.py                 |   8 +-
 19 files changed, 396 insertions(+), 180 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch
 rename meta/recipes-core/dbus/{dbus-test_1.12.20.bb => dbus-test_1.12.24.bb} (100%)
 rename meta/recipes-core/dbus/{dbus_1.12.20.bb => dbus_1.12.24.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch
 rename meta/recipes-devtools/python/{python3_3.8.13.bb => python3_3.8.14.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch

-- 
2.25.1


