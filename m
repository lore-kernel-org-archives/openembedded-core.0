Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4D46B71A73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:21:59 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so22690624wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O/UnoxrIaPfmAGUXCDBlse3a/uwGvnn7/93IgFl6C2g=;
	b=pyY2ujBu5K/98OlIjRTGPUlRQX4ZM3BWc07nweBj2WihvOcE4nhHKlkvnJPW2HuM4m
	P+pG+RhnGl7T76P8TH474TES7BLaAT13Nm6tA5P5B67ZaTurtvqh/I7DEAEUTPHpl8eT
	yhreNnBabJE+uUAbtneMPdu69uNcg3h9rxzeIpgpv3Ga5C6Qvd16zlzATHqheZteWrM8
	uf/yLksWXk/4RY0i54O37HPgJetZwI0oPqKk1/r8A4MkAgWo8JkN/FIhJcrjfkmWi/Yx
	iUAI7BDbS9O0o5CTdAzU6D94Q8jqEdeHbs/Z9WyLSOqnm7xrD6/XhGdzbXsfyBsWPhgj
	eU+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O/UnoxrIaPfmAGUXCDBlse3a/uwGvnn7/93IgFl6C2g=;
	b=TbXSe5OfsEUdUczaU4dRdELuVSxG7uy5GKO32WHeyShcD16H7w/2WptXg0f7Tjqnaz
	iO2JxyPTzXpB/ifV92sEEiHj9nnCcSBVYA3JtcyztvYHikV/B9TocNkt1eNBcaIKNuRj
	d4c4qU7Wq8y8mUPNDcQjoEN25xBnzyuljXQuPAlLECEBSiaDy/apjFQS5W+OB7cCVJeE
	YMQjWbWQ8rpQw38X3NNH4H4ld/f9BELG9RWEFG5e80yTyhmFz2UcsGgO83CnKbQWgh1K
	nqdO9PfcwnZ5D82jNdWI3LK1+qY4Jid73PLHjEVdUvRro7gpL04FzXZQNekrJ6Pem99h
	Tynw==
X-Gm-Message-State: AKaTC01mjMSFeTvrKBh4YZNDs7hVogU6iPxbA2938eaWANwakHAU+W554XCaxSEI9Tz1dpIo8PJNr1o6z/oMxA==
X-Received: by 10.46.8.25 with SMTP id 25mr1783803lji.21.1479399720922; Thu,
	17 Nov 2016 08:22:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.40.6 with HTTP; Thu, 17 Nov 2016 08:21:30 -0800 (PST)
X-Originating-IP: [189.114.111.135]
In-Reply-To: <CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
References: <1479396394-26134-1-git-send-email-fabio.berton@ossystems.com.br>
	<CABcZANmh+pV4Xxwi2UY7fA+BctpVXRvM6gLcgMJEx-rwODMi4g@mail.gmail.com>
	<CAAPZna2pDLyq6PH6sb8c0J_Bxa2Pi+FNNZw_tVJ38o90mGsEJw@mail.gmail.com>
	<CABcZAN=55DOHHy0fMJi6pPaR+TuwgwfErOd7YBAN=s_e9D0rwA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Thu, 17 Nov 2016 14:21:30 -0200
Message-ID: <CAAPZna2dHKqh-rDSo6UGu0uP=CBLRHaGbhC-c=OisccQ4HUUsQ@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpcap: Fix build when PACKAGECONFIG ipv6 is not enable
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
X-List-Received-Date: Thu, 17 Nov 2016 16:22:00 -0000
Content-Type: multipart/alternative; boundary=f403045ec286d8c6970541819646

--f403045ec286d8c6970541819646
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

No, I created a patch, git format-patch and then edit generated files with
Upstream-Status tag and added to recipe. Is this wrong?

On Thu, Nov 17, 2016 at 2:15 PM, Christopher Larson <clarson@kergoth.com>
wrote:

>
> On Thu, Nov 17, 2016 at 9:11 AM, Fabio Berton <
> fabio.berton@ossystems.com.br> wrote:
>
>> Patches in this commit have Upstream-Status: Submitted tag.
>>
>
> I know, the point was the tag was within the commit message in the patch,
> not just the patch file =E2=80=94 wrong location within the patch file. I=
s the
> Upstream-Status tag in the commits you submitted upstream? Unlikely, it=
=E2=80=99s
> oe-specific metadata.
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>

--f403045ec286d8c6970541819646
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">No, I created a patch, git format-patch and th=
en edit generated files with Upstream-Status tag and added to recipe. Is th=
is wrong?<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On Thu, Nov 17, 2016 at 2:15 PM, Christopher Larson <span dir=3D"lt=
r">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@ker=
goth.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gmai=
l_quote">On Thu, Nov 17, 2016 at 9:11 AM, Fabio Berton <span dir=3D"ltr">&l=
t;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.=
berton@ossystems.com.br</a><wbr>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div class=3D"gmail_default" style=3D"font-family:monospace,monos=
pace;font-size:small">Patches in this commit have Upstream-Status: Submitte=
d tag.<br></div></blockquote></div><br></span>I know, the point was the tag=
 was within the commit message in the patch, not just the patch file =E2=80=
=94 wrong location within the patch file. Is the Upstream-Status tag in the=
 commits you submitted upstream? Unlikely, it=E2=80=99s oe-specific metadat=
a.<span class=3D""><br>-- <br><div class=3D"m_-5864478152592581664gmail_sig=
nature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at=
 kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintain=
er - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</span></div></div>
</blockquote></div><br></div>

--f403045ec286d8c6970541819646--
