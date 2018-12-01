Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2063B6C123
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Dec 2018 00:31:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r24so2754312wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2018 16:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HowJJ/dZniaUOwFvElNdKyXvrZx9aBb9sjPRToCqo7Q=;
	b=Af2dB9iGjKlqrjpMKc87wSy0KPneu3t9XsodV7PgvcwYL43Ow18uazXnuv9sRtrBFI
	9QKGZAQ1H8XYdsSEyoC3JMoHlQxeHXej2T0mwwKxc1uG8PF+E+MW7kzVbDWN28Kkn4ss
	0/uL8lkMj7aqK1EAB/4hymZermwHTH32fePKc/hmgV1ESMxKoSZ7iaCP48185hL7DyGp
	/LsPiD8yvn1HPjIkBeTMxa05krdY7z30s6f1Hb6gMLmkoNfW11/iPrp18dx/qMiJcGVH
	sqkHM1dl5tFUWenAM721hqhqLGjQejzeHmIIa6aIJkx+mYWVRNJOPE6h9OxQEwuGKoFd
	IVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HowJJ/dZniaUOwFvElNdKyXvrZx9aBb9sjPRToCqo7Q=;
	b=ByuVe05eyDhj/824RKetS5J7GMqLzHx7nS+BdGoUdF02L7Ol9wmDPCClIXncx7Lolw
	hqcv8WexadDGlMqaIdDobwJ88JTJbb7I8cRk0iBep9vaGe3XD0diqXPtEq2dJt+EBOZP
	/xaC/Q4kYRVSQWN+HNwNczAumIT8o+CFroeSrRIRgMgYTxes7d8Kwxh+qp7Q2XzR+TWp
	mvKJeyPctOV5dBZv+SERRXVyL9PWSviDT719KpBA5fJpj4BDlWRJX0YmP2WzQxfDTxlP
	E1RfifnnDHkTqqUYACbP9OnseIJr8JxKdUXlAXw+0uxDXjvduSTs8i62IyNxbPGv+UgX
	PATA==
X-Gm-Message-State: AA+aEWbt3Q8f2rYaXzY4rwCoIm97RkE5VqRcdFEKtQat0EuedUDWOWp6
	kmf0w2gtQ/QhePPON1MwLZFRnr4PcyLn0+kH6bo=
X-Google-Smtp-Source: AFSGD/VNiIymzU4OEzHbwibxpiVLCgWQK4CmrWtrAn3tAy8sPEVPaCfesrGKFJWwXZL4yotx7tUXUDF6SmmlgxtWt6k=
X-Received: by 2002:a1c:8095:: with SMTP id b143mr684730wmd.63.1543624261654; 
	Fri, 30 Nov 2018 16:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20181130215537.29981-1-JPEWhacker@gmail.com>
	<CAJTo0LaNDeDGKfG9p8s8PY1RQVEQg5uDk3rLqqNiPNFXO2fiaA@mail.gmail.com>
	<CAJdd5GZEM1PYnC-aENt59TpGodgdhLXv+uXgwruvzAP7UTDG4g@mail.gmail.com>
In-Reply-To: <CAJdd5GZEM1PYnC-aENt59TpGodgdhLXv+uXgwruvzAP7UTDG4g@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 30 Nov 2018 18:30:49 -0600
Message-ID: <CAJdd5GYXUn5=wA2rC88SmaHOUM-ws5ZrQTT0VJCgzPNc-EYuaQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/waf: Fix builds when B != S
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
X-List-Received-Date: Sat, 01 Dec 2018 00:31:01 -0000
Content-Type: multipart/alternative; boundary="000000000000c85ef8057beb0704"

--000000000000c85ef8057beb0704
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 30, 2018, 6:01 PM Joshua Watt <jpewhacker@gmail.com wrote:

>
>
> On Fri, Nov 30, 2018, 5:00 PM Burton, Ross <ross.burton@intel.com wrote:
>
>> On Fri, 30 Nov 2018 at 21:56, Joshua Watt <jpewhacker@gmail.com> wrote:
>> > +B = "${WORKDIR}/${BPN}-${PV}"
>>
>> That's the default, so redundant.
>>
>> Does waf support out-of-tree builds sufficiently well that we can
>> default  - or even mandate - out of tree?  i.e. follow meson and
>> cmake, and just set B=$WORKDIR/build in the class.
>>
>
> Yes. This patch already does that by adding "-o ${B}" in do_configure. I
> will change it to ${WORKDIR}/build. Out if curiosity, why is that preferred
> over ${WORKDIR}/${BPN}-${PV} ?
>

Hah, right. {WORKDIR}/${BPN}-${PV} is also the default value for ${S}, so
setting to ${WORKDIR}/build ensures they are different, which we want/need
for waf.


>> Ross
>>
>

--000000000000c85ef8057beb0704
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">=
On Fri, Nov 30, 2018, 6:01 PM Joshua Watt &lt;<a href=3D"mailto:jpewhacker@=
gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">jpewhacker@gmail=
.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto"><=
div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, Nov 30, 201=
8, 5:00 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" rel=3D=
"noreferrer noreferrer noreferrer noreferrer" target=3D"_blank">ross.burton=
@intel.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 30 No=
v 2018 at 21:56, Joshua Watt &lt;<a href=3D"mailto:jpewhacker@gmail.com" re=
l=3D"noreferrer noreferrer noreferrer noreferrer noreferrer" target=3D"_bla=
nk">jpewhacker@gmail.com</a>&gt; wrote:<br>
&gt; +B =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
<br>
That&#39;s the default, so redundant.<br>
<br>
Does waf support out-of-tree builds sufficiently well that we can<br>
default=C2=A0 - or even mandate - out of tree?=C2=A0 i.e. follow meson and<=
br>
cmake, and just set B=3D$WORKDIR/build in the class.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Yes. This patch already=
 does that by adding &quot;-o ${B}&quot; in do_configure. I will change it =
to ${WORKDIR}<span style=3D"font-family:sans-serif">/build. Out</span>=C2=
=A0if curiosity, why is that<span style=3D"font-family:sans-serif">=C2=A0pr=
eferred over=C2=A0</span><span style=3D"font-family:sans-serif">${WORKDIR}/=
${BPN}-${PV} ?</span></div></div></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Hah, right.=C2=A0<span style=3D"font-family:sa=
ns-serif">{WORKDIR}/${BPN}-${PV} is also the default value for ${S}, so set=
ting to=C2=A0</span><span style=3D"font-family:sans-serif">${WORKDIR}</span=
><span style=3D"font-family:sans-serif">/build ensures they are different, =
which we want/need for waf.</span></div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Ross<br>
</blockquote></div></div></div>
</blockquote></div></div></div>

--000000000000c85ef8057beb0704--
