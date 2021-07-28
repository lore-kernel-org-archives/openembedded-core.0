Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.1911.1627512172948183839
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 15:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZUXFXRgG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id u15-20020a05600c19cfb02902501bdb23cdso5492209wmq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 15:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RZtmO/EiGuBVxC2+CF09bfECzff1w0eQkK6Y+SVtAow=;
        b=ZUXFXRgGvWUvR0YsrOoNACTqWN69bt9+N1kcNUKjbRemqfTQx/I6W/ViVbmoFNAEmq
         CdJKzXlIGzEgLgQjy0J/A1Zfu+LXqhB79E+r1yTQDDRoOqWLSNfJLH8rTET8U6H/Pv2c
         N4Wx/HJ+6YAUTZiOUdWxc451I5e0J4KtVOSEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RZtmO/EiGuBVxC2+CF09bfECzff1w0eQkK6Y+SVtAow=;
        b=oRiS6NYYyXjQZfzxVMr2yi6R/Ko4m7OfeBL5N1zPd3m3pb1ke1dOLFIuhJuOtQ//HI
         8ySJj+NKcBfzx3qw4eF6nlJXD1rudqXc6VoN19E93WgIv5OjEFazhH9nb2xA9k6UBSWa
         N2Po6FtwHcihfOSbbvZWrJQ7ZIkv/KQqWtVHX/8s/Wl9k99Ztg1jTXCMaYCyM9641rCs
         JXM/y7lLmpgtmdiub45STV0NTdsob/wv9gY1k98MWrPMbXm3MAPsPq5w0FgiBGNjFhax
         zmYvE2GraYgBH0KKI/T74Kle4qw6EE/ndnXpJ+M7TPkJQUXKV+cIcjVfkQSp+A6k43db
         C3vw==
X-Gm-Message-State: AOAM531kyDZG4HeEAgJ90iBI+kyRXxBv5xbYHi/dqNdNPiTNK+tGzHHD
	kGyL2+zIToptSIkanc+MnavE8A==
X-Google-Smtp-Source: ABdhPJzg0rQgyLhc7GegYLcr0qrR/HJaSYRaVKkI6YedEaSVnfUnaQ8JP8NW3ZN26exdnrpOXsACiQ==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr1744557wmj.120.1627512171134;
        Wed, 28 Jul 2021 15:42:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:89c8:a51f:1301:604b? ([2001:8b0:aba:5f3c:89c8:a51f:1301:604b])
        by smtp.gmail.com with ESMTPSA id w185sm7912578wmb.11.2021.07.28.15.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 15:42:50 -0700 (PDT)
Message-ID: <7f0566054694826b4eb3d77953ea5638c13c16db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] meta: Manual override fixes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jul 2021 23:42:47 +0100
In-Reply-To: <169611A4DF65986F.13113@lists.openembedded.org>
References: <20210728141506.3287158-1-richard.purdie@linuxfoundation.org>
	 <20210728141506.3287158-3-richard.purdie@linuxfoundation.org>
	 <CAJ86T=UNcf=Tzj4hq2uwXJzmtio71YZExLsr6zqOZr-ZAq9trQ@mail.gmail.com>
	 <16960CD0F3F5D3AD.12099@lists.openembedded.org>
	 <ca0a10a951237a41cda24eefa7300ea646f98c23.camel@linuxfoundation.org>
	 <CAJ86T=WsJFYMYYuu9x4rrh+MfWufpmg2NWQk0rhuL0PS7626hw@mail.gmail.com>
	 <51bf429c4259da7c57c70d28661c16d0ef68285d.camel@linuxfoundation.org>
	 <CAJ86T=WoknfuEhtgS3dOL=Xz1jsjPCViU5jXSTy703vK9cijCg@mail.gmail.com>
	 <169611A4DF65986F.13113@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-07-28 at 22:28 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2021-07-28 at 14:21 -0700, Andre McCurdy wrote:
> > On Wed, Jul 28, 2021 at 1:54 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > On Wed, 2021-07-28 at 13:43 -0700, Andre McCurdy wrote:
> > > 
> > > > Since the script will be reused many times for many private layers I'd
> > > > say making it as robust as possible is a worthy goal.
> > > 
> > > Well, sure. I have spent days on it and improved it several times over compared
> > > to what it did do. I have it working for 10,000 cases in OE-Core with around 40
> > > exceptions which I didn't think was too bad. I felt I'd reached the point of
> > > diminishing returns with it. As with most things, we can improve it and patches
> > > are welcome.
> > 
> > Unfortunately those most affected by shortcomings in the script are
> > probably also those least likely to submit patches for it. Just as
> > those most affected by the new recipe syntax were probably not reading
> > oe-arch when you proposed the change and asked for feedback. They will
> > instead find out about it months or years from now when they discover
> > their meta layers don't work when they try using a new release of OE.
> > At that point a lot of them will just shug and keep on using 3.1
> > LTS...
> > 
> > > I'm more worried that the patterns of metadata in the wild may be quite different
> > > to what we've trained the script with in OE-Core too, that may be a much more
> > > important issue.
> > 
> > Yes, that's a concern too. Looking at the script now it seems to be
> > mostly a long list of exceptions. The chances of it working well on
> > layers you haven't considered don't look too good.
> 
> I'm not sure that is entirely true/fair. The bulk of the exceptions are for 
> python function/variable names and OE-Core and bitbake itself have a much 
> higher fraction of code like that than most layers do.
> 
> I am interested in real world feedback on layers people can test it against
> though to see how much of an issue that really is.
> 
> The goal here isn't 100% perfect automated conversion (in which case bitbake 
> could just markup things internally) but to help people convert layers with
> minimal pain.

I've rewritten the regex in the conversion script to account for this and have 
tested it on a subset of metdata, so far so good. I'll have to run more tests 
tomorrow to reconvert other layers and validate the output is the same. The 
updated script and patches are in master-next.

Cheers,

Richard

