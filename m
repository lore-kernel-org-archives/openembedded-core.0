Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2DACE60030
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:38:02 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x3so10807837qcv.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:38:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7GXDwNNHhf7pEfxYx/HHT9hYvxp3e+udHLJ90l1S0Yo=;
	b=DdKrJVxYDuaU79LDpK1q3F/zi5DwKadqFRTSAjMeITQg6sECBsF7MohHhDlkgamcc+
	dejgsaN9BpfOvbcA6KV2q1wZr2kmFju684epeBsLqk6OcBfFPP189nJoJADbBEPRQmZO
	QCmM0dN1t0GHUQJI/q+x82zGyj+jJVSvHeFKg5NPDYcOjC9xoqTEiUXlkqFyZyfzCeVJ
	+jpNLO6etZ0Uyqcptll7u9xpPCZ4r5ThvksjPeEi1rIFJjbLm0OJvI0C/YDR2fxOZHas
	F5t+8v7IsW4qXwfx6nGCYxGXvw+JsWETCwCz5qxglBcUYjxFq4zBcJ3XYCHcF2xeYCzu
	gdug==
X-Gm-Message-State: ALoCoQlScQos/Hgwp7srBjpeYQZPmMmWP1JPGWIbqYEfc4b88+nO5PmGI3LKNf3pUlB1pErW6dTb
X-Received: by 10.224.25.146 with SMTP id z18mr7600139qab.17.1417610282864;
	Wed, 03 Dec 2014 04:38:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Wed, 3 Dec 2014 04:37:42 -0800 (PST)
In-Reply-To: <1417105314-29318-3-git-send-email-michael.jones@matrix-vision.de>
References: <1417105314-29318-1-git-send-email-michael.jones@matrix-vision.de>
	<1417105314-29318-3-git-send-email-michael.jones@matrix-vision.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Dec 2014 12:37:42 +0000
Message-ID: <CAJTo0LagQEZykUqgps9XjbLCURK44w-G1-1hRNujSEz4DDY05g@mail.gmail.com>
To: Michael Jones <michael.jones@matrix-vision.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] image.bbclass: keep fstab pretty when swapping 'ro' for defaults
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
X-List-Received-Date: Wed, 03 Dec 2014 12:38:09 -0000
Content-Type: multipart/alternative; boundary=047d7bdc8ac0572c6505094f1d10

--047d7bdc8ac0572c6505094f1d10
Content-Type: text/plain; charset=UTF-8

On 27 November 2014 at 16:21, Michael Jones <michael.jones@matrix-vision.de>
wrote:

> +       sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro
> /;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}'
> ${IMAGE_ROOTFS}/etc/fstab
>

It's perfectly valid to do something like "defaults,noatime" which this
replacement will break.

Ross

--047d7bdc8ac0572c6505094f1d10
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 November 2014 at 16:21, Michael Jones <span dir=3D"ltr">&lt;<a href=
=3D"mailto:michael.jones@matrix-vision.de" target=3D"_blank">michael.jones@=
matrix-vision.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":3b4" class=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -i -e &#39;/^[#[:space:]]*\/dev\/root/{s/defaults/ro=C2=A0 =
=C2=A0 =C2=A0 /;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\=
1\20/}&#39; ${IMAGE_ROOTFS}/etc/fstab<br></div></blockquote></div><br>It&#3=
9;s perfectly valid to do something like &quot;defaults,noatime&quot; which=
 this replacement will break.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Ross</div></div>

--047d7bdc8ac0572c6505094f1d10--
