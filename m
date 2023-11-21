Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA521C61D94
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 13:25:09 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.39803.1700573108247479523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 05:25:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eT4W8qAT;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2c83d37a492so68854501fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 05:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700573106; x=1701177906; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n7woz/rpqzT1MmPF5mC/AxqA4driYKF3IlnU8FJCKxU=;
        b=eT4W8qATqv5ljvplLUKB95BYaPIQp1eh1MkkFDHPsTycveqlsLjSJwzgwsY4/WbqGG
         1znjARXd4cLbIJMTEJw6LB/ydjFmoYFuS1YMuawZ+awVbMJMbnEn4SpN99x3k6E6KbEY
         5/ik9jCS+xQrG1EL2JFEO9GHDYhWk18h4NwKkrKt8gSZcdDrjJMG4T64g1QoOuu5vj/4
         J4xVN/6ie/ZZ+g6+p7wVIgefYsRsYebchOXZ7VdZyVfcLlmxg8/t6koWfN0nxvbgI0RW
         DUUByPMdrrPoo1iRemyvQO+tTVdngkh004wt51cNphe1yH4H/nwG6J7DVdKr/97xtolC
         89cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700573106; x=1701177906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n7woz/rpqzT1MmPF5mC/AxqA4driYKF3IlnU8FJCKxU=;
        b=AmPbPY7PTSDZufL32tz6OiVYlAFnEWA4YHsCP/RDg3EhKMo46gLyKJViq4CMwhI/wq
         kheESt7HJNeIeqwfebnwYUlUev4bEYrUXXO8FMsOQAdT+IbqrJOQFSADzh3VTyrXiXbQ
         +9MC99fexYMViJbk9rdWEiqCsRJUj0lSwaLlDSC54u9fg4Hol1nKgF9bZSMDCIq+m3eA
         Fajp4X7CFjjaP6X8c3cUyMSssguhp0DHJyHmnQ5zmkuxxYebq0FWixwEH1v5IpkqmIYF
         cwUrt32obn7g5MjyqVRbziRD+6lgD19JWYmJMGCBvRS/xZPT5WA/IPuTJbHysEwEAjVd
         fyFQ==
X-Gm-Message-State: AOJu0Yy7qpKXJzMfV3g1x9uSSkIVnQDHBrB01GHUuNFZ4mqoIPFdDQWC
	VPXVlWn+yXlOEAMzqNiplKZOD8HOYUkJOs0h4Lo=
X-Google-Smtp-Source: AGHT+IGKSGxSkdxQpiUfklal4VUdPR1Zg7ghOeEWwg9Sq9dUm3R/NnfzcTqf6Ig3ZxMAY9A+Oxaie+6iA0jbCWfaEJs=
X-Received: by 2002:a2e:96d0:0:b0:2c5:1bd9:f946 with SMTP id
 d16-20020a2e96d0000000b002c51bd9f946mr7413434ljj.9.1700573106309; Tue, 21 Nov
 2023 05:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20231121132203.932559-1-ppjadhav456@gmail.com>
In-Reply-To: <20231121132203.932559-1-ppjadhav456@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Nov 2023 14:24:55 +0100
Message-ID: <CANNYZj9SpzPK_vAw56KSckFTd4Cfisuffb_N9mpw3oD0Nj=khQ@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] ptest-packagelists: Add sdbus-c++
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 13:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190976

On Tue, 21 Nov 2023 at 14:22, Poonam Jadhav <ppjadhav456@gmail.com> wrote:


> Add sdbus-c++ in ptest-packagelists to run ptest

sdbus-c++ is not in oe-core, and so cannot be added. You need to add
it to the list via .bbappend or a custom image recipe.

Alex

