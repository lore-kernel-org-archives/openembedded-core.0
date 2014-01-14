Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5688D6DC3D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 11:56:06 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uy5so7168184obc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 03:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=z7NJ/odNi9Tf+oEtx/XBCI2oDARzt3DjqXovtzx8G/Q=;
	b=fj6vdrlCx73Gk61sEipavsj+ZVpDDAVEoGMoTiQmWdm2U6LGXhQUoq+s++Y87MTmbl
	xFh8TStWAmm1uM0TmG2SjcUlfKGa+RcsmYVOkSR6KDGM27ydjqnFZeJ0NL2mYIcpEuFV
	SboycvtDf+kihIx15wrJJftJePtEEv2lsPF7zbRy/I5iA7rJrGSCysgvW6eyycS1kkBe
	ko8tXhv863ae+jNatBVyum97eqUi3SJyCI9+hjKK02jrGjM/2U2y1RW5JaEbE32y4p/4
	i7y3dJz+zJUfCq9adlDtivu47NRXTfOtjBe4BWTu64U0pC76XyB0wyeg/l63H/zn1Iaz
	/mBw==
MIME-Version: 1.0
X-Received: by 10.182.88.4 with SMTP id bc4mr739256obb.68.1389700566805; Tue,
	14 Jan 2014 03:56:06 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 14 Jan 2014 03:56:06 -0800 (PST)
In-Reply-To: <1389699794.14987.43.camel@ted>
References: <1389699794.14987.43.camel@ted>
Date: Tue, 14 Jan 2014 09:56:06 -0200
X-Google-Sender-Auth: TjhxdL3JohinVogo0iYbPxsCVS8
Message-ID: <CAP9ODKo0Kdx31viqPtc3sq6JoMO-HTk6OD1rwO125D9u+hKddA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ptest: d.keys() is slow, use a list instead
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
X-List-Received-Date: Tue, 14 Jan 2014 11:56:06 -0000
Content-Type: multipart/alternative; boundary=14dae94ed90da0f30304efece0a5

--14dae94ed90da0f30304efece0a5
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 14, 2014 at 9:43 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Unfortunately d.keys is extremely slow. Using a list in this case should be
> fine since the addtask lines are immediately above the code and aren't
> going to change often.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

A code comment stating it needs to be update would be good.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--14dae94ed90da0f30304efece0a5
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Jan 14, 2014 at 9:43 AM, Richard Purdie <span dir=3D"ltr">&=
lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">=
richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Unfortunately d.keys is extremely slow. Usin=
g a list in this case should be<br>
fine since the addtask lines are immediately above the code and aren&#39;t<=
br>
going to change often.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br></blockquote><di=
v><br></div><div>A code comment stating it needs to be update would be good=
.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystem=
s.com.br</a><br>
<span>Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: <span id=3D=
"gc-number-287" class=3D"gc-cs-link" title=3D"Call with Google Voice">+1 (3=
47) 903-9750</span></span><br>
</div></div>

--14dae94ed90da0f30304efece0a5--
