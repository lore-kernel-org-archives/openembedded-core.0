Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id E05A577D01
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 03:37:56 +0000 (UTC)
Received: by mail-vk0-f46.google.com with SMTP id r126so11128734vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 20:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mcApUlM+bCs27ebp9CCwXLbGVaa1VwH4tlQRgACYbhk=;
	b=ovqYOypXhzz36Bp7PkWs8b0kgtGABk2OUjZIdWNDwMMU4Nu2B4xn4Fkh4flPiwC+2m
	CiKHU4mpQl+GGgQdOgHBcTBgd4hXiTAbKbj/KZuZonOQbLbRViPqNIoEM2q9NlpXtx+v
	eOma71hDxAv67TqCrfis6Sjnrnss2SwKMdoBLk6rRkzogzkPeXdEfy+dAC40yaoNK4D5
	5gBK2YqOlwY8E1+EBpHw0Q5vYyBuJijjb/x6ONyqfyiukX4FO94AyHwArfi3xTdcFGB4
	oaLw28ORIc+biptwTqPKTvSsbXxOhfjEDF0AYtklIZfU7cAbj5eK9DYuRRBB/vDstL1n
	YZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mcApUlM+bCs27ebp9CCwXLbGVaa1VwH4tlQRgACYbhk=;
	b=rdTCgFIVqlYiATwCBM7xMdOSzthhD6kvjWNXpdB5Pm9GRaP/cFJysZ15NVcwfJdBXP
	WcY332gFIFFGqrHaSx1n2k+aOfQFBCygVJBZdI7EXvO3dmA4glRdSm4SBFwQ0MiyPyPc
	W6ztlswNUpax9PfkK0+NZrhY133RFnLIugOVwtCzi6FGoGF27rmgZPhNCU7oRqoc+JAA
	3a8nvEGR9EaxyvZPPwduWM97E31juMoIOR/3RsC1HDa41SiOpZZMaKcBGvANyRp3lBl3
	v3z0QXzepDsT11By4nxJ+eBjBX11oA+cGXtWdgF+dlb4mb/TuG15EdYGHvRCz6XSr9wH
	Q6Jg==
X-Gm-Message-State: AIVw1102CT/Uw8FZC/a6OyVdSygSaBIBFEY370k+V9Ne6fwjgnDItAXe
	O8o8ad4lafcfUDLbhAYm0ux7imLB6g==
X-Received: by 10.31.142.74 with SMTP id q71mr6097922vkd.67.1499398677753;
	Thu, 06 Jul 2017 20:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Thu, 6 Jul 2017 20:37:57 -0700 (PDT)
In-Reply-To: <CABcZANkx3ytxjXnCG_smtzeqYD4sCZUE3JLhbhCaKHuMaUHV0w@mail.gmail.com>
References: <1499352019-27001-1-git-send-email-liu.ming50@gmail.com>
	<CABcZANkx3ytxjXnCG_smtzeqYD4sCZUE3JLhbhCaKHuMaUHV0w@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 7 Jul 2017 05:37:57 +0200
Message-ID: <CALatG=6fVH=H2krF2CPk7Y2-nkM6+_UmF3LKyY85bH56cgLSHw@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 03:37:57 -0000
Content-Type: multipart/alternative; boundary="001a1143aff89076030553b1f5aa"

--001a1143aff89076030553b1f5aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Christopher:

I am on board, using '+=3D' in local.conf.sample.extended is a good idea, I
will send a V2 soon.

the best,
thank you

2017-07-06 17:20 GMT+02:00 Christopher Larson <kergoth@gmail.com>:

>
>
> On Thu, Jul 6, 2017 at 7:40 AM, <liu.ming50@gmail.com> wrote:
>
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> The code logic in image-mklibs.bbclass and image-prelink.bbclass is all
>> about optimizing the rootfs image, so it makes more sense to put them
>> into IMAGE_CLASSES rather than USER_CLASSES.
>>
>> What's more, this fixes a potential issue by moving out image-mklibs
>> from INHERIT, considering that, a following dependency is missing in
>> image-mklibs.bblcass:
>> ...
>> do_rootfs[depends] +=3D "virtual/${MLPREFIX}${TARGET_P
>> REFIX}binutils:do_populate_sysroot"
>>
>
> This removes the example usage of IMAGE_CLASSES to alter the default imag=
e
> types inclusion in local.conf.sample.extended, but doesn=E2=80=99t replac=
e it with
> anything, and the commit message doesn=E2=80=99t mention it. Either find =
a way to
> fix that example (i.e. use +=3D or something) or at least mention that yo=
u=E2=80=99re
> removing it, particularly since adding image types is currently the most
> common reason to alter that variable.
> --
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics
>

--001a1143aff89076030553b1f5aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:14px">Hi, Christopher:</span><div=
 style=3D"font-size:14px"><br></div><div style=3D"font-size:14px">I am on b=
oard, using &#39;+=3D&#39; in local.conf.sample.extended is a good idea, I =
will send a V2 soon.</div><div style=3D"font-size:14px"><br></div><div styl=
e=3D"font-size:14px">the best,</div><div style=3D"font-size:14px">thank you=
=C2=A0</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>2017-07-06 17:20 GMT+02:00 Christopher Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;<=
/span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Thu, Ju=
l 6, 2017 at 7:40 AM,  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@g=
mail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:peter.x.=
liu@external.atlascopco.com" target=3D"_blank">peter.x.liu@external.atlasco=
p<wbr>co.com</a>&gt;<br>
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
do_rootfs[depends] +=3D &quot;virtual/${MLPREFIX}${TARGET_P<wbr>REFIX}binut=
ils:do_populate_sys<wbr>root&quot;<br></blockquote><div><br></div></span><d=
iv>This removes the example usage of IMAGE_CLASSES to alter the default ima=
ge types inclusion in local.conf.sample.extended, but doesn=E2=80=99t repla=
ce it with anything, and the commit message doesn=E2=80=99t mention it. Eit=
her find a way to fix that example (i.e. use +=3D or something) or at least=
 mention that you=E2=80=99re removing it, particularly since adding image t=
ypes is currently the most common reason to alter that variable.</div></div=
><span class=3D"HOEnZb"><font color=3D"#888888">-- <br><div class=3D"m_-270=
3570553273090860gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot =
com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Senior Software Engin=
eer, Mentor Graphics</div></div></div></div>
</font></span></div></div>
</blockquote></div><br></div>

--001a1143aff89076030553b1f5aa--
