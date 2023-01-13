Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2DEC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 14:41:06 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.88244.1673620860074008162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 06:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JsVyIXbg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d15so23629219pls.6
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 06:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxENJgdWB197WUrDEM9NUryGOreGqAc2Vp28/jtbtSw=;
        b=JsVyIXbgDqfnF2U1/TYshs+wsASxNi47i1sMW1Sh69E9JZ52Us7ENw2OCSKKs3rdI6
         8sSvPSfKRRo7wMluduM/RRZw+lVkbes7YmPTsrjBclkZNTYdUfuG7vt1aEj+plwmY/O4
         +2PPGiIdX5jF55BocFBMUPelFs3oxAXglZQasTglge6gw/B28ftjoq8ggodld7Mx7RB0
         sBm+bOa550+oMSX7XSNXGonXLiYPbxUPeMF/hU4bG1cl295NazN0zvsNXNAmWg0a3hNl
         ifb+yvPtJcZx42nTxIh3paHK++rv/tyf5y9WiNTrtuX7kOnIcEeq1O/VcGrSvxItU7D9
         bOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxENJgdWB197WUrDEM9NUryGOreGqAc2Vp28/jtbtSw=;
        b=oejRrbgk+J9mV7INFh4r+cF6exzeYmItpy/CqndY7vGe34wgB8Sm9ytW7/ws5Pwu84
         fspHweSGRc5TfZXgHI+nGcW7mwOTgMFo6TvAbUEvXEmo5yRuWF+2j5yCyEXk2vhVBwgN
         LhNfja5yalJSefCu7gOzBnLnEykNnJAks85p1LRnwhE++K9HiixvVDIqkg55oWhJWPZO
         QvwABzevpO+tuR6R22l//d1BJZcZH1ZwF/RRMmKeHjFPc1ANdqTslK69YtEvJRpN+eGx
         W7r0k0juqKQnsmJO3zLt8zMe3Z/AbacXRQb+08bNFxLtfu4w7IKbYHDn2zGvqPz4f+M+
         RTqg==
X-Gm-Message-State: AFqh2koVkCJrUznqqg8tfOQ0R8H5lYWs0Gy1satUEkQzZpRM8OoPd+6C
	OHfghWr5JZGL+pVoIImQvSvsryGwVDIE7OUBJnk=
X-Google-Smtp-Source: AMrXdXvt1jMc49J4ESYg62fr8tqbevnF15T2F1BlrbNbWfZtmZnVfD6nUU3D5MAVYuPJh2uFtGHygQ==
X-Received: by 2002:a17:902:b710:b0:192:6429:440e with SMTP id d16-20020a170902b71000b001926429440emr69834172pls.34.1673620858705;
        Fri, 13 Jan 2023 06:40:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090322d100b00186f0f59c85sm14244346plg.235.2023.01.13.06.40.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:40:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Pull request (cover letter only)
Date: Fri, 13 Jan 2023 04:40:53 -1000
Message-Id: <cover.1673620619.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 14:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175827

This is the final pull request for the 3.1.22 release build on Monday.

The following changes since commit deb919a693e4371ace649680ca06ca6b6e3da4e2:

  lib/buildstats: fix parsing of trees with reduced_proc_pressure directories (2023-01-06 17:34:50 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Changqing Li (1):
  base.bbclass: Fix way to check ccache path

Chee Yang Lee (1):
  libksba: fix CVE-2022-47629

Hitendra Prajapati (1):
  grub2: Fix CVE-2022-2601 & CVE-2022-3775

Luis (1):
  rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively

Pavel Zhukov (1):
  oeqa/rpm.py: Increase timeout and add debug output

Steve Sakoman (3):
  ovmf: fix gcc12 warning in GenFfs
  ovmf: fix gcc12 warning in LzmaEnc
  ovmf: fix gcc12 warning for device path handling

 meta/classes/base.bbclass                     |   2 +-
 meta/classes/rm_work.bbclass                  |  15 ++-
 meta/lib/oeqa/runtime/cases/rpm.py            |  23 ++--
 .../grub/files/CVE-2022-2601.patch            |  87 +++++++++++++
 .../grub/files/CVE-2022-3775.patch            |  97 +++++++++++++++
 ...erflow-in-grub_font_get_glyph_intern.patch | 117 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 ...1-Basetools-genffs-fix-gcc12-warning.patch |  49 ++++++++
 ...-Basetools-lzmaenc-fix-gcc12-warning.patch |  53 ++++++++
 ...001-Basetools-turn-off-gcc12-warning.patch |  41 ++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 .../libksba/libksba/CVE-2022-47629.patch      |  69 +++++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |   4 +-
 13 files changed, 545 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
 create mode 100644 meta/recipes-bsp/grub/files/font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-genffs-fix-gcc12-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-lzmaenc-fix-gcc12-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-turn-off-gcc12-warning.patch
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-47629.patch

-- 
2.25.1


