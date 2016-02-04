Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7778A73CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 21:01:42 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id uo6so21810093pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Raje12372fn8nSKqQCfWerUn9IMV32ik5hrupKtAMAI=;
	b=ip7buH/vUGoImvySvFMiCKY/Caww0ZI7Idyv3MXf3Hf9BPaFJg6Rl3IhQyZ0rlNmno
	4zFdEJbGqMB3DmQ0afperVh391WzSU7s3nXDG5f7alsLvSIauVT7KLC/XC5tM3nD9SiL
	61bnThAGiIZByaFXHyLX8w5aCDlzaEhVErlONjXzoO9YM+jnkO4lsbB3+3t2XY4yDw9l
	+jMBolvI4I0jh1kld5QmleuiO6obOEdwSamR9j1O8ovRamRT3Kvl3l+85NMlmLkt7Mfs
	bbcWRDmPAVMEaQNDApktYBqv9bpa8S9cIsTA4rpE2PiHxBGYs8Jnfd5egXAar/Hotlmx
	Sekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=Raje12372fn8nSKqQCfWerUn9IMV32ik5hrupKtAMAI=;
	b=AtEmh3QrUEK2GILqOdM2yyBADusZFoVpQtUxmo7r/wofIwPRBtUA2gQDEn8C4tvDBq
	JA1CYcLEoGmj6f1x8MiF2rOE1eC7mKkyf2GwDUUSojKemdlTJd+e9ZcqoPBOfPR3GVHN
	U9AjG/MisPHgarfZ+/MFWaNv45DZ9SKNib1sqVjk7qKs9dY5MlVeX3Xnj+7IwoI77giI
	jR8eJI8RhCvM1BMkBQd0Yyh4gStQtWZAzWP6eT0wkKYoru6jvLXks84E5nwDBnTCmmlf
	95cXY7WttVBJ3BrU5hxTobSDEs16v6Z67j1vzdMdY30A00922nT3zJW++pZVZtkiO9vZ
	j2lA==
X-Gm-Message-State: AG10YOTUGbIrWT2HCscaHQ8cKm0CB6QjYEbESYdzlEwV/M/7Kdx2X5gNmMSBHXcX4aGxew==
X-Received: by 10.66.140.14 with SMTP id rc14mr14193417pab.65.1454619702829;
	Thu, 04 Feb 2016 13:01:42 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:9133:1246:6e97:60b1?
	([2601:646:8802:5d5c:9133:1246:6e97:60b1])
	by smtp.gmail.com with ESMTPSA id
	p21sm19185741pfj.67.2016.02.04.13.01.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Feb 2016 13:01:41 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1454616759-20614-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
Date: Thu, 4 Feb 2016 13:01:37 -0800
Message-Id: <792F6F91-ECBE-46AD-BC72-ED6A199B696E@gmail.com>
References: <1454616759-20614-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] udev: add runtime dependencies for udev-cache
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
X-List-Received-Date: Thu, 04 Feb 2016 21:01:42 -0000
X-Groupsio-MsgNum: 77550
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6B61138B-4284-4307-93CF-3DF50238590C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6B61138B-4284-4307-93CF-3DF50238590C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 4, 2016, at 12:12 PM, Ricardo Neri =
<ricardo.neri-calderon@linux.intel.com> wrote:
>=20
> udev-cache uses find and xargs, which are provided by findutils. It =
also
> uses gzip, which is provided by gzip. These utilities need to be =
present
> when udev-cache runs. Thus, add them as RDEPENDSs.
>=20
> Otherwise, if busybox is not included in the built image, the =
following
> errors could be observed when booting if such packages are not =
present:
>=20
>    /etc/rcS.d/S36udev-cache: line 66: xargs: command not found
>    /etc/rcS.d/S36udev-cache: line 65: find: command not found
>    /etc/rcS.d/S36udev-cache: line 67: gzip: command not found
>=20
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
> ---
> Changes since v1:
> * Narrow the dependency only to udev-cache
> * Reword the commit message to mention that the issue is only
>   reproducible if busybox is not included in the image.
> ---
> meta/recipes-core/udev/udev.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/udev/udev.inc =
b/meta/recipes-core/udev/udev.inc
> index 93d7369..4e8e758 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -38,6 +38,7 @@ SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
>=20
> inherit autotools pkgconfig update-rc.d ptest
> RDEPENDS_${PN}-ptest +=3D "make perl python"
> +RDEPENDS_${PN}-cache +=3D "gzip findutils=E2=80=9D

are they individually packaged ipks even with busybox ?
if not then this fix is insufficient

>=20
> libexecdir =3D "${base_libdir}"
> EXTRA_OECONF =3D "--disable-introspection \
> --
> 1.9.1
>=20


--Apple-Mail=_6B61138B-4284-4307-93CF-3DF50238590C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlazvDQACgkQuwUzVZGdMxRzkgCffR5saX7ebqVvcijXVIZTxHEv
BOoAniRlNfWC4pbgKPkq7/Xkdcm+xuyL
=XXOp
-----END PGP SIGNATURE-----

--Apple-Mail=_6B61138B-4284-4307-93CF-3DF50238590C--
