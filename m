Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web09.1266.1607654935557940517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 18:48:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EIlJOn6L;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id s6so3559491qvn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 18:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ErGB9cCpoFMrQsYWt6ti+hg7Q26o+/aXcVznsxyV1GY=;
        b=EIlJOn6LRCarfO8tjjdR91TpDkXgj2xdtxekwt4tUIgHHZ3HeuFqiRqY4LBmswIrnS
         dF0r4l/9lioLoSklCjh+UFRrxqiTFj5ZzQIdM74rsCtrQyuTP/SajKM3iphOywZX2f9Q
         cs55j9gmu9iHzKgcvfFrLibtcz9yfVS6+95gmF3K9UaJvFCXpQbD36tiXK0EtiKW42Vs
         /6hFi8UH6uOsO8LCUi63Kam8S+nhyk9nRRMD/lsq4hLFdHHJrurHx5qTANBpUWgOo86x
         HeRPwnxD2UEFisuRAcdjqYRZxkMvGjpINtrPp26TqbK2um6QdEQxA/vytPpfKae+N0v1
         AZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ErGB9cCpoFMrQsYWt6ti+hg7Q26o+/aXcVznsxyV1GY=;
        b=fWqzhl2OURBh28I38c7ryDRqDN0ODwf+lMkuZeCXcacNeG0dEGG53ukQFoM26pOo3C
         2xZVFAZqH2tqIFX+d7xX0asXl465ool+9ABNAKWMP0IZ74hOr5vUZ3Tlj6Xnvx+RSjBO
         NL0nE7Mj5GgyW3k2PiwWwMWFtKST3uu4X1hxlvz+Nja4yxMUQTDNDv2ba7OS8muydvT8
         68wgYu4YmsymIz7EAdfJXRowuEazxpyH4dCifRfETVM+XZvFvcOHB2DTPHgm/HC4DfBJ
         Xeug0SBeqxETYGkTT27+CUni0nQ7AJCEtlQqq8K11HuHI8xJje2eB6THsEuWxDaMm6kC
         vzMQ==
X-Gm-Message-State: AOAM5308yXrPnngT5BxltVrSiSblCbKdkRwVAwIKxapHikqZ1GU+Q3+7
	flJ/s6q8YU7cX9fVCWvV/IIDEXv7v6o7gg==
X-Google-Smtp-Source: ABdhPJzyTm2u/qosk4s460oQ9xHy0g7DJSELXeQuuIZ1O+TlDK0z8oStfZbskvNPHj5c748KqirRvA==
X-Received: by 2002:a0c:b505:: with SMTP id d5mr12826322qve.59.1607654934473;
        Thu, 10 Dec 2020 18:48:54 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id n3sm5330850qtp.72.2020.12.10.18.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 18:48:53 -0800 (PST)
Date: Thu, 10 Dec 2020 21:48:50 -0500
From: "Trevor Woerner" <twoerner@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa.inc: add dispmanx support
Message-ID: <20201211024850.GA25551@localhost>
References: <20201203133526.2075-1-twoerner@gmail.com>
 <036904F4-E7CE-4A5D-B940-DF360F2AAED9@pbcl.net>
 <CAHUNapRs_1Dz6ARBfgLk7i3DXx0HHbRgC5u7U=3njQb3ht4cbw@mail.gmail.com>
 <20201204105141.GU30831@pbcl.net>
MIME-Version: 1.0
In-Reply-To: <20201204105141.GU30831@pbcl.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri 2020-12-04 @ 11:51:41 AM, Phil Blundell wrote:
> On Thu, Dec 03, 2020 at 05:35:23PM -0500, Trevor Woerner wrote:
> > On Thu, Dec 3, 2020 at 5:25 PM Phil Blundell <pb@pbcl.net> wrote:
> > 
> > > If we're talking about OpenGLES applications, wouldn't you already have
> > > opengl in DISTRO_FEATURES?
> > >
> > 
> > Not necessarily.
> > 
> > Adding opengl to DISTRO_FEATURES really means "enable a bunch of
> > PACKAGECONFIGs all over the place because I need x11 and mesa with all the
> > bells and whistles".
> 
> It sounds like there are a few things that have gone wrong here then.
> Firstly, "opengl" in DISTRO_FEATURES isn't supposed to imply anything
> about x11.  If it does, that's just a bug. 

I have this bad habit of saying something specific when I actually mean to use
something as an example, sorry. I meant to say "if, for example, i'm building
an image for x11, and want opengl support…". As far as I can tell enabling
opengl in DISTRO_FEATURES doesn't imply x11 in any way, sorry :-)

> It should indeed enable opengl
> support in other recipes, though.  Can you give an example of the sort
> of thing that's getting enabled there that you don't want?

I am seeing an issue, but after quite a bit of testing and checking, I now
realize that the issue I was seeing is because of something a BSP layer is
doing and is not related to anything in core.

> But secondly, thinking about it again, there's no reason for mesa itself
> to require opengl in DISTRO_FEATURES anyway.  Mesa itself is what provides
> the GL API so it clearly doesn't depend on it.  I think that existing
> DISTRO_FEATURE check in mesa is just bogus and should be removed entirely.

Excellent, I agree.

If I understand it correctly, mesa can PROVIDE more than just the GL
interface; it can, for example, PROVIDE gbm which is useful for situations
where GL is provided via a binary (such as in my case with Raspberry Pi's
userland).

I'll send a patch.

Best regards,
	Trevor
