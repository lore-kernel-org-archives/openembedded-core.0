Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1TsrII-00016Y-Em
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 09:46:12 +0100
Received: by mail-ob0-f180.google.com with SMTP id wd20so1948971obb.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 00:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FlW9IfeZLNATMSogFOI88iyUYAhwvk3wUhSe1ByKYe8=;
	b=VcydApbBR1rTfGevI2uwaaGOMs5VSlP+Og1mQDAwvHe9hpehQPeCbsjkDIqJGfDClf
	T4ZEyv4WrWWmLIdPe9yAvSLQG8KLoKNZB2Oj2IgEjFZL076BzhcU5Pp3o0A4I963T5zJ
	tjs/IUHaamFC7NZg4eCSs47tKWbE3gSC4iK9TzYpyZJEMIyisyFVUJj5/v4XcrZHfq79
	LjwAZU5vU522NFhECXJJIR64U/sObLyg9OoLb2UqHIBD1k/C977KvtOo4mIax4ltspN3
	hFiK/vEuz5BpqhYDLCcCfqsqlv5ElsT7gxIoh8oDATLizZWIwfsLamlh4LWwRWxQV+/Y
	hwQQ==
MIME-Version: 1.0
Received: by 10.182.17.103 with SMTP id n7mr47602977obd.49.1357720242238; Wed,
	09 Jan 2013 00:30:42 -0800 (PST)
Received: by 10.182.85.198 with HTTP; Wed, 9 Jan 2013 00:30:42 -0800 (PST)
In-Reply-To: <1357666658.13022.11.camel@ted>
References: <CAOHjBZuDiLmweStxyu3ghH-WMz6S-TO+R7qDurnrvXHw9x4qvg@mail.gmail.com>
	<1357666658.13022.11.camel@ted>
Date: Wed, 9 Jan 2013 09:30:42 +0100
Message-ID: <CAOHjBZsOq4OG4nJws0wManJkX-8t3zHPgm2WCf8O5qVnb9ERmA@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain build for uclibc, possible issue?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Jan 2013 08:46:20 -0000
Content-Type: multipart/alternative; boundary=f46d04447429be340b04d2d6e0ff

--f46d04447429be340b04d2d6e0ff
Content-Type: text/plain; charset=ISO-8859-1

Hi Richard,

thanks for your reply.
Indeed my doubt remain valid, because I'm not understanding why I can build
an image (i.e. bitbake core-image-minimal)
simply building the cross-compiler uclibc based plus the other packages and
instead I cannot create the
sdk containing  an uclibc based toolchain (containing the cross-compiler),
able to be installed and used by third part to build
their own target applications.

For sure conceptually I'm missing something.

Best Regards,
Giuseppe

2013/1/8 Richard Purdie <richard.purdie@linuxfoundation.org>

> On Tue, 2013-01-08 at 16:12 +0100, Giuseppe Condorelli wrote:
> > Hi All,
> >
> > gcc-runtime nativesdk is failing due to the lack of libm.
> > I want to build meta-toolchain for uclibc, I mean obtaining the cross
> > compiler for these flavour, so libm should be
> > provided by the uclibc. But repository doesn't build any uclibc for
> > nativesdk, (it builds eglibc by default).
> > I'm in trouble to understand this, where is the answer I'm not
> > understanding?
> >
> > Please can you help me?
>
> What are you trying to build *exactly*?
>
> Do you want a toolchain that contains a compiler and uclibc for the
> target you're cross compiling for?
>
> or do you want the toolchain itself to use uclibc instead of glibc as
> well as whatever the target uses?
>
> The options would be:
>
> a) Uclibc based toolchain, glibc target system
> b) Uclibc based toolchain, uclibc target system
> c) glibc based toolchain, uclibc target system
> d) glibc based toolchain, glibc target system
>
> We only support c/d and only those combinations are known to work.
>
> Its important to differentiate between the C library the cross compiler
> links against compared to the C library the ultimate target system uses.
>
> Cheers,
>
> Richard
>
>
>
>

--f46d04447429be340b04d2d6e0ff
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Richard,</div><div>=A0</div><div>thanks for your reply.</div><div>I=
ndeed my doubt remain valid, because I&#39;m not understanding why I can bu=
ild an image (i.e. bitbake core-image-minimal)</div><div>simply building th=
e cross-compiler uclibc based=A0plus the other packages and instead I canno=
t create the</div>
<div>sdk=A0containing =A0an uclibc based toolchain (containing the cross-co=
mpiler), able to be installed and used by third part to build</div><div>the=
ir own target applications.</div><div>=A0</div><div>For sure conceptually I=
&#39;m missing something.</div>
<div>=A0</div><div>Best Regards,</div><div>Giuseppe<br><br></div><div class=
=3D"gmail_quote">2013/1/8 Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@=
linuxfoundation.org</a>&gt;</span><br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div class=3D"HOEnZb"><div class=3D"h5">On Tue, 2013-01-08=
 at 16:12 +0100, Giuseppe Condorelli wrote:<br>

&gt; Hi All,<br>
&gt;<br>
&gt; gcc-runtime nativesdk is failing due to the lack of libm.<br>
&gt; I want to build meta-toolchain for uclibc, I mean obtaining the cross<=
br>
&gt; compiler for these flavour, so libm should be<br>
&gt; provided by the uclibc. But repository doesn&#39;t build any uclibc fo=
r<br>
&gt; nativesdk, (it builds eglibc by default).<br>
&gt; I&#39;m in trouble to understand this, where is the answer I&#39;m not=
<br>
&gt; understanding?<br>
&gt;<br>
&gt; Please can you help me?<br>
<br>
</div></div>What are you trying to build *exactly*?<br>
<br>
Do you want a toolchain that contains a compiler and uclibc for the<br>
target you&#39;re cross compiling for?<br>
<br>
or do you want the toolchain itself to use uclibc instead of glibc as<br>
well as whatever the target uses?<br>
<br>
The options would be:<br>
<br>
a) Uclibc based toolchain, glibc target system<br>
b) Uclibc based toolchain, uclibc target system<br>
c) glibc based toolchain, uclibc target system<br>
d) glibc based toolchain, glibc target system<br>
<br>
We only support c/d and only those combinations are known to work.<br>
<br>
Its important to differentiate between the C library the cross compiler<br>
links against compared to the C library the ultimate target system uses.<br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br>

--f46d04447429be340b04d2d6e0ff--
