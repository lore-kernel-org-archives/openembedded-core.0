Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1S7iS3-000193-IL; Wed, 14 Mar 2012 08:16:51 +0100
Received: by wibhj13 with SMTP id hj13so5745404wib.6
	for <multiple recipients>; Wed, 14 Mar 2012 00:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Vv2xRUBG2xEWunvn2x8SJpCEM9NJfmpplrGmyd4lPXc=;
	b=jBKkrserQaAi9VPKxnElkvT/vFmPNL0osluhWqPXbD4DH2J+LgTh2ituVAxk9onUDN
	J2tSzB3kLRjB3WxmVuwRfbxcc7ix2JcdFBJ45ehJirejpxrYlZ1nMdEyDDnaM+VlU6ac
	csGO2vQrNTI9BkVlsyuCWLeC6SuwyrRN/9xm/5ENcbNB/QnuoQAIR+Ba1QS9gcm017XE
	OWWa0p4cbq4zeEyns7bqZSWMPjocLb+2tNYyRS/QSbsThqdD1vo/VNvfUi0TeQEX7FWQ
	9xjIlInKTMIoqdARVdwOiCEGNP6+bXalBiN9qyc+c/2zYF8uR9xFcHofq754g/nocT1J
	qxJw==
Received: by 10.216.197.211 with SMTP id t61mr931087wen.1.1331708886583;
	Wed, 14 Mar 2012 00:08:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k7sm12982036wia.5.2012.03.14.00.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 00:08:05 -0700 (PDT)
Date: Wed, 14 Mar 2012 08:08:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120314070803.GB3919@jama.jama.net>
References: <20120313114820.9572210335@opal>
MIME-Version: 1.0
In-Reply-To: <20120313114820.9572210335@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Andreas Oberritter : qt4: fix deps in libQtWebkit.la and QtWebKit.pc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 07:16:51 -0000
X-Groupsio-MsgNum: 18760
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0eh6TmSyL6TZE2Uz"
Content-Disposition: inline

--0eh6TmSyL6TZE2Uz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 13, 2012 at 11:48:20AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 4c41a3204ef72f53813ddc86fe525fa9c6714daa
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D4c41a3204ef72f53813ddc86fe525fa9c6714daa
>=20
> Author: Andreas Oberritter <obi@opendreambox.org>
> Date:   Wed Mar  7 21:36:28 2012 +0100
>=20
> qt4: fix deps in libQtWebkit.la and QtWebKit.pc
>=20
> * Both files contain -L../../WebCore/release -L../../JavaScriptCore/relea=
se -lwebcore -ljscore
> * These paths and libs don't get installed.
> * When building a shared lib with libtool, that links
>   with libQtWebKit, libtool adds these unneeded parameters
>   to the linker command-line, thus linking fails.

BTW: here with bitbake having R/W to rootfs every qt4-x11-free build
creates /include/WebCore/libdummy.prl (yes really in root)
anynone seen this?
-rw-r--r-- 1 bitbake bitbake 680 Mar 14 01:13 /include/WebCore/libdummy.prl

Maybe it's sign of another small issue in qt4 build.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0eh6TmSyL6TZE2Uz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9gQ9MACgkQN1Ujt2V2gBzIPACgsHNXdznAj8gDmMfxe0jeTiD2
bU4AoLcixPL72RmIkYb2IIaTQHkXNbbN
=z6GF
-----END PGP SIGNATURE-----

--0eh6TmSyL6TZE2Uz--
