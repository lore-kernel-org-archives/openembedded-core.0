Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-yb0-f174.google.com (mail-yb0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 48B2271B34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 07:36:09 +0000 (UTC)
Received: by mail-yb0-f174.google.com with SMTP id o189so14389594yba.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AgragLmZ5t1C8XQrkPKCjDUJCsU6iDjJ6M/F9YdKmMY=;
	b=CGUmzqswPFxDuiICXOojzNMeXdMlFShO56Y6d+g+ugawV90/SZVKt3Boz+YjBMe0lK
	lbIWCiyC60I/t56MTSqN+yJniN3ZmRLKk6Sp5xymTW8zPkPCyIAF5XWp7ZTLGD6erSdH
	CEDnoMfwn0gQpyLnT9QDYqRwBiAS/hmzd4gLQdzoi0ytOHLmEHl2NMma3qEsJncMUlV7
	mkXqnkS3EUWZbPOKUNi5/ToAdtWBoZbIxVFy/ywekvCWysOn+g6T+B/Lxq9ylAsV8FQv
	RzZDIZa8YSo972nP771JarXIaF+sdmmHDkNbwtPw0lsdgcJSJM9/X60tbzbHsflLlgky
	iGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AgragLmZ5t1C8XQrkPKCjDUJCsU6iDjJ6M/F9YdKmMY=;
	b=dvU6f7EXZY4GY9YktBi2rw0WM2735X5W8jW0KNSl5JIveMF7EPH3oP7A3glOUX4vjR
	yNItXEAwRee6eezKg3bAWsMwCWs8VWYrso3fjSVk1n4ZyOPiUhbxJlhJUZhnBytOpAGG
	tDuFKaOgVrbaTZlx6CchcwJJrfMJ0z82vF1fdJ/ge45iNmlSB8/iKLylTwisxOVL55ZL
	5CB+vso1HvF28XiPqUxHjikXYg8dWAD2b0Dd7xSftf1VtRQ1TXUExHN6D7xYF/phd6se
	2N0q0L0qXbaCiq5QSj238/PbLxjiFAtnOtYYvVYHwV9i5nrOr+LJYN7+aixmlOY9yeA+
	K9UA==
X-Gm-Message-State: AA6/9RlU07uxlDK4orZKfw7XINsuLrlMjf22jl1bkUeK6QF82kBeT/FiG9qaWVCsMsx+T6dMFGLha4ptZUhVFvoJ
X-Received: by 10.37.194.70 with SMTP id s67mr8784299ybf.51.1476430569672;
	Fri, 14 Oct 2016 00:36:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.206.3 with HTTP; Fri, 14 Oct 2016 00:35:39 -0700 (PDT)
In-Reply-To: <HE1PR0401MB26823C71B1DC91A7D8723D59E9DF0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
References: <1476182952-15222-1-git-send-email-carol.zhu@nxp.com>
	<CAJTo0LaiX-F+0ZPeTs8jJ2GxT61WFi1aPYZ76RgUMAKCMiWaeA@mail.gmail.com>
	<HE1PR0401MB2682F8CDDB11A504A1703B2EE9DC0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
	<CAJTo0LZ1NdDfTb72cH-vLrE=Q=kW6ksFQ5p7pnA3Tgoj0QZbaw@mail.gmail.com>
	<HE1PR0401MB26823C71B1DC91A7D8723D59E9DF0@HE1PR0401MB2682.eurprd04.prod.outlook.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 14 Oct 2016 10:35:39 +0300
Message-ID: <CAHiDW_GFdwy_1ZSuv7s8L8NExnFpY-1VUA5jV==x_q3SrFSMuA@mail.gmail.com>
To: Carol Zhu <carol.zhu@nxp.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH 0/4] Add patches for gstreamer1.0-plugins-bad V1.8.3
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
X-List-Received-Date: Fri, 14 Oct 2016 07:36:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c054ba4a442e3053ece47e3

--94eb2c054ba4a442e3053ece47e3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 October 2016 at 06:22, Carol Zhu <carol.zhu@nxp.com> wrote:

> Hi Ross,
>
>
>
>       So could we try integrating them to master branch and proving them
> firstly?
>
>       If they are all ok, then we can try next.
>
>       They won=E2=80=99t block the RC1 of 2.2.
>


That would be the way to go, although GStreamer 1.10 release may have
already happened by the time oe-core master opens again: in that case the
appropriate thing would be to upgrade the recipes in master to 1.10.

Jussi





>
>
>
>
> B.B
>
>
>
> *From:* Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* Thursday, October 13, 2016 6:36 PM
> *To:* Carol Zhu <carol.zhu@nxp.com>
> *Cc:* OE-core <openembedded-core@lists.openembedded.org>
> *Subject:* Re: [OE-core] [poky][PATCH 0/4] Add patches for
> gstreamer1.0-plugins-bad V1.8.3
>
>
>
>
>
> On 13 October 2016 at 10:07, Carol Zhu <carol.zhu@nxp.com> wrote:
>
>       These gstreamer patches are bug fixing and all backported from
> higher version, so the risk is low.
>
>       Is that ok to integrate them into morty?
>
>
> Once they've been proven in master and if the morty maintainer agrees, ye=
s.
>
>
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c054ba4a442e3053ece47e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 14 October 2016 at 06:22, Carol Zhu <span dir=3D"ltr">&lt;<a href=3D=
"mailto:carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-3552723015619532802WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">Hi Ross,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So cou=
ld we try integrating them to master branch and proving them firstly?<u></u=
><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If the=
y are all ok, then we can try next.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 They w=
on=E2=80=99t block the RC1 of 2.2.</span></p></div></div></blockquote><div>=
<br></div><div><br></div><div>That would be the way to go, although GStream=
er 1.10 release may have already happened by the time oe-core master opens =
again: in that case the appropriate thing would be to upgrade the recipes i=
n master to 1.10.</div><div><br></div><div>Jussi<br></div><div><br></div><d=
iv><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div class=3D"m_-355272=
3015619532802WordSection1"><p class=3D"MsoNormal"></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">B.B<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Burton, Ross [mailto:<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>]
<br>
<b>Sent:</b> Thursday, October 13, 2016 6:36 PM<span class=3D""><br>
<b>To:</b> Carol Zhu &lt;<a href=3D"mailto:carol.zhu@nxp.com" target=3D"_bl=
ank">carol.zhu@nxp.com</a>&gt;<br>
<b>Cc:</b> OE-core &lt;<a href=3D"mailto:openembedded-core@lists.openembedd=
ed.org" target=3D"_blank">openembedded-core@lists.<wbr>openembedded.org</a>=
&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][PATCH 0/4] Add patches for gstreamer1.=
0-plugins-bad V1.8.3<u></u><u></u></span></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 13 October 2016 at 10:07, Carol Zhu &lt;<a href=
=3D"mailto:carol.zhu@nxp.com" target=3D"_blank">carol.zhu@nxp.com</a>&gt; w=
rote:<u></u><u></u></p><div><div class=3D"h5">
<blockquote style=3D"border:none;border-left:solid #cccccc 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 These =
gstreamer patches are bug fixing and all backported from higher version, so=
 the risk is
 low. </span><u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0I=
s that ok to integrate them into morty?</span><u></u><u></u></p>
</blockquote>
</div></div></div><div><div class=3D"h5">
<p class=3D"MsoNormal"><br>
Once they&#39;ve been proven in master and if the morty maintainer agrees, =
yes.<u></u><u></u></p>
</div></div></div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Ross<u></u><u></u></p>
</div>
</div>
</div>
</div>

<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div></div>

--94eb2c054ba4a442e3053ece47e3--
