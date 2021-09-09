Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.5058.1631219693940596972
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 13:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PXH8iwcP;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id v1so1855576plo.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=FELeqaTCrYaula98P0u1wkvZdnzoObNc7SgJ5F6k36U=;
        b=PXH8iwcPxcf6hLHSQkID2C/hs4v7pnV+qpPmegWEnJGK0J1vhckdUJ/+olgIKyKYsF
         a+kN0v96Etb/kyKsR+awynSCNPWUP5CAtlxU/JeKEnHm8CmLMgXbr6X34thB7KdD1y8Z
         R6tcOfz/QpFZ2uhkUOTp9hXNlWrdMce1m6MsQOOLfMQbnqucP/+Xt0w3EQQLdaS0c/hj
         LHuyqzb6e4/ni65ST6nPvuq5qUZoyZPB/AGa3l4Jtrmn+NuZroNXn3cDLnDhrDqucbUH
         1iQ1x0Crv86F+VRdQq6iJKjEdopKkS5jFa0XCSG0DylvK/oyZC7CE1FerB4dGyDkpxHb
         lJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=FELeqaTCrYaula98P0u1wkvZdnzoObNc7SgJ5F6k36U=;
        b=P1wUw4SM5yMyjBsw6DJTEaauB9ZDcU79QLrUXMW627TzA2MPbkGIeXLf/+KJK8+QBz
         tMvdy73nCOXwQPO+/XEqkMwJAT9FNnyHNTn9n7/QIvcH4WU0UcoAT5HDi8QeYudDKKr0
         xGMz2yzChmh1TxT/Roc3LOwx8FpT6axUqcA9xHEM78zN7IOtxyOJui49r4/S79pSQHPv
         5ZTd5TBHgioMzoKtkEJKSh5y74OzKHIxaa2NqoyYsOiKR6YDVA4w2U+nnMGZSbZxeynf
         Juucv4TcHTo0sCRyBSYBUymgygIBC3d0rX1CyweutH2hwZUfccRDslQADVWqDrBVyzfc
         1Sjw==
X-Gm-Message-State: AOAM533yplowGC6U7Uu0iAJj57uy1G7U0MVCsmlZwx94p+FgHWmsapGP
	SNArz2L/a1jMpokhmyWePs/Wd9gMV6p/NPK61DXWHYgITR3Y7w==
X-Google-Smtp-Source: ABdhPJzDKsSVheiif5xaGe/GWfsJJG3ME+z0/Cb+E6454xQfHIQ1Rx+0ojeZwRWz8wxYPcOrsCXRWgrtAxShUUN/NWo=
X-Received: by 2002:a17:90a:bb12:: with SMTP id u18mr5622784pjr.110.1631219693331;
 Thu, 09 Sep 2021 13:34:53 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Thu, 9 Sep 2021 22:34:41 +0200
Message-ID: <CALbNGRQBafr5e57FK0cfa8xc4pAOPmWUtc0scsV-58ER7CCyNg@mail.gmail.com>
Subject: Layerlist update broken?
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

Just a heads up: looks like https://layers.openembedded.org/ has
stopped updating 3 weeks ago.

Cheers,

Andreas
