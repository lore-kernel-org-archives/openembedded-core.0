Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3773577060
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 11:31:26 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id z14so78652154igp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 03:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=swcKWGBU4e1Nb3AJDyzyb8OU8YdvjdJ02CxQGERCPrs=;
	b=nvbsyiUOhbyLxHL8xLVFhrxx3rUyrYC4PsZHR5iSQ84JkmYVL3Tit+HxB6sMlfHWh2
	YSZOIcQXuD+u85JEycFBBodpH/RdrbTHL2HVouxd1suG56hCErw1M/cvG68fKDajGWgv
	Z5WLgktYKZkitXTQlNQ1H3R8WJi1bD77ki0XIsTSFdi0cBsVbrvwvXFt35t1XVJEeeGW
	GAPrvP5NyucxN6LcjHNVau194hAhx2UCqkmGiQt7x4SRfxGKdkOvfV4pDrhlRI/9z8Pv
	RRJUJGaCnDuCDGVPsxRjvPgV0z32M5I1ykkFTQkxQw4GnjF9jYCgRxBYytK/CD+tg1IU
	l36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=swcKWGBU4e1Nb3AJDyzyb8OU8YdvjdJ02CxQGERCPrs=;
	b=OGpURWcp2GF3QlfJZjbCBL7RaUw7qLHbj68bxxEcyXJuMJBsjjSfJ/sMVokzkRsHCG
	ryK4+Mt1YHmoq1u7re3NCsCx9zJ22lIusVYsa8hMrQqCa97TCmNcVKuI+PcKFxHF5+r/
	3jwt0VL3t2p1ubpEJCGLcAjXp2PzRZPZyzSXxydff5MCbuLauEyNktJaPjANtI/NfkML
	Oe4Ard4qmValC/e5vymGAd3LoqN29Kp+fQAtkPXR02qPk6aXUtniVYtxvQFgMAIM/AWO
	PGNpNAxeVhvFmJ617/2NuwC4DddJ3/Jdd4032jsDitqKCSGaEhe6SvgDfkrjRTjU0qHa
	GZfg==
X-Gm-Message-State: AG10YOSsL+QGI0W84XttKN+4CCE+tGfVuowukVuwW0fTMZ13BHuJ0o2Cug5Ss31q0H/xuNmXrghvhucmyz19/TlF
X-Received: by 10.50.23.108 with SMTP id l12mr26460273igf.78.1453894287371;
	Wed, 27 Jan 2016 03:31:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 27 Jan 2016 03:31:08 -0800 (PST)
In-Reply-To: <CAMKF1sofnyADcNkAc+YrXjPED=ALxf60oPEsuQiJTAY87oB31Q@mail.gmail.com>
References: <1037243108.4336.1453770172960.JavaMail.zimbra@efficios.com>
	<51287CFC-6F3C-43B1-9190-84F3B20C192E@gmail.com>
	<433937130.5072.1453838389504.JavaMail.zimbra@efficios.com>
	<CAMKF1sofnyADcNkAc+YrXjPED=ALxf60oPEsuQiJTAY87oB31Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jan 2016 11:31:08 +0000
Message-ID: <CAJTo0LZazTzkp94ASdACaBOuC4JpNWCpnf46kAucjY5B+wX2vQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: lttng-dev <lttng-dev@lists.lttng.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bogus openembedded gcc patch
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
X-List-Received-Date: Wed, 27 Jan 2016 11:31:29 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe88a4904052a4f24bc

--089e0149cbe88a4904052a4f24bc
Content-Type: text/plain; charset=UTF-8

On 26 January 2016 at 23:14, Khem Raj <raj.khem@gmail.com> wrote:

> > Yes, we have narrowed down our problem to this specific patch by
> > removing the patch from the OE gcc patches, rebuilding gcc, and
> > then building our test program with that gcc. The problem goes
> > away when we do so, which points directly to that patch as a
> > culprit.
> >
> > Test program is attached.
>
> Ok I think we can remove this from master and jethro release
>

Mathieu, as you found this do you want the glory by submitting a the
removal patch?

Cheerss,
Ross

--089e0149cbe88a4904052a4f24bc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 26 January 2016 at 23:14, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":aj" class=3D"a3s" styl=
e=3D"overflow:hidden">&gt; Yes, we have narrowed down our problem to this s=
pecific patch by<br>
&gt; removing the patch from the OE gcc patches, rebuilding gcc, and<br>
&gt; then building our test program with that gcc. The problem goes<br>
&gt; away when we do so, which points directly to that patch as a<br>
&gt; culprit.<br>
&gt;<br>
&gt; Test program is attached.<p></p>
<p dir=3D"ltr">Ok I think we can remove this from master and jethro release=
<br></p></div></blockquote></div><br>Mathieu, as you found this do you want=
 the glory by submitting a the removal patch?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Cheerss,</div><div class=3D"gmail_e=
xtra">Ross</div></div>

--089e0149cbe88a4904052a4f24bc--
