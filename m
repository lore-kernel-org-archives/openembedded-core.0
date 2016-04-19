Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8909C60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:41:58 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id g185so24703557ioa.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s/zvuVuK1uOgjkEtwQZXrFJKVHrEfE9RVBm0RKD2wLY=;
	b=RM50zw+RTXA+0SJJXvRapInvH/vZrhRHeT0eiaZs4sGMvIU/UwqghH/Zz0PnpPMK5t
	vcOwDjFJI+/JYrAHZnoqwTgjnPvZPG53aTuATrz7omJsp/9GkDQ0cwW1vpNKUYSL5XVO
	jtYI6/9IiZOi7rE0Ffswf0qCYJZAFqcSk65rpShFsSWOSVBejSYzU6aYkIeGstxpikke
	AZiA1TW3GSVVirQhnrnljlpOHbE7/wyLsOsPGvpTdTkY4wyhmZu2PHao5AK1FJcIBWpl
	VKePN/0WT8FkxS8/PWm5F24v5xho90BE5WsmBTqB5SpuSb5fouMruoCDz/478Y3w3aZX
	z/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s/zvuVuK1uOgjkEtwQZXrFJKVHrEfE9RVBm0RKD2wLY=;
	b=E8CrBXC+5xLGds9yAygX9KwiE40CC0LVOxDQwPQF8/nNjaBBRjJly1Kn7iXs9GeupU
	Je0ApnNDdgL6L1179fB6D8HXd6QSxHYNEDdNWv5C9ARtpfuILcEX47IPW+/bPAAOzCrQ
	0hKs4/ax+rjjVZpLB9OkSA4VPgB/bsl8i/0tF/a1+lA5zo9vjuni5cv/be1NNR4m4F8M
	BKSiphfZPnaeOHziOpkbOnYQP3w+IVd8QeKZVxgOeweG8eP6m8yGbnRGCpW2yY/Uk1AF
	x1/c+6fpNo5ICGBWMG26d0RzWQnv+IMpafpsI9t1A8M31MFxRxtdAqceYIrYFqvYQr8W
	YRNQ==
X-Gm-Message-State: AOPr4FUwkeVCSNOi94p3MHJOmGN1P2fjjlvysvRmfL3hqPp94FXEE5nk+wzvY+apUsJo80rmQ2jl95cnEp6RGgNo
X-Received: by 10.107.134.84 with SMTP id i81mr4512446iod.99.1461084118838;
	Tue, 19 Apr 2016 09:41:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Tue, 19 Apr 2016 09:41:39 -0700 (PDT)
In-Reply-To: <CABcZANm7+ewyU8d2iMkMM6uNB7ZSBhcToE3g=rKWkAxrGCP85w@mail.gmail.com>
References: <CAJTo0LZtDL-hbxXmYWdgf7HTZtSA4D2FgRKtx1+n6Rqxq50n=g@mail.gmail.com>
	<CAMKF1spGMHQMVP_-mrHYmDnjM+DPk0mktK_e+9G1bekuP6PnUA@mail.gmail.com>
	<1461019868.9308.224.camel@linuxfoundation.org>
	<CAMKF1spKB=HXLipbo_qFBY6mo67LOWAB-uQxRA25ghZTwD=i5Q@mail.gmail.com>
	<CABcZANm7+ewyU8d2iMkMM6uNB7ZSBhcToE3g=rKWkAxrGCP85w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Apr 2016 17:41:39 +0100
Message-ID: <CAJTo0LZ+xC=STKFwa2J4Kv1Pw4ruLeG2HhAZnxrQV5aJN56XOg@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: bugzilla.yoctoproject.org policy for bugs against multiple releases
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
X-List-Received-Date: Tue, 19 Apr 2016 16:41:58 -0000
Content-Type: multipart/alternative; boundary=001a113febc8e4046c0530d927de

--001a113febc8e4046c0530d927de
Content-Type: text/plain; charset=UTF-8

On 19 April 2016 at 03:17, Christopher Larson <clarson@kergoth.com> wrote:

> There may be something better out there, and if we can find it, great, but
> I think separate issues is better than not addressing the issue at all, but
> only if the tooling is good enough to help reduce overhead on the part of
> the devs dealing with it. Issue tracker overhead gets pretty frustrating at
> times.
>

There may be a way of dealing with this using flags.  If we had a flag for
each release then we could add a flag for each release which is impacted by
the bug, and track when they're resolved by changing flag state.

Ross

--001a113febc8e4046c0530d927de
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 April 2016 at 03:17, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div cl=
ass=3D"gmail_quote"><div>There may be something better out there, and if we=
 can find it, great, but I think separate issues is better than not address=
ing the issue at all, but only if the tooling is good enough to help reduce=
 overhead on the part of the devs dealing with it. Issue tracker overhead g=
ets pretty frustrating at times.</div></div></div>
</blockquote></div><br>There may be a way of dealing with this using flags.=
=C2=A0 If we had a flag for each release then we could add a flag for each =
release which is impacted by the bug, and track when they&#39;re resolved b=
y changing flag state.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113febc8e4046c0530d927de--
