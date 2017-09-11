Return-Path: <yahiafarghaly@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 82C6E77D6D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 19:51:08 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id d16so33729825ioj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AawylE5EVboEkybDUFZoBjRwBmVIxOuKU0nbmeX6jUg=;
	b=qfJxAsP0Q4NZQyduX1PkyXemt34R72h7I75Uv/zIe1lObIZsXBQ0/9wvhf1fETIBDI
	OE94vSWHxnzcw1x37cKjQ0gW1oEBsbiukTSEHmmeTEYOs3LJWUu6m5bMEyBpmPidludV
	N17EQuOLeivMG+fcDSE7ihABI4IL/vBUxF1Ddk/vpIoFNLdkdI4YPSrZBBfASq9upMC2
	WV998wpzwAmWRAJN2Cs6N8uae5ZNsOiiEk4A8LXpE4wC62yBSFW/Ih7moaRdzEqZ8XGa
	1XkblZoJjshVJE2XXtOkKKCO/Gd7BgX9p9Ttq6HHsww0kiSc9AYoHLjvlCAJmovZBbUK
	+Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AawylE5EVboEkybDUFZoBjRwBmVIxOuKU0nbmeX6jUg=;
	b=RQI/xAAJkcvNRq1frk6mKo8WmTq0PG3dlXfJxZmy/pVtBPCzfNfJ2mc+3CBInkaPYx
	ROBF4jSpBVRXx4BlGzoU9STdx6/17CYvuCp4XFsru3HQLG60DTra3lKpLw3Vlj31Kxam
	srErTUV3zuIzs1STfVcXLlJM8jmXGjDw19e4b5F7DVEveaCnZZwd5pXQWG6NAKA4YqIt
	uYy0LQNM64MaPVwfeUhPSYjXJTyntlkLwmAsPl6NY5MH6Iz3Yp7FDgMg1yesIbnFKeTW
	q21KCvriI8GHqgi8k/yh8mCj1NlFHrI7NpdldYr596rj2uSU9Pe1//jSk1HlezBPXWf2
	JWtA==
X-Gm-Message-State: AHPjjUjShvo0z12iMxAY51RjNm2ByearYXi5ChKGoiaBMq+9GlBzj7i4
	jtE3ySTG3m4VQGQ+5at2pDio373BCkYcOZM=
X-Google-Smtp-Source: AOwi7QASXn6QgtiQQq+XzFf219ogyR3n0p24/wVgJu7ALoXb7rT/y7GkWbhgASbmh3hXCGbcz+2NE4rvYC/Fkw46a8k=
X-Received: by 10.202.184.4 with SMTP id i4mr3485567oif.269.1505156356062;
	Mon, 11 Sep 2017 11:59:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.82.15 with HTTP; Mon, 11 Sep 2017 11:59:15 -0700 (PDT)
In-Reply-To: <cebfbffb-08e3-95b1-fbd9-d16f53541126@linux.intel.com>
References: <1504909055-29659-1-git-send-email-yahiacommunication@yahoo.com>
	<cebfbffb-08e3-95b1-fbd9-d16f53541126@linux.intel.com>
From: yahia farghaly <yahiafarghaly@gmail.com>
Date: Mon, 11 Sep 2017 20:59:15 +0200
Message-ID: <CABFXn3FiArDM4veiBsX25+U8fK63RhbT+TX62J8WxB8AZUmS+Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: peter.kjellerstedt@axis.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gnupg: added a coreutils runtime dependancy to gnupg recipe
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
X-List-Received-Date: Mon, 11 Sep 2017 19:51:08 -0000
Content-Type: multipart/alternative; boundary="001a113cea24ef434b0558ee85da"

--001a113cea24ef434b0558ee85da
Content-Type: text/plain; charset="UTF-8"

The error was */usr/bin/apt-key: line 352: comm: command not found*
 so, i investigated around this line and it showed me that apt-key script
try to use* comm* in a function
*merge_back_changes()* i couldn't find a suitable online source for the
code, i just looked at from the resulted image. so as a conclusion, i think
it is not a problem of gnupg.

On 11 September 2017 at 14:52, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> On 09/09/2017 01:17 AM, Yahia Farghaly wrote:
>
>> From: yahiafarghaly <yahiafarghaly@gmail.com>
>>
>> When using 'apt-key add' on the target image, the gnupg is required
>> but for gnupg to be fully functional, the coreutils is required to be
>> exist with the gnupg.
>> Otherwise, it may throw an error in runtime as one of components of
>> coreutils is missing.
>> For 'apt-key add', i faced the error of 'comm: command not found' so as
>> proper solution, i submit this change.
>>
>>
> Have you established that it's something in gnupg that needs the 'comm'
> command, and not something in apt-key? Can you point to the specific place
> in gnupg source tree where comm is used?
>
> Thanks,
> Alex
>



-- 
Yahia Farghaly
Graduated from Faculty of Engineering - Electronics and Communications
Department at Cairo University.
Linkedin <https://linkedin.com/in/yahiafarghaly> - GitHub
<https://github.com/yahiafarghaly>

--001a113cea24ef434b0558ee85da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><img width=3D"0" height=3D"0" class=3D"mailtrack-img" alt=
=3D"" style=3D"display:flex" src=3D"https://mailtrack.io/trace/mail/cbbb0c2=
a7a738d428804ee1dea85242f1fe0e53d.png?u=3D1822760">The error was=C2=A0<i><b=
>/usr/bin/apt-key: line 352: comm: command not found</b></i><br>=C2=A0so, i=
 investigated around this line and it showed me that apt-key script try to =
use<b> comm</b>=C2=A0in a function=C2=A0<b>merge_back_changes()<br></b>=C2=
=A0i couldn&#39;t find a suitable online source for the code, i just looked=
 at from the resulted image. so as a conclusion, i think it is not a proble=
m of gnupg.=C2=A0</div><div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On 11 September 2017 at 14:52, Alexander Kanavin <span dir=3D"ltr">&l=
t;<a href=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">al=
exander.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On 09/09/2017 01:17 AM, Yahia Farghaly wrote=
:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: yahiafarghaly &lt;<a href=3D"mailto:yahiafarghaly@gmail.com" target=
=3D"_blank">yahiafarghaly@gmail.com</a>&gt;<br>
<br>
When using &#39;apt-key add&#39; on the target image, the gnupg is required=
<br>
but for gnupg to be fully functional, the coreutils is required to be exist=
 with the gnupg.<br>
Otherwise, it may throw an error in runtime as one of components of coreuti=
ls is missing.<br>
For &#39;apt-key add&#39;, i faced the error of &#39;comm: command not foun=
d&#39; so as proper solution, i submit this change.<br>
<br>
</blockquote>
<br></span>
Have you established that it&#39;s something in gnupg that needs the &#39;c=
omm&#39; command, and not something in apt-key? Can you point to the specif=
ic place in gnupg source tree where comm is used?<br>
<br>
Thanks,<br>
Alex<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><font size=3D"1" color=3D"#777777" style=3D"font-family=
:Tahoma,sans-serif,Arial,serif,EmojiFont"><span style=3D"font-size:13px">Ya=
hia Farghaly=C2=A0</span></font><span style=3D"color:rgb(0,0,0);font-family=
:Calibri,Arial,Helvetica,sans-serif,serif,EmojiFont;font-size:16px"></span>=
<div><font color=3D"#777777" face=3D"Tahoma, sans-serif, Arial, serif, Emoj=
iFont"><span style=3D"font-size:13px">Graduated from Faculty of Engineering=
 - Electronics and Communications Department at Cairo University.</span></f=
ont><br></div><div style=3D"color:rgb(0,0,0);font-family:Calibri,Arial,Helv=
etica,sans-serif,serif,EmojiFont;font-size:16px"><div><a href=3D"https://li=
nkedin.com/in/yahiafarghaly" rel=3D"noopener noreferrer" target=3D"_blank">=
<font size=3D"1" style=3D"font-family:Tahoma,sans-serif,Arial,serif,EmojiFo=
nt"><span style=3D"font-size:13px">Linkedin</span></font></a><font size=3D"=
1" color=3D"#777777" style=3D"font-family:Tahoma,sans-serif,Arial,serif,Emo=
jiFont"><span style=3D"font-size:13px">=C2=A0-=C2=A0</span></font><a href=
=3D"https://github.com/yahiafarghaly" rel=3D"noopener noreferrer" target=3D=
"_blank"><font size=3D"1" style=3D"font-family:Tahoma,sans-serif,Arial,seri=
f,EmojiFont"><span style=3D"font-size:13px">GitHub</span></font></a></div><=
/div></div></div></div></div>
</div>

--001a113cea24ef434b0558ee85da--
