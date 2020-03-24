Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.42.1585089449071924373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 15:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VW1X3T4d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id z18so401033wmk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 15:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uL430i7VgA4hVP9HEkKJ+R+fEGJCT62Fnac7aghHoXU=;
        b=VW1X3T4dGn5Fh+soFp93H4wKkJywYXRukDJ4Ami6PIL1JznXOuYEg9P+rwVjxJtVJl
         JqjmazptsEs1I9SZfQKdcB9uPvm0SQqpfMt1JSqYHvnL3GMoNoX2x2w1WbBQM+H9m5nK
         S5YHqsuHSCwj9VNziFsZJHsDx17u8du4fQxtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uL430i7VgA4hVP9HEkKJ+R+fEGJCT62Fnac7aghHoXU=;
        b=Jg4eVLDkRYZRz6/IYcOLuw1I+SVb1viT3lLGtIM77M0xsjV15MapIWROf3lHqUhpdN
         cjjfV96/4iMU3fIHUX9iwOc7MZS+aq+tGSFNplfITlBpWgMeE+IStFTtVP2xsMp/wU0H
         SIyOHkhwM4avv59pXtHHB7QsRDp8SmkXAgHsrodMib5O+ic0flL9Nv/Ropo6bbL3jzJp
         9yqRMSxU+I21WnmK/uyYknawlVyzFZ1QBW5FJ1phsosUhalfN0FXyaVpTcw2Xzz8wpdm
         JA1AWNscxN3Vr9688bqrBLMuU2SSt+FwCI2aAv8b+PbKb8OknqYqL4NAa4YISFIy0j8r
         vqGg==
X-Gm-Message-State: ANhLgQ3nzmNJCNG7yGfg0zFsjtM3zW44T1QLpR3DeIRNkTP09DJTPzZH
	NTacjokP2DmOnkKOaEem9PFWog==
X-Google-Smtp-Source: ADFU+vu/BtMpYJpWfQuauiwsFhvZ29W7BJcByNz2sb+NnXX9b14mUAw19o+PdaAskQpjF3b1Qxnfxg==
X-Received: by 2002:a1c:668a:: with SMTP id a132mr269058wmc.126.1585089447438;
        Tue, 24 Mar 2020 15:37:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r16sm20242451wrv.33.2020.03.24.15.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 15:37:26 -0700 (PDT)
Message-ID: <432926cd77d331fd98b7956c2394a447e9e4642c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Michael Halstead
	 <mhalstead@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 22:37:25 +0000
In-Reply-To: <20200324221231.GB1578@denix.org>
References: <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
	 <20200324175821.GW1578@denix.org>
	 <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
	 <20200324181234.GX1578@denix.org>
	 <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
	 <15FF5122E920BDAA.24006@lists.openembedded.org>
	 <20200324184323.GZ1578@denix.org>
	 <467110132be087c26851033a7b9e45972b5c0bd4.camel@linuxfoundation.org>
	 <20200324193222.GA1578@denix.org>
	 <fe9b411737f87754311de2c607656b8ac74aee86.camel@linuxfoundation.org>
	 <20200324221231.GB1578@denix.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 18:12 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2020 at 07:57:27PM +0000, Richard Purdie wrote:
> > On Tue, 2020-03-24 at 15:32 -0400, Denys Dmytriyenko wrote:
> > > On Tue, Mar 24, 2020 at 07:29:42PM +0000, Richard Purdie wrote:
> > > > On Tue, 2020-03-24 at 14:43 -0400, Denys Dmytriyenko wrote:
> > > > > On Tue, Mar 24, 2020 at 02:33:19PM -0400, Denys Dmytriyenko
> > > > > wrote:
> > > > > > Richard,
> > > > > > 
> > > > > > Yes, yes, I understanf all that from a technical
> > > > > > perspective
> > > > > > and
> > > > > > agree with 
> > > > > > it, but I was thinking about a more clear definition of
> > > > > > this
> > > > > > policy
> > > > > > to be able 
> > > > > > to point anyone having such questions in the future...
> > > > > 
> > > > > BTW, I don't remember discussing this at YP TSC... Maybe OE
> > > > > TSC
> > > > > covered this in the past?
> > > > 
> > > > Metadata architecture decision would be the OE TSC and "TSC
> > > > discussion
> > > > long ago" means something from several years ago.
> > > 
> > > Thought so - were there any meeting minutes from back then? Sorry
> > > for
> > > being so 
> > > persistent, just trying to find some paper trail... :)
> > 
> > Yes, there is a record. You can find it quite easily. I don't need
> > to
> > do this for you...
> 
> All I could find is OE TSC minutes from 7 May 2013 referring to some
> related 
> list discussion:
> 
> https://lists.openembedded.org/g/tsc/message/369?p=,,,20,0,0,0::Created,,PACKAGECONFIG,20,2,0,72188707
> 
> (9:47:21 AM) RP: bluelightning: I think this was to PACKAGECONFIG
> more recipes
> (9:47:28 AM) bluelightning: ah ok
> (9:47:36 AM) RP: bluelightning: remove the need to bbappend, have
> people set mode config options
> (9:47:51 AM) bluelightning: and PACKAGECONFIG to enable deps on
> things
> outside OE-Core as well presumably
> (9:48:01 AM) bluelightning: (as discussed on the ml a few weeks ago)
> (9:48:06 AM) fray: yup

Well found. There is clearly more context behind that even back then.

> I spent last couple hours digging through my archives of
> openembedded-core and 
> openembedded-devel lists around that time (Spring 2013), but besides
> general move to enable PACKAGECONFIG in recipes, I didn't see
> anything specific about crossing layer boundaries by PACKAGECONFIG
> dependencies, unfortunately. And it was a wild time - all the energy,
> extra activity, conflicts, flamewars - that definitely brought up
> some memories re-reading those discussions again... :)

:)

I'm sure this has been discussed, I just don't remember where/when
unfortunately.

I do believe the conclusion is right though and I believe there is
enough general acceptance we can document it as such. If anyone
objects, the TSC can discuss it but I'm not seeing that being requested
unless there is more context to this discussion than I'm seeing.

Cheers,

Richard

