Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8dF-0008TB-Pd
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:42:25 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:31:50 -0700
Received: by lahj13 with SMTP id j13so2476023lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=9rWgNaljTMZWwyhAG6iUcRMdJxZCsJRTETndwhMDmzU=;
	b=pXt9rt6mTePR/8MOjjHiDkquauVub/LuBImKsVRJNu1oNLJuIGsdDWHdsOFFFERYMj
	ZOaXaknYjf5TQ76YO325ITg1424Pk7gP671Zji0tTUzF5e1/4GWQubMSaImn+X1CK1+P
	p3OtpeM+rFPK6bM92iPy7K/p6mR9bTOp9U9UJ6P7mNzIKGFRjoIAlV9uuKbk2FmXyBFW
	J0MD14xgpVGPF65bjBdkdOVda+XygM6h++cREdjk8lz8ncmgi6+mYT1qG+RzdQaJcFHA
	PeGt5T3uFpUgsJWq/eT1Ge8tjUqU15Kx4IDLot90MPzblj7hjVi/JfaxJHxeqle9bFHK
	VlrA==
MIME-Version: 1.0
Received: by 10.112.85.225 with SMTP id k1mr3539880lbz.38.1339435908486; Mon,
	11 Jun 2012 10:31:48 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:31:48 -0700 (PDT)
In-Reply-To: <1338976234-26916-1-git-send-email-cristian.iorga@intel.com>
References: <1338976234-26916-1-git-send-email-cristian.iorga@intel.com>
Date: Mon, 11 Jun 2012 10:31:48 -0700
Message-ID: <CAPhnLPCDcitw2N1cRKdSCGZ41Tp9z-kG02G_-aNDTjYd_W4KRg@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk/LEmGrXC48hp84x/DzyI9UKb3T+mL8g8Xyk4OjJ2FPqrCt4EhxbZWyt7Zek6kT88HG+oc
Subject: Re: [PATCH] telepathy-glib: update to 0.19.0
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
X-List-Received-Date: Mon, 11 Jun 2012 17:42:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 2:50 AM, Cristian Iorga <cristian.iorga@intel.com> w=
rote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
> =A0...thy-glib_0.18.1.bb =3D> telepathy-glib_0.19.0.bb} | =A0 =A04 ++--
> =A01 file changed, 2 insertions(+), 2 deletions(-)
> =A0rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.18.1.bb =
=3D> telepathy-glib_0.19.0.bb} (82%)
>
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb=
 b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
> similarity index 82%
> rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
> rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
> index 81da5f8..6c4e12c 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.18.1.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
> @@ -7,8 +7,8 @@ PR =3D "r0"
>
> =A0SRC_URI =3D "http://telepathy.freedesktop.org/releases/telepathy-glib/=
${BPN}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] =3D "461732739e3fbf8467991bbe661fb29a"
> -SRC_URI[sha256sum] =3D "3738256689e34c22ddf9c4eb33f44ce7505c18fb1a14c53b=
8e56dd9c262f4c6d"
> +SRC_URI[md5sum] =3D "a4a01b748b6b7134853a561228fe70e4"
> +SRC_URI[sha256sum] =3D "f2ed6a5207cb579f6807f6f37d4d379a65208c3e094288e5=
7655238b7afd3d66"
>
> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De413d83db6ee8f2c8e605571909=
6a48e"
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Merged into OE-Core

Thanks

-b

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


