Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.12003.1586183584745674373
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2020 07:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RnXG3VAw;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id bu9so7562694qvb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2020 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AeWIMtm8/X3YzVFubtOFFZnrIvEQZxHv26GUZMFY0JE=;
        b=RnXG3VAwUnHz9Sq4BzO7e4bQGVIh/mcRzzDJ7iNRfJ99sEAMTVoarMtolfn+TxFN75
         DObNW++gTvgQqHkNmMq9LKP4JsSuu9UEYnxtE5pfEackjj2S2hWP5bsCnwtsOfBYQbMD
         OkLOBdFXMHzmDv1enE/NX8F4Y2ltdv0+j05XvZDvRG3lcLqEIh/s9yx7LCSSRrVX/E0W
         DioZ+d6OtWtKk6H4xeXjK8tkZdSDUHP3nv35v7jkFwC5T90VvLNngEwtnEw4/DcyizuW
         +auf7DhgSMh7deMuEz5PoSuJSVXEk6TFaUANen7fTl0LJ2LQBl6O4Xw7EZvt/QK8Ddsp
         pdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AeWIMtm8/X3YzVFubtOFFZnrIvEQZxHv26GUZMFY0JE=;
        b=TEDtXqwIw44oDJef6cYRzv5EHosFP+nYHZbpJRFmzu721Y/Y46fzCMERyQ2GZu2AvC
         V0ImFlyJ2aqrAFQzGwr+RjH85RiC6kOWpxcns3SjNd2XMK+EC2IijcH5ZwY4Ram8V5VM
         XgDRudXaDwlT8LiK6K+NbJEbM/982RQ12AJ5yQMSs6VVZTiHKgibaNlGfdelcr8RSF7s
         wQyR2AclA7WiuZpgrE9lLt0c6925aKeNtEkpyO2CRdnWuufCGAdOvtu5b+TNKtn2wl3S
         ac5nx8N2IKtwEJ4Lma08JQO6S5DXdxQ0lWODMlcVP2nRcOa0YuCCjW8owKbPHCdb/XCz
         Dclg==
X-Gm-Message-State: AGi0PuYZqLXRrPTwCYNrXz53c1JpD6zXBUc0i/pyYObZm4JlwdEAzqkQ
	Te8VcdDy31FokwPSRXHOa31zj1hL/z+rZcnHoa4=
X-Google-Smtp-Source: APiQypLkHip7oUjwC35PzwD+Q7Q+/Hsw3EmqOnTSPMJPwXySP9wWb9FEQWR2ZOPNte60Dtq47yJsvqa2vdpPBxNsVk8=
X-Received: by 2002:a05:6214:6a1:: with SMTP id s1mr4573305qvz.130.1586183583576;
 Mon, 06 Apr 2020 07:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200311113235.61655-1-trevor.gamblin@windriver.com>
 <20200311113235.61655-2-trevor.gamblin@windriver.com> <CAMKF1spd-onZWc9j+Jx58zYtRUpAPC6X0wm+t0YSmgctmWD6Vg@mail.gmail.com>
 <5ebbb63be39a442c740660ff321338f522dc4b68.camel@linuxfoundation.org>
In-Reply-To: <5ebbb63be39a442c740660ff321338f522dc4b68.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 6 Apr 2020 07:32:52 -0700
Message-ID: <CAMKF1so-A14JBx3CBAed2+zeBYN_Z8khPAMiXhcwT4HO-ZdsGg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2 v5] coreutils: add ptest
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000000c484905a2a02551"

--0000000000000c484905a2a02551
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2020 at 4:58 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2020-04-05 at 17:26 -0700, Khem Raj wrote:
> > On Wed, Mar 11, 2020 at 4:33 AM Trevor Gamblin
> > <trevor.gamblin@windriver.com> wrote:
> > > +inherit ptest
> > > +
> > > +RDEPENDS_${PN}-ptest +=3D "bash findutils gawk liberror-perl
> libmodule-build-perl make perl perl-module-file-stat python3-core sed
> shadow"
> > > +
> >
> > Adding libmodule-build-perl to rdeps here is pulling in whole target
> > toolchain components now while building core-image-minimal
> > the dependency chain looks like, total task building for this image are
> 3000+
> >
> > "coreutils.do_package_qa" -> "libmodule-build-perl.do_packagedata" ->
> > "packagegroup-core-buildessential.do_packagedata" ->
> > "gcc.do_packagedata"
> >
> > IMO, it's a bad experience for the user when building a simple minimal
> > image and it ends up building whole toolchain for target that
> > eventually won't even
> > be part of the image. perhaps make it dependent on ptest or some such
> > knob thats not commonly used.
> >
> > Please revert this patch series until we can find a way to not insert
> > these build-time dependencies in normal flow.
>
> We were aware of this when it merged. This should already only happen
> if ptest is enabled?
>

I am seeing it with a fresh checkout of poky with no other changes


> (else ${PN}-ptest isn't in PACKAGES and hence the RDEPENDS isn't seen).
>
> I wish we had a better way of handling these dependencies but we sadly
> don't.
>

Such changes should be left to users to enable imo may be a packageconfig
or so

People have reputation of long build times and large disk space for OE this
won=E2=80=99t help that cause

>
> Cheers,
>
> Richard
>
>
>
>

--0000000000000c484905a2a02551
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 6, 2020 at 4:58 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2020-=
04-05 at 17:26 -0700, Khem Raj wrote:<br>
&gt; On Wed, Mar 11, 2020 at 4:33 AM Trevor Gamblin<br>
&gt; &lt;<a href=3D"mailto:trevor.gamblin@windriver.com" target=3D"_blank">=
trevor.gamblin@windriver.com</a>&gt; wrote:<br>
&gt; &gt; +inherit ptest<br>
&gt; &gt; +<br>
&gt; &gt; +RDEPENDS_${PN}-ptest +=3D &quot;bash findutils gawk liberror-per=
l libmodule-build-perl make perl perl-module-file-stat python3-core sed sha=
dow&quot;<br>
&gt; &gt; +<br>
&gt; <br>
&gt; Adding libmodule-build-perl to rdeps here is pulling in whole target<b=
r>
&gt; toolchain components now while building core-image-minimal<br>
&gt; the dependency chain looks like, total task building for this image ar=
e 3000+<br>
&gt; <br>
&gt; &quot;coreutils.do_package_qa&quot; -&gt; &quot;libmodule-build-perl.d=
o_packagedata&quot; -&gt;<br>
&gt; &quot;packagegroup-core-buildessential.do_packagedata&quot; -&gt;<br>
&gt; &quot;gcc.do_packagedata&quot;<br>
&gt; <br>
&gt; IMO, it&#39;s a bad experience for the user when building a simple min=
imal<br>
&gt; image and it ends up building whole toolchain for target that<br>
&gt; eventually won&#39;t even<br>
&gt; be part of the image. perhaps make it dependent on ptest or some such<=
br>
&gt; knob thats not commonly used.<br>
&gt; <br>
&gt; Please revert this patch series until we can find a way to not insert<=
br>
&gt; these build-time dependencies in normal flow.<br>
<br>
We were aware of this when it merged. This should already only happen<br>
if ptest is enabled?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I am seeing it w=
ith a fresh checkout of poky with no other changes=C2=A0</div><div dir=3D"a=
uto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><br>
(else ${PN}-ptest isn&#39;t in PACKAGES and hence the RDEPENDS isn&#39;t se=
en).<br>
<br>
I wish we had a better way of handling these dependencies but we sadly<br>
don&#39;t.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Such changes sho=
uld be left to users to enable imo may be a packageconfig or so=C2=A0</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">People have reputation of lon=
g build times and large disk space for OE this won=E2=80=99t help that caus=
e=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div></div>

--0000000000000c484905a2a02551--
