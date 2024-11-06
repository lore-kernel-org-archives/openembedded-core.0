Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC56D44D66
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:49:47 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.45904.1730900984250066207
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mGMISFCw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c7edf2872so7521045ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900983; x=1731505783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SVYlokBcN61qhQYXwOdjXNSTzFYMoBYjo0FPekwitI=;
        b=mGMISFCw5B/cij0PNAGKKM6OTEsic3hY/g6PTN9PwXXXO0Ziq8wifrs2b+EXKfXe5J
         9Df879snNl8sUPEtivsVuXupbDLTU9BYQ67J8Wotc6VNmsgjSdLqBSwkkj8Z7qYs4Y1s
         UYCS1Hx6/RyJ1gOBQ2TFDo+y1kcoidHiJR+/BY0HsW3oU5ZVJs89IxS4hJ7gfMQxbwRM
         C5Gb3iA2xFc+9+Wp1D9K3AyTmHxEOUgs42B9PaIxQ1gXAsO3CCY4jLl7K36EaT/vCWP0
         C8EgKaXdGGW87a9EgawMTnxopiTXFzBiUzsPSPZdPqB+iOiR9FVqZq2cZbHd0rlCAclc
         OeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900983; x=1731505783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SVYlokBcN61qhQYXwOdjXNSTzFYMoBYjo0FPekwitI=;
        b=m1ZWp1JgUzrANSqvHD/j2WgF+w5IhPvNym94C7MpW7b3riTG/vlvUk6Qrq4/Ea+d6P
         fR9rpPY7kFkhYLISqTDMzdok3PlmFMAkgEBbuv7LlZBUafvAOvMqdNnYV9q9kkIU3Vsl
         QFO0q1aHacbOpUerJ82Y9F68zN0na1QD4C0+lDEmlq5nhCbqOp+sNBBnyMOM+a/zFdSf
         GVwhFbPggv1EewZQvuMs87aLHUH06EDCW1YfFerrDssOufr+uQj5huCixe/f1Q9XkwAy
         ei+CBJCBU0YxEaOLbnEKQSpPOJpa0+ra/6SzLSmLHe4lhh2Zo4tEyR/8MjoV4BOSzjYC
         pgwQ==
X-Gm-Message-State: AOJu0Yx4iKtUMhNImw98wyHqsb87rJOeNzgcXT3z/tB0ux20gz7kQPau
	heTVwXlS/RM0ZkcMZtJjCG4olzxpj/G9W5xmOaqr/elMV+eCeAfA9Yd2jhUTcTrSvV9d/uvy0xa
	M
X-Google-Smtp-Source: AGHT+IGU6mAGSFW9+nr8Zz4Of5e32MEbyj0iK09xyF4jXB0Jq/nDc+ruXVWHHRFTqRa79/kAZlxe0g==
X-Received: by 2002:a17:903:2310:b0:20c:e169:eb7b with SMTP id d9443c01a7336-2116c41679bmr40352615ad.14.1730900983376;
        Wed, 06 Nov 2024 05:49:43 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541e16sm1491795a91.21.2024.11.06.05.49.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:49:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 0/7] Patch review
Date: Wed,  6 Nov 2024 05:49:30 -0800
Message-Id: <cover.1730900782.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206773

Please review this set of changes for styhead and have comments back by
end of day Friday, November 8

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/390

The following changes since commit d5ba3f78f340d4627cf33eca14969d61b00f5766:

  oeqa/selftest: Update the BB_HASHSERVE_UPSTREAM (2024-10-31 13:23:59 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Khem Raj (1):
  ffmpeg: Disable asm optimizations on x86

Ola x Nilsson (1):
  glibc: Fix missing randomness in __gen_tempname

Rohini Sangam (1):
  vim: Upgrade 9.1.0698 -> 9.1.0764

Ross Burton (2):
  ffmpeg: nasm is x86 only, so only DEPEND if x86
  ffmpeg: no need for textrel INSANE_SKIP

Wang Mingyu (1):
  orc: upgrade 0.4.39 -> 0.4.40

aszh07 (1):
  ffmpeg: Add "libswresample libavcodec" to CVE_PRODUCT

 ...ndomness-in-__gen_tempname-bug-32214.patch | 29 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.40.bb         |  1 +
 .../orc/{orc_0.4.39.bb => orc_0.4.40.bb}      |  2 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_7.0.2.bb | 15 ++++------
 meta/recipes-support/vim/vim.inc              |  4 +--
 5 files changed, 38 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-Fix-missing-randomness-in-__gen_tempname-bug-32214.patch
 rename meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} (92%)

-- 
2.34.1


