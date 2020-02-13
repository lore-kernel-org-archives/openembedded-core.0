Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id DD5A460B98
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 16:14:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id n21so7058438ioo.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 08:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4/1Ur/eFKHYcqPdKxuuHnoWQzZnP5WMIgs0AKmGC0CI=;
	b=BoM5PRcoCAzaSuwtezvCOTk3Yw0ENkxqDaoijLAxotccfgfbK+Bxlsxm5MoiREaN5T
	l73R1ByAOFZYdJQCNtLRDtVWqdnW5pTr1GqbShGhNuoPj03JEBABF2dOIqiNrtNrwU3D
	2KJe09JFOpNW4j4RoIorA7FccVIhBvFY6LkxhJH/FnT6MKYXgfgN4YDx8EZGxPjPNZlS
	dU/51SBKWrefIijYLID979RIyGx2+7Cyao6JiNi73SBv4DpLLCQSPz5LQ88zFGK1in67
	a813eEzL7pPRops7ZI3PXEY9EBecnaFd0pP98j09reNpwFRvs0fBxho5gBh+F+P+Wvnl
	oJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4/1Ur/eFKHYcqPdKxuuHnoWQzZnP5WMIgs0AKmGC0CI=;
	b=SdwUwIJ5fbLom9QmYmYI/ssxLNvhPtO2OhkMp3uHjZn7T4wYG1t3zyqvCqu2jVuXSe
	4Xg6S1YR1yRlEx8XQiY1nAnB/joTCBvF/xM4lnsgg4x9D3JrmX5XYsXSebfVcd8VRbUY
	0BF49cmnomSNf6BhzXxw46RN9Vb9CM1b7pCydXb7mpWvOPaLNRMYKo9IM8Hd98OYgHyR
	6u0OxBUOY0jASIhWzKjGUNsm1nlEwuNisk4wx0aXwtrCtkKH9aaCRzXuXt1AS7ZjIZQR
	wDqL1/P9gnH+AOEFqev9JDPTPTNXPhmnn3qTwaH/yBgoYYCUQhRRxwpXfgpfRd9OYy1G
	2GVQ==
X-Gm-Message-State: APjAAAVFADPPf0n93hqLMFJRlMU4/AtGayKF9CZDdcHjYzteIYKoXUKc
	aXlmww7AxLz4ePJiifyws9elF3jlAUKlT4n72pM=
X-Google-Smtp-Source: APXvYqwZLvcDK0H2UVHlk8E2XWdD2fyIVAtG6lgzE0hN+xQkwCuuUjthAAB15VmHIEwLqmHeZGFA9Ro/e/Kjgfka674=
X-Received: by 2002:a6b:400b:: with SMTP id k11mr22864552ioa.256.1581610454824;
	Thu, 13 Feb 2020 08:14:14 -0800 (PST)
MIME-Version: 1.0
References: <20200210214211.2696-1-maxime.roussinbelanger@gmail.com>
	<fea6b9336e34c7df3cd23217cf2715b04fbd9ae6.camel@linuxfoundation.org>
	<CAE=T-s6CdNNZjqitGhYrAV8EiufQrPZJY8JLTmnPAEHC-sSHbQ@mail.gmail.com>
	<928575d17e93b117b6f555d674089560161d6c97.camel@linuxfoundation.org>
	<CAE=T-s6tXBA66zqe83-sib4m-JSXS++9sQ_m-D3a1KjU+-YcAw@mail.gmail.com>
	<CANNYZj8_fd=k95FA0VFF7ZjxuFVCU8V0HouxtLCNptdWLCMLpA@mail.gmail.com>
In-Reply-To: <CANNYZj8_fd=k95FA0VFF7ZjxuFVCU8V0HouxtLCNptdWLCMLpA@mail.gmail.com>
From: =?UTF-8?Q?Maxime_Roussin=2DB=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
Date: Thu, 13 Feb 2020 11:13:49 -0500
Message-ID: <CAE=T-s7MvwX1Tx_=_GK82CHE3uo8hisCXGTrBB=LaNg_o-jOZQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wpa-supplicant: add virtual supplicant
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
X-List-Received-Date: Thu, 13 Feb 2020 16:14:14 -0000
Content-Type: multipart/alternative; boundary="000000000000553ba8059e7761af"

--000000000000553ba8059e7761af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2020 at 11:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:
>
> On Thu, 13 Feb 2020 at 16:55, Maxime Roussin-B=C3=A9langer <
maxime.roussinbelanger@gmail.com> wrote:
>>
>> PACKAGECONFIG[iwd] =3D "--enable-iwd, --disable-wifi, iwd, iwd"
>> PACKAGECONFIG[wpa-supplicant] =3D "--enable-wifi, --disable-wifi,
wpa-supplicant, wpa-supplicant"
>
>
> The problem with this, is that enabling one but not the other will
combine into '--enable-iwd --disable-wifi' which is not what is intended.

Actually, it is what is intended, the `--disable-wifi` will disable
wpa-supplicant support, but keep the wifi support from other plugins (i.e.
iwd).

I agree that maybe the `--enable-wifi` is probably not the best option
name, but I am not sure I can something about it :)

>
>
> I am not sure why you need to specify them as both build and runtime
dependencies, can you clarify why?

iwd is probably not needed as a build dependency.. I would have to recheck
that. ConnMan
needs the runtime for the dbus interface that iwd exposes.

wpa-supplicant is probably the same thing. I'm not sure why originally
wpa-supplicant is specified as
a build dependency. It's been there for 5 years..

Thanks,
Max.

>
> Alex

>

--000000000000553ba8059e7761af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, Feb 13, 2020 at 11:00 AM Alexander Kanavin=
 &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&g=
t; wrote:<br>&gt;<br>&gt; On Thu, 13 Feb 2020 at 16:55, Maxime Roussin-B=C3=
=A9langer &lt;<a href=3D"mailto:maxime.roussinbelanger@gmail.com">maxime.ro=
ussinbelanger@gmail.com</a>&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; PACKAGECONFI=
G[iwd] =3D &quot;--enable-iwd, --disable-wifi, iwd, iwd&quot;<br>&gt;&gt; P=
ACKAGECONFIG[wpa-supplicant] =3D &quot;--enable-wifi, --disable-wifi, wpa-s=
upplicant, wpa-supplicant&quot;<br>&gt;<br>&gt;<br>&gt; The problem with th=
is, is that enabling one but not the other will combine into &#39;--enable-=
iwd --disable-wifi&#39; which is not what is intended.<br><br>Actually, it =
is what is intended, the `--disable-wifi` will disable wpa-supplicant suppo=
rt, but keep the wifi support from other plugins (i.e. iwd).<div><br></div>=
<div>I agree that maybe the `--enable-wifi` is probably not the best option=
 name, but I am not sure I can something about it :)</div><div><br></div><d=
iv>&gt;</div><div><div>&gt;<br>&gt; I am not sure why you need to specify t=
hem as both build and runtime dependencies, can you clarify why?</div><div>=
<br></div><div>iwd is probably not needed as a build dependency.. I would h=
ave to recheck that. ConnMan=C2=A0<br></div><div>needs the runtime for the =
dbus interface that iwd exposes.</div><div><br></div><div>wpa-supplicant is=
 probably the same thing. I&#39;m not sure why originally wpa-supplicant is=
 specified as</div><div>a build dependency. It&#39;s been there for 5 years=
..</div><div><br></div><div>Thanks,</div><div>Max.</div><div><br>&gt;<br>&g=
t; Alex <div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
</blockquote></div></div></div></div>

--000000000000553ba8059e7761af--
