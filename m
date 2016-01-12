Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB3F7318D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 15:34:26 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id g73so191537716ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 07:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TnCLestUfW8SRZBgkzrlI1xD3Pab6Hiy4P81JSOoSbs=;
	b=xNEXa2kMJm7QWR6XYO122AUsvTtzrN5rhX+Ja+LB9AtwcqR/lvmtyE7FHQOkySTnIT
	g2HiK6oPJTToLdR3Yr0xsfwolXVkeWUHw1x6mijKoug12WvuCAqqZnkEcrgbrSnBfycX
	nbR/kJdN6DbBsFG99MKdzpvH0R8d9WoKIjvWw8h4N0pKGG/CcVEulzmLswWZ77WD2UpC
	0XnJ0x+FjxSCPPOe4o32zF5PNdYPYSJE2Ewahztmhx3b765MUUG3tEbIkVYT8Ac2R2N5
	YfGokrK/+opKOs1OQ6jOXrYQrWCgNGejy0vKxKJIQnCYYiyqkJrCIMXeZ10io5S1KKnf
	z2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TnCLestUfW8SRZBgkzrlI1xD3Pab6Hiy4P81JSOoSbs=;
	b=WHAvce6EJAnrfzD6/kKA0GslweZpI/nQzb299Z7bot569Hs1DjVhn1T5Ls8cOu9W4d
	rFTk1n+1fC3DlJzIb8Sud3qkTRI04jPBmBC4iRiMtr0SvGGysw4ARx6DjEzhkYxRp36b
	jlAu6RA3zE8iiaNGMXSo2NUI2HBi7HKSGDD+5tBTlslZSkW2o5a+7xqirzMpVBaNFRYJ
	HyZ/8Zo3NzXj4UEkUjjtsY32rToEPkkFddht4vQ4/X1eJHTvwXrRzbke+09nyW8CwHyT
	GgIAyDpZudiLMfj/OofYyZlgnOTR1vd1g9/Oiir5igYKYAx0lbdLGrEaEE4g29cqZH6r
	9X8g==
X-Gm-Message-State: ALoCoQkEgZIcn/JCryN6zU9zRJNTjvjd2y1f3oCDozUn1VoJ7IEJrRGOFl1gftro3uuHYGfQcCU9mBUERGhXsYQFGrsX2KLpWobCp5eS9NcEmsstUWW221M=
X-Received: by 10.107.164.161 with SMTP id d33mr109810485ioj.148.1452612867072;
	Tue, 12 Jan 2016 07:34:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 12 Jan 2016 07:34:07 -0800 (PST)
In-Reply-To: <5695015D.9040903@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
	<5695015D.9040903@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jan 2016 15:34:07 +0000
Message-ID: <CAJTo0Lbzu8PEk5bLSoBrnjmZsxx7wxAFhE6FFVuUyxd2h1cpUA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Version updates
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
X-List-Received-Date: Tue, 12 Jan 2016 15:34:27 -0000
Content-Type: multipart/alternative; boundary=001a1141c976f07b87052924c93e

--001a1141c976f07b87052924c93e
Content-Type: text/plain; charset=UTF-8

On 12 January 2016 at 13:36, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Oh, forgot to mention that this is the first time where the task of
> figuring out the checksums and sending the initial commits to me by email
> was done by Automated Update Helper, and all I had to do is apply the
> patches and make sure they do build.
>
> Awesome work, Anibal!
>

Hooray!  Thanks Anibal, that's awesome news.

Ross

--001a1141c976f07b87052924c93e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2016 at 13:36, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":as" class=3D"a3s" style=3D"overflow:hidden">Oh, forgot to =
mention that this is the first time where the task of figuring out the chec=
ksums and sending the initial commits to me by email was done by Automated =
Update Helper, and all I had to do is apply the patches and make sure they =
do build.<br>
<br>
Awesome work, Anibal!<br></div></blockquote></div><br>Hooray!=C2=A0 Thanks =
Anibal, that&#39;s awesome news.</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Ross</div></div>

--001a1141c976f07b87052924c93e--
