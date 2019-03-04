Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id A42976D494
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:52:59 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id p18so3619166ioh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 02:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6W9OZ6An5y9wWIf47NuT6Kym/1lNwozTxQdOz/92PgA=;
	b=gz2kNF/MceKmnHFpEaC5RjxAN1oMdtzVMEVlR+E/D4IAx00sl6A6qqWQIwmM2PZ8to
	2BAZFoHjp3kXvqsWkRHX/NFUhdoJ75jQroZJzNN4d38RG0wz3doAO4tEhBqBAuBP8EgD
	VhMDtlND7SRv2o7OUr2VH/NvF43YNsnL+8NHrd8jDA3CL0Ig7tEBaJOgOiGY/KHDBNB1
	GBbRJ7l8dYQp+194gpr2IWwLQvOkhiAiqsZOLZmr3Td2u8llm+u1+3vcMKudp/qd7m5D
	k6LaujB9X0sJ2o33JYA2qNwiP1ArPGJR+b4N4cxpSXOss7fAbPUaAtk283XKEBs5PxqL
	T/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6W9OZ6An5y9wWIf47NuT6Kym/1lNwozTxQdOz/92PgA=;
	b=JlKP9kH2Z4xHf7VmLOPjfnJB6ia1kLFWrD3ZABXmAuI1hUn1n/gcW7lHz7BoeiW/Qg
	0D0n86FMV0mD73gBzMs7/XtX263Nuqy3dkPFciigkzFp94ayBmvlFn5sDHMHcka13uVy
	pugmWpZDx3xtICmcXzt28wqst5WqBPGtBvDG01bAzmyOXsozPt51qrE3fK1a1uHhSn/c
	HV32e7fuAcK+ixIFoRgsqo+zyZKFR3b1Mg/f3L8vlkMtbnKz5AUnfwxjv5sMiPrhYlci
	2WB3N/f0fE5qvdF2tXkVlXLfiFX49yDeCY9tbZbrWoRFroG149UFJSEmVHH1vQdAy7aG
	/rxw==
X-Gm-Message-State: APjAAAVA68X1JVc3YsK43IdAxjLZxKJjngy8kVaJLGhMPzw1ZwOFsTW8
	gQTJKJ4RxGbE6+GZx8pRTPvGgzUnbWcpz0HS62M=
X-Google-Smtp-Source: APXvYqxrjv3kYSA9oE4FT1FgTnfPH+khknXhki7ZKe6i2mci9Jq0tLWhubjsvnRo5O9L0vacSWzl7PyZ+S77knYINZw=
X-Received: by 2002:a6b:c542:: with SMTP id v63mr9988091iof.176.1551696780265; 
	Mon, 04 Mar 2019 02:53:00 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
	<CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
	<CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
	<CAL4iiOf=EGme65Z3w-2PthTdaDawxXh6=Djq4E=1muSKzYz+tg@mail.gmail.com>
	<CAMKF1sp+Fx-K=1gdVS79zx8-j7ZgcHL12eg1FSgtJ7k2S8QKdA@mail.gmail.com>
	<CAB2nKc888f44raha5KbjV_orsu+Yu+vgpiKgxMLFFF1zy4psoQ@mail.gmail.com>
	<CAMKF1sps-UgMWzyuWAVDvR75P5HgKVgrHhc_VyexNbRmhqA7bA@mail.gmail.com>
In-Reply-To: <CAMKF1sps-UgMWzyuWAVDvR75P5HgKVgrHhc_VyexNbRmhqA7bA@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Mon, 4 Mar 2019 11:52:48 +0100
Message-ID: <CAB2nKc8hZy6FT2SMbfGH1KOxDK9-UW2X+HjD7gh0BR9F0vkTZA@mail.gmail.com>
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
X-List-Received-Date: Mon, 04 Mar 2019 10:52:59 -0000
Content-Type: multipart/alternative; boundary="000000000000630e500583428f33"

--000000000000630e500583428f33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem, you can find some backtraces here:
https://github.com/prometheus/node_exporter/issues/1244, don't know if this
is enough?

Le dim. 3 mars 2019 =C3=A0 16:43, Khem Raj <raj.khem@gmail.com> a =C3=A9cri=
t :

> On Sun, Mar 3, 2019 at 2:45 AM Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > Khem,
> >
> > I'm not sure if we considere this issue as closed or if we need to dig
> root-cause here?
> >
> > I don't have any Go stuff on my build machine nor build docker.
> > Also, those random crashes came with Thud version, I didn't have any in
> Sumo, but there was a lot of changes between these two versions.
> >
> > Please tell me if I can help,
>
> I think it needs some root causing, but we know the symptoms. So
> debugging to crash and some backtraces might help
>
> > Vincent
> >
> >
> > Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 19:24, Khem Raj <raj.khem@gmail.com> =
a =C3=A9crit :
> >>
> >> On Thu, Feb 28, 2019 at 10:19 AM Damien Riegel <damien.riegel@gmail.co=
m>
> wrote:
> >> >
> >> > Hi,
> >> >
> >> > On Thu, 28 Feb 2019 at 09:04, Vincent Prince
> >> > <vincent.prince.fr@gmail.com> wrote:
> >> > >
> >> > > Hi Khem,
> >> > >
> >> > > GO_DYNLINK_x86-64 =3D "" solution works as well,
> >> > >
> >> > > Best regards,
> >> > > Vincent
> >> > >
> >> > > Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj <raj.khem@gmail.=
com> a
> =C3=A9crit :
> >> > >>
> >> > >> On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
> >> > >> <vincent.prince.fr@gmail.com> wrote:
> >> > >> >
> >> > >> > Hi Damien,
> >> > >> >
> >> > >> > With GO_LINKSHARED =3D "" it work fine.
> >> > >> >
> >> > >>
> >> > >> Please set
> >> > >> GO_DYNLINK_x86-64 =3D "1"
> >> > >> to
> >> > >> GO_DYNLINK_x86-64 =3D ""
> >> > >> in goarch.bbclass
> >> >
> >> > Well, making a change in the goarch.bbclass is way more intrusive th=
an
> >> > changing the value in a single recipe, so it would be nice to (at
> least)
> >> > give some justification about this solution.
> >> >
> >>
> >> this will make static binaries instead, so I wonder if its doing some
> >> linking from host.
> >>
> >> > >>
> >> > >> > I'm very new to Go, does it mean that there is a mixing issue i=
n
> go modules from Yocto and from node_exporter vendor folder, so it links
> wrongly at runtime?
> >> >
> >> > As to why the GO_LINKSHARED =3D"" works, I cannot tell. I just notic=
ed
> >> > that our application was linked differently on my machine (where it
> >> > worked) and in Yocto (where it didn't work), so I tweaked link flags
> >> > until I got it to work.
> >> >
> >> > Cheers,
> >> > Damien
>

--000000000000630e500583428f33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Khem, you can find some backtraces h=
ere: <a href=3D"https://github.com/prometheus/node_exporter/issues/1244">ht=
tps://github.com/prometheus/node_exporter/issues/1244</a>, don&#39;t know i=
f this is enough?</div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 3 mars 2019 =C3=A0=C2=A016:43, K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, Mar 3, 2019 at 2:45 AM Vincent Prince<br>
&lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank">vincen=
t.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Khem,<br>
&gt;<br>
&gt; I&#39;m not sure if we considere this issue as closed or if we need to=
 dig root-cause here?<br>
&gt;<br>
&gt; I don&#39;t have any Go stuff on my build machine nor build docker.<br=
>
&gt; Also, those random crashes came with Thud version, I didn&#39;t have a=
ny in Sumo, but there was a lot of changes between these two versions.<br>
&gt;<br>
&gt; Please tell me if I can help,<br>
<br>
I think it needs some root causing, but we know the symptoms. So<br>
debugging to crash and some backtraces might help<br>
<br>
&gt; Vincent<br>
&gt;<br>
&gt;<br>
&gt; Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 19:24, Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9=
crit :<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Feb 28, 2019 at 10:19 AM Damien Riegel &lt;<a href=3D"mail=
to:damien.riegel@gmail.com" target=3D"_blank">damien.riegel@gmail.com</a>&g=
t; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Thu, 28 Feb 2019 at 09:04, Vincent Prince<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"=
_blank">vincent.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hi Khem,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; GO_DYNLINK_x86-64 =3D &quot;&quot; solution works as wel=
l,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Best regards,<br>
&gt;&gt; &gt; &gt; Vincent<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj &lt;<a=
 href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a=
>&gt; a =C3=A9crit :<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince<br>
&gt;&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" t=
arget=3D"_blank">vincent.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; Hi Damien,<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; With GO_LINKSHARED =3D &quot;&quot; it work fin=
e.<br>
&gt;&gt; &gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Please set<br>
&gt;&gt; &gt; &gt;&gt; GO_DYNLINK_x86-64 =3D &quot;1&quot;<br>
&gt;&gt; &gt; &gt;&gt; to<br>
&gt;&gt; &gt; &gt;&gt; GO_DYNLINK_x86-64 =3D &quot;&quot;<br>
&gt;&gt; &gt; &gt;&gt; in goarch.bbclass<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Well, making a change in the goarch.bbclass is way more intru=
sive than<br>
&gt;&gt; &gt; changing the value in a single recipe, so it would be nice to=
 (at least)<br>
&gt;&gt; &gt; give some justification about this solution.<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; this will make static binaries instead, so I wonder if its doing s=
ome<br>
&gt;&gt; linking from host.<br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; &gt; I&#39;m very new to Go, does it mean that there=
 is a mixing issue in go modules from Yocto and from node_exporter vendor f=
older, so it links wrongly at runtime?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; As to why the GO_LINKSHARED =3D&quot;&quot; works, I cannot t=
ell. I just noticed<br>
&gt;&gt; &gt; that our application was linked differently on my machine (wh=
ere it<br>
&gt;&gt; &gt; worked) and in Yocto (where it didn&#39;t work), so I tweaked=
 link flags<br>
&gt;&gt; &gt; until I got it to work.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt; Damien<br>
</blockquote></div>

--000000000000630e500583428f33--
