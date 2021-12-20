Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FE0C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:12:23 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.6495.1640013142426479356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GWxonSEE;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id p19so9971940qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EEMyrBlWRsi/E0M2MAd7gR/lNcAPoweVRsAT4aJwsuE=;
        b=GWxonSEEmZqBPEZiG7JGRx4VRwP+H5vrbK7NvDwGKWvoBY9someu7F2fscarifslq6
         DiuYIOTj3kbg/lrojzgcV1DsFFSBt/CSGhanYczGqnajpBfjmfEkRunPz6hxfFYW96D3
         Gg9p5KZx9ymSuZaTkhMqdljBOOukku1jn+G2HPjulOOQRKFS6ujy7VuET4+qSy4O90fe
         osDqYwSJHYC2OYPwku+9bkcCoqgXWKKomWbGeNRK6XPglUNyUGhF+UAzOl6R+nIpgXQS
         5x/seHxRr2OUcnBcH7kNJ14Aw3tz6qkXz0ObnxqzPXw/Ag5ZLFiRrnTCYga3glMo3qIc
         jg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EEMyrBlWRsi/E0M2MAd7gR/lNcAPoweVRsAT4aJwsuE=;
        b=Ucxk+p/CWPnNNtHJjBkwNloQlxifwVlcxced090b/Y2mF7i99/ppv7u52I1fKMtLf9
         2yuWpgz1/vfHaqz2MO6HgLLJRIULCua1Wt5TN/mga5xEOefavF7ZHqrrBRy/jPNlkvwv
         KuUvqjSu8lBLXhx1HVb+Csj9BVw361UO714hw6eR/yKtl0K0ldGHjnPDWmQTIGsk4v58
         7V0xIwlq0GcTvPopuSj/Ke9FGo/vrT9SY2SOcTaj29PfwFXWbSDEbpHBUFCuIruNU/3i
         x3fQj73/R3VL0tSYiL0/IJAZ0hzAY+rfEkicd1krgikpXcASwQCEnLc7Gqbp5WZZL+YK
         B0QQ==
X-Gm-Message-State: AOAM530rAobqSd/3rw4WXxp3SujEWEoC9Hjcw+GMIG5pt6DzB0eCmtWx
	rn5slHZNT+OCuFcy2Q8aF7o=
X-Google-Smtp-Source: 
 ABdhPJzDmwPHMJF3q4qiIWMqOui3nkQ9aueaNoK7JIyrEGb/L47MmVmiPIFNxZBk9H9hvPQuHAd+lQ==
X-Received: by 2002:a05:622a:190f:: with SMTP id
 w15mr12700458qtc.124.1640013141397;
        Mon, 20 Dec 2021 07:12:21 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w10sm15378146qtk.90.2021.12.20.07.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:12:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] [dunfell]: kernel: -stable updates
Date: Mon, 20 Dec 2021 10:12:14 -0500
Message-Id: <cover.1640012653.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:12:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159875

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Steve,

I thought I had sent some of these before, but I didn't notice them
in any of the recent dunfell updates.

Here are the tested -stable updates that I've done (hence they aren't
squashed, since each set of SRCREVs are a useful test/debug point).

Cheers,

Bruce


The following changes since commit 795339092f87672e4f68e4d3bc4cfd0e252d1831:

  build-appliance-image: Update to dunfell head revision (2021-12-14 22:49:36 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel-dunfell
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-dunfell

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.159
  linux-yocto/5.4: update to v5.4.162
  linux-yocto/5.4: update to v5.4.163
  linux-yocto/5.4: update to v5.4.165
  linux-yocto/5.4: update to v5.4.167

 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.19.1


