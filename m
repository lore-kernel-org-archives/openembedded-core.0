Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 416DE7C0F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:31:49 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t33so22430342qtt.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zQVKU4dsN5CyN8o8/i8FZiNZFPbLV2j8QQU+7RjWAM0=;
	b=czyGvBzMf75A4/ciKiaysx6V/pzHZ7xmrFOAbJWQGaRp6GGY1lPnBDOesf9SJvrdnU
	g2Eppo8NYiSfdTLhy8G8aIZJvDquXu+zfL5rdi4MquRyhV4Z3fThSYDc6WHLLAsIHOml
	PQiUOjlTwEpX8Q4SzUR74sPXHhavqM6tA9C6tJRrdzMR6+qI+na+pBmnnHEDHyWGTp0p
	/yvCXMKDWceVTPRmPfV6KCv7ifs97LcZDmlsq1hX+puYR6DF7uEeZPUrr8ZYjdUrCb6k
	d7eVOv7pKR+/OMUDEjofVZS9VCx9nqjwo9oCn6xmOeh7WL9O3bvi6FoOCFn2M5GUUmZS
	ZwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zQVKU4dsN5CyN8o8/i8FZiNZFPbLV2j8QQU+7RjWAM0=;
	b=tBT56r5n648prWWXMMb+aUXbZe6ViVyKWoIl8+o0lH1HYUySL8lFIYVRmTNO3lbWlZ
	OHEIBa3WXUpLN7kicM5Itvipq/wQOK/hoObjF2xjAq0k4LMNKPDo8hpZzNR5OoGWxl//
	ZlmDXTPzAm4uRn/ImxFkWA8i5t2OXAsmeKGX1mla9w/dS4Cc+F3K6TVMEG2cW6MADZgs
	5ohEmJsI5X+HxZD/E1ns3b7iJ2DZXywTUtpqgqq2HGoESmg/lhQhrcUXSNBLWxI2nXY/
	Cz83V10I965c9sgJfp49ubuKQ6NFgjO7t5UiLbZgIqc8kzNXV1CahfdFO8YGgcrWgbNz
	+ezw==
X-Gm-Message-State: AJcUukdJYJd3kImC4tblfFR85QBVzXgavLVG2Fg5cFp+N755WyiZGUDF
	ZzICNU9PA+vS2VJJQ5qkcU6HDiBMrYzG6uvJsvE=
X-Google-Smtp-Source: ALg8bN6hSlsib/lNPoYEVqgeXuFvA1OEIb2NUJVUlQ6qJL8DTr7TNUTkASbkPosBzu4KT/ccQdpU4KtFrXW9+19oAT0=
X-Received: by 2002:aed:3a22:: with SMTP id n31mr18360742qte.29.1547317910111; 
	Sat, 12 Jan 2019 10:31:50 -0800 (PST)
MIME-Version: 1.0
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
	<1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
	<beceefd10bc3ba906df62abee76ecd76c80c496d.camel@linuxfoundation.org>
	<018b5b2d-c7d4-3c29-d743-73c5e5651f5a@gmail.com>
	<7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
In-Reply-To: <7b3f3c28cc4b1f0c8eb20a84f18cf0786cdba2ca.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jan 2019 10:31:24 -0800
Message-ID: <CAMKF1so9Aa8xjLoJMW8Sdv28PPuQ758zXCq585+5j6pFQ6o5fQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libgpg-error: Support build for native on ppc host
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
X-List-Received-Date: Sat, 12 Jan 2019 18:31:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 12, 2019 at 8:22 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2019-01-12 at 17:56 +0200, Serhey Popovych wrote:
> > Richard Purdie wrote:
> > > On Sat, 2019-01-12 at 12:11 +0200, Serhey Popovych wrote:
> > > > In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit while
> > > > kernel
> > > > selected by the installer depending on PowerPC machine type:
> > > >
> > > >   * 32-bit for PowerMac G4 (ppc7400) and below
> > > >   * 64-bit for PowerMac G5 and above
> > > >
> > > > Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit
> > > > userspace
> > > > making build impossible due to missing some of lib64 multilib
> > > > equivalents in Ubuntu repository.
> > > >
> > > > Using setarch(8) override to make whole host look as PowerPC 32-
> > > > bit
> > > > can actually help with build but requires mapping for ppc target
> > > > to
> > > > their libgpg-error equivalent to fix native build.
> > > >
> > > > Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with
> > > > command:
> > > >
> > > >   MACHINE=qemuppc setarch ppc bitbake core-image-full-cmdline
> > > >
> > > > Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
> > > > ---
> > > >  meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/meta/recipes-support/libgpg-error/libgpg-
> > > > error_1.33.bb
> > > > b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > index 325529d..4153954 100644
> > > > --- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
> > > > @@ -47,6 +47,7 @@ do_compile_prepend() {
> > > >     mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
> > > >     mips*)      TUPLE=mips-unknown-linux-gnu ;;
> > > >     x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
> > > > +   ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
> > > >     ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
> > > >     ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
> > > >     *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
> > >
> > > This doesn't feel correct. It only works if you're using the local
> > > setarch workaround and I'm worried most users are never going to
> > > find
> > > that.
> > >
> > > I'm fine with adding in general fixes but this is getting very
> > > specific
> > > to an very uncommon usecase :(
> >
> > Understand your position. Doing setarch(8) to run bitbake on ppc64
> > kernel with 32-bit user space with missing 64-bit multilib seems to
> > be the only option.
> >
> > Anyway this change just maps ppc to corresponding tuple used by
> > libgpg-error, so with this fix we hit both
> >
> >   a) setarch(1) when kernel is 64-bit and userspace is 32-bit and
> >      no multilib
> >   b) native 32-bit powerpc host that is running as virtual machine
> > for
> >      example).
>
> I'd understand that if this were just libgpg-error-native but our
> qemuppc builds work which I guess is why I don't quite understand what
> is wrong here?

this is when using ppc32 as build host :)

>
> Cheers,
>
> Richard
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

