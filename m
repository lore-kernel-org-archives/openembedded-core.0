Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717E0C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 14:11:33 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web09.7740.1652796688945932449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 07:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GR2RLgrZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: sakoman@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id d3so12660880ilr.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zr3WUpPOxwjp9x/cd5qrzUAqFPg5E8BVQ6l+u+8BAqQ=;
        b=GR2RLgrZxLHdpmRs8DbmYE7XbXUE33WKLJ0LyaCcQcPVbxoiSZVclm0UbIF5UrVTPS
         5KczLuTUBBN4CPQzHozdU7eZ78HlqSOAo0+Kbq+Os+0cjzXzIyQdVLDTWDR9dzg3XZJl
         1GCcEGyTVgdj8mf795cUhToLCtg6XDWGDnaD1RE3yTnO3h/gGhY1Xh6l8uIIQ42BGm/W
         Ou7IikImsE5bVwmNN6OEUKaeih2RrIKdYdLi/Z3SxB/j6nu7vqVPhdCscwJly/euikjz
         //9XwTdBYFpsx0fw3FnW4ifoyXUONgh98yEK3l8C8E2jumtwJhnydJnMZetmh16cGL/G
         775w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zr3WUpPOxwjp9x/cd5qrzUAqFPg5E8BVQ6l+u+8BAqQ=;
        b=eFn5iACTFqUiHi6Qz8U0rz09tNR08RkgQEmItdC3dHZz0kuJQF49EYwehySbvzusZr
         8hiV7nh+cIhmq++k4XwRE9FpvBJsJOkfFbpxZmEeSYSTjwXZmaxBT5n3gXguSh2khWYN
         Fxy1jyVJU6p5irLXmRnw7Y/sg2z6zIis/yTBTGDT8P9GP0h6TfXb8cd8JMfQHJwSIkqN
         sP4Q2wNIjJIfd3kZAKS2lNlRzQTb8l3dE92Yw5ZOoxyb2AGqD78OQVk07irQyoaSGLxG
         palQm4dogxsIe06yker9DmnngVMLtzy3Nts4mQQwIbhN1h9bWM/1hl9dOBd+sIlLNAH3
         muPg==
X-Gm-Message-State: AOAM530yfhib0vRO67qZ3XSAopZasEjY4vykE7XhnubdJ0mYc5HZMFke
	cvlmtxdKi08ndDbscurSeiVqJeGj08iM9snz13k=
X-Google-Smtp-Source: 
 ABdhPJz2Unq0BP9b6dym7HXGO5MQ6nPxanh87FhmOUrbkcQwuf6b/yeNItUUPBSRWbfiv2+88ipGmh5Vd+Dw50ggav4=
X-Received: by 2002:a05:6e02:1d85:b0:2d1:39cf:380c with SMTP id
 h5-20020a056e021d8500b002d139cf380cmr1798643ila.239.1652796688261; Tue, 17
 May 2022 07:11:28 -0700 (PDT)
MIME-Version: 1.0
References: 
 <f35500a442d6a4564d52e23f9602a3f90a4ceee5.1650131192.git.steve@sakoman.com>
 <20115.1652785744539900885@lists.openembedded.org>
In-Reply-To: <20115.1652785744539900885@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 17 May 2022 04:11:17 -1000
Message-ID: 
 <CAGDS+nmqe4w1_KynOFwEBRNQVceud74iEyVG6bD1Pg57Ty_LYg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell 05/11] git: Ignore CVE-2022-24975
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 14:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165736

On Tue, May 17, 2022 at 1:09 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> On Sat, Apr 16, 2022 at 12:15 PM, Steve Sakoman wrote:
>
> CVE_CHECK_IGNORE
>
> Is this variable CVE_CHECK_IGNORE valid in dunfell branch too?
> Because when I check with "bitbake -c cve_check git" it is still showing as Unpatched only.

Arghh!  I'm so sorry I missed this.  Thanks for the "fix it" patch!

Steve

