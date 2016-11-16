Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF6670022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 10:06:00 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n21so168558109qka.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 02:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CbjeyBUp1X+lVAt1clyWfa1mJusUnKMyJ6IQTv8yEJA=;
	b=hUnKVHoRONWhJZh2oEl9Uqus64CgFFXoE4e1NzZ5/7t5TtHgpk20YmRuib1j7I42/w
	1mxIf0TWmopALmk4lv75YYNZq2RqgzM3nRKKsKLhY6Af15fG8gmcYLxyVzxC+6xsseby
	2b+OitrQ5rhG1kOkeN4Ua138aQB6IzTomTF4MkE8I8mUdXxGevRTtiJc0pzPPUm0YO3U
	exshenEIuHdv+yuQrBNvK+jkDj7b4T4FE2SHuOtK8vRxvKLX6VlIcYa36ZILSfxOBnWV
	Z8ca6zCnA1Rvt2J7kN9PqGh0xbTAx62Fc/XzM3DPK4RzTcAEk+whWZZNEyTbVFBiRrvD
	uG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CbjeyBUp1X+lVAt1clyWfa1mJusUnKMyJ6IQTv8yEJA=;
	b=QdwdcqLruZLG/czgfwc+Fmg3hpPUW55slQeZVWV+OZUoDd2HrUQMUs/pnIzoShjAbP
	l5e7rte4RvSEF9MOIqB1Sro7CwL7eQtVZKclrcwUlGb0jGMg9iK92EzESzeZLfV07GoB
	rQCTzNx44SRrML0+9lnpMubtSscctBmaV9IhAK+5GhaNPDnjatOPKxzqlOtCcRCHYQcf
	80S1182uIvCyZ5vAF9vGX1yhqXT8y4hjzTJg8RnKDa35/ehGoqHg0UQn4uF2LqeFLTuw
	pd2oSDolRD1Y6iRRNIF/wNSiq1fFe7RcQKvlaT3aL5qAwagPEorWdQgkVTxpIlG/C7Uu
	2KGw==
X-Gm-Message-State: AKaTC03XEQZirEBm+eU2QiL4xUX9163FcgWJ+ha2ZgPS8xzlqfY4fCMzK0uClTXGO8jBUJpuVsmUJeOnFlZ9Lu2I
X-Received: by 10.55.31.157 with SMTP id n29mr2086962qkh.221.1479290761542;
	Wed, 16 Nov 2016 02:06:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 16 Nov 2016 02:05:41 -0800 (PST)
In-Reply-To: <20161115220735.23514-1-edwin.plauchu.camacho@linux.intel.com>
References: <20161115220735.23514-1-edwin.plauchu.camacho@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Nov 2016 10:05:41 +0000
Message-ID: <CAJTo0LYRNEL7m4VdBojNYTZnKMgjjcp_488UX6OMqH9gN6+R3Q@mail.gmail.com>
To: Edwin Plauchu <edwin.plauchu.camacho@linux.intel.com>
Cc: Edwin Plauchu <edwin.plauchu.camacho@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3-setuptools: upgrade to 28.8.0
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
X-List-Received-Date: Wed, 16 Nov 2016 10:06:04 -0000
Content-Type: multipart/alternative; boundary=001a1147f2285c93be0541683832

--001a1147f2285c93be0541683832
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 22:07, Edwin Plauchu <
edwin.plauchu.camacho@linux.intel.com> wrote:

>  meta/recipes-devtools/python/python-setuptools.inc                  | 6
> +++---
>  .../{python3-setuptools_22.0.5.bb => python3-setuptools_28.8.0.bb}  | 0
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-devtools/python/{python3-setuptools_22.0.5.bb =>
> python3-setuptools_28.8.0.bb} (100%)
>

(same problem as python3-git)

Ross

--001a1147f2285c93be0541683832
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 22:07, Edwin Plauchu <span dir=3D"ltr">&lt;<a href=
=3D"mailto:edwin.plauchu.camacho@linux.intel.com" target=3D"_blank">edwin.p=
lauchu.camacho@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D":2h8" class=3D"a3s aXjCH m1586a112b33fb79b">=C2=A0=
meta/recipes-devtools/<span class=3D"il">python</span>/<wbr><span class=3D"=
il">python</span>-setuptools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 6 +++---<br>
=C2=A0.../{<a href=3D"http://python3-setuptools_22.0.5.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-setuptools_22.0.<wbr>5.bb</a> =3D&gt; <a href=
=3D"http://python3-setuptools_28.8.0.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-setuptools_28.8.0.bb</a>}=C2=A0 | 0<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta/recipes-devtools/<span class=3D"il">python</span>/{<a hre=
f=3D"http://python3-setuptools_22.0.5.bb" rel=3D"noreferrer" target=3D"_bla=
nk"><wbr>python3-setuptools_22.0.5.bb</a> =3D&gt; <a href=3D"http://python3=
-setuptools_28.8.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-setupto=
ols_28.8.0.bb</a>} (100%)</div></blockquote></div><br>(same problem as pyth=
on3-git)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a1147f2285c93be0541683832--
