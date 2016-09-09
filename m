Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id C04356E667
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Sep 2016 17:59:01 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id s29so3009131lfg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2016 10:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kB7e11URv8dZFrEXi8RV1uzMmskQnnKv7B+YCmZBlgo=;
	b=eXZ4V/T4IWe0j/2UDpEuZM4L75cur8ObfOBLWovUpsTsUdQlCGNrtC9HYPToB2mr9m
	3lJgqvkVdHb41BjadDIIQX/YkPx56koiPNU+/wLGu0838zeZZ+yi1FkF3nkZ0kOw2mAA
	i31z9AaEPg7w3DmR2GAEszUC5TD2jI5QZucHb4VhvtYXu0tdqYn7MYkpBGasfGvgbld2
	twaOeAp++B4fvU7bcLeSA/5alESYbajz/f+S3831xq2YIG6k7fwwOHce6nXkDYZ4caSu
	UVuz98BvDwSZMobBYNTqHkhhfMfUrmzLAeiCqVK7h5cvIrepbTm7Cc4+3yZ3S4YTRZ6b
	8KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kB7e11URv8dZFrEXi8RV1uzMmskQnnKv7B+YCmZBlgo=;
	b=i4hOERY4V1L0ZAAkdMNSYrmf1i4a49xMqMavGGVABNxCOIn6N2ITACj/dtsGgXOk46
	CW2pSnEoY4HKxjDvFG92olwg/+06idrDnDiqgylvPTPJxlasXGtiamb33nGztJ1felNd
	rJmSnmHFQvL863AtPG4CRAlM9NbV0bOTGb0TKHp6TzHGFQxDb69raR77w3USucVg/oGi
	atS+ic8l2PGbEsO82H2jH5Ipuy4FmKOB1cx8LJDAd8cKytmC5/5KDy0+op8uwMv/zIrE
	flFgO3RxCVrTeySMEVfrM0jI1Z4wUwpi5SC2IHkeMfOo1WrTPX32LuMCkIcIRuSXOjUt
	5Ogw==
X-Gm-Message-State: AE9vXwMfQPjgYM+QHtyRwDx3vWYlyrt60HjpotrKgwuuNJ7i+63xVCBpayd32F4dfOR9w5gJTddnqOn1F9wo1A==
X-Received: by 10.25.38.149 with SMTP id m143mr1886732lfm.107.1473443941093;
	Fri, 09 Sep 2016 10:59:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.24.195 with HTTP; Fri, 9 Sep 2016 10:58:30 -0700 (PDT)
X-Originating-IP: [179.105.254.222]
In-Reply-To: <CAPybu_37jJw6-drnv3vGa6sHraKynB_dHbAmVBwz0BhUWUNDRA@mail.gmail.com>
References: <20160826153054.27316-1-ricardo.ribalda@gmail.com>
	<CAAPZna3477dZ6jJDGSuJWMjJX14cUDTtKxzOmpnOm-OZ6smszQ@mail.gmail.com>
	<CAPybu_37jJw6-drnv3vGa6sHraKynB_dHbAmVBwz0BhUWUNDRA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 9 Sep 2016 14:58:30 -0300
Message-ID: <CAAPZna1xSdHB9_hgRDH8QY3JojPUk028naNnEPNHwnYgrAR0TA@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python-3.5-manifest.inc: the core module RDEPENDS on misc
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
X-List-Received-Date: Fri, 09 Sep 2016 17:59:02 -0000
Content-Type: multipart/alternative; boundary=001a1141166ab4aad9053c16e613

--001a1141166ab4aad9053c16e613
Content-Type: text/plain; charset=UTF-8

Hi Ricardo,

Take a look at commit:
http://cgit.openembedded.org/openembedded-core/commit/?h=krogoth&id=8bbfe9bd229e3f795577eb5df1cd5104651e2ba2

this commit fix your issue.

Regards

On Tue, Aug 30, 2016 at 10:37 AM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Hi Fabio
>
> Thanks for your the reply. Yes I was using krogoth. There is no need
> for my patch in master.
>
> Thanks for your help!
>

--001a1141166ab4aad9053c16e613
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:monospace,monospace;font-size:sm=
all" class=3D"gmail_default">Hi Ricardo,<br><br></div><div style=3D"font-fa=
mily:monospace,monospace;font-size:small" class=3D"gmail_default">Take a lo=
ok at commit:<br><a href=3D"http://cgit.openembedded.org/openembedded-core/=
commit/?h=3Dkrogoth&amp;id=3D8bbfe9bd229e3f795577eb5df1cd5104651e2ba2">http=
://cgit.openembedded.org/openembedded-core/commit/?h=3Dkrogoth&amp;id=3D8bb=
fe9bd229e3f795577eb5df1cd5104651e2ba2</a><br><br></div><div style=3D"font-f=
amily:monospace,monospace;font-size:small" class=3D"gmail_default">this com=
mit fix your issue.<br><br></div><div style=3D"font-family:monospace,monosp=
ace;font-size:small" class=3D"gmail_default">Regards<br></div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Aug 30, 2016 at =
10:37 AM, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
icardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Fabio<br>
<br>
Thanks for your the reply. Yes I was using krogoth. There is no need<br>
for my patch in master.<br>
<br>
Thanks for your help!<br>
</blockquote></div><br></div>

--001a1141166ab4aad9053c16e613--
