Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RYDJs-0004M9-8G
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 09:57:40 +0100
Received: by eekb15 with SMTP id b15so202394eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 00:50:52 -0800 (PST)
Received: by 10.14.17.92 with SMTP id i68mr3361340eei.67.1323247851947;
	Wed, 07 Dec 2011 00:50:51 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q28sm3320843eea.6.2011.12.07.00.50.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Dec 2011 00:50:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 7 Dec 2011 09:50:51 +0100
In-Reply-To: <8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
Message-Id: <225B79C8-8CC0-429B-B4B8-95360FD4B07E@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC PATCH 1/2] classes/buildhistory: add new output history collection class
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
X-List-Received-Date: Wed, 07 Dec 2011 08:57:40 -0000
X-Groupsio-MsgNum: 13709
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CD1C7ED5-6BB3-4D5A-AABB-B49BD4E95017";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CD1C7ED5-6BB3-4D5A-AABB-B49BD4E95017
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 2 dec. 2011, om 00:56 heeft Paul Eggleton het volgende geschreven:

>=20
> +buildhistory_commit() {
> +	( cd ${BUILDHISTORY_DIR}/
> +		git add ${BUILDHISTORY_DIR}/*
> +		git commit ${BUILDHISTORY_DIR}/ -m "Build ${BUILDNAME} =
for machine ${MACHINE} configured for ${DISTRO} ${DISTRO_VERSION}" =
--author "${BUILDHISTORY_COMMIT_AUTHOR}" > /dev/null
> +		if [ "${BUILDHISTORY_PUSH_REPO}" !=3D "" ] ; then
> +			git push -q ${BUILDHISTORY_PUSH_REPO}
> +		fi) || true
> +}

One of the big problems with the old testlab code was that using =
multiple buildslaves created a huge mess for the git repo. What do you =
think about doing this the following before the 'git add'?

git pull -q -s recursive -X theirs ${BUILDHISTORY_PULL_REPO}

I'm not sure what the right incantation is to ensure git updates the =
current branch, but the point is mainly about using the 'theirs' =
strategy.

regards,

Koen=

--Apple-Mail=_CD1C7ED5-6BB3-4D5A-AABB-B49BD4E95017
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7fKO0ACgkQMkyGM64RGpFXBACfbk24QH8NHXKFkcPgJiJhisjX
+KEAnR6RDTsgJK/DEtvEeC2LgWkthJ9w
=vy8j
-----END PGP SIGNATURE-----

--Apple-Mail=_CD1C7ED5-6BB3-4D5A-AABB-B49BD4E95017--
