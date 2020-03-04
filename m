Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
	[209.85.217.42])
	by mail.openembedded.org (Postfix) with ESMTP id EFF5C60B0E;
	Wed,  4 Mar 2020 16:00:54 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id a19so1466232vsp.6;
	Wed, 04 Mar 2020 08:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=F15DhvhDvoq+mUIQTMABGRbxGm4UWp9Yad179i12SBI=;
	b=YivqksCZQasjnaV4pC86uvYMC1UGHGZOJS+8vUZfBeQuSQ9TVoOIxKuboTPU9Ss20b
	bFLm6BaBGMtW/KTttwjAGNDQD0EGOZWElZy+CqbFQVAgicAfiWFRcVizNniMJ3sJyfAA
	m5gRZeBzcwFHWQ6iQHNiUOTCjH0zCwN+blxtHLrlTyjYFitgw3rLDbi2ivSbLKZSrUq0
	mvZz+vcdYwXQkO7miFG8ctM35f5PBFcrkyxN+bdXRY5TcTc+Ilbsk7fUTPo1gG6ycRLu
	8mVG1n2Xt4yhx3umQMrZ/L1i7IyD/qVJ+HADfIOROQmyYegOrtjx6Vh4iJ+hqS5YPKeq
	GX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=F15DhvhDvoq+mUIQTMABGRbxGm4UWp9Yad179i12SBI=;
	b=JUlHZ+Qbe6agiaTjAensfTEthzhIhBtzPC57TDF48Uw5ZXG1ec7cY0BSncfRpzukM4
	Q329MzH+chxEAw87pUrqJbSl5SifDe5LYwuc6RMUGXdyxvyIR6PUsmqs+U7y8Hyzzc44
	z21v/DJw0T3TtgRDXbEOXSRoHCg0iY/7DsUWvMTG37kGVL+5D0q5Pfd4SiGysZeG98hZ
	LXb6YjLTr45jdkzq8FI6fIN97fAc8tZE8+2MV6FRldT5irUoZ55/hThbSV4FjRuLx+Q2
	t0fCTazaZiztO1Qqt8W1z79QlQ1xJAM/GkKEN/jxKWwu7l/MFnHC0B94Gku6jS2rmcNL
	CXPA==
X-Gm-Message-State: ANhLgQ3kcJMYKsJtDs3eMcTZ9Fav02sR6b6S4pQJ7zc9Sj3lZTY30Qry
	WSbcVbjcSJNWRJdT38yvv5AhAnhMuoqlarLgMvzxtA==
X-Google-Smtp-Source: ADFU+vuKl+eTe0aJ6I8iQDVndZtTjPKqw+5i3KtgfSXr7LN/O+pENbQeMEOiOd6aVj0oRR1yNq25VZI16xOhXldY3sA=
X-Received: by 2002:a67:fb99:: with SMTP id n25mr2182923vsr.83.1583337655588; 
	Wed, 04 Mar 2020 08:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20200223193408.5602-1-bunk@stusta.de>
	<CAMKF1sqOPEw+uDZO81+j5MWxZBVjjgag6eT+jXYL958ic1Ysmg@mail.gmail.com>
	<20200224051745.GA6683@localhost>
	<e43b3057-37d5-7a35-b988-7307cc7fd67f@gmail.com>
	<20200227132729.GA6240@localhost>
	<CANNYZj8zWJVwAz+N3ikC+bw7iJba7OVbCs0dTsZgNo_PRkrY3A@mail.gmail.com>
	<20200304090507.GA7923@localhost>
	<CANNYZj9FbH=Poibo03-7tU=QhJjO5vu3kKHGpCgMCNd9=xVAVQ@mail.gmail.com>
	<20200304113217.GB7923@localhost>
	<CANNYZj8wnuNLrw6s=y0cgg5uoMTjA+fMEXW_TsmtKWZ4UDzwOA@mail.gmail.com>
	<20200304140109.GC7923@localhost>
In-Reply-To: <20200304140109.GC7923@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2020 17:00:44 +0100
Message-ID: <CANNYZj8ciqgR7eed+B+WwfMRHKc3u_XHrT3vo004=TEX9cCmhA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-architecture@lists.openembedded.org,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Does YP provide security support for stable and LTS branches?
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
X-List-Received-Date: Wed, 04 Mar 2020 16:00:55 -0000
Content-Type: multipart/alternative; boundary="000000000000855c5405a0098604"

--000000000000855c5405a0098604
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Taking offense or getting angry at the yocto project is entirely
misdirected. The liability for insecure millions of devices does not lie
with the yocto project, it lies with the OEMs. If the OEMs are unwilling to
allocate manpower to work on security, there=E2=80=99s very little the yoct=
o
project can do. We are already struggling to find people to work on actual
bugs, and there=E2=80=99s simply no manpower to do security properly. Still=
, stable
releases *are* much better than community supported ones, they do get a lot
of CVEs and bugs fixed, all I wanted to say is that the exhaustive process
to fix everything that could be insecure is not there.

Alex

On Wed 4. Mar 2020 at 15.01, Adrian Bunk <bunk@stusta.de> wrote:

> On Wed, Mar 04, 2020 at 01:13:19PM +0100, Alexander Kanavin wrote:
> > On Wed, 4 Mar 2020 at 12:32, Adrian Bunk <bunk@stusta.de> wrote:
> >
> > > I am sure there will be an update to the announcement if this doesn't
> > > reflect current reality.
> >
> > Who is expected to do the actual work of tracking CVEs, making action
> > points and performing the actions? The current reality is this: the
> > security update work is done ad hoc by community, even for stable
> branches.
> > There is no rigorous security process like in Debian, and no roles to
> > follow in that process. This means that if no one bothers to make a
> patch,
> > the security issue will remain unfixed, and this does happen often. If
> you
> > are expecting anything else (e.g. that listed recipe maintainers should
> do
> > something), you're setting yourself up to be disappointed.
>
> All I am expecting is honesty.
>
> If YP does not provide security support for supported stable branches,
> then public statements that community support would be worse than stable
> branches due to lack of security support are dishonest and offensive.
>
> It also puts all users of Yocto stable and LTS releases and billions of
> devices at danger if the Yocto project announces security support but
> does not deliver.
>
> The normal user expects that that the announced "usual defect fixes and
> updates for the extended period of two years" in LTS include the regular
> security updates that were claimed for stable branches earlier in the
> same announcement.
>
> For cases where I am the user the only benefit of going through the pain
> of upgrading existing products from older releases to Yocto 3.1 would be
> 2 years of security support from upstream. Doing the upgrade and only
> discovering afterwards that it doesn't bring the benefit that was
> promised would make me <unprintable>.
>
> Let me repeat that the only thing I am expecting is honesty,
> and all I am asking for is that if YP does not provide security
> support for stable and LTS branches this should be communicated
> clearly so that all users are aware.
>
> > Alex
>
> cu
> Adrian
>

--000000000000855c5405a0098604
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Taking offense or getting angry at the yocto project=
 is entirely misdirected. The liability for insecure millions of devices do=
es not lie with the yocto project, it lies with the OEMs. If the OEMs are u=
nwilling to allocate manpower to work on security, there=E2=80=99s very lit=
tle the yocto project can do. We are already struggling to find people to w=
ork on actual bugs, and there=E2=80=99s simply no manpower to do security p=
roperly. Still, stable releases *are* much better than community supported =
ones, they do get a lot of CVEs and bugs fixed, all I wanted to say is that=
 the exhaustive process to fix everything that could be insecure is not the=
re.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Alex</div><div=
><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Wed 4. Mar 2020 at 15.01, Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.=
de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Wed, Mar 04, 2020 at 01:13:19PM +0100, Alexander Kanavi=
n wrote:<br>
&gt; On Wed, 4 Mar 2020 at 12:32, Adrian Bunk &lt;<a href=3D"mailto:bunk@st=
usta.de" target=3D"_blank">bunk@stusta.de</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; I am sure there will be an update to the announcement if this doe=
sn&#39;t<br>
&gt; &gt; reflect current reality.<br>
&gt; <br>
&gt; Who is expected to do the actual work of tracking CVEs, making action<=
br>
&gt; points and performing the actions? The current reality is this: the<br=
>
&gt; security update work is done ad hoc by community, even for stable bran=
ches.<br>
&gt; There is no rigorous security process like in Debian, and no roles to<=
br>
&gt; follow in that process. This means that if no one bothers to make a pa=
tch,<br>
&gt; the security issue will remain unfixed, and this does happen often. If=
 you<br>
&gt; are expecting anything else (e.g. that listed recipe maintainers shoul=
d do<br>
&gt; something), you&#39;re setting yourself up to be disappointed.<br>
<br>
All I am expecting is honesty.<br>
<br>
If YP does not provide security support for supported stable branches, <br>
then public statements that community support would be worse than stable <b=
r>
branches due to lack of security support are dishonest and offensive.<br>
<br>
It also puts all users of Yocto stable and LTS releases and billions of <br=
>
devices at danger if the Yocto project announces security support but <br>
does not deliver.<br>
<br>
The normal user expects that that the announced &quot;usual defect fixes an=
d <br>
updates for the extended period of two years&quot; in LTS include the regul=
ar <br>
security updates that were claimed for stable branches earlier in the <br>
same announcement.<br>
<br>
For cases where I am the user the only benefit of going through the pain <b=
r>
of upgrading existing products from older releases to Yocto 3.1 would be <b=
r>
2 years of security support from upstream. Doing the upgrade and only <br>
discovering afterwards that it doesn&#39;t bring the benefit that was <br>
promised would make me &lt;unprintable&gt;.<br>
<br>
Let me repeat that the only thing I am expecting is honesty,<br>
and all I am asking for is that if YP does not provide security<br>
support for stable and LTS branches this should be communicated<br>
clearly so that all users are aware.<br>
<br>
&gt; Alex<br>
<br>
cu<br>
Adrian<br>
</blockquote></div></div>
</div>

--000000000000855c5405a0098604--
