Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D176FA373E
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 14:20:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.19764.1666621228092327887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Oct 2022 07:20:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KtY4oK/8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso8972347pjc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 07:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p335/fLbD4xF2zDpq1AzXPPLxz5sVsKTmke6s60qfNQ=;
        b=KtY4oK/8MtFUR23SqNwsmKVJSQEZtNeaMc8AWbnV3gXMNDMdsVyO0dBgtx4LfrdfPv
         VC+hc8jkPOuKZK5dGHr8sS/B72m18Fk9vI49ow30Nwmth72CQ83IY3+TWGofbzHvq3cO
         bM2xqNxsok/aiMSHuZmpqwGMEOwvJ6jWqAJFq/EpVgR1pjp1Mb+JqzVe4foueeu6ZKW9
         0g71kg88IfaCoXrAB2Uctnq5MFcqRCVMw1dl+DUigMHBVkzVvDx/Z+tWz6Jk80z5VQJg
         UKTtmSmFAcSp9nYyXuIM0R7deO4vEd0ohLDN1eNNlZlK3R66fPBsDGoTAFEvtYlg+HDH
         f0DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p335/fLbD4xF2zDpq1AzXPPLxz5sVsKTmke6s60qfNQ=;
        b=Xn9FCHS1IVAxBM/L0vz9R5S/Ib2FlP4gGLGMusvlcFWV0w1+CHPlF6J1IDCCUZOlq5
         NO4vEcxL6soZSE48UFlyXVrqlB8FAtb2qbg4EAyUG4u7rMdUcY8PUB4A/nWiZ/XE5uoG
         /9KJv83yFvki9nUhy/3ZM0h2vieo4e/TxT1nBSu922wSQ/Lgiahacr1zkcptBoG33NT8
         GPB4Dmt+Y7KzET15pduJRBdBdCG5ryTonXb+hdMawg3QlI3XfOk8APwV2XPCPeHBtiFB
         TygV5hIGryN7BMZ6Qi5aABgGq22SkCe/zy3JjHmI++M7r7hii0a5Elz8X8CwqrgqjxQQ
         DAwQ==
X-Gm-Message-State: ACrzQf3wSnlfA6irmBPs25j/vF3hCyyF45xxi0zIc3r8fmx7TlaG8NA4
	OlqUZO8sZeD7+pV35NW9X8dASxWGxBRwCMoA
X-Google-Smtp-Source: AMsMyM5Bvd+YMlnzZcma8mfA94tGO++MZlZTthw24Jtsz4CeigWS7mq2DXPTFPmeI7yAvxqjWf7HmA==
X-Received: by 2002:a17:902:f78a:b0:184:f2e2:a5fa with SMTP id q10-20020a170902f78a00b00184f2e2a5famr33982501pln.161.1666621226874;
        Mon, 24 Oct 2022 07:20:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902a50600b001767f6f04efsm19440192plq.242.2022.10.24.07.20.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:20:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Mon, 24 Oct 2022 04:20:16 -1000
Message-Id: <cover.1666621062.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Oct 2022 14:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172088

The following changes since commit dbad46a0079843b380cf3dda6008b12ab9526688:

  build-appliance-image: Update to dunfell head revision (2022-10-06 23:23:20 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Hitendra Prajapati (2):
  dhcp: Fix CVE-2022-2928 & CVE-2022-2929
  qemu: CVE-2021-3750 hcd-ehci: DMA reentrancy issue leads to
    use-after-free

John Edward Broadbent (1):
  externalsrc: git submodule--helper list unsupported

Michael Halstead (1):
  uninative: Upgrade to 3.7 to work with glibc 2.36

Richard Purdie (1):
  qemu: Avoid accidental librdmacm linkage

Steve Sakoman (3):
  selftest: skip virgl test on ubuntu 22.04
  qemu: Avoid accidental libvdeplug linkage
  qemu: Add PACKAGECONFIG for rbd

Tim Orling (1):
  python3: upgrade 3.8.13 -> 3.8.14

 meta/classes/externalsrc.bbclass              |  19 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 .../dhcp/dhcp/CVE-2022-2928.patch             | 120 ++++++++++++
 .../dhcp/dhcp/CVE-2022-2929.patch             |  40 ++++
 meta/recipes-connectivity/dhcp/dhcp_4.4.2.bb  |   2 +
 .../python/python3/CVE-2021-28861.patch       | 135 -------------
 .../{python3_3.8.13.bb => python3_3.8.14.bb}  |   5 +-
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2021-3750.patch             | 180 ++++++++++++++++++
 10 files changed, 365 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2928.patch
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/CVE-2022-2929.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch
 rename meta/recipes-devtools/python/{python3_3.8.13.bb => python3_3.8.14.bb} (98%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3750.patch

-- 
2.25.1


