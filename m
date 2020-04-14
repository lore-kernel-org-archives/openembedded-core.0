Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1470.1586887706955173803
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2020 11:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@izotope.com header.s=google header.b=igjmPHgW;
 spf=permerror, err=parse error for token &{10 18 _spf.google.com}: parse error for token &{10 18 _netblocks.google.com}: limit exceeded (domain: izotope.com, ip: 209.85.222.195, mailfrom: mwillard@izotope.com)
Received: by mail-qk1-f195.google.com with SMTP id g74so14266777qke.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2020 11:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=izotope.com; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fapVf9MXexj+e36remXBFn09GmI3vPyDyUtNT23EPw0=;
        b=igjmPHgWZE6C9zVzUK1R5+GTgO2zSrh0ekgjKFjftV9CfiiVM+wa+FsYo3aqlxTLET
         D2HxMTTNtH9WYVwFcH/tlBUmdR8r1cGx6NbkpFQkBARryqXSCtjGjJZOB75LYX+9Kchm
         pXDWqZHYlwirEvUSoNx2D8aXbI0fzLwM5yju4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fapVf9MXexj+e36remXBFn09GmI3vPyDyUtNT23EPw0=;
        b=i9P5w4M3f81MUOIfZL2qvCAdLO35mo4uMwsejCxw/uOU4n4gzCzlCz8y20xMhNFuKD
         rF+ADj3N00lqb5ZrgxslUpBte2wTCjgvGyVc/LSZRhtzbhdtP57BQiceUrsmKRwUa334
         bkZgsNsohv/MZZqmCt3lrXXkB/okB737MZMmS8/kEF45hT0k4GxlMskNDSOCJakJU8D9
         aciBlpt0QtVCJ/Sd0ZYFSzpR5GkCz5DO4rHcAfn/9zGQg+hAyDQF+iltTWA/3w4bEMPp
         uW0jcvFxkBNbIhNmMaQf1nmdI+4xg8P01LucLrjo6XUM8P7L3WshfWzw2CBaz/1PnEes
         30dw==
X-Gm-Message-State: AGi0PubCy9OZSJCw7VIGgRMtK5d72+ciYeSwa8uqaKbYjJ/9PYHJj2cQ
	ZIRp1x/1+OfvZHQQEP+P8yHTa2EIeVhj9A==
X-Google-Smtp-Source: APiQypJeAEhMTA1b5g2V/dX0K08KiTH96WCJsvfHfm5dEz0+o1Ur+d1tRKxXaMLTgRkGJf12ns/ylA==
X-Received: by 2002:a37:5d84:: with SMTP id r126mr22327854qkb.148.1586887703807;
        Tue, 14 Apr 2020 11:08:23 -0700 (PDT)
Return-Path: <mwillard@izotope.com>
Received: from localhost.localdomain (pool-71-184-149-228.bstnma.fios.verizon.net. [71.184.149.228])
        by smtp.gmail.com with ESMTPSA id v20sm11605136qth.10.2020.04.14.11.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 11:08:23 -0700 (PDT)
From: mwillard@izotope.com
To: openembedded-core@lists.openembedded.org
Cc: Mike Willard <mwillard@izotope.com>
Subject: [PATCH] insane.bbclass: Warning for so file version mismatch
Date: Tue, 14 Apr 2020 18:08:17 +0000
Message-Id: <cover.1586887105.git.mwillard@izotope.com>
X-Mailer: git-send-email 2.17.1

Adds a warning if a package produces a .so file with a
version that doesn't match the package PV.

This will catch issues like the one in a recent lua version
where the .so file was getting the wrong version number.

The following changes since commit 5d47cdf448b6cff5bb7cc5b0ba0426b8235ec478:

  build-appliance-image: Update to master head revision (2020-04-07 22:15:35 +0100)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib mwillard/so-version-warning

Mike Willard (1):
  insane.bbclass: Warning for so file version mismatch

 meta/classes/insane.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
2.17.1

