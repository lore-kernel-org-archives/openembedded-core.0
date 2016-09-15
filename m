Return-Path: <sujith.h@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id D63C9760A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 04:43:54 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id z190so36541278qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 21:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A6uFWYDyTl5vsURQ2jun1mfZMtcFD2+pv1i+qZey0iw=;
	b=D6n3ShkJ5rta/xSPiVtwpZcs6BCYbu/O77DYwK3uPaeUi+1DKUHYQFvdPYVoVGnuc7
	X0cvsyB0rZBIT/ISdkOyMoY5OdPiqNGCeUCUPFfvrwMeGghCA2s0YHHAWHlQJBu0/bmD
	MfGn4Lhvx+AWcaW1LpUcIWOHQ/+y34acw406HrGBKXFoPtUr4VW43ff6YTyI80tqQtY3
	3wmdWYlSFwDXlJwsplLjjr8HpK0GdDcs0+RFK/lwfLNnDlz7+UkcLCUeGWbo/sJsInPn
	drKlOb3VIQNSO4dOyemAPtaVcyY39tZenoxPZaOiwbcqM/gwrOfkyybNnWVoWCidE0Nk
	QMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A6uFWYDyTl5vsURQ2jun1mfZMtcFD2+pv1i+qZey0iw=;
	b=HQm767THSG/nafF47eBSHZqn8fgRvGOIdnBanf+uZy8WTsULsKCf0OIoyoq8VuaHy5
	SsIWGnM4WOl3JfnW0Rta836eP4Ur1vHxF4FeWPWnLr3RxfPgMptTvj03FWbc4wmOFumS
	4cHUumsZQ3lCngNU9js3OqBCRoLPYEToEKgCwx6iaFQMqMCIZ6pgkKJ+qJcci1NqV6gd
	J6jP3zTjc7kiUFWPQBJUUboj8EKjoIuTHRIT9aeB5HMpfYHB6R1+iXx6yA6O5nnGsSUq
	JdKHuZjYICU84vzei83/OVv0J33wJtixf92NRWuWsfQuaZF/NAsCg5atH6bVQfNioWCn
	OjTg==
X-Gm-Message-State: AE9vXwMzMg+2ivL6Zp3hJ1t3wwEo5QuF8Q0mBwi+C2+uSPxIwNx08O/mjoxiExulFzh29xTqXJH8ninf+3DOpA==
X-Received: by 10.55.74.3 with SMTP id x3mr7124018qka.91.1473914635197; Wed,
	14 Sep 2016 21:43:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.183.1 with HTTP; Wed, 14 Sep 2016 21:43:34 -0700 (PDT)
In-Reply-To: <CAJTo0Lb-bsJNvxDyfkRraQ5-dQ+cJqigThm2CMBUSg5EJGOV7A@mail.gmail.com>
References: <1473660793-3296-1-git-send-email-sujith.h@gmail.com>
	<CAJTo0Lb-bsJNvxDyfkRraQ5-dQ+cJqigThm2CMBUSg5EJGOV7A@mail.gmail.com>
From: sujith h <sujith.h@gmail.com>
Date: Thu, 15 Sep 2016 10:13:34 +0530
Message-ID: <CADyYWL=_YCXJ1nD-VxFisu6J813MBEs2QCU2TjFGRGVFJJhDHg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: add textrel to INSANE_SKIP for cyclone5 machine
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
X-List-Received-Date: Thu, 15 Sep 2016 04:43:58 -0000
Content-Type: multipart/alternative; boundary=001a11488a4242aa9a053c847e5d

--001a11488a4242aa9a053c847e5d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 15, 2016 at 4:41 AM, Burton, Ross <ross.burton@intel.com> wrote=
:

>
> On 12 September 2016 at 07:13, Sujith H <sujith.h@gmail.com> wrote:
>
>> +# PIC can't be enabled for 32-bit x86 and cyclone5
>>  INSANE_SKIP_${PN}_append_x86 =3D " textrel"
>> +INSANE_SKIP_${PN}_append_cyclone5 =3D " textrel"
>>
>
> Can this be generalised or is it absolutely specific to cyclone5?  If it
> can't be generalised then I feel that this should belong in the cyclone5
> BSP.
>

We found this with cyclone5 BSP. I will try to figure out how if we can see
it with qemuarm or other BSP's too.


>
> Ross
>



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
<Project>Contributor to Yocto project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info
C-x C-c

--001a11488a4242aa9a053c847e5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 15, 2016 at 4:41 AM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmail_quote"=
>On 12 September 2016 at 07:13, Sujith H <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:sujith.h@gmail.com" target=3D"_blank">sujith.h@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div>+# PIC can&#39;t be enable=
d for 32-bit x86 and <span>cyclone5</span><br>
=C2=A0INSANE_SKIP_${PN}_append_x86 =3D &quot; textrel&quot;<br>
+INSANE_SKIP_${PN}_append_<span>cycl<wbr>one5</span> =3D &quot; textrel&quo=
t;</div></blockquote></div><br></span>Can this be generalised or is it abso=
lutely specific to cyclone5?=C2=A0 If it can&#39;t be generalised then I fe=
el that this should belong in the cyclone5 BSP.</div></div></blockquote><di=
v><br></div><div>We found this with cyclone5 BSP. I will try to figure out =
how if we can see it with qemuarm or other BSP&#39;s too.<br>=C2=A0<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"HOEnZb"><f=
ont color=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra">Ross</div></font></span></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=
=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Banga=
lore<br>&lt;Project&gt;Contributor to KDE project<br></div><div>&lt;Project=
&gt;Contributor to Yocto project<br></div><div><a href=3D"http://fci.wikia.=
com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.com/wiki/Ant=
i-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.info" target=
=3D"_blank">http://sujithh.info</a><br></div><div>C-x C-c<br></div></div></=
div></div></div>
</div></div>

--001a11488a4242aa9a053c847e5d--
