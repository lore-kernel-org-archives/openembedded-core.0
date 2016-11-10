Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 19CDF6E688
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 20:25:17 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id q130so311492518qke.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 12:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dJbTVeTZXKxWxpvKUH7KIu/q8hf7vDeLu8kXHpMO2s8=;
	b=fyZEX0wi5u3LAESJMOvOn5VNf2FSPgUe1ficsQg/o4ZL8RjAG6NOkrgFGwTXOOCrx3
	3hDrjw9NoDPhXE9MtmQ66gtbfgk1xLb1bC9BfFT4LdPZDtLQheP4lhylQnEyI5aIXlsG
	lSRerGRrGIz6PXmt7X+HHRJZ2nZ0nJTe+9ZBl+L/fJgWil/pQAJZVT6imC04lWpoStuR
	jSpdD8phQBcQQwYX1YEE+1y9mhiSGyKT4An6kG/D4QZVNNGombaSDOctsICYUVeA6AYN
	o/srhWHiP2EU1NOJqJoZMcb9NZ90zWjYjCF/ofGWwO8tQFRIq8bMutbvlyA9qKLWFFg9
	qbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dJbTVeTZXKxWxpvKUH7KIu/q8hf7vDeLu8kXHpMO2s8=;
	b=CiPxuRXxK8Cydq4r0lw7pV+LrYsnlPzvLusgE9DtWClCc81LYxvMwyquK7z2Q+a4mG
	Ar7y5O/7SuvZcUk0swiYZFn0dVPJQzrgQeHbcsAg8eIzLfaj9Zel/PPNzYemrPB99SLa
	JriT+PQUH9nWiQpOGIxKl8BUHri02yFtYOvt80dAyfsTVAvopZx8JlCvvNTo4t2euiO/
	A4tooIyGjqDXPwyVNaWwVZb5XHNOgnsQw3pbI5cm9F+UTZm67M4dPZAnWqu2pcLWQt8J
	a+VHArE4cB2PMjP6zhtLvAWyf6Fmpc/HRiJSv6zdYGXGQRaTsV625lW/S4yANa+M6bGU
	MQeA==
X-Gm-Message-State: ABUngvevvguA2Zu61nlpWWbf5LkRZu9y/p6u1wWRdo5bg14RmNT9RHf2xAO1lDB0ag5iyET1Ae+p6tL5uGazjmNG
X-Received: by 10.55.75.17 with SMTP id y17mr7777990qka.26.1478809518629; Thu,
	10 Nov 2016 12:25:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 10 Nov 2016 12:24:58 -0800 (PST)
In-Reply-To: <7e997c0b-1fe2-5881-f977-48b180b36545@imgtec.com>
References: <20161108171235.41837-1-Zubair.Kakakhel@imgtec.com>
	<20161108171235.41837-13-Zubair.Kakakhel@imgtec.com>
	<CAJTo0LZTHPYsot=YkNGXh=p2AP37X89JqW2xMgdYjanftpDxxQ@mail.gmail.com>
	<5ac79668-0555-5329-e9d3-048ee217d3ff@gmail.com>
	<7e997c0b-1fe2-5881-f977-48b180b36545@imgtec.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Nov 2016 20:24:58 +0000
Message-ID: <CAJTo0LY1uX9pUDiVNnPBzT2L-XCe8C04G4Q6itde5R9Ehm9WXA@mail.gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2 12/14] ltp: Reduce duplication in MIPS variants.
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
X-List-Received-Date: Thu, 10 Nov 2016 20:25:19 -0000
Content-Type: multipart/alternative; boundary=001a114a88c80c7b570540f82ca3

--001a114a88c80c7b570540f82ca3
Content-Type: text/plain; charset=UTF-8

On 10 November 2016 at 11:37, Zubair Lutfullah Kakakhel <
Zubair.Kakakhel@imgtec.com> wrote:

> I can't seem to be able to reproduce this error using just my patches on
> top of poky master.
>

Yeah me neither.  I love it when the autobuilder does this.  I'll throw it
back into the mix and see what happens.

Ross

--001a114a88c80c7b570540f82ca3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 November 2016 at 11:37, Zubair Lutfullah Kakakhel <span dir=3D"ltr">&=
lt;<a href=3D"mailto:Zubair.Kakakhel@imgtec.com" target=3D"_blank">Zubair.K=
akakhel@imgtec.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":6hf" class=3D"a3s aXjCH m1584e076e59188ca">I can&#39;t seem to =
be able to reproduce this error using just my patches on top of poky master=
.<br></div></blockquote></div><br>Yeah me neither.=C2=A0 I love it when the=
 autobuilder does this.=C2=A0 I&#39;ll throw it back into the mix and see w=
hat happens.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a114a88c80c7b570540f82ca3--
