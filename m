Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC95C6FA8E
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 16:52:35 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.13588.1664297552694700838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l6biFtl1;
 spf=pass (domain: gmail.com, ip: 209.85.160.51,
 mailfrom: akuster808@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-1318443dbdfso2689241fac.3;
        Tue, 27 Sep 2022 09:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date;
        bh=V1bDywo8GAasLbmUW/lcdsWoDNLwkzv/xSCeV/YB7I4=;
        b=l6biFtl1F/Xjhk844KGCAJPIR/2Car5CLQHU5reHApKAY3fbkmUYox/v3UMSyzUjM2
         0fTcxOQDejVvx5Of5LAESyqLgCCxSeU4ZazA41MAxILPvCOHsOivTeuHqzfHNNlMDQ0I
         4HMuj5MfyP7uVZTltSiKI1bG9R7aAaf/5w7hQAFHZqvKeu3xkbp+y3lIG0o6mj70aSKS
         xXqSvPTvouKyLmWSkmmZ2NjTxARnVeZ6CgqU9BfPhFv+fGsfSTUexiA9A4CZ5pWDJ4hB
         7AdYx5UOgdpWU76XeyFpja313ku/D7dCTvLAU7lkqPqro1D8E6OMKBfPnurtGfKpzOfz
         hV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date;
        bh=V1bDywo8GAasLbmUW/lcdsWoDNLwkzv/xSCeV/YB7I4=;
        b=CIsI5d6QSoHEaNsQeG6Ix8URb68uaGLaJFlAwztLutUwqlBFw5hLPQjnke88NHyphC
         7bG7tsVArh7JNJE689WAE6UbzsBqTaSqDtLy5WdIS4Ekryk3ksai5Rt4R/qwwIhFRnHS
         EBAQZS1iiI7Jtfq/QthyTt/OpopKtQdItdlRlnST7mx7qp86AGQlk6PDzve7utPgiGTP
         JOxp6fxP0Jcwpif5qNQxgEX0eLt/zvQYC9X1bJleezHGof6FHBM+QwRr/4qUf6Xm9iOC
         6yKI/AyOueorRNgx3vZH3Me7Q77wXkmOtNGOrYkfjN+CXGFF4tCAMcF+CRF2lRFJorce
         Jn/w==
X-Gm-Message-State: ACrzQf1o22a5mtPI+ORtLtl95tf1aYc42RZKUdLRD4zPQcaZc7UBgwo0
	ezlfvSisRd3rP78FCc5E1RxBPv0FmK8=
X-Google-Smtp-Source: 
 AMsMyM5fAZyvZZBio2WDtoS+8Cpr4nWw1RjTTOqNW5ptVdaYXabKs1SPoPr3Go5l5SIis2eWGgxU9w==
X-Received: by 2002:a05:6870:1496:b0:127:c9f4:4de with SMTP id
 k22-20020a056870149600b00127c9f404demr2811467oab.187.1664297548597;
        Tue, 27 Sep 2022 09:52:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:a140:ee5a:1873:5286?
 ([2600:1700:9190:ba10:a140:ee5a:1873:5286])
        by smtp.gmail.com with ESMTPSA id
 y123-20020a4a4581000000b00472874bc2ffsm835876ooa.28.2022.09.27.09.52.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 09:52:28 -0700 (PDT)
Message-ID: <fff57bfa-949e-fdbc-f7fc-0070aedc4dbd@gmail.com>
Date: Tue, 27 Sep 2022 12:52:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Subject: CFP for Yocto Project Summit 2022.11 is now open
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
 "yocto-announce@lists.yoctoproject.org"
 <yocto-announce@lists.yoctoproject.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 16:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171112

Apologies for Cross posting.

Hello,

The Yocto Project Summit Committee is thrilled to announce another 
Virtual Yocto Project Summit for this Fall.

CFP Schedule

  * CFP Closes: Friday, Oct 28, 2022
  * CFP Notifications: Wednesday, Nov 2, 2022
  * Slides Due Date: Friday, Nov 25, 2022


List of suggested topics:

  * Layer quality: e.g. creating robust layers, safely using existing layers
  * Productivity tricks, Best Practices
  * Developer toolbox
  * Security
  * Reproducibility
  * Supporting the Application Developer Workflow
  * DevOps, CI/CD
  * Containers, VMs
  * Working with/creating BSPs
  * Practical use of the Yocto Project
  * Product showcase


Presentation formats

Slots for talks vary from 15-45 minutes, with training sessions starting 
at 60 minutes or longer.


Submit a propels:
https://summit.yoctoproject.org/yocto-project-summit-2022-11/cfp

If you have any questions, please contact 
conferences@lists.yoctoproject.org or myself.

Thank you,
Armin
(On behalf of the Yocto Project Summit Committee)


