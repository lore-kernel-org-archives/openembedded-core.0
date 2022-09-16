Return-Path: <jcreedon@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13705ECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:04:25 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.848.1663362255588112317
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@waymo.com header.s=20210112 header.b=bgkWk/B8;
 spf=pass (domain: google.com, ip: 209.85.222.172,
 mailfrom: jcreedon@google.com)
Received: by mail-qk1-f172.google.com with SMTP id q11so13654028qkc.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waymo.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FpjRdVz8MCs86O+rvYPZcOHw9G5BCFsxEIVHXJxSBh4=;
        b=bgkWk/B8xQG/iHE0T7E0rhLW/gfMCeew15axDMIx3f27TyD8ROMYj+0qgM4aBh83f4
         PRYX9uKf/m0dXJzZW8O5Hyfee+t6XoC1VI0tAf97yw2sKU0duGzYj6azycGyqDDK0u4l
         gI1myNmYZMw4PfzjwdDKyfTntUpofxDm3twqn0cqH75Xvbs0kLwE2LTKIjSyOcMlgQus
         niAvz3QEUM+tAGSMg/WpSmtQTVOpo7m/oAUc0GSf8V1zcdnVrG5yozLvpcJKe3hOityP
         v/al2TW8GrqiantPTHc4XWm2NL1vClj5gYuWDT2Vk3NGIDoM+kCOkHHqOl7L7e8gXx7P
         Rdcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FpjRdVz8MCs86O+rvYPZcOHw9G5BCFsxEIVHXJxSBh4=;
        b=wUtVq54Uys2B1koKEWmk9+nn8ZUPZB5s8XzexskroJMo+akwVqqVIHbo8NVLd8HGUI
         4BWZp88RBunvlWX/qtwYZgZ7J1tGc8NJ5dVbnrcBUww1g+smg9eRXr3W0WRxmBKUEFqj
         KSMJoNuuu4uRjAVB4q7lirQ2lNXVm8DMzc5fqFFFfOs0tu1y+4gSatnXm03mx4LUi8Ef
         UGtN0QmPHUQZSi1TTYcFg1WrmBE0MTKkEEjOjfPRn+Ym2QUZ/OM7nZDQIaIBrLo/xTPI
         92LtK/R1W12LmOfOZtpCwYdgV2AwEO7ffAaZanJO6KpBKNFmIrwaz0WD2msVMccAWJFZ
         Zlqg==
X-Gm-Message-State: ACrzQf2LqIqdqjgbzf7wx83FvQYCqWhrcePdLLAh/gQ6aA1Lr5kocJjp
	dT2738YAgZvGdGZ6RKgUl5ZCHVxQQj57nMngZORGnF4YdqNjYw==
X-Google-Smtp-Source: 
 AMsMyM5Rcd+WwdOT+MYR+NMQHtldA6sbsfWdcECLEw7CDR/7yw6+UYIkvuS6UBgDnWKo2xFxvlgbvOYiCQABAeBMJPY=
X-Received: by 2002:a05:620a:4306:b0:6bc:5751:4b4c with SMTP id
 u6-20020a05620a430600b006bc57514b4cmr5331209qko.387.1663362254479; Fri, 16
 Sep 2022 14:04:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAEZLVp59mMOwk86+k51QfiYj+HMyRFuu-M457poi_xugTEtXHA@mail.gmail.com>
 <00f9f485-3eed-7438-8d04-9a4489fa75dc@theobroma-systems.com>
In-Reply-To: <00f9f485-3eed-7438-8d04-9a4489fa75dc@theobroma-systems.com>
Reply-To: jcreedon@waymo.com
From: Jacob Creedon <jcreedon@waymo.com>
Date: Fri, 16 Sep 2022 14:04:03 -0700
Message-ID: 
 <CAEZLVp5wJh6_eTQ+p_6OHbHi88q7uRhLiBrDmbb39tRM5FrZjQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] externalsrc: remove git submodule--helper list
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:04:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170798

> When was this added to git?

$sm_path was added in 2.19 (August 2018). Prior to that, $path was
used all the way back to when foreach was added to `git submodule` in
v1.6.1 (December 2008). I'm not sure I have the project level context
to decide whether or not we should be bumping the minimum git version,
or just shimming in a small script to check for $path vs. $sm_path. So
I'm open to guidance on the preferred solution here.

The impetus for this patch is that `submodule--helper list` was
recently removed from git in
https://github.com/git/git/commit/31955475d1c283120d5d84247eb3fd55d9f5fdd9.
I happened to run into this because I was running a bleeding edge
version of git. I suspect it will be a little while before this
version of git will hit distros.

