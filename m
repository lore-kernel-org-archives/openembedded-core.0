Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f182.google.com (mail-it1-f182.google.com
	[209.85.166.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6667C6B9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 10:45:29 +0000 (UTC)
Received: by mail-it1-f182.google.com with SMTP id f186so2541111ita.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 02:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2SBVLHAVhGCCU71zkoR5W6HnZaUaZU2oSwiOYrxga4o=;
	b=L5VWakJkJtMlpGRsSaQE9zLVQi0EaJexZGEIj2wiGDqsFvx1iZkCM5gjPFQrfE2oES
	5bP3sV557rWEG3c40CUmhqDnbuni05vfYG54fG0KVZMyf9e1fvyRYZ17TIVprz9m2YfQ
	yCL6oPs2AevwzwmnD3K5hS6vBZ10RwvxXbLEcGpm5j+mkMg22zleV9uk9xbO3sXn0naH
	Dg7VXLyY3DzFAe4ft/4mtkRy2fGHkvP5p+EZjnpkH5YNK/6xZrSpZhV+0np8mj8uZq7P
	Qfn7bdXbLRlKMnA1nbKcCHEv8HLWim8vPLEa4x1PuaAH4FS5sEbYrHByaMYGJsCEM03F
	MEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2SBVLHAVhGCCU71zkoR5W6HnZaUaZU2oSwiOYrxga4o=;
	b=AmrSkdqAfP0IaatQrU2iw7nCb4lz/LcD+BjG40VsdxjL9i45fjArYABxUXXMbuNT6f
	enoGrELWnwpHLG+TMlOnrdLTS87y9k/5CBzU+XODynWckUY9T1q00s+AaZ5qxiV7Gr+d
	+Epr3vdihuKPD4LTjuMAIxRnb48IVUIMaSyMUSG6zs308LkorkWVChp1myRASmHGD9EG
	q6CTy0mrNcqxn/dgnu55WNS/eGeVLk6oZ3X7rRQHzQ4/U8yyceHWYflu1suCLPmz5Cp0
	I6S5I4+NZTUxxDO/0vjcS7ZJSw7A06hTdv7H3ojjzLOFqpY3Y//2dX7Kt7n+q0BGIhtj
	cVdA==
X-Gm-Message-State: AHQUAubm2LXLucZg1zCYFpF3orEw/AnMBcfhKNC6WCOUWxru08hYUIvf
	GIXD+FKisSQrsZ7pDIA28v10yHB2uqgWggXNKPY=
X-Google-Smtp-Source: APXvYqwJ1h+oWYe3abMbkV8CeL4H6xBO6Ph/qiZOrM9IQMLiTRJylCz7qeLjOwycOh/xln7QfKNKj/gDwR13kBUvLOM=
X-Received: by 2002:a24:2b0e:: with SMTP id h14mr6963915ita.168.1551609930112; 
	Sun, 03 Mar 2019 02:45:30 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
	<CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
	<CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
	<CAL4iiOf=EGme65Z3w-2PthTdaDawxXh6=Djq4E=1muSKzYz+tg@mail.gmail.com>
	<CAMKF1sp+Fx-K=1gdVS79zx8-j7ZgcHL12eg1FSgtJ7k2S8QKdA@mail.gmail.com>
In-Reply-To: <CAMKF1sp+Fx-K=1gdVS79zx8-j7ZgcHL12eg1FSgtJ7k2S8QKdA@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Sun, 3 Mar 2019 11:45:18 +0100
Message-ID: <CAB2nKc888f44raha5KbjV_orsu+Yu+vgpiKgxMLFFF1zy4psoQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
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
X-List-Received-Date: Sun, 03 Mar 2019 10:45:29 -0000
Content-Type: multipart/alternative; boundary="000000000000b6e37005832e5637"

--000000000000b6e37005832e5637
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem,

I'm not sure if we considere this issue as closed or if we need to dig
root-cause here?

I don't have any Go stuff on my build machine nor build docker.
Also, those random crashes came with Thud version, I didn't have any in
Sumo, but there was a lot of changes between these two versions.

Please tell me if I can help,
Vincent


Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 19:24, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :

> On Thu, Feb 28, 2019 at 10:19 AM Damien Riegel <damien.riegel@gmail.com>
> wrote:
> >
> > Hi,
> >
> > On Thu, 28 Feb 2019 at 09:04, Vincent Prince
> > <vincent.prince.fr@gmail.com> wrote:
> > >
> > > Hi Khem,
> > >
> > > GO_DYNLINK_x86-64 =3D "" solution works as well,
> > >
> > > Best regards,
> > > Vincent
> > >
> > > Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj <raj.khem@gmail.com=
> a =C3=A9crit :
> > >>
> > >> On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
> > >> <vincent.prince.fr@gmail.com> wrote:
> > >> >
> > >> > Hi Damien,
> > >> >
> > >> > With GO_LINKSHARED =3D "" it work fine.
> > >> >
> > >>
> > >> Please set
> > >> GO_DYNLINK_x86-64 =3D "1"
> > >> to
> > >> GO_DYNLINK_x86-64 =3D ""
> > >> in goarch.bbclass
> >
> > Well, making a change in the goarch.bbclass is way more intrusive than
> > changing the value in a single recipe, so it would be nice to (at least=
)
> > give some justification about this solution.
> >
>
> this will make static binaries instead, so I wonder if its doing some
> linking from host.
>
> > >>
> > >> > I'm very new to Go, does it mean that there is a mixing issue in g=
o
> modules from Yocto and from node_exporter vendor folder, so it links
> wrongly at runtime?
> >
> > As to why the GO_LINKSHARED =3D"" works, I cannot tell. I just noticed
> > that our application was linked differently on my machine (where it
> > worked) and in Yocto (where it didn't work), so I tweaked link flags
> > until I got it to work.
> >
> > Cheers,
> > Damien
>

--000000000000b6e37005832e5637
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Khem,<div><br></div><div>I&#39;m not sure if we considere =
this issue as closed or if we need to dig root-cause here?</div><div><br></=
div><div>I don&#39;t have any Go stuff on my build machine nor build docker=
.=C2=A0</div><div>Also, those random crashes came with Thud version, I didn=
&#39;t have any in Sumo, but there was a lot of changes between these two v=
ersions.</div><div><br></div><div>Please tell me if I can help,</div><div>V=
incent</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 f=C3=A9vr. 2019 =C3=A0=C2=A019:2=
4, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, Feb 28, 2019 at 10:19 AM Damien Riegel &lt;<a href=3D"ma=
ilto:damien.riegel@gmail.com" target=3D"_blank">damien.riegel@gmail.com</a>=
&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; On Thu, 28 Feb 2019 at 09:04, Vincent Prince<br>
&gt; &lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank">v=
incent.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Khem,<br>
&gt; &gt;<br>
&gt; &gt; GO_DYNLINK_x86-64 =3D &quot;&quot; solution works as well,<br>
&gt; &gt;<br>
&gt; &gt; Best regards,<br>
&gt; &gt; Vincent<br>
&gt; &gt;<br>
&gt; &gt; Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj &lt;<a href=3D"=
mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =
=C3=A9crit :<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince<br>
&gt; &gt;&gt; &lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"=
_blank">vincent.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Hi Damien,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; With GO_LINKSHARED =3D &quot;&quot; it work fine.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Please set<br>
&gt; &gt;&gt; GO_DYNLINK_x86-64 =3D &quot;1&quot;<br>
&gt; &gt;&gt; to<br>
&gt; &gt;&gt; GO_DYNLINK_x86-64 =3D &quot;&quot;<br>
&gt; &gt;&gt; in goarch.bbclass<br>
&gt;<br>
&gt; Well, making a change in the goarch.bbclass is way more intrusive than=
<br>
&gt; changing the value in a single recipe, so it would be nice to (at leas=
t)<br>
&gt; give some justification about this solution.<br>
&gt;<br>
<br>
this will make static binaries instead, so I wonder if its doing some<br>
linking from host.<br>
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt; I&#39;m very new to Go, does it mean that there is a mix=
ing issue in go modules from Yocto and from node_exporter vendor folder, so=
 it links wrongly at runtime?<br>
&gt;<br>
&gt; As to why the GO_LINKSHARED =3D&quot;&quot; works, I cannot tell. I ju=
st noticed<br>
&gt; that our application was linked differently on my machine (where it<br=
>
&gt; worked) and in Yocto (where it didn&#39;t work), so I tweaked link fla=
gs<br>
&gt; until I got it to work.<br>
&gt;<br>
&gt; Cheers,<br>
&gt; Damien<br>
</blockquote></div>

--000000000000b6e37005832e5637--
