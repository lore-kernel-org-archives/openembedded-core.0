Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpcbM-0001XH-05
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 11:55:56 +0200
Received: by yenl13 with SMTP id l13so3110152yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 02:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=RwJR9r8YxsGjKEKdUBud3faMyCsl5cEK0XC9jrjrcxE=;
	b=Rzhq2TKxA0YIEzoJOE4k+quEe6dLmLVrvtUPqyeD8KzHWM4XIDlOOIdw4OBmGcKP1E
	OK+3DxL/QMmHgXPCDnUJrq8qIUeJSuXni689EFK11t3jFu2HKHZy+s2xpp3mh0obNFBb
	xYbEML8Am0B51BLa2akYxWZX1h5GovsT13yDX6MlQm6uKcAbj+jBCuaJectnltEyC+yb
	ITdVwFQ+4dAyxuIRZ07RqE3nlZCz5pSzodi0GiLKdf/i0xh8V1r2tbeTPRuF39jloUzL
	Rd4n3h2jwpbYVU25jfClto9b9/XRHezacN0rlmx4nhSMjbeHzvm9CX0qMJkKH7bfAQV5
	+Vcw==
Received: by 10.50.40.193 with SMTP id z1mr368732igk.0.1342172681256; Fri, 13
	Jul 2012 02:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Fri, 13 Jul 2012 02:44:21 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAAQYJAv0Zigzx2JrqOhd9_jNN8gFryw4ikhqsRK0e74Fim6=wA@mail.gmail.com>
References: <cover.1342116650.git.andrei@gherzan.ro>
	<8586287A-0F78-4778-8491-B8E1C70644B1@dominion.thruhere.net>
	<4FFF23E2.5040007@linux.intel.com>
	<54ABEC81-9673-446D-AD9A-79394DEEA6E8@dominion.thruhere.net>
	<CAAQYJAv0Zigzx2JrqOhd9_jNN8gFryw4ikhqsRK0e74Fim6=wA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 13 Jul 2012 12:44:21 +0300
Message-ID: <CAK18fxErPLi5685HPfL8HtvF7fziHHBc0cc+=MKWnec4Lurgug@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmt8vN9jBYcP4YwFyp5r4gliUyqbLefnECp9o7MNFc9vRrt9hy/7lbRyg4h0tv5R7d/gF+1
Subject: Re: [PATCH 0/3] Fix xz compression command and optimize compression time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2012 09:55:56 -0000
Content-Type: multipart/alternative; boundary=14dae9340c41e4bd1b04c4b2edf7

--14dae9340c41e4bd1b04c4b2edf7
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 13, 2012 at 11:19 AM, Andrea Adami <andrea.adami@gmail.com>wrote:

> On Fri, Jul 13, 2012 at 8:45 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
> >
> > Op 12 jul. 2012, om 21:22 heeft Saul Wold het volgende geschreven:
> >
> >> On 07/12/2012 11:58 AM, Koen Kooi wrote:
> >>> Any volunteers to test this on a system with >4 real cores?
> >>>
> >>
> >> Koen,
> >>
> >> Does OE-Core or Poky have an image setup for using .xz by default?
> >
> > No, and as you can see from Andrei's patches, it would have never worked
> :)
> >
> > regards,
> >
> > Koen
> >
>
> This leads to a similar remark for lzma:
>
> The xz/lzma have been added with commit  38334ac and at that time both
> where using XZ_COMPRESSION_LEVEL.
>
> The code has been refactored afterwards and what happened is that lzma
> now defaults to compression 7 (the default) while xz is way too high
> (default is 6).
>
>
Nope. It's default value is -9.


> There is a well hidden pitfall with that, being that any image,
> including the initramfs, will use that compression factor.
>
> As you can notice in that (old) man xz [2]  the memory requirements
>

What old version?


> are very high and what did happen to me was that the cpio.lzma could
> not be decompressed thus kernel could not boot (we override now the
> value setting "-e2" in our BSP).
>
>
Without threads, memory demand was around 700mb. So it should be ok for
most of machines.

Adding more threads will multiply that figures.
>
>
Indeed. With 8GB memory at my disposal i couldn't compress an image with -e
-9 and -T 0 (-T 4)/

@g

--14dae9340c41e4bd1b04c4b2edf7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Jul 13, 2012 at 11:19 AM, Andrea Adami <=
span dir=3D"ltr">&lt;<a href=3D"mailto:andrea.adami@gmail.com" target=3D"_b=
lank">andrea.adami@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">

<div class=3D"im">On Fri, Jul 13, 2012 at 8:45 AM, Koen Kooi &lt;<a href=3D=
"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Op 12 jul. 2012, om 21:22 heeft Saul Wold het volgende geschreven:<br>
&gt;<br>
&gt;&gt; On 07/12/2012 11:58 AM, Koen Kooi wrote:<br>
&gt;&gt;&gt; Any volunteers to test this on a system with &gt;4 real cores?=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Koen,<br>
&gt;&gt;<br>
&gt;&gt; Does OE-Core or Poky have an image setup for using .xz by default?=
<br>
&gt;<br>
&gt; No, and as you can see from Andrei&#39;s patches, it would have never =
worked :)<br>
&gt;<br>
&gt; regards,<br>
&gt;<br>
&gt; Koen<br>
&gt;<br>
<br>
</div>This leads to a similar remark for lzma:<br>
<br>
The xz/lzma have been added with commit =A038334ac and at that time both<br=
>
where using XZ_COMPRESSION_LEVEL.<br>
<br>
The code has been refactored afterwards and what happened is that lzma<br>
now defaults to compression 7 (the default) while xz is way too high<br>
(default is 6).<br>
<br></blockquote><div><br></div><div>Nope. It&#39;s default value is -9.</d=
iv><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
There is a well hidden pitfall with that, being that any image,<br>
including the initramfs, will use that compression factor.<br>
<br>
As you can notice in that (old) man xz [2] =A0the memory requirements<br></=
blockquote><div><br></div><div>What old version?</div><div>=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">


are very high and what did happen to me was that the cpio.lzma could<br>
not be decompressed thus kernel could not boot (we override now the<br>
value setting &quot;-e2&quot; in our BSP).<br>
<br></blockquote><div>=A0</div><div>Without threads, memory demand was arou=
nd 700mb. So it should be ok for most of machines.=A0</div><div><br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">


Adding more threads will multiply that figures.<br>
<br></blockquote><div><br></div><div>Indeed. With 8GB memory at my disposal=
 i couldn&#39;t compress an image with -e -9 and -T 0 (-T 4)/</div><div><br=
></div><div>@g</div></div>

--14dae9340c41e4bd1b04c4b2edf7--
