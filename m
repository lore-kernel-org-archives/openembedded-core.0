Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3595.1616580221451547675
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 03:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XO8MrYMy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id x7so1324797wrw.10
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MiUPakiWtfp0TQMccNX9q6QAfDW+26VZ/BJMoEnF+28=;
        b=XO8MrYMym6XjxuFoeS2Z93SMv5M1L+rrr3u63NbGYHqExJ7tlMvA9w0zXBagwW3lT1
         Vf1356iYEK+9oI9GvhkqSUlkjv+upNmVHQ519QQjbGGzHzGMaqADH1Oc8JV+MAwwLO/y
         m9bHAZ4lD1MHiU2ppxRnwbRmTYhGeGnx9Fw58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MiUPakiWtfp0TQMccNX9q6QAfDW+26VZ/BJMoEnF+28=;
        b=jzymLntN0N6ecLBhp6WCqfSW7DrTd806NT+q2uP6b67aTwnyv+NbjXGYTVF79obx1H
         D7NZBlQtuz40q0Y7ygerGptgwjiNqh3QWBfMjZqCb6RF21LAztKHAVI5cBhUrExokmK/
         nAwp5lGUrocDMkJ1u52uiJjDRsSFrgBG0/xUFTJkJ12VDfJ6wYXswoU0zeBAtEcQ9lqN
         KQKBsfXnaKxItWvJ/HGLyVyphpXXt7dOXfW4n0prCiKenBX/M2fglc30FPHkolDtplkL
         C98dL433F0BvfoLGug7ZlQwRJ0KyER+acwjYVPKAKPCkqayiIy6CyuQjbvRVNvzMundu
         mUkA==
X-Gm-Message-State: AOAM53137z8wFLSRhmPxL2ByIe3UOcZaRBN27xBfz//Sm1gIvcBJ5iPO
	XCF5Lmxoa7l5XIDFpxWvSMiF+w==
X-Google-Smtp-Source: ABdhPJxTluSN1PPaEG5JlMlXILBD04EZhomekQbfIo6kura2VqMMfpXOT/2k8TZ4HndDMAd763p0HQ==
X-Received: by 2002:adf:f704:: with SMTP id r4mr2590924wrp.158.1616580219595;
        Wed, 24 Mar 2021 03:03:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id j136sm1804053wmj.35.2021.03.24.03.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 03:03:39 -0700 (PDT)
Message-ID: <14daafd3010c1a9ae44b5ccf26f25f890c7bb070.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-firmware: Fix packaging
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Trensch <MTrensch@hilscher.com>, Steve Sakoman
 <steve@sakoman.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Mar 2021 10:03:36 +0000
In-Reply-To: <75139c05-c7b2-9318-d126-61a163891320@hilscher.com>
References: <6409e1bf-9400-886e-cd25-76b52456c8ed@hilscher.com>
	 <5dcf9ff95e74274d5cebcfe34a0c9de4ce9e886e.camel@linuxfoundation.org>
	 <168e0cb1-582c-8c14-b394-d23f1119178a@hilscher.com>
	 <CAOSpxdZxridvyrtK+Zc2pzjVbNM99nsVbAWKN05uU5Ur7R542Q@mail.gmail.com>
	 <2fc095ba-4858-58d4-ad2f-3436af3cea5d@hilscher.com>
	 <75139c05-c7b2-9318-d126-61a163891320@hilscher.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-03-24 at 05:41 +0000, Michael Trensch wrote:
> 
> On 16.03.2021 21:24, Michael Trensch wrote:
> > > Actually it doesn't apply to dunfell either (dunfell and master are
> > > both at version 20210208)
> > > 
> > > So best to submit for master and I will cherry-pick to dunfell.
> > > 
> > > Thanks for fixing this!
> > > 
> > > Steve
> > 
> > I think it broke somehow when transferring it to Thunderbird for mailing
> > it. I cannot directly access our mail server via SMTP/"git send-email" so I
> > took a detour via Thunderbird and exchange. Probably this broke the patch, as my
> > local patch file still applies on both (dunfell and master).
> > 
> > Sorry for the confusion / additional work.
> > 
> 
> I did resend it as Patch V2 (https://lists.openembedded.org/g/openembedded-core/message/149586)
> Hope that it is working ok now, at least it does apply for me now, when directly copied from the list / web interface.

Second version applied fine and was merged, thanks!

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=8693591a3575a9af2682c8ca6a7269d2e3f1a19f

Cheers,

Richard

