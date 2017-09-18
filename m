Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5862778272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:46:26 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id q80so416818ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=9qGUaJA6u0nOIZCtS5N8MZS47g7aLnxcmv473RTrhTU=;
	b=xQZCHTf7zXa6XptmLvC63OYzeDjl9gaevAGX38DuYxLphuSDf7kdBoEhzLxEmcdZ+j
	m52lsZLLy2Fn0u7K1IxFWNlENXNEvLWVrB1ioQZg25gwwDyF1xp1sskinMYdM0vxZgMC
	0vfLWEpOi8wJ3WQxPpL8rSRfeYMrwTPQt+A8iKwsW7JRZWX9xfpAfELoAFh77WssOVI1
	13iMyZe3hCtX+nI7Yc9V+eIKMFGDpDlQsCgFaaDYRJHpJyd6D8mIiiw2TAGC92dZVz5p
	BrTG5sPewarnZtXlSX8dYJGDsIFRWQScv0XvsZrSTMA8cznFmu+eMkmkXJA07h9S0DVQ
	bSow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=9qGUaJA6u0nOIZCtS5N8MZS47g7aLnxcmv473RTrhTU=;
	b=haWqquR6Qr7R5+FvsUW37oj5c9+D5sQ3AD5XF7uIlpqiHhUGaGZAWUpl4vcYVzHi8n
	Z4cbKoSOc+85B59j2Ji4/Sbj11w+qTI7RzPk2X0rDwfgTnbLOYJaKOuAP6rllHhgI5uw
	AzgM4fknadgVQhXQqCGnT1QWW6CH80WPO+NiJh1aJoUOHBA6tmX46yGdbJ6FwXxpEMth
	IL6UmXTE17Urr4ka42GhkcYWhQMGSRf73XPJIfpyWgV056BV5Q1mXFoOSshMa/VLRd9O
	OMkNaol3kdLg1/F0h4ZNOdSeiwHb7DdfZs5d1zQw1FrKbVPke6Qk4EjsG7c/i/ehD8bO
	4zzw==
X-Gm-Message-State: AHPjjUgpGtFaWQ3LWBcoJyDqDSkm+4r9hhLm6wFXQoedKm6qZBDQG79D
	mHj8OCSrgujfq8a7Svk=
X-Received: by 10.129.41.12 with SMTP id p12mr29872808ywp.150.1505749587878;
	Mon, 18 Sep 2017 08:46:27 -0700 (PDT)
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com.
	[209.85.223.178]) by smtp.gmail.com with ESMTPSA id
	q31sm3173720ywa.25.2017.09.18.08.46.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Sep 2017 08:46:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f178.google.com with SMTP id q11so3116813ioe.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 08:46:26 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDUfplO5I+cKYv0CfgEO5pRRQYjaCeJSw9cKFyHXkkuCRyarpVkl8lPEB192yj72HBLp05E9s9Vl9HsQS1R2eo=
X-Received: by 10.202.117.9 with SMTP id q9mr5788327oic.25.1505749585820; Mon,
	18 Sep 2017 08:46:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.66.149 with HTTP; Mon, 18 Sep 2017 08:46:24 -0700 (PDT)
Received: by 10.157.66.149 with HTTP; Mon, 18 Sep 2017 08:46:24 -0700 (PDT)
In-Reply-To: <51b6874b-551a-3983-4002-77e166822521@balister.org>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CA+chaQec-cL6x3i3TfOi7yBhmCQ9Gf=-4jXkXqJ2-yJQmPmcmw@mail.gmail.com>
	<5e66c357-fda0-17d8-1d78-5b877fdc47e5@gmail.com>
	<CA+chaQfdgGcWAc17f=epK8s3q1=h+voUUc4sNJSLdtu_5SbOfA@mail.gmail.com>
	<1095f2c9-3ff8-bf71-4b6e-707111a4445c@gmail.com>
	<20170918083915.GB3340@jama>
	<51b6874b-551a-3983-4002-77e166822521@balister.org>
Date: Mon, 18 Sep 2017 12:46:24 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
Message-ID: <CAP9ODKpiSEJqR47RnjV+EFBeo7gd3wEtAR398Pwn8HjCj93TEA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Marek Vasut <marek.vasut@gmail.com>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 18 Sep 2017 15:46:27 -0000
Content-Type: multipart/alternative; boundary="001a1134f9c62f363c055978a56d"

--001a1134f9c62f363c055978a56d
Content-Type: text/plain; charset="UTF-8"

Em 18 de set de 2017 12:20 PM, "Philip Balister" <philip@balister.org>
escreveu:

On 09/18/2017 02:39 AM, Martin Jansa wrote:
> On Mon, Sep 18, 2017 at 10:31:05AM +0200, Marek Vasut wrote:
>> On 09/18/2017 09:54 AM, Martin Jansa wrote:
>>> u-boot-fw-utils-cross is broken for at least a year, if it breaks a lot
>>> of boards, why nobody complained yet?
>>
>> Didn't you say it worked for 2017.07 or did I misunderstand that ?
>
> u-boot-fw-utils did work, u-boot-fw-utils-cross no, read it again:
>
> And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro and
> 2017.01 version there, maybe it's time to remove cross version? As
> nobody is using it and it's not tested?

What is the policy on doing u-boot version upgrades this late in the
release cycle? SHouldn't this wait until after the release?


Why?

It is just another recipe and we are upgrading to the final release.

As Martin said, it was already broken.

I'll take the responsibility to fix it. But as other packages, upgrades has
risk and we have more than enough time to proper fix it.

--001a1134f9c62f363c055978a56d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_extra"><br><div class=3D"gma=
il_quote">Em 18 de set de 2017 12:20 PM, &quot;Philip Balister&quot; &lt;<a=
 href=3D"mailto:philip@balister.org">philip@balister.org</a>&gt; escreveu:<=
br type=3D"attribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"elided-text"=
>On 09/18/2017 02:39 AM, Martin Jansa wrote:<br>
&gt; On Mon, Sep 18, 2017 at 10:31:05AM +0200, Marek Vasut wrote:<br>
&gt;&gt; On 09/18/2017 09:54 AM, Martin Jansa wrote:<br>
&gt;&gt;&gt; u-boot-fw-utils-cross is broken for at least a year, if it bre=
aks a lot<br>
&gt;&gt;&gt; of boards, why nobody complained yet?<br>
&gt;&gt;<br>
&gt;&gt; Didn&#39;t you say it worked for 2017.07 or did I misunderstand th=
at ?<br>
&gt;<br>
&gt; u-boot-fw-utils did work, u-boot-fw-utils-cross no, read it again:<br>
&gt;<br>
&gt; And that u-boot-fw-utils-cross was broken even with Yocto 2.3 Pyro and=
<br>
&gt; 2017.01 version there, maybe it&#39;s time to remove cross version? As=
<br>
&gt; nobody is using it and it&#39;s not tested?<br>
<br>
</div>What is the policy on doing u-boot version upgrades this late in the<=
br>
release cycle? SHouldn&#39;t this wait until after the release?<br></blockq=
uote></div></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Why?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">It is just another recipe=
 and we are upgrading to the final release.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">As Martin said, it was already broken.=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ll take the responsibility t=
o fix it. But as other packages, upgrades has risk and we have more than en=
ough time to proper fix it.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to"><br></div><div dir=3D"auto"></div></div>

--001a1134f9c62f363c055978a56d--
