Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQf6f-00037j-CN
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 16:38:02 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so1293981eaj.33
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=mhliYf703eG6GoRGA9ymhnSLOxh4WDa8DgzXFSOpX+Q=;
	b=oz2PQpSGVTDTHneVZ10MAzKpb/eqphFZ3hbsYkUxQ5Pb6iwSKpyfZJeJc3tnInsaV8
	5zZ5REn2qlh4n/U8oQi9MLW9/OFwfn2ToeaWYrBn22LBvWwpmeNtgBpO1NK2qOS+J7L5
	DBc5EuBfyYI8OZetI5dBdXDekNncNLdWcRNXXpJHcrbxW8gpoJMK9wrT9nRKVFHrmtIU
	yHqxAXyoZyMvlXj4p4/+edDd2T30sEs85EjLXgCFrqhC/WNaXO2V30csvPlfcpCOVFlS
	1sj2w2ZHlSdKX0h+/P7NunDeHyKQpmv9awBzuYNzkvwQ1/0vRbWUamDDp+9Zx2FMxoyf
	/wdQ==
X-Received: by 10.14.210.132 with SMTP id u4mr28686841eeo.19.1365776413120;
	Fri, 12 Apr 2013 07:20:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q5sm11267527eeo.17.2013.04.12.07.20.12
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 07:20:12 -0700 (PDT)
Date: Fri, 12 Apr 2013 16:20:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130412142015.GP2477@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: wpa-supplicant postinsts failing without sysvinit in DISTRO_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Apr 2013 14:38:21 -0000
X-Groupsio-MsgNum: 37830
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+hz2tM55CCA8Ej21"
Content-Disposition: inline

--+hz2tM55CCA8Ej21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

oe-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc

defines pkg_postinst_wpa-supplicant
with:
        if [ "x$DBUSPID" !=3D "x" ]; then
                /etc/init.d/dbus-1 reload || true
        fi

and /etc/init.d/dbus-1 is missing without sysvinit in DISTRO_FEATURES

Thanks to "true" it doesn't fail completely, but if the goal is no
warnings in images then errors should be fixed too :)

Configuring wpa-supplicant.
//var/lib/opkg/info/wpa-supplicant.postinst: line 9: /etc/init.d/dbus-1:
//No such file or directory

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+hz2tM55CCA8Ej21
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoGB8ACgkQN1Ujt2V2gBwFpACbBdyryvTKDVdQh8MYmDaySIfe
lKgAn3jMqOKEC6Oq65vkhkwAW8nbrlll
=eqIB
-----END PGP SIGNATURE-----

--+hz2tM55CCA8Ej21--
