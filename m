Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2D9C6779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 13:38:16 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 85so40288ith.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 06:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rViHi7hIrEVvhxyjoLYIkIu4akIZ7l6OSBPz0cvjNsg=;
	b=Qu+7YSwKJYR8EkySJx9pfKiDlzQfqrlDjBAXzThjldAORX+dBKBTmCFTzFEL3opj5f
	yWybl8bhBbuLb+tB9hqjmVcM7R1jHLFv18nFLOaPP/+tFu2ib4TrJJEXfNpFOZ0AdfBm
	HsrE6yCKHG2+8/sArEeHpWY1Sx+Ah1+/8qJKuUdyHGGStWkR2P4HGEgc0WtbseAHfXDM
	ZUI/RzKkXH4KsFVZavOixpYFM5pr0Mjd4OYP2gvyk79J+jhGFsVsSHJPFy9nGusvLR/h
	1Qo/BKeQm/hepOlLDerBu+4oB2Pbm9Jb2M+5G+4ots2bzA2841gx3tqz65qmK9S/+CIT
	FlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rViHi7hIrEVvhxyjoLYIkIu4akIZ7l6OSBPz0cvjNsg=;
	b=e8GN/zMVJ3tRBpATK1j3yAwZ7skXdOnLJXdA52e9Odk0QTkVQxevjlbQi2+LykKDPL
	2zwngP1qo0QiTaakfIJmDsQkMbh7vxunEQI75oO8IXLDk64pG0p9285FcQZTmO9AJT9I
	6ISzAjPgeYY5V+gWPgCe62Gu7oUEoxEHblmTr3F3G+bRlXDekabhxFIVL5PPlFoawG+V
	PWistHStxZdUfRT8hjWdIbMazGgGOYzTGIUXhf8uJgV10laXQfzOZnPgBCdEpEA3x+aZ
	QVmyV1QcB36l0klCj9MLBpCid+65Q9fsiTNV/MIqI/L3b+M0IkGVjceOEWbzXkJXkpR/
	vaEg==
X-Gm-Message-State: AHPjjUg5zNAJSPFyz0elnH5+Wt+sRIoGcMWjERsOap8Wll3WqqostZdg
	l02PtCI+8DK+Xf1wHLqyDU0m0m9wUo6fkqMeaMuwIg==
X-Google-Smtp-Source: AOwi7QBxfJuZOPi+kO17dxL3H6NhFT5ZEo7gcm3Tuc/EKK//MXuj5EX9DjEXB1c+CF/Q3elWZUlGZDOF/IF4O0BC3iU=
X-Received: by 10.36.178.1 with SMTP id u1mr7485306ite.120.1506692297962; Fri,
	29 Sep 2017 06:38:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Fri, 29 Sep 2017 06:37:57 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA014B8C9612@ALA-MBC.corp.ad.wrs.com>
References: <20170831055458.9197-1-jackie.huang@windriver.com>
	<CAJTo0LaXfJCZ5hw+sLcm4yWe_K9ck_H+7kTgva1+i9NSLdB6RA@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AA014B8C9612@ALA-MBC.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Sep 2017 14:37:57 +0100
Message-ID: <CAJTo0LYD5hLHJ=PWySes9nWzCK79asRummuCnn8qKeM0MSwwOw@mail.gmail.com>
To: "Huang, Jackie (Wind River)" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs-postcommands.bbclass: add support for /etc/ld.so.conf.d/*.conf
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
X-List-Received-Date: Fri, 29 Sep 2017 13:38:18 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0e34efc4055a542372"

--f403045d9c0e34efc4055a542372
Content-Type: text/plain; charset="UTF-8"

On 29 September 2017 at 03:58, Huang, Jackie (Wind River) <
jackie.huang@windriver.com> wrote:

>      - This will cause the existing contents of ld.so.conf to be
> obliterated
>
>        if the file wasn't empty to begin with.  (I know that it is empty in
>
>        oe-core, but a distro layer might be overlaying this file with its
>
>        own.)
>

>
>      - Also, it seems as though the choice of whether to use an
> "ld.so.conf.d"
>
>        arrangement or not is one that the distro should be making. Is there
>
>        a strong reason why this needs to be done in oe-core?
>

This is easily handled in many ways.  Check the include doesn't already
exist and concatenate the file instead of overwriting it, for example.  Or
add the include to the default oe-core ld.so.conf, and distros that want to
change ld.so.conf can by changing that file.

Ross

--f403045d9c0e34efc4055a542372
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 29 September 2017 at 03:58, Huang, Jackie (Wind River) =
<span dir=3D"ltr">&lt;<a href=3D"mailto:jackie.huang@windriver.com" target=
=3D"_blank">jackie.huang@windriver.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-1921326690285416234WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125);font-family:Cali=
bri,sans-serif;font-size:11pt">=C2=A0 =C2=A0 =C2=A0- This will cause the ex=
isting contents of ld.so.conf to be obliterated</span><br></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 if the file wasn&#39;t empty to begin with.=C2=A0 (I know that=
 it is empty in<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 oe-core, but a distro layer might be overlaying this file with=
 its<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 own.)</span></p></div></div></blockquote><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div lang=3D"EN-US" link=3D"blue" vlink=3D"purple"><div class=3D"=
m_-1921326690285416234WordSection1"><p class=3D"MsoNormal"><span style=3D"c=
olor:rgb(31,73,125);font-family:Calibri,sans-serif;font-size:11pt">=C2=A0</=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0 =
- Also, it seems as though the choice of whether to use an &quot;ld.so.conf=
.d&quot;<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 arrangement or not is one that the distro should be making. Is=
 there<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 a strong reason why this needs to be done in oe-core?</span></=
p></div></div></blockquote><div><br></div><div>This is easily handled in ma=
ny ways.=C2=A0 Check the include doesn&#39;t already exist and concatenate =
the file instead of overwriting it, for example.=C2=A0 Or add the include t=
o the default oe-core ld.so.conf, and distros that want to change ld.so.con=
f can by changing that file.</div><div><br></div><div>Ross</div></div></div=
></div>

--f403045d9c0e34efc4055a542372--
