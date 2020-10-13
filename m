Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web11.15333.1602604028788920366
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 08:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=tfmaVK5V;
 spf=pass (domain: blade-group.com, ip: 209.85.210.65, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f65.google.com with SMTP id f37so392543otf.12
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VXSwrNKla1q6/7g4pIbWy7DqBVssBMQQE+UAU92FmGI=;
        b=tfmaVK5Vvw3wNv5g+CqUeDc2b9ekbE6wba32rzXortDZ7Kqn+xQZHPPi7T9yUE1MDj
         dN/G87DeM4GtXE7Z8HFOSPvkPbfDDBeq+L9sCosm0i6KZXLHnJDWZMt80UrRjIzijp69
         j7PwZJfVm64xA1vsMy4jXgKI7CiF3sT355QqLDI12zxyiwncRF544NR6A41zOO0jE3K7
         VWjxVMJMWPjRhv0t9nNrmvlcsqJ2r7H+0vbbdrefny2jghMMaBZEYeFiHFau5YtLLG49
         f5AXUncumjTaM4mR6siqsWKvX8ZFDWvpm/disZHtySGeTNHLrCoExH75+xEqV1V5aXx/
         g7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VXSwrNKla1q6/7g4pIbWy7DqBVssBMQQE+UAU92FmGI=;
        b=oa4YtQTZvvZReeBAzlrcAdstNNq0nQ209xE6vFgqWnhow9OgLIzy2u3ZF7QqesVxMO
         I3yxFxJD7H6RgsCRc89ZpkNRdPA/0yjS0/gBY550ki5auDXd9hwBE56B8l4bUA8qaNIl
         NQurPD+Z3IMSihLhruTA0DQkxLvaSmqdyykM2R0UYd0oXi1V5npD/D3a1QDtGnkz5Ecn
         /GuRCmGDp8RimiMgjOz2bp0nMniefjL9cYizNeYYpftF/OUvEJTAic+gQm4O0cwejCVj
         k5YmhqAYxb4tYWtK9nInpshfv1RrAC3VFXF8XET40pr0ZWJ0Ve7VFcxpcJbLgVTEBcww
         dLnw==
X-Gm-Message-State: AOAM531UAuG53qSAgAvJ81Bevtl6JnvjB5uNFoUfMjtQq596ZaaeJcD5
	DG7pWa5zKzI1TlHzK5t+8K1nM2bbft2dw6x5JoKBHA==
X-Google-Smtp-Source: ABdhPJymWf+3gJ5bqvztiDG2QNZWclkVPFdP1LHJeafm89RvmZF64JAc6pQy7B83VRI79hXch6ef5TKuCvEwgPIYTII=
X-Received: by 2002:a05:6830:1aca:: with SMTP id r10mr195848otc.336.1602604028061;
 Tue, 13 Oct 2020 08:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
 <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
 <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
 <CADkTA4P1NTdtB+uEmXvMr-p_DRM=h1Cb6SYSJhXbwB5s0fN0pQ@mail.gmail.com>
 <CA+4=imZoKoEF6=f0eOANjCF=-g03n3WdH_2J479xfh5ubkAA1A@mail.gmail.com> <CADkTA4PwfdFi+8TQQAsoLySO8z9qrra=V0K83duqVXteqjfTWw@mail.gmail.com>
In-Reply-To: <CADkTA4PwfdFi+8TQQAsoLySO8z9qrra=V0K83duqVXteqjfTWw@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 13 Oct 2020 17:46:56 +0200
Message-ID: <CA+4=imYV3KPHELxb18DTTjH8PffvsTWGebHW-ffE7baf7XPTZw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000cefd1705b18f537d"

--000000000000cefd1705b18f537d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 13 oct. 2020 =C3=A0 17:33, Bruce Ashfield <bruce.ashfield@gmail.com=
> a
=C3=A9crit :

> On Tue, Oct 13, 2020 at 11:12 AM Yann Dirson
> <yann.dirson@blade-group.com> wrote:
> >
> >
> >
> > Le mar. 13 oct. 2020 =C3=A0 17:04, Bruce Ashfield <bruce.ashfield@gmai=
l.com>
> a =C3=A9crit :
> >>
> >> On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson
> >> <yann.dirson@blade-group.com> wrote:
> >> >
> >> >
> >> >
> >> > Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <
> bruce.ashfield@gmail.com> a =C3=A9crit :
> >> >>
> >> >> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <
> yann.dirson@blade-group.com> wrote:
> >> >> >
> >> >> >
> >> >> >
> >> >> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <
> bruce.ashfield@gmail.com> a =C3=A9crit :
> >> >> >>
> >> >> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <
> yann.dirson@blade-group.com> wrote:
> >> >> >> >
> >> >> >> > From: Yann Dirson <yann@blade-group.com>
> >> >> >> >
> >> >> >> > The warning was not issued because of a filename error (looki=
ng
> for a
> >> >> >> > gatesgath-era file in older tree).
> >> >> >> >
> >> >> >> > Before gatesgarth we have two files (one with short list and
> one with
> >> >> >> > more details), whereas starting with gatesgarth we only have =
a
> single
> >> >> >> > file with all details.  Nevertheless, for consistency with th=
e
> >> >> >> > presentation of "invalid.cfg" we'll just print the contents o=
f
> the
> >> >> >> > short "mismatch.cfg" and point the user to the more detailed
> >> >> >> > information.
> >> >> >> >
> >> >> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> >> >> >> > ---
> >> >> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
> >> >> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >> >> >> >
> >> >> >> > This is not applicable to master, where the "mismatch.txt" fi=
le
> exists
> >> >> >> > and shows even greater details.  Looks like the change was
> introduced
> >> >> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would
> that be a
> >> >> >> > mismatch with yocto-kernel-tools version ?
> >> >> >> >
> >> >> >> > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> >> >> >> > index cc8bcb909a..771b4d8654 100644
> >> >> >> > --- a/meta/classes/kernel-yocto.bbclass
> >> >> >> > +++ b/meta/classes/kernel-yocto.bbclass
> >> >> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
> >> >> >> >      bsp_check_visibility =3D
> int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
> >> >> >> >
> >> >> >> >      # if config check visibility is non-zero, report dropped
> configuration values
> >> >> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" %
> kmeta)
> >> >> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" %
> kmeta)
> >> >> >>
> >> >> >> The use of mismatch.txt is completely intentional, and it is
> populated
> >> >> >> by hardware tagged options that are detected as being mistmatch=
es.
> >> >> >>
> >> >> >> So no, we don't want to directly expose mismatch.cfg. it shows
> >> >> >> unclassified options.
> >> >> >
> >> >> >
> >> >> > OK, so let's get back to the original problem:
> >> >> >
> >> >> > - I used to have kernel_configcheck report those problems
> enumerated in mismatch.cfg / mismatch-all.txt,
> >> >> > but for some time I'm not getting them, and this could be since
> migration to sumo
> >> >> >
> >> >> > - those files are generated, and seem to contain real issues,
> whereas there is no mismatch.txt
> >> >> >
> >> >> > What do you see going wrong and how do we move forward ?
> >> >>
> >> >> Is your configuration something that I can set up and reproduce th=
e
> >> >> problem ? I'm seeing what I expect out of the kconfig processing, =
but
> >> >> there very well could be a bug that isn't showing in the machines
> that
> >> >> I normally build.
> >> >
> >> >
> >> > The problem can be triggered with the default qemu_x86-64
> configuration.
> >> > I'm just adding this in local.conf to inject a few options:
> >> >
> >> > SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"
> >> >
> >> > with this line in stuff.cfg:
> >> >
> >> > CONFIG_EEEPC_LAPTOP=3Dy
> >> >
> >> > On master I see:
> >> >
> >> > WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0
> do_kernel_configcheck: [kernel config]: specified values did not make it
> into the kernel's final configuration:
> >> >
> >> >     [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m) =
do
> not match
> >> >     [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353
> :configs/v5.8/standard/./hibern.cfg (y)
> >> >
> >> > But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is listed
> in mismatch*, though it is just
> >> > one of 127 issues, most of which looking pretty much valid at first
> glance.  Are they not ?
> >>
> >> Only if something is tagged as "hardware" is it reported. The
> >> classification name is historical, so you can read "hardware" as
> >> "required / important / needed for boot". The organization of the
> >> fragments (and a push and pull between stand alone fragments,
> >> different configurations, software stacks, etc) means that there are
> >> many fragments that have some options listed, that are disabled due t=
o
> >> competing interests. Those are for the most part valid (to be
> >> different), and only differing values for the ones tagged as hardware
> >> are reported.
> >>
> >> So no, we really don't want to report all those options. That's the
> >> wobbling between reporting and non-reporting that I mentioned before.
> >
> >
> > Hm.  In our case, I've tried to write carefully-non-overlapping snippe=
ts,
> > and I'd like to get a warning on *any* mismatch because they would poi=
nt
> > to a bug in my files.  Should I write an additional configcheck stage
> that
> > would check for mismatch.cfg by itself ?  If so, what about gatesgarth=
 ?
>
> That's what the KCONF_BSP_AUDIT_LEVEL variable is for. It is used
> right now with:
>
>     if bsp_check_visibility > 2:
>         redefinition_file =3D d.expand("${S}/%s/cfg/redefinition.txt" %
> kmeta)
>
> In the kconfig audit reporting phase.  That dumps out a huge amount of
> info and will show you any duplicated/differing options through the
> fragment
> stack. In your own layer you could add the dumping of mismatch.cfg to th=
at
> step if you wanted (or invent a new, higher level of logging).
>

Oh I should have read the code more carefully, I would have noticed that,
even
as the doc does not mention it (in fact it seems that in dunfell  "2" is
not doing anything
more than "1", right ?):

# LEVELS:
#   0: no reporting
#   1: report options that are specified, but not in the final config
#   2: report options that are not hardware related, but set by a BSP


> Master already has a better way to deal with this, via the 'config blame=
'
> task.
>
> Bruce
>
> >
> >>
> >> In non-master, there's a complex way to tag options as hardware (and
> >> hopefully an easier way in master), so if there's a mismatch you'll
> >> see it.
> >>
> >> The delta between the two could be that I re-did the default
> >> classification buckets for the new kernel and that's why it shows in
> >> one, and not the other.
> >>
> >>  I can fire up a build on dunfell and see if I can see where the
> >> classification differs.
> >>
> >> Bruce
> >>
> >> >
> >> >>
> >> >> The visibility of the warnings has changed over time (I expose the=
m,
> >> >> there are complaints, I make them less visible, and then the proce=
ss
> >> >> repeats ..), so there could be something there as well.
> >> >>
> >> >> And as you noticed, I totally rewrote things in master, since
> >> >> maintaining the existing script was just too painful.
> >> >>
> >> >> Cheers,
> >> >>
> >> >> Bruce
> >> >>
> >> >> >
> >> >> >>
> >> >> >> Cheers,
> >> >> >>
> >> >> >> Bruce
> >> >> >>
> >> >> >> >      if os.path.exists(mismatch_file):
> >> >> >> >          if config_check_visibility:
> >> >> >> > +            mismatch_details_file =3D
> d.expand("${S}/%s/cfg/mismatch-all.txt" % kmeta)
> >> >> >> >              with open (mismatch_file, "r") as myfile:
> >> >> >> >                  results =3D myfile.read()
> >> >> >> > -                bb.warn( "[kernel config]: specified values
> did not make it into the kernel's final configuration:\n\n%s" % results)
> >> >> >> > +                bb.warn( "[kernel config]: specified values
> did not make it into the kernel's final configuration (see details in
> %s):\n\n%s" % (mismatch_details_file, results))
> >> >> >> >
> >> >> >> >      if bsp_check_visibility:
> >> >> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" =
%
> kmeta)
> >> >> >> > --
> >> >> >> > 2.28.0
> >> >> >> >
> >> >> >> >
> >> >> >> >=20
> >> >> >> >
> >> >> >>
> >> >> >>
> >> >> >> --
> >> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> >> >> >> thee at its end
> >> >> >> - "Use the force Harry" - Gandalf, Star Trek II
> >> >> >
> >> >> >
> >> >> >
> >> >> > --
> >> >> > Yann Dirson <yann@blade-group.com>
> >> >> > Blade / Shadow -- http://shadow.tech
> >> >> >
> >> >>
> >> >>
> >> >> --
> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
> >> >> thee at its end
> >> >> - "Use the force Harry" - Gandalf, Star Trek II
> >> >
> >> >
> >> >
> >> > --
> >> > Yann Dirson <yann@blade-group.com>
> >> > Blade / Shadow -- http://shadow.tech
> >> >
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Yann Dirson <yann@blade-group.com>
> > Blade / Shadow -- http://shadow.tech
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--000000000000cefd1705b18f537d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13 oct. 2020 =C3=A0=C2=
=A017:33, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">b=
ruce.ashfield@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, Oct 13, 2020 at 11:12 AM Yann D=
irson<br>
&lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.=
dirson@blade-group.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mar. 13 oct. 2020 =C3=A0 17:04, Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson<br>
&gt;&gt; &lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_bla=
nk">yann.dirson@blade-group.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson &lt;<a href=
=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blad=
e-group.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield &=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson &lt=
;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirs=
on@blade-group.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; From: Yann Dirson &lt;<a href=3D"mailto:ya=
nn@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; The warning was not issued because of a fi=
lename error (looking for a<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; gatesgath-era file in older tree).<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Before gatesgarth we have two files (one w=
ith short list and one with<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; more details), whereas starting with gates=
garth we only have a single<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; file with all details.=C2=A0 Nevertheless,=
 for consistency with the<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; presentation of &quot;invalid.cfg&quot; we=
&#39;ll just print the contents of the<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; short &quot;mismatch.cfg&quot; and point t=
he user to the more detailed<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; information.<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; Signed-off-by: Yann Dirson &lt;<a href=3D"=
mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 meta/classes/kernel-yocto.bbclass | =
5 +++--<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 d=
eletions(-)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; This is not applicable to master, where th=
e &quot;mismatch.txt&quot; file exists<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; and shows even greater details.=C2=A0 Look=
s like the change was introduced<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; for sumo in 5ef0620b18606fd5749b6e7811d337=
f26075b86b - would that be a<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; mismatch with yocto-kernel-tools version ?=
<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; diff --git a/meta/classes/kernel-yocto.bbc=
lass b/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; index cc8bcb909a..771b4d8654 100644<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --- a/meta/classes/kernel-yocto.bbclass<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +++ b/meta/classes/kernel-yocto.bbclass<br=
>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; @@ -431,12 +431,13 @@ python do_kernel_con=
figcheck() {<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bsp_check_visibility =
=3D int(d.getVar(&quot;KCONF_BSP_AUDIT_LEVEL&quot;) or 0)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # if config check visi=
bility is non-zero, report dropped configuration values<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 mismatch_file =3D d.expand(=
&quot;${S}/%s/cfg/mismatch.txt&quot; % kmeta)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 mismatch_file =3D d.expand(=
&quot;${S}/%s/cfg/mismatch.cfg&quot; % kmeta)<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; The use of mismatch.txt is completely intention=
al, and it is populated<br>
&gt;&gt; &gt;&gt; &gt;&gt; by hardware tagged options that are detected as=
 being mistmatches.<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; So no, we don&#39;t want to directly expose mis=
match.cfg. it shows<br>
&gt;&gt; &gt;&gt; &gt;&gt; unclassified options.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; OK, so let&#39;s get back to the original problem:<=
br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; - I used to have kernel_configcheck report those pr=
oblems enumerated in mismatch.cfg / mismatch-all.txt,<br>
&gt;&gt; &gt;&gt; &gt; but for some time I&#39;m not getting them, and thi=
s could be since migration to sumo<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; - those files are generated, and seem to contain re=
al issues, whereas there is no mismatch.txt<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; What do you see going wrong and how do we move forw=
ard ?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Is your configuration something that I can set up and re=
produce the<br>
&gt;&gt; &gt;&gt; problem ? I&#39;m seeing what I expect out of the kconfi=
g processing, but<br>
&gt;&gt; &gt;&gt; there very well could be a bug that isn&#39;t showing in=
 the machines that<br>
&gt;&gt; &gt;&gt; I normally build.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The problem can be triggered with the default qemu_x86-64 co=
nfiguration.<br>
&gt;&gt; &gt; I&#39;m just adding this in local.conf to inject a few optio=
ns:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; SRC_URI_append_pn-linux-yocto +=3D &quot; file://stuff.cfg&q=
uot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; with this line in stuff.cfg:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; CONFIG_EEEPC_LAPTOP=3Dy<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On master I see:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-=
r0 do_kernel_configcheck: [kernel config]: specified values did not make it=
 into the kernel&#39;s final configuration:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[NOTE]: &#39;CONFIG_EEEPC_LAPTOP&#39; las=
t val (y) and .config val (m) do not match<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0[INFO]: CONFIG_EEEPC_LAPTOP : m ## .confi=
g: 4353 :configs/v5.8/standard/./hibern.cfg (y)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; But on dunfell I don&#39;t see anything.=C2=A0 CONFIG_EEEPC_=
LAPTOP is listed in mismatch*, though it is just<br>
&gt;&gt; &gt; one of 127 issues, most of which looking pretty much valid a=
t first glance.=C2=A0 Are they not ?<br>
&gt;&gt;<br>
&gt;&gt; Only if something is tagged as &quot;hardware&quot; is it reporte=
d. The<br>
&gt;&gt; classification name is historical, so you can read &quot;hardware=
&quot; as<br>
&gt;&gt; &quot;required / important / needed for boot&quot;. The organizat=
ion of the<br>
&gt;&gt; fragments (and a push and pull between stand alone fragments,<br>
&gt;&gt; different configurations, software stacks, etc) means that there =
are<br>
&gt;&gt; many fragments that have some options listed, that are disabled d=
ue to<br>
&gt;&gt; competing interests. Those are for the most part valid (to be<br>
&gt;&gt; different), and only differing values for the ones tagged as hard=
ware<br>
&gt;&gt; are reported.<br>
&gt;&gt;<br>
&gt;&gt; So no, we really don&#39;t want to report all those options. That=
&#39;s the<br>
&gt;&gt; wobbling between reporting and non-reporting that I mentioned bef=
ore.<br>
&gt;<br>
&gt;<br>
&gt; Hm.=C2=A0 In our case, I&#39;ve tried to write carefully-non-overlapp=
ing snippets,<br>
&gt; and I&#39;d like to get a warning on *any* mismatch because they woul=
d point<br>
&gt; to a bug in my files.=C2=A0 Should I write an additional configcheck =
stage that<br>
&gt; would check for mismatch.cfg by itself ?=C2=A0 If so, what about gate=
sgarth ?<br>
<br>
That&#39;s what the KCONF_BSP_AUDIT_LEVEL variable is for. It is used<br>
right now with:<br>
<br>
=C2=A0 =C2=A0 if bsp_check_visibility &gt; 2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 redefinition_file =3D d.expand(&quot;${S}/%s/c=
fg/redefinition.txt&quot; % kmeta)<br>
<br>
In the kconfig audit reporting phase.=C2=A0 That dumps out a huge amount o=
f<br>
info and will show you any duplicated/differing options through the fragme=
nt<br>
stack. In your own layer you could add the dumping of mismatch.cfg to that=
<br>
step if you wanted (or invent a new, higher level of logging).<br></blockq=
uote><div><br></div><div>Oh I should have read the code more carefully, I w=
ould have noticed that, even</div><div>as the doc does not mention it (in f=
act it seems that in dunfell=C2=A0 &quot;2&quot; is not doing anything</div=
><div>more than &quot;1&quot;, right ?):<br></div><div><br></div><div> # LE=
VELS:<br># =C2=A0 0: no reporting<br># =C2=A0 1: report options that are sp=
ecified, but not in the final config<br># =C2=A0 2: report options that are=
 not hardware related, but set by a BSP</div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
Master already has a better way to deal with this, via the &#39;config bla=
me&#39;<br>
task.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; In non-master, there&#39;s a complex way to tag options as hardwa=
re (and<br>
&gt;&gt; hopefully an easier way in master), so if there&#39;s a mismatch =
you&#39;ll<br>
&gt;&gt; see it.<br>
&gt;&gt;<br>
&gt;&gt; The delta between the two could be that I re-did the default<br>
&gt;&gt; classification buckets for the new kernel and that&#39;s why it s=
hows in<br>
&gt;&gt; one, and not the other.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 I can fire up a build on dunfell and see if I can see where=
 the<br>
&gt;&gt; classification differs.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The visibility of the warnings has changed over time (I =
expose them,<br>
&gt;&gt; &gt;&gt; there are complaints, I make them less visible, and then=
 the process<br>
&gt;&gt; &gt;&gt; repeats ..), so there could be something there as well.<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; And as you noticed, I totally rewrote things in master, =
since<br>
&gt;&gt; &gt;&gt; maintaining the existing script was just too painful.<br=
>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Bruce<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; Bruce<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(mism=
atch_file):<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if confi=
g_check_visibility:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 mismatch_details_file =3D d.expand(&quot;${S}/%s/cfg/mismatch-all.txt&quot=
; % kmeta)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 with open (mismatch_file, &quot;r&quot;) as myfile:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 results =3D myfile.read()<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.warn( &quot;[kernel config]: specified values did not mak=
e it into the kernel&#39;s final configuration:\n\n%s&quot; % results)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 bb.warn( &quot;[kernel config]: specified values did not mak=
e it into the kernel&#39;s final configuration (see details in %s):\n\n%s&q=
uot; % (mismatch_details_file, results))<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if bsp_check_visibilit=
y:<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid_=
file =3D d.expand(&quot;${S}/%s/cfg/invalid.cfg&quot; % kmeta)<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; 2.28.0<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt; <br>
&gt;&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for c=
haos and madness await<br>
&gt;&gt; &gt;&gt; &gt;&gt; thee at its end<br>
&gt;&gt; &gt;&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, St=
ar Trek II<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.=
com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; Blade / Shadow -- <a href=3D"http://shadow.tech" re=
l=3D"noreferrer" target=3D"_blank">http://shadow.tech</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and =
madness await<br>
&gt;&gt; &gt;&gt; thee at its end<br>
&gt;&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek I=
I<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" targ=
et=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt; Blade / Shadow -- <a href=3D"http://shadow.tech" rel=3D"nore=
ferrer" target=3D"_blank">http://shadow.tech</a><br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness a=
wait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_bl=
ank">yann@blade-group.com</a>&gt;<br>
&gt; Blade / Shadow -- <a href=3D"http://shadow.tech" rel=3D"noreferrer" t=
arget=3D"_blank">http://shadow.tech</a><br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--000000000000cefd1705b18f537d--
