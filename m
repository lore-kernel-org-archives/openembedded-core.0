Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 90C7E60621
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 16:28:56 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id z76so32233049iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mlM4M3xdEjfZQ3n+PxbO4HLo4LgtJTn/VEpduIh+j3o=;
	b=K0y9GWHFozhxBbh56+eT8AV1tQUtD8qfFz6HRsqzfQlu6pvRMUDxoYwphvyUD7D3NY
	OrRG0GRe5xYEzyPJo37ECZ5VdAB1CzJAI/WZcYoXGVT6/5URJcP2GnFEGRk2cvCZ9tcM
	WNuLs0SmYjLBK2rbXtcxDIMbFoU59kiTZdC2eAvOBNLdLAiTWCMeVnXEX6z9rKCzIYky
	lNP3qz0Twy8/ryqi5C8U1rL/Wdi0Sm7YCsndwPnTpPEBxNV+l8PrhW73M8b7HmvUnsyf
	1XM6DK2QbiwOqO4hlGm56TkoZ6CQzAcv70sB/Foau6ys2b70eQmbLMJQLBM/03Jx4yct
	uGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mlM4M3xdEjfZQ3n+PxbO4HLo4LgtJTn/VEpduIh+j3o=;
	b=eQMda+2IWceDvGtvCxqYHs3dB+8+1GTIzEglKAmAEcRJolU8rZaV1XqmiVxxarDkiq
	LJhzM17vEXuVWJp+ESuYf9v3TQ2vUMr04nsxvX1iBXrPb9r543rsL3jpp5KPvcCiHn73
	RbtYjorBFN0j8VICrvYfDTkC4aXOuqWOfnJ/lpJpZnOT0kFaMg/HXHOfVQJZItiYCICr
	HXVjah3tE854zDY37/NR4iGHM591lNH8dQ+vSZ53enVdqeimM0wEkF8vXkFIiYP5XFjt
	Sumik6WAlk4qX1mL7RzJVJmftDGaslZhx5JxwSGAEVbMGBYKKAUy+BLAEPmx8UcYC4C6
	EKBg==
X-Gm-Message-State: AD7BkJLUW1ihargM11KCPJ5IPp60FqTlRdPQy0ug09/T+uls3rw/A/0iRfa+2aCJ5pEc5bLioQeBrUIDt2q30xXx
X-Received: by 10.107.6.32 with SMTP id 32mr12414292iog.99.1457454537062; Tue,
	08 Mar 2016 08:28:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 08:28:37 -0800 (PST)
In-Reply-To: <56DEFABE.1010501@windriver.com>
References: <cover.1457373422.git.mark.hatle@windriver.com>
	<CAJTo0LasT7As+5SRFduxEtv7vKMkBTWnCGGSWzvxY0=+jS5Asw@mail.gmail.com>
	<CAJTo0LZ8gm7Vvo-GB-JG+1yJxnq-MPr__N7XGGqwJN-yXL25Yw@mail.gmail.com>
	<56DEFABE.1010501@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 16:28:37 +0000
Message-ID: <CAJTo0LbVY8fzR3=wng77_79nfNEWu-f-=_K5=5FyjFyD4XSRtw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7 v4] Upgrade RPM to 5.4.16 (CVE HEAD)
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
X-List-Received-Date: Tue, 08 Mar 2016 16:28:57 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5cf572b1052d8c13b3

--001a113fbf5cf572b1052d8c13b3
Content-Type: text/plain; charset=UTF-8

On 8 March 2016 at 16:15, Mark Hatle <mark.hatle@windriver.com> wrote:

> Does 'musl' work in poky yet, or do you still need an external layer?
>
> I've not configured musl before, so I'm not sure what steps are necessary.
>

Oh didn't notice that was musl.  Most of oe-core builds standalone with
musl now, but rpm is a known exception.  Ignore this one, it's nothing to
do with the upgrade.

Ross

--001a113fbf5cf572b1052d8c13b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2016 at 16:15, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":63t" class=
=3D"a3s" style=3D"overflow:hidden">Does &#39;musl&#39; work in poky yet, or=
 do you still need an external layer?<br>
<br>
I&#39;ve not configured musl before, so I&#39;m not sure what steps are nec=
essary.</div></blockquote></div><br>Oh didn&#39;t notice that was musl.=C2=
=A0 Most of oe-core builds standalone with musl now, but rpm is a known exc=
eption.=C2=A0 Ignore this one, it&#39;s nothing to do with the upgrade.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a113fbf5cf572b1052d8c13b3--
