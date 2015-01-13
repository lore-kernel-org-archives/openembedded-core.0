Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id AAC6871F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 21:08:48 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id l2so5346505wgh.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 13:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=pb1Vhh6WsEKEfwRxQpN38gtdOooDfP8/ck7BZL0tVVI=;
	b=BRGuiJVapnWhyjaQbSeg5crxcRFD3TSf6/YWGEt5BzHaal4Yj/u2RY970nc/VRvxqp
	HpIn79MrjROTO9+87BXzQOY+Ooh6KjepqdPUjTr/+so1CJVU9xsU9bUhRjx77JywZT4c
	slql2HyiDm/DxuZ3vwwtsIBlFneI87yCTubkeTGNYat3E1XeA9+3Kq3u2oG5HSMe3aks
	bGL5oPgs1/LLPih69b5XEIpROvjYbzpwCq4HFmbUEkH0fnPZ09kAWqK8i/ndQPY3hGXG
	ra+XK822lyW4pycs8QL5wIh09wEgVNHmGO5/Py3x2PF3IgudcCkJFxKpNey2gO+NzjS2
	uBYw==
X-Received: by 10.194.108.98 with SMTP id hj2mr746462wjb.102.1421183328809;
	Tue, 13 Jan 2015 13:08:48 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id fw6sm523591wib.1.2015.01.13.13.08.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Jan 2015 13:08:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 13 Jan 2015 22:08:49 +0100
To: openembedded-core@lists.openembedded.org
Message-ID: <20150113210849.GC2478@jama>
References: <1421175733-22762-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1421175733-22762-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [RFC][PATCH] WIP: feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb suffix
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
X-List-Received-Date: Tue, 13 Jan 2015 21:08:51 -0000
X-Groupsio-MsgNum: 61324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SWTRyWv/ijrBap1m"
Content-Disposition: inline

--SWTRyWv/ijrBap1m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 08:02:13PM +0100, Martin Jansa wrote:
> * this means that recipes with ARM_INSTRUCTION_SET explicitly changed
>   to arm will be built in feed without thumb suffix, the same does apply
>   for workdir, e.g. after "bitbake glib-2.0" you can see:
>=20
>   tmp-glibc/work/armv5e-oe-linux-gnueabi:
>   glib-2.0  glibc  glibc-initial
>=20
>   tmp-glibc/work/armv5te-oe-linux-gnueabi:
>   acl              db              gdk-pixbuf     kmod  ....
>=20
>   and
>=20
>   tmp-glibc/deploy/ipk:
>   all  armv5e  armv5te  qemuarm
>=20
> * feed config should be ok, because all default DEFAULTTUNEs always
>   include "arm" variants of all supported PACKAGE_ARCHs
>=20
> * for more details see
>   http://lists.openembedded.org/pipermail/openembedded-core/2014-April/09=
1960.html
>   the toolchain path issues were resolved in 1.8

One more issue is left.

ERROR: Logfile of failure stored in: /OE/build/oe-core/tmp-glibc/work/armv5=
te-oe-linux-gnueabi/glibc-locale/2.20-r0/temp/log.do_install.21696
Log data follows:
| DEBUG: Executing shell function do_install
| ls: cannot access /OE/build/oe-core/tmp-glibc/sysroots/qemuarm/usr/includ=
e/glibc-locale-internal-armv5te-oe-linux-gnueabi//usr/bin: No such file or =
directory
| ls: cannot access /OE/build/oe-core/tmp-glibc/sysroots/qemuarm/usr/includ=
e/glibc-locale-internal-armv5te-oe-linux-gnueabi//usr/lib/locale: No such f=
ile or directory
| cp: cannot stat '/OE/build/oe-core/tmp-glibc/sysroots/qemuarm/usr/include=
/glibc-locale-internal-armv5te-oe-linux-gnueabi/SUPPORTED': No such file or=
 directory
| WARNING: /OE/build/oe-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/glibc-=
locale/2.20-r0/temp/run.do_install.21696:1 exit 1 from
|   cp -fpPR /OE/build/oe-core/tmp-glibc/sysroots/qemuarm/usr/include/glibc=
-locale-internal-armv5te-oe-linux-gnueabi/SUPPORTED /OE/build/oe-core/tmp-g=
libc/work/armv5te-oe-linux-gnueabi/glibc-locale/2.20-r0
| ERROR: Function failed: do_install (log file is located at /OE/build/oe-c=
ore/tmp-glibc/work/armv5te-oe-linux-gnueabi/glibc-locale/2.20-r0/temp/log.d=
o_install.21696)
ERROR: Task 297 (/OE/build/oe-core/openembedded-core/meta/recipes-core/glib=
c/glibc-locale_2.20.bb, do_install) failed with exit code '1'

glibc-locale and glibc-scripts have PKGARCH in path, but because glibc is "=
arm" it's actually installed in armv5e (not armv5te):

/OE/build/oe-core/tmp-glibc/sysroots/qemuarm/usr/include/glibc-locale-inter=
nal-armv5e-oe-linux-gnueabi/
/OE/build/oe-core/tmp-glibc/sysroots/qemuarm/usr/include/glibc-scripts-inte=
rnal-armv5e-oe-linux-gnueabi/

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/machine/include/arm/feature-arm-thumb.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/include/arm/feature-arm-thumb.inc b/meta/c=
onf/machine/include/arm/feature-arm-thumb.inc
> index 8e6619d..4c4eb6d 100644
> --- a/meta/conf/machine/include/arm/feature-arm-thumb.inc
> +++ b/meta/conf/machine/include/arm/feature-arm-thumb.inc
> @@ -32,7 +32,8 @@ python () {
>  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ' -m${A=
RM_M_OPT}', '', d)}"
>  OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', ':thumb',=
 '', d)}"
> =20
> -ARMPKGSFX_THUMB .=3D "${@bb.utils.contains('TUNE_FEATURES', 'thumb', '${=
ARM_THUMB_SUFFIX}', '', d)}"
> +# Add suffix from ARM_THUMB_SUFFIX only if after all this we still set A=
RM_M_OPT to thumb
> +ARMPKGSFX_THUMB .=3D "${@ d.getVar('ARM_THUMB_SUFFIX', True) if d.getVar=
('ARM_M_OPT', True) =3D=3D 'thumb' else ''}"
> =20
>  # Whether to compile with code to allow interworking between the two
>  # instruction sets. This allows thumb code to be executed on a primarily
> --=20
> 2.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SWTRyWv/ijrBap1m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlS1iWEACgkQN1Ujt2V2gByYJACgk1luGVgtCUTZqlvf3/kOvYUA
akYAnRo4c6swDQqQqRMA/hGDIzZoQcTa
=mwMn
-----END PGP SIGNATURE-----

--SWTRyWv/ijrBap1m--
