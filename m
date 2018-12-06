Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 286486C0EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 15:45:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id i7so963960qtj.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Dec 2018 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PvJ9kmCFEtTJa3MG0FQZftJJv9w3DOX1ZmvNVhTbX58=;
	b=XkxFrbPeh6jXD2g/cwpxawr8Jl0LuOgbJ9y5IHRGf6Pgf8c+u8QQkYCjGPIAMxg1YK
	ztJuwbRfWgF3u7vQBCOSUnItXmhhJ6OV4QzYU4f3+T6Swo2ScqH3msOq/xSp8t4Z2yGg
	v9u9JI1bTNrekA4dBsGaUocbGJdFVCneVzapfNv1w/9Eby/7f2Y/0CenqlUu9DDx73xa
	ov3obPy188GFpTjN4NPpuQ5CDo7ijMzhOeD/uTYHqpfrl4hrFznB7HkgVO2Nz86z8U1/
	wpS7pLkQNwhy4Wn3Qe2BfdzLAj46pd4pYKJhCZWvb2AiZKjllLZUHwtPU9OgBuhPXZ6a
	ozNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PvJ9kmCFEtTJa3MG0FQZftJJv9w3DOX1ZmvNVhTbX58=;
	b=OSFKqMNxU5V+MY9EV09CQao8NXFm8yPwiw11uXTf98henQBNgPB24KWnpbW7X4hFwx
	av/XG60i1i0BYe8sdPRceNf+R2fVULoMyIqZnWfvEfwJ8YQEuRkT9UP3yc1uGJcDwqpo
	zPLPpwzQ9PDLMGT+lC2UlKrhj393sztRjuOQyxfcN+9T23E9JpUyfIkjJYDuc8BhBuFA
	05uIQDrm4QaWJlH02Pzby18zBnYbVIpl97j4ulhsKonbguaMMuJ9amwX5wSCUW7BqbQ8
	1KcKl3ow3aeNaSjH+5ZxB6+SphLxO51POAUXr270w5nzBwBpBuqyL5yxy4KA+B6unTBP
	Q86A==
X-Gm-Message-State: AA+aEWYAkwqPOc96By/E3xwf0obAOe+gCv5GpLYd/bThbygZkf6M8GLw
	XdoTSs9B4UZiaxiXzszax3WldW2k4buicSVl7go=
X-Google-Smtp-Source: AFSGD/UflyPlP5reHJTzMXBG3AE+8ecAfxKdxZEUS2oJZMB/60T3JtQHlkulL6L49LtpioQeQ6926M4YwDn7pszrxEY=
X-Received: by 2002:ac8:16d8:: with SMTP id y24mr28474711qtk.253.1544111125484;
	Thu, 06 Dec 2018 07:45:25 -0800 (PST)
MIME-Version: 1.0
References: <20181206000749.28731-1-raj.khem@gmail.com>
	<CAJTo0LZi7zY+g9PKd=eUr9PnipvfTBeOXaC_y91Wm87+aP=oPw@mail.gmail.com>
In-Reply-To: <CAJTo0LZi7zY+g9PKd=eUr9PnipvfTBeOXaC_y91Wm87+aP=oPw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Dec 2018 07:45:13 -0800
Message-ID: <CAMKF1srv3AYsM8XFpOPO=A+mt-cQLxVKkU9rm17XxNeg0yMkyQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libunwind: Enable building static archive on musl
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
X-List-Received-Date: Thu, 06 Dec 2018 15:45:25 -0000
Content-Type: multipart/alternative; boundary="00000000000020da74057c5c6388"

--00000000000020da74057c5c6388
Content-Type: text/plain; charset="UTF-8"

Yes, they are. But for musl libunwind static lib is required for rust
runtime to build all the time static or not

On Thu, Dec 6, 2018 at 3:49 AM Burton, Ross <ross.burton@intel.com> wrote:

> Presumably static archives are disabled by the no-static-libs include.
> So is this really musl-specific?
>
> Ross
> On Thu, 6 Dec 2018 at 00:08, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This ensures that we have .a for libunwind on musl targets, this is used
> > for stack unwinding infra e.g. in rust
> >
> > Help compiling rust compiler and standard library from meta-rust
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-support/libunwind/libunwind_1.2.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> > index e7fb2b2190..c9239b695e 100644
> > --- a/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> > +++ b/meta/recipes-support/libunwind/libunwind_1.2.1.bb
> > @@ -14,7 +14,7 @@ SRC_URI = "
> http://download.savannah.nongnu.org/releases/libunwind/libunwind-${PV
> >             "
> >
> >  SRC_URI_append_libc-musl = " file://musl-header-conflict.patch"
> > -EXTRA_OECONF_append_libc-musl = " --disable-documentation
> --disable-tests "
> > +EXTRA_OECONF_append_libc-musl = " --disable-documentation
> --disable-tests --enable-static"
> >
> >  # http://errors.yoctoproject.org/Errors/Details/20487/
> >  ARM_INSTRUCTION_SET_armv4 = "arm"
> > --
> > 2.19.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000020da74057c5c6388
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div dir=3D"auto">Yes, they are. But for musl libunwind static li=
b is required for rust runtime to build all the time static or not</div></d=
iv></div><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, =
Dec 6, 2018 at 3:49 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel=
.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Presumably static archives are disabled by the no=
-static-libs include.<br>
So is this really musl-specific?<br>
<br>
Ross<br>
On Thu, 6 Dec 2018 at 00:08, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; This ensures that we have .a for libunwind on musl targets, this is us=
ed<br>
&gt; for stack unwinding infra e.g. in rust<br>
&gt;<br>
&gt; Help compiling rust compiler and standard library from meta-rust<br>
&gt;<br>
&gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.1.bb</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libunwind/<a href=3D"http://libunwin=
d_1.2.1.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.1.bb</a> b/m=
eta/recipes-support/libunwind/<a href=3D"http://libunwind_1.2.1.bb" rel=3D"=
noreferrer" target=3D"_blank">libunwind_1.2.1.bb</a><br>
&gt; index e7fb2b2190..c9239b695e 100644<br>
&gt; --- a/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.1.bb</a><br>
&gt; +++ b/meta/recipes-support/libunwind/<a href=3D"http://libunwind_1.2.1=
.bb" rel=3D"noreferrer" target=3D"_blank">libunwind_1.2.1.bb</a><br>
&gt; @@ -14,7 +14,7 @@ SRC_URI =3D &quot;<a href=3D"http://download.savanna=
h.nongnu.org/releases/libunwind/libunwind-$%7BPV" rel=3D"noreferrer" target=
=3D"_blank">http://download.savannah.nongnu.org/releases/libunwind/libunwin=
d-${PV</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI_append_libc-musl =3D &quot; file://musl-header-conflict.=
patch&quot;<br>
&gt; -EXTRA_OECONF_append_libc-musl =3D &quot; --disable-documentation --di=
sable-tests &quot;<br>
&gt; +EXTRA_OECONF_append_libc-musl =3D &quot; --disable-documentation --di=
sable-tests --enable-static&quot;<br>
&gt;<br>
&gt;=C2=A0 # <a href=3D"http://errors.yoctoproject.org/Errors/Details/20487=
/" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Erro=
rs/Details/20487/</a><br>
&gt;=C2=A0 ARM_INSTRUCTION_SET_armv4 =3D &quot;arm&quot;<br>
&gt; --<br>
&gt; 2.19.2<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div></div>
</div>

--00000000000020da74057c5c6388--
