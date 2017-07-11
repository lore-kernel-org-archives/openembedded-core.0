Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 15A89601F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 16:53:41 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p21so8618578qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rdj7yWwgYAoC0tVzhcfpvWHmGK5Kf69sQ/QSahUHhIs=;
	b=Nhd5KgWICY6Wcfiug2j4KonaGC0KpPTV44Ae4VZkjeiK4HbGcdfn4QAKjVMDdsPd24
	/7hoX/+V8c9smL/Cv5rzZT05OnkgoAZ3c9U4fvlpj7J85Plkvg5Qesf7uPLTXV8khE5/
	f4ZBGO6yj9JX5gpGkPjlBDuwF0DXeDabAOYlSFdnFlljuDCt52I1qVhBpLQhouEtdkgL
	kvJI//oXsSlMbrGgOqxAfOoqETmIRlMUMMd/EZpRA/6Q9pNR/AQv5T4SPFRfFa/5kRo7
	ipoFT4w3cdebGw0/Fk2DARC8mzPpiB1fxfHGK2yiyDQvG7hXAGUBECopAPoNNk+WHnTv
	Ylug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rdj7yWwgYAoC0tVzhcfpvWHmGK5Kf69sQ/QSahUHhIs=;
	b=rTjQMn0b/s+Qd7a34vd1ErBIzLCpcofTHLwpg3ydQ5LS/FcOTvyrD7R1ieZcFSMPrH
	IlO77r/x4QP/3Id5IQnSP9wE8B8qpaRMyaFpkBKb1GfoVyKeavWod5kSkzdbqFS/xCBs
	9hBXUZG+bzOxCAEPYF2Yh1GBfYoSn94zpRYgp9S3EaQ4+ytfq7DizpGsdPSfBrkJm5qE
	FjA106b9Il69xGuDllUnxT9VfsjZSmRWOH5mQsnw86MlJVK6IgJDUAV2PUJjsUSZ3vZT
	RyQLfqSuUjrSzAhMzzsHErPcneR5jC34KTTGTuPHBBOv/BoSVxToGbT5+LK90zD5VxbM
	qrBQ==
X-Gm-Message-State: AIVw110J4xD3jDqdaeAjRG4geiEUnJh69p7rp6nxtIpgm2hxWTwXTqwt
	xUKjP5hKFQl1zTRY0WkVXdwkQzHA/n/e
X-Received: by 10.200.44.186 with SMTP id 55mr1094377qtw.173.1499792022675;
	Tue, 11 Jul 2017 09:53:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 09:53:22 -0700 (PDT)
In-Reply-To: <CAMKF1sozPp_jSyoXJgAnO88R1TeX1oGdVmeEnka56DVSJWbwvg@mail.gmail.com>
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
	<CAMKF1sozPp_jSyoXJgAnO88R1TeX1oGdVmeEnka56DVSJWbwvg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 17:53:22 +0100
Message-ID: <CAJTo0LYPhXmzHZxxFgMdKdj75woAGcZzLB2txwh0DjH2t-Awiw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "Lock, Joshua G" <joshua.g.lock@intel.com>, "Phoong,
	Stanley Cheong Kwan" <stanley.cheong.kwan.phoong@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] pkgconf: consider pkgconf as a replacement for pkg-config
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
X-List-Received-Date: Tue, 11 Jul 2017 16:53:42 -0000
Content-Type: multipart/alternative; boundary="001a1135977cbfbb2d05540d8a32"

--001a1135977cbfbb2d05540d8a32
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 17:17, Khem Raj <raj.khem@gmail.com> wrote:

> Is this going to be the case permanently?
> I would suggest to make pkgconf default and dump pkgconfig recipes at same
> time
> Or do we plan to wait for one release
>

For testing this is good, if it merges I think we should dump pkgconfig and
have appropriate provides.

Ross

--001a1135977cbfbb2d05540d8a32
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2017 at 17:17, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div dir=3D"auto">Is this going to be=
 the case permanently?</div><div dir=3D"auto">I would suggest to make pkgco=
nf default and dump pkgconfig recipes at same time</div><div dir=3D"auto">O=
r do we plan to wait for one release=C2=A0</div></blockquote></div><br>For =
testing this is good, if it merges I think we should dump pkgconfig and hav=
e appropriate provides.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Ross</div></div>

--001a1135977cbfbb2d05540d8a32--
