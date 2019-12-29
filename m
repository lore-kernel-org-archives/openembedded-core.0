Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 449D57C6F7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 09:46:13 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id w67so7698487vkf.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 01:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mnSxHoL2MJdKbGPWc4JfOf6a9ngWZno7IN4+Cg/jSkI=;
	b=RFFsONdSkfZLAYe4hUiQ2fahX7c3FNKTJC6R49gT/clM7Vy7iL6iJJ0yXVg4STE4Ta
	NAcLb3FEjJU7F1Q+AdiiyjhFXmT1mD7n/orDsfB45hGJagktTCdX8mB9O7+5w/Sg+oiV
	gqzT/NC3r2rnn4lnOIjeRcm/oKB21oszTMUsCApjzSXNxE2RrCOegMxC2hcnVaps6uvA
	ft2y0bfj3BZwEHncjMpD7cwWbxNzAGKwBiGsUy4sEbCGz1kCkDTn5ixhpNctRXGAZPFA
	VVo70mebke29IQ1WCu9FL+B47QxHekELwNjrVA1RUws8tpJrqSQJu04zYJdRYcpLgJhI
	AyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mnSxHoL2MJdKbGPWc4JfOf6a9ngWZno7IN4+Cg/jSkI=;
	b=nMflzh1UcjgeHX+QnSEObldBolr0q6AJuDiN2OfDBwR5PkyWl06ANzc1XXaSwQao7w
	qv0rW264SnHS3veNVI7x2lLTNEd+oBZVOPqUyPv8csP260z4+nBlc21zaQ3eADiZ7KGk
	2eCFgcx8KVOOyEWs3HJS6IvdVm2TI/I8MunZhAh1FQxm0LPta6ANBvw+rnx4uAMmqwSG
	ktOu+dp2HiaC0bfj3umGTFtdwjlmRpGFgxvDOOKWdd1IPL+h2KrsMqP3NVchQskGpym3
	M/cDPXjaAIxX9RakAR6EipPuZsTaTTiL8Ul+61dE/Mt6sBnwwY0xPOz9LN2ZHeiJnm7Z
	CELQ==
X-Gm-Message-State: APjAAAU4IEraWwB9KkrZC6lxn1RacxiI/poewCXIKwO67J9Xugh2RQGP
	HVVidYFqz2ZKrX6glt7CyqJurYEZxVJr5FASky4=
X-Google-Smtp-Source: APXvYqyalR+84so5LzxEbO1EDerlqaw3SGwIes/AZKZXi6Zag+GLC5pqcp64kXl/P1CbAWCdyTs4EH8GEHhWACWlZ+s=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr35093681vkc.1.1577612774889; 
	Sun, 29 Dec 2019 01:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
	<20191220162351.94498-10-alex.kanavin@gmail.com>
	<15093869246c9bda00d947f9e2de0e776b147b7b.camel@linuxfoundation.org>
In-Reply-To: <15093869246c9bda00d947f9e2de0e776b147b7b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 29 Dec 2019 12:46:04 +0300
Message-ID: <CANNYZj9mk9nWRzWxvjEegBF2x8wVn-v41FxH0k9WEs+5QE4J8g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/11] libcap: update to 2.28
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
X-List-Received-Date: Sun, 29 Dec 2019 09:46:14 -0000
Content-Type: multipart/alternative; boundary="0000000000000a5e0c059ad499cf"

--0000000000000a5e0c059ad499cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 29 Dec 2019 at 12:22, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

>
> Looks like there may be a native gcc version issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/575
>
> (our friend Centos)
>

Thanks, this should be relatively easy to fix (when I get back to the build
box after new years):
| psx.c:239:5: error: =E2=80=98for=E2=80=99 loop initial declarations are o=
nly allowed in
C99 mode
|      for (int i =3D 0; i < 7; i++) {

Alex

--0000000000000a5e0c059ad499cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">On Sun, 29 Dec 2019 at 1=
2:22, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-left-w=
idth:1px;border-left-style:solid"><br>
Looks like there may be a native gcc version issue:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/79/build=
s/575" target=3D"_blank" rel=3D"noreferrer">https://autobuilder.yoctoprojec=
t.org/typhoon/#/builders/79/builds/575</a><br>
<br>
(our friend Centos)<br></blockquote><div><br></div><div>Thanks, this should=
 be relatively easy to fix (when I get back to the build box after new year=
s):</div><div><div style=3D"height:18px;text-align:left;color:rgb(199,199,1=
99);text-transform:none;text-indent:0px;letter-spacing:normal;font-size:13p=
x;font-style:normal;font-variant:normal;font-weight:400;text-decoration:non=
e;word-spacing:0px;white-space:pre;box-sizing:border-box"><span class=3D"gm=
ail-no-wrap gmail-log_o gmail-ng-binding" style=3D"color:rgb(199,199,199);w=
hite-space:pre;box-sizing:border-box"><span style=3D"box-sizing:border-box"=
>| psx.c:239:5: error: =E2=80=98for=E2=80=99 loop initial declarations are =
only allowed in C99 mode</span></span></div><div style=3D"height:18px;text-=
align:left;color:rgb(199,199,199);text-transform:none;text-indent:0px;lette=
r-spacing:normal;font-size:13px;font-style:normal;font-variant:normal;font-=
weight:400;text-decoration:none;word-spacing:0px;white-space:pre;box-sizing=
:border-box"><span class=3D"gmail-no-wrap gmail-log_o gmail-ng-binding" sty=
le=3D"color:rgb(199,199,199);white-space:pre;box-sizing:border-box"><span s=
tyle=3D"box-sizing:border-box">|=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =
=3D 0; i &lt; 7; i++) {</span></span></div>=C2=A0</div><div>Alex</div></div=
></div></div>

--0000000000000a5e0c059ad499cf--
