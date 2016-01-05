Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 26AC7731CC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:56:00 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id u188so30626197wmu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 08:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wesBgqkFFeLL7kcmwe75m2KxPMedOvObIJ56RDo6suc=;
	b=Y2bUK6UiVDHWsRX9Bqfb2rUl2Ad35yAgToOXqttcP5hvGzS/LnQh/S6vjyza9YsC20
	VEqtqtNHh3B2shr7WsTH+oBs8pzfQAWN2gDh1occkSQMMHlHiEkA62UhFEnjdOnSAWbq
	63z5Dvftwn/9zGd+zWUL7M/JMeoXgVz2aBZFi8at1EE2FhTietwXYotr+Rdu3BeQfhsp
	e/zNboS83/1X8fzrqhnf2PxTQSuGQoFG5QCxFD7jd0Oo6n4CrP5Rib1qP2+1iZjCwbHE
	jexUfpvoQIBJ1+u/cogK3pN6jpeHEOZHGKxo62liwhKB13cyMiy3AnGYZTPHuDmNYd0D
	Qutg==
X-Received: by 10.28.222.86 with SMTP id v83mr4852925wmg.17.1452012961337;
	Tue, 05 Jan 2016 08:56:01 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft4sm91665032wjb.37.2016.01.05.08.56.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jan 2016 08:56:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 Jan 2016 17:56:11 +0100
To: "Maxin B. John" <maxin.john@intel.com>
Message-ID: <20160105165611.GD2574@jama>
References: <1452011653-10012-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
In-Reply-To: <1452011653-10012-1-git-send-email-maxin.john@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bluez5: upgrade to 5.37
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
X-List-Received-Date: Tue, 05 Jan 2016 16:56:01 -0000
X-Groupsio-MsgNum: 75459
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="x4pBfXISqBoDm8sr"
Content-Disposition: inline

--x4pBfXISqBoDm8sr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 05, 2016 at 06:34:13PM +0200, Maxin B. John wrote:
> 5.36 -> 5.37
>=20
> Remove the backported patch:
> core-profile-Fix-possible-crash-when-registering-pro.patch
>=20
> Blacklist bluez5 only recipes when bluez4 is in DISTRO_FEATURES

LGTM

thanks

--x4pBfXISqBoDm8sr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaL9aoACgkQN1Ujt2V2gBzGjQCdF4S6n6gMwhkRNZ4vAjOTg23f
+dwAoJMCAD+485VDgpTPvd2ToEoemSvI
=b8k/
-----END PGP SIGNATURE-----

--x4pBfXISqBoDm8sr--
