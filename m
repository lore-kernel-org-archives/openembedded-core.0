Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 636A67E9FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 15:23:07 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id p17so1411265ljg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=JmgZqfeE9aZkVPXk7L+1jhXS8h5xX0f7DaW1hLwUEFk=;
	b=C22+brryfd3CILSy/ZlrOlpm5gCGxoOOcHhb75dOvRnHQzR8ZhejAm98+MrXCkXqbL
	mCuOek4mWojEEX992+VOF8MfHyqvtvsKDRmXoWJgZ49NNROW+fVU5eBn//ceQxqw9l52
	gi3mMVcTSAEucJKNRP9/NqrUxFrNWK+M0VieW5A7fJ2vJnDfU979uvEYScEq6V77oxDV
	/8bjoXkiT1v43Q7rO27H4UBxAQsoQA7rnlk6N+Dg82ib5/tk4zC7gtfDZu39rQPM0kNZ
	HqaWYy6Ox3hhkfP10cx+yK+ndzGv1ET1KVWjvreFn0EJjYuFrwDZiTPtOeGqqFUss3XF
	IXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=JmgZqfeE9aZkVPXk7L+1jhXS8h5xX0f7DaW1hLwUEFk=;
	b=jTbUKKnMsIRZ1zhCwZcY8RWoC9mIgB3tVc1il/pitopwdd7BPKL2Kr7/DPZvKMdHrd
	Rbo031EfCUnChRyL+wbug5lX5zKPCQohCXdxZah2ADGO0UrlLXMzJ76miJjJgt/r4oIt
	Y6sV/P75sY9CxBM2dC67BEfsSXBl5bH871/C8F9EqAvg6rDUijNtkW2GSvR9jxkiTygI
	mpLqEWSDk9oQES1Hx/MsQNsMlkMcXQN5m5JiK2bBp+cA/5U1/F8oGtsQbMZIMwbdkFDf
	3bkXZ9agDexn6+0jTcn5hajAkoOOGLj/2l2mS3WKSGiWIZR50uNJuwwpmAyArUKyVpMC
	obXA==
X-Gm-Message-State: APjAAAVfm+Xt2QleF5miVwnNpWH+VIiwccEEf2IGzOLy6XAs7Ml/c9Yp
	Lh2imOvhskvatz1O5eZo4upuT7saTZO4lTg8ftY=
X-Google-Smtp-Source: APXvYqxMyzEwZBaU5vDDknHZKsfo6cAC4E6CGdx9/MF9cK4NQEHx0tX083D78yXQUCaY2kUOWGknKi8L3nmBk4uH9ss=
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr52169856ljj.185.1560957787708; 
	Wed, 19 Jun 2019 08:23:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1560888312.git.just.another.mariano@gmail.com>
	<f0d52edc0d79dca6ed77b0ae587ca594ccb6ee39.1560888312.git.just.another.mariano@gmail.com>
	<5511748e8ce0af06eacccb81a90ee4563c307248.camel@linuxfoundation.org>
	<CADkTA4MAVbJ6H4uJXPmod+9NBt97YxZsgia3CnJMr8q7M8mJKQ@mail.gmail.com>
	<e46ddc1973d50d0fa73d8737d0c682501396bae5.camel@linuxfoundation.org>
	<CADkTA4NiS3Ww4VqttfjCPSu9AWs9r05-V+RggcYvk7UTiv-6YQ@mail.gmail.com>
In-Reply-To: <CADkTA4NiS3Ww4VqttfjCPSu9AWs9r05-V+RggcYvk7UTiv-6YQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jun 2019 11:22:56 -0400
Message-ID: <CADkTA4Pw-NX1bqtXQAxRUKULZ8FRsZiJVhJPQMozKn4i6cjtVQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 19 Jun 2019 15:23:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 9:11 AM Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
>
> On Wed, Jun 19, 2019 at 8:44 AM <richard.purdie@linuxfoundation.org> wrot=
e:
> >
> > On Wed, 2019-06-19 at 08:24 -0400, Bruce Ashfield wrote:
> > > On Wed, Jun 19, 2019 at 6:51 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > On Tue, 2019-06-18 at 15:10 -0500, Mariano L=C3=B3pez wrote:
> > > > > The scsi_debug module can't be built in some architectures as
> > > > > they
> > > > > have
> > > > > SCSI support disabled by default. This patch will enable SCSI
> > > > > support
> > > > > as
> > > > > well as the scsi_debug module when ptest is in DISTRO_FEATURES.
> > > > >
> > > > > Signed-off-by: Mariano L=C3=B3pez <just.another.mariano@gmail.com=
>
> > > > > ---
> > > > >  meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 5 ++++-
> > > > >  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb  | 5 ++++-
> > > > >  meta/recipes-kernel/linux/linux-yocto_4.19.bb    | 5 ++++-
> > > > >  meta/recipes-kernel/linux/linux-yocto_5.0.bb     | 5 ++++-
> > > > >  4 files changed, 16 insertions(+), 4 deletions(-)
> > > > >
> > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > > b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > > index 0836dc7ea0..e6c8ee320c 100644
> > > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
> > > > > @@ -41,4 +41,7 @@ KERNEL_FEATURES_append =3D "
> > > > > ${KERNEL_EXTRA_FEATURES}"
> > > > >  KERNEL_FEATURES_append_qemuall=3D" cfg/virtio.scc"
> > > > >  KERNEL_FEATURES_append_qemux86=3D" cfg/sound.scc
> > > > > cfg/paravirt_kvm.scc"
> > > > >  KERNEL_FEATURES_append_qemux86-64=3D" cfg/sound.scc
> > > > > cfg/paravirt_kvm.scc"
> > > > > -KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURE=
S"
> > > > > ,
> > > > > "ptest", " features/scsi/scsi-debug.scc", "" ,d)}"
> > > > > +KERNEL_FEATURES_append =3D "${@bb.utils.contains("DISTRO_FEATURE=
S"
> > > > > ,
> > > > > "ptest", "\
> > > > > +                            features/scsi/scsi.scc \
> > > > > +                            features/scsi/scsi-debug.scc \
> > > > > +                         ","" ,d)}"
> > > >
> > > > Question to Bruce - can we mark scsi-debug.scc as having a
> > > > dependency
> > > > on scsi.scc?
> > >
> > > With the goal that we can only list one of the fragments in the
> > > KERNEL_FEATURES append ?
> > > We can do something like that, I just want to make sure I'm grok'ing
> > > the end goal.
> >
> > Yes, it just seems odd that you'd have to remember to list both.
> >
> > If listing both makes sense I'm ok with it, I just thought it worth
> > asking that question as it does seem like a missing dependency.
> >
>
> No problem. I'll see what I can come up with today and follow up with
> some info/details.

I'm building a tweak now.

scsi-debug just needs to include the core scsi support. Some
features/fragments have different goals/use cases .. in this case,
scsci-debug should haul in  everything it needs to be included as a
standalone feature.

Assuming my test works, the patch would just need to include
scsi-debug.scc for all the platforms, and everything will just work.

Bruce


>
> Bruce
>
> > Cheers,
> >
> > Richard
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

