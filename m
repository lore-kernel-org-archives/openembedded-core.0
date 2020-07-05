Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.37492.1593958307009311554
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 07:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b+GmA94S;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id o11so37962543wrv.9
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2020 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qPmO43b4mzsGNY7rNYKU0au7hKOVIchL57S1/0VSULg=;
        b=b+GmA94SgPigoBvwGfxS1dHtxkFCwLxv6AVFlFPtIB1y/fjAeix3/zs83nLA83ybS0
         tj+yxyUjAUNJgxGpMrfSnlNeV8n82Y/3LsEBDtmxeO+Lds2OEFiolER3mjwGvrcVW4Sg
         O80tawwAIng1Lqq6j/IC+tmWiWY0Rt2DwPQnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qPmO43b4mzsGNY7rNYKU0au7hKOVIchL57S1/0VSULg=;
        b=bdd3MD8itN6HPC76UlTmUY2OMyNFsA+VsifC7z5ShYQGWA3dXHFIKU1uNiSHe7lrIm
         a0iKIpqVlRGu6yZ8FXcyMpQMyoDVROiw3OxnMtZ2ce1/u8gXMNP25ZGwEwuMJs+/RIvp
         fUdezbOj7geLbsikmkukLeey7V4n6hV6sv02r36Ym/yyJhqHLmsebAdDIvBjnTeQyQ0P
         r4QnRJhjyD6DrRlC+rcKujwO952NoZp31/N6TW7YVG95c57r1iXlA2HruD3f+cMFJ7hD
         YathxKjdIREaf8lTCr3qV+lktX24Q0tfyhvv/dqqAiCH236pdl4fX4UaV7gLz+r2LTzS
         BFqg==
X-Gm-Message-State: AOAM531V7IaZDAABcI389TDu3ZqAXTt7LzWqblbIPSQn7VLLHyEKTTXe
	2pqvb8CW+buVGAs1oOyA9NSIbg==
X-Google-Smtp-Source: ABdhPJybldBciOIeZofiXN2HoMfsEECmP204czyQBE2DGabYjYWFSbGeLPfC0v/6pQSB/sYhFaKatA==
X-Received: by 2002:a5d:688d:: with SMTP id h13mr9726612wru.303.1593958305573;
        Sun, 05 Jul 2020 07:11:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id z6sm19249464wmf.33.2020.07.05.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 07:11:44 -0700 (PDT)
Message-ID: <dbad95cc2ebfaded94d951dda86b2bfbd52d4ad1.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, "Xu, Yanfei"
	 <yanfei.xu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 05 Jul 2020 15:11:43 +0100
In-Reply-To: <CADkTA4OQYAg9zZ4HyxJdUN0VywTgQu4vmbdkJqov0vmkJg8NAQ@mail.gmail.com>
References: <20200703135515.6934-1-yanfei.xu@windriver.com>
	 <CADkTA4OQYAg9zZ4HyxJdUN0VywTgQu4vmbdkJqov0vmkJg8NAQ@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 22:26 -0400, Bruce Ashfield wrote:
> On Fri, Jul 3, 2020 at 9:56 AM <yanfei.xu@windriver.com> wrote:
> > From: Yanfei Xu <yanfei.xu@windriver.com>
> > 
> > Some filesystems don't support symlink, then you will get failure
> > when
> > you install or update the kernel rpm package. Now we use a copy of
> > image for these filesystems instead of symlink.
> 
> This version looks fine to me ... let's see what RP and the
> autobuilder can find :D

I'm ok with the patch and so is the autobuilder. Thanks for the
patience on this one, I think we ended up with a good patch.

Cheers,

Richard

