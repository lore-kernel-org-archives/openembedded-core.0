Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id AAA4F786CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 15:21:26 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id j67so9995677vkd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 07:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k26+e0tTYIaIeKNGWPwpn/mugXrkXNjsMLHeFXYIDzU=;
	b=eNjK84XC7qyh/kf8G8LsYCB3+e7vwGwC35q5nYQ8JaUWiz826lJ+xWTUPzHsSSdmIx
	DGQncgEq1ZXalQsOwGLJZQHp9OKTMr8n9axmT23C6tFE4+HwhmN9alxn38DkT5cdvc9T
	8XIpgld+fBkaxXA+upaytMbBrAq+Jy/QsI8fE99x+/9GsZuFS/jwIjdUsfbe7HXT38IA
	Z96UX93C66EOlFMo5r+79vwGUG1Ui1hrUp5O2cXWqJHNpb67RSea55QMw5h/x/0R5Vug
	aFQll/k8LUiJRClMv5H02cUDyVD6grIpRNAKd0JtxehgTehsy51k465KlpoBvI9ftSb5
	iCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k26+e0tTYIaIeKNGWPwpn/mugXrkXNjsMLHeFXYIDzU=;
	b=r2LErcrCe6zppB/dSqzWMIYrW7D3FKFtTuRnPTYTUTYZXD7am37nLqpdHbUtlPUPnJ
	3UnK5v7Viod+AfeFfnCR6C2/2y1FYfbd/hTKOkezAVkXwLaA+JaytmDPZuIjn6qg6Hq3
	8+DtN3s4A0RahuzfucTevZrNPoUXDyx+e3J0LS4V01YrhWohidK38GkdUgry+WOi45Wq
	KgTPdr/654RWuKFVl4zbz9oZAWf+qCA4Hh+qjTeszq6zFvS95zjWnJkC9cA8nQjHYagF
	TBgSzVOWeJ/CiGgmnI8msvmqU3uASpSEOODdeLG+uqwz0GTlYRhGBHLD3SNvFCIexY3L
	czVA==
X-Gm-Message-State: AJaThX6lf7mQtlob+CG1o72tzC6l6yPCfEJ1Ve3BTLM95oJe6XXXCbRQ
	vVP7o52ZrEfqZ8I+PUuXpy8E24wOBUEPpyAp6xg=
X-Google-Smtp-Source: AGs4zMagyAzktuvE6WASHhUntEzcC4Re35GtL489DiyYBsHSwVQZfP9wI1BAz1tVlGpBp3LHCN0oaZZBZs6alJbN3Ss=
X-Received: by 10.31.141.74 with SMTP id p71mr15852413vkd.53.1511364087722;
	Wed, 22 Nov 2017 07:21:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.72.130 with HTTP; Wed, 22 Nov 2017 07:21:07 -0800 (PST)
In-Reply-To: <20171121235323.29727-1-ross.burton@intel.com>
References: <20171121235323.29727-1-ross.burton@intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 22 Nov 2017 08:21:07 -0700
Message-ID: <CABcZAN=rzBprEN-bKfy6CKEVYeiHxQ=O=A4jfJApt4E-6wD7KA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bin_package: fail if ${S} doesn't actually contain anything
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
X-List-Received-Date: Wed, 22 Nov 2017 15:21:27 -0000
Content-Type: multipart/alternative; boundary="001a114260ee9338e7055e93df71"

--001a114260ee9338e7055e93df71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2017 at 4:53 PM, Ross Burton <ross.burton@intel.com> wrote:

> If the user is trying to use bin_package but the SRC_URI hasn't extracted
> anything into ${S}, which is easily done when writing a recipe by hand,
> instead
> of silently shippping an empty package abort the build.
>

I was thinking about this the other day, as it=E2=80=99s a long standing an=
noyance,
I think we should add a new pwd or cwd flag which is used in preference to
the last entry in `dirs` if it=E2=80=99s set, and which errors if the dir d=
oesn=E2=80=99t
exist and isn=E2=80=99t listed in `dirs`, then drop `${S}` from dirs. Thoug=
hts?
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114260ee9338e7055e93df71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Tue, Nov 21, 2017 at 4:53 PM, Ross Burton <span dir=3D"=
ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.bu=
rton@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">If the user is trying to =
use bin_package but the SRC_URI hasn&#39;t extracted<br>
anything into ${S}, which is easily done when writing a recipe by hand, ins=
tead<br>
of silently shippping an empty package abort the build.<br></blockquote><di=
v><br></div><div>I was thinking about this the other day, as it=E2=80=99s a=
 long standing annoyance, I think we should add a new pwd or cwd flag which=
 is used in preference to the last entry in `dirs` if it=E2=80=99s set, and=
 which errors if the dir doesn=E2=80=99t exist and isn=E2=80=99t listed in =
`dirs`, then drop `${S}` from dirs. Thoughts?</div></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Found=
er - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor =
Graphics</div></div></div></div>
</div></div>

--001a114260ee9338e7055e93df71--
