Return-Path: <arabishi900@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC067C433F5
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 09:50:11 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web09.9611.1633945810885103341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y81TXnDL;
 spf=pass (domain: gmail.com, ip: 209.85.222.177,
 mailfrom: arabishi900@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id t63so11212178qkf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=CgfBqmn5YFV7CF8MGt7MPC/AoVBEOKx0gSSBMRSUERE=;
        b=Y81TXnDLLJjg4zDh+sdOH/ap/9HrxCc7VORzcRoFg/RRR/x1BHzyKH3dzOreWrIJdV
         HdurXLTwSoByh1awE575GXfja8Ev21h2ag1B/M7Q8zd3HrjWVnRms0sW9BoCYXNlnEAz
         iIFGSfbHXSccaxvddIDpp7FmRgJs2vPeGIUaOVwJOuzpUNOzrNV8257nt1dyVAE/fV3T
         RNry3swnH5BreNy7kv4aAlVG4Wf++lKdAxlyvRSBz63g/Csmky6HD64FsnsZMkQvGp5N
         ObSNpI/iKnGiStZklS/JFaR1d2Hzy747G2B3q5sJEpn8pfcibsQri2Ebk235oULz/n2E
         xc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CgfBqmn5YFV7CF8MGt7MPC/AoVBEOKx0gSSBMRSUERE=;
        b=deYVn/iFyBqrpoGbUOhm18rDm/HQKS5ILZ79fGFgnqz9HNBfq8zD8iCSExruh4JQ3h
         Saf5U4NROTgUg6wNZCR4F6GXVBq3Y01eWltjxjOZuxsFfWSY8n62vNo84XE0SVHV78lZ
         LDcAnDW2tL2BrbZIP3GVu3rAJWUVwAQ7XQvGa3VSIg35U/fcUC30ofblZ1v4Ets9Vayd
         U0g72ux0fsMdJa32XZzfHsJCjFzE2/fJJV3V7p52HStomTeagCN8s3yKZ6XudaTTZhha
         1RgNFP3mFtimzljbSfweWo+xXoxAiHo/37DswIHCWRwPi4YwutvBNZZKfkNH7aS6+EV9
         Xs+A==
X-Gm-Message-State: AOAM533yqjCbMQQm/805N1UJG9BSJbGobqA/x7mvTNQEfImKHlVH0G6b
	GOXkmAI6o7zRtB27NsB1LXOg0rd991TLbJMEh6nOBglN0wk=
X-Google-Smtp-Source: 
 ABdhPJw7L3P50/l9EYQV/dcLgMZJPsBor6ZaN3bFjPx6Onq1Mz5rolURGq/ewCdrt9KMz1ndxZKZTU9MTDVV6D3EMUU=
X-Received: by 2002:a37:2c86:: with SMTP id
 s128mr13300082qkh.516.1633945809959;
 Mon, 11 Oct 2021 02:50:09 -0700 (PDT)
MIME-Version: 1.0
From: Akira Shibakawa <arabishi900@gmail.com>
Date: Mon, 11 Oct 2021 18:49:59 +0900
Message-ID: 
 <CAE84iWW+eiFK7bEU3fRZL62G7L2xmEbSQQfAkpzj5oQwM-fWgw@mail.gmail.com>
Subject: [meta-java] OpneJDK nativesdk recipe
To: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 09:50:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156839

Hi
I want to let my customer compile java code on Yocto SDK.
But, there is no nativesdk recipe of OpenJDK in meta-java.
Is there any reason to it ?
Or, is there any plan to add it ?

thanks

