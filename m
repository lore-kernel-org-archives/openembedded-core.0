Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE7E8C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 14:07:40 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.7347.1666102053116010308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 07:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=t0LzLali;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id h2so6580384plb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 07:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p335/fLbD4xF2zDpq1AzXPPLxz5sVsKTmke6s60qfNQ=;
        b=t0LzLaliv6bz3EKv+9KkftUxlGamYMn17SOGJWZUyMuCoM6uGp0So57OXTsnaNkJA2
         DBdNNZVZ2/C+bdTMwB21QDID/bzPcnlJsNF/iGSk+UN4ir74UU6b86jiIbloOpvkShU8
         CkPx7mK2hXjfsWFZuCUnNrRTlxH24Ys1cCPfW7NnF26vzqm/bIvWXhnLJbptslfVcckh
         E4EjZImhQDGDwlaAnKIDJzheLX+B7wdBWSewDljQ+QYnHb2DBDazdvyKmNYE8mdAaEki
         hWLyDfRq1ell9zMj5+kEj5/vsqJWUCbiDLGtf1MZUKV8RzaWLXHo+WuyE5nsGF81dgie
         GCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p335/fLbD4xF2zDpq1AzXPPLxz5sVsKTmke6s60qfNQ=;
        b=6xSUClI1voTqjxt+4Mg81qULxvQpj2j6PiZ9CHurE7yKfyFrN+zhGRST1BbAn/jnWQ
         pTVYNFfyRARlensWjPw03c7wFJW9PpaWvnEbypxZHCnfsRiLZHS0CXmt1QS9j0xSotBd
         YOg0fs/KW66rKnmdRGEMgMMsEVqpdpaq5Xx7t/tNT1osbp7M94PyPsZItwQU4y6h0uZy
         sq/EK1FrIvmnscMDDgF+dCBeD4tes6PlWCm+zSIrzjr8DseQfaqYYzRJjblO9J7f9l0C
         hS4t4bFHPtCN8mx0YAybedoRHLZfOZV/17VpdOTnCvys7jjAqkFiQkRbyMUfTBLQPZz0
         dwzQ==
X-Gm-Message-State: ACrzQf3/cHBwt04OtP1BXMRtCuJn9AySrDoa1A+6v2BC8WgNgIaB6Xz7
	Mm8zQtUhvCy++PJ8B6zkcNiMfC9FtrTGbNF8
X-Google-Smtp-Source: AMsMyM45PNwu6zW3VC/3/0LVxMcPOclAyqBGOUw/cSGPC549fFFpchB+FueZjNxN8cUgGjHDzAJlHA==
X-Received: by 2002:a17:90a:6c22:b0:20d:3147:e9b9 with SMTP id x31-20020a17090a6c2200b0020d3147e9b9mr3856223pjj.52.1666102051470;
        Tue, 18 Oct 2022 07:07:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d10-20020a17090a2a4a00b0020ddea12227sm3016207pjg.55.2022.10.18.07.07.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 07:07:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Tue, 18 Oct 2022 04:07:18 -1000
Message-Id: <cover.1666101930.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 14:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171942

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


