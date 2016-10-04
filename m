Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9AB9765CB5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 15:05:37 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id o19so130478566ito.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2016 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BzI1Q9UsLLsISP2H8jJkLX2f8mV0qq+45FxDWNPru2Y=;
	b=y4kToHOym4XArdyg9AHlucK4Fj8EQRlhJ3mhE8VKd93oGSsLezNfShhVdl3CEp92zL
	RXbiROptzLu/My6OpLs/CE2imZcHqAdbtYN18qEG3kRmvRXbPey5y/Q6KykzT6kSbHWL
	EHf2SsXhxeE27IQAve5bqyqe/ALiMkkXeOcNR/upNEGsSPlpWZiPWESypMCdMhgJ9Icq
	NehKPcb7C34X9BOoaB64zsO49hbhaoXXeRuwbgxdmZHruGpwabehHWT5KE1piR3GOePW
	Ct3rnqB+YxQayJiRmRvWr3nfQgzMATJJYVkxjmXNRzEVZpBTwr2jqiao1wXrCNFLr05P
	qMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BzI1Q9UsLLsISP2H8jJkLX2f8mV0qq+45FxDWNPru2Y=;
	b=gFhS9dZjtWkANppGbcjbbpPCvBt6nUkyE2gZLCLMje2p6Whu8guRUGzwUzetjr/Wt5
	ivFpJtg/DKVffXgWLYmnICl15iSNHk89jXu1jW24WhKoM9E2ijSl/OsnUSLxgkXO7OJ6
	ndE5HrshqcsZyX+yt1B1JbFYUOrSpd0I9RXqeyqxONgxqCR+jJQG68BuueZqAlYrqUEc
	D32iYVkbCufswJ3sY0qMvYyXActsNk7ZZLoE32xxg+dp4Y/psyC5+b1hSQ7ZPcLITK2+
	mjRLdE5Mbfnytd6u/yUBzvgMb9sYRhpSl3RPy2bCuzhw/6Iw5tWmZsLnjqh7Hjn13SuR
	tgUA==
X-Gm-Message-State: AA6/9RnR9T5ypexiWul/wlH9EhckuJDkGBXQxh3rcvj1OstsjO+0G+olHERdxEHdAq99Flg9SnANGMvivs6SehUB
X-Received: by 10.36.144.68 with SMTP id x65mr4364949itd.70.1475593538615;
	Tue, 04 Oct 2016 08:05:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Tue, 4 Oct 2016 08:05:18 -0700 (PDT)
In-Reply-To: <CA+chaQc3eYQwQd0rozMhFFRt_PDztdxFWdhkurxMZDs23rEE8A@mail.gmail.com>
References: <20161003171453.9151-1-Martin.Jansa@gmail.com>
	<CAJTo0LbiDauWC1Te7+Oj2kupL+pJDx1XFUFQL2t76Gx+Hh3naA@mail.gmail.com>
	<CA+chaQc3eYQwQd0rozMhFFRt_PDztdxFWdhkurxMZDs23rEE8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Oct 2016 16:05:18 +0100
Message-ID: <CAJTo0LYCXrs1mBC3c8VKgF_3ggWyWaqwo0zXem_jV_xm3hih6w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: add dependency on boost
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
X-List-Received-Date: Tue, 04 Oct 2016 15:05:37 -0000
Content-Type: multipart/alternative; boundary=94eb2c07e806b42272053e0b640e

--94eb2c07e806b42272053e0b640e
Content-Type: text/plain; charset=UTF-8

On 4 October 2016 at 10:46, Martin Jansa <martin.jansa@gmail.com> wrote:

> PACKAGECONFIG would be nice
>
> I don't use systemtap, I've just noticed it failing in one of my world
> builds after recent boost which probably remove native boost from sysroot
> between systemtap's do_configure and do_compile and caused this failure.
>

Patch incoming that incorporates this.

Ross

--94eb2c07e806b42272053e0b640e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 October 2016 at 10:46, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">PACKAG=
ECONFIG would be nice<div><br></div><div>I don&#39;t use systemtap, I&#39;v=
e just noticed it failing in one of my world builds after recent boost whic=
h probably remove native boost from sysroot between systemtap&#39;s do_conf=
igure and do_compile and caused this failure.</div></div><div class=3D"yj6q=
o ajU"><div id=3D":3i5" class=3D"ajR" tabindex=3D"0"></div></div></blockquo=
te></div><br>Patch incoming that incorporates this.</div><div class=3D"gmai=
l_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c07e806b42272053e0b640e--
