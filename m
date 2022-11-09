Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D0EC4332F
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 02:25:03 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web12.1752.1667960693617252188
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 18:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nG4QHSRV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id o13so5699757pgu.7
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 18:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddIOiJH8alwEw9sJw/8P3vuGtuocjo+UK+GHJGxP7Sc=;
        b=nG4QHSRV7NXntKo5KrIAuQHpwPy6rya/r2k+J+BEn5Ee2gBHSFQELA8WgpzJMLbSyI
         /LZ6uyDkG/wbIzcO9RfzqWCmzcBZlQl6011Pi84uoJONqtild4MpbjQHlLVejXnJDm7r
         cjm0Jnp7r8+WgiI8Aw4tnRjFrmcTm7IIySO8CsJbTwjUPipnQKNqCQJREtC3fGHXk7F4
         SFNP6vRfMWpWaDDxnBp8937xH4nMnnetndGrq9F+srKtrKDK0/QaK0xR/EDUE4irFUGK
         HVMBAv2RBwi9EaWcuA12eSmAQ+QxvUkf5KPhWb6Tu7i7l/Ki2nAvSu+Rry8ZdSM3TPRi
         iUqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddIOiJH8alwEw9sJw/8P3vuGtuocjo+UK+GHJGxP7Sc=;
        b=E7Zj82fj2uoVa2rfhXB1mBqeF1xOt9doBXCurrxTHItxexWiaMpsiI70gvfAeKKpYG
         LNEInlkK/zWn7nWviA3jBzHxH83hrAwF0BxnnCgYg1DBuT8Dg25YO2nfKWT9jk+RsY/n
         hsEYK57112dbTXjJlXAb7jWBZydp2KiVTQXfTpuCfbg7mwwDbozm1DBvjEdH3zMLJ+j2
         8sNYqrDDFgAm/dc9mi+vwYHzRDNcDnZT3WIED8KR5ty/sc7YjnTyrtcoankYA5bXAKhY
         lvxoVwE4RhNEhZOHUMzQbv2qHY84RXcCnZDuoexu/l7sphAbiLGPYNhADB6pkh3s83SX
         AqVA==
X-Gm-Message-State: ACrzQf3JWUeSXA0XibVirfGNAzdfsd5Qb55s77/7ANnsNi6AhZm15lzo
	izmAAfd8+ZvLCjx2mZky4eHI9epwb8rtW1/T
X-Google-Smtp-Source: AMsMyM6NXQO203HMeMxmRY4DulMVqt7zw1TaXwojzXXmfLF2kzYdQ0SD/Fsdv4ciaG9AA8DQOQquRA==
X-Received: by 2002:a65:62da:0:b0:46f:63f:37b4 with SMTP id m26-20020a6562da000000b0046f063f37b4mr50840415pgv.376.1667960692372;
        Tue, 08 Nov 2022 18:24:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id k5-20020a170902c40500b001886ff822ffsm7620271plk.186.2022.11.08.18.24.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 18:24:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Pull request (cover letter only)
Date: Tue,  8 Nov 2022 16:24:46 -1000
Message-Id: <cover.1667960582.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 02:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173007

The following changes since commit 54bbfe94ae4514386c572564bf221edfdbb2ce38:

  selftest: skip virgl test on all Alma Linux (2022-10-21 06:28:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  tzdata: update to 2022d

Bartosz Golaszewski (1):
  bluez5: add dbus to RDEPENDS

Daniel McGregor (1):
  coreutils: add openssl PACKAGECONFIG

Frank de Brabander (1):
  cve-update-db-native: add timeout to urlopen() calls

Hitendra Prajapati (2):
  golang: CVE-2022-2880 ReverseProxy should not forward unparseable
    query parameters
  libX11: CVE-2022-3554 Fix memory leak

Ranjitsinh Rathod (1):
  expat: Fix CVE-2022-43680 for expat

Teoh Jay Shen (1):
  vim: Upgrade 9.0.0598 -> 9.0.0614

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 meta/recipes-core/coreutils/coreutils_8.31.bb |   1 +
 .../expat/expat/CVE-2022-43680.patch          |  33 ++++
 meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
 .../recipes-core/meta/cve-update-db-native.bb |   9 +-
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-2880.patch            | 164 ++++++++++++++++++
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../xorg-lib/libx11/CVE-2022-3554.patch       |  58 +++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 11 files changed, 272 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-43680.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2880.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3554.patch

-- 
2.25.1


