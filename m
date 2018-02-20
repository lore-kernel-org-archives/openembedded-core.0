Return-Path: <andrei@gherzan.ro>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0702F6FF84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 12:50:49 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id u200so5001984vke.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 04:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LZKCzaBVOkcyBTcJ1/qYqnV9//P4I53oKQ5ERyNqfs8=;
	b=YMk39Y5B7xjJ7mT7GzJAN+I1hnBRZ5DQ3X1bDTCRsBdRZFcjNXEfzCot5RHK7LL8V6
	yKxRiqqLg/eWYowRHwc1smhD0ErmCCu7H5iJ6Dfyi6T3vjUPevOW+QPYRLhFUuS6OYLW
	YcuY7R/39kJYmAUM62dNmtRCAinQeqD0N5R2jY0aX9P4H1Tl59X/Jo5kIN7x89gQlim4
	dCzxJrUHroCHjHUnmxAKQHF3dTN/iQjwfwFFD82OIMnsW3qrRlVH0KRfOolkZWFBeeTp
	NR3Us4ztnEanhotU5lWPRD4q6J33GZYfO4IduCRA5dUF0ToJPaiPtauEEAyXIihl6935
	phOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LZKCzaBVOkcyBTcJ1/qYqnV9//P4I53oKQ5ERyNqfs8=;
	b=C7PrZBv2e8VlSrXHZuGoxriaNrcZvdlPRC5wXMYRNNZ8/8EBZgrJ6Q5TvmlD/A85py
	2SnWhuGYpneYiobCQSJaL+VlN5oHLpn3ODtJpNX0OpG2fq1i1GO0tbD0WwF2e4Ge0Wji
	M234g3muQeD8K9irh2sRBwB3JaC47epJ3TC4TChXUkL48V6wrWeIv4ohFbS5k1FU24H9
	w2RDBmHhe9dQRgvGx29NzCaCGmgr3tPK/t93fUIoIOTSZI7d/zU15wIyi078jmzB9LSW
	6eGyrCRgsR1zb7oe0o8of+MAORuJRkFN56u9RXk7C1z2iNUociD1i5LFdCNbgovNWHJW
	qxYw==
X-Gm-Message-State: APf1xPAkAECIHrHGyNSjrNwhfR631Q8j/Qy/zVerIXYbbahcvTDBSiGJ
	s/o5jAaE0Pn4gJpyKrXFJvFktfU8rGnVBHOkW3Th+g==
X-Google-Smtp-Source: AH8x225hqLHdm7DJEuWbkAJdNdoxE1gO1r7lO3jzGa3B0H7962hnaTYISVGv4VKnDEKpYg4S7F7dFcRo5NA2iaFFr10=
X-Received: by 10.31.51.73 with SMTP id z70mr3056262vkz.2.1519131050594; Tue,
	20 Feb 2018 04:50:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.21.226 with HTTP; Tue, 20 Feb 2018 04:50:10 -0800 (PST)
X-Originating-IP: [90.152.4.98]
In-Reply-To: <CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
	<cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
	<EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
	<CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 20 Feb 2018 12:50:10 +0000
Message-ID: <CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com>
To: "Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>,
	akuster@mvista.com
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Tue, 20 Feb 2018 12:50:50 -0000
Content-Type: multipart/alternative; boundary="001a1144b312a3690e0565a442d6"

--001a1144b312a3690e0565a442d6
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 16, 2018 at 2:08 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:

> On Fri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy <
> avinash.reddy.palleti@intel.com> wrote:
>
>>  I submitted a fix sometime back,
>> http://lists.openembedded.org/pipermail/openembedded-core/20
>> 18-February/147291.html
>>
>>
> Great. We have the fix available and approved by Saul. Shall we merge?
>

Adding the pyro maintainer to this thread.

--
Andrei Gherzan

--001a1144b312a3690e0565a442d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div><div class=3D"gmail_signat=
ure" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr">O=
n Fri, Feb 16, 2018 at 2:08 PM, Andrei Gherzan <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:andrei@gherzan.ro" target=3D"_blank">andrei@gherzan.ro</a>&gt;<=
/span> wrote:<br></div></div></div></div><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><span class=3D"">On Fri, Feb 16, 2018 at 1:48 PM, Palle=
ti, Avinash Reddy <span dir=3D"ltr">&lt;<a href=3D"mailto:avinash.reddy.pal=
leti@intel.com" target=3D"_blank">avinash.reddy.palleti@intel.<wbr>com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0I submitted a fix=
 sometime back,<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-F=
ebruary/147291.html" rel=3D"noreferrer" target=3D"_blank">http://lists.open=
embedded.org/<wbr>pipermail/openembedded-core/20<wbr>18-February/147291.htm=
l</a><br>
<div><div class=3D"m_5106601931707792508h5"><br></div></div></blockquote><d=
iv><br></div></span><div>Great. We have the fix available and approved by S=
aul. Shall we merge?</div></div></div></div></blockquote><div><br></div><di=
v>Adding the pyro maintainer to this thread.=C2=A0</div><div><br></div><div=
><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:s=
mall;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial">=
--</div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">Andrei Gherzan</span><br></div></div></di=
v></div>

--001a1144b312a3690e0565a442d6--
