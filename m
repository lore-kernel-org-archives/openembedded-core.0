Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABCD27F2A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 13:10:22 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id u14so6007950vsu.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 05:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9FYA7Zirk0yir3DGXtXFTZq2m4V2cHkGvE+U6Snr4LE=;
	b=sWAwPNbTqoDe9hzhSvf/zrKXgbhYESgm2dbQ/swRt7f3nWRlQ31Pg6JEC4t1w3TEn9
	7daLc9MWTGJ0xxOCaDGnXnn3Fs0Q6ToV5RXzN6TnIeyGOqG2MGrSya9MTSTfSZipbH3t
	wBMyFWoqbTP4UI4wM4G74zJjnGuGTvb/2aGzdN9ncCE/vWyUHUd4ypyCHBayo0DtFHdm
	twbL43wpRa7yLtK974V0ICLt+BCZBY8J1GwYATbiTVvURjmrNWm1a4qc014u31B0GZCR
	0ZHQ0HkCmT42LuHX9UYmB57tOnYYRmcsKV0+QQ/OQ2KmbLuzd9osVnVyuiQ+gmjPA0QL
	4t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9FYA7Zirk0yir3DGXtXFTZq2m4V2cHkGvE+U6Snr4LE=;
	b=Q4mQ92BtqdWJUR+dZxAx1Cqmea8/GqSjfLJqJgL6L06hn8EPe0E8i9iYj7c+9Crn/u
	ni3M7DmIJYRSrc1SHLbyPgpH42xEUWPR0WeoxfZuJyzZtL8bGU/7oRGSH4ouP8ben1PG
	YINQa94PV+AXWxj0Qv6QEQwD85jj2XqJBzYzzX53+0YyAwR7LW9w7nYHzS0mI+ffzF5E
	j8TVglaj5pbcxNMzJPoiQ47Q+WX6EE1ATh3JrFdLgsPCEmUF3D6W4BTagcgpGJUVYwNu
	OgRLdSX6MD1e93nNXClLUsuhXJH+rU0dSptidTfdmewsKdcngx/WWnua8rPn3pG7xwcC
	OMQg==
X-Gm-Message-State: APjAAAUfPysll/5un8zFcfJqWS0gqiGh1Tm9MrBrodpUa9QNhmqe7ySj
	HBZoXTMavwsZzCW1dmEFqT9K88fYSHoYK0Daj8M=
X-Google-Smtp-Source: APXvYqzi80bl8edyhOBYHesHJG2Pfy1OoMYbK3VxwBT0QDpgaTMnp5DIOCX4qtrJQTj4F1zMY4BCUMpR1xYBIYDffCk=
X-Received: by 2002:a67:314e:: with SMTP id x75mr2864313vsx.35.1576847423496; 
	Fri, 20 Dec 2019 05:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20191212181436.1322-1-alex.kanavin@gmail.com>
	<20191212181436.1322-3-alex.kanavin@gmail.com>
	<b4e0b39cda58583411b3e6c05cb0566053e6cdb1.camel@linuxfoundation.org>
	<CANNYZj9tf5c9_XOn1P-tTXSSHjKUSp6QMfsNYX_swJAp+h7Krg@mail.gmail.com>
	<CANNYZj-mywh64iuGoUPVkMTJm8ka4m4a6UYVY3cOd2+hVvU62A@mail.gmail.com>
	<CAMKF1sojJ_biZa2cN6iJP_HFk-U5snWi3pojfyv1LKR1jNP22Q@mail.gmail.com>
In-Reply-To: <CAMKF1sojJ_biZa2cN6iJP_HFk-U5snWi3pojfyv1LKR1jNP22Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 20 Dec 2019 14:10:11 +0100
Message-ID: <CANNYZj9H7kj6x+GsUc5q23tBGz+Jh7YJz79V44wC-rUD0Q3Dew@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/30] gettext: update to 0.20.1
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
X-List-Received-Date: Fri, 20 Dec 2019 13:10:22 -0000
Content-Type: multipart/alternative; boundary="0000000000008ae5e9059a22662f"

--0000000000008ae5e9059a22662f
Content-Type: text/plain; charset="UTF-8"

hddtemp is dead upstream and hasn't seen an upstream update in 14 years, so
prime candidate for removal.

gtkperf is similarly ancient, and gtk2 only.

netcat is just as ancient, and superseded by netcat-openbsd.

A patch for the other three (sharutils/indent/enscript) is now on the
oe-devel list.

Alex

On Fri, 20 Dec 2019 at 09:18, Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Dec 17, 2019 at 8:02 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > On Mon, 16 Dec 2019 at 14:25, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >>
> >>
> >>> In an effort to try and get to the bottom of which patches cause which
> >>> failures I ran the gettext updates pieces by themselves (patches 2-5).
> >>>
> >>> systemtap fails:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/1354
> >>>
> >>> the main a-full build in case there are other issues:
> >>>
> >>> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/580
> >>>
> >>> I know there is a fix for the check-layer/mingw pieces in master-next
> >>> of meta-mingw, just forgot to set that branch.
> >>
> >>
> >> Thanks, there are also failures in meta-gpl2, for which I will also
> make patches.
> >> Systemtap issue is now fixed.
> >
> >
> > I have now sent the meta-gplv2 patches to yocto@ and the patchset for
> gettext+systemtap here.
> >
> > Alex
>
> few meta-oe failures with poky/master-next
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/173/steps/8/logs/step1b
>

--0000000000008ae5e9059a22662f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hddtemp is dead upstream and hasn&#39;t seen an upstr=
eam update in 14 years, so prime candidate for removal.</div><div><br></div=
><div>gtkperf is similarly ancient, and gtk2 only.</div><div><br></div><div=
>netcat is just as ancient, and superseded by netcat-openbsd.</div><div><br=
></div><div>A patch for the other three (sharutils/indent/enscript) is now =
on the oe-devel list.</div><div><br></div><div>Alex<br></div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 20 Dec=
 2019 at 09:18, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Tue, Dec 17, 2019 at 8:02 AM Alexander Kan=
avin<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, 16 Dec 2019 at 14:25, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; In an effort to try and get to the bottom of which patches cau=
se which<br>
&gt;&gt;&gt; failures I ran the gettext updates pieces by themselves (patch=
es 2-5).<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; systemtap fails:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/50/builds/1354" rel=3D"noreferrer" target=3D"_blank">https://autobuild=
er.yoctoproject.org/typhoon/#/builders/50/builds/1354</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; the main a-full build in case there are other issues:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/buil=
ders/83/builds/580" rel=3D"noreferrer" target=3D"_blank">https://autobuilde=
r.yoctoproject.org/typhoon/#/builders/83/builds/580</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I know there is a fix for the check-layer/mingw pieces in mast=
er-next<br>
&gt;&gt;&gt; of meta-mingw, just forgot to set that branch.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks, there are also failures in meta-gpl2, for which I will als=
o make patches.<br>
&gt;&gt; Systemtap issue is now fixed.<br>
&gt;<br>
&gt;<br>
&gt; I have now sent the meta-gplv2 patches to yocto@ and the patchset for =
gettext+systemtap here.<br>
&gt;<br>
&gt; Alex<br>
<br>
few meta-oe failures with poky/master-next<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/build=
s/173/steps/8/logs/step1b" rel=3D"noreferrer" target=3D"_blank">https://aut=
obuilder.yoctoproject.org/typhoon/#/builders/88/builds/173/steps/8/logs/ste=
p1b</a><br>
</blockquote></div>

--0000000000008ae5e9059a22662f--
