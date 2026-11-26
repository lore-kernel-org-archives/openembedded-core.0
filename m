Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15367.1795704700149407477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 06:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=AlNwQfWw;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=FdpvKSSB;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 2D58FEC093A
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 09:51:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 26 Nov 2026 09:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795704699;
	 x=1795791099; bh=pdxZzkgycGu5qjmML7x8o4zauadZ0k5JgIin7neQqNc=; b=
	AlNwQfWwVSWkWNYjUJCfZP99/gzeqkaA+wPEYSRQVsH6BkSh2aknHTckrtBa2hfV
	n5sc4T7sn/Tk56yj4VCRAVfDz5JCEhdmuauyOSyHH3jpiU5Fzz6oKe9bG1w+OvBD
	M91aoh8oK1jeVyCdv5LwagzYrouxGl2lwRkK36EzdEZ15LTRy0d1lSZJmKTsL3Jc
	ATIsa4L93bUC+qd1nhFvbCSG4etBb4SVEQ5ycKGBtft7tfTx4UtmqZcT2P4MJLpI
	RVWMfM/zluiUZHNK3ptBgM6Tq1bnPrB4ICVfFIi4JInGZpJBHSxhz8pNmgIEq+4d
	+ixRn8DaBnfIjtXOeKtDuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795704699; x=
	1795791099; bh=pdxZzkgycGu5qjmML7x8o4zauadZ0k5JgIin7neQqNc=; b=F
	dpvKSSBcivhLk4PSR+a7PoO6a2OwR1siemXLVIf5sqpu1jyKpXHR8PMtzg7PUSuI
	PWuhSKb0CsAL4de7NjHTYMiGe/Xj1L6YTLgDLfJYonf/T9M+J/66twcB5xiK30Cs
	mEzy6MZZaytDpESN66AXdfLVVfJ/40GOynLR0SZKGN+D13+cTcU6dPU5bX+T2+pp
	RdRT0FlEUiJF1l6Hx2blEFDU1JV8uqvu1CFyv79ZyP3oHqH6tLTE4MPJcR8GpRrZ
	7O0QIgmLVQSaavS4Yd7W35ks3BDsdwlD1odJ5lw//kY8zbPWpTulD09uRwzGflbY
	DXlHYfmN3W09kiDtkh/WQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795704699; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm2:rsa-sha256:cXUr2Q34jtCT3me+h1xFPKXMm+lVNtN/NoUV/syxPqifpJ3
	welllI98/dgmsf5aKiy4cRA44XTgMe3iAY0R/41oqEu7fTEwBVpW6A+WDuTlOQTS
	Hm6W5HwXr4gqo/uFa392XY75jwX4241py3gkC5kD5xpG8w2iAXgp0yhzWpeawrJ/
	1pXrxI/pzIBXWTgnaf1LvKj8KMq5xItF4wny1W0uZ3ihQC9jBYfiCHsgkkxqLvmH
	G7vf/pCqOZmE2wPwzbOGjC+3NtyG7evOOUs8B328l3bjEOV0FVJU/WUJ0d/0qG8c
	4js3dNmGpowx9a83Bp4WmREr1PUd2CkfuBlexYw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SoV4t+sFfrtuzTDiPY/263vGRKYDS44AHK8MIqTOwPU=:/BL7iwBq1tOW3doz9e5S9Hio+v0Fg+wghzvXB/Stf8s=;
X-ME-Sender: <xms:e0cIa_aHebAxmRbsW4g5M3fjJLHnWM2tOj4ZpqP2NLIx0UOCqnikFg>
    <xme:e0cIa2JreOfKKtsOKwkW21ZCqgh5W7i12_DFqoRBB8SjuOmf2xsu1yxoHmBDSK57G
    2UD7TAhg95zlGTMrvWBdQHywkoqr7jXoJg4RyU1jAy92mvbftvRHKLL>
X-ME-Received: <xmr:e0cIa1BAeSMWhc6C7IJ1fpl6SAaLex4OkthipOWyVJDBanazNGAdBwTikPjm5tNqaEWHmPJZ-5efRZnfAbOp-f6f79jV>
X-ME-Proxy-Cause: dmFkZTFWYLDmSpzBOG318LQAT68L7cTBodjYPu8AU+OQCHb7DAfpCRsKoeaB1kYRlh2gwM
    7l2gi5NOtTC6NIBjbBVEZNd3e65cfjNzfZbilFFeY3KBN6TQPZRgxgSEuQMJjlGzEVxIpV
    bKKSI0Z8xbzVYzbFHbOy1zGpnyvVhgJweew5OScTPC9ciAE1AL1JzSTfmjDl85MeqwHfkt
    4SpSdRpqZWna5JShHf97jmmRkoTDgrzhracq6d8toS7VBfOgCedOkUh7+X4uqBIHcDpu2h
    79xAsBUO46cLIm5AMeW97zpmYiZQLYy9eOWZ/Guap4duiFd0SMv+mmbYjTSJHla62ETkMY
    BgJH0zHxzs/LaHh0TpD4u3wPIPWg7MH0jCzyY/AraNlEJeraPeUcixKDWGm50g4aDTz0Lq
    i3eeNFgEdHOltYJJQJ1W3Am4fFx+VgGMppnN+MZ2LujDDWsNtxe7tOWXWSZEpw973jRzFm
    JCd7KeLMtR7i8rmfG1wbV6rxaVbRszVdoZS6tlpbs7iCch3V6ldE4c7Lbmd9fH5K8otJxe
    7x1GPD2Lo0YLF2CnVqaSpk4tLkYNfhmFd6HhXbcl7ZJfCDtp/J0eESlmcfj5Jp1Ch0FYYk
    ogvnQiDauRNUjqfb39kInWvVsz0OS6ZAVHSmvKbjaMXvslDeLOCojh3sVCPA
X-ME-Proxy: <xmx:e0cIazrDub4eYv5Yn2I4sh-eXto86lQs1MhAAAEiCocy-UrqfV3QwA>
    <xmx:e0cIa4hFyc1gCQ0FpMtfVKYMlfJaI05qd_PI0mNMLl4tWtPpIuJLFg>
    <xmx:e0cIa4CLud-UOnBHBXNsX2my1Bwfdg_-XLzPslsgf5pKnK2zej9C3w>
    <xmx:e0cIa1FzP_2UXCZe8pCT19hiSct5O1LjE2MglWe0656pe9vKOBqhcw>
    <xmx:e0cIa3Bb76qFRI3PQuW1neWCVDnmsQZYba_afInzbulWn2Dzkw_sOv2g>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Nov 2026 09:51:38 -0500 (EST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 14:51:37 +0000
Message-Id: <DN586TPOAFWC.N39E3XAGLMVS@pbarker.dev>
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
Subject: Re: [PATCH] ptest, packagegroup-core-buildessential: Add clang with
 clang toolchain
From: "Paul Barker" <paul@pbarker.dev>
To: "Khem Raj" <raj.khem@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20261108204650.3577385-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261108204650.3577385-1-khem.raj@oss.qualcomm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 14:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251311

On Sun Nov 8, 2026 at 8:46 PM GMT, Khem Raj wrote:
> When the target is built with the clang toolchain, python's sysconfig
> and perl's Config record ${TARGET_PREFIX}clang as the C compiler, so
> anything compiling on the target through them fails when only gcc is
> installed:
>
>   FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-yoe-lin=
ux-clang'
>
> The target clang package installs the ${TARGET_PREFIX}clang symlinks.
> Add it to packagegroup-core-buildessential, and in ptest.bbclass append
> it to the ptest RDEPENDS of any recipe built with clang whose ptest
> already pulls in gcc, g++, their -symlinks packages or
> packagegroup-core-buildessential. This covers python3, python3-cffi,
> elfutils and others without per-recipe appends.
>
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
>  meta/classes-recipe/ptest.bbclass                         | 8 ++++++++
>  .../packagegroups/packagegroup-core-buildessential.bb     | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptes=
t.bbclass
> index 0f80fbc1d8..de77089002 100644
> --- a/meta/classes-recipe/ptest.bbclass
> +++ b/meta/classes-recipe/ptest.bbclass
> @@ -136,6 +136,14 @@ python () {
>      if not(d.getVar('PTEST_ENABLED') =3D=3D "1"):
>          for i in ['do_configure_ptest_base', 'do_compile_ptest_base', 'd=
o_install_ptest_base']:
>              bb.build.deltask(i, d)
> +
> +    # On-target compile tests need the clang driver when built with clan=
g
> +    if d.getVar('TCOVERRIDE') =3D=3D 'toolchain-clang':
> +        var =3D 'RDEPENDS:%s-ptest' % d.getVar('PN')
> +        rdeps =3D bb.utils.explode_deps(d.getVar(var) or '')
> +        if any(p in rdeps for p in ('gcc', 'gcc-symlinks', 'g++', 'g++-s=
ymlinks',
> +                                    'packagegroup-core-buildessential'))=
:
> +            d.appendVar(var, ' clang')
>  }
> =20
>  QARECIPETEST[missing-ptest] =3D "package_qa_check_missing_ptest"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessen=
tial.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.=
bb
> index 2cd67ad05f..d33af54d26 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
> @@ -29,3 +29,4 @@ RDEPENDS:packagegroup-core-buildessential =3D "\
>      pkgconfig \
>      "
> =20
> +RDEPENDS:packagegroup-core-buildessential:append:toolchain-clang =3D " c=
lang"

Hi Khem,

One comment in addition to what Ross has said.

When using clang, this patch is adding clang to the dependencies of
packagegroup-core-buildessential in both ways. I think we can just keep
the RDEPENDS append in packagegroup-core-buildessential.bb and drop
packagegroup-core-buildessential from the list to be modified in
ptest.bbclass.

Best regards,

--=20
Paul Barker

