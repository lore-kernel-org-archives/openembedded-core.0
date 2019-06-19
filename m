Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id E32E97E198
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 12:24:45 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id 131so3065019ljf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yO0KzkcSN3+2GMTYuUpedcnjFCDBfclQcb/o4RR8mBA=;
	b=vAICXSEp4RcHmJeWO75LgeKV9n00zWTSi3O2rFdvk5yrmv1sAT2vYothnWvO5Ocsns
	q0mImV9XWZCMkBoAIZ5O0ZNL6S8P/COZKEyCPwInHnlcdj9jUkFHFH+PxLG5HONdGErE
	gYbQYUY9PFaAdmO5P2YsNyxr5N7LpxehLtJgOKY7kYNKuDUE4dxpVJrD6JKgspyxIc74
	h0enBCctcBoBefm9v1E+mMg0EG607qE/NHAaCvKVzzKeHMtlxp82lTqN7YukbWjD1mJ5
	lubAlQMoRzLqNNKFT2IQubMYUk+iqIAuqWGgsfhE42b17v5EtsV5h0Gj8UhWofpQuSjz
	ysJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yO0KzkcSN3+2GMTYuUpedcnjFCDBfclQcb/o4RR8mBA=;
	b=tCF6tgpo+04co54ZKoVUByeTRgmNabdiZi8Wo4booKzYE6ZTfOJA95jIRviUB//bl3
	UbedOTTfyKtWyQmX7T7pOJHsEEaEkkk+LRLx6klrUwV4zqALNDafCPVwEAmrPJaf617x
	wDYqvlTZ8EP2EpSjdgRiTf8L7shVQVI7gVr4FGX0mpOgmrL6x0LYyWsF5QcMS0yoqdrD
	LNX4a/JmLMow3hfcrJZ2oEyQ0t+yJvM4a0iM3FWPoM9tijgzUFOcryTu771vV49CSZOX
	3vbrkaWnjRldUAG3u93zemqdFxKBluAGnVR8kH2ch7e6t5B0KS/KCY5uFCqoufELYJYA
	Drnw==
X-Gm-Message-State: APjAAAU9fcNY5tp01cihOjR5bHYBorSpskscWAT7kEwdkHwt/M0DW1fm
	AbTD0CxTszweJvGxtL3JONEmU0LJdjHKfxS2KI4=
X-Google-Smtp-Source: APXvYqwjgP3fBEm0wDuZaxw78AE03j3Jsw1KoGJJDeI+5nV9PfL3fmdmNHQCSkFfTaMXf21Mc8e4juXO3gU86XbScHc=
X-Received: by 2002:a2e:5d54:: with SMTP id r81mr29150998ljb.104.1560947086095;
	Wed, 19 Jun 2019 05:24:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560888312.git.just.another.mariano@gmail.com>
	<f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
	<5511748e8ce0af06eacccb81a90ee4563c307248.camel@linuxfoundation.org>
In-Reply-To: <5511748e8ce0af06eacccb81a90ee4563c307248.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jun 2019 08:24:35 -0400
Message-ID: <CADkTA4MAVbJ6H4uJXPmod+9NBt97YxZsgia3CnJMr8q7M8mJKQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Jun 2019 12:24:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 6:51 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2019-06-18 at 15:10 -0500, Mariano L=C3=B3pez wrote:
> > The scsi_debug module can't be built in some architectures as they
> > have
> > SCSI support disabled by default. This patch will enable SCSI support
> > as
> > well as the scsi_debug module when ptest is in DISTRO_FEATURES.
> >
> > Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
> > ---
> >  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
> >  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
> >  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
> >  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
> >  4 files changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > index 0836dc7ea0..e6c8ee320c 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > @@ -41,4 +41,7 @@ KERNEL_FEATURES_append =3D "
> > ${KERNEL_EXTRA_FEATURES}"
> >  KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> >  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.scc"
> >  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc
> > cfg/paravirt_kvm.scc"
> > -KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES",
> > "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES",
> > "ptest", "\
> > +                            features/scsi/scsi.scc \
> > +                            features/scsi/scsi-debug.scc \
> > +                         ","" ,d)}"
>
> Question to Bruce - can we mark scsi-debug.scc as having a dependency
> on scsi.scc?

With the goal that we can only list one of the fragments in the
KERNEL_FEATURES append ?
We can do something like that, I just want to make sure I'm grok'ing
the end goal.

Bruce

>
> Cheers,
>
> Richard
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

