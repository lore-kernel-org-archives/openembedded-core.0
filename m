Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2839AC25B08
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:30:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.26300.1659969057313584275
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=lV5rbs7h;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 e8-20020a17090a280800b001f2fef7886eso9243448pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XkWQ90muJTnb2lcisvImGoK/yjtNNIl3m1ZhxXf0nX0=;
        b=lV5rbs7hWk7n0ebeF7/FJ6l9CzmNThTzzqVhQM+9nxfyW0Kt+6Bk/PWmWvELhWq0po
         aSY8FTZQR43HW/lQR2DJ20AcQbXD2p9TlITQhL61kjqid8NOVo4X5m1ClcS3ylapTEaJ
         xSXGQTP6VzL0ScQUvouryfsDaXEbxQKMermG6FqGdR4t63pkc+ziSTAjGKwOFNDvFcrd
         hCZ9MgeecUBbtfSCKwGjeyxfMQ4fEWt7XdCLj61GAKyHp66ZjKVHz3oYK8cBqOx52FfI
         q9Na+bNJp62WZi/9cxlHkeZz4K9iC31L7+53ITjToXW8sSKsjBt2afdLUkFjWZanxBOA
         Q22Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XkWQ90muJTnb2lcisvImGoK/yjtNNIl3m1ZhxXf0nX0=;
        b=5bvOZn3V2Ap/c9c1wCF4R8Jpeq/mspH7fEsAxWJWj1myCvp2+qtANLAgS+xQXwMzIY
         tnlz6xgOJmd3CzQojaWUcZKkSgIT5d7o+wC9rt4VZoTdlbFLiQEaIx9WhT1+wgl7uJlm
         QTg0JCma9tMlDG9ELCmziF5Eo+uOVIwN1VBy+1TQqKVZKlEQzkbCVmuBWtNXpcbLNv25
         BEd7DCmbIyt2XffM+EG+MYtCmsdk3krTkMTXFHXttPDNZqYJW2Pbh3ZKW+X7R0dI4SHs
         SkCq3C0Br+T9dKX0WaI34xRuCu56Em7zfGyLvCXyLXYsDenhjefJLo1MQmbucCy+azrR
         GyWw==
X-Gm-Message-State: ACgBeo1uc8Bf7epFst+tG8I9L5N9PCcWESTYIOOR/i/Zh2ajL1Z5jbfJ
	owTIQTez8M+frhFpLDwyDDePBF67qZeWoASI
X-Google-Smtp-Source: 
 AA6agR6VjLH+vpKckcq/yHv7K2ou/pozIGvuZqEz0oBKSXEkavQGfLtZ+Ol69T8lgTnI7qYVR8VZug==
X-Received: by 2002:a17:902:e846:b0:170:84c5:ae21 with SMTP id
 t6-20020a170902e84600b0017084c5ae21mr12723884plg.19.1659969055835;
        Mon, 08 Aug 2022 07:30:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h22-20020a63df56000000b0041cbcc1c222sm6383115pgj.41.2022.08.08.07.30.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:30:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Pull request (cover letter only)
Date: Mon,  8 Aug 2022 04:30:43 -1000
Message-Id: <cover.1659968971.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 14:30:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169089

The following changes since commit 3564ce3d9b2030dd420362c66147bd327090915c:

  initscripts: run umountnfs as a KILL script (2022-07-28 05:32:25 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alex Kiernan (1):
  openssh: Add openssh-sftp-server to openssh RDEPENDS

Dmitry Baryshkov (1):
  linux-firwmare: restore WHENCE_CHKSUM variable

Khem Raj (1):
  libgcc: Fix standalone target builds with usrmerge distro feature

Martin Jansa (1):
  kernel.bbclass: pass LD also in savedefconfig

Mingli Yu (1):
  strace: set COMPATIBLE_HOST for riscv32

Shruthi Ravichandran (1):
  package_manager/ipk: do not pipe stderr to stdout

Sundeep KOKKONDA (1):
  binutils: stable 2.38 branch updates

 meta/classes/kernel.bbclass                   |  2 +-
 meta/lib/oe/package_manager/ipk/__init__.py   | 23 +++++++++++--------
 .../openssh/openssh_8.9p1.bb                  |  2 +-
 .../binutils/binutils-2.38.inc                |  2 +-
 meta/recipes-devtools/gcc/libgcc-common.inc   |  8 +++++--
 meta/recipes-devtools/strace/strace_5.16.bb   |  3 +++
 .../linux-firmware/linux-firmware_20220708.bb |  5 +++-
 7 files changed, 29 insertions(+), 16 deletions(-)

-- 
2.25.1


