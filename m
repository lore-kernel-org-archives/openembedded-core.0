Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7396067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:24:13 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id i5so71949168wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-disposition
	:user-agent; bh=ZvaOBNfAlvEr2BvmTA04DxznFKk/Lh7R3VH+VVRZusU=;
	b=Bh7sK//E0biyHkKaEqRY13ajpaveRP/sgHuj1ncbvXu1Gfh/RGlT7Odf4BSGEdmrqG
	/OlIn3rZd/d6WqQzoyeqQ7vkcS9FusJSTheoYrIdQy68B5fz+akijBojkk3BgunYdq7S
	epuDv9oaqA/kC3dAWN4oS9pRPCcDwwZLuTykvoLvkVIlcnSy1scucWBQrpojOL8K3LUr
	xxZqTJN4FeI5R0y5IkerurTorqjYERurAZAfQiUfk4DIupPb2F32qHYaVU+pojXCiB66
	nar57vuvVSH0v+W1TLBCdVOJUxYZVmnnAxBvsqbRLE9Qy9jzEfAAh8iSpQAAa4/3jIro
	SsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:mime-version
	:content-disposition:user-agent;
	bh=ZvaOBNfAlvEr2BvmTA04DxznFKk/Lh7R3VH+VVRZusU=;
	b=fSJtg7K7/WzET3lJQfxBmCYLlfOGWemk8+67HmCdhlXlHBkZysd54jKyn17V18qxv4
	N2NlrY7GGFluvU/vhDaKBidKSvKLmcGKtFVyv0pIpbQ/rr14P0tYMjGoOztbA1urcBOl
	Q3yxR9dWkj94UqlUJ0s4T2PPeLbs8LYZI8vA+2veUww1MallRN9GSXb35deX065i0WOw
	4zo+8LkUwkARbd0xF8Ia9eWbeLsxd9u5nFO5VuGa7XbKLp5nN9JyERYym1IGALXAZlNy
	+Fi36d7YVbhungN3Qg8yAxZ/X8L0JFhew1EMtpQZ1WPdoazrl5zyvzLkjG1FURX+5bUw
	zuxA==
X-Gm-Message-State: ALyK8tJVKR3kVBmTrYRCAAh1wkNTDGVkItyzX5mFeK+mFe74H0smWIDF+uWFYL5nDCzGrg==
X-Received: by 10.28.223.139 with SMTP id w133mr4946346wmg.90.1468419852762;
	Wed, 13 Jul 2016 07:24:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bf3sm1162393wjc.45.2016.07.13.07.24.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jul 2016 07:24:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Jul 2016 16:24:22 +0200
To: OE-core <openembedded-core@lists.openembedded.org>
Message-ID: <20160713142422.aihj4b5qmni7uair@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Downloads from sourceforge.net
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
X-List-Received-Date: Wed, 13 Jul 2016 14:24:16 -0000
X-Groupsio-MsgNum: 84464
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="csylf73ypnnpoayi"
Content-Disposition: inline

--csylf73ypnnpoayi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Just FYI

If you're seeing a lot of do_fetch failures because of SRC_URI checksums
mismatch, be aware that there is some issue with sourceforge.net, all my
source archive downloads (with wget) download just this HTML:

wget http://downloads.sourceforge.net/project/gptfdisk/gptfdisk/0.8.10/gptf=
disk-0.8.10.tar.gz

<html><head>
<title>SourceForge</title>
<!-- <script src=3D"/js/jquery.com/jquery-1.11.0.min.js"></script> -->
<script src=3D"//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src=3D"//sourceforge.net/js/mirrors.js"></script>
<script src=3D"/js/sf.js"></script>
<script>
var DR_loc =3D DR_parse_hash_url();
if (DR_loc) {
    DR_sf_main(DR_loc);
} else {
    window.location.href =3D 'http://sourceforge.net/home.html';
}
</script>
</head><body>
<noscript>
We're sorry -- the Sourceforge site is currently in Disaster Recovery mode,=
 and currently requires
the use of javascript to function.  Please check back later.
</noscript>
</body></html>

Which of course has different checksums than tarball with sources.

You can see similar message if you try to access e.g. their blog (to find o=
ut if it's already
known issue for them):
http://sourceforge.net/blog/
or
http://sourceforge.net/blog/category/sitestatus/

Until it's resolved continue to use your better-be-already-populated premir=
rors.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--csylf73ypnnpoayi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleGTxQACgkQN1Ujt2V2gByXNACfSIEj8CXFDi+fdCmpZHL97knZ
twIAn11n1hm6hVjzRCjIM+7x/O6V9bXn
=mLJP
-----END PGP SIGNATURE-----

--csylf73ypnnpoayi--
