Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4A9C60068
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:20:26 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p21so4974753qke.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IPP+VuOaZmnMpnTgzlPZkU0aLOX2gLzX3DhCITlUiHs=;
	b=o+FG6Tn3uJf04dWwJT4L0dsLnZSH1X0rPiHi9uLQNv5trGMU6+SkBnR2u26c2MXfOL
	B4I2SyFyTHhSmjC0XGe3IpzExSAJlHd67R93NB8uLA+bwonbBg9stvV85OoB0/4hFAgf
	vcELUOVzsxRUGdDIGlE8S1QBJNXxsWuSII0km07RlBuZB9ZazE1myZSJL7x2iO3Zzijt
	B8a2DmezV75UB9umEJLz3ui66MIZMFe7Ng6eLC/Lkpm7jCfPMqPxuwOYPqMwvhRzsKQb
	3ARs3AdwFYESAEIfugwR77bXabmKNWKvQOR41q6YGseUG2VizuiC3P+g1avIw4vRQRbr
	Yrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IPP+VuOaZmnMpnTgzlPZkU0aLOX2gLzX3DhCITlUiHs=;
	b=XBfa98t5XJ8w45AgtrxImwWPF4a8dnYzqZIm6NPqiZqWoajBEFoHrik9TpoNLK2I+N
	V5dKGI7RW1C6NBIeOJIEKGRDQXFGWo311CYrvjreJrLYh6Umu7GmvZwZUfc7AAhSgYtQ
	XXshxa+yWRabwK083xchuWr3jprnIDbSkm5qdts534mcImBGAaT2SynicrZ76mJYZnX6
	DYAoMeNRsnusL20uJnv/oU390G/sf6QSnaSMIfVlH/jParMb+EN4xVxbp4ngcs6baqmw
	Vx6K1/O3hY++82xQnPC+t0ODYE8Jtc1rxywdbojXHrmjYSKuDQa/hdu7oW6wQ+kMDfFr
	U3GQ==
X-Gm-Message-State: AKS2vOygBRxypywdbk3Tv6inI/Ovm4RI5bIulUe4zdF3RD6PGrxlkp/y
	5v+Wi2UXt+0GWoNIjXcrSYSssdYr4A==
X-Received: by 10.55.164.88 with SMTP id n85mr58205862qke.159.1499354427644;
	Thu, 06 Jul 2017 08:20:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.21.230 with HTTP; Thu, 6 Jul 2017 08:20:07 -0700 (PDT)
In-Reply-To: <1499352019-27001-1-git-send-email-liu.ming50@gmail.com>
References: <1499352019-27001-1-git-send-email-liu.ming50@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 6 Jul 2017 08:20:07 -0700
Message-ID: <CABcZANkx3ytxjXnCG_smtzeqYD4sCZUE3JLhbhCaKHuMaUHV0w@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: move image-mklibs image-prelink to IMAGE_CLASSES
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
X-List-Received-Date: Thu, 06 Jul 2017 15:20:27 -0000
Content-Type: multipart/alternative; boundary="001a114fa5020d5e6c0553a7a8cb"

--001a114fa5020d5e6c0553a7a8cb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2017 at 7:40 AM, <liu.ming50@gmail.com> wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> The code logic in image-mklibs.bbclass and image-prelink.bbclass is all
> about optimizing the rootfs image, so it makes more sense to put them
> into IMAGE_CLASSES rather than USER_CLASSES.
>
> What's more, this fixes a potential issue by moving out image-mklibs
> from INHERIT, considering that, a following dependency is missing in
> image-mklibs.bblcass:
> ...
> do_rootfs[depends] +=3D "virtual/${MLPREFIX}${TARGET_
> PREFIX}binutils:do_populate_sysroot"
>

This removes the example usage of IMAGE_CLASSES to alter the default image
types inclusion in local.conf.sample.extended, but doesn=E2=80=99t replace =
it with
anything, and the commit message doesn=E2=80=99t mention it. Either find a =
way to
fix that example (i.e. use +=3D or something) or at least mention that you=
=E2=80=99re
removing it, particularly since adding image types is currently the most
common reason to alter that variable.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a114fa5020d5e6c0553a7a8cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Jul 6, 2017 at 7:40 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"m=
ailto:peter.x.liu@external.atlascopco.com">peter.x.liu@external.<wbr>atlasc=
opco.com</a>&gt;<br>
<br>
The code logic in image-mklibs.bbclass and image-prelink.bbclass is all<br>
about optimizing the rootfs image, so it makes more sense to put them<br>
into IMAGE_CLASSES rather than USER_CLASSES.<br>
<br>
What&#39;s more, this fixes a potential issue by moving out image-mklibs<br=
>
from INHERIT, considering that, a following dependency is missing in<br>
image-mklibs.bblcass:<br>
...<br>
do_rootfs[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_<wbr>PREFIX}binut=
ils:do_populate_<wbr>sysroot&quot;<br></blockquote><div><br></div><div>This=
 removes the example usage of IMAGE_CLASSES to alter the default image type=
s inclusion in local.conf.sample.extended, but doesn=E2=80=99t replace it w=
ith anything, and the commit message doesn=E2=80=99t mention it. Either fin=
d a way to fix that example (i.e. use +=3D or something) or at least mentio=
n that you=E2=80=99re removing it, particularly since adding image types is=
 currently the most common reason to alter that variable.</div></div>-- <br=
><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot c=
om<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engine=
er, Mentor Graphics</div></div></div></div>
</div></div>

--001a114fa5020d5e6c0553a7a8cb--
