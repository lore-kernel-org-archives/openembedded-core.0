Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id AC37078784
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 11:31:35 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id u62so4921683ita.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 03:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MLA8lo1dbd7WlkIp/bmAOH2tn9xG6xr/Vr3N51CaidE=;
	b=1u3eRGZBb8IprNICsKQ1rwR+aVqTnNdGGU0dIznT/1DoiaTkb+emg9qpxVF26EPqkN
	ri+R2wGbpIKhTOTc0haxtDfUbpyak4PkozZ6Onh4IuYTVscBNuz4qqdVwnJddrLsqQVr
	2PRH1Oe3RZ/v4TzC+pjpQTsEFo0eA/LXJyzd93KEHZDf5YgEn8vAbK+MUe7A5kE4vHXZ
	n/yaAWoGSWaCFb6jzwFr6soA34TyLFaFeQrf7Cf3iNPB9HOM0U0vKpzT+qMXpxZIZzco
	+bq6Ocf9b/fXISk6dcMeXVQT+u9LFbEBeDSSnUn8cHCd0x1DTSw8V1dhk0MTozs4gAyn
	o/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MLA8lo1dbd7WlkIp/bmAOH2tn9xG6xr/Vr3N51CaidE=;
	b=q35ScJRtFwR90PCk7oswb02VQ8YxAWVSPv1qfphOfupfDjhtfwa8BsSTPQ0jilcyfA
	XJ3pEvyEz9qzTaWnO+2BtMMsu+WOQbW1g6wfKjDFstvNN23MIf4Xx+qhHQnLLd7J7+bN
	ipLZktCqzDUKbfaHVtO5OQiW4Uxu/bD2uTsaNoF6TqpP8jI3Gxr80e4i5ZbqpRVf1N1m
	G2M1A27g21jEqDpbEXe2shGcz+4pjOVZLDJ9n6KsZrAjDcKsGZLbO/IHtZ4ljIRog+Vt
	5AN6fVvbCqOPir4eDa8208Uqoi1Szg/Af85BoN6JOTVvLmpE9NokSilCpjQsaeKKrUAo
	JHFw==
X-Gm-Message-State: AKwxytdP1ZZI18liIXANwfpxLOj/tFfHRLPvAagzxxxesCFQelxF3T9Z
	tS9iMoVp19yuyruJxprR3YmsThxkfGIQspMCawE8xw==
X-Google-Smtp-Source: AH8x226zEhDpdfE2nTHnsY6EmUxA7yC20hrTSMuef4kV5L+pMaL7q363TWK7WYjS1IS1JdlqX0NKM0jZoplBVxGqVog=
X-Received: by 10.36.215.69 with SMTP id y66mr35603580itg.10.1517398296793;
	Wed, 31 Jan 2018 03:31:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 31 Jan 2018 03:31:16 -0800 (PST)
In-Reply-To: <2b9b27d3de67b591a12a7e52728420e749972c62.1517391537.git.kai.kang@windriver.com>
References: <cover.1517391537.git.kai.kang@windriver.com>
	<2b9b27d3de67b591a12a7e52728420e749972c62.1517391537.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 31 Jan 2018 11:31:16 +0000
Message-ID: <CAJTo0LZeSbYU4KqF2ryZhmNHmpZ6xPTFS0B+RgunJjSygaT7Hg@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] i2c-tools: fix libdir for multilib
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
X-List-Received-Date: Wed, 31 Jan 2018 11:31:35 -0000
Content-Type: multipart/alternative; boundary="94eb2c0afc4476b121056410d296"

--94eb2c0afc4476b121056410d296
Content-Type: text/plain; charset="UTF-8"

On 31 January 2018 at 09:44, <kai.kang@windriver.com> wrote:

>  inherit autotools-brokensep
>
> +EXTRA_OEMAKE = "libdir=${libdir}"
> +
>  do_compile_prepend() {
>      sed -i 's#/usr/local#/usr#' ${S}/Makefile
>      echo "include eeprog/Module.mk" >> ${S}/Makefile
>

The context of autotools-brokensep and seding of the Makefile made me
suspicious, so I'm rejecting this patch because I've just rewritten the
entire recipe...  :)

Ross

--94eb2c0afc4476b121056410d296
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 31 January 2018 at 09:44,  <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.co=
m</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">=C2=A0inherit autotools-brokensep<br>
<br>
+EXTRA_OEMAKE =3D &quot;libdir=3D${libdir}&quot;<br>
+<br>
=C2=A0do_compile_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0sed -i &#39;s#/usr/local#/usr#&#39; ${S}/Makefile<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;include eeprog/Module.mk&quot; &gt;&gt; ${S}=
/Makefile<br></blockquote><div><br></div><div>The context of autotools-brok=
ensep and seding of the Makefile made me suspicious, so I&#39;m rejecting t=
his patch because I&#39;ve just rewritten the entire recipe... =C2=A0:)</di=
v><div><br></div><div>Ross=C2=A0</div></div></div></div>

--94eb2c0afc4476b121056410d296--
