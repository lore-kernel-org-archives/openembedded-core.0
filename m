Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7E76E688
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 10:10:30 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id n129so265256483wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6CEMW6qxctxCzMLBQzAkUakbxqDedbrsF2hq7EXKU4U=;
	b=xEiQIOGnR9Izz96e7/aOWlWrqR+P2UbE+PGIrx3G7UGk/76wY9x+8dXKWz9gLnZKtD
	Nx6ZqMsrDLhvOfMlHPgyAsSL5+ihOC14jzDHZIyY5WoFuygsivpQHch0fgOkXCjNnM9n
	bc69L8AAJwbFVN1DFZXGI1ryZSIr7Eh+Gd1VMsgXOZR1Z6RU1QV8iKrm/sUsJVRqk8ss
	AT58vBx3L9ROZDTTFbkfBRLo4xjQMlx8/jpFJAEuRoEq+TslzKcH5TZ6e2XyaBUukbj+
	JPWn5zIurCvQNzDjNWID4lGTruYEZE6bwY7yx7OA4rC3HtpsWQ8ubKm5I/hRVRP2Ei9Q
	79fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6CEMW6qxctxCzMLBQzAkUakbxqDedbrsF2hq7EXKU4U=;
	b=dHp82sKpf9Eae1vSYJvq/4LOGR6QjRVjhnX0vETmeFBKKgMqODAchxV0p33TplDxdN
	jjrH87EcXq+UhIQMTsXCEd6xgqwtUTQxef/S2Awy0Od+IuHushP+JlZObW5p0D+or5ov
	zjiC6Uc8kBrsMAr/E+3voFwUL2aTGTmL/FsJJSHBfA7o3uR3+d4VA74HIZZ9zvqDT9AP
	ZhpxtuQzEI7GBxfpt35H4bAQzLO/fqSoor/goS2ZoWoSXfE94K4DdW8pd5EYKml6jcpW
	669obBa+JEenqvPoSVC6aQXr7IxEcbZGOYzVz717NkhnZoqQvEvVL3ItQzqlWxH9lril
	vWHw==
X-Gm-Message-State: ALyK8tLGD/Mdh7g0VAJwtpB9wTcU7kUlePidt5d/inmik3uCrMakMpI2bb6LueNYPhhqxg==
X-Received: by 10.194.185.211 with SMTP id fe19mr2599121wjc.119.1464343830509; 
	Fri, 27 May 2016 03:10:30 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	a81sm7856609wma.16.2016.05.27.03.10.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 May 2016 03:10:28 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 May 2016 12:10:56 +0200
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20160527101056.GB2570@jama>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
	<1464270076.19134.19.camel@linuxfoundation.org>
	<CAP9ODKqGzsGm747bAg2N_z-mu-jXt2PB1mFL-2r7-dyNnxC8og@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqGzsGm747bAg2N_z-mu-jXt2PB1mFL-2r7-dyNnxC8og@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Improve SSL certificate handling
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
X-List-Received-Date: Fri, 27 May 2016 10:10:31 -0000
X-Groupsio-MsgNum: 82782
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2016 at 06:55:30AM -0300, Otavio Salvador wrote:
> On Thu, May 26, 2016 at 10:41 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2016-05-23 at 17:45 -0300, Otavio Salvador wrote:
> >> This patchset leverage the OpenSSL certificate handling so it works
> >> aligned with Debian and other generic distributions regarding where
> >> the certificates are stored and how they are installed.
> >>
> >> This all started when debugging why SSL certificates were not working
> >> properly for a customer which was using QtWebEngine. It turned out to
> >> be the integration which was not complete so this patch addresses it.
> >>
> >>
> >> Otavio Salvador (3):
> >>   openssl: Add Shell-Script based c_rehash utility
> >>   ca-certificates: Use c_rehash utility
> >>   openssl: Ensure SSL certificates are stored on sysconfdir
> >
> > Initial tests were ok but we've just seen:
> >
> > https://autobuilder.yoctoproject.org/main/builders/nightly-oecore/build
> > s/792/steps/BuildImages/logs/stdio
> >
> > I've not looked into it but it would seem to implicate these patches :/
>=20
> It does seem to be caused by it. I sent a v2 fixing it.

v1 was already merged, so you might want to send just rebased fix

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAldIHS8ACgkQN1Ujt2V2gBx0/ACgsg88vK6eaZAs5TPa0A1s4j2m
JlYAoJOQ7Km6HCQfL+fJPcpUP7O6x5oP
=Vxad
-----END PGP SIGNATURE-----

--/NkBOFFp2J2Af1nK--
