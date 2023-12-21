Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A22C46CCD
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.51761.1703168711858836929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Om4ioAwI;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7810917125bso49706285a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168711; x=1703773511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfaFtoA3FJsZhwwbnQQr3XdbjLfxH20EkdAXuWuMJis=;
        b=Om4ioAwI0NBUXtHdkQ7Ca7f3mHue50epTxX5yj+T2t6uUpoleImAoe/1H9yYONByfk
         uURzTstAQLA+1ralzC/aum1XEDh0D016gZKvzYVefjv89u/y9ZXmXhaC98s3qd8A0tOb
         cvb9X3LpkGFLlxtiO/OwUWwTpCeDSleBgvF9LrEEwtKs66Z59kA+kedV+j31Vrif0h0t
         aJ+UmWNuu+T283XO5qfj0/4bswcznIQkhLbxfEmASc+MYTdiFyxUCAGq0jW7vG9qwnjZ
         gXcrtjIkuh2VSoMYAwR5xsNq18UKiqlbWrLZ7jydjdiVfVoiy4HYkrpqaYkL5fdUgJ2i
         hr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168711; x=1703773511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfaFtoA3FJsZhwwbnQQr3XdbjLfxH20EkdAXuWuMJis=;
        b=bmDQ68u3kpZ6MnX6Esx/4DQyOPiVBSICccy13mfXorDOcgoCIgoq6+E9SB+LcDPVQE
         jSOzCLMTE5VOzj91gv47iK4oGwiqGvxHpTjvtuX/Gd+rNn0lGdhD6gfeetmqKWfAR8Uf
         uhv3YUNkzrMDzq9b8n4OCsE8vpgHHkOE/nXoFvi6DdluwlAcmYxwdHB4Z90sbz4jC9Yu
         wZwaNuuAHv2Q84Y9Io71zF1s7bPAILwXoEmYf0D/0XNZeYGcIHWMcvNZpsXnsguMqD0X
         rGOkc5flcSdO5WWSBe/KJof+SLqGK2k8yWzdK1MigEHO+4aOxOYcLy2kCx9fLm9YSLAK
         dG6Q==
X-Gm-Message-State: AOJu0YwPPy8C4S9qzZz9BPVp6VtZspBmTDYHD+i4VwAq9thRTgo369KJ
	1UZiesjytxSRfwsoFb8Kc2M=
X-Google-Smtp-Source: AGHT+IHptw4OMVqYbA98gPb2/TBAUVmiIf3EGU7L9WzCIJ5K8sVdqJuxWz6kFus1JJIyNfWAB9+I0g==
X-Received: by 2002:a05:620a:3915:b0:77d:89c4:1619 with SMTP id qr21-20020a05620a391500b0077d89c41619mr25437959qkn.66.1703168710738;
        Thu, 21 Dec 2023 06:25:10 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:10 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
Date: Thu, 21 Dec 2023 09:25:02 -0500
Message-Id: <cover.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192829

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the -stable and config changes that i've been collecting for
a bit.

As discussed on the list/IRC/technical calls, I'll drop 6.5 and
introduce 6.6 and the matching libc-headers in early January.

I've been testing with 6.6 for some time, and haven't found any
issues, but I just won't be around enough for the next week and
we can all use the time off.

If anyone does want the 6.6 changes, I can make them available
in a contrib branch.

Cheers,

Bruce

The following changes since commit b92406d2313234dccd77b05fe74c09ba9617a738:

  curl: Disable two intermittently failing tests (2023-12-21 13:49:48 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.1: drop removed IMA option
  linux-yocto/6.5: drop removed IMA option
  linux-yocto-rt/6.1: update to -rt18
  linux-yocto/6.1: update to v6.1.66
  linux-yocto/6.1: update to v6.1.67
  linux-yocto/6.5: fix AB-INT: QEMU kernel panic: No irq handler for
    vector
  linux-yocto/6.1: update to v6.1.68

 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-rt_6.5.bb               |  4 +--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  4 +--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 24 ++++++++--------
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.39.2


