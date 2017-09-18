Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id F033D78049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:51:50 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id h66so3162592ioh.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3y88yRLyvoTU2zQbZA20IZW98crc9ZQEQNEdc+ao2OM=;
	b=hN78B5IwvnZut5tv18vIXo64gZKXf+fbawhsIdrI5kvnpu+TmtdHAR5nRWo5jLkKKq
	mqxUOxhjG7cX435E9/rcSydy7gKq5cimOpeVNdO2IKfixrdRYpfRyBGer+t1a+EAbp/H
	fqLrlljiKbIi6ST0sPkuR0xbFS5tIqrMmfiFK/lwMzMuN+EHJZkzz2GwwQ4BlXT3ap7F
	sOgoDAkiIF9ymt2Wnr1n7ySXDsowKLP7JsNnBMhsPGS5xoj0rndvRIhQZX2MO8F26ck2
	GO1TmHnN4RjkRiEU4qgeDxKkzNnrbavb6MwLCpNmcGOKbdBBMDeUBkrEKzL1upaS7xEd
	GUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3y88yRLyvoTU2zQbZA20IZW98crc9ZQEQNEdc+ao2OM=;
	b=Zu7VOAw/eDt0EyrgtUQwHPwTt5IdQTDsgFyyg4iFPqCAjY2Zie1X4K++73MOnOSm3K
	vR9vl+U4+sJGMBzP/LP6UPho8vZoqZlDmL/gCzOnIdwz+ZBACNrhrgxshFA8/5QXzjjT
	Ox2SOuS9gfGTyByUhB0EhdtUJs50jza4zv1I75XaIBWtURbk/jJkiRZPwspy8n3u5cLj
	55HX4Ew8RuoFqGvsZJ50q65N00b2WRX1sR9lhqyj+UeSZj8EooXJeNW04vufZkDmdtmL
	VtwVXG1lTfTZSs/moTdUaZ7PvkdMFSq3fjkzPtuJJpmpNbdvyYiGnx+Fjz+etn+o6D5R
	MEhQ==
X-Gm-Message-State: AHPjjUhUjE2X7Cng6Lra+OU2XhBrdXbvLRiQBVbFWmASwD13vLVJiIQP
	JD0YVxG2aVMyPFUr8Hn6anTfyer3F/Kr1Wf0KPyAjA==
X-Google-Smtp-Source: AOwi7QAh634xbDGdOc36BSbreF9cGfqOrY2lJFSBWPuCinH81kWXJqD/CxmELfa3/VNAFo4FT4amTTg6HB8/Nm0plHM=
X-Received: by 10.107.32.70 with SMTP id g67mr21568649iog.77.1505749911950;
	Mon, 18 Sep 2017 08:51:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 08:51:31 -0700 (PDT)
In-Reply-To: <CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
	<CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 16:51:31 +0100
Message-ID: <CAJTo0LbFHX_Wm_W2MteS=6XbJgqzZh-jtGZ_Bhu95kO8Nue+dw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [U-Boot] [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Mon, 18 Sep 2017 15:51:51 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c9f8d1b055978b85d"

--001a1140ae2c9f8d1b055978b85d
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 16:46, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> What is the policy on doing u-boot version upgrades this late in the
>
> release cycle? SHouldn't this wait until after the release?
>
>
> Why?
>
> It is just another recipe and we are upgrading to the final release.
>
> As Martin said, it was already broken.
>
> I'll take the responsibility to fix it. But as other packages, upgrades
> has risk and we have more than enough time to proper fix it.
>

Why?  Because it was merged to master after the freeze.

Personally I'm of the opinion that u-boot is one of those special recipes
that if an upgrade appears just after freeze, we consider it.  If we don't
keep it up to date BSPs won't use the recipe, and we'll be back to every
BSP layer containing its own special copy of the u-boot recipe.

Ross

--001a1140ae2c9f8d1b055978b85d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 16:46, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div dir=3D"auto"><span class=3D""><div>What is the policy on doing u-boot=
 version upgrades this late in the<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"m_-422887529407011750quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
release cycle? SHouldn&#39;t this wait until after the release?<br></blockq=
uote></div></div></div><div dir=3D"auto"><br></div></span><div dir=3D"auto"=
>Why?</div><div dir=3D"auto"><br></div><div dir=3D"auto">It is just another=
 recipe and we are upgrading to the final release.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">As Martin said, it was already broken.=C2=A0</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll take the responsib=
ility to fix it. But as other packages, upgrades has risk and we have more =
than enough time to proper fix it.</div></div></blockquote><div><br></div><=
div>Why?=C2=A0 Because it was merged to master after the freeze.</div><div>=
<br></div><div>Personally I&#39;m of the opinion that u-boot is one of thos=
e special recipes that if an upgrade appears just after freeze, we consider=
 it.=C2=A0 If we don&#39;t keep it up to date BSPs won&#39;t use the recipe=
, and we&#39;ll be back to every BSP layer containing its own special copy =
of the u-boot recipe.</div><div><br></div><div>Ross=C2=A0</div></div></div>=
</div>

--001a1140ae2c9f8d1b055978b85d--
