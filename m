Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2C3C36AE6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:39:00 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id w10so4733146pde.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Sk8egg1LNRkn8DuZOJI3gP7O0ctQuUhR1tlZ8n6iQ8A=;
	b=C6u0VpAgWD6aZ6qmtk79hEyPYtnUavEhCdKTl5zSY+37vfCN6+LmcFlCT61JJkbFeP
	akz9tRASr8giah2K904HBLJ43nhnQpy2XYPFlLFv9QGQ0BLgWtNUCeI3n16rTPBENhkX
	ugwI1wDYpkqEge1hoEeNgbRA7vYi3gDCEuSp6fHCLU8iHb0tuq7KwGyR59LBFMxK3Wz4
	gN/ux0yn/DLI/cy9Pj3cSVQcAd3rOY6+HBoa6MUjLLchKKWipQOavBCch5epR521+1Xu
	34if0pbEqddAoILkSYEKN6a5FDrydnTMRSsnFczlV2PuINaQ90JsHfUVgabpnff3VyQG
	QBZg==
X-Gm-Message-State: ALoCoQksUpP+i7FC9XWCaxr7vL7lZwNwRdbVYul3DUbe9LNmgu21q+0g68uQs0H3P3MzMnJquGOn
MIME-Version: 1.0
X-Received: by 10.68.189.72 with SMTP id gg8mr391810pbc.201.1376390341066;
	Tue, 13 Aug 2013 03:39:01 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 03:39:00 -0700 (PDT)
In-Reply-To: <520A0BF6.1000709@communistcode.co.uk>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
	<520A070C.3090302@communistcode.co.uk>
	<CAOMwXhOO=NpnDyPu-oryv7L72h1DCejycFe+8XBqVabc6fqfAQ@mail.gmail.com>
	<520A0BF6.1000709@communistcode.co.uk>
Date: Tue, 13 Aug 2013 11:39:00 +0100
X-Google-Sender-Auth: qcr6sHNyW9xSeO5Ix2UF-Med0WY
Message-ID: <CAOMwXhOH_xtFQiPSQE0Kaceo5jO2Xb=vCtyot4HA=Xr=TgzBeA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: ml@communistcode.co.uk
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 10:39:00 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85e5a1b1e04e3d1d900

--e89a8ff1c85e5a1b1e04e3d1d900
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 13, 2013 at 11:35 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> On 13/08/13 11:19, Laszlo Papp wrote:
> > I personally dislike top posting for a single entity in an email and I
> > think that is "nigh unbearable". ;-)
>
> If you also have a dislike for top-posting, then why top-post?!
>

That is a clear typo, as in: I personally dislike bottom posting for a
single entity.


> > More to the point, if there is no documentation, why is the bugreport
> > closed rather than forming it into a documentation bugreport?
>
> I am sure a bug-report for adding busybox config fragment documentation
> would be accepted.
>
>
> https://bugzilla.yoctoproject.org/buglist.cgi?product=General%20Docs&component=docs-general&resolution=---


No, I did mention documentation as well if there is a feature doing this,
but undocumented. That was apparently disregarded by the "team".


> > Also, I am still not sure we are on the same paper. You mean the python
> > script snippet will become optional? How will that mapping be done for
> > every possible options without adding explicit things to a feature set
> > like PACKAGECONFIG?
>
> I only answered the direct question in the email which is somewhere in
> the mess below, I couldn't bare to wade through the previous dredge.
> Hence, I have no idea with regards to any manual intervention with a
> python script. Going by the bug report, and the steps that I have seen,
> it should be automatic and as simple as dropping in a config fragment
> into the busybox recipe folder.
>

I have really no idea what you mean. You mean *every* defconfig entry is
mapped to a cfg, or what? This is still quite unclear to me how it is
supposed to work. Perhaps I should just wait for the "team" to realize this
in the bugreport, write documentation, and once that exists, I can
understand it. It is pretty hard to understand anything out of these
chunks, at least for me.

--e89a8ff1c85e5a1b1e04e3d1d900
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Aug 13, 2013 at 11:35 AM, Jack Mitchell <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ml@communistcode.co.uk" target=3D"_blank">ml=
@communistcode.co.uk</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 13/08/13 11:19, Laszlo =
Papp wrote:<br>
&gt; I personally dislike top posting for a single entity in an email and I=
<br>
&gt; think that is &quot;nigh unbearable&quot;. ;-)<br>
<br>
</div>If you also have a dislike for top-posting, then why top-post?!<br></=
blockquote><div><br></div><div>That is a clear typo, as in: I personally di=
slike bottom posting for a single entity.</div><div>=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">

<div class=3D"im">&gt;=A0More to the point, if there is no documentation, w=
hy is the bugreport<br>
&gt; closed rather than forming it into a documentation bugreport?<br>
<br>
</div>I am sure a bug-report for adding busybox config fragment documentati=
on<br>
would be accepted.<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/buglist.cgi?product=3DGeneral%=
20Docs&amp;component=3Ddocs-general&amp;resolution=3D---" target=3D"_blank"=
>https://bugzilla.yoctoproject.org/buglist.cgi?product=3DGeneral%20Docs&amp=
;component=3Ddocs-general&amp;resolution=3D---</a></blockquote>
<div><br></div><div>No, I did mention documentation as well if there is a f=
eature doing this, but undocumented. That was apparently disregarded by the=
 &quot;team&quot;.</div><div>=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span style=3D"color:rgb(80,0,80)">&gt; Also, I am still not sure we are on=
 the same paper. You mean the python</span><br><div class=3D"im">
&gt; script snippet will become optional? How will that mapping be done for=
<br>
&gt; every possible options without adding explicit things to a feature set=
<br>
&gt; like PACKAGECONFIG?<br>
<br>
</div>I only answered the direct question in the email which is somewhere i=
n<br>
the mess below, I couldn&#39;t bare to wade through the previous dredge.<br=
>
Hence, I have no idea with regards to any manual intervention with a<br>
python script. Going by the bug report, and the steps that I have seen,<br>
it should be automatic and as simple as dropping in a config fragment<br>
into the busybox recipe folder.<br></blockquote><div><br></div><div>I have =
really no idea what you mean. You mean *every* defconfig entry is mapped to=
 a cfg, or what? This is still quite unclear to me how it is supposed to wo=
rk. Perhaps I should just wait for the &quot;team&quot; to realize this in =
the bugreport, write documentation, and once that exists, I can understand =
it. It is pretty hard to understand anything out of these chunks, at least =
for me.</div>
</div></div></div>

--e89a8ff1c85e5a1b1e04e3d1d900--
