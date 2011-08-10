Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QrBBK-0000H3-Ou
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 17:58:58 +0200
Received: by eyb7 with SMTP id 7so926504eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 08:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=48PzZmVn9GNQgE6oFzOh2L199wWzFkr39ev6938ZjNY=;
	b=jHxDRUUM+GZAqRzL98RH1fpvw+cgFpW2C02ntBG8L9xfv/kYjESNi+PGbM/ZK5Fqll
	ol5+eZGYYRtN4ZUPmDBx2LbSLT54SyZ05sZwRJfxCKl75H09xPI3WJOUxNBRG+Ke9nbh
	Onzt0YRgGB5vZ8yTIeyMeTZMTKDmamvXajRsk=
MIME-Version: 1.0
Received: by 10.213.20.19 with SMTP id d19mr239925ebb.53.1312991668053; Wed,
	10 Aug 2011 08:54:28 -0700 (PDT)
Received: by 10.213.14.1 with HTTP; Wed, 10 Aug 2011 08:54:28 -0700 (PDT)
In-Reply-To: <1312659111-22327-1-git-send-email-agnel.joel@gmail.com>
References: <1312659111-22327-1-git-send-email-agnel.joel@gmail.com>
Date: Wed, 10 Aug 2011 10:54:28 -0500
Message-ID: <CAD=GYpZGj1DriKV7hO--fb15_5+yrPts-2dx1LtpHG6FE8NpuQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: "Kridner, Jason" <jdk@ti.com>, "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: [PATCH] ti-codec-engine: Use latest CE and update all dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Aug 2011 15:58:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 6, 2011 at 2:31 PM, Joel A Fernandes <agnel.joel@gmail.com> wro=
te:
> Switch to the latest CE 2.26.02.11 [1] and update all dependencies accord=
ing to the
> release notes [2]. This makes ti-codec-engine to build without any compil=
ation errors
>

Can this patch be merged in? It is in sync with the ongoing effort of
the gstreamer-ti import

>
> diff --git a/conf/distro/include/angstrom-codec-engine-latest-preferred-v=
ersions.inc b/conf/distro/include/angstrom-codec-engine-latest-preferred-ve=
rsions.inc
> index 173a15b..ca0ee46 100644
> --- a/conf/distro/include/angstrom-codec-engine-latest-preferred-versions=
.inc
> +++ b/conf/distro/include/angstrom-codec-engine-latest-preferred-versions=
.inc
> @@ -1,8 +1,8 @@
> =A0# This is the latest set of TI components
> =A0#
>
> -PREFERRED_VERSION_ti-codec-engine =3D "2_26_01_09"
> -PREFERRED_VERSION_ti-codec-engine-examples =3D "2_26_01_09"
> +PREFERRED_VERSION_ti-codec-engine =3D "2_26_02_11"
> +PREFERRED_VERSION_ti-codec-engine-examples =3D "2_26_02_11"
>
> =A0PREFERRED_VERSION_ti-biosutils =3D "1_02_02"
> =A0PREFERRED_VERSION_ti-cgt6x =3D "6_1_17"
> @@ -10,14 +10,14 @@ PREFERRED_VERSION_ti-dspbios =3D "5_41_07_24"
> =A0PREFERRED_VERSION_ti-dsplink =3D "1_65_00_03"
> =A0PREFERRED_VERSION_ti-dsplink-examples =3D "1_65_00_03"
> =A0PREFERRED_VERSION_ti-dsplink-module =3D "1_65_00_03"
> -PREFERRED_VERSION_ti-edma3lld =3D "01_11_00_03"
> -PREFERRED_VERSION_ti-framework-components =3D "2_25_03_07"
> -PREFERRED_VERSION_ti-linuxutils =3D "2_25_05_11"
> +PREFERRED_VERSION_ti-edma3lld =3D "01_11_01_04"
> +PREFERRED_VERSION_ti-framework-components =3D "2_26_00_01"
> +PREFERRED_VERSION_ti-linuxutils =3D "2_26_01_02"
> =A0PREFERRED_VERSION_ti-local-power-manager =3D "1_24_02_09"
> =A0PREFERRED_VERSION_ti-lpm-module =3D "1_24_02_09"
> =A0PREFERRED_VERSION_ti-lpm-utils =3D "1_24_02_09"
> -PREFERRED_VERSION_ti-xdais =3D "6_26_00_02"
> -PREFERRED_VERSION_ti-xdctools =3D "3_20_03_63"
> +PREFERRED_VERSION_ti-xdais =3D "6_26_01_03"
> +PREFERRED_VERSION_ti-xdctools =3D "3_20_06_81"
>
> =A0PREFERRED_VERSION_ti-codecs-dm355 =3D "1_13_000"
> =A0PREFERRED_VERSION_ti-codecs-dm355-server =3D "1_13_000"
> --
> 1.7.0.4
>
>


