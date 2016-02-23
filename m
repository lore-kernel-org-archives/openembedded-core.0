Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 204856FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 18:23:33 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id l127so221631036iof.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mhs2dIUA56UbjtQXqUDDRT+39IHII9Ggouq0/vksaM4=;
	b=Rp+ITdmJGVBwMrlKew4TFwDTA0wTeIj1nVFE2BtdpRLMgim6qOw9G7ZWrPz/B/gJSN
	SS5GhfBTHg97zGRt3+rlO27Mzh6yq/s5gnjb9uxbgK58EV++oVCbE5drbANea6TpQmPI
	PARiA1DB8NhMdpv81xvyU20azITe0Y7B6bY0CH1AtYn4ojUujz3TNc/Siztjs/l+ZvWe
	chmAoDSsCVP3+pD7FARr6i4aaYr3tU+6NxXyMhI7zalSwCYSSJxyp+vSB0fPkRKbQI/B
	OdbTAYOPfOwXobCuUEdsg2z/hKHAU7J2qJkMaga62zed3FeQXQgUguPbuO+oTP8k4uRR
	0Edw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mhs2dIUA56UbjtQXqUDDRT+39IHII9Ggouq0/vksaM4=;
	b=Qnsr7ifW4kCTVSD/oznDaf2zBu6sTomyqRWTzNfEhTBgW6i9PQD3D1fFg3dYrIGABM
	8k9elCmlFqoU3p179pwN0kf9Qob3sfcvnJMVIOitOVDHvmWijR6Cj4/eLJmGM7565T3d
	yOb+H86QmVowFJW2Jae0E254nGTdNfuBES2LVzbuW5uXF/QfKrc6xTJs1Xo+ph32aQ1l
	a/FNRZSi//6tnTVJ28GHouH1wtjbuXVqXctR63xOzpiv48E+DThL6r9Usak+0DTVVlZz
	tOGqLLQI+7fykOwgx/KTS9C0ApbAwOLjOacfZnASn/FLhNuUEk/5Y8DPxxklfz0IBV9A
	K2mg==
X-Gm-Message-State: AG10YOR1OXNToWCCz3noTRaAqyOvc1MngQtuuBh8UNaR8IAGbaKte5/fcyjzaufYfhDEQ2HPRp+C+dhVix1wO0uk
X-Received: by 10.107.3.220 with SMTP id e89mr33070716ioi.99.1456251814316;
	Tue, 23 Feb 2016 10:23:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 10:23:14 -0800 (PST)
In-Reply-To: <CABcZANmW9zV90WeJdGhW85FP4C_hSjTJ89V+6cFP66cRnrGJ+g@mail.gmail.com>
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0LZdtxNJa3FPAthW02iS2n+-xvntVrGU1MwA5vWvh1FnXg@mail.gmail.com>
	<CABcZANmW9zV90WeJdGhW85FP4C_hSjTJ89V+6cFP66cRnrGJ+g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 18:23:14 +0000
Message-ID: <CAJTo0LbfEM77HQnq023yLnLA240F8yRywL8b2Wb-dfhnggQ2-w@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 23 Feb 2016 18:23:36 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c18a261052c740caa

--001a113f0e7c18a261052c740caa
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 18:01, Christopher Larson <clarson@kergoth.com>
wrote:

> db isn't the only recipe doing that. The fetcher unpack method knows where
> it's unpacking to, I think if anyone should be clearing out the destination
> first, it should.


If that's true for tarballs, I agree.  I was also wondering if this should
just be unpack[cleandirs] = ${S}

Ross

--001a113f0e7c18a261052c740caa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 February 2016 at 18:01, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">db isn&#39;t the only=
 recipe doing that. The fetcher unpack method knows where it&#39;s unpackin=
g to, I think if anyone should be clearing out the destination first, it sh=
ould.=C2=A0</blockquote></div><div class=3D"gmail_extra"><br></div>If that&=
#39;s true for tarballs, I agree.=C2=A0 I was also wondering if this should=
 just be unpack[cleandirs] =3D ${S}</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7c18a261052c740caa--
