Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5882560745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 08:55:57 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id t1-v6so5230251ott.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=lbMnLuQFNJgpcA5XwFQUoqVsz0r0lEU+UrnbKkZgp+Y=;
	b=AWARH7imv3HEcTq9NodUttKDnjYEoATOmMckMBEqDNkW9Bdzh96ZuyseF4Ii1jXnXA
	F2tcdhIfBE/LdRry2M4C2cFlEPiQI8sX/jICo02GwBQfSzlCI9CkdJXlPU2scLbn6kK8
	8O7OvzWvhSPZDKMx5MM3lfn/msE1VEu7ne8y+/6/GDzCnkvJZ+7cQWMAl/JgDASm4Yyh
	HmL/O/Be3TSHVUCE5ZUf9zK5cbJyPbui1DyGqxnOCKBDwcrF4bwQ34cSlsaha9t8+lI1
	s1t1hzc1dGU1HYnyZRpao6uW/zE0knN4weZGu+NalZBG0QJqDSvhXO+V8P9hyYYnsu5+
	63jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=lbMnLuQFNJgpcA5XwFQUoqVsz0r0lEU+UrnbKkZgp+Y=;
	b=hV7RretF1d9fAUSFDHjXhki0h//sjweBYxizhGrVJlDu9D3zxsB6Q9HURzcJ00Eeh4
	TgJ7t4sYh3bp+WTlV1R4P348bEda/Ey8int/nKZIevBUFfeUV0RdjBNxvtbnZRdc6/Ew
	GrwL1tktlyJFUcTyInOSpYIfG+NYRxTtTyjFNP+KTBu7OtCfmAoPtaVYnpe0ogRnxvZ4
	04W9grOqrxC6P+lDzA88wbpBr6AM+dYxi308SAgxxjIOnlrirmu28p8toYw+gbcbAlAu
	GeNH+MRgHwU/k5TWXkBSiTooK5mJKwT7+RYRR0mNC41UfpdVQScVMQA1Zjv+n1SDvStZ
	0x1g==
X-Gm-Message-State: ALKqPwdINhX5nvtYczCBKj+ApahbNeZ9Lo/Pgj7NS/k5ksi3SmvP8CNe
	1BAYXA4ozd8zSq63FjM8sBCP3RBKAax9rST5AjM=
X-Google-Smtp-Source: ADUXVKJOjLisrOUBZVjDlnQo5vXudY8vBN8B0t/QXGjvbwwqFzZysBZN9v0psLkJElP9TlESyJxIfxn70iHsjVN16Hk=
X-Received: by 2002:a9d:30a1:: with SMTP id
	s33-v6mr1013167otc.360.1527238558707; 
	Fri, 25 May 2018 01:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c06:0:0:0:0:0 with HTTP; Fri, 25 May 2018 01:55:58
	-0700 (PDT)
In-Reply-To: <CAEhQi8n2uy8y4OyZ+X1hxcEQk54sAV8Ew-_8NsqD+ri8ctfRFg@mail.gmail.com>
References: <CAEhQi8n2uy8y4OyZ+X1hxcEQk54sAV8Ew-_8NsqD+ri8ctfRFg@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Fri, 25 May 2018 10:55:58 +0200
Message-ID: <CAEhQi8krCQK=HoekQXPM-5hTPv-ch6S_qy=wQnVTkwm5XtpQmw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] protobuf fetch failed
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
X-List-Received-Date: Fri, 25 May 2018 08:55:58 -0000
Content-Type: multipart/alternative; boundary="000000000000c77353056d03efb2"

--000000000000c77353056d03efb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry disregard my comments on protobuf_3.5.1.bb it works there. But the
questions stand when it comes to rocko branch and protobuf_3.4.1.bb.

BR
Mans Zigher

2018-05-25 10:52 GMT+02:00 M=C3=A5ns Zigher <mans.zigher@gmail.com>:

> Hi,
>
> I am using rocko and for some reason the fetch started to fail. The recip=
e
> protobuf_3.4.1.bb
>
> SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.4.x"
>
> ERROR: protobuf-3.4.1+gitAUTOINC+b04e5cba35-r0 do_fetch: Fetcher failure
> for URL: 'git://github.com/google/protobuf.git;branch=3D3.4.x'. Unable to
> fetch URL from any source.
>
> The strange thing is that I cannot find a branch 3.4.x in the
> https://github.com/google/protobuf.
>
> I also noticed that on master you are using 3.5.1 but the same problem
> occurs there
>
> SRC_URI =3D "git://github.com/google/protobuf.git;branch=3D3.5.x"
>
> which is a branch I cannot find.
>
> What is it that I am missing here?
> Would it make sense to use tag instead of branch in the recipe?
>
> BR
> Mans Zigher
>

--000000000000c77353056d03efb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry disregard my comments on <a href=3D"http://protobuf_=
3.5.1.bb">protobuf_3.5.1.bb</a> it works there. But the questions stand whe=
n it comes to rocko branch and <a href=3D"http://protobuf_3.4.1.bb">protobu=
f_3.4.1.bb</a>.<div><br></div><div>BR</div><div>Mans Zigher</div></div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">2018-05-25 10:52 GMT+=
02:00 M=C3=A5ns Zigher <span dir=3D"ltr">&lt;<a href=3D"mailto:mans.zigher@=
gmail.com" target=3D"_blank">mans.zigher@gmail.com</a>&gt;</span>:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><div>I am usin=
g rocko and for some reason the fetch started to fail. The recipe <a href=
=3D"http://protobuf_3.4.1.bb" target=3D"_blank">protobuf_3.4.1.bb</a></div>=
<div><br></div><div>SRC_URI =3D &quot;git://<a href=3D"http://github.com/go=
ogle/protobuf.git;branch=3D3.4.x" target=3D"_blank">github.com/google/<wbr>=
protobuf.git;branch=3D3.4.x</a>&quot;<br></div><div><br></div><div>ERROR: p=
rotobuf-3.4.1+gitAUTOINC+<wbr>b04e5cba35-r0 do_fetch: Fetcher failure for U=
RL: &#39;git://<a href=3D"http://github.com/google/protobuf.git;branch=3D3.=
4.x" target=3D"_blank">github.com/google/<wbr>protobuf.git;branch=3D3.4.x</=
a>&#39;. Unable to fetch URL from any source.<br></div><div><br></div><div>=
The strange thing is that I cannot find a branch 3.4.x in the=C2=A0<a href=
=3D"https://github.com/google/protobuf" target=3D"_blank">https://github.co=
m/google/<wbr>protobuf</a>.</div><div><br></div><div>I also noticed that on=
 master you are using 3.5.1 but the same problem occurs there</div><div><br=
></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:small;font-style:normal;font-variant-ligatures:normal;font-varia=
nt-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-=
indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgrou=
nd-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-col=
or:initial;float:none;display:inline">SRC_URI =3D &quot;git://<a href=3D"ht=
tp://github.com/google/protobuf.git;branch=3D3.5.x" target=3D"_blank">githu=
b.com/google/<wbr>protobuf.git;branch=3D3.5.x</a>&quot;</span><br></div><di=
v><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline"><br></span></div><div><span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>which is a branch I cannot find.</span></div><div><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
"><br></span></div><div><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">What is it that I am miss=
ing here?</span></div><div><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">Would it make sense to=
 use tag instead of branch in the recipe?</span></div><div><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline"><br></span></div><div>BR</div><div>Mans Zigher</div></div>
</blockquote></div><br></div>

--000000000000c77353056d03efb2--
