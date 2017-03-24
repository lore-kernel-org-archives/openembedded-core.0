Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id D3293719DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 12:05:47 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id p22so236248qka.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ncDCe8SsGaEWe/wqluFmSWPvsjHPG+r5dVulNQy41fc=;
	b=Mmn+yuVcxdvKIS4T8AehiCWFmvCYiLSoI/D+uLSnS4PLFMcBktIbPW3bIhpDTvdyTQ
	bNIYjUF5+3k4OSi/SsQxTdLnKbxk3XVFZhY3Nuj/MadeR85bzfMgzBVV37n3TWai7vhb
	HBrgwBnVdMKOu5yFFD3D/kkfHWg8m7CCm5fmZT/amO/oDrb7R3iI32B23dlMMD+xLVdG
	bFj6mTEFTqT1nVRodJ257RMrz5LcQA/lpWcCJpVwi9v4m/SdSQ74gH+iu9NRQoTGS2QV
	gVRtcoaFSAWlVVwzz5xilk9zyUxp6bSaH/U7FCgWsglqECymjxzxBHzcCheZS0/RJMo1
	zb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ncDCe8SsGaEWe/wqluFmSWPvsjHPG+r5dVulNQy41fc=;
	b=uRtqNLZZPa99r+Oc5EphShSWjdfmMaYBMReMeDSEM6YSPUSgDR4Rh2YrYOhah5oh7c
	fdTkeggOMuoCyICLfI6ChGbXTgQuNDgtd5Rle0WA3bdefvpLof9vtEbmfIEMTmygfEoM
	RVj7r78w3H/F1hMDNHfOwioG70Su0+cIClwQSVz1Czt9gBk6yWMCS+FPPczG289sqgcr
	o5XuGPHEIhjhyJD1t6UFTCBpy/hXA/F0UEWr2m6bpRXec2Kf1SPIOKqOGiWcJjb/g1Ek
	6AKqsjEJ+YdVvFSjXoBZcPmk4ChSK0PuC/kUrvt6a0LVKcmb+zu3fQJHUOI/594J6Q4+
	t4pg==
X-Gm-Message-State: AFeK/H25nV30fS3JTQns8qaxsAxUiC6SWFK+n+qtHY3CEmDDRQbxf/uzozL39Ztbo0fg/dOZEDiolvB+BA4r++AA
X-Received: by 10.55.183.133 with SMTP id h127mr7545581qkf.121.1490357148426; 
	Fri, 24 Mar 2017 05:05:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 24 Mar 2017 05:05:28 -0700 (PDT)
In-Reply-To: <b72d9b60beb83ee4877df608ada45832bc80e3ed.1490345691.git.liezhi.yang@windriver.com>
References: <cover.1490345691.git.liezhi.yang@windriver.com>
	<b72d9b60beb83ee4877df608ada45832bc80e3ed.1490345691.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Mar 2017 12:05:28 +0000
Message-ID: <CAJTo0La40qQRp_a4mfRvHBobtVBhuS1jrAgR0sBArQECO5UZ1g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] apt: fix hardcode of /usr/lib
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
X-List-Received-Date: Fri, 24 Mar 2017 12:05:48 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600566bcd85054b78d03e

--94eb2c0600566bcd85054b78d03e
Content-Type: text/plain; charset=UTF-8

On 24 March 2017 at 08:55, Robert Yang <liezhi.yang@windriver.com> wrote:

> -       install -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/
> +       install -m 0644 ${S}/debian/apt.systemd.daily ${D}${libdir}/apt/
>

$ grep -r apt.systemd.daily
debian/apt-daily.service:ExecStart=/usr/lib/apt/apt.systemd.daily
debian/apt.apt-compat.cron.daily:exec /usr/lib/apt/apt.systemd.daily

If you're going to move apt.systemd.daily, then you need to fix the
references to it aswell.

Ross

--94eb2c0600566bcd85054b78d03e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 March 2017 at 08:55, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><div id=3D"gmail-:1yb" class=3D"g=
mail-a3s gmail-aXjCH gmail-m15aff87c11733292">-=C2=A0 =C2=A0 =C2=A0 =C2=A0i=
nstall -m 0644 ${S}/debian/apt.systemd.daily ${D}/usr/lib/apt/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0644 ${S}/debian/apt.systemd.daily $=
{D}${libdir}/apt/<br></div></blockquote></div><br><div class=3D"gmail_extra=
">$ grep -r apt.systemd.daily</div><div class=3D"gmail_extra">debian/apt-da=
ily.service:ExecStart=3D/usr/lib/apt/apt.systemd.daily</div><div class=3D"g=
mail_extra">debian/apt.apt-compat.cron.daily:exec /usr/lib/apt/apt.systemd.=
daily<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">If you&#39;re going to move apt.systemd.daily, then you need to fix the=
 references to it aswell.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div></div>

--94eb2c0600566bcd85054b78d03e--
