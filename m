Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.6259.1619748797183523974
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Apr 2021 19:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HMs5lr/B;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id o12so3056006qtx.8
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Apr 2021 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AZRJSUU85FZttpUp/HahflgCBTjPMuC0gkgGK478Qn0=;
        b=HMs5lr/BLvJz71epacErVpmSCSkLEFM6Qvxy9I+Iu9cDB9q/8E4Vb9Vh6QgxyzEmit
         tjz2MmG2t3jlyp4l64uQTaFNG25y67MouJgGfTuLM33XRADfF/PKLNMU4hKFxeRPlPLw
         mamuXlr+gCNcHdEU0wz8oX8osm5HFESptXgNpH74nMWIFdy7qSBgtxhla2Mu2RHEii/u
         bn0utwgwBn4kYyLZp+VrdZZbmdOPkufpYICFF8w9RzTQW6zY0hw21MXBts+KZRKgvuMa
         /qQlBkHTwTS9Ac6LOWtC/9XTn2KDgKwcPsEv/cTEwq+mLNrrebd6aDn1uvMHvEiQQQaF
         gxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AZRJSUU85FZttpUp/HahflgCBTjPMuC0gkgGK478Qn0=;
        b=FTMoA9heGkN1ijJ7Qaaao938KnVFsfycRg/i3SZSIHF8vY2Nq91mr3dcrJOgKeLAcz
         Zn6hgh4/kifN+BOjukI4GpUt4nmpACtHIL492R0E5gKhc8sapvVyX9hvYlJ1E92OoCcz
         Ht5i+TrgZehtzWFBpScgx5FI1zdti4nmTIpHAMtvCRLBM3/+N6ys54ACpXBXe8QROvW4
         w+wo5bqrPnCTaZt3eN35BnnP7vXmGfKSV0mnmcXfstiYzR4fdX6XuOWM1SziJ2SpVtP9
         Oyolwj83nxLSZE+mdgkM+9K+6OOfv1LwKPBNeO67KLG0/zMLbsgYdKiemLWlJUXJUbXM
         LO1Q==
X-Gm-Message-State: AOAM5305fbLRueqcu83Z6i38y4DdfMhKf/uhOOA2JIKgX3RUHlRNCvdb
	hYvRpNcCDlFoOSQ94MtCaaJGJ1HymDMAQG8FeIw=
X-Google-Smtp-Source: ABdhPJz0b7EFlnzGWEhp75mK5Ohnk17qzEq0VPhiQ+lJtg+wFlvOq39QjGP+UNyb48nmyQS+w4a/4wQSqUdogzMCjxQ=
X-Received: by 2002:ac8:5a46:: with SMTP id o6mr2242183qta.289.1619748796342;
 Thu, 29 Apr 2021 19:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210428050546.1708751-1-raj.khem@gmail.com> <CAJ86T=VMvrV=b9WX32UKJCcJRKYPpUAoZyaT++ms4ECt=BzTNg@mail.gmail.com>
 <CAMKF1so_PdahL392rY79febr54=dB4v5f9KV5Eg6OmxoyH_XvQ@mail.gmail.com> <CAJ86T=Ut25T9FGKmYHBM+U-yQ+z+GMFib5HexyYh6R5Ohyv2hQ@mail.gmail.com>
In-Reply-To: <CAJ86T=Ut25T9FGKmYHBM+U-yQ+z+GMFib5HexyYh6R5Ohyv2hQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Apr 2021 19:13:05 -0700
Message-ID: <CAMKF1spfpW8o4HMG8++a5H9WBqzahOQB-2D_29KRJO6-JUxw+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] busybox: Enable long options for enabled applets
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a1a49c05c127270a"

--000000000000a1a49c05c127270a
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 29, 2021 at 5:44 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Apr 29, 2021 at 3:29 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 28, 2021 at 10:40 AM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> > >
> > > On Tue, Apr 27, 2021 at 10:06 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > > certain applets are enabled but the long options are not enabled for
> > > > them, it results in subtle failures in ptests where its expecting
> these
> > > > options e.g. gzip --best is commonly used in many package tests e.g.
> > > >
> > > > root@qemux86-64:/usr/lib# grep -r "\-\-best" *
> > > > acl/ptest/Makefile:GZIP_ENV = --best
> > > > attr/ptest/Makefile:GZIP_ENV = --best
> > > > coreutils/ptest/Makefile:GZIP_ENV = --best
> > > > ethtool/ptest/Makefile:GZIP_ENV = --best
> > > > libxml2/ptest/Makefile:GZIP_ENV = --best
> > > > lttng-tools/ptest/Makefile:GZIP_ENV = --best
> > > > opkg/ptest/Makefile:GZIP_ENV = --best
> > > > perl/ptest/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm:
> COMPRESS     ('gzip --best')
> > > > python3.9/test/test_gzip.py:        for compress_level in ('--fast',
> '--best'):
> > > > ...
> > > >
> > > > this ensures that these options are enabled by default, which makes
> them more
> > > > compatible than now with coreutils provided utilities
> > > >
> > > > busybox size grows by 4K which perhaps is acceptable
> > > >
> > > > --rwxr-xr-x root       root           817704 ./bin/busybox.nosuid
> > > > +-rwxr-xr-x root       root           821800 ./bin/busybox.nosuid
> > > >
> > > > This makes autopoint-3/gettext pass
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/recipes-core/busybox/busybox/getopts.cfg | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg
> b/meta/recipes-core/busybox/busybox/getopts.cfg
> > > > index 8db0a4a8f2..aeb5ac691f 100644
> > > > --- a/meta/recipes-core/busybox/busybox/getopts.cfg
> > > > +++ b/meta/recipes-core/busybox/busybox/getopts.cfg
> > > > @@ -1,3 +1,10 @@
> > > >  CONFIG_GETOPT=y
> > > >  CONFIG_LONG_OPTS=y
> > > >  CONFIG_FEATURE_GETOPT_LONG=y
> > > > +CONFIG_FEATURE_GZIP_LONG_OPTIONS=y
> > > > +CONFIG_FEATURE_TAR_LONG_OPTIONS=y
> > > > +CONFIG_FEATURE_CHOWN_LONG_OPTIONS=y
> > > > +CONFIG_FEATURE_CP_LONG_OPTIONS=y
> > > > +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=y
> > > > +CONFIG_FEATURE_DIFF_LONG_OPTIONS=y
> > > > +CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=y
> > >
> > > What's the connection between enabling the getopt applet (a utility to
> > > help with parsing options in shell scripts etc) and enabling support
> > > for long options in a bunch of other unconnected apps?
> > >
> > > I think enabling support for long options in a particular app would be
> > > better done where that app is enabled (e.g.
> > > CONFIG_FEATURE_GZIP_LONG_OPTIONS should be enabled where CONFIG_GZIP
> > > is enabled - in the defconfig file).
> >
> > I experimented a bit more and it seems that these options are tied to
> > the corresponding feature being enabled
> > so they can be enabled in a fragment, unless the feature itself is
> > enabled it will be ignored and disabled. So for
> > disabled features/applets these options are moot. So as such, I think
> > enabling them is a good thing as it will
> > widen the ecompatibility for busibox systems.
>
> OK, so all that's left to do is to move them into their own config
> fragment (since they have nothing to do with the existing getops
> config fragment).


Yeah perhaps a single flagment is good enough

>
>

--000000000000a1a49c05c127270a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 29, 2021 at 5:44 PM Andre McCurdy &lt;<a href=
=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Thu, Apr 29, 2021 at 3:29 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Apr 28, 2021 at 10:40 AM Andre McCurdy &lt;<a href=3D"mailto:a=
rmccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; On Tue, Apr 27, 2021 at 10:06 PM Khem Raj &lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; certain applets are enabled but the long options are not ena=
bled for<br>
&gt; &gt; &gt; them, it results in subtle failures in ptests where its expe=
cting these<br>
&gt; &gt; &gt; options e.g. gzip --best is commonly used in many package te=
sts e.g.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; root@qemux86-64:/usr/lib# grep -r &quot;\-\-best&quot; *<br>
&gt; &gt; &gt; acl/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; attr/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; coreutils/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; ethtool/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; libxml2/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; lttng-tools/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; opkg/ptest/Makefile:GZIP_ENV =3D --best<br>
&gt; &gt; &gt; perl/ptest/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm=
:=C2=A0 =C2=A0 COMPRESS=C2=A0 =C2=A0 =C2=A0(&#39;gzip --best&#39;)<br>
&gt; &gt; &gt; python3.9/test/test_gzip.py:=C2=A0 =C2=A0 =C2=A0 =C2=A0 for =
compress_level in (&#39;--fast&#39;, &#39;--best&#39;):<br>
&gt; &gt; &gt; ...<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; this ensures that these options are enabled by default, whic=
h makes them more<br>
&gt; &gt; &gt; compatible than now with coreutils provided utilities<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; busybox size grows by 4K which perhaps is acceptable<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --rwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0817704 ./bin/busybox.nosuid<br>
&gt; &gt; &gt; +-rwxr-xr-x root=C2=A0 =C2=A0 =C2=A0 =C2=A0root=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0821800 ./bin/busybox.nosuid<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This makes autopoint-3/gettext pass<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 meta/recipes-core/busybox/busybox/getopts.cfg | 7 ++++=
+++<br>
&gt; &gt; &gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; diff --git a/meta/recipes-core/busybox/busybox/getopts.cfg b=
/meta/recipes-core/busybox/busybox/getopts.cfg<br>
&gt; &gt; &gt; index 8db0a4a8f2..aeb5ac691f 100644<br>
&gt; &gt; &gt; --- a/meta/recipes-core/busybox/busybox/getopts.cfg<br>
&gt; &gt; &gt; +++ b/meta/recipes-core/busybox/busybox/getopts.cfg<br>
&gt; &gt; &gt; @@ -1,3 +1,10 @@<br>
&gt; &gt; &gt;=C2=A0 CONFIG_GETOPT=3Dy<br>
&gt; &gt; &gt;=C2=A0 CONFIG_LONG_OPTS=3Dy<br>
&gt; &gt; &gt;=C2=A0 CONFIG_FEATURE_GETOPT_LONG=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_GZIP_LONG_OPTIONS=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_TAR_LONG_OPTIONS=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_CHOWN_LONG_OPTIONS=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_CP_LONG_OPTIONS=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_INSTALL_LONG_OPTIONS=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_DIFF_LONG_OPTIONS=3Dy<br>
&gt; &gt; &gt; +CONFIG_FEATURE_SETCONSOLE_LONG_OPTIONS=3Dy<br>
&gt; &gt;<br>
&gt; &gt; What&#39;s the connection between enabling the getopt applet (a u=
tility to<br>
&gt; &gt; help with parsing options in shell scripts etc) and enabling supp=
ort<br>
&gt; &gt; for long options in a bunch of other unconnected apps?<br>
&gt; &gt;<br>
&gt; &gt; I think enabling support for long options in a particular app wou=
ld be<br>
&gt; &gt; better done where that app is enabled (e.g.<br>
&gt; &gt; CONFIG_FEATURE_GZIP_LONG_OPTIONS should be enabled where CONFIG_G=
ZIP<br>
&gt; &gt; is enabled - in the defconfig file).<br>
&gt;<br>
&gt; I experimented a bit more and it seems that these options are tied to<=
br>
&gt; the corresponding feature being enabled<br>
&gt; so they can be enabled in a fragment, unless the feature itself is<br>
&gt; enabled it will be ignored and disabled. So for<br>
&gt; disabled features/applets these options are moot. So as such, I think<=
br>
&gt; enabling them is a good thing as it will<br>
&gt; widen the ecompatibility for busibox systems.<br>
<br>
OK, so all that&#39;s left to do is to move them into their own config<br>
fragment (since they have nothing to do with the existing getops<br>
config fragment).</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Yeah perhaps a single flagment is good enough=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex" dir=3D"auto"><br>
</blockquote></div></div>

--000000000000a1a49c05c127270a--
