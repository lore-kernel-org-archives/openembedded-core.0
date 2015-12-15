Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0EAA3605B3;
	Tue, 15 Dec 2015 18:45:06 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id e126so29582939ioa.1;
	Tue, 15 Dec 2015 10:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IaEkYCygPe2Pj0cddZ5GpNuJZGkNJH3GH3HiWeb7nzU=;
	b=Yzrhj1OYVEH0SK1sbUlRW6gEjGC/aziilsV8QDlx2SjRTg0tGv/SRYQEh9jF1N86k+
	drq+3mX3FerOwNyGhbiKP0LpRsuIXGqpSX8pfoXc6HlMKFWRA2rXAFnjdyBSj2jXJExB
	ki6tnmysJS0vsW40v/4BXpMCLhdxodIOtQLlLmFuLDMFN2/QXBIL9R1zQtmP7B2nbMt+
	fyJGQGfVrnBqANTYRLcL/Uq7tfqDsV2o4kckZvj/kTmCuwQVsDFMFJdBusUor58AHuXP
	5YkDv1WETwYrtgvIf7mUwx8IIpiuZ6Bi6AVUvtP37wer5IT+8m052K8VAvIwn1ylKQ+x
	DYGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=IaEkYCygPe2Pj0cddZ5GpNuJZGkNJH3GH3HiWeb7nzU=;
	b=B+/pQXTjoQUCz3mB5bXylri/+roKql5lzRHw1ReearB4TbralfAw+o6pDkK05NVBwP
	NQbaB6+dJVEjvpC+EIrOp+mdViKzh9EUqDxU/Pu4tHLLNpV+5XOIkKGEVOcqh59qTPEA
	Du/aWRWBoY5bEMt+G0JkwhsBq4y5NWyey5W5F2aNeMlPQgeSE1fr0zmojRUby1Q11k9x
	UVh6ve0A0yafeAfrxLS1z9B8JcZoZnJXbOzENm2eDK2yg7U2ny0SLxcS6dU1ai2eVTT6
	oQD3eMmT5e1k72j2PDQHv5fN1/W1MHyY/PIiFAqkRFuJDf8YlCeejQFZuAHeYgw67Ngf
	tooQ==
X-Received: by 10.107.38.83 with SMTP id m80mr42321099iom.98.1450205107466;
	Tue, 15 Dec 2015 10:45:07 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Tue, 15 Dec 2015 10:44:48 -0800 (PST)
In-Reply-To: <1450194211.13505.63.camel@linuxfoundation.org>
References: <1450194211.13505.63.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 15 Dec 2015 11:44:48 -0700
X-Google-Sender-Auth: vg7gFP6htPa6c9Xw5ADCxW6RQKQ
Message-ID: <CABcZANmUxy_-tgdRpUejRRwb3FKyb+L9cXJ0iDWd1j8irx3qEQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Automatic -dbg FILES generation
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
X-List-Received-Date: Tue, 15 Dec 2015 18:45:07 -0000
Content-Type: multipart/alternative; boundary=001a1140ca024839220526f4303e

--001a1140ca024839220526f4303e
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 8:43 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> I don't think I'm alone in being a bit frustrated with the effort
> needed to get FILES_${PN}-dbg correct. I've just posted a patch to oe
> -core which automates this and means we can drop 99% of the cases where
> we set this variable.
>
> I'm giving a heads up here since this is an architectural change to the
> way the system works and wanted people to be aware of it. I'm hoping it
> will be welcomed and not too controversial.
>
> Setting FILES_${PN}-dbg doesn't harm anything, it just becomes
> unnecessary in most cases.
>

I'll just say hell yes :) Been hoping one of the implementations of this
would get merged, glad to see it happening.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1140ca024839220526f4303e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Dec 15, 2015 at 8:43 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":bh" class=3D"a3s" style=3D"overflow:hidden">I don&#39;t=
 think I&#39;m alone in being a bit frustrated with the effort<br>
needed to get FILES_${PN}-dbg correct. I&#39;ve just posted a patch to oe<b=
r>
-core which automates this and means we can drop 99% of the cases where<br>
we set this variable.<br>
<br>
I&#39;m giving a heads up here since this is an architectural change to the=
<br>
way the system works and wanted people to be aware of it. I&#39;m hoping it=
<br>
will be welcomed and not too controversial.<br>
<br>
Setting FILES_${PN}-dbg doesn&#39;t harm anything, it just becomes<br>
unnecessary in most cases.</div></blockquote></div><br></div><div class=3D"=
gmail_extra">I&#39;ll just say hell yes :) Been hoping one of the implement=
ations of this would get merged, glad to see it happening.<br>-- <br><div c=
lass=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<b=
r>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Seni=
or Software Engineer, Mentor Graphics</div>
</div></div>

--001a1140ca024839220526f4303e--
