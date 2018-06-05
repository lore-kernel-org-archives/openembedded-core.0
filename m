Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9654747A2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jun 2018 10:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 24F1C18378;
	Tue,  5 Jun 2018 12:09:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bDiA9jVci0BB; Tue,  5 Jun 2018 12:09:40 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C1FA818392;
	Tue,  5 Jun 2018 12:09:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6F071E089;
	Tue,  5 Jun 2018 12:09:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A62C1E07B;
	Tue,  5 Jun 2018 12:09:40 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue,  5 Jun 2018 12:09:40 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 8D9112736;
	Tue,  5 Jun 2018 12:09:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 5 Jun 2018 12:09:40 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Tue, 5 Jun 2018 12:09:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Kelly <mkelly@xevo.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v3 1/6] toolchain-scripts: retab file
Thread-Index: AQHT/Fi1WBgxHOcWSkCRFyt67Nh7pqRRcMeQ
Date: Tue, 5 Jun 2018 10:09:40 +0000
Message-ID: <248cbe41837f42c88d3b38cefec71a4b@XBOX02.axis.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
	<20180604230602.8461-2-mkelly@xevo.com>
In-Reply-To: <20180604230602.8461-2-mkelly@xevo.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH v3 1/6] toolchain-scripts: retab file
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
X-List-Received-Date: Tue, 05 Jun 2018 10:09:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Kelly
> Sent: den 5 juni 2018 01:06
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v3 1/6] toolchain-scripts: retab file
>=20
> Two functions is uses a mix of spaces and tabs. The rest of the file
> uses tabs, so switch to tabs uniformly.
>=20
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolch=
ain-scripts.bbclass
> index 71da5e5409..a72436167c 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -122,7 +122,7 @@ toolchain_create_post_relocate_script() {
>  	rm -f $script
>  	touch $script
>=20
> -    cat >> $script <<EOF
> +	cat >> $script <<EOF
>  if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
>      for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
>          \$s "\$1"

This part should be indented using tabs as well.

> @@ -166,13 +166,13 @@ toolchain_create_sdk_siteconfig () {
>  toolchain_create_sdk_siteconfig[vardepsexclude] =3D "TOOLCHAIN_CONFIGSIT=
E_SYSROOTCACHE"
>=20
>  python __anonymous () {
> -    import oe.classextend
> -    deps =3D ""
> -    for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split=
():
> -        deps +=3D " %s:do_populate_sysroot" % dep
> -        for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
> -            clsextend =3D oe.classextend.ClassExtender(variant, d)
> -            newdep =3D clsextend.extend_name(dep)
> -            deps +=3D " %s:do_populate_sysroot" % newdep
> -    d.appendVarFlag('do_configure', 'depends', deps)
> +	import oe.classextend
> +	deps =3D ""
> +	for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE') or "").split():
> +		deps +=3D " %s:do_populate_sysroot" % dep
> +		for variant in (d.getVar('MULTILIB_VARIANTS') or "").split():
> +			clsextend =3D oe.classextend.ClassExtender(variant, d)
> +			newdep =3D clsextend.extend_name(dep)
> +			deps +=3D " %s:do_populate_sysroot" % newdep
> +	d.appendVarFlag('do_configure', 'depends', deps)

This is Python code. I believe the OE-Core standard is for Python code=20
to be indented using four spaces (whereas shell code should be indented=20
using tabs).

>  }
> --
> 2.11.0

//Peter


