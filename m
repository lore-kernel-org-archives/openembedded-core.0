Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web10.13704.1602600417957544180
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 07:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=HpX0QL0J;
 spf=pass (domain: blade-group.com, ip: 209.85.210.66, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f66.google.com with SMTP id 32so233624otm.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lINMZVwtWhWhXytJ0rWbDaDaI4bhJFUL6iwGh0rlP6Q=;
        b=HpX0QL0JgDaj//jtuLVaTSjES0EeYwGvaD46jVvUV95v1umxz5JQ/f5bB5q1QTzh2r
         H0Us0ptohXNKZxND6xq8th6fYgo8kmfcKaOwmcvYuvZcIsSC3zNF0JU81UDZCxTU7zpi
         AH96j4iKBemoSPjBELZAK7exk3/3H1MxN0UBPy2aWuLdoYC+7+SUb8l4YfudPW+FpmSH
         7BW1IhNiC6cZZdi4Cw6g64e/OPuFRiL6uB+fuEAdi+3TrIZWxoebEgkBb4gMtLUha5Gs
         FAaZt02tpYmrsLe2EtPNwEUJGh620UnovstyBdWWR9TnkB3CuHPl+GLriCXaxOE2OG5S
         wlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lINMZVwtWhWhXytJ0rWbDaDaI4bhJFUL6iwGh0rlP6Q=;
        b=bjG1BeC2mduwKvDdjDzJDs1sCA7aSjlMTMUKTO0VYf5u7Iyw6VhfGSwaj3Kteyf++k
         Q/WY61Sthzqe2WGGZKD5Tpoc+oxNdF1vVhLK02tO1UaRPPD1BsnP2cJLALdB/M2kl0Wm
         Oj1VusrJjvg06n2X2JHj9oAiEj/mOBBWYj4QdFpr/3eINl33eRCHY0ACfBHygInIk+YU
         TrtLtYeaaEHS4tiwzimPDvqQ1bwxOKt4yR1T9ZZ0b5hFQDP6uodgJchQP9YF7rkZtgKk
         HKOFEgZsEbH9as7Z1dH1r6MiIYvB6DCbXf38Ifow79kgC49CCLwzExkRHgVIh3wlo9iW
         LOBw==
X-Gm-Message-State: AOAM530WVORsXLSh3zDRyWY3K0PKHtUHGZgrUVwicvXrYBc8dECpPJhP
	TaNhrXmUrygDYp3yKzZISpcbsstqrOo019ydchNKVA==
X-Google-Smtp-Source: ABdhPJw06mW67g6zoTqx7eodyiIINUbcrJ4N4p6RpSmlNMHbG48Ucg4MkThBsPddOQ07RQrXl+VGAlapAcrJ5E+6/r0=
X-Received: by 2002:a05:6830:1aca:: with SMTP id r10mr21709227otc.336.1602600417286;
 Tue, 13 Oct 2020 07:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com> <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
In-Reply-To: <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 13 Oct 2020 16:46:45 +0200
Message-ID: <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="00000000000096ee5205b18e7c12"

--00000000000096ee5205b18e7c12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <bruce.ashfield@gmail.com=
> a
=C3=A9crit :

> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <yann.dirson@blade-group.com=
>
> wrote:
> >
> >
> >
> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfield@gmai=
l.com>
> a =C3=A9crit :
> >>
> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <
> yann.dirson@blade-group.com> wrote:
> >> >
> >> > From: Yann Dirson <yann@blade-group.com>
> >> >
> >> > The warning was not issued because of a filename error (looking for=
 a
> >> > gatesgath-era file in older tree).
> >> >
> >> > Before gatesgarth we have two files (one with short list and one wi=
th
> >> > more details), whereas starting with gatesgarth we only have a sing=
le
> >> > file with all details.  Nevertheless, for consistency with the
> >> > presentation of "invalid.cfg" we'll just print the contents of the
> >> > short "mismatch.cfg" and point the user to the more detailed
> >> > information.
> >> >
> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> >> > ---
> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >> >
> >> > This is not applicable to master, where the "mismatch.txt" file exi=
sts
> >> > and shows even greater details.  Looks like the change was introduc=
ed
> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that b=
e a
> >> > mismatch with yocto-kernel-tools version ?
> >> >
> >> > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> >> > index cc8bcb909a..771b4d8654 100644
> >> > --- a/meta/classes/kernel-yocto.bbclass
> >> > +++ b/meta/classes/kernel-yocto.bbclass
> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
> >> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LEVEL")=
 or
> 0)
> >> >
> >> >      # if config check visibility is non-zero, report dropped
> configuration values
> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % kmeta)
> >>
> >> The use of mismatch.txt is completely intentional, and it is populate=
d
> >> by hardware tagged options that are detected as being mistmatches.
> >>
> >> So no, we don't want to directly expose mismatch.cfg. it shows
> >> unclassified options.
> >
> >
> > OK, so let's get back to the original problem:
> >
> > - I used to have kernel_configcheck report those problems enumerated i=
n
> mismatch.cfg / mismatch-all.txt,
> > but for some time I'm not getting them, and this could be since
> migration to sumo
> >
> > - those files are generated, and seem to contain real issues, whereas
> there is no mismatch.txt
> >
> > What do you see going wrong and how do we move forward ?
>
> Is your configuration something that I can set up and reproduce the
> problem ? I'm seeing what I expect out of the kconfig processing, but
> there very well could be a bug that isn't showing in the machines that
> I normally build.
>

The problem can be triggered with the default qemu_x86-64 configuration.
I'm just adding this in local.conf to inject a few options:

SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"

with this line in stuff.cfg:

CONFIG_EEEPC_LAPTOP=3Dy

On master I see:

WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0
do_kernel_configcheck: [kernel config]: specified values did not make it
into the kernel's final configuration:

    [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m) do not
match
    [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353
:configs/v5.8/standard/./hibern.cfg (y)

But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is listed in
mismatch*, though it is just
one of 127 issues, most of which looking pretty much valid at first
glance.  Are they not ?


> The visibility of the warnings has changed over time (I expose them,
> there are complaints, I make them less visible, and then the process
> repeats ..), so there could be something there as well.
>
> And as you noticed, I totally rewrote things in master, since
> maintaining the existing script was just too painful.
>
> Cheers,
>
> Bruce
>
> >
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >> >      if os.path.exists(mismatch_file):
> >> >          if config_check_visibility:
> >> > +            mismatch_details_file =3D
> d.expand("${S}/%s/cfg/mismatch-all.txt" % kmeta)
> >> >              with open (mismatch_file, "r") as myfile:
> >> >                  results =3D myfile.read()
> >> > -                bb.warn( "[kernel config]: specified values did no=
t
> make it into the kernel's final configuration:\n\n%s" % results)
> >> > +                bb.warn( "[kernel config]: specified values did no=
t
> make it into the kernel's final configuration (see details in %s):\n\n%s=
" %
> (mismatch_details_file, results))
> >> >
> >> >      if bsp_check_visibility:
> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" % kmet=
a)
> >> > --
> >> > 2.28.0
> >> >
> >> >
> >> >=20
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

--00000000000096ee5205b18e7c12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13 oct. 2020 =C3=A0=C2=
=A016:10, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">b=
ruce.ashfield@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, Oct 13, 2020 at 9:57 AM Yann Di=
rson &lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">y=
ann.dirson@blade-group.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson &lt;<a href=3D"mailto=
:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The warning was not issued because of a filename error (look=
ing for a<br>
&gt;&gt; &gt; gatesgath-era file in older tree).<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Before gatesgarth we have two files (one with short list and=
 one with<br>
&gt;&gt; &gt; more details), whereas starting with gatesgarth we only have=
 a single<br>
&gt;&gt; &gt; file with all details.=C2=A0 Nevertheless, for consistency w=
ith the<br>
&gt;&gt; &gt; presentation of &quot;invalid.cfg&quot; we&#39;ll just print=
 the contents of the<br>
&gt;&gt; &gt; short &quot;mismatch.cfg&quot; and point the user to the mor=
e detailed<br>
&gt;&gt; &gt; information.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-=
group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 5 +++--<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; This is not applicable to master, where the &quot;mismatch.t=
xt&quot; file exists<br>
&gt;&gt; &gt; and shows even greater details.=C2=A0 Looks like the change =
was introduced<br>
&gt;&gt; &gt; for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would=
 that be a<br>
&gt;&gt; &gt; mismatch with yocto-kernel-tools version ?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classe=
s/kernel-yocto.bbclass<br>
&gt;&gt; &gt; index cc8bcb909a..771b4d8654 100644<br>
&gt;&gt; &gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt; @@ -431,12 +431,13 @@ python do_kernel_configcheck() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bsp_check_visibility =3D int(d.getVar(&q=
uot;KCONF_BSP_AUDIT_LEVEL&quot;) or 0)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # if config check visibility is non-zero=
, report dropped configuration values<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S}/%s/cfg/=
mismatch.txt&quot; % kmeta)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S}/%s/cfg/=
mismatch.cfg&quot; % kmeta)<br>
&gt;&gt;<br>
&gt;&gt; The use of mismatch.txt is completely intentional, and it is popu=
lated<br>
&gt;&gt; by hardware tagged options that are detected as being mistmatches=
.<br>
&gt;&gt;<br>
&gt;&gt; So no, we don&#39;t want to directly expose mismatch.cfg. it show=
s<br>
&gt;&gt; unclassified options.<br>
&gt;<br>
&gt;<br>
&gt; OK, so let&#39;s get back to the original problem:<br>
&gt;<br>
&gt; - I used to have kernel_configcheck report those problems enumerated =
in mismatch.cfg / mismatch-all.txt,<br>
&gt; but for some time I&#39;m not getting them, and this could be since m=
igration to sumo<br>
&gt;<br>
&gt; - those files are generated, and seem to contain real issues, whereas=
 there is no mismatch.txt<br>
&gt;<br>
&gt; What do you see going wrong and how do we move forward ?<br>
<br>
Is your configuration something that I can set up and reproduce the<br>
problem ? I&#39;m seeing what I expect out of the kconfig processing, but<=
br>
there very well could be a bug that isn&#39;t showing in the machines that=
<br>
I normally build.<br></blockquote><div><br></div><div>The problem can be t=
riggered with the default qemu_x86-64 configuration.</div><div>I&#39;m just=
 adding this in local.conf to inject a few options:</div><div><br></div><di=
v>SRC_URI_append_pn-linux-yocto +=3D &quot; file://stuff.cfg&quot;</div><di=
v><br></div><div>with this line in stuff.cfg:</div><div><br></div><div>CONF=
IG_EEEPC_LAPTOP=3Dy</div><div><br></div><div>On master I see:</div><div><br=
></div><div>WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0 =
do_kernel_configcheck: [kernel config]: specified values did not make it in=
to the kernel&#39;s final configuration:<br><br>=C2=A0 =C2=A0 [NOTE]: &#39;=
CONFIG_EEEPC_LAPTOP&#39; last val (y) and .config val (m) do not match<br>=
=C2=A0 =C2=A0 [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353 :configs/v5=
.8/standard/./hibern.cfg (y) <br></div><div><br></div><div>But on dunfell I=
 don&#39;t see anything.=C2=A0 CONFIG_EEEPC_LAPTOP is listed in mismatch*, =
though it is just</div><div>one of 127 issues, most of which looking pretty=
 much valid at first glance.=C2=A0 Are they not ?<br></div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
The visibility of the warnings has changed over time (I expose them,<br>
there are complaints, I make them less visible, and then the process<br>
repeats ..), so there could be something there as well.<br>
<br>
And as you noticed, I totally rewrote things in master, since<br>
maintaining the existing script was just too painful.<br>
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(mismatch_file):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if config_check_visibility=
:<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mismatch_details_=
file =3D d.expand(&quot;${S}/%s/cfg/mismatch-all.txt&quot; % kmeta)<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (m=
ismatch_file, &quot;r&quot;) as myfile:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 results =3D myfile.read()<br>
&gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
warn( &quot;[kernel config]: specified values did not make it into the kern=
el&#39;s final configuration:\n\n%s&quot; % results)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.=
warn( &quot;[kernel config]: specified values did not make it into the kern=
el&#39;s final configuration (see details in %s):\n\n%s&quot; % (mismatch_d=
etails_file, results))<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if bsp_check_visibility:<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid_file =3D d.expand(=
&quot;${S}/%s/cfg/invalid.cfg&quot; % kmeta)<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.28.0<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <br>
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

--00000000000096ee5205b18e7c12--
