Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.121.1602605652156982014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 09:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=ESfpXhUV;
 spf=pass (domain: blade-group.com, ip: 209.85.210.68, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f68.google.com with SMTP id d28so551592ote.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 09:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSS4keAky8qGCz4LWvHpXyA4vc83zse+PEmK57su6gM=;
        b=ESfpXhUV7RS5D4pfex5nwivI8o1/d6otxXmp6LNmUnJWj4WXqE7N3y0mY/aeRf4ZEF
         nxoov/CYyUGyYsn5CQk1tXyukMpBzsTioS6CBJELrybpzF1iPQ5JyNAlICEJwFW8f7eA
         9lfCq6aAEHRhR9UNX1C/F/DBUAWJRyR5Z3fGO4+LzHvy9hOQa3cKVnmm+BenGEYTsnlm
         UjAqIABZzSrIn9NccEVTnkWG9bcmFpOW/3j7sPdwfMDQRytWFI/xz30WlXjGzYwaUynj
         YSUTGBNHQ7yH0cqv3PPd6tHl8Ya7u3QBrbtusMJSoLg0li7pUOkdDD102+PFeKWPR9lK
         aHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DSS4keAky8qGCz4LWvHpXyA4vc83zse+PEmK57su6gM=;
        b=rZQ9yMFyL5FjZEYWhTsEPwKHLBZ5wD54KrOyEYCHrNUql+m+OR107cCciQZoaeyOkX
         gselAQ7c+0BCv+JtdBZTJ1KGrYnyhIafppQRRLPQdwQfvV5k7S3+5Zp+jeAjbvN9UUUf
         HwiOyzcumBgveKwVRybZketIdxHivhwaP9Hks5GQ2tys2GLKn/8mL6/na9XnB3yS0YQT
         vhisE3YGEIS1usvWsC1HG+h3xSFx1UuMCR8tr+fEo3TKqGTkbxdRLdBEFbaIzVTBfNUQ
         sHp+4xTmMYFestQzXHUe++RzySZa43xKEbRCO6sq99ZTf1P/fFbj1D8CfLbSJYV0mSAo
         l13A==
X-Gm-Message-State: AOAM533bzTLZMyOo5MHFrfyDgUXsSJ9j1T4sJ/zaq7lIaBqTxSaPO2Ep
	z2Eltm77UFZ1O+rDxf31rS+3ffonkqL5VRWdLxuLvg==
X-Google-Smtp-Source: ABdhPJyTfuDCKWRqXzdcjNirrmyBPImxp0TOLyUq0hVoXlwcdZSxVwG8U6AY3zKZIjUOD2FpADdPbgZbW/36CVD9Ul4=
X-Received: by 2002:a9d:7384:: with SMTP id j4mr278512otk.191.1602605651440;
 Tue, 13 Oct 2020 09:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com>
 <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
 <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
 <CADkTA4PdEovbL92GwCUv6hnOr3ZtnNA8E35DyVfr09sLNUrpOA@mail.gmail.com>
 <CA+4=imbvST+-gMoKUc9hig+HCiPCRgt7jErGCmpJMrS3+QxLtw@mail.gmail.com>
 <CADkTA4P1NTdtB+uEmXvMr-p_DRM=h1Cb6SYSJhXbwB5s0fN0pQ@mail.gmail.com> <163D95FBF3243152.10178@lists.openembedded.org>
In-Reply-To: <163D95FBF3243152.10178@lists.openembedded.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 13 Oct 2020 18:13:59 +0200
Message-ID: <CA+4=imYuwUYOqNYMy=YH=JXqtC_RRn8LTNKqeYhp6YNmBQsyRA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="00000000000091c85905b18fb491"

--00000000000091c85905b18fb491
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 13 oct. 2020 =C3=A0 17:12, Yann Dirson via lists.openembedded.org
<yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :

>
>
> Le mar. 13 oct. 2020 =C3=A0 17:04, Bruce Ashfield <bruce.ashfield@gmail.=
com> a
> =C3=A9crit :
>
>> On Tue, Oct 13, 2020 at 10:46 AM Yann Dirson
>> <yann.dirson@blade-group.com> wrote:
>> >
>> >
>> >
>> > Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield <bruce.ashfield@gma=
il.com>
>> a =C3=A9crit :
>> >>
>> >> On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson <
>> yann.dirson@blade-group.com> wrote:
>> >> >
>> >> >
>> >> >
>> >> > Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <
>> bruce.ashfield@gmail.com> a =C3=A9crit :
>> >> >>
>> >> >> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <
>> yann.dirson@blade-group.com> wrote:
>> >> >> >
>> >> >> > From: Yann Dirson <yann@blade-group.com>
>> >> >> >
>> >> >> > The warning was not issued because of a filename error (looking
>> for a
>> >> >> > gatesgath-era file in older tree).
>> >> >> >
>> >> >> > Before gatesgarth we have two files (one with short list and on=
e
>> with
>> >> >> > more details), whereas starting with gatesgarth we only have a
>> single
>> >> >> > file with all details.  Nevertheless, for consistency with the
>> >> >> > presentation of "invalid.cfg" we'll just print the contents of =
the
>> >> >> > short "mismatch.cfg" and point the user to the more detailed
>> >> >> > information.
>> >> >> >
>> >> >> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>> >> >> > ---
>> >> >> >  meta/classes/kernel-yocto.bbclass | 5 +++--
>> >> >> >  1 file changed, 3 insertions(+), 2 deletions(-)
>> >> >> >
>> >> >> > This is not applicable to master, where the "mismatch.txt" file
>> exists
>> >> >> > and shows even greater details.  Looks like the change was
>> introduced
>> >> >> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would th=
at
>> be a
>> >> >> > mismatch with yocto-kernel-tools version ?
>> >> >> >
>> >> >> > diff --git a/meta/classes/kernel-yocto.bbclass
>> b/meta/classes/kernel-yocto.bbclass
>> >> >> > index cc8bcb909a..771b4d8654 100644
>> >> >> > --- a/meta/classes/kernel-yocto.bbclass
>> >> >> > +++ b/meta/classes/kernel-yocto.bbclass
>> >> >> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
>> >> >> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LEV=
EL")
>> or 0)
>> >> >> >
>> >> >> >      # if config check visibility is non-zero, report dropped
>> configuration values
>> >> >> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % km=
eta)
>> >> >> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % km=
eta)
>> >> >>
>> >> >> The use of mismatch.txt is completely intentional, and it is
>> populated
>> >> >> by hardware tagged options that are detected as being mistmatches=
.
>> >> >>
>> >> >> So no, we don't want to directly expose mismatch.cfg. it shows
>> >> >> unclassified options.
>> >> >
>> >> >
>> >> > OK, so let's get back to the original problem:
>> >> >
>> >> > - I used to have kernel_configcheck report those problems enumerat=
ed
>> in mismatch.cfg / mismatch-all.txt,
>> >> > but for some time I'm not getting them, and this could be since
>> migration to sumo
>> >> >
>> >> > - those files are generated, and seem to contain real issues,
>> whereas there is no mismatch.txt
>> >> >
>> >> > What do you see going wrong and how do we move forward ?
>> >>
>> >> Is your configuration something that I can set up and reproduce the
>> >> problem ? I'm seeing what I expect out of the kconfig processing, bu=
t
>> >> there very well could be a bug that isn't showing in the machines th=
at
>> >> I normally build.
>> >
>> >
>> > The problem can be triggered with the default qemu_x86-64 configurati=
on.
>> > I'm just adding this in local.conf to inject a few options:
>> >
>> > SRC_URI_append_pn-linux-yocto +=3D " file://stuff.cfg"
>> >
>> > with this line in stuff.cfg:
>> >
>> > CONFIG_EEEPC_LAPTOP=3Dy
>> >
>> > On master I see:
>> >
>> > WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0
>> do_kernel_configcheck: [kernel config]: specified values did not make i=
t
>> into the kernel's final configuration:
>> >
>> >     [NOTE]: 'CONFIG_EEEPC_LAPTOP' last val (y) and .config val (m) do
>> not match
>> >     [INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353
>> :configs/v5.8/standard/./hibern.cfg (y)
>> >
>> > But on dunfell I don't see anything.  CONFIG_EEEPC_LAPTOP is listed i=
n
>> mismatch*, though it is just
>> > one of 127 issues, most of which looking pretty much valid at first
>> glance.  Are they not ?
>>
>> Only if something is tagged as "hardware" is it reported. The
>> classification name is historical, so you can read "hardware" as
>> "required / important / needed for boot". The organization of the
>> fragments (and a push and pull between stand alone fragments,
>> different configurations, software stacks, etc) means that there are
>> many fragments that have some options listed, that are disabled due to
>> competing interests. Those are for the most part valid (to be
>> different), and only differing values for the ones tagged as hardware
>> are reported.
>>
>> So no, we really don't want to report all those options. That's the
>> wobbling between reporting and non-reporting that I mentioned before.
>>
>
> Hm.  In our case, I've tried to write carefully-non-overlapping snippets=
,
> and I'd like to get a warning on *any* mismatch because they would point
> to a bug in my files.  Should I write an additional configcheck stage th=
at
> would check for mismatch.cfg by itself ?  If so, what about gatesgarth ?
>

Double-checking the state of things against what I wanted to achieve
reveals that
it's not that easy in the end, esp. for our old arch based on x86-64, for
which I felt it
was not a good idea to write a defconfig and update it for every kernel
release.

For that particular (and probably common) case, it does make sense for .cf=
g
snippets to override stuff set by defconfig, and we would want to hide
those,
while still exposing all others.  It seems to be a bit much to ask from th=
e
dunfell configcheck, is it something that would be easily achievable in
gatesgarth ?



>
>> In non-master, there's a complex way to tag options as hardware (and
>> hopefully an easier way in master), so if there's a mismatch you'll
>> see it.
>>
>> The delta between the two could be that I re-did the default
>> classification buckets for the new kernel and that's why it shows in
>> one, and not the other.
>>
>>  I can fire up a build on dunfell and see if I can see where the
>> classification differs.
>>
>> Bruce
>>
>> >
>> >>
>> >> The visibility of the warnings has changed over time (I expose them,
>> >> there are complaints, I make them less visible, and then the process
>> >> repeats ..), so there could be something there as well.
>> >>
>> >> And as you noticed, I totally rewrote things in master, since
>> >> maintaining the existing script was just too painful.
>> >>
>> >> Cheers,
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> >>
>> >> >> Cheers,
>> >> >>
>> >> >> Bruce
>> >> >>
>> >> >> >      if os.path.exists(mismatch_file):
>> >> >> >          if config_check_visibility:
>> >> >> > +            mismatch_details_file =3D
>> d.expand("${S}/%s/cfg/mismatch-all.txt" % kmeta)
>> >> >> >              with open (mismatch_file, "r") as myfile:
>> >> >> >                  results =3D myfile.read()
>> >> >> > -                bb.warn( "[kernel config]: specified values di=
d
>> not make it into the kernel's final configuration:\n\n%s" % results)
>> >> >> > +                bb.warn( "[kernel config]: specified values di=
d
>> not make it into the kernel's final configuration (see details in
>> %s):\n\n%s" % (mismatch_details_file, results))
>> >> >> >
>> >> >> >      if bsp_check_visibility:
>> >> >> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" %
>> kmeta)
>> >> >> > --
>> >> >> > 2.28.0
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >> >
>> >> >>
>> >> >>
>> >> >> --
>> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness
>> await
>> >> >> thee at its end
>> >> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > Yann Dirson <yann@blade-group.com>
>> >> > Blade / Shadow -- http://shadow.tech
>> >> >
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>> > --
>> > Yann Dirson <yann@blade-group.com>
>> > Blade / Shadow -- http://shadow.tech
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
>
>=20
>
>

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--00000000000091c85905b18fb491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13 oct. 2020 =C3=A0=C2=
=A017:12, Yann Dirson via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;yann.dirson=3D<a href=3D"mailto:blade-group.com@li=
sts.openembedded.org">blade-group.com@lists.openembedded.org</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13 oct. 2020 =C3=A0=C2=
=A017:04, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Oct 13, 2020 =
at 10:46 AM Yann Dirson<br>
&lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.=
dirson@blade-group.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mar. 13 oct. 2020 =C3=A0 16:10, Bruce Ashfield &lt;<a href=3D"mail=
to:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>=
&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Oct 13, 2020 at 9:57 AM Yann Dirson &lt;<a href=3D"mailto=
:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com=
</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield &lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson &lt;<a href=
=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blad=
e-group.com</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-=
group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; The warning was not issued because of a filename er=
ror (looking for a<br>
&gt;&gt; &gt;&gt; &gt; gatesgath-era file in older tree).<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Before gatesgarth we have two files (one with short=
 list and one with<br>
&gt;&gt; &gt;&gt; &gt; more details), whereas starting with gatesgarth we =
only have a single<br>
&gt;&gt; &gt;&gt; &gt; file with all details.=C2=A0 Nevertheless, for cons=
istency with the<br>
&gt;&gt; &gt;&gt; &gt; presentation of &quot;invalid.cfg&quot; we&#39;ll j=
ust print the contents of the<br>
&gt;&gt; &gt;&gt; &gt; short &quot;mismatch.cfg&quot; and point the user t=
o the more detailed<br>
&gt;&gt; &gt;&gt; &gt; information.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:ya=
nn@blade-group.com" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;&gt; &gt;&gt; &gt; ---<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 5 +++--<b=
r>
&gt;&gt; &gt;&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(=
-)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; This is not applicable to master, where the &quot;m=
ismatch.txt&quot; file exists<br>
&gt;&gt; &gt;&gt; &gt; and shows even greater details.=C2=A0 Looks like th=
e change was introduced<br>
&gt;&gt; &gt;&gt; &gt; for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86=
b - would that be a<br>
&gt;&gt; &gt;&gt; &gt; mismatch with yocto-kernel-tools version ?<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; diff --git a/meta/classes/kernel-yocto.bbclass b/me=
ta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt;&gt; &gt; index cc8bcb909a..771b4d8654 100644<br>
&gt;&gt; &gt;&gt; &gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt;&gt; &gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt;&gt; &gt;&gt; &gt; @@ -431,12 +431,13 @@ python do_kernel_configcheck(=
) {<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 bsp_check_visibility =3D int(d.=
getVar(&quot;KCONF_BSP_AUDIT_LEVEL&quot;) or 0)<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # if config check visibility is=
 non-zero, report dropped configuration values<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S=
}/%s/cfg/mismatch.txt&quot; % kmeta)<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S=
}/%s/cfg/mismatch.cfg&quot; % kmeta)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The use of mismatch.txt is completely intentional, and i=
t is populated<br>
&gt;&gt; &gt;&gt; by hardware tagged options that are detected as being mi=
stmatches.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; So no, we don&#39;t want to directly expose mismatch.cfg=
. it shows<br>
&gt;&gt; &gt;&gt; unclassified options.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; OK, so let&#39;s get back to the original problem:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - I used to have kernel_configcheck report those problems en=
umerated in mismatch.cfg / mismatch-all.txt,<br>
&gt;&gt; &gt; but for some time I&#39;m not getting them, and this could b=
e since migration to sumo<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; - those files are generated, and seem to contain real issues=
, whereas there is no mismatch.txt<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; What do you see going wrong and how do we move forward ?<br>
&gt;&gt;<br>
&gt;&gt; Is your configuration something that I can set up and reproduce t=
he<br>
&gt;&gt; problem ? I&#39;m seeing what I expect out of the kconfig process=
ing, but<br>
&gt;&gt; there very well could be a bug that isn&#39;t showing in the mach=
ines that<br>
&gt;&gt; I normally build.<br>
&gt;<br>
&gt;<br>
&gt; The problem can be triggered with the default qemu_x86-64 configurati=
on.<br>
&gt; I&#39;m just adding this in local.conf to inject a few options:<br>
&gt;<br>
&gt; SRC_URI_append_pn-linux-yocto +=3D &quot; file://stuff.cfg&quot;<br>
&gt;<br>
&gt; with this line in stuff.cfg:<br>
&gt;<br>
&gt; CONFIG_EEEPC_LAPTOP=3Dy<br>
&gt;<br>
&gt; On master I see:<br>
&gt;<br>
&gt; WARNING: linux-yocto-5.8.9+gitAUTOINC+ffbfe61a19_31fafe701e-r0 do_ker=
nel_configcheck: [kernel config]: specified values did not make it into the=
 kernel&#39;s final configuration:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[NOTE]: &#39;CONFIG_EEEPC_LAPTOP&#39; last val (y)=
 and .config val (m) do not match<br>
&gt;=C2=A0 =C2=A0 =C2=A0[INFO]: CONFIG_EEEPC_LAPTOP : m ## .config: 4353 :=
configs/v5.8/standard/./hibern.cfg (y)<br>
&gt;<br>
&gt; But on dunfell I don&#39;t see anything.=C2=A0 CONFIG_EEEPC_LAPTOP is=
 listed in mismatch*, though it is just<br>
&gt; one of 127 issues, most of which looking pretty much valid at first g=
lance.=C2=A0 Are they not ?<br>
<br>
Only if something is tagged as &quot;hardware&quot; is it reported. The<br=
>
classification name is historical, so you can read &quot;hardware&quot; as=
<br>
&quot;required / important / needed for boot&quot;. The organization of th=
e<br>
fragments (and a push and pull between stand alone fragments,<br>
different configurations, software stacks, etc) means that there are<br>
many fragments that have some options listed, that are disabled due to<br>
competing interests. Those are for the most part valid (to be<br>
different), and only differing values for the ones tagged as hardware<br>
are reported.<br>
<br>
So no, we really don&#39;t want to report all those options. That&#39;s th=
e<br>
wobbling between reporting and non-reporting that I mentioned before.<br><=
/blockquote><div><br></div><div>Hm.=C2=A0 In our case, I&#39;ve tried to wr=
ite carefully-non-overlapping snippets,</div><div>and I&#39;d like to get a=
 warning on *any* mismatch because they would point</div><div>to a bug in m=
y files.=C2=A0 Should I write an additional configcheck stage that</div><di=
v>would check for mismatch.cfg by itself ?=C2=A0 If so, what about gatesgar=
th ?<br></div></div></div></blockquote><div><br></div><div>Double-checking =
the state of things against what I wanted to achieve reveals that</div><div=
>it&#39;s not that easy in the end, esp. for our old arch based on x86-64, =
for which I felt it</div><div>was not a good idea to write a defconfig and =
update it for every kernel release.</div><div><br></div><div>For that parti=
cular (and probably common) case, it does make sense for .cfg</div><div>sni=
ppets to override stuff set by defconfig, and we would want to hide those,<=
/div><div>while still exposing all others.=C2=A0 It seems to be a bit much =
to ask from the</div><div>dunfell configcheck, is it something that would b=
e easily achievable in gatesgarth ?<br></div><div><br></div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_quote"><div></div><div><br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
In non-master, there&#39;s a complex way to tag options as hardware (and<b=
r>
hopefully an easier way in master), so if there&#39;s a mismatch you&#39;l=
l<br>
see it.<br>
<br>
The delta between the two could be that I re-did the default<br>
classification buckets for the new kernel and that&#39;s why it shows in<b=
r>
one, and not the other.<br>
<br>
=C2=A0I can fire up a build on dunfell and see if I can see where the<br>
classification differs.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; The visibility of the warnings has changed over time (I expose th=
em,<br>
&gt;&gt; there are complaints, I make them less visible, and then the proc=
ess<br>
&gt;&gt; repeats ..), so there could be something there as well.<br>
&gt;&gt;<br>
&gt;&gt; And as you noticed, I totally rewrote things in master, since<br>
&gt;&gt; maintaining the existing script was just too painful.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Bruce<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(mismatch_file=
):<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if config_check_v=
isibility:<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mismatch=
_details_file =3D d.expand(&quot;${S}/%s/cfg/mismatch-all.txt&quot; % kmeta=
)<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wit=
h open (mismatch_file, &quot;r&quot;) as myfile:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 results =3D myfile.read()<br>
&gt;&gt; &gt;&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.warn( &quot;[kernel config]: specified values did not make it in=
to the kernel&#39;s final configuration:\n\n%s&quot; % results)<br>
&gt;&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 bb.warn( &quot;[kernel config]: specified values did not make it in=
to the kernel&#39;s final configuration (see details in %s):\n\n%s&quot; % =
(mismatch_details_file, results))<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if bsp_check_visibility:<br>
&gt;&gt; &gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid_file =3D =
d.expand(&quot;${S}/%s/cfg/invalid.cfg&quot; % kmeta)<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; 2.28.0<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; <br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Yann Dirs=
on &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade=
-group.com</a>&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" targ=
et=3D"_blank">http://shadow.tech</a><br><br></div></div>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"=
gmail_signature">Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" ta=
rget=3D"_blank">yann@blade-group.com</a>&gt;<br>Blade / Shadow -- <a href=
=3D"http://shadow.tech" target=3D"_blank">http://shadow.tech</a><br><br></=
div></div>

--00000000000091c85905b18fb491--
