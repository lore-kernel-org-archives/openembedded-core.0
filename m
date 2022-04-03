Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC6CDC47094
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web08.23909.1648999403849544832
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nA82kCsa;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.47,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f47.google.com with SMTP id r10so2550501eda.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=g8yl6oKQlLGlHLQNSefv2ffsuCCEr34v81fdnfWT2x8=;
        b=nA82kCsa+Rat6y+vTmgj93AsNphIKo9sX/3PZZk1xWNDKCeUVfpv3ROwdIxXe+bTZE
         olG/6ohx4AMXn79CIra5kTdYiwSmOxwdey10rSa+lXA3r6QKBvN9C2rlF3m/smITBQWH
         sQSTA0XcEec6TtDr8EKBZ/zIbqsrn3M0an9lSwsa9kpLzH9zNPjDQd477ibkxAi+hH8u
         p6tmdfZSjixFtmBdONKbUKBxwpbojKoMec4l659IqqVb27eCUcTbshnwDZeL56fFSJBR
         uBa3TmIp5AYVeapSj3QL4CUTqT5MWO68bc05CQCK46xpAvO5M2owXzFOD5kjCL/6Q1Wk
         JEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=g8yl6oKQlLGlHLQNSefv2ffsuCCEr34v81fdnfWT2x8=;
        b=aIQIvCK+QXfyrBDmU1iNY/vGvrVpA+O4pMX2kbTJKODalHbhg4GsvbvUIKiBdHsG3e
         oMNwf1RgpYXbL9wbA3aHwfekG26XK4qMBb0+pqzHQnkjxCDfFmoLQqUGmoxEz45j4hfM
         26/CUGSb3/6JBCbNBahfC6LrxJEkmJ3svgDUa8p5kP4e3wzOZDtMSIDZj+8kmyn1TMu5
         WeiJ9oUXWbZDjEgwb/Dh71sq0/NmoitwuUOaeE8i7As98ZnEUr78fvdCvwe5u/8rQjDT
         L6hffDsEeFzqQ3v/yu3PrRPthw99dchRiJzl+yrkqZushIY+xiURv6Tb5ygdX4E9PUCl
         KFdg==
X-Gm-Message-State: AOAM530voi47RLCP5vqFVJj43F2Dsvefln2bU0jb8/hZj1YiXnH6kv1Z
	QYCaPfW3690IRHQxxFM/GtSNt++ikP2vqK2TRxs76kYAdZ04SeOE
X-Google-Smtp-Source: 
 ABdhPJw45qWLayKfT+RieyiSolWajCBagE3F9N9GSj4gCAGNbcIM5smvDWstIKTR1D8IdNumtFeuxcmwvyDfVFZlOGM=
X-Received: by 2002:a05:6402:1a54:b0:41c:cddb:3142 with SMTP id
 bf20-20020a0564021a5400b0041ccddb3142mr1645098edb.106.1648999401962; Sun, 03
 Apr 2022 08:23:21 -0700 (PDT)
MIME-Version: 1.0
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 3 Apr 2022 05:23:11 -1000
Message-ID: 
 <CAOSpxda1fJ3aLmFO_1XFm_JHG4r+vPtLzauvxXXR0vZNwGxZeQ@mail.gmail.com>
Subject: OE-core CVE metrics for master on Sun 03 Apr 2022
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163963

Unfortunately changes in master this past week have broken the CVE
reporting scripts for master.

I won't be able to work on this till tomorrow, but will rerun the
report once a fix is identified.

Steve

