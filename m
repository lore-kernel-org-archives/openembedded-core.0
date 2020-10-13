Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
 by mx.groups.io with SMTP id smtpd.web12.12594.1602597450683733194
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2020 06:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=cBPUW4Bp;
 spf=pass (domain: blade-group.com, ip: 209.85.167.195, mailfrom: yann.dirson@blade-group.com)
Received: by mail-oi1-f195.google.com with SMTP id t77so22577082oie.4
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2020 06:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mlEBNM8X9t59gPFBjNaRr4cnHo52gHtpOsCjveD9nXI=;
        b=cBPUW4BpVILvRuDihqYFeV9ZZpXB98o4rAvhk9RM3RHIBPqgEsJcXez5Ebq5TgkJV4
         N+fZ5BY2qlk3WhCm37kmadYPYJg8ng73EsyE1VTSOn93yXuXf+WZ/IEhWaheHOWwnqwq
         ZMEFix3iWna7BY1BwEkpZ7EgcAAVVqNCgKavZeBR5mdhq3cIQusVFAVm1BVkWwuAPktV
         XKDP80jr2uU/0z77gGI3rhFhq+lsX61uvhh4c5AnnymdINzEp/KwEGukiM8rZnNCw+fS
         k8qK6EoY3R66SVKvEreu/02rzNGjOdh0WkBaBV59akjoy+n4hSCK9kXlgG4LsDafEFxe
         M6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mlEBNM8X9t59gPFBjNaRr4cnHo52gHtpOsCjveD9nXI=;
        b=ooB1ypZymr0yXziE/5hrnj0auRrGt6kclhQYTnESBQt11Z4S9ieCRCw4OJURZXCqY4
         JhQvugpxZ7IuZM5D39uufUAqUK64bwLuccIWRCXxIgr2Wa0GXQEfKOR9+EEq8jiruw2V
         PgbUZBOUHcswCKJ34xj/nVi6RnK2ePtNBurHds8j+joG6sLgegizuvPYmBQ2Ajd+NM9h
         YKZMRP4ea2ofNUmMAWKjsjwcq5P0epg6u3dQt6iMq/YytHRkUbkjfmw0V6AuKDR6ISDB
         Okz3yaiLkPUnneuiii/K7GpKZeKbNB0dgFgmTEYVmOQ0S5Vg9j2nBqs3xyET4fZJyh2N
         r+/A==
X-Gm-Message-State: AOAM530S6yywFjck2lpCSxWmevxW5oiMJy3GnTOjcdTOO0PPRn4Of0pg
	dzWutY2a7aGH0JdIfNMl3D2A5Nda17YdRIY3BTmy2A==
X-Google-Smtp-Source: ABdhPJxfBJjBZ+IB4zyfmUU9htCnLx4EZQ7bnzOmq2MM7W7z+oZVCh9VbqrkmTmddDlvi/iErs4gd09X4oLg0CM2AOI=
X-Received: by 2002:aca:3607:: with SMTP id d7mr33414oia.168.1602597449959;
 Tue, 13 Oct 2020 06:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20201013132109.2588755-1-yann@blade-group.com> <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
In-Reply-To: <CADkTA4PLQYvpAAauYP1MP3FNNeZQdimMt2j-itVSf28vHarhDg@mail.gmail.com>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Tue, 13 Oct 2020 15:57:18 +0200
Message-ID: <CA+4=imZ7DY+UgbSieYFC2iMKTOhyExq-VbNd=vbqa0DhuPsFWg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] kernel-yocto.bbclass: fix reporting of config mismatches
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: multipart/alternative; boundary="000000000000b9216105b18dcbca"

--000000000000b9216105b18dcbca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 13 oct. 2020 =C3=A0 15:34, Bruce Ashfield <bruce.ashfield@gmail.com=
> a
=C3=A9crit :

> On Tue, Oct 13, 2020 at 9:21 AM Yann Dirson <yann.dirson@blade-group.com=
>
> wrote:
> >
> > From: Yann Dirson <yann@blade-group.com>
> >
> > The warning was not issued because of a filename error (looking for a
> > gatesgath-era file in older tree).
> >
> > Before gatesgarth we have two files (one with short list and one with
> > more details), whereas starting with gatesgarth we only have a single
> > file with all details.  Nevertheless, for consistency with the
> > presentation of "invalid.cfg" we'll just print the contents of the
> > short "mismatch.cfg" and point the user to the more detailed
> > information.
> >
> > Signed-off-by: Yann Dirson <yann@blade-group.com>
> > ---
> >  meta/classes/kernel-yocto.bbclass | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > This is not applicable to master, where the "mismatch.txt" file exists
> > and shows even greater details.  Looks like the change was introduced
> > for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that be a
> > mismatch with yocto-kernel-tools version ?
> >
> > diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> > index cc8bcb909a..771b4d8654 100644
> > --- a/meta/classes/kernel-yocto.bbclass
> > +++ b/meta/classes/kernel-yocto.bbclass
> > @@ -431,12 +431,13 @@ python do_kernel_configcheck() {
> >      bsp_check_visibility =3D int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or=
 0)
> >
> >      # if config check visibility is non-zero, report dropped
> configuration values
> > -    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.txt" % kmeta)
> > +    mismatch_file =3D d.expand("${S}/%s/cfg/mismatch.cfg" % kmeta)
>
> The use of mismatch.txt is completely intentional, and it is populated
> by hardware tagged options that are detected as being mistmatches.
>
> So no, we don't want to directly expose mismatch.cfg. it shows
> unclassified options.
>

OK, so let's get back to the original problem:

- I used to have kernel_configcheck report those problems enumerated in
mismatch.cfg / mismatch-all.txt,
but for some time I'm not getting them, and this could be since migration
to sumo

- those files are generated, and seem to contain real issues, whereas ther=
e
is no mismatch.txt

What do you see going wrong and how do we move forward ?


> Cheers,
>
> Bruce
>
> >      if os.path.exists(mismatch_file):
> >          if config_check_visibility:
> > +            mismatch_details_file =3D
> d.expand("${S}/%s/cfg/mismatch-all.txt" % kmeta)
> >              with open (mismatch_file, "r") as myfile:
> >                  results =3D myfile.read()
> > -                bb.warn( "[kernel config]: specified values did not
> make it into the kernel's final configuration:\n\n%s" % results)
> > +                bb.warn( "[kernel config]: specified values did not
> make it into the kernel's final configuration (see details in %s):\n\n%s=
" %
> (mismatch_details_file, results))
> >
> >      if bsp_check_visibility:
> >          invalid_file =3D d.expand("${S}/%s/cfg/invalid.cfg" % kmeta)
> > --
> > 2.28.0
> >
> >
> >=20
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

--000000000000b9216105b18dcbca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 13 oct. 2020 =C3=A0=C2=
=A015:34, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">b=
ruce.ashfield@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Tue, Oct 13, 2020 at 9:21 AM Yann Di=
rson &lt;<a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">y=
ann.dirson@blade-group.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=
=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt;<br>
&gt; The warning was not issued because of a filename error (looking for a=
<br>
&gt; gatesgath-era file in older tree).<br>
&gt;<br>
&gt; Before gatesgarth we have two files (one with short list and one with=
<br>
&gt; more details), whereas starting with gatesgarth we only have a single=
<br>
&gt; file with all details.=C2=A0 Nevertheless, for consistency with the<b=
r>
&gt; presentation of &quot;invalid.cfg&quot; we&#39;ll just print the cont=
ents of the<br>
&gt; short &quot;mismatch.cfg&quot; and point the user to the more detaile=
d<br>
&gt; information.<br>
&gt;<br>
&gt; Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com=
" target=3D"_blank">yann@blade-group.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 5 +++--<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; This is not applicable to master, where the &quot;mismatch.txt&quot; =
file exists<br>
&gt; and shows even greater details.=C2=A0 Looks like the change was intro=
duced<br>
&gt; for sumo in 5ef0620b18606fd5749b6e7811d337f26075b86b - would that be =
a<br>
&gt; mismatch with yocto-kernel-tools version ?<br>
&gt;<br>
&gt; diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-=
yocto.bbclass<br>
&gt; index cc8bcb909a..771b4d8654 100644<br>
&gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt; @@ -431,12 +431,13 @@ python do_kernel_configcheck() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bsp_check_visibility =3D int(d.getVar(&quot;KCONF=
_BSP_AUDIT_LEVEL&quot;) or 0)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # if config check visibility is non-zero, report =
dropped configuration values<br>
&gt; -=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S}/%s/cfg/mismatch.=
txt&quot; % kmeta)<br>
&gt; +=C2=A0 =C2=A0 mismatch_file =3D d.expand(&quot;${S}/%s/cfg/mismatch.=
cfg&quot; % kmeta)<br>
<br>
The use of mismatch.txt is completely intentional, and it is populated<br>
by hardware tagged options that are detected as being mistmatches.<br>
<br>
So no, we don&#39;t want to directly expose mismatch.cfg. it shows<br>
unclassified options.<br></blockquote><div><br></div><div>OK, so let&#39;s=
 get back to the original problem:</div><div><br></div><div>- I used to hav=
e kernel_configcheck report those problems enumerated in mismatch.cfg / mis=
match-all.txt,</div><div>but for some time I&#39;m not getting them, and th=
is could be since migration to sumo</div><div><br></div><div>- those files =
are generated, and seem to contain real issues, whereas there is no mismatc=
h.txt</div><div><br></div><div>What do you see going wrong and how do we mo=
ve forward ?</div><div><br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if os.path.exists(mismatch_file):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if config_check_visibility:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mismatch_details_file =3D =
d.expand(&quot;${S}/%s/cfg/mismatch-all.txt&quot; % kmeta)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open (mismatch_f=
ile, &quot;r&quot;) as myfile:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 results=
 =3D myfile.read()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn( &qu=
ot;[kernel config]: specified values did not make it into the kernel&#39;s =
final configuration:\n\n%s&quot; % results)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn( &qu=
ot;[kernel config]: specified values did not make it into the kernel&#39;s =
final configuration (see details in %s):\n\n%s&quot; % (mismatch_details_fi=
le, results))<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if bsp_check_visibility:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 invalid_file =3D d.expand(&quot;${S=
}/%s/cfg/invalid.cfg&quot; % kmeta)<br>
&gt; --<br>
&gt; 2.28.0<br>
&gt;<br>
&gt;<br>
&gt; <br>
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

--000000000000b9216105b18dcbca--
