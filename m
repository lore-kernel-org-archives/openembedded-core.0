Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8510960125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 19:56:30 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id e63so231544025ith.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lbYBR9/oMWTMjPprKXYlfaviX+ueZnI76R+st2G97nw=;
	b=juQa+LOdhPgE+dE1pc0JnElSoFiD3Ebc3/YqNrr/UPwoUjJsHPINrBwzCF0fF3umyd
	trENGNcXjA/drzZkVG8j9nvz+KO5a0IKfNQfCYHx1u/s5b1O2ya9HU3KJfEG9fYX4DFb
	VkjFiG2Y807oh56DNjijmaV8Hs2TiJQn6Ub+OIoKN1ziehLYIi01shQUJTDdWf4hf7HO
	/CBCcnmYX0LNn69DeH2R82La/Ru1HyaauyJtWI9MSNDkJ/dmew9ksJL7B80f+sB+9/he
	DG9Sba/IsxMSI7I0K4y9uzJHSCIpdjE5aBvieKhMlBBBuegs+lqLgVbLmc9pa/UB9RpF
	Ch0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lbYBR9/oMWTMjPprKXYlfaviX+ueZnI76R+st2G97nw=;
	b=gM2RlD3nj10ZZ+i6aw9I5/iWOh2Lb7uUYrKlWMd46GN7+1z3fyadHWQ9fy55XkvihG
	a2h8+7LK2JrDv83WhwPCRF9CcUGVDyBJ0ULWgA/PJZx501pN+l1A4fRs7hpM/73Op0bV
	CbiXaTW8l2wsbWAamcwjp/huWZw3l7XfrAx7G1prB7iALer3c+bCKMihv6oSgEdTbmTL
	ft7Hh1KSAmOgUnPhB4w1YSxH+lF2fyg0P7qbxmMiO4jAebtG90rDP2Jdc6VZVPzon2am
	+APIwpfNgSjdB4fsbAsqUNAle9oXfOeGeqfYicHw74yobsxvxthIFkRZ+/SbuOfRa4gz
	3HgQ==
X-Gm-Message-State: AEkoouuR9unhDkTAXcbtzmeRHsLFwqwPqNQO6i7axrsraSIKJ6YnbH2szudk/1IBW7ddSh9QgLGwUWQN0EWiOa5A
X-Received: by 10.107.138.212 with SMTP id c81mr5930385ioj.148.1472068590917; 
	Wed, 24 Aug 2016 12:56:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Wed, 24 Aug 2016 12:56:10 -0700 (PDT)
In-Reply-To: <17d95410-d50f-80f6-665c-35405a72e11a@smile.fr>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<9bf820ce898dc5e0127b0108efb64f7095887732.1471936926.git-series.jeremy.rosen@smile.fr>
	<9301FDF2-F2EB-414C-A671-9B87ED5F0D3C@gmail.com>
	<0c795b84-5305-072b-4540-8a3e3049d5b2@smile.fr>
	<17d95410-d50f-80f6-665c-35405a72e11a@smile.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Aug 2016 20:56:10 +0100
Message-ID: <CAJTo0LZ_44oh+u0Muv=qu7Qj4eUfHBvoS4pVrND8bZqY0EZPhg@mail.gmail.com>
To: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] [autotools] export CCLD_FOR_BUILD
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
X-List-Received-Date: Wed, 24 Aug 2016 19:56:31 -0000
Content-Type: multipart/alternative; boundary=001a113ed932726f15053ad6ad02

--001a113ed932726f15053ad6ad02
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 August 2016 at 12:28, J=C3=A9r=C3=A9my Rosen <jeremy.rosen@smile.fr> =
wrote:

> ok, so CC_FOR_BUILD seems to be a common convention and CCLD_FOR_BUILD
> seems only used by our patch for pcre. Fixing it to use CC_FOR_BUILD for
> linking is trivial
>
> but the patch is marked as submitted upstream, so Fahad... what is the
> status ? how can we do that ?
>
> I can also set CCLD_FOR_BUILD in ther .bb file instead of
> autotools.bbclass, that's trivial... the question is whether we should fi=
x
> the patch or not...
>

CC_FOR_BUILD and CPP_FOR_BUILD are de facto standards by virtue of being
part of autoconf-archive:
https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html

Looking at the patch wouldn't it be possible to avoid the entire .c -> .o
-> binary process and just go from .c -> binary via CC_FOR_BUILD?

Ross

--001a113ed932726f15053ad6ad02
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 August 2016 at 12:28, J=C3=A9r=C3=A9my Rosen <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jeremy.rosen@smile.fr" target=3D"_blank">jeremy.rosen@smile=
.fr</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><div id=3D":124" class=3D"">o=
k, so CC_FOR_BUILD seems to be a common convention and CCLD_FOR_BUILD seems=
 only used by our patch for pcre. Fixing it to use CC_FOR_BUILD for linking=
 is trivial<br>
<br>
but the patch is marked as submitted upstream, so Fahad... what is the stat=
us ? how can we do that ?<br>
<br>
I can also set CCLD_FOR_BUILD in ther .bb file instead of autotools.bbclass=
, that&#39;s trivial... the question is whether we should fix the patch or =
not...<br></div></blockquote><div><br></div><div>CC_FOR_BUILD and CPP_FOR_B=
UILD are de facto standards by virtue of being part of autoconf-archive: <a=
 href=3D"https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build=
.html">https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.h=
tml</a></div><div>=C2=A0<br></div></div>Looking at the patch wouldn&#39;t i=
t be possible to avoid the entire .c -&gt; .o -&gt; binary process and just=
 go from .c -&gt; binary via CC_FOR_BUILD?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed932726f15053ad6ad02--
