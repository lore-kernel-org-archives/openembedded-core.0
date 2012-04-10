Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHV17-0008Ua-J1
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 08:57:29 +0200
Received: by wera1 with SMTP id a1so3006107wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2012 23:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=BPKyG1TxJyinPkd4KJ47tGouTZtNuKOzZxox/GuzUPQ=;
	b=WBbewJ+hvh1tbhEEMNHSLM32CZKwsr4nqxEoF+Yjr0Ox/Hp2sd1UEdhWzaJzypzXRu
	3XVgmfEiYPRegMkRwbnZV4gr9/dzZZHxZU68AQtKSB2KMoNEVYd6jbD/ofDt2u8edzwK
	iP4NX3Vva/JE7FZgqXjsNF1RyOnGfeha5ahCR98qoEz1DSm5LtJNJiKplz705MSxQBWs
	mUtNvYimmOFYy7Azq8YPNMPJ5ofXb2i+3VQXtNxYRX0Xo/K+9LhIfq02Eqi8hveovVIc
	+4Gbv9cO1ISALWfCxZR76wLjW1mzgUyHyLkrzLDjw33k9RNVBr3H+GphNBUa62vs8tf4
	dW/A==
Received: by 10.180.101.230 with SMTP id fj6mr4122922wib.13.1334040492397;
	Mon, 09 Apr 2012 23:48:12 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ca3sm26943013wib.6.2012.04.09.23.48.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 23:48:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
Date: Tue, 10 Apr 2012 08:48:25 +0200
Message-Id: <637B72D9-1F2D-4CD3-8903-36E73E7CC465@dominion.thruhere.net>
References: <cover.1334027369.git.lianhao.lu@intel.com>
	<0953244152d03d27f6c60729c58484af81f95a1d.1334027369.git.lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnBV1aqUdWGeat/C0W34rC/O+vn+dsrlbinl+jVbU4WNLY/JkRH5HzEpRQJ1VWS1ZKhkD47
Subject: Re: [PATCH V2 1/1] connman: optionally build ofono plugin.
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
X-List-Received-Date: Tue, 10 Apr 2012 06:57:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

This changes the default behaviour, so it should not go in for 1.2

Op 10 apr. 2012, om 05:16 heeft Lianhao Lu het volgende geschreven:

> Only build ofono plugin when 3g feature is enabled. Also add =
dependency
> to ofono when ofono plugin is being built.
>=20
> This is part of the buf fixing [YOCTO #2216].
>=20
> Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
> ---
> meta/recipes-connectivity/connman/connman.inc |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
> index 1a6dd1b..c3827f1 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -17,6 +17,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> DEPENDS  =3D "dbus glib-2.0 ppp iptables gnutls \
>             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', =
'', d)} \
>             ${@base_contains('DISTRO_FEATURES', =
'wifi','wpa-supplicant', '', d)} \
> +            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} =
\
>             "
>=20
> EXTRA_OECONF +=3D "\
> @@ -30,7 +31,7 @@ EXTRA_OECONF +=3D "\
>     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', =
'--disable-wifi', d)} \
>     ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
>     --enable-dnsproxy \
> -    --enable-ofono \
> +    ${@base_contains('DISTRO_FEATURES', '3g','--enable-ofono', =
'--disable-ofono', d)} \
>     --enable-tools \
>     --enable-test \
>     --disable-polkit \
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



