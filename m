Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ECCC433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 21:49:17 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.11253.1647035356143996839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 13:49:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=bnW6MmJ/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id t5so8982183pfg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 13:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z2zBYQfMHEbFH4eSUWANh0gG5gbzZkGC+zz4R3pFKm8=;
        b=bnW6MmJ/jBQHSQKWmcxbJdn0pT+W08rPB/bkgIRw6iZj94Gs12L6DiSGy8VqasqT/0
         eN6MaLgrWVTQwalZlrev0yjzCZtL3YyRh+CNeAXl002F3wtsUxkAwJ+Xjtwv+Y59aPsN
         hfk3FoBaqCF7WYvhpMxkT6oLiQQ+nen69uXdHQ2wWvqerXVEMmfwL8UXu7GSY+ALJh2J
         2iP0rSuwjggz4gdtIROpfpVd5n7zstEE+kl+GpDv++FI9jhqLMaKG/XK8j3iXYItg7Ob
         1QgP+3qoj18XGF82ozG7rxHomrdsB38kM9VAPyxpED0EDBrLQId3PKxiO/r2NMHse5ZG
         qSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z2zBYQfMHEbFH4eSUWANh0gG5gbzZkGC+zz4R3pFKm8=;
        b=TVo7F41RAQ/DUuvN+qBA7bOjwAzc68OuVKGrxC6wVN5WdT1J5fHvK/U4LzMeYz8MO9
         ZoqAiEq4xThp/IqACbGmYOqrONdDvJhFuTZAN5jdUACO95myz3yKMfjfX6amlF2fZKWp
         jU+u8AOK/ZRwyv5buC7kQXhwDnK2j/HVNgparzV0dFMfntkn7UgGZtWZzpIJiOEaFTx+
         1OuszKQRRBf0/krXxinHUj/XCKezdfopApbZr5I7ZDan612g5WHzTPBzXg4ATr3W212C
         lmhFKn2BNt8o0q4+iFwSpPRwqhmIsezDRAseYK9CifXEhkH6tpt9r4mQgh6uzWpdWG8l
         KAbw==
X-Gm-Message-State: AOAM53085Y/joJvHGRn0PZaNlk+44ZqZsW/KP0RRCfZlC4NWMQ992eZj
	G0/5TCdG+xP/42nzPcna3HIrYHKjLZn/0XZ+83Y=
X-Google-Smtp-Source: 
 ABdhPJz5rPF29iGK7DU1VHSkVrKlQR8NWLD4LpqHYUFKK0K1PHxpO/vrrj/gysaH+uW79btQ4Fdhag==
X-Received: by 2002:a05:6a00:174b:b0:4f7:8e44:6fdb with SMTP id
 j11-20020a056a00174b00b004f78e446fdbmr4505654pfc.64.1647035354975;
        Fri, 11 Mar 2022 13:49:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a056a00168c00b004e15818cda3sm12614134pfc.114.2022.03.11.13.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 13:49:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Fri, 11 Mar 2022 11:49:06 -1000
Message-Id: <cover.1647035249.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 21:49:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163078

Final pull for 3.1.15 release

The following changes since commit 51844f2d60d77fb8cb46ffe460402f76ae216ca5:

  uninative: Upgrade to 3.5 (2022-03-03 07:43:07 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (1):
  perf-tests: add bash into RDEPENDS (v5.12-rc5+)

Jose Quaresma (1):
  sstate: inside the threadedpool don't write to the shared localdata

Ralph Siemsen (1):
  bind: update to 9.11.36

Richard Purdie (2):
  systemd: Ensure uid/gid ranges are set deterministically
  vim: Update to 8.2.4524 for further CVE fixes

Ross Burton (1):
  asciidoc: update git repository

sana kazi (1):
  tiff: Add backports for two CVEs from upstream

 meta/classes/sstate.bbclass                   |  2 +-
 .../bind/{bind_9.11.35.bb => bind_9.11.36.bb} |  2 +-
 meta/recipes-core/systemd/systemd_244.5.bb    |  2 ++
 .../asciidoc/asciidoc_8.6.9.bb                |  2 +-
 meta/recipes-kernel/perf/perf.bb              |  2 +-
 ...99c99f987dc32ae110370cfdd7df7975586b.patch | 28 +++++++++++++++++
 ...0712f4c3a5b449f70c57988260a667ddbdef.patch | 30 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  2 ++
 meta/recipes-support/vim/vim.inc              |  4 +--
 9 files changed, 68 insertions(+), 6 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.11.35.bb => bind_9.11.36.bb} (98%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/561599c99f987dc32ae110370cfdd7df7975586b.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/eecb0712f4c3a5b449f70c57988260a667ddbdef.patch

-- 
2.25.1


