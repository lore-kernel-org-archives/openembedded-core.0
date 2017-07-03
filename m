Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 78724719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 15:22:28 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id p21so148599544qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H+D86i6W8nt4VYGU3DVIPIIW38zm9e1fAWrr8LM1Gnc=;
	b=bVuIhoRui10/63nns2dzSAKIgjfImZlsHb4VgTsZk6Is3QhrdaweDfePt9k3uRqbqm
	qBiTwh8/HmPfFv1IbxoHCn8n2E5M1kYgZrAc69u669skvptRUcCLFnOnasKEPf09l7qv
	b6NovcI6BdGZoaB9MK0WUsWPRFqGv5SNCETElAW5Lr6kRvK06bb6gXFnTL3e8qNdGe5E
	sM77onkdoOY+j0rdVyh7Y87bg7dzL/B9TqtdlwGlBpikvOnNLxsXzxxgAfloWC/huxFp
	baCkqEHQiVD19PCozdZWqjFrc/gndA8Y9hLsruygWUwOnxfi7J74MVB7FwZXBUDpCoNU
	DysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H+D86i6W8nt4VYGU3DVIPIIW38zm9e1fAWrr8LM1Gnc=;
	b=Fx1018ep/DNhr5lB0O4wFd5cnJrXfk8IOxntl6GwIVJFz9mazABc35dBJ7V32et1fV
	+HwkVS/iUkQPN/Xn/WeK7Y8nRmdRkXAvxoiSyrjhe+82LttToB5+P2z9g/Cxko3AycaK
	8M2/cRGfm3paVS08wwCkI9eEjpEYJL+vZ+IiqJBfaWnDQZu5AEi6IphbOdmxX/ZSI47F
	NXdbZpCktNYji8/VzH6Bbpn+MLJhMXZfQZMQj7ScA0/ssJsv9jSn5okLvfUVLfs9Irz3
	6QSzD5VnCLTOgxvWE/OTYFhrlSKpH2/Ri3Y2mliIbHMqY0NpW7jpCo7dnuks3TSRj7ri
	Mh5Q==
X-Gm-Message-State: AKS2vOwIm1G4FUDnskOfwrJWWKnk5r50j7gtS1Af2n093u5ze/9G/Agb
	A6p2TgGIYPM+iT9mwtk/RJb4Dth/Cz85
X-Received: by 10.55.31.162 with SMTP id n34mr39814965qkh.46.1499095350133;
	Mon, 03 Jul 2017 08:22:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Mon, 3 Jul 2017 08:22:09 -0700 (PDT)
In-Reply-To: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
References: <20170630092543.3151-1-ricardo.ribalda@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Jul 2017 16:22:09 +0100
Message-ID: <CAJTo0LYyubn4hEUwJEQog_pVGYd954TuDPPjQUL+7MQnaD+Bug@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] gcc-6.3: Fix libgfortran build
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
X-List-Received-Date: Mon, 03 Jul 2017 15:22:29 -0000
Content-Type: multipart/alternative; boundary="001a1147e5f8d4765505536b5500"

--001a1147e5f8d4765505536b5500
Content-Type: text/plain; charset="UTF-8"

On 30 June 2017 at 10:25, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com
> wrote:

> --- a/meta/recipes-devtools/gcc/gcc-6.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-6.3.inc
>

Is this fixed in gcc 7 (in which case the upstream-status is backport), or
is gcc 7.1 still broken?

Ross

--001a1147e5f8d4765505536b5500
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 June 2017 at 10:25, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ricardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2jw" class=3D"a3s aXjCH m15cf85277fd443d1">--- a/meta/recipes-devtools=
/<span class=3D"il">gcc</span>/<wbr><span class=3D"il">gcc</span>-<span cla=
ss=3D"il">6.3</span>.inc<br>
+++ b/meta/recipes-devtools/<span class=3D"il">gcc</span>/<wbr><span class=
=3D"il">gcc</span>-<span class=3D"il">6.3</span>.inc<br></div></blockquote>=
</div><br>Is this fixed in gcc 7 (in which case the upstream-status is back=
port), or is gcc 7.1 still broken?</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a1147e5f8d4765505536b5500--
