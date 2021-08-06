Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.4542.1628255633078475470
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 06:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cUvn2ERC;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: uvv.mail@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id a19so9805551qkg.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 06:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P8RWxPFoEz1qhCAERSeFzq9rbFteH6WSGEGhB1hbovE=;
        b=cUvn2ERCNzmBEsTFqW5BBrBVySBfXGnCY37iRXD0p0vpJnHeQ4llvNGJ9dZhUl0Ti+
         p4Jjuah2Y52PO8xxUOHCpPCHog/0TtEtJ5/+SAPt6KXUEnFEGG/Andmr/JoSrOgdEBoM
         TbN2NetAbS8ZDxYnCu+zlI1kCuHUytPJFO6KQndjWh/9gyv5a6yeqHlebQxH3xgJmw+L
         LJ/7ytOXeieCpTIJ9X9JZ9gwqLp6xdKr1XJSUkpc6zcee9uzDgQAAdhzJvD0WV+AGoaK
         CesaKMoS9mxBavBc3BhGKtrvnOkwd4EKscu+RLRKyVhH4GdQ07TCuVfV7zloiOmXcKQq
         2U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P8RWxPFoEz1qhCAERSeFzq9rbFteH6WSGEGhB1hbovE=;
        b=mi8ZDWO+iFD5dEwTghnFGZO/E/POE/fuAibR5uPCwwWBR3Cm3UYzR+xIlfseY3WWXQ
         AxHW726t8yXJ4TySwlxmACofLQa2PPUk7hW0/JVCrEMo5sJ74Segp0e6X1x82dPCh2jc
         dV8kXdtMWtHKU+KM0R3w70nEcjyxplGMoGFFYZ4SVqxwNExCH5V0rHYfb3jCwTiAm+kO
         Z1vBxUpZLhMmjDS1Ph+jb0vLcHLduK9tcUtiU6sL/aBt0FTEZVG/GpNj+RPfTJRxLVfz
         k37QTBiik7oTvdo9VLVNxIFoi2RGMpvO6mXZJWINb5z7gwBtpHFOg67ZKUoVoKG6pl9b
         z7QQ==
X-Gm-Message-State: AOAM530K42MNuZBDdOdh3NZkg7plWYf87JZEEza5aaoFYYF637NMOksW
	eqY1ohWAAjtmri2qA6SceXEIYWqt61Zbh6MFz1Q=
X-Google-Smtp-Source: ABdhPJxk4s6u8sNULh5QMR+uGeERoN1JrASvE8RauB3ZgUO8mD8H68a/h5j0/5o3CUZQUWr7wq3PM4H3fOcQuH5mVCE=
X-Received: by 2002:ae9:ebd5:: with SMTP id b204mr9887096qkg.183.1628255632282;
 Fri, 06 Aug 2021 06:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210806120611.124246-1-uvv.mail@gmail.com> <20210806120611.124246-2-uvv.mail@gmail.com>
 <ac780428-cee9-c5b0-bec5-4e7578950c0b@bootlin.com> <8f124922d571cd303cc2a6f312e8c1168b53573e.camel@linuxfoundation.org>
In-Reply-To: <8f124922d571cd303cc2a6f312e8c1168b53573e.camel@linuxfoundation.org>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Date: Fri, 6 Aug 2021 16:13:40 +0300
Message-ID: <CAKHfEagxHcZUjjKjMztBRuGRpvCUpTyuVWQ_TgTA7_HYj7Ppfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/7] overlayfs.bbclass: generate overlayfs mount units
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	openembedded-core@lists.openembedded.org, 
	"Yurkov, Vyacheslav" <Vyacheslav.Yurkov@bruker.com>
Content-Type: multipart/alternative; boundary="00000000000090d86c05c8e3cec5"

--00000000000090d86c05c8e3cec5
Content-Type: text/plain; charset="UTF-8"

I've already updated the docs and will submit the patch as soon as this
series is approved and merged.

Vyacheslav

On Fri, Aug 6, 2021, 16:06 Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-08-06 at 15:00 +0200, Michael Opdenacker wrote:
> > Slava, Richard,
> >
> > On 8/6/21 2:06 PM, Vyacheslav Yurkov wrote:
> > > It's often desired in Embedded System design to have a read-only
> rootfs.
> > > But a lot of different applications might want to have a read-write
> access
> > > to some parts of a filesystem. It can be especially useful when your
> update
> > > mechanism overwrites the whole rootfs, but you want your application
> data
> > > to be preserved between updates. This class provides a way to achieve
> that
> > > by means of overlayfs and at the same time keeping the base rootfs
> read-only.
> > >
> > > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> > > ---
> > >  meta/classes/overlayfs.bbclass | 111 +++++++++++++++++++++++++++++++++
> > >  1 file changed, 111 insertions(+)
> > >  create mode 100644 meta/classes/overlayfs.bbclass
> > >
> > > diff --git a/meta/classes/overlayfs.bbclass
> b/meta/classes/overlayfs.bbclass
> > > new file mode 100644
> > > index 0000000000..8d9b59c9bf
> > > --- /dev/null
> > > +++ b/meta/classes/overlayfs.bbclass
> > > @@ -0,0 +1,111 @@
> > > +# Class for generation of overlayfs mount units
> > > +#
> > > +# It's often desired in Embedded System design to have a read-only
> rootfs.
> > > +# But a lot of different applications might want to have a read-write
> access to
> > > +# some parts of a filesystem. It can be especially useful when your
> update mechanism
> > > +# overwrites the whole rootfs, but you want your application data to
> be preserved
> > > +# between updates. This class provides a way to achieve that by means
> > > +# of overlayfs and at the same time keeping the base rootfs read-only.
> > > +#
> > > +# Usage example.
> > > +#
> > > +# Set a mount point for a partition overlayfs is going to use as
> upper layer
> > > +# in your machine configuration. Underlying file system can be
> anything that
> > > +# is supported by overlayfs. This has to be done in your machine
> configuration.
> > > +# QA check fails to catch file existence if you redefine this
> variable in your recipe!
> > > +#
> > > +#   OVERLAYFS_MOUNT_POINT[data] ?= "/data"
> > > +#
> > > +# The class assumes you have a data.mount systemd unit defined in your
> > > +# systemd-machine-units recipe and installed to the image.
> > > +#
> > > +# Then you can specify writable directories on a recipe base
> > > +#
> > > +#   OVERLAYFS_WRITABLE_PATHS[data] =
> "/usr/share/my-custom-application"
> > > +#
> > > +# To support several mount points you can use a different variable
> flag. Assume we
> > > +# want to have a writable location on the file system, but not
> interested where the data
> > > +# survive a reboot. Then we could have a mnt-overlay.mount unit for a
> tmpfs file system:
> > > +#
> > > +#   OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> > > +#   OVERLAYFS_WRITABLE_PATHS[mnt-overlay] =
> "/usr/share/another-application"
> > > +#
> > > +# Note: the class does not support /etc directory itself, because
> systemd depends on it
> >
> >
> > Many thanks for this new class and the corresponding documentation.
> > Richard, I guess that's something we'll need to document in the manual,
> > once it's merge, right?
>
> Ideally, yes, correct.
>
> Cheers,
>
> Richard
>
>
> 
>
>

--00000000000090d86c05c8e3cec5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I&#39;ve already updated the docs and will submit th=
e patch as soon as this series is approved and merged.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Vyacheslav<br><br><div class=3D"gmail_quote"=
 dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 6, 2021, 16=
:06 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Fri, 2021-08-06 at 15:00 +0200, Michael Opdenacker wrot=
e:<br>
&gt; Slava, Richard,<br>
&gt; <br>
&gt; On 8/6/21 2:06 PM, Vyacheslav Yurkov wrote:<br>
&gt; &gt; It&#39;s often desired in Embedded System design to have a read-o=
nly rootfs.<br>
&gt; &gt; But a lot of different applications might want to have a read-wri=
te access<br>
&gt; &gt; to some parts of a filesystem. It can be especially useful when y=
our update<br>
&gt; &gt; mechanism overwrites the whole rootfs, but you want your applicat=
ion data<br>
&gt; &gt; to be preserved between updates. This class provides a way to ach=
ieve that<br>
&gt; &gt; by means of overlayfs and at the same time keeping the base rootf=
s read-only.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">uvv.mail@gmail.com</a>&gt;<b=
r>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0meta/classes/overlayfs.bbclass | 111 ++++++++++++++++++++++=
+++++++++++<br>
&gt; &gt; =C2=A01 file changed, 111 insertions(+)<br>
&gt; &gt; =C2=A0create mode 100644 meta/classes/overlayfs.bbclass<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/classes/overlayfs.bbclass b/meta/classes/overla=
yfs.bbclass<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..8d9b59c9bf<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/classes/overlayfs.bbclass<br>
&gt; &gt; @@ -0,0 +1,111 @@<br>
&gt; &gt; +# Class for generation of overlayfs mount units<br>
&gt; &gt; +#<br>
&gt; &gt; +# It&#39;s often desired in Embedded System design to have a rea=
d-only rootfs.<br>
&gt; &gt; +# But a lot of different applications might want to have a read-=
write access to<br>
&gt; &gt; +# some parts of a filesystem. It can be especially useful when y=
our update mechanism<br>
&gt; &gt; +# overwrites the whole rootfs, but you want your application dat=
a to be preserved<br>
&gt; &gt; +# between updates. This class provides a way to achieve that by =
means<br>
&gt; &gt; +# of overlayfs and at the same time keeping the base rootfs read=
-only.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Usage example.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Set a mount point for a partition overlayfs is going to use as=
 upper layer<br>
&gt; &gt; +# in your machine configuration. Underlying file system can be a=
nything that<br>
&gt; &gt; +# is supported by overlayfs. This has to be done in your machine=
 configuration.<br>
&gt; &gt; +# QA check fails to catch file existence if you redefine this va=
riable in your recipe!<br>
&gt; &gt; +#<br>
&gt; &gt; +#=C2=A0 =C2=A0OVERLAYFS_MOUNT_POINT[data] ?=3D &quot;/data&quot;=
<br>
&gt; &gt; +#<br>
&gt; &gt; +# The class assumes you have a data.mount systemd unit defined i=
n your<br>
&gt; &gt; +# systemd-machine-units recipe and installed to the image.<br>
&gt; &gt; +#<br>
&gt; &gt; +# Then you can specify writable directories on a recipe base<br>
&gt; &gt; +#<br>
&gt; &gt; +#=C2=A0 =C2=A0OVERLAYFS_WRITABLE_PATHS[data] =3D &quot;/usr/shar=
e/my-custom-application&quot;<br>
&gt; &gt; +#<br>
&gt; &gt; +# To support several mount points you can use a different variab=
le flag. Assume we<br>
&gt; &gt; +# want to have a writable location on the file system, but not i=
nterested where the data<br>
&gt; &gt; +# survive a reboot. Then we could have a mnt-overlay.mount unit =
for a tmpfs file system:<br>
&gt; &gt; +#<br>
&gt; &gt; +#=C2=A0 =C2=A0OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D &quot;/mnt/=
overlay&quot;<br>
&gt; &gt; +#=C2=A0 =C2=A0OVERLAYFS_WRITABLE_PATHS[mnt-overlay] =3D &quot;/u=
sr/share/another-application&quot;<br>
&gt; &gt; +#<br>
&gt; &gt; +# Note: the class does not support /etc directory itself, becaus=
e systemd depends on it<br>
&gt; <br>
&gt; <br>
&gt; Many thanks for this new class and the corresponding documentation.<br=
>
&gt; Richard, I guess that&#39;s something we&#39;ll need to document in th=
e manual,<br>
&gt; once it&#39;s merge, right?<br>
<br>
Ideally, yes, correct.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
</blockquote></div></div></div>

--00000000000090d86c05c8e3cec5--
