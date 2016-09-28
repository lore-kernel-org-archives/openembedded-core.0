Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 786326AC37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 11:58:09 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id e66so54103330iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 04:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hUPPv5lYhOPf+js+PELBjE1bbdbmQFF5ZxtJ+60XP4w=;
	b=Zah0j6z8WQmbqYIp5L0XqfVCH5EAV24ok4iIDug7P7QfrqR8KYsSh5vSwotad+/mfg
	ieFgsngAWSYNr4UCTxi1rBUkpuz9ATNENcKbQfhqh13tDNHxThx1YtsIrem+U/EUz7E4
	bKnErGOO7FTfNpli1zIfVmYLaXgL3SQUywV+Fkhe8wKs8NIJ1phXvYEubh+xNSx/sc1U
	8mh2qSB1Y431Hj+trruXUyIUyS6aW117Ln1bEdQ162h2++0kCsN55WZF9aXkVa4uoP+G
	rRyuUUSYH4X/elRpy+JWrKEOwZTLlzthzSEUAK2ZprRsQsOeP1aa+w2nPUqhEMPJGKr7
	qc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hUPPv5lYhOPf+js+PELBjE1bbdbmQFF5ZxtJ+60XP4w=;
	b=fI+yL89masHRpd0XysVyUTntL/SPs3BW2LPz0xQKvEk2zGCGy56xo3+aDQYr7D0NUW
	JVPZCOO85xITVGPKvQNQzUu90L8oezETFmPKyw+73AylyPQSvbj9olj1BYqqxDztZSuq
	olNMlg4P603pc/wrbBBHc5wUECCNHb1Z5aTF4+ZVZJTgyLZR8DpXFsAHGvlMAUUbsLNI
	XpjByE0A/oldNLPI0AGrGQ+tVnXysggSsb0PvCZH1F8WvN5QaCKeyG05RNzy5XMtVe/a
	amCTesqyQH9Z/D9okQMn5C7+NF/LK1AGvh3M2hEtAyNWFOivq/nMLlGaOuC+52sWSPbb
	eMGw==
X-Gm-Message-State: AE9vXwORQFnN+U9eCPHkJfWHuU+ujnh5pZXIgePrOYG3LRRRoV17azrPpFmTizYOM8kaAy7oYUmF8yYwMz52HmLy
X-Received: by 10.107.199.195 with SMTP id x186mr33847548iof.88.1475063890752; 
	Wed, 28 Sep 2016 04:58:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Wed, 28 Sep 2016 04:57:50 -0700 (PDT)
In-Reply-To: <1475063789.5024.13.camel@andred.net>
References: <20160926154228.30567-1-git@andred.net>
	<20160926154228.30567-3-git@andred.net>
	<CAJTo0Lb9AmtOVA73xVkqmXJzQfvQQc0wBspv+miNo_eyuBUCmg@mail.gmail.com>
	<1475063789.5024.13.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Sep 2016 12:57:50 +0100
Message-ID: <CAJTo0Lbw6Ar372kEg=dDoAmnkGy5ca4ZtYwaR7NBjPbc1Oh=Vw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cve-check-tool: report progress when downloading CVE database
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
X-List-Received-Date: Wed, 28 Sep 2016 11:58:09 -0000
Content-Type: multipart/alternative; boundary=94eb2c11be4e3ae993053d9013e3

--94eb2c11be4e3ae993053d9013e3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 28 September 2016 at 12:56, Andr=C3=A9 Draszik <git@andred.net> wrote:

> Ups, sorry for that... :-(
>
> Should I send a patch against master-next, or against master?
>

Happens to the best of us :)   Edit your patch and resend it against master=
.

Ross

--94eb2c11be4e3ae993053d9013e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 September 2016 at 12:56, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a =
href=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9dk" class=3D"a3s =
aXjCH m15770a78ee726d0a">Ups, sorry for that... :-(<br>
<br>
Should I send a patch against master-next, or against master?<br></div></bl=
ockquote><div>=C2=A0</div></div>Happens to the best of us :) =C2=A0 Edit yo=
ur patch and resend it against master.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c11be4e3ae993053d9013e3--
