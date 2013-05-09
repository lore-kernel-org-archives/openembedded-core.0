Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UaIsu-0007GG-EV
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 06:55:16 +0200
Received: by mail-pd0-f182.google.com with SMTP id 3so1732087pdj.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2013 21:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=pUwoV9kLSYERDIuEYkV4zyNUkVnXBvIxCSTmumlxAAQ=;
	b=N1cpXPby9y1ogSuS1oUgCjbIAWSA2euQpV1ISmzFdjAAJ1mwORdkebjX1CMZdkJHvL
	PH3xNyMkGwg9Heck95zjMyJOuhTfrjgKyY5sFYkJYoyUUZ2QGNOmrPBwFCUo/hzY+NFu
	HSzHwPYV+aJBSesskQUY0nTJSWSqC+Qzff44U2cE5gHkyVqwu+bUtubTXs8fPi9x3sL3
	giTa2jlRZBv0PMTV4UBFynpzxshnDju5rsErMHAU1t0qCMwEg3y+zw/oRUSm+j2NS8Hp
	9f+DihRvbDi3A5K/8/ofyT+CCSOnDp8NrRLoS/cWco5FFCywZIKVYAPnKTeHka28DF8u
	2juQ==
X-Received: by 10.66.241.71 with SMTP id wg7mr11275570pac.155.1368074230040;
	Wed, 08 May 2013 21:37:10 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id gc5sm1390698pbb.19.2013.05.08.21.37.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 21:37:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368013438-15107-3-git-send-email-marcin.juszkiewicz@linaro.org>
Date: Wed, 8 May 2013 21:37:09 -0700
Message-Id: <57346B3A-FB30-46F4-8160-CDC69F206243@gmail.com>
References: <1368013438-15107-1-git-send-email-marcin.juszkiewicz@linaro.org>
	<1368013438-15107-3-git-send-email-marcin.juszkiewicz@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] gdb: move checksums to versioned include
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
X-List-Received-Date: Thu, 09 May 2013 04:55:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

not if we have 1 version.

On May 8, 2013, at 4:43 AM, Marcin Juszkiewicz =
<marcin.juszkiewicz@linaro.org> wrote:

> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
> meta/recipes-devtools/gdb/gdb-common.inc | 3 ---
> 1 file changed, 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gdb/gdb-common.inc =
b/meta/recipes-devtools/gdb/gdb-common.inc
> index 6f42dff..deb3841 100644
> --- a/meta/recipes-devtools/gdb/gdb-common.inc
> +++ b/meta/recipes-devtools/gdb/gdb-common.inc
> @@ -23,9 +23,6 @@ inherit autotools
>=20
> SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.gz \
>           "
> -SRC_URI[md5sum] =3D "b1519bf899890d21d4774845a6e602fe"
> -SRC_URI[sha256sum] =3D =
"f99f26e2c1127f12ba14ece0947a9a9948be45e96b69ef363131e469a698636e"
> -
> export CC_FOR_BUILD =3D "${BUILD_CC}"
> export CXX_FOR_BUILD =3D "${BUILD_CXX}"
> export CPP_FOR_BUILD =3D "${BUILD_CPP}"
> --=20
> 1.8.1.2
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



