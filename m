Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id A176A7EAA4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2019 01:02:28 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id r15so4104465lfm.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jun 2019 18:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sMFabrZ7mCrx5ND9M4HEOWE/jyr+4wNzxvTRuzap82o=;
	b=SpMTTqcH4HW8VG5Dhh6atqiq2fuAVQQHxMq1W8viFVMlRDqHBXQpUZ+xvunCaBAEdP
	7GqJeD3y2oUZ+cmdyA6AhvI7NZyRgTT9DejB34+JPmhon6O6XV5u4qvM1UgS0d//jOTv
	+3RSJJ/WYSj1RPWFwEh5LLwDVtD61UmPG0lpIu19ia72S0+iTX+FIyjoXuG9XPPsGQqi
	iO6S//Ot+ydzTGQpB6vr9kho9vbPxgRyAWbQHXWFID4STpt4AgyR8m4Tfq17l129oO6o
	zQ5DGJXFJWMpWCQMhz1hQT8wKEiAva/7AskEtzHbdIN5re2tLV6F6dFwOCYpDZv4hofR
	7kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sMFabrZ7mCrx5ND9M4HEOWE/jyr+4wNzxvTRuzap82o=;
	b=TZk8YfFN26+jEg7NPv9R+McTZiWeOj4pyF1l/Y+P5M21WY8TYco57zV1gV5TNPBqD6
	dxuzClAESX6aVRoi/gOgerEOhyAlu0tCOh7t0BYOaQ5VNEE/TrA5uVSJrjuivMgMHtwn
	NjzDEq6I9CiSyIIbJF1bJeiPFlNEA4Hu6blhexwKk+zdTSmBQ+hKwUNXMk5M0aRZ60wr
	IWW2fIjSNL3CUPxhD9iVAmDPAE0fc8kPd8sAyRHRACakOP3Ap/GiBS5+LUwK7tAC9khP
	QBwxPcoG7Qo3OOOYcOthdkP6W1rk9yeYtSN3W3g0gOUznvndBjLqME8fSgh6t6Cc/sJB
	6L5Q==
X-Gm-Message-State: APjAAAWl4sCi7jXln6h9WYzxC/Xm2/LcnHUTa92TSyNckDeNCMLEpwv9
	b27HKHicjgN33Pv4C2omO3TY/5SwFNyamY+S6Yw=
X-Google-Smtp-Source: APXvYqx6wVXtXszZrLWcSXAmjghQxEZrRefTEmJwNcSkyx8q5/em0bTJMHRz2r2gqdFqesAzh4E0XXkSSKc/TrRV1NA=
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr51844993lfo.63.1560646948852; 
	Sat, 15 Jun 2019 18:02:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560482696.git.just.another.mariano@gmail.com>
	<e1f95376a17a9cc240d051db9d63cccd82ab02d2.1560482696.git.just.another.mariano@gmail.com>
	<5227c124e870dce2a5eed682dcd9f7cb7ea9d2b6.camel@linuxfoundation.org>
	<1b6183ff-0500-5c2f-f31a-4a90d46626c7@gmail.com>
In-Reply-To: <1b6183ff-0500-5c2f-f31a-4a90d46626c7@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 15 Jun 2019 21:02:17 -0400
Message-ID: <CADkTA4O18vKXznOvnYJP+AeVF96grvF-Jash07zwy4mgHY_ABQ@mail.gmail.com>
To: Mariano Lopez <just.another.mariano@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] linux-yocto: Add scsi_debug module when ptest is in DISTRO_FEATURES
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
X-List-Received-Date: Sun, 16 Jun 2019 01:02:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 15, 2019 at 3:47 PM Mariano Lopez
<just.another.mariano@gmail.com> wrote:
>
>
> On 6/15/19 10:15 AM, Richard Purdie wrote:
> > On Thu, 2019-06-13 at 22:32 -0500, Mariano L=C3=B3pez wrote:
> >> util-linux ptest requires the scsi_debug module to perform eject/mount
> >> tests. This will conditionally add scsi_debug module when ptest is in
> >> DISTRO_FEATURES.
> >>
> >> This doesn't include linux-yocto-tiny because the resulting image will
> >> be too big and do_image would complain about this.
> >>
> >> [YOCTO #13301]
> >>
> >> Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com>
> >> ---
> >>   meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 1 +
> >>   meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 1 +
> >>   meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 1 +
> >>   meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 1 +
> >>   4 files changed, 4 insertions(+)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/r=
ecipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> index 6604bdf90c..0836dc7ea0 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> >> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES=
}"
> >>   KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> >>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.sc=
c"
> >>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm=
.scc"
> >> +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/re=
cipes-kernel/linux/linux-yocto-rt_5.0.bb
> >> index 1fe28b1bf0..b5e415f935 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> >> @@ -41,3 +41,4 @@ KERNEL_FEATURES_append =3D " ${KERNEL_EXTRA_FEATURES=
}"
> >>   KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> >>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.sc=
c"
> >>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm=
.scc"
> >> +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURES", "=
ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/reci=
pes-kernel/linux/linux-yocto_4.19.bb
> >> index a5fdafe6b2..cda4ecf89e 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
> >> @@ -47,3 +47,4 @@ KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> >>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.sc=
c"
> >>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm=
.scc"
> >>   KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "=
mx32", " cfg/x32.scc", "" ,d)}"
> >> +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES", =
"ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> >> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recip=
es-kernel/linux/linux-yocto_5.0.bb
> >> index da795d97aa..8aec315084 100644
> >> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> >> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> >> @@ -50,3 +50,4 @@ KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> >>   KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc cfg/paravirt_kvm.sc=
c"
> >>   KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc cfg/paravirt_kvm=
.scc"
> >>   KERNEL_FEATURES_append =3D " ${@bb.utils.contains("TUNE_FEATURES", "=
mx32", " cfg/x32.scc", "" ,d)}"
> >> +KERNEL_FEATURES_append =3D " ${@bb.utils.contains("DISTRO_FEATURES", =
"ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > I merged this but have just realised its causing warnings:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/93/builds/31
> >
> > which suggest its not quite doing what we hope/need? :/
> >
> > Cheers,
> >
> > Richard
>
> Indeed, it seems the configuration is not applied for the qemuarm64
> MACHINE:(
>

It would be applied, but it may be missing some dependency on that
machine and is hence not enabled in the final kernel .config.

Bruce

> Let me look into this and send another patch
>
> Thanks,
> Mairano
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

