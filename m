Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 36E747CD01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:04:04 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id l139so13643234ita.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 06:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W6bxX6Ze0CQZJu6F0TKxlSU2YOKANRx2/DrBvsetcec=;
	b=d6XWzIzVF0d6wMtJClaWF3ShI1l7jtjq/1DrmkkuVVwAOn+6nhOwJQ0ZPbYB0cMxif
	+UMXoGNI+XsJTR4GLCW66c2iwg0zBEauR816NjzmGzaE2CmYDAi4vP9o4945FDbV2Qmk
	YI+06mrLeZqwmcHzyWie+M5zuXnpQzdbha6+wO+IPrwIyTJgOClPAa1VMTBl42SqeD6N
	wceBTAvUSBKjm/nHZWuxZPJP9bGU2iv7nLA66pBTjOcF3oVsMCMjHQVg85I1S6tHxO8n
	sXmIPnlOU1QWzLsEi+BQIOCEHwvV0yvCeKIgKxmlBXai0evygxf3MHKlXA4x2MOHHhJk
	N4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W6bxX6Ze0CQZJu6F0TKxlSU2YOKANRx2/DrBvsetcec=;
	b=lxLNTLSvmBSKDSvB7XEaa5wUr1x0PQ3f7nzfXFHqAPU4q/x8F7d9FOQyf+zwgyXg7x
	wj22A+F5LGDiBLZnwB02QX8WdopVHFqsIvwIf6iuus2Blv9QbH1HyLbDTEjkOhrVSCxu
	1cR68kO/TRbDRvhPVDnnnLcfKpbPaz0tHqPNVnL+HesenHsuuQBqNnYfpuBp4m5x4ZVV
	SWdHK8rwjSh9imFFLHKXvukUdn02ZWzaRV/Pp3cX13cYpkMmpos7cdA+CO8LwroDkEVo
	1TRF0Cg/SpNaxJg66cZ5ydjZjysL4am0B4DbUwrt9Kw9qqLVwo7B1bok/unt5R081sBg
	ngQw==
X-Gm-Message-State: APjAAAUDQTwORvTh1zUEYx0RSyMjfzS0mlkGboozK/zty1YG6VpMD+Tv
	Fi7mwWBggzEn/teADNvgUGc7WVp7T5ScG/AM708=
X-Google-Smtp-Source: APXvYqx9oP+uKj9eN68doyHrDXz+/lxV/7Jipv9yxgyB9Mp2zkFCtGxyWxPkw8difbGz+NbmXGzeeqqVkBiZJvuPKe4=
X-Received: by 2002:a24:2b0e:: with SMTP id h14mr2592096ita.168.1551362645046; 
	Thu, 28 Feb 2019 06:04:05 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
	<CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
In-Reply-To: <CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Thu, 28 Feb 2019 15:03:53 +0100
Message-ID: <CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Feb 2019 14:04:04 -0000
Content-Type: multipart/alternative; boundary="000000000000603b010582f4c306"

--000000000000603b010582f4c306
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

GO_DYNLINK_x86-64 =3D "" solution works as well,

Best regards,
Vincent

Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :

> On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
> <vincent.prince.fr@gmail.com> wrote:
> >
> > Hi Damien,
> >
> > With GO_LINKSHARED =3D "" it work fine.
> >
>
> Please set
> GO_DYNLINK_x86-64 =3D "1"
> to
> GO_DYNLINK_x86-64 =3D ""
> in goarch.bbclass
>
> > I'm very new to Go, does it mean that there is a mixing issue in go
> modules from Yocto and from node_exporter vendor folder, so it links
> wrongly at runtime?
> >
> > Thanks for the quickfix,
> > Vincent
> >
> >
> >
> >
> > Le mer. 27 f=C3=A9vr. 2019 =C3=A0 23:22, Damien Riegel <damien.riegel@g=
mail.com>
> a =C3=A9crit :
> >>
> >> On Wed, 27 Feb 2019 at 12:10, Vincent Prince
> >> <vincent.prince.fr@gmail.com> wrote:
> >> >
> >> > Hello everyone,
> >> >
> >> > I'm trying to add node_exporter from Prometheus project to an Intel
> x86-64 machine.
> >> > I made the following recipe:
> >> >
> >> >
> https://github.com/nefethael/meta-random/blob/master/recipes-connectivity=
/prometheus/go-nodeexporter_0.18.0.bb
> >> >
> >> > node_exporter is crashing with multiple different runtime errors, so
> I raised an issue on github:
> >> > https://github.com/prometheus/node_exporter/issues/1244
> >>
> >> I've faced the same kind of issue with a custom application of ours.
> >> The fix was to add the following line to the recipe:
> >> GO_LINKSHARED =3D ""
> >>
> >> Let me know if that helps.
> >>
> >> Cheers,
> >> Damien
>

--000000000000603b010582f4c306
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem,</div><div><br></div><div>
GO_DYNLINK_x86-64 =3D &quot;&quot; solution works as well,</div><div><br></=
div><div>Best regards,</div><div>Vincent<br></div></div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 28 f=C3=A9vr=
. 2019 =C3=A0=C2=A014:14, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
">raj.khem@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Thu, Feb 28, 2019 at 1:35 AM Vincent Pr=
ince<br>
&lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blank">vincen=
t.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Damien,<br>
&gt;<br>
&gt; With GO_LINKSHARED =3D &quot;&quot; it work fine.<br>
&gt;<br>
<br>
Please set<br>
GO_DYNLINK_x86-64 =3D &quot;1&quot;<br>
to<br>
GO_DYNLINK_x86-64 =3D &quot;&quot;<br>
in goarch.bbclass<br>
<br>
&gt; I&#39;m very new to Go, does it mean that there is a mixing issue in g=
o modules from Yocto and from node_exporter vendor folder, so it links wron=
gly at runtime?<br>
&gt;<br>
&gt; Thanks for the quickfix,<br>
&gt; Vincent<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le mer. 27 f=C3=A9vr. 2019 =C3=A0 23:22, Damien Riegel &lt;<a href=3D"=
mailto:damien.riegel@gmail.com" target=3D"_blank">damien.riegel@gmail.com</=
a>&gt; a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; On Wed, 27 Feb 2019 at 12:10, Vincent Prince<br>
&gt;&gt; &lt;<a href=3D"mailto:vincent.prince.fr@gmail.com" target=3D"_blan=
k">vincent.prince.fr@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hello everyone,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I&#39;m trying to add node_exporter from Prometheus project t=
o an Intel x86-64 machine.<br>
&gt;&gt; &gt; I made the following recipe:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://github.com/nefethael/meta-random/blob/mast=
er/recipes-connectivity/prometheus/go-nodeexporter_0.18.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">https://github.com/nefethael/meta-random/blob/maste=
r/recipes-connectivity/prometheus/go-nodeexporter_0.18.0.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; node_exporter is crashing with multiple different runtime err=
ors, so I raised an issue on github:<br>
&gt;&gt; &gt; <a href=3D"https://github.com/prometheus/node_exporter/issues=
/1244" rel=3D"noreferrer" target=3D"_blank">https://github.com/prometheus/n=
ode_exporter/issues/1244</a><br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve faced the same kind of issue with a custom application of=
 ours.<br>
&gt;&gt; The fix was to add the following line to the recipe:<br>
&gt;&gt; GO_LINKSHARED =3D &quot;&quot;<br>
&gt;&gt;<br>
&gt;&gt; Let me know if that helps.<br>
&gt;&gt;<br>
&gt;&gt; Cheers,<br>
&gt;&gt; Damien<br>
</blockquote></div>

--000000000000603b010582f4c306--
