Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web12.28096.1624147613511552086
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Jun 2021 17:06:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=j7yZikEh;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id t140so15533750oih.0
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Jun 2021 17:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRJ+Yb5sMTZAYSSL+rVKOoDYLUgDdWBUKIrvCHE7yBA=;
        b=j7yZikEh+Bhi9y98P/tpK7pDw4vdCDi7xU8JCb2iN/7ZdniXj/6KzEknzODsIzEVYZ
         WdqhDHZ9C3hh3ARyaCEjQ1H8aMp4t8AFowAgMDW2qp+NWVUEsmAwvQ9zjgPfSFts4M0n
         5ETx3krZVx9GDymQVaCP6rUCm8poWWppPqFyNRntXIUGxBJbwLodwESzc4FddZkYX2JX
         qeL5C037jj1tiHbVFvLEI82SaJQRq5vEnWT/pv2XCtkkQIwojeORTPsOIeZsaaKCCEVf
         JJE8EvZ4w1mmjCBMqY3iPZDfp4D5/PU4lrz3jCTnYQPB8zu/cAwuEFJrhs6CLVr+ldFp
         rF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IRJ+Yb5sMTZAYSSL+rVKOoDYLUgDdWBUKIrvCHE7yBA=;
        b=sy8F6+LzNm0fCYxunEQMVyLCE7Z0ntxyNBZe5DNpIo1lM2c8qTwg+K4VjGFBSHM5tG
         M9BhNwSuiERzR88hER4fTadAd52Hnqjeqzv4RDpX4hDPeF+eHrE0LgqEJIq4BEFsIhmM
         yCu+o4533cbZNafk8bYtUsOwEuY4fL2M9dyUdjZtzQVM9QQx+paPy1k7UYU3p0PvkLxI
         m6HAeOozq3cfG7W2XYn59n9krD9/YdsSgCS5RJu6AaLje6SXpif/84RBk8gxA/4uFUuM
         FZ7xgBj0AofQer5Byy8EIJ+vFeBWEwyXES5OYGgbjBVIBil9LWD0oU3DZ3iuCx4hN4BX
         1/IQ==
X-Gm-Message-State: AOAM530s1RikZrJvVNfJz7/BC2PNofdJcB/x8LMDzEU+VF1ZPQyGBRPz
	ui/6BzGWZJdNoMAxGUpRw7pCMTHh+KQoFkhJU/8=
X-Google-Smtp-Source: ABdhPJyznPij0nshuGiUcAY8u4uUXPXvktb+scgsgB8y+MBDHatMqABzuaMhD7agNppd/LyAi9Ke8w==
X-Received: by 2002:aca:d5cd:: with SMTP id m196mr19393620oig.138.1624147612427;
        Sat, 19 Jun 2021 17:06:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id b20sm1000016otq.41.2021.06.19.17.06.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 17:06:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/1] Pull request
Date: Sat, 19 Jun 2021 14:06:28 -1000
Message-Id: <cover.1624147329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Unfortunately I neglected to remove "python3: fix CVE-2021-23336" before
sending my last review and pull request. It caused autobuilder issues and
should not have been included.

This revert should be included prior to the 3.1.9 build next week.

Sorry for any inconvenience.

The following changes since commit f5fc716d744745d5c2ea83f0b1d63907cfe04c06:

  kernel.bbclass: fix do_sizecheck() comparison (2021-06-15 06:37:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Steve Sakoman (1):
  Revert "python3: fix CVE-2021-23336"

 .../python/python3/CVE-2021-23336.patch       | 530 ------------------
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 -
 2 files changed, 531 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2021-23336.patch

-- 
2.25.1

