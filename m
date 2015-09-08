Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 388A565C8A;
	Tue,  8 Sep 2015 23:09:50 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so2030819wic.0;
	Tue, 08 Sep 2015 16:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+lpVYpjWo8njeLWCAijYWaQSC+Exq8llHAOEBOmq35w=;
	b=mO7km94nX/nBvNmvRHh1sAzt4A7Dko6CBoBhWGQidMaiYnbGKeRTKw1+b9LhcIhGBc
	Cah33MKxvIX8hgAoHgHQnvi9XNy0gDz3tchl4vS6gLne5hRBy5rNKNVUyWWdIX+18wW2
	uJREI2K/WgvEe51ZeELRQy42fD970KCEJJmzwD5z3pQxVx6Fro1nxAPy398o5ZWg/GoS
	pC8q0UnDMlLZFPSWNsIzOOJvu/4updqMjmeilmKAegXJBTe7NfI/WsnJki9Uq+FJ2sn2
	ewD321KmjA/Z6of/Qf7iBOagYU18LVP2j2JT5+cNSH5I9wku4bMt92ULRpNHxu4OTpfR
	JDyg==
X-Received: by 10.180.10.170 with SMTP id j10mr50372004wib.77.1441753790741;
	Tue, 08 Sep 2015 16:09:50 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pu6sm7123496wjc.34.2015.09.08.16.09.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 16:09:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Sep 2015 01:10:37 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20150908231037.GH2381@jama>
References: <20150908155801.GD2381@jama> <20150908170942.GE2381@jama>
	<CALbNGRQYuQrGc_3Bf0y5CVXHHb3uFDVaLgPcfeAKYCau7X1u2g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQYuQrGc_3Bf0y5CVXHHb3uFDVaLgPcfeAKYCau7X1u2g@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, wrong PACKAGE_ARCHs 2015-09-08
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
X-List-Received-Date: Tue, 08 Sep 2015 23:09:52 -0000
X-Groupsio-MsgNum: 70868
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0OWHXb1mYLuhj1Ox"
Content-Disposition: inline

--0OWHXb1mYLuhj1Ox
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 08, 2015 at 11:39:20PM +0200, Andreas M=FCller wrote:
> On Tue, Sep 8, 2015 at 7:09 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > ERROR: polkit-group-rule-datetime different signature for task do_confi=
gure.sigdata between qemux86copy and qemuarm
> > runtaskdeps changed from ['polkitpolkit-group-rule-datetime.bb.do_patch=
', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.bb.do_p=
opulate_sysroot:virtual:native'] to ['polkitpolkit-group-rule-datetime.bb.d=
o_patch', 'polkitpolkit_0.113.bb.do_populate_sysroot', 'shadowshadow_4.2.1.=
bb.do_populate_sysroot:virtual:native']
> > /home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-exten=
ded/polkit/polkit_0.113.bb.do_populate_sysroot with hash 284d6bbd28ea723c46=
6e0c5c88a09a50
> I missed many of these - because I am not up to date on oe-core (did
> not want to loose midori for my images) - will change that soon. For
> this type of error: is it correct that it is caused by allarch recipes
> depending on machine/architecture specific recipes?

close, the important part is few lines bellow:

/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit_0.113.bb.do_populate_sysroot
with hash                              =20
284d6bbd28ea723c466e0c5c88a09a50                                           =
                                                                           =
       =20
 changed to                                                                =
                                                                           =
       =20
/home/jenkins/oe/world/shr-core/meta-openembedded/meta-oe/recipes-extended/=
polkit/polkit_0.113.bb.do_populate_sysroot
with hash                              =20
06cf7139c6588d047fa11444d88175ab                                           =
                                                                           =
       =20
Hash for dependent task polkitpolkit_0.113.bb.do_populate_sysroot
changed from 284d6bbd28ea723c466e0c5c88a09a50 to
06cf7139c6588d047fa11444d88175ab          =20

so allarch recipe polkitpolkit-group-rule-datetime is depending on
TUNE_PKGARCH-specific recipe polkit (on it's do_populate_sysroot task
which is expected to be different for diferent TUNE_PKGARCHs)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0OWHXb1mYLuhj1Ox
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXvauwACgkQN1Ujt2V2gBxyzwCgobGvXGwMDOBkkKmYtaQH3Ya8
bX4AniUIpbgBSuRrlfLuKc/DhYOFX+wb
=pe2U
-----END PGP SIGNATURE-----

--0OWHXb1mYLuhj1Ox--
