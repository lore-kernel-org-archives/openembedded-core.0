Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 942E577E35
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 23:27:20 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id 77so3320747itj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 16:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D929eHT8intlUazunih8S/3xNSR4V3/rNDMhswFY1UU=;
	b=dLlu0SK5QbA71kKUQALtKok/RzUp15SjDrmyF1ZnAgSoLN2iKq2aI1jTNw/XwCt4S6
	GApi2nkw6ls57oAcNoePoDxZeUJC9iAMlIpZJZBSEsCJMtTevQMuoKp9gCpUTPtPpU3e
	CRWUSby49HXdJrbF79irXtGjBXWyClBHR+opxLmnhF2acEq9KaU+iR95q9NM9bFHXwCC
	1kcvpyqs8avfFG49lSyMiE0lkql1Aap3x0UFlTUSkP30NLO40CJVbKCN+seDuoCwBARZ
	nT1gTrAtjEICccUa6FsTBht97HfeEED3J2o17GPvvnWrhZfCvSd8VI6OUybwxi1d6ig4
	biyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D929eHT8intlUazunih8S/3xNSR4V3/rNDMhswFY1UU=;
	b=XKVW7fL43Kv40ATlU91vwO8mulDH3zVA1AD0Q6Iy6ZwHE5V7T2i9Cm3Q7YbwtUksqF
	zr8sRl9aqrk+GKaJNejylWXMTAksM5WPHITUPvLC2ChlgWhj8cJfWhV4k7905Rx/Wspu
	P2sf+U2pSlm3CS2JwSO1lMPJhNYCmZLpMTy8m9BM4fCrQrPiN256SfMBYVtun/T075jU
	t62mJaEsgXzFcMhJrtwwWGid/FancLURqpRcIeg1HKH7GPU9JqB4AdshC43anrhqEDRr
	6oCtloMkGcC2n9hZBuSlPqRoYfbi86Pi5slMpIRFMzZh3bf6yT9PytZAD59nCx78OO0k
	VIVQ==
X-Gm-Message-State: AHPjjUjK8QMlpALcBFu19qBUfOJR34hNo1YgCdcydndZm7uVXoJk9Ceo
	RguEUKpv+UqljlZLrJ072Fa8ifl53Ndq
X-Google-Smtp-Source: ADKCNb4lEbGWw1YRnX8sg5zt+qT2udIk/Wj41cPdP/IdPwPMIwXQn373ngzm+mEF6LOcEI2PCgfWR+0c2xCeg/qrkAw=
X-Received: by 10.36.90.205 with SMTP id v196mr995437ita.70.1504308441600;
	Fri, 01 Sep 2017 16:27:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Fri, 1 Sep 2017 16:26:59 -0700 (PDT)
In-Reply-To: <20170901124506.19317-1-nicolas.dechesne@linaro.org>
References: <20170901124506.19317-1-nicolas.dechesne@linaro.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 2 Sep 2017 00:26:59 +0100
Message-ID: <CAJTo0LZV5BNYANyc=R1_kbaLuRGa=cK-EPDa_7U65ffVErz+Uw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-good: fix 4k playback for v4l2 decoder
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
X-List-Received-Date: Fri, 01 Sep 2017 23:27:20 -0000
Content-Type: multipart/alternative; boundary="001a1145c7ee4b6b370558291a24"

--001a1145c7ee4b6b370558291a24
Content-Type: text/plain; charset="UTF-8"

On 1 September 2017 at 13:45, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-
> plugins-good/0001-v4l2-Fix-4K-colorimetry.patch
> @@ -0,0 +1,47 @@
> +From 545646cccba243236e10362fe7325f89be57da1f Mon Sep 17 00:00:00 2001
> +From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> +Date: Tue, 18 Jul 2017 11:28:37 -0400
> +Subject: [PATCH] v4l2: Fix 4K colorimetry
> +
> +Since 1.6, the transfer function for BT2020 has been changed from BT709
> +to BT2020_12. It's the same function, but with more precision. As a side
> +effect, the V4L2 colorpsace didn't match GStreamer colorspace. When
> +GStreamer ended up making a guess, it would not match anything supported
> +by V4L2 anymore. This this by using BT2020_12 for BT2020 colorspace and
> +BT2020 transfer function in replacement of BT709 whenever a 4K
> +resolution is detected.
> +
> +Upstream-Status: Backport
>

This needs your s-o-b.

Ross

--001a1145c7ee4b6b370558291a24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 1 September 2017 at 13:45, Nicolas Dechesne <span dir=
=3D"ltr">&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blan=
k">nicolas.dechesne@linaro.org</a>&gt;</span> wrote:<div class=3D"gmail_ext=
ra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
+++ b/meta/recipes-multimedia/<wbr>gstreamer/gstreamer1.0-<wbr>plugins-good=
/0001-v4l2-Fix-4K-<wbr>colorimetry.patch<br>
@@ -0,0 +1,47 @@<br>
+From 545646cccba243236e10362fe7325f<wbr>89be57da1f Mon Sep 17 00:00:00 200=
1<br>
+From: Nicolas Dufresne &lt;<a href=3D"mailto:nicolas.dufresne@collabora.co=
m">nicolas.dufresne@collabora.<wbr>com</a>&gt;<br>
+Date: Tue, 18 Jul 2017 11:28:37 -0400<br>
+Subject: [PATCH] v4l2: Fix 4K colorimetry<br>
+<br>
+Since 1.6, the transfer function for BT2020 has been changed from BT709<br=
>
+to BT2020_12. It&#39;s the same function, but with more precision. As a si=
de<br>
+effect, the V4L2 colorpsace didn&#39;t match GStreamer colorspace. When<br=
>
+GStreamer ended up making a guess, it would not match anything supported<b=
r>
+by V4L2 anymore. This this by using BT2020_12 for BT2020 colorspace and<br=
>
+BT2020 transfer function in replacement of BT709 whenever a 4K<br>
+resolution is detected.<br>
+<br>
+Upstream-Status: Backport<br></blockquote><div><br></div><div>This needs y=
our s-o-b.</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1145c7ee4b6b370558291a24--
