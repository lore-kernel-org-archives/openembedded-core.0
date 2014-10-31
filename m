Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 084EB65DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 12:46:08 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id pn19so766314lab.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 05:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=sWQCyDe46o1v9OruM5xX7NCDtm0WwYp2++Qq4zbJDWg=;
	b=MAtubnGVDqEscOsd5B4a4rmePAWvabABK2mnHfsjXfAU6FBGukKlxsOuxTn5NJzTCz
	cLC5JcDLAKWhWQKEhpVWLOxc3WjJTK7DEwiyQV/JBVrtlaEEBBkY77CpasoWUjWpddqP
	regnqFzrJshAqY1qM84MumYPkRepxjseJGoKnsq1qFgmBK5CDJwZlvSM8qaESOsoO4dU
	NNeaGaYmNVU+mshDaYFOhs6V/cEkO1AnlPq57tTvMjnZP5Kq1W++R4lxbxu6qDzZ9AEl
	04TwrCEbal51F6QOElJLQqTkKmvo7B3uofVrwh3DOJ+KO0oDPtnkh15BTdFwsd5faSVg
	9FBg==
X-Gm-Message-State: ALoCoQmiGzQDNYTbgQPWAczM6bcwXyQbhhbTsyXjB2WWvEYqOnZXnzIVxSyJYtwNg1+HkRN4txnB
MIME-Version: 1.0
X-Received: by 10.112.148.161 with SMTP id tt1mr26410178lbb.67.1414759568054; 
	Fri, 31 Oct 2014 05:46:08 -0700 (PDT)
Received: by 10.112.205.165 with HTTP; Fri, 31 Oct 2014 05:46:07 -0700 (PDT)
In-Reply-To: <1414753109.7649.91.camel@ted>
References: <1414571901-17418-1-git-send-email-fathi.boudra@linaro.org>
	<CAJTo0LY+r2qFgFmOmEXda1brymM8wpAfYFywsDAfWNtuedC+Ng@mail.gmail.com>
	<1414753109.7649.91.camel@ted>
Date: Fri, 31 Oct 2014 14:46:07 +0200
Message-ID: <CAGNsrLDxfpu=X1k7CLREuQCe64z7UDhzQbt1S9rLvm4W5WogTg@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: update to 20140828 release
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
X-List-Received-Date: Fri, 31 Oct 2014 12:46:16 -0000
Content-Type: multipart/alternative; boundary=047d7b3a829a7f32770506b76127

--047d7b3a829a7f32770506b76127
Content-Type: text/plain; charset=UTF-8

On 31 October 2014 12:58, Richard Purdie <richard.purdie@linuxfoundation.org
> wrote:

> On Fri, 2014-10-31 at 09:44 +0000, Burton, Ross wrote:
> > On 29 October 2014 08:38, Fathi Boudra <fathi.boudra@linaro.org>
> > wrote:
> >         bump SRCREV to 20140828 tag
> >         drop automake-foreign patch - fixed upstream (commit 18594de
> >         and edbae29)
> >         update realtime tests fixes upstream status from submitted to
> >         backported - merged upstream
> >
> > This doesn't build on the autobuilders, see for
> > example
> https://autobuilder.yoctoproject.org/main/builders/minnow/builds/84/steps/BuildImages/logs/stdio
> >
> > There are hundreds of compiler warnings, and a missing header.
>
> Now, since I've heard complaints that we don't merge patches quickly, I
> want to highlight what this means.
>

I'm one them and I guess it's the stick I asked for, for complaining ;)


>
> We tried this patch, we found it had issues, therefore whenever we see
> similar patches from similar authors, we now have a nagging doubt about
> how much testing they've had.


fwiw, it has been built and tested on armv7 and armv8 architectures, both
successfully.
Now I'm lokking why this issue is triggered on x86:

/home/pokybuild/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/sysroots/minnow/usr/include/tirpc/rpc/rpc.h:74:61:
fatal error: rpc/rpcb_clnt.h: No such file or directory



> This means we when we aggregate those
> patches there is more risk to the build, we need a clean build before we
> merge patches so it can delay other people's patches. This is a bit of a
> vicious circle and its why you see some of the behaviour we get
> complaints about.
>
> So I'd remind people that if they send things which don't work, it does
> have an impact. There is also something you can do to influence this.
>
> Cheers,
>
> Richard
>
>
>
br,

Fathi

--047d7b3a829a7f32770506b76127
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 31 October 2014 12:58, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div cla=
ss=3D""><div class=3D"h5">On Fri, 2014-10-31 at 09:44 +0000, Burton, Ross w=
rote:<br>
&gt; On 29 October 2014 08:38, Fathi Boudra &lt;<a href=3D"mailto:fathi.bou=
dra@linaro.org">fathi.boudra@linaro.org</a>&gt;<br>
&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bump SRCREV to 20140828 tag<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drop automake-foreign patch - fixed u=
pstream (commit 18594de<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and edbae29)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update realtime tests fixes upstream =
status from submitted to<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backported - merged upstream<br>
&gt;<br>
&gt; This doesn&#39;t build on the autobuilders, see for<br>
&gt; example <a href=3D"https://autobuilder.yoctoproject.org/main/builders/=
minnow/builds/84/steps/BuildImages/logs/stdio" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/main/builders/minnow/builds/84/steps/BuildImages=
/logs/stdio</a><br>
&gt;<br>
&gt; There are hundreds of compiler warnings, and a missing header.<br>
<br>
</div></div>Now, since I&#39;ve heard complaints that we don&#39;t merge pa=
tches quickly, I<br>
want to highlight what this means.<br></blockquote><div><br></div><div>I&#3=
9;m one them and I guess it&#39;s the stick I asked for, for complaining ;)=
</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204=
);border-left-style:solid;padding-left:1ex">
<br>
We tried this patch, we found it had issues, therefore whenever we see<br>
similar patches from similar authors, we now have a nagging doubt about<br>
how much testing they&#39;ve had.</blockquote><div><br></div><div>fwiw, it =
has been built and tested on armv7 and armv8 architectures, both successful=
ly.<br></div><div>Now I&#39;m lokking why this issue is triggered on x86:</=
div><div><pre style=3D"font-family:&#39;Courier New&#39;,courier,monotype,m=
onospace;color:rgb(0,0,0);font-size:medium"><span class=3D"">/home/pokybuil=
d/yocto-autobuilder/yocto-worker/minnow/build/build/tmp/sysroots/minnow/usr=
/include/tirpc/rpc/rpc.h:74:61: fatal error: rpc/rpcb_clnt.h: No such file =
or directory</span></pre></div><div>=C2=A0<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"> This =
means we when we aggregate those<br>
patches there is more risk to the build, we need a clean build before we<br=
>
merge patches so it can delay other people&#39;s patches. This is a bit of =
a<br>
vicious circle and its why you see some of the behaviour we get<br>
complaints about.<br>
<br>
So I&#39;d remind people that if they send things which don&#39;t work, it =
does<br>
have an impact. There is also something you can do to influence this.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br>
</div><div class=3D"gmail_extra">br,</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Fathi</div></div>

--047d7b3a829a7f32770506b76127--
