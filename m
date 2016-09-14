Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2388D73174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 16:38:35 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id n143so32592393ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i2NBrHKhOhyzfLuG1QKqzjfc6MhffOwYLvvsx4OM2CA=;
	b=hk7HPRNV+FNrv6TQZcyeKLup3rfsXcbs5juPON7Hw4b5T89Wm4BhjXG5TjSg47kE0P
	KHf0RgNkiY4q4EstbV3JIs3eq46nZheAt3Iy4X5Q+JwSjnxIWc3lfwe5QxeSH78pVcxg
	rvmYamXiEATyvUVVtKqXrVnsrweI0WLx3JlC1xU6VByf2hjhmEjgPCGD4iemAU5Se84y
	iC/bm3Z3B8MGcMYxlPOlGS/pyZ+vfwxH/yHesmswKLwzKJ/y3sXitQwXNLw6T9K8Vg9G
	XsMFNF5tgVRrRTdPUwoEzqCdtY/DAswycgsAzP8t0PsOmfwLk5xU6iqsBaHeDBr5Z47j
	yQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i2NBrHKhOhyzfLuG1QKqzjfc6MhffOwYLvvsx4OM2CA=;
	b=V0T5iri8lYukQL4mBAGuKSYxTmWh0F7StX4TRzB07d9hj08W/5ubDTlDo8Q0L0dtgY
	fN/Inel+3cJ0FkfZSWNT5vp3SEXpNLBsygm2B983NGpTylXRn6Y8g9dEToCS8Kuv6YgP
	TA0B5wMNLyD7d0HSInTses+lopGXDK6KEfbqJFhaDWOn50jZmQ5tlSUo3wlhwDzAlop3
	ZkIaAGL0/7yfEovPdP66IdSRYByph4G7Y93+a0cvxh45OW00fmc9AgdR5Cq1W8KrDFl/
	tnXAkysLfDnoh8qHesCJALaWr8vFXXCharkSOGkEfxkHU9T/k/NPU5WYA/pNdEWtzpIz
	GsLA==
X-Gm-Message-State: AE9vXwOeEEtg33uEBuPGzccqPgOvtz0Tm7//hIZkJAXVjLQOAyIHJ3Us7gFZa41yz/VVqAqGdV330g9aO98fRE2q
X-Received: by 10.107.35.13 with SMTP id j13mr7744844ioj.189.1473871116346;
	Wed, 14 Sep 2016 09:38:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Wed, 14 Sep 2016 09:38:15 -0700 (PDT)
In-Reply-To: <1473852282-12088-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1473852282-12088-1-git-send-email-markus.lehtonen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Sep 2016 17:38:15 +0100
Message-ID: <CAJTo0LYuNzYTdhjmgpf-9rEC-axKW-khVGzU6iPN+MC=i+8arQ@mail.gmail.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] scripts: introduce buildstats-diff
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
X-List-Received-Date: Wed, 14 Sep 2016 16:38:37 -0000
Content-Type: multipart/alternative; boundary=001a1140292a55ddc3053c7a5c73

--001a1140292a55ddc3053c7a5c73
Content-Type: text/plain; charset=UTF-8

On 14 September 2016 at 12:24, Markus Lehtonen <
markus.lehtonen@linux.intel.com> wrote:

> +        if not tasks1:
> +            pkg_op = '++'
> +        elif not tasks2:
> +            pkg_op = '--'
>

BTW, I've been reading buildstats-diff output all day and find the lack of
whitespace between the operator and the package name makes the output
harder to read, so I've patched it locally to be just '+ ' or '- ' for
clarity.

Ross

--001a1140292a55ddc3053c7a5c73
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 September 2016 at 12:24, Markus Lehtonen <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:markus.lehtonen@linux.intel.com" target=3D"_blank">markus.lehto=
nen@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":1ic" class=3D"a3s aXjCH m157287239512fb54">+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if not tasks1:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_op =3D &#39;++&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif not tasks2:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg_op =3D &#39;--&#39;</div></b=
lockquote></div><br>BTW, I&#39;ve been reading buildstats-diff output all d=
ay and find the lack of whitespace between the operator and the package nam=
e makes the output harder to read, so I&#39;ve patched it locally to be jus=
t &#39;+ &#39; or &#39;- &#39; for clarity.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140292a55ddc3053c7a5c73--
