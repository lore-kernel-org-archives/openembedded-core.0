Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.12002.1608647309507000601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KCmzntx/;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id c14so9041848qtn.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o21X2cKtVBVRdmOV+4KKHu6F239dZ204sl8g9PIc04g=;
        b=KCmzntx/VsbDty3eJtcwQdrFQDSBRhs+oMSJwEwX/GMuLKIyF/JBT5G0mZ4ZiDriIw
         vO0qq5lah5v5zhC2GybZXQmb/P3gjrl4tDuI9V7byrtuMqH5EH990SQreG6pufRz/uL1
         cwamiRA4zA6NCkjpKjlkaArtBebhBndNy5YQWQNHTdxZIpoCYhtQn1yzSo7ZbKzJkRpu
         RsXKZ9XZb4cq1E1tMNtslpKLD6PIuZ58xQaZJ27cI1vJDGMkqDsZ92INs30ESQze4rL4
         ZoGZdq0jRUV/h/GgJhxDYp5bEgNTDubiDBRFozyfDtqO6uB0N09BQ63diVru/uTAF1iB
         ZQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o21X2cKtVBVRdmOV+4KKHu6F239dZ204sl8g9PIc04g=;
        b=JMcrx6jjovijtgLYzqTfoEuZ35+QSQzo0cy2b9ZxIXHIMNR8CgIDZKtmI8vpIe/Nls
         CwkvV2sm68IoxXoYjvTAKucVdtUgpxh7Ostg5RRI69KlWhDEso3VGetngduBrpmWgav2
         WyoSyfP9pRrqXrun//hBr/ATIcX59bSz2uzjj8xWJ/0I4MknbWqnFx0MaXVmON4m0o8N
         oBOSAlP3K155M0wF1qVFN3kIx6N0cLVDWcFE55m3thjNvBMn08v5nNlfnvduE/aUMY3c
         KH+dqK2JxEssXNzlgA8hvUZ9yX6wGuHhUKcRW/YStOPTJV8r7lWj2EtqXl0hUUAREGb6
         3NdQ==
X-Gm-Message-State: AOAM531azNnwOKdiK2yEryGrrHNXUrx0dwZ5kAriWtYz9VDnTwp8LI6M
	8U7ryM0Yp6zEvQiVIpvNIrQ=
X-Google-Smtp-Source: ABdhPJwDwcQ4y8oTmbVrm21ImsYfHr8ex7Qh8DOmKE0S36Dy7VtSf3aOggOzuiKjVIGAIqE0LStpXA==
X-Received: by 2002:ac8:7510:: with SMTP id u16mr21519863qtq.139.1608647308518;
        Tue, 22 Dec 2020 06:28:28 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:27 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel: consolidated pull request
Date: Tue, 22 Dec 2020 09:28:17 -0500
Message-Id: <cover.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is largely a resend of the configuration changes and kernel version
bump that I had previously sent.

The kern-tools SRCREV bump has a tweak in the tools from the previous
version, and there are specific fixups for the warnings that the tools were
now exposing. I had to balance tiny and standard needing different values
for some common options!

The AB run that I did is here: https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1270

Everything looks good to me (but I only just realized that there are now
multiple pages to check) :).

I've also included the systemtap uprev that was sitting on the list, since
I ran into issues with v5.10 and systemtap, and the bump was most of the fix.
I left the original uprev and my fixup separate, so credit for the work would
be preserved. My fixup can probably be dropped in the future, but I'd prefer
to keep systemtap building, giving that 5.10 is just about ready.

Cheers,

Bruce

The following changes since commit 9aae620b9515e925db4a043a96fda2a6b6b0b5bd:

  gcsections: add more suppressions for SDK builds (2020-12-20 00:03:34 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  kern-tools: non-gcc config support and option re-classification
  linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
  linux-yocto/5.4: update to v5.4.82
  linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
  linux-yocto/5.4: update to v5.4.83
  linux-yocto/5.8/cfg: fix -tiny warnings
  linux-yocto/5.4/cfg: fix -tiny warnings
  systemtap: fix on target build for 4.4 and 5.10+

zangrc (1):
  systemtap: upgrade 4.3 -> 4.4

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +--
 .../linux/linux-yocto-rt_5.8.bb               |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++--
 .../linux/linux-yocto-tiny_5.8.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++-----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  2 +-
 ...t-include-and-callsite-with-same-con.patch | 44 +++++++++++++++++++
 .../systemtap/systemtap_git.inc               |  5 ++-
 9 files changed, 69 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-transport-protect-include-and-callsite-with-same-con.patch

-- 
2.19.1

