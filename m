Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC967E78C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:11:29 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id y13so12075657lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SlFmlffIBSQHCUszXoQ04dlRT6UFYihsNFlzGgZRw+o=;
	b=b3gNes+BDqmlqegAW1jjuTKd4oUOyFNJKEUcnHSzhesBVg+XrZnQfcfWsb4NVG5/bn
	8c4jPqqbVoSF+LvOM5NdR0yrW9JoQ0aQZq58H+ECzc5wskIzjvefLesWFfkdCJ0s0zro
	RRDOxBBVlNxdAKG6m3IPh/CHwz7z+pN4TQ87MIU3Yr025/f8bjUhRey+mij6Xfmp5lUb
	BfirxIHP3mVwOgJDJT39V+i9WkmjEem4Vf+2zt4XXYubqE/DONdbb2e/wE+6Hb2SHXyv
	wsuflIGi9VfylnbMt+305/pCL7v9gXQ2bQ35PpHGDzHaa7mZbHjS6MFJrS3jO+juJI6Q
	wxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SlFmlffIBSQHCUszXoQ04dlRT6UFYihsNFlzGgZRw+o=;
	b=TyW7jwMqqJ+Q4uLtw0FM1e+8Cj11FGDfLyALOT/FAIEHjICi/vF8SD3lJ3crqQPUOu
	tMsApxh17Z6K2vdgYKlCxvwIyC/1GjiBgkmCfQYfsSk5iNeCH42xGeDyC7N9mmRcUhDE
	i1LeVmBArqdtA9ZU89Gak65ng3MoP30sc1xhqDCJ/wnaZTkG2iQJ6vDU70C3UN8WmfMy
	rOr71KBITVFEF4z0/n6KjVBRLKlCOmx5OQya65vhHXrEVhgIvGYEvs/GQ960YDFYCKYk
	8ybHrzCrdDc9xUbHJ8FBXvxszgfFrKCGHLlgC5JmmhF8sACMtRxLv/cUsFWgp9Wte1o4
	xlzA==
X-Gm-Message-State: APjAAAW48O+4x2MNyIRGI81gMxxePf484CgflDLM48Z9PvToClThkmf1
	XUus7RxJfdFQyi5uGJGzbZGMpZVnV1QVKbttBMs=
X-Google-Smtp-Source: APXvYqwEvUm98f2PnreXkonjstItjI5iiujMRwRJihrfOJg6LfGr1z+9vWegummLrlBrs81y/qhEMI30j1/zyx0PnHc=
X-Received: by 2002:ac2:50cd:: with SMTP id h13mr25517015lfm.36.1560949889918; 
	Wed, 19 Jun 2019 06:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560888312.git.just.another.mariano@gmail.com>
	<f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
	<5511748e8ce0af06eacccb81a90ee4563c307248.camel@linuxfoundation.org>
	<CADkTA4MAVbJ6H4uJXPmod+9NBt97YxZsgia3CnJMr8q7M8mJKQ@mail.gmail.com>
	<e46ddc1973d50d0fa73d8737d0c682501396bae5.camel@linuxfoundation.org>
In-Reply-To: <e46ddc1973d50d0fa73d8737d0c682501396bae5.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jun 2019 09:11:18 -0400
Message-ID: <CADkTA4NiS3Ww4VqttfjCPSu9AWs9r05-V+RggcYvk7UTiv-6YQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: Add SCSI support when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 19 Jun 2019 13:11:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 8:44 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-06-19 at 08:24 -0400, Bruce Ashfield wrote:
> > On Wed, Jun 19, 2019 at 6:51 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Tue, 2019-06-18 at 15:10 -0500, Mariano L=C3=B3pez wrote:
> > > > The scsi_debug module can't be built in some architectures as
> > > > they
> > > > have
> > > > SCSI support disabled by default. This patch will enable SCSI
> > > > support
> > > > as
> > > > well as the scsi_debug module when ptest is in DISTRO_FEATURES.
> > > >
> > > > Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
> > > > ---
> > > >  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
> > > >  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
> > > >  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
> > > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
> > > >  4 files changed, 16 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > index 0836dc7ea0..e6c8ee320c 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > @@ -41,4 +41,7 @@ KERNEL_FEATURES_append =3D "
> > > > ${KERNEL_EXTRA_FEATURES}"
> > > >  KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> > > >  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc
> > > > cfg/paravirt_kvm.scc"
> > > >  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc
> > > > cfg/paravirt_kvm.scc"
> > > > -KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES"
> > > > ,
> > > > "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES"
> > > > ,
> > > > "ptest", "\
> > > > +                            features/scsi/scsi.scc \
> > > > +                            features/scsi/scsi-debug.scc \
> > > > +                         ","" ,d)}"
> > >
> > > Question to Bruce - can we mark scsi-debug.scc as having a
> > > dependency
> > > on scsi.scc?
> >
> > With the goal that we can only list one of the fragments in the
> > KERNEL_FEATURES append ?
> > We can do something like that, I just want to make sure I'm grok'ing
> > the end goal.
>
> Yes, it just seems odd that you'd have to remember to list both.
>
> If listing both makes sense I'm ok with it, I just thought it worth
> asking that question as it does seem like a missing dependency.
>

No problem. I'll see what I can come up with today and follow up with
some info/details.

Bruce

> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

