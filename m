Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B683C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 14:13:10 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.9743.1657635185627382197
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Lzvo+Oa7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so11527270pjn.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p9ABMPpRknOuHiXBSwa/f4aIu02VeYWFhBk7SJ2pwq8=;
        b=Lzvo+Oa7JGQy0vr6sztH4KWQ1nlOtPnTgWJpuQdXxrN9e0fDhI65RlDBxo/S/VZnNR
         gr0RfHrIj+jJ9K1E+xk+8R4hPJRIDJEpTFbUaeJUPTrEuBlnPaY73nD5GaUsMfwrWrZv
         zbSg8wjdJC6q0jALcTM3+opDwHzEI5IFP6BSVZ4GUTMcWgFG0ZQXQ7ClsZUfZsmjnNyW
         E43mCubj/hQvoi/jQyJ0AWapbpoHzjG0gOAeu4kszLOpycAfqNwaMv1FxPXA6ePfDNRW
         yRVgtHaJ9yv8r8AnHkbHbpAAgqxaEe+CzQE+cYyYxpos80BIUaTEQa5LaFvwgrJw73of
         ntUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p9ABMPpRknOuHiXBSwa/f4aIu02VeYWFhBk7SJ2pwq8=;
        b=0/OOU9SfynJrWKoiE3X8ejSRdF7ndb6d+d17QiBGTozhnD2i5c/OBbqfVWpU+wRNon
         O9iJWczRuj+BItISUSj07O7oai8K+Vn5yZJF7EM2l1CzSuxUM4tIRNxqY3UcEvX8J7wm
         r0IY4sXkr/jkZQLROdfgW/pUFS0CXhZ6Tt+5bKAe8dlMB4AOz0UUtcj08+8hbewIY8TZ
         MeDELWraJRHt3qS2zp15chstcg7ymcNmC4JYNA/opgNenV86iSanTdzSw9zH2kE8WWHS
         K+mnQz+uF+6bqYNN7qd3DrA1ePZglXHKAj1cjPIQohnn0fCp3OPU4yr9omQCoeT+Zwlg
         cp3A==
X-Gm-Message-State: AJIora+sa1qlBiMI1SO20hhaXoIVr7q8o2PFtBAYjwbhqu0Impk3yN6c
	65Z6AKTwuB60RIawuHSZrdEk4j6YfNI48rdu
X-Google-Smtp-Source: 
 AGRyM1tPOjWjwRTzWgMphUl9x1Di1Gg2nqr4qsJ/WsQr9j+35BW2YzN1qdZCEYnCSUbRI/MtuxqS1g==
X-Received: by 2002:a17:90a:9bc5:b0:1ef:8084:ada1 with SMTP id
 b5-20020a17090a9bc500b001ef8084ada1mr4546897pjw.172.1657635183939;
        Tue, 12 Jul 2022 07:13:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e20-20020aa79814000000b00528c7ac7f27sm6845046pfl.81.2022.07.12.07.13.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 07:13:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Tue, 12 Jul 2022 04:12:52 -1000
Message-Id: <cover.1657635097.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 14:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167927

The following changes since commit b75caf4a985e3c20996531785125eaffdc832104:

  insane.bbclass: host-user-contaminated: Correct per package home path (2022-06-29 05:15:49 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Anuj Mittal (1):
  efivar: change branch name to main

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.199
  linux-yocto/5.4: update to v5.4.203

Jate Sujjavanich (1):
  IMAGE_LOCALES_ARCHIVE: add option to prevent locale archive creation

Ranjitsinh Rathod (1):
  openssl: Minor security upgrade 1.1.1o to 1.1.1p

Richard Purdie (5):
  cve-extra-exclusions: Clean up and ignore three CVEs (2xqemu and nasm)
  vim: 8.2.5083 -> 9.0.0005
  oeqa/runtime/scp: Disable scp test for dropbear
  packagegroup-core-ssh-dropbear: Add openssh-sftp-server recommendation
  oe-selftest-image: Ensure the image has sftp as well as dropbear

Ross Burton (1):
  cve-check: hook cleanup to the BuildCompleted event, not CookerExit

Steve Sakoman (3):
  openssh: break dependency on base package for -dev package
  dropbear: break dependency on base package for -dev package
  qemu: add PACKAGECONFIG for capstone

 .../recipes-test/images/oe-selftest-image.bb  |   2 +-
 meta/classes/cve-check.bbclass                |   2 +-
 meta/classes/image.bbclass                    |   5 +-
 .../distro/include/cve-extra-exclusions.inc   |  31 ++-
 meta/lib/oe/package_manager.py                |  13 +-
 meta/lib/oeqa/runtime/cases/scp.py            |   2 +-
 meta/recipes-bsp/efivar/efivar_37.bb          |   2 +-
 .../openssh/openssh_8.2p1.bb                  |   5 +
 ...5d82489b3ec09ccc772dfcee14fef0e8e908.patch | 192 ------------------
 ...611887cfac633aacc052b2e71a7f195418b8.patch |  29 ---
 .../{openssl_1.1.1o.bb => openssl_1.1.1p.bb}  |   4 +-
 meta/recipes-core/dropbear/dropbear.inc       |   5 +
 .../packagegroup-core-ssh-dropbear.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}  |   0
 meta/recipes-support/vim/vim.inc              |   6 +-
 .../vim/{vim_8.2.bb => vim_9.0.bb}            |   0
 20 files changed, 64 insertions(+), 272 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/73db5d82489b3ec09ccc772dfcee14fef0e8e908.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/b7ce611887cfac633aacc052b2e71a7f195418b8.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1o.bb => openssl_1.1.1p.bb} (97%)
 rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)

-- 
2.25.1


