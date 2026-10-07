Return-Path: <joerg.vehlow@emlix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA26BCA5FFF
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 06:01:45 +0000 (UTC)
Received: from mx1.emlix.com (mx1.emlix.com [178.63.209.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1946.1791352883647979768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 23:01:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=tjzfNLlI;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emlix.com header.s=20250930 header.b=tjzfNLlI;
 spf=pass (domain: emlix.com, ip: 178.63.209.131, mailfrom: joerg.vehlow@emlix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1791352881;
	bh=/RjAT2CbXz0+/jpPK1CnxQ/jfAU0WTYNmjCIhDgnldI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tjzfNLlIGcn53TUdDyPmo2jJXh9piJqoD/sbVW7AFcyx9DZitblp0Q2LtrHDPcFES
	 tATd3Wky7i/ejNaoVqCoxNwo5jff+B5dWYN2XqAu74Y2pO8bTLvASjTMY5299S+dhJ
	 kmeRJp0b8vrMlTOgqg/xEzfx87t/8gziqTdK7bJHZOjAb9hkV4AFahXdNx/TkgulsQ
	 UhODA2aXKQb/LlsulSILdr96GoNTc2Mh97ShzWvyHO4kRZZfqOtWIb/30cWnvszRRv
	 H+qAyE5RjD5h5RO22Uhq57wV+8K2HuhRUvppgYrSWy6vaDo+0d3USYG3gx+zheRcFZ
	 MvI+LKnTAzRqA==
Received: from mx1.emlix.com (localhost [127.0.0.1])
	by mx1.emlix.com (Postfix) with ESMTP id 7A72B5F871;
	Wed, 07 Oct 2026 08:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emlix.com;
	s=20250930; t=1791352881;
	bh=/RjAT2CbXz0+/jpPK1CnxQ/jfAU0WTYNmjCIhDgnldI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tjzfNLlIGcn53TUdDyPmo2jJXh9piJqoD/sbVW7AFcyx9DZitblp0Q2LtrHDPcFES
	 tATd3Wky7i/ejNaoVqCoxNwo5jff+B5dWYN2XqAu74Y2pO8bTLvASjTMY5299S+dhJ
	 kmeRJp0b8vrMlTOgqg/xEzfx87t/8gziqTdK7bJHZOjAb9hkV4AFahXdNx/TkgulsQ
	 UhODA2aXKQb/LlsulSILdr96GoNTc2Mh97ShzWvyHO4kRZZfqOtWIb/30cWnvszRRv
	 H+qAyE5RjD5h5RO22Uhq57wV+8K2HuhRUvppgYrSWy6vaDo+0d3USYG3gx+zheRcFZ
	 MvI+LKnTAzRqA==
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.emlix.com (Postfix) with ESMTPS id 653255F7E1;
	Wed, 07 Oct 2026 08:01:21 +0200 (CEST)
Message-ID: <ff11ad0f-308b-4d15-98fb-6083d48ba2a6@emlix.com>
Date: Wed, 7 Oct 2026 08:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "tclibc-baremetal.inc: fix gcc-cross
 EXTRA_OECONF"
To: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
References: <20261006214254.1556824-1-denis@denix.org>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=B6rg_Vehlow?= <joerg.vehlow@emlix.com>
In-Reply-To: <20261006214254.1556824-1-denis@denix.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: ClamAV using ClamSMTP
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 06:01:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247375

Hi,

I just send a patch to the mailing list, that correctly fixes this issue.
The real issue is that before 020d5f0, a baremetal gcc-cross was built=20
without proper sysroot paths and the libgcc (and maybe also other=20
builds) used headers from the host.

I guess this could lead to more built errors in other recipes, that rely=20
on the availability of libc headers, but theses recipes must be fixed the=
n.

IMHO the bug I fixed with 020d5f0 has far greater reach than I expected,=20
because it has the potential to poison a lot of builds with host headers=20
and could have hid a lot of problems in the past.

PLEASE do not merge the revert, but merge the fix to libgcc instead.

J=C3=B6rg

On 06.10.2026 23:42, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
>=20
> While this change has good intentions, unfortunaly, it completely
> breaks baremetal setup (at least for ARM arch).
>=20
> The line this change removes seems to mask an underlying issue,
> but until that issue is fully understood and resolved, let's
> revert it and restore the working baremetal behavior.
>=20
> For more details please see the following discussion:
> https://lists.openembedded.org/g/openembedded-core/topic/121486589
>=20
> This reverts commit 020d5f018616bc48eae3a23d5498dec3c78a1386.
>=20
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>   meta/conf/distro/include/tclibc-baremetal.inc | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/distro/include/tclibc-baremetal.inc b/meta/conf/=
distro/include/tclibc-baremetal.inc
> index 6043cb6654..abea5a7162 100644
> --- a/meta/conf/distro/include/tclibc-baremetal.inc
> +++ b/meta/conf/distro/include/tclibc-baremetal.inc
> @@ -18,6 +18,7 @@ USE_NLS ?=3D "no"
>   IMAGE_LINGUAS =3D ""
>   LIBC_DEPENDENCIES =3D ""
>  =20
> +EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append =3D " --without-header=
s"
>   DEPENDS:remove:pn-meta-toolchain =3D "virtual/libc virtual/compilerli=
bs"
>  =20
>   # certain compiler libs cannot be used without libc, avoid the depend=
ence on compilerlibs
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#247356): https://lists.openembedded.org/g/openembed=
ded-core/message/247356
> Mute This Topic: https://lists.openembedded.org/mt/121618723/10666459
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
joerg.vehlow@emlix.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

--=20
emlix GmbH
Headquarters: Berliner Str. 12, 37073 G=C3=B6ttingen, Germany
Phone +49 (0)551 30664-0, e-mail info@emlix.com
District Court of G=C3=B6ttingen, Registry Number HR B 3160
Managing Directors: Heike Jordan, Dr. Uwe Kracke
VAT ID No. DE 205 198 055
Office Berlin: Panoramastr. 1, 10178 Berlin, Germany
Office Bonn: Bachstr. 6, 53115 Bonn, Germany
Office M=C3=BCnchen: Am Knie 16, 81241 M=C3=BCnchen, Germany
http://www.emlix.com

emlix - your embedded Linux partner


