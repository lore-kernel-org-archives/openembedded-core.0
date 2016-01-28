Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id D4083771C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 11:03:19 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id mw1so9750606igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 03:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=twSCAwLDH2ZnikQ9YfLCdjvqKAADLavEq2jJ8OTY/+c=;
	b=k0oLT54jutppxr7ql7T+9dV8YN+6iQ1JFTh6Cib+kamnhYCv1vjcfKB2cneu3acqTQ
	4uuCdv4U4QiPEZdDQtfKElkJXl/kzPzb59TDAC77NWXPU69v0Efrwd4vDKMc9oE+mJPg
	R34AaSHHY4xZgbkZEj6G3JPCcBPKDm/Mke6dP98uK44s2usLqiWtzktzCGX212X0sPAq
	Srx/Cg8RRSbBPMW3Iy4Iv/KCvvFiEpDPl4UV0zgXA9m84ueFE1v61RM15LBtWru2eyuu
	R4FF6/nGfyCfSczmFdun3yx91IX4VOL0WlIYPzBf4i6PvyAFCncNUJAiyvGmw70oTIVy
	lXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=twSCAwLDH2ZnikQ9YfLCdjvqKAADLavEq2jJ8OTY/+c=;
	b=jvcWpCOgfmeAt8aGsDiwXgk2G46Q16TR5xDBJhj9sRUDQG+hTCD/JCQVNF2hr3vrYu
	Nog9KmXxZVdzYRfSlBYLh7tFNucgkOoUhTtPK/gCPau7HvzdSO4h3R2bXApBMbg8fhgL
	Ul9pxjpwSEZ37mmVdxxGsKP6FXlIZjYsHA4cp/q2cR5nOvGW7A5hyjlJPt8rsutnYZo3
	ytesP4no24NIN9AJOUMB5PRiWoIVAzQfGNtWxfhUSPL9M1QRqKvOooPXC7Sdj3AeouJd
	ugSRVKEA1R3ohiozN/L++n3p3kiReKy9XH10n0eR2One3IbbTurnmUZRwrikZBh24EgC
	Bi6A==
X-Gm-Message-State: AG10YOSX5GbDQPTmr8z4Yaw/TVgHdVE+d0mlFe7h2WADewFfIUYFus13NB27LE94tqwElovI/DOIqxZdZam/f3m/
X-Received: by 10.50.126.8 with SMTP id mu8mr2519284igb.52.1453979000758; Thu,
	28 Jan 2016 03:03:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 28 Jan 2016 03:03:01 -0800 (PST)
In-Reply-To: <72cdd5db4b60c2b93b71ab366c1c7eb85ca7e88b.1453974352.git.liezhi.yang@windriver.com>
References: <cover.1453974352.git.liezhi.yang@windriver.com>
	<72cdd5db4b60c2b93b71ab366c1c7eb85ca7e88b.1453974352.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jan 2016 11:03:01 +0000
Message-ID: <CAJTo0LZnCQPt9=nxPg0MbokMdsRPdbQFsB8TSb09dXXj01Mjag@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] perf.bb: add python scripts corresponding packages
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
X-List-Received-Date: Thu, 28 Jan 2016 11:03:23 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bfd9fec4052a62dd17

--047d7b1635bfd9fec4052a62dd17
Content-Type: text/plain; charset=UTF-8

On 28 January 2016 at 09:46, Robert Yang <liezhi.yang@windriver.com> wrote:

> +FILES_${PN}-python = "${libdir}/python*/site-packages
> ${libdir}/perf/perf-core/scripts/python \
> +                      ${libexecdir}/perf-core/scripts/python \
>

Nothing in perf appears to be in $libdir/perf explicitly, it's all in
$libexecdir.

(as verified by building perf with the libexecdir change, and nothing is in
/usr/lib/perf)

Ross

--047d7b1635bfd9fec4052a62dd17
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 January 2016 at 09:46, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":v5" c=
lass=3D"a3s" style=3D"overflow:hidden">+FILES_${PN}-python =3D &quot;${libd=
ir}/python*/site-packages ${libdir}/perf/perf-core/scripts/python \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ${libexecdir}/perf-core/scripts/python \</div></blockquote></div><br>No=
thing in perf appears to be in $libdir/perf explicitly, it&#39;s all in $li=
bexecdir.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">(as verified by building perf with the libexecdir change, and nothing i=
s in /usr/lib/perf)</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--047d7b1635bfd9fec4052a62dd17--
