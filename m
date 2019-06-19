Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0E8437D710
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:30:15 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id s7so39018530iob.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=N5WfVwwlKH+ADBVmzM8aIoQ5Rktyk6ZN+YWTS01h7Fg=;
	b=t5dk0h91vJAucPWYyAtc6v7Yk4hIMYzF4Y3bZGlhjJYGONiMvOZWsXsXUqNzsi+HRZ
	e3Y2pSI8hJJUJiGoz1zeIxkzTm33JwlCM0ZguVIYiJ/xQgQSEAan5sR97cmL9K6JTmYy
	KVVZL2ZKQsZowvnh7AgiQyoH09XWD9ztq+J7PYw0uKrMXn+QcIr4yQiief4FD24oHVSG
	usbD+ydzqNDsASM/yHVVX5FcLiCQ0Cq+jBsPN/2xT3uc16ybHUeUZ4OwsI4QdvPmRUpc
	IUJlfgv6JrDromMe88aOl2XtPhPWLlvYwSTwRD1ANsH6vICTYw9l5zZlm4KVSvR+1ISG
	gRlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=N5WfVwwlKH+ADBVmzM8aIoQ5Rktyk6ZN+YWTS01h7Fg=;
	b=o9KG3xQbqlHKFc5f1QqfDXbldxdYRUHlpkH8q44g0sFEPHMruXD9Pw50SU9r6CIWrD
	G4sBJIctxqrPCSiGNjG3tMyHORKAMPVbdztKwpYlD8pqdTefIkRuBMNSAxtaTdvAxaLh
	v1SOJJFbBFpmbGswmxtPgyfWaDNkjRrnmnTVq5EI8ENRWm57LnBb3jrq77SaXNXrqQvW
	ck3odD/laQmLOyc8F/UedYNcctCm1AyxbjeGi3Cw/cUaLYGHeqymXiUGTG3Cng8sSVY4
	FxQv1lOsfnzSQCLYhTnzsL4I/vjSRLnZDYc+7bXuJ7F6XjtWENf4antkjUdmtSvlZK8b
	jjZQ==
X-Gm-Message-State: APjAAAUEX2x1K3QTRQVp3Nvjkfzfj8Cb1v3jnyLf/YEV1p35YvUMk4+a
	R0m84AquBZvQcawt3EYTsOJduRhI8/OqYLaGisY=
X-Google-Smtp-Source: APXvYqze2JeroSjJqphxhP3J4VxcL1XPHTQFBPGQHQZQgbsBY6HademE1c3qGWjI1Gk1Bz05t0auehWWOEOhfQNOAYw=
X-Received: by 2002:a5e:c705:: with SMTP id f5mr15997665iop.113.1560958216957; 
	Wed, 19 Jun 2019 08:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <1509637698-17399-1-git-send-email-ayoub.zaki@embexus.com>
	<f1aeb71da144e3cf77b9f1c1e402bb0f5f71e847.camel@gmail.com>
	<CAMKF1spZojFkRCEqOE-RLkYpeTuub9O3i9OWg9sQpV19zjv+Xw@mail.gmail.com>
	<615d805a254f145c076ef586e4aaead67f689e97.camel@linuxfoundation.org>
	<2cd9ca60d5b70de9ed931d57cffca652d16bc984.camel@gmail.com>
	<CAO5Uq5QK8+bF812AF4o-AG+sOMb4E51Wj88CoLWL4jSccLdy6A@mail.gmail.com>
	<2964bfd2c8101f0497faf7c4de54b78172b5631d.camel@gmail.com>
	<18e05da8a22ebe92979079187d1782413195cef4.camel@linuxfoundation.org>
In-Reply-To: <18e05da8a22ebe92979079187d1782413195cef4.camel@linuxfoundation.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 19 Jun 2019 16:30:05 +0100
Message-ID: <CAO5Uq5R2D9g-+nikuMbrWbWYWBE51E=VLBPWtXvCQkJU4eHPfw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ayoub Zaki <ayoub.zaki@embexus.com>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe,v2] kernel-fitimage: introduce FIT_HASH_ALG
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2019 15:30:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 19, 2019 at 3:51 PM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-06-19 at 10:14 +0100, Luca Boccassi wrote:
> > On Wed, 2019-06-19 at 10:06 +0100, Alex Kiernan wrote:
> > > On Wed, Jun 19, 2019 at 9:48 AM Luca Boccassi <
> > > luca.boccassi@gmail.com
> > > >
> > > > Thanks Richard - in case it helps, we've been using this patch
> > > > for a few months at $work (on top of sumo) and it seems to work
> > > > fine.
> > > >
> > >
> > > I expect that's true for everyone touching stuff in this class - it
> > > works fine for them... the problem is everyone else, since it's
> > > terribly fragile and has no tests.
> > >
> > > I'd not be at all surprised if changing the default from sha1 to
> > > sha256 doesn't break someone.
> >
> > Keeping the default to sha1 would be fine by me, it's the ability to
> > configure it that is useful.
>
> Its merged and it probably makes sense to change the default, I just
> continue to worry about how we can test this class and make sure the
> commonly used workflows continue to work...
>

I've a bunch of stuff I need to get out of the door at the moment, but
once that's out of the way, I'm going to see if I can get qemu +
U-Boot + FIT image as part of a test image as a starting point.

-- 
Alex Kiernan

