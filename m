Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2EF1678D9E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:10:32 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id c126-v6so1038877qkd.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 02:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bw0egJ8yujrO/LYbPKmBGd7M3I+lIOCOYhh/T8MVYXA=;
	b=oAAiRzmZ70eWGm4OdkZlmmpdbGPHOwAokVLQ8yjwd6KoKbkKLBC+Qv3EW6qJkUpM3X
	a5S4bu+uDOWh/lmoFvPzavIiiXbX65lYGMe1aSie/j54DvqdGjaCRvW5SLgpHEJqjATJ
	dHcz19SEr8uj8BgOLXBKxgXZauMpv0HlkOjH8sRRBLskl8cq5fc9/psbmTfKR14XLuZr
	GYZHuUd266IzDNSg2W/mxntQgBAysKRwaE4BClk4QN79lRih6ErOWas7nMRG5fGHalBF
	dqDpU3I5m9xyaiPxjvaWIkdSzb+xP5s6MGSADLVh1fUsbOD+Jjl5dlE4orO6R/g5U7qn
	l/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bw0egJ8yujrO/LYbPKmBGd7M3I+lIOCOYhh/T8MVYXA=;
	b=cdiqrY+C6D5EWtMptFgFycdqihlqgII9f6Ft6o8Z50YmsvWIi7kodpxrr7wgJSCwPb
	eyyeSv6eSRfP4d/3CKlAtftBx2DZzVilw2rugjJNlGDMAVA42Z/yjtgXpCZ07XMAOswN
	kpH+7jC2nk0nJ2P8xZziWeh5T+oYoLa9FZy69j1zPJ6oibHAtF2KdT1umPWZJMfAt2mD
	IqTohdt3VILIr1z8vB64gu7R2tX3003GgVZelBWxdWy23zijpubDODmPT6vv1jxkTOFg
	9C3x5ZNTANXJHevTyRhqCrozx2QKEDBuUuzwyFDbk43S7WTpH8ri4B3d7WX4mOCsiprJ
	W3ig==
X-Gm-Message-State: AOUpUlFt/gCWwhDURKdoLvYlZ/XUBwA43p7Vyfv78mr8/3Enx5KlHJbX
	ruBrjzL0WFdSq8XR2oMmQmH+YjPvLiXE1iH999ZJVg==
X-Google-Smtp-Source: AAOMgpeHLERvWPaFiiMF3TDTyeSGbNNCTATSzmQOaY3UOBQopabH4IvqPeKgc1z3cJn3zTXATexEwtQvs4DcllWCQb0=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr1579256qke.12.1533201032819; 
	Thu, 02 Aug 2018 02:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180802071149.19272-1-raj.khem@gmail.com>
	<CAJ86T=U1A=NLC+oPZtB89Ckcjx9yMUrQfPHCo=Z4uBVc01zvYA@mail.gmail.com>
In-Reply-To: <CAJ86T=U1A=NLC+oPZtB89Ckcjx9yMUrQfPHCo=Z4uBVc01zvYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 02:10:06 -0700
Message-ID: <CAMKF1sostF71Wms49UQzfN803+Tpw5QGy+PzEMj4UbKywq-6fg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Thu, 02 Aug 2018 09:10:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 2, 2018 at 12:47 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Aug 2, 2018 at 12:11 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > fix internal linux headers
> >
> > Full logs
> > https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8
>
> From the musl commit which fixed the dirent struct alignment issues it
> doesn't look like it was armv5te specific, so mentioning armv5te in
> the commit message could be misleading.
>
>   https://git.musl-libc.org/cgit/musl/commit/?id=b3fa0f2b1b8c267c1cbe8c62464e484f3a174a4e
>

commit is in contextual to OE on a particular arch where it was
observed, other arches either have
ways to compensate for misaligned access in hardware or compiler does
not use 8byte alignment
 thats why subject says 'seen'

> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
> > index b56870cb3f..e7d0e1a66b 100644
> > --- a/meta/recipes-core/musl/musl_git.bb
> > +++ b/meta/recipes-core/musl/musl_git.bb
> > @@ -3,7 +3,7 @@
> >
> >  require musl.inc
> >
> > -SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
> > +SRCREV = "f2c6dbe2442027ed8fe0fa869918e41f495534d8"
> >
> >  PV = "1.1.19+git${SRCPV}"
> >
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

