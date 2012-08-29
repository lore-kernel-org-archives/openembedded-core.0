Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T6jjp-0007R2-Pc
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 16:59:25 +0200
Received: by wgbdr1 with SMTP id dr1so469428wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 07:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=z9t+7dM0uHxzoFnhXx/d8y82t5JCrAZHMoI1nu5pgDI=;
	b=YNCslzQkW/diQYIAHx6hFqnXN79GQ6IC/kUd7Jh6jHlZeuncwoSnoFQ0j16WqySG+X
	M0MpklZUSQuWhTNHcZhohLy5dayiBzF+rJje7C9Zf/060NRcmWiWUYNkBV1RHdpq+a0J
	/9CeZynL6qtQfDdWzEWqYKG+6wwjrYwnFK3zbYnPNCdFpK2QjItcINNPECdfHcHvTZom
	VZ+rLf4ApdBnuz270RUJQdkarObxthhxR+krs2SJiQvpzYUF04A1/bxon8hM2G2ShICN
	DlySTHK78f0Omw2uQSJdK33WLHM/FL2RQXgnEq8Qn3zrpRms8PXLBORyvxXWNnA1C3IO
	635Q==
Received: by 10.180.20.204 with SMTP id p12mr4292909wie.7.1346251631821;
	Wed, 29 Aug 2012 07:47:11 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id l5sm16076739wix.5.2012.08.29.07.47.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 07:47:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
Date: Wed, 29 Aug 2012 16:47:10 +0200
Message-Id: <1D285050-76EB-4F89-9FB2-0474C5E34102@dominion.thruhere.net>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<ba35808d6976ff17d3732ffcdb56e71f8014137c.1346250187.git.ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQl7u8Daxgn6fd3djOS0diC5o9orp2NYZCPgujKGTry9nvcJ0cMLsSS5kYta3Zh6R6zRIi5g
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Wed, 29 Aug 2012 14:59:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 aug. 2012, om 16:24 heeft Ross Burton <ross.burton@intel.com> het =
volgende geschreven:

> Lots of code (such a GLib) expects this to exist and link to the =
current
> timezone data.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-extended/tzdata/tzdata_2012d.bb |    3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb =
b/meta/recipes-extended/tzdata/tzdata_2012d.bb
> index 31e1266..9741101 100644
> --- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
> +++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
> @@ -5,7 +5,7 @@ LICENSE =3D "PD"
> LIC_FILES_CHKSUM =3D =
"file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a4a29b08=
234"
> DEPENDS =3D "tzcode-native"
>=20
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> inherit allarch
>=20
> @@ -49,6 +49,7 @@ do_install () {
>         # Install default timezone
>         install -d ${D}${sysconfdir}
>         echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
> +        ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} =
${D}${sysconfdir}/localtime

Awesome! I've been campaigning for the symlink solution for a while now. =
Good thing that split-/usr nonsense is over now.=


