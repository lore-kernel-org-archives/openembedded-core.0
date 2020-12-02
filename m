Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web12.3294.1606907773857921841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 03:16:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=hnqa2iUJ;
 spf=pass (domain: blade-group.com, ip: 209.85.210.53, mailfrom: yann.dirson@blade-group.com)
Received: by mail-ot1-f53.google.com with SMTP id b62so1284465otc.5
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Dec 2020 03:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g0fxj+ML+y9q0M80cUrQz4bTK6pCJ1KKNk1UrSOMSSM=;
        b=hnqa2iUJDfVz1b7mpg3bn00qvJuSBgktLyInHhUPPSkx+RgpVymjo6ug5RKcwFx3vR
         MI3zzLn3O6Mnws0kuSo2t4qNKhnBYuF/ZNRvzexLQdSs/HVvPTq5a2x5MlBO8ZOm5kEg
         wYhNm+6vcS/ToxReCc/NG32o+d7kdA8mM9HVkgrUwHuPG+1du27a44JLLGKQGsbzFpj7
         pru240M0x+/cKaF/qMpZzBbMnjnhR1afVgcy8aFLGaDhGBQS/cCsZ3GLhB7v00/rD6eb
         zQTvD9zXyhi7QIlCtXNi9tCkcG2++jWcwXSn4pKcuSlgpDlKQxLuzMe5tmofjHjnUeLH
         bPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g0fxj+ML+y9q0M80cUrQz4bTK6pCJ1KKNk1UrSOMSSM=;
        b=S7+/seVOTlN3loC2/yNonDonb39UkQlVToLcXDRNL60fNb4/aRWGalS0IGmqbSppK7
         mkRqkzDsKglg832sDmGDgkeMlRWPxB0wn3JIECudw4hIH28QXSeRa7FpdjySan5jxI+0
         28oPh/m8F97Qt1h/cfHDTTAXMo55ay//8ZKCo8CVIiWLTo4Nlr0vfw6EnIPbyhITR4cQ
         q6hPlKY6wuczTOtFirXDZwM04wCNlW6S6wRRmAuybhtvkG/1CmQmkf/2mGboeOOOMqhj
         gWjIkUMDOzP0WPAI9zMScwL/jI8+/7aeF1WcMnDg+vFX8NkuO0GQMSUN1+6GEeIgHL6e
         /PAQ==
X-Gm-Message-State: AOAM531vbyRR1busWVlLUzGwSTpAXhyoHm02UdhUvUy1lbLCatjCcU6g
	aXuigqckgXemttPGoLvkPPI91Al5X1K0V1R916SXfw==
X-Google-Smtp-Source: ABdhPJzbjXLNBITgnZJ6kr+kytBpkMiYGYx9OkIYnrsyBPkqOu1/tS6jGJ5VIMvY9adSm1SpTAp1fcFLQamZSnG6wU0=
X-Received: by 2002:a05:6830:3151:: with SMTP id c17mr1384816ots.336.1606907773139;
 Wed, 02 Dec 2020 03:16:13 -0800 (PST)
MIME-Version: 1.0
References: <20201112172616.784945-1-yann@blade-group.com> <CAHSqoWsCZbE03tuDsfEnwxSCGddUuti_GAAF_ga6e-ozKXK3Ew@mail.gmail.com>
 <CA+4=imb5WUKYxKg1qwy-k0dUGApzCYwEskddGhVfyovGnSePew@mail.gmail.com>
 <CA+4=imZPuimbfuxLGnjYyy=sWoX3qWbavMk3+vnEqbJXizQWXQ@mail.gmail.com>
 <CAHSqoWvtKw25wkT0a9Hpvp4T1Umg6OBB7fGrYq1SR+i_6b1Bpg@mail.gmail.com> <a4cd002d204f0365ccbbe83b76727a3a7d41929a.camel@linuxfoundation.org>
In-Reply-To: <a4cd002d204f0365ccbbe83b76727a3a7d41929a.camel@linuxfoundation.org>
From: "Yann Dirson" <yann.dirson@blade-group.com>
Date: Wed, 2 Dec 2020 12:16:01 +0100
Message-ID: <CA+4=imYQGyu75wD7e12gP6E02vRvTzhe50jvSwZtWaoHsjc6Gg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/5] systemtap improvements
To: Victor Kamensky <victor.kamensky7@gmail.com>, kamensky@cisco.com, 
	Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000001541a05b5795f41"

--00000000000001541a05b5795f41
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Victor, Zang,

How do you with to go forward ?

There was at least the issue quoted below to resolve wrt my patches.  Do we
want to wait for 4.4 to hit
master or is it something we can tackle already ?

Victor wrote:
>> OK, for some reason I had missed that it does indeed achieve that.
Maybe we should add more doc about that.
>>
>> The split of a -runtime package, however, allows to still build the
"translator" part, not have it installed in the image
>> shipped on product, but still have the ability to install it from the
feed while developing, should someone prefer
>> this to cross-building the probes.  Not a big deal if you prefer not to
do that however, my own use-case would be
>> covered by the PACKAGECONFIG=3D"monitor".
>
> Yes, I was thinking about this use case as well. But it is quite esoteric
for OE. Furthermore,
> it kind of contradicts current PACKAGECONFIG structure. If we want to go
this route we need
> to reshuffle the whole thing in a different way. I.e either use
PACKAGECONFIG to
> control the content systemtap package or use subpackages. Using both
looks a bit convoluted.

It does not see contradictory to me to have PACKAGECONFIG triggering
generation of material that will
in turn de/activate packages.  Maybe we should align the naming of
PACKAGECONFIG
options and
related binary packages ?

As for myself I find the "translator" and "monitor" names not really
intuitive, they just match upstream
config option naming.  What about starting by renaming "monitor" to
"runtime" and making sure all files
generated with PACKAGECONFIG=3D"runtime" get into ${PN}-runtime ?

As for "translator", it seems to refer to what most of us think about as a
"compiler", would that fit ?
We could then move those files into ${PN}-compiler and leave ${PN} as a
virtual package pulling
-runtime and -compiler.

Does this look correct ?


Le mar. 17 nov. 2020 =C3=A0 10:24, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Mon, 2020-11-16 at 20:34 -0800, Victor Kamensky wrote:
> > Hi Yann and Richard,
> >
> > On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson <
> > yann.dirson@blade-group.com> wrote:
> > >
> > > Oh I did not notice, shouldn't we be discussing this on-list ?
> >
> > Very sorry about this. I did not notice that I've unintentionally
> > removed the mailing list.
> > Added it back.
> >
> > I see that Richard added your patches to master-next. But I don't
> > think they should be
> > merged "as is". IMO we need to work more on them.
> >
> > Richard, could you please hold off merging them?
>
> Sorry, they did merge already around a day ago. Yann had proposed them
> a while ago and spent quite a bit of time sorting out the automated
> testing failures so it felt like we should merge them since there was
> no feedback otherwise and they looked basically reasonable to me.
>
> Obviously we can follow up with other improvements to build upon them
> though.
>

--=20
Yann Dirson <yann@blade-group.com>
Blade / Shadow -- http://shadow.tech

--00000000000001541a05b5795f41
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Victor, Zang,<br></div><div><br></div><div>How do =
you with to go forward ?</div><div><br></div><div>There was at least the is=
sue quoted below to resolve wrt my patches.=C2=A0 Do we want to wait for 4.=
4 to hit</div><div>master or is it something we can tackle already ?<br></d=
iv><div><br></div><div>Victor wrote:<br></div><div><span>&gt;&gt; OK, for s=
ome reason I had missed that it does indeed achieve that.=C2=A0 Maybe we sh=
ould add more doc about that.<br>&gt;&gt;<br>&gt;&gt;
 The split of a -runtime package, however, allows to still build the=20
&quot;translator&quot; part, not have it installed in the image<br>&gt;&gt;=
 shipped on product, but still have the ability to install it from the feed=
 while developing, should someone prefer<br>&gt;&gt; this to cross-building=
 the probes.=C2=A0 Not a big deal if you prefer not to do that however, my =
own use-case would be<br>&gt;&gt; covered by the PACKAGECONFIG=3D&quot;moni=
tor&quot;.<br>&gt;<br></span>&gt; Yes, I was thinking about this use case a=
s well. But it is quite esoteric for OE. Furthermore,<div>&gt; it kind of c=
ontradicts current PACKAGECONFIG structure. If we want to go this route we =
need</div><div>&gt; to reshuffle the whole thing in a different way. I.e ei=
ther use PACKAGECONFIG to</div><div>&gt; control the content <span>systemta=
p</span> package or use subpackages. Using both looks a bit convoluted.</di=
v><div><span><br></span></div><div><span>It does not see contradictory to m=
e to have PACKAGECONFIG triggering generation of material that will</span><=
/div><div><span>in turn de/activate packages.=C2=A0 Maybe we should align t=
he naming of <span>PACKAGECONFIG options and</span></span></div><div><span>=
<span>related binary packages ?</span></span></div><div><span><span><br></s=
pan></span></div><div><span><span>As for myself I find the &quot;translator=
&quot; and &quot;monitor&quot; names not really intuitive, they just match =
upstream</span></span></div><div><span><span>config option naming.=C2=A0 Wh=
at about starting by renaming &quot;monitor&quot; to &quot;runtime&quot; an=
d making sure all files</span></span></div><div><span><span>generated with =
<span>PACKAGECONFIG=3D&quot;runtime&quot; get into ${PN}-runtime ?</span></=
span></span></div><div><span><span><span><br></span></span></span></div><di=
v><span><span><span>As for &quot;translator&quot;, it seems to refer to wha=
t most of us think about as a &quot;compiler&quot;, would that fit ?<br></s=
pan></span></span></div><div><span><span><span>We could then move those fil=
es into ${PN}-compiler and leave ${PN} as a virtual package pulling</span><=
/span></span></div><div><span><span><span>-runtime and -compiler.</span></s=
pan></span></div><div><span><span><span><br></span></span></span></div><div=
><span><span><span>Does this look correct ?</span></span></span></div><div>=
<span><span><span><br></span></span></span></div><div><span><br></span></di=
v></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=
=C2=A0mar. 17 nov. 2020 =C3=A0=C2=A010:24, Richard Purdie &lt;<a href=3D"ma=
ilto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@l=
inuxfoundation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Mon, 2020-11-16 at 20:34 -0800, Victor =
Kamensky wrote:<br>
&gt; Hi Yann and Richard,<br>
&gt; <br>
&gt; On Fri, Nov 13, 2020 at 5:59 AM Yann Dirson &lt;<br>
&gt; <a href=3D"mailto:yann.dirson@blade-group.com" target=3D"_blank">yann.=
dirson@blade-group.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Oh I did not notice, shouldn&#39;t we be discussing this on-list =
?<br>
&gt; <br>
&gt; Very sorry about this. I did not notice that I&#39;ve unintentionally<=
br>
&gt; removed the mailing list.<br>
&gt; Added it back.<br>
&gt; <br>
&gt; I see that Richard added your patches to master-next. But I don&#39;t<=
br>
&gt; think they should be<br>
&gt; merged &quot;as is&quot;. IMO we need to work more on them.<br>
&gt; <br>
&gt; Richard, could you please hold off merging them?<br>
<br>
Sorry, they did merge already around a day ago. Yann had proposed them<br>
a while ago and spent quite a bit of time sorting out the automated<br>
testing failures so it felt like we should merge them since there was<br>
no feedback otherwise and they looked basically reasonable to me.<br>
<br>
Obviously we can follow up with other improvements to build upon them<br>
though.<br></blockquote></div><br>-- <br><div dir=3D"ltr">Yann Dirson &lt;<=
a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-group.c=
om</a>&gt;<br>Blade / Shadow -- <a href=3D"http://shadow.tech" target=3D"_b=
lank">http://shadow.tech</a><br><br></div></div>

--00000000000001541a05b5795f41--
