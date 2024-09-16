Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49F5C3ABC0
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 02:19:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.128379.1726453184052469116
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 19:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TFilKeJP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-205659dc63aso38172585ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 19:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726453183; x=1727057983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=os1zTO+z2sydbFgi26Z9YGj16YRkoVQnmHzBkW/+gLQ=;
        b=TFilKeJPwI7m+VpUQhRgMT1ev2CyyFMUzd2JdyUQ1yC5iHZ0aF4ZyePv4FOUeptfwL
         14/8x9a3LeOFizkG8OwUeP1RhAW4cRZMQa2b56BD1GkrvGk0GfMnPYVZxXgSeqpfFbq4
         JSFeer41XLHyUppYTBlzlx8I1YtGEe/Pdpg7eFyVZKkb5IPjlYGY1ok3zRDGTedMmcVH
         0YrdYqF37su33xv2hK6tyOo1u4hvnyokt0Kdhv4FdE8yW6FneNJzOkIixKS4jPuYIkSS
         0sjoCU+VcnftkqzohVdJfYmg0Ould8t79HlrdDk4Onzv3bxDk+iwjUXuTlhyhmY3x3gu
         sCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726453183; x=1727057983;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=os1zTO+z2sydbFgi26Z9YGj16YRkoVQnmHzBkW/+gLQ=;
        b=p6xCOrMjTWpJNfF4hDNVv7Km5o+Py/iZ/QHtd1YUTZH6qwzp6huDnxsG9FjTBzasWN
         3GoWXaVwIM3KwRS47zsw4/+HV20R7Xnk/NjM5/kBfZPf68uqhf3Rr3gh2NaQksVL9Gmb
         rPpUIKsF5s0g01YfzRPLoinp1Dsnk+HRgtMueYFoxX0MTcP47GHEMbPNpa/Lta5nU0u7
         mIQNdFidEDP7uVP/pjeFtqt3nVrxVw+OygOl9mVpzyEOhYC1POv4IeEzcXwr7vHSly/B
         UZRqvtODqvtkr6YYvzTppmckB5sfA+ZSJBCcYDESUMIsqLZtHdRVIlj29XFSHgl6PGmB
         Bhlg==
X-Gm-Message-State: AOJu0Yz64TkhYzbxkYo/sv0wq+CGRCmn10UteCjTnl47qemH6kSLz0DR
	iPAVuWS5IaghUo+DUnhY0ehwWxlvk3iNgy4FzIeWUZ9P8cjLOku7+LWN3NapXLPpCoCBfn5keqL
	7a5c=
X-Google-Smtp-Source: AGHT+IETxo7VJMXSQ6OwuBI8cTfddvtdnagR3ceoOIfJlCNeEH3L3+L2Y/MFBBZMDRbWiqHxdrZ8bA==
X-Received: by 2002:a17:903:32c4:b0:205:79b4:c5b1 with SMTP id d9443c01a7336-2076e39c012mr213157695ad.16.1726453183035;
        Sun, 15 Sep 2024 19:19:43 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20794764144sm27698175ad.304.2024.09.15.19.19.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 19:19:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Sun, 15 Sep 2024 19:19:25 -0700
Message-Id: <cover.1726453060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Sep 2024 02:19:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204589

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, September 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7330

The following changes since commit 7e11701698a9f38a5e3e0499c0c2edd98d32a85d:

  mc: fix source URL (2024-09-03 06:59:38 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Michael Halstead (1):
  yocto-uninative: Update to 4.6 for glibc 2.40

Niko Mauno (7):
  iw: Fix LICENSE
  dejagnu: Fix LICENSE
  unzip: Fix LICENSE
  zip: Fix LICENSE
  tiff: Fix LICENSE
  gcr: Fix LICENSE
  python3-maturin: Fix cross compilation issue for armv7l, mips64, ppc

Richard Purdie (2):
  expat: 2.6.2 -> 2.6.3
  ruby: Make docs generation deterministic

Siddharth Doshi (1):
  vim: Upgrade 9.1.0682 -> 9.1.0698

 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/recipes-connectivity/iw/iw_6.7.bb        |   2 +-
 .../expat/{expat_2.6.2.bb => expat_2.6.3.bb}  |   2 +-
 .../recipes-devtools/dejagnu/dejagnu_1.6.3.bb |   2 +-
 ...n-architecture-name-resolvation-code.patch | 107 ++++++++++++++++++
 ...ation-issue-with-linux-armv7l-archit.patch |  76 +++++++++++++
 ...n-ABI-name-resolvation-code-as-helpe.patch |  98 ++++++++++++++++
 ...ation-issue-with-linux-ppc-architect.patch |  68 +++++++++++
 ...ation-issue-with-linux-mips64-archit.patch |  82 ++++++++++++++
 .../python/python3-maturin_1.4.0.bb           |   7 ++
 meta/recipes-devtools/ruby/ruby_3.2.2.bb      |   1 +
 meta/recipes-extended/unzip/unzip_6.0.bb      |   2 +-
 meta/recipes-extended/zip/zip_3.0.bb          |   2 +-
 meta/recipes-gnome/gcr/gcr_4.2.1.bb           |   2 +-
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 16 files changed, 453 insertions(+), 14 deletions(-)
 rename meta/recipes-core/expat/{expat_2.6.2.bb => expat_2.6.3.bb} (92%)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-architecture-name-resolvation-code.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch

-- 
2.34.1


