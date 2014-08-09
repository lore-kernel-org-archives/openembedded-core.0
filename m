Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id ABA7860DF7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 10:34:14 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so6472353wgh.26
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bCKJQ0CNQNE4/WBBRl0k7dVXvtleT/0oL9TkAV+awk4=;
	b=GO/QAHn1arM28gIsxXE97yyE1q0+OrXOlhRnrPqp2u1i5/eUCH+wbK7wK8xKSPLBbP
	rwFfhJkYoub2FhUY4DfnafPar0xxVk1ddF+/BkWsz94OXnXFQ3xTAULUfIX3Xva8ejGW
	Eu2PPL/E5CwHuIAKXvPlqIZa6Ki6JaVKtT2wLPnC2IBlPWjt4CXQdP5N48AXfUlp13T+
	UcYlNrg5aKGesF0nONBlW+7aZpxtdYh1Zm5V08bk2iAMQjyidDr6CahBpLjPKkI6inqg
	xaZ/M03eGal+u3Vw0ILB/yO6mVx2L/vPG0FGZEOr8Dp9APwlmTmwdbr7S7xsH2wjlvo4
	8CDA==
X-Received: by 10.180.86.65 with SMTP id n1mr5341148wiz.41.1407580455465;
	Sat, 09 Aug 2014 03:34:15 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	wi9sm23723229wjc.23.2014.08.09.03.34.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 03:34:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Aug 2014 12:34:47 +0200
To: Koen Kooi <koen.kooi@linaro.org>
Message-ID: <20140809103447.GM14848@jama>
References: <1407572810-26063-1-git-send-email-koen.kooi@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1407572810-26063-1-git-send-email-koen.kooi@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nssmyhostname: fix runtime dependencies
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
X-List-Received-Date: Sat, 09 Aug 2014 10:34:17 -0000
X-Groupsio-MsgNum: 56217
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sKEQ01CzIzwqenDk"
Content-Disposition: inline

--sKEQ01CzIzwqenDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 09, 2014 at 10:26:49AM +0200, Koen Kooi wrote:
> This should fix:
>=20
> 19:40 <fabo> ERROR: Unable to install packages. Command '/mnt/ci_build/wo=
rkspace/tmp/sysroots/x86_64-linux/usr/bin/opkg-cl -f /mnt/ci_build/workspac=
e/tmp/work/genericarmv8-oe-linux/linaro-image-minimal/1.0-r0/opkg.conf -o
>              /mnt/ci_build/workspace/tmp/work/genericarmv8-oe-linux/linar=
o-image-minimal/1.0-r0/rootfs --force_postinstall --prefer-arch-to-version =
  install opkg-collateral stress libnss-myhostname2 run-postinsts auto-seri=
al-console
>              util-linux-fsck stress-dbg packagegroup-co
> 19:41 <fabo> sed: can't read /mnt/ci_build/workspace/tmp/work/aarch64-oe-=
linux/nss-myhostname/0.3-r0/image/etc/nsswitch.conf: No such file or direct=
ory

Can you please check which recipe is supposed to install
libnss_myhostname.so.2 and kill it in the other one?

WARNING: The recipe systemd is trying to install files into a shared
area when those files already exist. Those files and their manifest
location are:
   /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/l=
ibnss_myhostname.so.2
   Matched in manifest-qemux86-64-nss-myhostname.populate_sysroot

> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/=
meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> index d8ec863..b9ddeaf 100644
> --- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> +++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
> @@ -13,6 +13,9 @@ SRC_URI[sha256sum] =3D "2ba744ea8d578d1c57c85884e94a304=
2ee17843a5294434d3a7f6c4d67
> =20
>  inherit autotools
> =20
> +# /etc/nsswitch.conf needs to be present
> +RDEPENDS_${PN} =3D "base-files"
> +
>  pkg_postinst_${PN} () {
>  	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
>  		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostnam=
e \3\4\5/' \
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sKEQ01CzIzwqenDk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPl+UcACgkQN1Ujt2V2gBy1AQCghu5gj6DxVpm1RWl/X68P/bla
HLAAoJu7J7pMdXwV3/Zvk1Z/lb9VonkK
=ZHOh
-----END PGP SIGNATURE-----

--sKEQ01CzIzwqenDk--
