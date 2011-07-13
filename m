Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qgsqz-0002MV-Pw
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 08:23:25 +0200
Received: by iym10 with SMTP id 10so5449685iym.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 23:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=DxlUJBsMGminathS7qb0EllJ8qMxDpBx4XkeuSOCSZE=;
	b=agPxO06+VfICG07zNHzE32/DM9aXYU/qHWsWAsVoXDXkHY/bW147GzaQradtwD9qh4
	P0BQr/6MwHoFOwaL0aT7+upVqw8FjdMJpQ/Lk5+DKEjUGpP6zyqOSnuAKau0JPTNZ6RN
	v6so9fgNaAlSFPDs6simclnY+Bp3bVCvqKxxk=
Received: by 10.42.168.133 with SMTP id w5mr772698icy.118.1310537966297;
	Tue, 12 Jul 2011 23:19:26 -0700 (PDT)
Received: from [192.168.1.81] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id j7sm15652633icq.2.2011.07.12.23.19.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 23:19:25 -0700 (PDT)
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
	<af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
In-Reply-To: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
Mime-Version: 1.0 (iPad Mail 8J2)
Message-Id: <0FDDF2A7-BB8C-46D1-B0AE-985C71CCFFBB@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (8J2)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jul 2011 23:20:02 -0700
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] siteinfo.bbclass: hack for x32
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
X-List-Received-Date: Wed, 13 Jul 2011 06:23:26 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



On Jul 12, 2011, at 12:02 PM, nitin.a.kamble@intel.com wrote:

> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> meta/classes/siteinfo.bbclass |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass=

> index 78b7008..035355f 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -59,6 +59,9 @@ def get_siteinfo_list(d):
>                "x86_64-linux":            "endian-little bit-64 common-gli=
bc",\
>                "x86_64-linux-uclibc":     "endian-little bit-64 common-ucl=
ibc"}
>        if target in targetinfo:
> +                  target_cc_arch =3D bb.data.getVar('TARGET_CC_ARCH', d, 1=
)
> +               if target_cc_arch =3D=3D "-mx32":
> +                     target =3D "i686-linux"

What would/could target be when using -mx32 ?
I suppose it's one of the entries in dictionary above=20



>                info =3D targetinfo[target].split()
>                info.append(target)
>                info.append("common")
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


