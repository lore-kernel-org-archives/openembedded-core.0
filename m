Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T8Zi1-0000uA-QJ
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:41:09 +0200
Received: by wibhq4 with SMTP id hq4so3594070wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 09:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=b2lAugEy2wVXgbYuGej/IxyA8Nfy5sp6wgHLrUUQem8=;
	b=ZHWXItDmZA+NsuAry5iB8kxsriOVFiyHbDLCIcc8Bcn7tX0SzEMrZ9mRSVhOLMosEc
	0Bmg2kKDrSpMbw6YBih1ZE8DzWNHr/9NUtfA7ZYMfeW7KhSscYzkyquKOYGnRqt9LRzL
	YAi1tu5K+Mgs8PWS+3wbHYMHZgp75S4N9VJExy2bA89avQFTIWL0rO61JMX/41IQ+iUf
	+RhyCh1vM1DhW//3zrJhiJEFcu3UxCaLH+dLuIZq2HZz4qInLk93PiaLLsf47x5q/4UO
	TXL1jINXvBtAAbQ5mkrNp+LIf6Mpw4fFaPOh5AP1wttMCfKa/XsfqKfJV3urwpksfxU1
	lD7g==
Received: by 10.180.93.68 with SMTP id cs4mr24432719wib.14.1346689729401;
	Mon, 03 Sep 2012 09:28:49 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id j6sm29039666wiy.4.2012.09.03.09.28.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 09:28:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 3 Sep 2012 18:28:33 +0200
Message-Id: <C405C0B3-2E8B-4B20-BD35-E3AD9F6C45FA@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkpAe73zC5nMIaKdaSNcXCtcYhBrn+HQqUdihfn/DZZhJtnTFyh0S3sgMJoyq5XAUpT3sY8
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [for-denzil][meta-oe][PATCH 01/11] xz: updated to version 5.1.1alpha
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 16:41:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Ping for all 11 patches

Op 28 aug. 2012, om 08:41 heeft Koen Kooi <koen@dominion.thruhere.net> =
het volgende geschreven:

> From: Valentin Popa <valentin.popa@intel.com>
>=20
> The licenses are the same, only some white spaces added/removed.
>=20
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> .../xz/{xz_5.0.3.bb =3D> xz_5.1.1alpha.bb}           |   10 +++++-----
> 1 files changed, 5 insertions(+), 5 deletions(-)
> rename meta/recipes-extended/xz/{xz_5.0.3.bb =3D> xz_5.1.1alpha.bb} =
(72%)
>=20
> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb =
b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> similarity index 72%
> rename from meta/recipes-extended/xz/xz_5.0.3.bb
> rename to meta/recipes-extended/xz/xz_5.1.1alpha.bb
> index e8f96b6..7fa7177 100644
> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
> +++ b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
> @@ -4,17 +4,17 @@ SECTION =3D "base"
>=20
> LICENSE =3D "GPLv2+ & GPLv3+ & LGPLv2.1+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dc475b6c7dca236740ace4bba553e8e1c \
> -                    =
file://COPYING.GPLv2;md5=3D751419260aa954499f7abaabaa882bbe \
> +                    =
file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>                     =
file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
> -                    =
file://COPYING.LGPLv2.1;md5=3Dfbc093901857fcd118f065f900982c24 \
> +                    =
file://COPYING.LGPLv2.1;md5=3D4fbd65380cdd255951079008b364516c \
>                     =
file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 =
"
>=20
> SRC_URI =3D "http://tukaani.org/xz/xz-${PV}.tar.gz"
>=20
> -SRC_URI[md5sum] =3D "fefe52f9ecd521de2a8ce38c21a27574"
> -SRC_URI[sha256sum] =3D =
"10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
> +SRC_URI[md5sum] =3D "bb24436fa12780808e1c142980484104"
> +SRC_URI[sha256sum] =3D =
"54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
>=20
> -PR =3D "r1"
> +PR =3D "r0"
>=20
> inherit autotools gettext
>=20
> --=20
> 1.7.7.6
>=20



