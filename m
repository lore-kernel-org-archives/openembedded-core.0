Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 84C506148C;
	Tue, 19 Nov 2013 15:50:38 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so2134836eei.28
	for <multiple recipients>; Tue, 19 Nov 2013 07:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O3Vw4NL0QS9xuZRrMEAdcyULIZwOmbzt2JQisMtEgqA=;
	b=LF+HgeEv1K9Cx6+Tr6PjJUqjK+wnrzbO4Qh4qyO49lLSImbMNmb8bvDZumLFQOm/XF
	hykYR70CaN1EKe1X1Oe6hClfPwBQ7mdKbuq372Ug6siOqUBiWcK79XY4cbRiBaIeRqkp
	3Eyu2xIwMRZRvrvHyxpHXobzGrrXyopcBY9xKqX7Tz5/2d6l6+sM/8inSvBFEjq3BJcY
	cMn04qfGMQMjOcz5rmcU9urokIotqZ7Vei85b7yN9ZR5/UQF6+Z4qTfCkbvp8OEmY+d8
	yz/JxTW7QFUhYGpinl329nb2LrxNCjStdSShaBF/HLpZ11e4X3OkBQ96yLZG7HthkfIC
	zeBQ==
X-Received: by 10.14.206.194 with SMTP id l42mr976923eeo.116.1384876239971;
	Tue, 19 Nov 2013 07:50:39 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm10570504eeg.13.2013.11.19.07.50.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 07:50:39 -0800 (PST)
Date: Tue, 19 Nov 2013 16:50:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20131119155040.GD3708@jama>
References: <20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama> <20131030230825.GB32015@jama>
MIME-Version: 1.0
In-Reply-To: <20131030230825.GB32015@jama>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Tue, 19 Nov 2013 15:50:39 -0000
X-Groupsio-MsgNum: 47274
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Content-Disposition: inline

--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 12:08:25AM +0100, Martin Jansa wrote:
> Starting now I'll use
> http://openembedded.org/wiki/Bitbake_World_Status
> to post results from my bitbake world buils.

It was updated few times since this e-mail and I've received no
feedback.

Should I continue to post them or nobody except me is really interested?

The stats also show that nobody is interested in fixing them, some issues a=
re
there for 6+ months.

Date	                 Failed tasks	         QA	QA-w/o-unrecognized
                qemuarm	qemux86	qemux86_64	qemuarm	qemux86	qemux86_64	qemua=
rm	qemux86	qemux86_64
2013-11-19	12	17	19	141	142	131	29	27	18
2013-11-03	11	18	19	96	127	123	22	21	16
2013-10-31	9	17	19	74	114	107	23	21	14
2013-10-30	11	16	18	224	191	184	28	23	16


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKLiNAACgkQN1Ujt2V2gBwVRACdETEFpyjPWZG4wtLTpltumFvq
0nQAmweKRXmHO3Aa2IsDUE4JLR4Vi9Jt
=3g+/
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
