Return-Path: <anis.bougrine10@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D445C5DF94
	for <webhook@archiver.kernel.org>; Sat, 22 Aug 2026 00:27:40 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2141.1787358459112044718
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 17:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DUntlKJ/;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: anis.bougrine10@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so1266328f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 17:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787358457; x=1787963257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHqIwyL1HgLMvfA+tEfEZmi4ReOa9mGDLdEPAriiS+c=;
        b=DUntlKJ/kJaRaZtPwEzJ4j0/qphq7Dc9jd18rQjk9d9LCOP4cSc/JZqmgard/ryPE6
         7mhrOp3klzfDnlmQGz74A00xOpZZFzIX97fd6mhPdZE8k6M/2+iTWcDOWUoiqmjHsXI5
         HcLJnCnrJ5aT2iKIq+VjTFnG0DTdXWTPI0BfGYpl1k0fmfCB7ahQlARf8X9+kQcweDNQ
         B6pyCYe30Z2TCsarWyMdi5CSqrbBsKIkmOJTogH5pKOqmSC5QJ3e4Xlpf3AgUEb4L0x1
         DS7Hqe9/DU3B24rydfNkUIM05sNRJUtffCXMLcE78wYYYFOUdnPEX2xrV9HLvsWqZZRe
         242Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787358457; x=1787963257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHqIwyL1HgLMvfA+tEfEZmi4ReOa9mGDLdEPAriiS+c=;
        b=QWo6MvKZr8Vny0YTyg1L75ywebN9A8jFFq5Vg95f2IsEzu2wj3wl72Nd69N3qoN0kx
         kuwrdh9916LnM32OUt0yrIJYEfi0vnu+6u/FvsyY00YehVQ3xxX9cGhWaEHCHyRChvkX
         KAOhysaDUpCe41OEFm8k6H4Jiwy+rrYikpOB7BXht6YPVAS5+qetjzcduiIjYd/Wq7O6
         OpCYXs0XRg3W1owHjg/4rS0ucUmsI3bU+RWIckUX4iT8OoF85ipMvx5EHItGBJsr22H/
         xQi47ncW3AvSz7eBK2JvOaFgYFzUM/2RXogEJeYZrSWDXkBS9ACw8NA6Z7DmSzgCyuzJ
         +amQ==
X-Gm-Message-State: AFuF++nRBJvZdqlObZ7qC7jRkN6jmJUf9LMigK7AnNb/F+NoVvmDbBgS
	2qFE1Bx3lHyP6m9QF5dGlt/YAIPumGlfyiSUlp5/pzKOdDv4R2B5E6Izm+NfBdPIgiE=
X-Gm-Gg: AR+sD12qUPeqrAXGwZMxM8ytxs/yMoqfs3m+Z5S6FAdRv56H2ULt/8Mhdt/FmRjhWgD
	EWPbQXSWV7RnLMxUvjY8IlTOecgnSetA+bIsWSggQp5FsvFz7RWNH4XGzcw0YZwOaboRiAoOyoJ
	sKMeYPbi3Uur6OWvtVKnS6TjjGWUDwbZPu89iDNdZDtfsrrWsDbpnMMWRG398Bpjj+vN7UQboOe
	tWJnsFTBBknB8jRb/+JTvPQw2BOGO/nXF+vCfu2G9ZkOLFviS/VMD4Ag+xCgZSuro5d161RgzOv
	jt2zMFfX33DHFeMRpgAml6fxqw2v35Tl/MfORH6geanl9uVM/GKvm4M9E7dsvvTxZ3z846T7Gd9
	WoQ6eGA43zSAYjj51n3vCG7fMe/ws5nbFlmXLpPYcUqX+H6fOqMSABVCUoqQkSpbGZbwy5uTjC8
	DYMf6QLWjSMgA6tmTjTbSrBPBQJzi3sfH/sVgci05b9Fty945tfRr+MikGtq58JWwdNxyjAGwiH
	6XdHpEt6rvK9OQaM3kOj7FkAvB3j9uCuAYLVhCPTTFO++zE4dfPDPI5qm0hoIvsKP7EdjmbkdCF
	41srIfQaOfWV
X-Received: by 2002:a05:600c:3f0b:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-499c1997daamr23344685e9.2.1787358456940;
        Fri, 21 Aug 2026 17:27:36 -0700 (PDT)
Received: from device-137.home ([2a01:cb15:80cf:2100:7910:2866:fbeb:d177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b914bfcbsm44728335e9.9.2026.08.21.17.27.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Aug 2026 17:27:36 -0700 (PDT)
From: Anis Bougrine <anis.bougrine10@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com,
	bruce.ashfield@gmail.com,
	jose.quaresma@oss.qualcomm.com,
	richard.purdie@linuxfoundation.org,
	Anis Bougrine <anis.bougrine10@gmail.com>
Subject: [OE-core][PATCH v4 0/4] Make signed kernel modules stripped
Date: Sat, 22 Aug 2026 02:25:57 +0200
Message-ID: <20260822002601.90667-1-anis.bougrine10@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Aug 2026 00:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243959

- Re-sign modules after the package stripping process.
- Remove the package-stripping skip for signed modules from package.py.
- Add MOD_INSTALL_PREFIX variable

Note that this v4 patch drops v3 patch and its relative which have been merged to master-next:
3e34657 kernel.bbclass: add strip process for signed kernel modules
ffc6d51 package: extract debug sources from signed kernel modules

Anis Bougrine (4):
  kernel.bbclass: re-sign kernel modules after package stripping process
  package.py: remove stripping and splitting skip for signed kernel
    modules
  kernel: centralize kernel module installation path in one variable
  documentation.conf: add documentation for MOD_INSTALL_PREFIX variable

 .../kernel-module-split.bbclass               | 23 ++++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 13 +++++-----
 meta/conf/documentation.conf                  |  1 +
 meta/lib/oe/package.py                        | 26 +++----------------
 4 files changed, 34 insertions(+), 29 deletions(-)

-- 
2.50.1 (Apple Git-155)


