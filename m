Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWQG6-0003MQ-OQ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 11:22:22 +0100
Received: by eekc1 with SMTP id c1so1825831eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 02:15:40 -0800 (PST)
Received: by 10.14.15.11 with SMTP id e11mr1408566eee.45.1322820940452;
	Fri, 02 Dec 2011 02:15:40 -0800 (PST)
Received: from [172.20.1.19] (ip5451781a.direct-adsl.nl. [84.81.120.26])
	by mx.google.com with ESMTPS id v3sm26510294eej.7.2011.12.02.02.15.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 02:15:39 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 2 Dec 2011 11:15:31 +0100
In-Reply-To: <8afb5fd67ea37c1ff2ff4513f797f409a0e8a556.1322782677.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8afb5fd67ea37c1ff2ff4513f797f409a0e8a556.1322782677.git.paul.eggleton@linux.intel.com>
Message-Id: <95561DFA-A2E5-43AD-B83D-A83F3D329077@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC PATCH 2/2] classes/buildhistory: merge in package history functionality
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
X-List-Received-Date: Fri, 02 Dec 2011 10:22:22 -0000
X-Groupsio-MsgNum: 13548
Content-Type: multipart/signed;
	boundary="Apple-Mail=_95DF37EC-2AC8-4376-B92B-9D4502E67AF3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_95DF37EC-2AC8-4376-B92B-9D4502E67AF3
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


Op 2 dec. 2011, om 00:56 heeft Paul Eggleton het volgende geschreven:

> Include package history collection from packagehistory.bbclass (thus
> superseding it), with the following changes:
> 
> * Store package history under BUILDHISTORY_DIR/packages
> * Disable storing package history as version named files unless
>  BUILDHISTORY_KEEP_VERSIONS is set to 1; otherwise the adds of these
>  files that duplicate what is already in git anyway is just noise in
>  the git log.
> * Rename emit_pkghistory to buildhistory_emit_pkghistory
> 
> Implements [YOCTO #1565].

Does this do a commit per build as well?

regards,

Koen

--Apple-Mail=_95DF37EC-2AC8-4376-B92B-9D4502E67AF3
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7YpUkACgkQMkyGM64RGpFlRQCeKu9uXpqxzMWUTELhB1RQuXv8
u+MAnRZGsyHSnAVHxawRINIbw1WyHXZw
=Aa7o
-----END PGP SIGNATURE-----

--Apple-Mail=_95DF37EC-2AC8-4376-B92B-9D4502E67AF3--
