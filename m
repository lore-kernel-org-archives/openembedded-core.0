Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1EE6E688
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 16:05:49 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u188so104359203wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 08:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OCR1MMobNN0DSRjRRXhHrpWHOzrKcgAOGkNNuDB/LUc=;
	b=odwfIJfL4EXcgYx2V+h8ZRGhePDmYU4N0t/CbOjvjqwB+jTi+Ctkyea70xI+ppMlAc
	pwdgEwI4Gv8oPZ1hgGEKEYPK9q5MPRKpFx7cifqtJI1Z7IM0jRXQNcsfhoEbiTkzAr8T
	98iRnnAbIdoLSkmMAiQplExlHB7Uy4E7NrAwHzucBTnq6LxuXzYSWAWifVF/br0EV1bY
	lc8+dPKtnhJ/UMEGXUpvXqNx2IMe7c49jlpgVL+ik/sF9rty2Ey5E1IEP7UA2hQePD6x
	kSiZAM2/tH2ogTuV86Kfo7axZdNlEil+EPB4nqVujIKZb71oM4yj8xfRA7VJIJ9AWqws
	zkRw==
X-Received: by 10.194.171.66 with SMTP id as2mr13638106wjc.73.1452182749874;
	Thu, 07 Jan 2016 08:05:49 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i63sm14212651wmf.24.2016.01.07.08.05.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Jan 2016 08:05:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 7 Jan 2016 17:06:14 +0100
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20160107160614.GF2512@jama>
References: <cover.1452096306.git.ross.burton@intel.com>
	<568E8B9F.1040700@gmail.com>
MIME-Version: 1.0
In-Reply-To: <568E8B9F.1040700@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/63] Consolidated pull
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
X-List-Received-Date: Thu, 07 Jan 2016 16:05:51 -0000
X-Groupsio-MsgNum: 75578
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E7i4zwmWs5DOuDSH"
Content-Disposition: inline

--E7i4zwmWs5DOuDSH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 11:00:31AM -0500, Trevor Woerner wrote:
> With this applied bitbake can't parse meta-openembedded because
>=20
> meta-openembedded/meta-oe/recipes-devtools/python/python-pyqt_4.11.3.bb:2=
5:
> Could not inherit file classes/qmake2.bbclass
>=20
> unless the user adds git://git.yoctoproject.org/meta-qt4 to their layers.
>=20
> Should this recipe be also moved to meta-qt4?

See openembedded-devel changes I've just sent or master-next.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E7i4zwmWs5DOuDSH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaOjPUACgkQN1Ujt2V2gBzmfACaA9S9OTDL6FsnzbfBu9tgx8Dz
HKsAni6mJLGxCcG6Q322d+m+9JA5tMxL
=DLCG
-----END PGP SIGNATURE-----

--E7i4zwmWs5DOuDSH--
