Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 87B50744AE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 09:26:27 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id t5-v6so1545289qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 02:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ro4bnAEIINt4qhGT1TnnfY8exFKv/yf9dWJ0l0QjmHs=;
	b=Zdiws4nsK9HMtxt4G5qP5lPI0anfM2zPisgYzRFQRlc2756NgtBW+sgIebriyCWe/4
	lUl6DWf0/NOzPthT9dIezkb9HDZD49y2aqy5DJQxtmXKkkilTpKw/76kZtsMSf9SEAoe
	5ZPdrt+HWYfQtqWLeUSJLMdJ4KlyoVW+Gs7I6GQpRd13peRkxWiVdcJf9zAv6u1Jev6E
	Ct14OIdKB4J5U3hM9/crAOKb10jZJejDIMZ0j8ieTTMDbtxZyg9hXnsu5sGrPPNZ4N2u
	j/1nPHJdwu+AvGXSMKEmnvKEfXlEFjNZQwDiOLngt2McbqNeNBSZISZIGgwZm4AagL0t
	myhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ro4bnAEIINt4qhGT1TnnfY8exFKv/yf9dWJ0l0QjmHs=;
	b=EnEFv2dxcWTrrNrAHZMrh7eT4Ob+SN2xUIbr0ZPGxJaZPnLUg5/oegEKYRCemnrC7j
	0I+trvQgBpocj3BVCtl4A2QZ3gGp0uuWRAzPmOmMBXDs7zVzgMwN63HOwFpAqp0aXc9V
	lvkDCTbmz3sOZo9LiGkf0UbhtlsY28WL3Y0OADTYMXgdSMY0B9LKrDcC2wy+unwc+OJY
	9XbBwVKB0UangTmKtRp2EEoGw8rIPVifX0wP8IDGUYQ8k+bItzRXxNRJfaM78df/rqjk
	i80ZXj79Abb4AMuPbNLZME92XN/EdZ07NtqPr9rdv4NDXB8ci7j+PONUr6bOthRD8aIc
	Gz9w==
X-Gm-Message-State: AOUpUlHs7n61qjqzNxQt8U4bQwm+EwIGzFCfQru7tom5OgzML/hPWfX0
	HTtNI4oK0gLMxO/E73kTOLbONkArB4YbvSRZFp8=
X-Google-Smtp-Source: AAOMgpdzU0ofN41L/36Jh0Z8gJW9WcImh37nvutCzPf3oRC3QvqdKWLVhprLCj2dr8F/c0HSx9uLDikrMPoUCeV1iMo=
X-Received: by 2002:ac8:25f1:: with SMTP id
	f46-v6mr1870291qtf.20.1533201988053; 
	Thu, 02 Aug 2018 02:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20180723190928.27368-1-raj.khem@gmail.com>
	<f8b662f7-28e8-9692-5cd7-36faadc6e45a@windriver.com>
	<CAMKF1spfo0rTE31BiCuYPZuR2GQ=U4i9LBGkQ_r3HQdZf4udsQ@mail.gmail.com>
	<084d0ef1bd4047859ed68d8e90d3321d@XBOX02.axis.com>
	<CAMKF1srwY--+D5fyj-TF-PYjbkvBTTjCPv=mVtZMim6vYHy8pg@mail.gmail.com>
	<fd53f53f0589472397e5657990e9e5d8@XBOX02.axis.com>
In-Reply-To: <fd53f53f0589472397e5657990e9e5d8@XBOX02.axis.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 02:26:01 -0700
Message-ID: <CAMKF1spLYWN8PSLriHLiOK4fHQpzHmBeqrngTNAFjXMwWNrW9w@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] defaultsetup.conf: Enable security flags+pie by default
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
X-List-Received-Date: Thu, 02 Aug 2018 09:26:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 31, 2018 at 2:17 PM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: Khem Raj <raj.khem@gmail.com>
> > Sent: den 27 juli 2018 23:27
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > Cc: ChenQi <Qi.Chen@windriver.com>; Patches and discussions about the
> > oe-core layer <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] defaultsetup.conf: Enable security
> > flags+pie by default
> >
> > On Fri, Jul 27, 2018 at 1:49 PM Peter Kjellerstedt
> > <peter.kjellerstedt@axis.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > <openembedded-
> > > > core-bounces@lists.openembedded.org> On Behalf Of Khem Raj
> > > > Sent: den 24 juli 2018 16:12
> > > > To: ChenQi <Qi.Chen@windriver.com>
> > > > Cc: Patches and discussions about the oe-core layer <openembedded-
> > > > core@lists.openembedded.org>
> > > > Subject: Re: [OE-core] [PATCH] defaultsetup.conf: Enable security
> > > > flags+pie by default
> > > >
> > > > On Tue, Jul 24, 2018 at 12:30 AM ChenQi <Qi.Chen@windriver.com>
> > wrote:
> > > > >
> > > > > Hi Khem,
> > > > >
> > > > > The comments in security-flags.inc also needs to be modified to
> > > > remove
> > > > > 'poky-lsb' info.
> > > > >
> > > > > I'd suggest we still put it into distro conf file (poky.conf)
> > instead
> > > > of
> > > > > defaultsetup.conf, because defaultsetup.conf is included by
> > > > > bitbake.conf. I think things in defaultsetup.conf should be
> > necessary
> > > > > default values to build things out. I don't think security flags
> > is
> > > > > necessary to build things out.
> > > >
> > > > this is the default setup, even non-poky users will get consistent
> > > > experience.
> > >
> > > I have to agree with Chen here. I think requiring security_flags.inc
> > from
> > > defaultsetup.conf is the wrong thing to do. We use security_flags.inc
> > in
> > > our setup, and I know how much trouble it has brought. To me, using
> > it
> > > should be a distro decision, not something that is enforced by the
> > use
> > > of bitbake.
> >
> > Thats fine, I can move this to poky distro settings, using it by
> > default would have
> > been in sync for all since reference distro is using it would be
> > easier for others when
> > submitting patches, as a phase 2 I was also thinking of defaulting to
> > hardeing in the toolchain itself
> > and remove this file completely that would have made it much better,
> > then folks who dont want hardeing could just disable
> > it in toolchain. but I am fine to leave it a distro decision for now.
>
> I do not think that relying on the toolchain to handle this is the
> right thing to do, given that some of us use external toolchains in
> addition to the toolchain from OE-Core... With the current setup we
> get roughly the same coverage regardless of which toolchain we use.

conversely,
external toolchains can then include unsecure-flags.inc or some such file
IMO we should provide best experience out of box for internal toolchain users
since thats all what we can do effectively. If we were to switch
defaults to use hardened flags
then it will be much better to have toolchains default to it and
thereby we can remove
many patches which we carry to inject these flags artificially in many
recipes confusing the
component build systems especially when dealing with PIE and PIC and
shared objects

