Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE33C433EF
	for <webhook@archiver.kernel.org>; Sat, 23 Jul 2022 15:29:24 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web08.7188.1658590159856951753
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 08:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Z0meqy79;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id o12so6773108pfp.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Jul 2022 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XTlHhyKaJI12pxhc6lAuIFgbKeLPZRkaAFJNoikb4xU=;
        b=Z0meqy79/+qXAIAB2g3NZ4fAXv/qJ5jUSpscONPC3No7XTLWX46EnQu1lA2RQgNQP1
         KiaRolzzKIGQFlr3fx9XnUI3qH191ECgjFgF5pM6BJuOvQ3ZBwEZASlwNnQdjrhVXzJT
         Fj7PJQvt4zpKSLRyBKE190gLOaP/wN64AzsXFwD/21B/qhWcDGcndEOQybn6rGucFg9d
         Xl5gjBVrDEzYhCLNQgFImzAZ44uLZnBOKE4nylecDEQ5xPF0cpwYeu2e8efkZDzF1U3h
         UTK76Vw7Smh9GhwVxalPohSPq0TTIaDVjuDu/4prfKzDk+y2QajjeZFPtWh4YluUxrBm
         0FJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XTlHhyKaJI12pxhc6lAuIFgbKeLPZRkaAFJNoikb4xU=;
        b=oqmWHwKtfqLCMHOezsoPLfp1tpP5leTluPgqyc/9LI9B6NDjpDrAy+mqlxt5vbJ/OZ
         HAOFY7lfq2Ftgw/Z+Cp5beO3JpXan6nvWGGjZY21Jrhsb7DtJIO0prdk4ilUTXLiQvfF
         RLjPhzB8/Gx1pv4LLqXcThcjmgH8+4cQML28UhTvibFyT9pv631DayjUf1v4B/wbYIJR
         L0F/FImZXc4IDCq8UNdygYvahsHmVGrRPgW7A7FyPJt4ZC11SriXypNHEMLuM7ZqwOuh
         lo7Mqy3uov2CUrGbig1eZBclyROcNRmJ3Z8eulknm4OITJHyg9rAdZ5PYIyPJ+s3utzV
         3gqg==
X-Gm-Message-State: AJIora/3tJzH+z0eAxiTSBBX+A2OJzzn1JxmXDwXzYcXEvYLiniCWDGI
	CKzJB6yDt1G+I3KdMwH5wXK8jmkj/ViPdb3I
X-Google-Smtp-Source: 
 AGRyM1sEbz0gRkD+mlgk/Je05cdC9G0rpsDp7k4zTagXLZyIqc8qEB/3fbnAzjd2rUUg/VHzf00q1w==
X-Received: by 2002:a63:1b22:0:b0:411:9b47:f6bf with SMTP id
 b34-20020a631b22000000b004119b47f6bfmr4279632pgb.200.1658590158490;
        Sat, 23 Jul 2022 08:29:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a1709026bc700b0016be834d54asm5762986plt.306.2022.07.23.08.29.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 08:29:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/4] Pull request (cover letter only)
Date: Sat, 23 Jul 2022 05:28:57 -1000
Message-Id: <cover.1658590082.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Jul 2022 15:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168443

The following changes since commit bba069463ca3813666d084643b0239b9af0199e1:

  classes/cve-check: Move get_patches_cves to library (2022-07-13 05:25:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (2):
  linux-yocto/5.4: update to v5.4.205
  linux-yocto-rt/5.4: fixup -rt build breakage

Ranjitsinh Rathod (1):
  cve-extra-exclusions.inc: Use CVE_CHECK_WHITELIST

Robert Joslyn (1):
  curl: Fix CVE-2022-32206, CVE-2022-32207, and CVE-2022-32208

 .../distro/include/cve-extra-exclusions.inc   |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../curl/curl/CVE-2022-32206.patch            |  52 ++++
 .../curl/curl/CVE-2022-32207.patch            | 284 ++++++++++++++++++
 .../curl/curl/CVE-2022-32208.patch            |  72 +++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 8 files changed, 432 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch

-- 
2.25.1


