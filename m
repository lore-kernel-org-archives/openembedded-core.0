Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQc8O-0001dc-SB
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 13:27:17 +0200
Received: by mail-pb0-f53.google.com with SMTP id un15so1355232pbc.26
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 04:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=cAhei/8ZXLzeA5EybxBavobJhqBdUoLdt68u6GHEQjw=;
	b=hVd4nAWLOpysRVlhTyNyur4r5MXyWPsxr+iE8PhQrK4/bXXcAD+uiAvDNKYyZRJUUb
	p1FpaSBMdAu00Eir5kzo2NYsNqlrY0B0YEFXDRb1UVqu3Ljvw8o00Q9Twc3crtUWd0iI
	+DGGr0FyP7laP2Zbp2pNo4x0XvSlyoEiHVyJuusH9Xlet8VG9TFJpdFnw16aGsiB0UEr
	4GxiL40KNg1BV3/G0Sm5oJAlckYPyo3ypA56MAEV77CvUfXx0mALlWLazlgjhGA5ihkh
	4Hsr90CbNF55RhOtIcWxq8p/xBM4FMgyiqVbA3WbHiQNAgUeY3LE+mCW9ap+ZUfqVakK
	ad3g==
X-Received: by 10.66.25.147 with SMTP id c19mr14598712pag.207.1365764987933;
	Fri, 12 Apr 2013 04:09:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fq1sm8150047pbb.33.2013.04.12.04.09.45
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 04:09:46 -0700 (PDT)
Date: Fri, 12 Apr 2013 13:09:41 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130412110941.GM2477@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: systemd postinsts failing when trying to enable masked service
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
X-List-Received-Date: Fri, 12 Apr 2013 11:27:25 -0000
X-Groupsio-MsgNum: 37823
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="F7w+4yMapWozG0Ib"
Content-Disposition: inline

--F7w+4yMapWozG0Ib
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

We had crond.service masked to prevent crond sysvinit script being
started.

Now with crond.service pulled by PN (cronie) it tries to start it and
fails:

Configuring cronie.
Failed to issue method call: Unit crond.service is masked.

I guess I can disable it again with SYSTEMD_AUTO_ENABLE or keep it
enabled now with both sysvinit and systemd scripts available in image,
so just FYI (this could be another reason why run-postinsts are failing
for some people on first boot of systemd images..).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--F7w+4yMapWozG0Ib
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFn63UACgkQN1Ujt2V2gBzzQACbBh2vWW5RX5W3I6GqY9S1aU+6
daMAn2tIG0BIEyfmYwmEEVrvolZAWXkS
=Ixxa
-----END PGP SIGNATURE-----

--F7w+4yMapWozG0Ib--
