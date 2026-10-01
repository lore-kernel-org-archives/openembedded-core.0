Return-Path: <workjagadeesh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28417CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 17:42:34 +0000 (UTC)
Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17176.1790876546363184911
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 10:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SJ2iWLWH;
 spf=pass (domain: gmail.com, ip: 74.125.227.141, mailfrom: workjagadeesh@gmail.com)
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so41993285ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876546; x=1791481346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JYwfzeckjtERKGnD4UVR1S3VZntBXmyYhc/FnEEUWkM=;
        b=SJ2iWLWH7b7ZR5Jekpj6zTMPugzLiKuccIpMkM2LLt82WJuDgXUqi/sVsnVhUh6vsK
         MDSG+5XB+WNRoavvcIaKwNm3OgPDdH3xAji7YT4rJqUK4bGg2EOQPHoc3NHFUhudh4gq
         xYIhxCa95kELhRQKgtvvsE1mEkHMYjk1pyA+74cwFS2Qre0HpGMMo+n5JEOWa7+wRFnR
         UD6SSTsoOriqsbVbF/iAtIPzkRPr1gkScuQDJTTrUeNnBZY6ifRb4sE+xw6neN6itydN
         pmDJFNpaBNDfoRPjvlr4O8pysIf5dk9IZccIJ5nyurbcvj7rpfXuNwK8M39oOBH4Snqr
         4jPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876546; x=1791481346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYwfzeckjtERKGnD4UVR1S3VZntBXmyYhc/FnEEUWkM=;
        b=OOxZE9m+CtkwyalaUttVrLL+kjFUR5SD/H5CYXv67PmrtRvhXIV7ZvaUFs5AYztaBN
         QaEARRYtVHpKlvFdCAtCxY5/n1hn79KqIQPMdebv7qeocILJ0KP4XAwd6bEdfXDTZBnt
         4Y3Nclpsaq8lw95bPckNLn+VCM1jZPNsCpWpwTByzVXCKSFn0+vw3fXepz8EIDPbQqEP
         LrZawPWSxHqTG1rjLYE/9+6Q7dg8O649cmFISWQZm5VLNcAmpkZV8/zNEhRgM2q+MPS7
         2gilm+9CJiuUmrL0XoktLhsnPsSaXL/1c+EQCMOupmYme+gbFS6dRmJ3qhWwK9+SLalW
         Hgyw==
X-Gm-Message-State: AFq9FYIpxiXCW0IKko3BQp/bO+vRyGHWvAscJhWsNgsgrKk9zwdAiTRs
	2Mq0WKGtkKOe0TrYyfTokct88QCv7/HX+L/PcDFXhBM4Wf48u64/F6fkNSAkZPs2mME=
X-Gm-Gg: AYBFou0lZMgKhjNSfhtHfVAnqvSmmzcoUD1M8FzgL62vZcLheHsb9xHLeDRJfoReban
	O7fJbtKe7ZxIG+VgTA13ql+9kaqTDQRFEHY0nftP4wzqgY3WzNovZ6C2XHaGiZxzaHtHrN88Gxx
	i6QQyTKD+KQl90ldU5gWqRrm7sq9mZ2xQc9/fFGiZpLKdPM6xmSYFYuFifnfHWCPYR6Af8nar1K
	+cFFJwX/+sy8XXRVhjpnAlHAw6ZFwu72AdCeZJsi244zl9LtDI8dV7SxdThEDeqvT+yHJPNZ0X2
	8BlBXTZ/V0cspketYZhB3SjFBacFHJnb/WRiYCXZaee5InLIxA8/ezovce5jt4Iz9qKIt9M1pxo
	YWRqkCQuClCF/8I4jZvlYgwwJxn21mbyBGTShO0zhpJpkQB9Nm14SvDr6bRLKoW0111+fNC7dWu
	PcHzA1KMTGOJbz7xvcsgFiCYX5F2sJlooDMjMmDwmIyruV5QGO7e2W46gkvqdJaDWQiGeQODhqv
	7RjwJzshM7xI4g=
X-Received: by 2002:a17:903:3d0f:b0:2dd:c053:9c6b with SMTP id d9443c01a7336-2e49b6ad4f4mr1314285ad.33.1790876545249;
        Thu, 01 Oct 2026 10:42:25 -0700 (PDT)
Received: from cfarm422.jing.rocks (cfarm422.jing.rocks. [2600:3c18:e002:2e11::c422])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49bd4d40esm187715ad.17.2026.10.01.10.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:42:24 -0700 (PDT)
From: Jagadeesh K <workjagadeesh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jagadeesh K <workjagadeesh@gmail.com>
Subject: [OE-core][PATCH 0/2] Add support to compile source for multilib in the eSDK
Date: Thu,  1 Oct 2026 17:42:18 +0000
Message-Id: <20261001174220.3492439-1-workjagadeesh@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 17:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247048

* Install multilib toolchain in the eSDK if multilib configuration is
enabled during the eSDK build.
* Search multilib manifest files to populate multilib packages such as
lib32-gcc-runtime during the eSDK installation.

Jagadeesh K (2):
  meta-extsdk-toolchain: Install multilib toolchain files in the eSDK if
    multilib is enabled
  staging: parse multilib sstate manifest files to install multilib
    packages in the eSDK

 meta/classes-global/staging.bbclass             |  6 ++++++
 meta/recipes-core/meta/meta-extsdk-toolchain.bb | 17 ++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.39.5


