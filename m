Return-Path: <kergoth@gmail.com>
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail.openembedded.org (Postfix) with ESMTP id A63D46BF42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 15:21:58 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id v6so1924368oif.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 07:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gu1IdmHUFy2LVjEFwmKtvtai32Kd48qFPYLqeNOd0d0=;
	b=XGiihcQu8qWA/Ya83V9zCvnKY0vz0u0tkXW98Yg2QM3EP5bRVyV3RRMy+Y2Wr0glUj
	K2Y6EaXdL/Nr7xvV/LN7EB/r/A0keUwcA/UG/oLZxwSoRgho3KhOk7D42CPtBxR3QbmP
	TXvGjfVnY6Wy1v8j9uNhKA5odMneIYBUMBRVOSyVMWInrt/uoAqcMxLtbcauboc4S9fo
	Ia5yIP5ld7c1ID1pu/OVH4DZfxZitDG0HEuura7UpvmVJrHXGGTlLsbE1Ix4oCFjcqJS
	4jnrsvlYRz/cRx6Znn4tJRKpv0nE9XVfWnveQeUM7m4Oq6CnRAkSscT+Snq8tsfl7oaT
	ap7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gu1IdmHUFy2LVjEFwmKtvtai32Kd48qFPYLqeNOd0d0=;
	b=Ow0sNYcdd4BXRaRhqlBBH8QbZ7CLY+uCcY/CB9QMB79CC8pKKrPIMZwtFUV2tKbXSD
	YWq1JecwNJbXIZYhk2BA9ZHT5rDKsGysr0fVc6aQbpTEjSlh4GBAZmtTXbagn6bI3fc6
	r2pg0qLaV5kJFFK5tv+ICPrHrtcz6+WK7wOWE/HkwolF9pPBKWSDUtN+Hj+sFj6847nQ
	G/mO3rJ5QwaEAKx4teTgw5T6cTTUJgDlrfBX0Q0yFFERjbIbP75YaXzDA7B5wWMZXwDO
	o1Gq9I0GlLgDhWdiSkhYPTcWL7k5vJ7RVGE+zYdae4CCnisAS+xx4KdoIhrccdjkndew
	PGdg==
X-Gm-Message-State: AA+aEWYEenwF8iHmf/P0Gap0T7VgREY7q9KTUVBj+mvOkXVh4RrrOcv6
	wq6qyzt4iXFITWtlzqHB461r9RIA2R+I0jh716o=
X-Google-Smtp-Source: AFSGD/X+YypBkkZnlZgxJjDGt/gII0sY/WfXX9ytTkpzqIw08/hDQEkQsL3RBjB/Ifa/JNe+K2mvRLRcPYnyO60O9gc=
X-Received: by 2002:aca:1716:: with SMTP id j22mr151428oii.19.1543504919357;
	Thu, 29 Nov 2018 07:21:59 -0800 (PST)
MIME-Version: 1.0
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
	<1543494097-19534-2-git-send-email-mikko.rapeli@bmw.de>
	<335a4290d941021b84a2b0447e2017774d0e5259.camel@linuxfoundation.org>
	<20181129141709.GB10799@hiutale>
In-Reply-To: <20181129141709.GB10799@hiutale>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 29 Nov 2018 08:21:47 -0700
Message-ID: <CABcZANkfbjH=_6W819fp9-HB_81VLVbpBVoCKMTpykV-PwMyoQ@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: Michael.Ho@bmw.de, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] RFC image_types.bbclass: add image size limit for tar image type
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
X-List-Received-Date: Thu, 29 Nov 2018 15:21:58 -0000
Content-Type: multipart/alternative; boundary="0000000000006d6dbe057bcf3eb6"

--0000000000006d6dbe057bcf3eb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This seems like it=E2=80=99d make a good general image qa check instead, ra=
ther
than being part of do_image_tar.

On Thu, Nov 29, 2018 at 7:29 AM <Mikko.Rapeli@bmw.de> wrote:

> On Thu, Nov 29, 2018 at 02:04:14PM +0000, Richard Purdie wrote:
> > On Thu, 2018-11-29 at 14:21 +0200, Mikko Rapeli wrote:
> > > If IMAGE_ROOTFS_SIZE_LIMIT is defined in image configuration, then
> > > build will fail if for tar image type the uncompressed tar ball size
> > > exceeds the value, as reported by 'du -ks'.
> > >
> > > This check could be extended to other image types as well.
> > >
> > > There already exists a check with IMAGE_ROOTFS_SIZE variable
> > > but I could not figure out how to actually use it. It does
> > > some quite complex overhead calculations which did not seem
> > > to work for me on sumo.
> > >
> > > When the image size is exceeded, build fails like this:
> > >
> > > ERROR: image-1.0-r0 do_image_tar: Image size 170712 of
> > > /home/builder/src/base/build/tmp/work/linux/image/1.0-r0/deploy-
> > > image-complete/image.rootfs.tar reported by 'du -ks' is larger than
> > > limit IMAGE_ROOTFS_SIZE_LIMIT 170000
> >
> > What about IMAGE_ROOTFS_MAXSIZE?
> >
> > I think IMAGE_ROOTFS_SIZE is about adding extra space to the image, not
> > limiting its size...
>
> Yea, forgot to mention that I tried that too but got inconsisten results.
> I know it's bad but it was easier for me to add this new test than to
> figure
> out what's wrong with current yocto image size checks. Hence RFC.
>
> -Mikko
>
> > Cheers,
> >
> > Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--0000000000006d6dbe057bcf3eb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems like it=E2=80=99d make a good general image qa =
check instead, rather than being part of do_image_tar.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr">On Thu, Nov 29, 2018 at 7:29 AM &lt;<a hr=
ef=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Thu, Nov 29, 2018 at 02:04:14PM +0000,=
 Richard Purdie wrote:<br>
&gt; On Thu, 2018-11-29 at 14:21 +0200, Mikko Rapeli wrote:<br>
&gt; &gt; If IMAGE_ROOTFS_SIZE_LIMIT is defined in image configuration, the=
n<br>
&gt; &gt; build will fail if for tar image type the uncompressed tar ball s=
ize<br>
&gt; &gt; exceeds the value, as reported by &#39;du -ks&#39;.<br>
&gt; &gt; <br>
&gt; &gt; This check could be extended to other image types as well.<br>
&gt; &gt; <br>
&gt; &gt; There already exists a check with IMAGE_ROOTFS_SIZE variable<br>
&gt; &gt; but I could not figure out how to actually use it. It does<br>
&gt; &gt; some quite complex overhead calculations which did not seem<br>
&gt; &gt; to work for me on sumo.<br>
&gt; &gt; <br>
&gt; &gt; When the image size is exceeded, build fails like this:<br>
&gt; &gt; <br>
&gt; &gt; ERROR: image-1.0-r0 do_image_tar: Image size 170712 of<br>
&gt; &gt; /home/builder/src/base/build/tmp/work/linux/image/1.0-r0/deploy-<=
br>
&gt; &gt; image-complete/image.rootfs.tar reported by &#39;du -ks&#39; is l=
arger than<br>
&gt; &gt; limit IMAGE_ROOTFS_SIZE_LIMIT 170000<br>
&gt; <br>
&gt; What about IMAGE_ROOTFS_MAXSIZE?<br>
&gt;<br>
&gt; I think IMAGE_ROOTFS_SIZE is about adding extra space to the image, no=
t<br>
&gt; limiting its size...<br>
<br>
Yea, forgot to mention that I tried that too but got inconsisten results.<b=
r>
I know it&#39;s bad but it was easier for me to add this new test than to f=
igure<br>
out what&#39;s wrong with current yocto image size checks. Hence RFC.<br>
<br>
-Mikko<br>
<br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, M=
entor Graphics</div></div></div></div>

--0000000000006d6dbe057bcf3eb6--
