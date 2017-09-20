Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id F209F71B9E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 00:22:08 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id s62so880319ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 17:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RQm/HoJDx4WjI8IYnHhTf5hYh1bMRue1u+CH+6Hl6LQ=;
	b=KsJOvXcrYjMAf1SbXHr8xblhJosWPIIsafWv3/l9m6xFmMxplyV8sBoRLuOiHzpTw5
	GKrvEUFvU33Ncx78u8bWEtQF5hxZKB0e+dP2VlDM9Uq+cIpv6+OghbxRnaAIH6+7hHJ7
	rIK0j6Yjrc6dGS4iqwr1fW4Fvy1HD6E2D3FeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RQm/HoJDx4WjI8IYnHhTf5hYh1bMRue1u+CH+6Hl6LQ=;
	b=MQRKLqGFwVJp4NyYxk+n7zZoM2xhzYhf79wsKHe2kL5Qv6axHjaWmmT0+w1D1vlneG
	Bcpsz6fUNdcVs//7X6UbZ/RdBT05LzsCpuSXVnUCBooRoquXqgCQ9KvxCk4qHfIj0f/T
	3Ypy2pIi7KjDiXq8sENyWTBMrsEuKFWDP2sjWfI5D0Se5ZJXFUxuICg4W6EIz1g5Fkkn
	nHa+reE/PF2xZehB/XYvS2aETCHtGoHQ5/8WwqIYLM21KkdKXK8Em0Nlg7wxA+Dd4kP5
	XZy8sHwIKAypQSO8Gms9Cecv1EE6lbLI9r8YwZyzs9A+3/zdqbMiVmJONFgRvLiSBYz2
	q0+g==
X-Gm-Message-State: AHPjjUgrGB5sOrSyccmN4SSZN14xzCCLeLjxM05Raim2EtR9GzMCio7f
	DcLgHUR+9yYmSD2brQjixtj7Cg==
X-Google-Smtp-Source: AOwi7QD3h0kGr/Mc0b1Q8mVY8e2/UoObKE/D0IXyviTdnbC6iNXWhiBOrDyw1HTbD/rFv/NWJPDNeg==
X-Received: by 10.129.173.36 with SMTP id l36mr2428966ywh.138.1505866929927;
	Tue, 19 Sep 2017 17:22:09 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	k132sm261751ywb.48.2017.09.19.17.22.08
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Sep 2017 17:22:08 -0700 (PDT)
Date: Tue, 19 Sep 2017 20:22:08 -0400
From: Tom Rini <trini@konsulko.com>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>
Message-ID: <20170920002208.GP17137@bill-the-cat>
References: <1500674794-23258-1-git-send-email-trini@konsulko.com>
	<8eec536c-80b0-3a8a-a7dd-d96c3bd34006@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <8eec536c-80b0-3a8a-a7dd-d96c3bd34006@prevas.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] image.bbclass: Correct chaining compression support
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
X-List-Received-Date: Wed, 20 Sep 2017 00:22:09 -0000
X-Groupsio-MsgNum: 103151
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vr2UxLU0KdcKBaxP"
Content-Disposition: inline

--Vr2UxLU0KdcKBaxP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2017 at 11:23:33AM +0200, Martin Hundeb=F8ll wrote:
> Hi Tom,
>=20
> On 2017-07-22 00:06, Tom Rini wrote:
> >diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >index de535ce6fcff..bd6a5b7b810a 100644
> >--- a/meta/classes/image.bbclass
> >+++ b/meta/classes/image.bbclass
> >@@ -453,7 +453,7 @@ python () {
> >          rm_tmp_images =3D set()
> >          def gen_conversion_cmds(bt):
> >              for ctype in ctypes:
> >-                if bt[bt.find('.') + 1:] =3D=3D ctype:
> >+                if bt.endswith("." + ctype):
> >                      type =3D bt[0:-len(ctype) - 1]
> >                      if type.startswith("debugfs_"):
> >                          type =3D type[8:]
>=20
> This is the change that in fact messes with our cpio.gz.u-boot image
> types, causing base hash changes.
>=20
> I suspect the changed if-check to be too permissive. In our case, it
> now matches any ctype that ends with ".u-boot", and not just
> "gz.u-boot" as set in IMAGE_FSTYPES.
>=20
> Wouldn't it be correct to match on the entire bt variable? I.e.
>=20
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>=20
> index ef2b38aeaf..818932f7f1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -454,7 +454,7 @@ python () {
>          rm_tmp_images =3D set()
>          def gen_conversion_cmds(bt):
>              for ctype in ctypes:
> -                if bt.endswith("." + ctype):
> +                if bt.split('.', 1) =3D=3D [t, ctype]:
>                      type =3D bt[0:-len(ctype) - 1]
>                      if type.startswith("debugfs_"):
>                          type =3D type[8:]
>=20
> This works for me, preliminary tested with the following fs types
> configured:
>=20
> 	IMAGE_FSTYPES =3D "cpio.gz.u-boot"
> 	IMAGE_FSTYPES =3D "tar cpio cpio.gz cpio.gz.u-boot"
> 	IMAGE_FSTYPES =3D "tar cpio cpio.gz cpio.gz.u-boot tar.bz2 jffs2 wic
> wic.bmap"

Good catch.  Does it also work with say cpio.u-boot.gz ?  And does
oe-selftest still pass for the image related parts?  I think those are
spelled out in the thread too (I've forgotten the incantation myself
now, sorry).

--=20
Tom

--Vr2UxLU0KdcKBaxP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZwbSwAAoJEIf59jXTHXZStQcQAIW8vpRWBUAmcbwW+p0WK2E8
AuTrA5TcDfqTBvV1uzdDXxnoa8/Nn7K+D0Gf/2kQBoDSBduA6sbH3nJJmc0xwkOB
z8IAFEVwUbJ0LpbZ46mx2kzCZp4i48h+rrxAQxFOjiQ2FoeV5ujigv7x3OSk/wTK
hXALOaz4S3DzqsciphebW7Ak8WvBnbtdkyjyQeQ4zE0JFqVJntEd2MlUPc/9ycv5
/VpHR2adawA1zPaq6o25pAdXIGxpRfEfYPbcfwh0zih2BulF5CTSiRv0TpRlBj9D
p/T6tza/pKYH+t15d6sVyCQr1Q0E/Yoy/BOz10EQEvn0HAXYKexP87tGUS0RcxE7
gbspUoQdasp8Cik7fmcODdHttY7sEXA7zaupegPyLE7WlCHFiaApmMDVUhGTLGmI
JtbwLLQkzoFcAloCfIC2q/A9axTJet1GVSb6LpkthnfNrsEJNuXX6cp+opc0mJw5
ZmAfjmqFzrPI/lnvYahsmKzcL4ptWh2nt1YOH92atY+sNYziYfpWolRMufKn6ROx
nUrSNHQNKKrWDwLa6UPW0z1qKolilb33y+30NTsgMDfVwoD5hJvVH+k8smaRetTg
l3CBVQ7xI9RGeiWWdT6cj0LrI1zPz4ENdN2LEDAiZTkwIFnZXHgk+pyclJMdp+Kk
bslr3oDj/nxD0Z8PiRos
=R6yx
-----END PGP SIGNATURE-----

--Vr2UxLU0KdcKBaxP--
