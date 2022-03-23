Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BE42C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 22:28:33 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3811.1648074512078016876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 15:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WyukTwkY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id t2so2499136pfj.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 15:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7MQJAvO3Fug0rruWPHfGUqXRAp6SSQJk9jHBm9T9UL4=;
        b=WyukTwkYV6MZTyVUFJvByQjpf+/XGUx57T6mui4Ir/tJu8QkNofAyFYIqLqDY0j3gI
         agOZ45Lc2IUt3ZNhGX4Zn3vLob13kugZDA4A1yoG7EODRgMo87M1isQ6GExtRF2MJGPp
         p3TVsoq1cT9eFO6T+ux1m7H56yqKaZ6BkBih7xCkqdWur2bQIoJqW4S/igBmbISDMtXH
         ZyVli6RrYsv28LGsUtf2uiHjpUWxhcmgTCAXa+bGatz5QN3yqMck1o5+Hp8rUKJQLdkx
         1jgdm3ntzu1GT71KiE8c83QM8awzNJF1KmSSOk+797jfSGIO2cmTLno7hBsVxHp3mb+i
         3z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7MQJAvO3Fug0rruWPHfGUqXRAp6SSQJk9jHBm9T9UL4=;
        b=cdxIHOnvW1MUIroBF/DSULeyGTc9HQknxNvp6BvaAMIVtVp/S3jJyfNZi0heEjwFcd
         7R/dcSDAZb9wEjsgw731pF7Yco508rtpki4jd5GtojN8SV1jyDSHS5fElByKsLcgVJqu
         8QoZMOdN+munlnxOEvmfJDqEk24bd+N7vChK96q4sI1whwiqSMGYlTsEGsm4nLAaEM8J
         PcA+mzaiUBcNvoUCvJ/QeppT0o1zQNLPw4vBabyXJnLhl/iEJnqiY1kcQ2oWbn8w04cC
         LY57VCa+H/WpnAsWjm3kEkhBTmm3DZPR7t4itHn7JqbyxYvOhW5ty6hoLafGjNb2xaj/
         kkkg==
X-Gm-Message-State: AOAM530YHIhLVWpeehkIwv+V9Nj7HwhJWzrPTXkDd57g2rwDmAQebW8d
	FEyjkAqgryM7JRJHFiS7Yu0CkPEtFPKTrrwPaHc=
X-Google-Smtp-Source: 
 ABdhPJzIZ8QP5TjFkmFBuhKFzkl2PM9d8v3aQnblDZ67kx0fMRuTtWcPBabscysLfxUV8+pk6U6qyQ==
X-Received: by 2002:a05:6a00:134c:b0:4f7:db4f:f3ce with SMTP id
 k12-20020a056a00134c00b004f7db4ff3cemr1683426pfu.23.1648074510726;
        Wed, 23 Mar 2022 15:28:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m8-20020a056a00080800b004faa4e113bfsm869860pfk.154.2022.03.23.15.28.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 15:28:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Pull request (cover letter only)
Date: Wed, 23 Mar 2022 12:28:20 -1000
Message-Id: <cover.1648074246.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 22:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163595

The following changes since commit ff90d0e91aec252d3f5986df9ce02293cddadbca:

  build-appliance-image: Update to dunfell head revision (2022-03-14 14:45:29 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  mobile-broadband-provider-info: upgrade 20201225 -> 20210805

Changhyeok Bae (1):
  mobile-broadband-provider-info: upgrade 20210805 -> 20220315

Davide Gardenal (2):
  re2c: backport fix for CVE-2018-21232
  qemu: backport fix for CVE-2020-13253

Minjae Kim (1):
  bluez5: fix CVE-2021-3658

Ovidiu Panait (1):
  openssl: upgrade 1.1.1l -> 1.1.1n

Ralph Siemsen (2):
  libxml2: backport fix for CVE-2022-23308
  libxml2: move to gitlab.gnome.org

Richard Purdie (3):
  python3targetconfig: Use for nativesdk too
  oeqa/runtime/ping: Improve failure message to include more detail
  oeqa/selftest/tinfoil: Improve tinfoil event test debugging

Tim Orling (1):
  python3: upgrade 3.8.12 -> 3.8.13

wangmy (1):
  linux-firmware: upgrade 20220209 -> 20220310

 meta/classes/python3targetconfig.bbclass      |  12 +
 meta/lib/oeqa/runtime/cases/ping.py           |  20 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |   4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2021-3658.patch         |  95 +++++
 .../mobile-broadband-provider-info_git.bb     |   7 +-
 .../openssl/openssl/CVE-2021-4160.patch       | 145 --------
 .../{openssl_1.1.1l.bb => openssl_1.1.1n.bb}  |   4 +-
 .../libxml/libxml2/CVE-2022-23308.patch       | 204 ++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  11 +-
 ...-detection-of-mips-architecture-for-.patch |  42 ++-
 .../{python3_3.8.12.bb => python3_3.8.13.bb}  |   6 +-
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2020-13253_1.patch          |  50 +++
 .../qemu/qemu/CVE-2020-13253_2.patch          | 112 ++++++
 .../qemu/qemu/CVE-2020-13253_3.patch          |  86 +++++
 .../qemu/qemu/CVE-2020-13253_4.patch          | 139 +++++++
 .../qemu/qemu/CVE-2020-13253_5.patch          |  54 +++
 ...20220209.bb => linux-firmware_20220310.bb} |   6 +-
 .../re2c/re2c/CVE-2018-21232-1.patch          | 347 ++++++++++++++++++
 .../re2c/re2c/CVE-2018-21232-2.patch          | 243 ++++++++++++
 .../re2c/re2c/CVE-2018-21232-3.patch          | 156 ++++++++
 .../re2c/re2c/CVE-2018-21232-4.patch          | 166 +++++++++
 meta/recipes-support/re2c/re2c_1.0.1.bb       |   6 +-
 24 files changed, 1730 insertions(+), 191 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2021-3658.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2021-4160.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1l.bb => openssl_1.1.1n.bb} (97%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308.patch
 rename meta/recipes-devtools/python/{python3_3.8.12.bb => python3_3.8.13.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_5.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220209.bb => linux-firmware_20220310.bb} (99%)
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-1.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-2.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-3.patch
 create mode 100644 meta/recipes-support/re2c/re2c/CVE-2018-21232-4.patch

-- 
2.25.1


