Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 31707607A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 12:01:14 +0000 (UTC)
Received: by qkei195 with SMTP id i195so49768542qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jul 2015 05:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=9GWmN1fBG1hyquObYuXl3u9bYxTybFzn/Q2h5G73x3A=;
	b=ThU0L2QV/y4/t2dVs4RoyR1n0bx1oVRIEFGTQAMRMaX+fuMYpY+bU2Cv/09MeFD4la
	z595TFIU3Ykl48s+qmIVvGUBY2JQ/XlOB3GVOGMwIAz0VHb9iD0kl/goc7kSZ3KyhZjB
	89HsU7pV2oYDqUPiboyZU6YBbsjjxJ4ztFsEsUKvUWe8bMtnOyboqshINt2KUMGIPdSG
	PDT1/FJ0vpisn6cT/G7r9dpfIPZ9frXkOLRK8KZmBseAjtWaQgss7a/etXRxL8TrEMaM
	ptzWLJKCCQpDArLr7L6kSUnpzhp1IRhlu/qKunjQ+SbZ9tyS5p70mi3R0IdANlUV4Z3C
	k2IA==
X-Gm-Message-State: ALoCoQm16F2klC/Eg2nPxrY46id6nEQTyU25Sxgd6Zy9MlGV+tn4qsoFI2g1yf26tQ0ajfslJenJ
X-Received: by 10.140.88.5 with SMTP id s5mr40980927qgd.59.1435838474746; Thu,
	02 Jul 2015 05:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 2 Jul 2015 05:00:55 -0700 (PDT)
In-Reply-To: <20150702113046.GB9269@ad.chargestorm.se>
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<20150702113046.GB9269@ad.chargestorm.se>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Jul 2015 13:00:55 +0100
Message-ID: <CAJTo0LZRxkWufaH1o1q6=hO7dgFrxGXxtFG9CqjfDNGkQ9JOdQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Thu, 02 Jul 2015 12:01:17 -0000
Content-Type: multipart/alternative; boundary=001a11c118743e0f750519e33258

--001a11c118743e0f750519e33258
Content-Type: text/plain; charset=UTF-8

On 2 July 2015 at 12:30, Anders Darander <anders@chargestorm.se> wrote:

> Without looking too much at this specific issue, I'd say that we should
> keep the older version in oe-core. Just as we normally try to do when it
> comes to GPLv2 / GPLv3 upgrades.
>
> In my opinion, having as much as possible build in a non-GPLv3 build is
> a desirable goal.
>

I neglected to leave my opinion in my mail, but that's also my thought.

Ross

--001a11c118743e0f750519e33258
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 July 2015 at 12:30, Anders Darander <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:anders@chargestorm.se" target=3D"_blank">anders@chargestorm.se</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2ps" class=3D=
"a3s" style=3D"overflow:hidden">Without looking too much at this specific i=
ssue, I&#39;d say that we should<br>
keep the older version in oe-core. Just as we normally try to do when it<br=
>
comes to GPLv2 / GPLv3 upgrades.<br>
<br>
In my opinion, having as much as possible build in a non-GPLv3 build is<br>
a desirable goal.</div></blockquote></div><br>I neglected to leave my opini=
on in my mail, but that&#39;s also my thought.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c118743e0f750519e33258--
