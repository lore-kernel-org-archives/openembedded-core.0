Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.3229.1616704376820524651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 13:32:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fHDezroE;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id j17so1848790qvo.13
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 13:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJQ60lTicayTEkzw3l9I00OiyZt6V5IWymGmLXa+grE=;
        b=fHDezroExJtLJvR+CBb7FQzxyk/mh9QqsgppjmSOJRnPaBTZSwwSA+StooL3JBIgj3
         LtHr0Z5OxLdmylPFTMx1wuvSXk6LVnopL9Je1/n3uFDKu2VKI4cJ6tvb98WpJUS7dg8/
         qplB7HyxPz0jNvbceXXjgU0QE6NbWjmomqoL68twp3dfBq6yb7lgtgvrPITnnJnmqOod
         dNXZSGTSrvGcq2BIBafTPbjIafmCy1F662OCA/Gk5w0zZMOMtf+84atGuGoo4Su7SBqn
         aLPAwYn/rjp6MuSZ2RJUrQ6lkiXoYSXeQfYMx6buscSFo+3eO0BcUXlqnX8qotEFUxZM
         saAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJQ60lTicayTEkzw3l9I00OiyZt6V5IWymGmLXa+grE=;
        b=UfR9YYrwjx0FwuoqM9ncypk38ng9/7B/qF8VHmq4w+kmboq+PJ3ZWmQ8x85H8/k9nE
         /f5rsMj2pE8d4OedyAZGXeIQkMGNYoTvvgtIXHq1xH2RhUlajAes2HIbYxfxLKau0pgo
         ssaq7JkJTEjTBWPtTeLg0GprNFX1alDnsZsYZcTs+BX3xmHzMUN9DAiJIxWSUfMX4AiZ
         3VMp4L0FQJ1wyCaNBeH+5+Ou4lISmLtHY51Ri2J+X3IkMpdMuCBQYeaDdhXp4nXvgg2w
         FwEWUlT3Mkw2mjTfG2/GUhtyJNi/46Dn0S+VttIPZjDqIXUjX/H4K6Ym1bBV0HoSXm3d
         0dPw==
X-Gm-Message-State: AOAM532TERGw/yE6UciHHVO8Ig62ze+tS40YIO+Xq0DHh44uUxyxQrZF
	slDNVslOcfiJ5mgJhbKrJv8=
X-Google-Smtp-Source: ABdhPJw+6DVgG4LzigzGi1+gYkCzcvdunMJQ8x15th5PxSG3gJYiKVZxs6Bd/q/ISxF7TciSSPDl9g==
X-Received: by 2002:a0c:e8c5:: with SMTP id m5mr10088440qvo.13.1616704375953;
        Thu, 25 Mar 2021 13:32:55 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id z124sm5221090qke.36.2021.03.25.13.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 13:32:55 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: -stable updates
Date: Thu, 25 Mar 2021 16:32:50 -0400
Message-Id: <cover.1616704280.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

I had some pings about v5.10.25, so I thought I'd send out this round of
-stable udpates while I finish up some other config warning cleanups.

These are routine -stable and -rt bugfix updates, and I don't expect any
issues.

Bruce

The following changes since commit ea455ca8671d3bc2a1097989bfaabe92f3ca37ab:

  build-appliance-image: Update to master head revision (2021-03-23 22:56:44 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.25
  linux-yocto/5.4: update to v5.4.107
  linux-yocto-rt/5.10: update to -rt34

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++++---------
 6 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.19.1

