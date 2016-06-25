Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9B9D460111
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 15:45:49 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id b136so24820370qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jun 2016 08:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=m7yyfqKswFd5LKbeKF9DWYeelJzdH7rdlJtMMHgUiJA=;
	b=hYD44dDTdDX1/Lf4HSOC4pgI8WW8w5sNEk5rcqk65S/geTXL9ob1p7JbZbs5ZFLyKq
	95k3iBHc6SX53tl1UlS/J8t9Xum9KnNcLdURKXsYPTDPxzWacp3RNVYFJ8b1QEhMXJN6
	zPXU0XHFN6mtmvQHHDqYw3zRY99D1v8Qig5djLEd2ODAfOcrJgFz1OCaMXgqMYNfqjev
	LtuYBMytgne+XMn9AVIe3IwFrTLwzGnvqplJYtQjcv4/Iq7nua2y/zQf8LK47f9JY+VY
	dGPcJsh7Xs0xTeHvhHUuFXIQpPgXsfrTKhEqqB7xpM6+hCs/VV9nNuB4krMnwDz2YFeg
	ZHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=m7yyfqKswFd5LKbeKF9DWYeelJzdH7rdlJtMMHgUiJA=;
	b=lTjNZBr0c4abu6UTRsCiw1k0YtolQOngN/0N6kQrQFVfLljFhKcgxG/tA87+zJ4Bc+
	j3dk7CzTOZFFo8gZKo4Nmk9Qy+uYTPKimUeG1qEQ6JbclMbQlACWWrWj3a/d2nyz1VxX
	oxnczi5vG3mhUJeTPC8XJ+WgIJyMuYk8V7sXUPp0cD45Rcza3cPHHc23X+NiS4Y7XYZe
	KFnrmxVuE2ucdY3Dg1fFLi0KzfOnw4WZKx7v1IvaRcHuwweX08TIECvm24+W9vZwCXRh
	lizZhnly2/CgGlQsOlXxqpI/JBytUpt3x1xdQjgJf4MItzMxp+B/svlrJq79oDqJgTyj
	hIQQ==
X-Gm-Message-State: ALyK8tJjxR2u56qzZcv3C3ix4v8xRoEUS9s0n8XRCgNyAjVKMN0NRCcsB5ZM9iyXU5dIQq+Rc7jNmUfk/OxyMA==
MIME-Version: 1.0
X-Received: by 10.55.39.141 with SMTP id n135mr12873637qkn.149.1466869550050; 
	Sat, 25 Jun 2016 08:45:50 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Sat, 25 Jun 2016 08:45:49 -0700 (PDT)
Received: by 10.55.8.133 with HTTP; Sat, 25 Jun 2016 08:45:49 -0700 (PDT)
In-Reply-To: <CAMKF1spToGmm0bLgqWu51bBKx6-NuN0ru9LAnEq7P3egKC5B2Q@mail.gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
	<9FC96606-1A87-49F3-8A49-F692CDF8C2AA@gmail.com>
	<576AC542.9020709@gmail.com>
	<112E5421-6EE1-465A-9D4A-AEC9A38B9EB7@gmail.com>
	<576EA37E.6050705@gmail.com>
	<CAMKF1srkQ00SZVk2T3tp-o=ZBO8Xstv6JmZthksCE=geBfw1jw@mail.gmail.com>
	<CAMKF1spToGmm0bLgqWu51bBKx6-NuN0ru9LAnEq7P3egKC5B2Q@mail.gmail.com>
Date: Sat, 25 Jun 2016 08:45:49 -0700
Message-ID: <CAMKF1srAk8898_5+Bma84iNGa-wCvN9x_Z0ZDq2_X9H5vTUSOA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add gcc version and tclibc to build summary
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
X-List-Received-Date: Sat, 25 Jun 2016 15:45:51 -0000
Content-Type: multipart/alternative; boundary=94eb2c094a227676d105361c2e1b

--94eb2c094a227676d105361c2e1b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Jun 25, 2016 8:30 AM, "akuster808" <akuster808@gmail.com> wrote:
>
>
>
> On 06/22/2016 10:21 AM, Khem Raj wrote:
> >
> >> On Jun 22, 2016, at 10:05 AM, akuster808 <akuster808@gmail.com> wrote:
> >>
> >>
> >>
> >> On 06/22/2016 09:52 AM, Khem Raj wrote:
> >>>
> >>>> On Jun 22, 2016, at 8:29 AM, Armin Kuster <akuster808@gmail.com>
wrote:
> >>>>
> >>>> Since there are two gcc versions supported and any number of tcglibc=
,
> >>>> it would be nice to know which ones are being used.
> >>>> Add those to the build summary.
> >>>>
> >>>> Build summary
> >>>> TCLIBC            =3D =E2=80=9Cglibc"
> >>>
> >>> libc is evident from TARGET_SYS
> >>
> >> TARGET_SYS=3D"x86_64-oe-linux", this is not the my intent.
> >>
> >>
> >> The intent is to track which libc is being used. I changed TCLIBC =3D
> >> "musl" local.conf and now build summary show.
> >>
> >> TCLIBC            =3D "musl"
> >> GCC_VERSION       =3D "6.1"
> >>
> >> Is there a clearer / better way to display this?
> >
> > if you set TCLIBC =3D =E2=80=9Cmusl=E2=80=9D then TARGET_SYS should hav=
e changed to
x86_64-oe-linux-musl
> > and TARGET_SYS is displayed with build configuration.
>
> Ah, ok. now I get it.
>
> Would TCMODE be more useful?

Probably if external toolchain vendor versions are similar to internal
toolchain
>
>
> is the GCC summary part OK?

Yes

>
> - armin
> >
> >>
> >> - armin
> >>>
> >>>> GCC_VERSION       =3D "6.1"
> >>>>
> >>>> Not sure if the gcc version bit is best practice.
> >>>>
> >>>> Armin Kuster (2):
> >>>> build summary: add gcc version being used.
> >>>> build summary: add TCLIBC being used
> >>>>
> >>>> meta/classes/base.bbclass | 2 ++
> >>>> meta/conf/bitbake.conf    | 2 +-
> >>>> 2 files changed, 3 insertions(+), 1 deletion(-)
> >>>>
> >>>> --
> >>>> 2.3.5
> >>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >

--94eb2c094a227676d105361c2e1b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On Jun 25, 2016 8:30 AM, &quot;akuster808&quot; &lt;<a href=
=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 06/22/2016 10:21 AM, Khem Raj wrote:<br>
&gt; &gt;<br>
&gt; &gt;&gt; On Jun 22, 2016, at 10:05 AM, akuster808 &lt;<a href=3D"mailt=
o:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 06/22/2016 09:52 AM, Khem Raj wrote:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On Jun 22, 2016, at 8:29 AM, Armin Kuster &lt;<a href=
=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Since there are two gcc versions supported and any nu=
mber of tcglibc,<br>
&gt; &gt;&gt;&gt;&gt; it would be nice to know which ones are being used.<b=
r>
&gt; &gt;&gt;&gt;&gt; Add those to the build summary.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Build summary<br>
&gt; &gt;&gt;&gt;&gt; TCLIBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D =
=E2=80=9Cglibc&quot;<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; libc is evident from TARGET_SYS<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; TARGET_SYS=3D&quot;x86_64-oe-linux&quot;, this is not the my =
intent.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The intent is to track which libc is being used. I changed TC=
LIBC =3D<br>
&gt; &gt;&gt; &quot;musl&quot; local.conf and now build summary show.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; TCLIBC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;mus=
l&quot;<br>
&gt; &gt;&gt; GCC_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.1&quot;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Is there a clearer / better way to display this?<br>
&gt; &gt;<br>
&gt; &gt; if you set TCLIBC =3D =E2=80=9Cmusl=E2=80=9D then TARGET_SYS shou=
ld have changed to x86_64-oe-linux-musl<br>
&gt; &gt; and TARGET_SYS is displayed with build configuration.<br>
&gt;<br>
&gt; Ah, ok. now I get it.<br>
&gt;<br>
&gt; Would TCMODE be more useful?</p>
<p dir=3D"ltr">Probably if external toolchain vendor versions are similar t=
o internal toolchain<br>
&gt;<br>
&gt;<br>
&gt; is the GCC summary part OK?</p>
<p dir=3D"ltr">Yes </p>
<p dir=3D"ltr">&gt;<br>
&gt; - armin<br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; - armin<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; GCC_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;6.1&q=
uot;<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Not sure if the gcc version bit is best practice.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; Armin Kuster (2):<br>
&gt; &gt;&gt;&gt;&gt; build summary: add gcc version being used.<br>
&gt; &gt;&gt;&gt;&gt; build summary: add TCLIBC being used<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; meta/classes/base.bbclass | 2 ++<br>
&gt; &gt;&gt;&gt;&gt; meta/conf/bitbake.conf=C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;&gt;&gt;&gt; 2 files changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt; 2.3.5<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; --<br>
&gt; &gt;&gt;&gt;&gt; _______________________________________________<br>
&gt; &gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt; &gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedde=
d.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/list=
info/openembedded-core">http://lists.openembedded.org/mailman/listinfo/open=
embedded-core</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;<br>
</p>

--94eb2c094a227676d105361c2e1b--
