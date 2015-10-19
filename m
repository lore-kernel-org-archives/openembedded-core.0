Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 228C47705F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:08:58 +0000 (UTC)
Received: by wikq8 with SMTP id q8so2533341wik.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Dk7XNBiC6LkNjCdzRIhWVYFkRk3CuAuDMW23BB3clKE=;
	b=N7yb4hCGBmOh5nmIh/7/jx6Dn8kkxCW9m+UiNufhIDYzEazHrVMTddt4Vn8OuMYauM
	mtlvW9JnTzTfCuXvm+KIkUCDkaGlSM+I0kMhJdD41JfsBSqR0ETpJB4jRy3DEUUcUhUE
	d575nAGfsi/GHl2i59pBu+IirISWv3fmarqdM4v0K4YOLittr0mAZrpEgTLWbmmfA5U3
	BdOVNCb2jKqoY2mGYKsnyDAq98ejYx7Eu80s/V1VHlgXC4YOE1/0mB3RtHxUUHxVDPcQ
	+XJpMf0buBGPK0YIG77cNoZtgjaiRN/qpXwq6vKnmSh0D9qstmCBgxUabWwPExNW58Rn
	9G2Q==
X-Received: by 10.194.236.200 with SMTP id uw8mr32008778wjc.126.1445256538125; 
	Mon, 19 Oct 2015 05:08:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	y17sm1008528wib.15.2015.10.19.05.08.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 05:08:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 19 Oct 2015 14:09:04 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20151019120904.GB2549@jama>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<1445249129-1475-2-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1445249129-1475-2-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] sanity: check that the host has file installed
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
X-List-Received-Date: Mon, 19 Oct 2015 12:08:59 -0000
X-Groupsio-MsgNum: 72328
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VrqPEDrXMn8OVzN4"
Content-Disposition: inline

--VrqPEDrXMn8OVzN4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 11:05:28AM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sanity.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 34f8618..a1fed36 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -3,7 +3,7 @@
>  #
> =20
>  SANITY_REQUIRED_UTILITIES ?=3D "patch diffstat makeinfo git bzip2 tar \
> -    gzip gawk chrpath wget cpio perl"
> +    gzip gawk chrpath wget cpio perl filex"

file or filex?

> =20
>  def bblayers_conf_file(d):
>      return os.path.join(d.getVar('TOPDIR', True), 'conf/bblayers.conf')
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VrqPEDrXMn8OVzN4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYk3V8ACgkQN1Ujt2V2gBxVtgCgrEqAz0hygmCyMxHpxPQlLSp7
pHAAn0YpP10FQAwL5/5YI41WluymW66F
=OYgp
-----END PGP SIGNATURE-----

--VrqPEDrXMn8OVzN4--
