Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmKjL-00083Z-OV
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 09:10:03 +0200
Received: by wyg30 with SMTP id 30so1707545wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 00:05:48 -0700 (PDT)
Received: by 10.227.201.10 with SMTP id ey10mr928202wbb.103.1311836748591;
	Thu, 28 Jul 2011 00:05:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo18sm559136wbb.46.2011.07.28.00.05.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 00:05:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7EF5CC6C-A2D5-40CD-B6FD-F857FAA6B515@kernel.crashing.org>
Date: Thu, 28 Jul 2011 09:05:45 +0200
Message-Id: <F2F247DB-057A-4EF9-AAA5-72ED8131DB42@dominion.thruhere.net>
References: <7EF5CC6C-A2D5-40CD-B6FD-F857FAA6B515@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: libzypp variable expansion problem
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
X-List-Received-Date: Thu, 28 Jul 2011 07:10:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 04:19 heeft Kumar Gala het volgende geschreven:

> In meta/recipes-extended/libzypp/libzypp_git.bb we having something =
that looks like:
>=20
>        while [ $# -gt 0 ]; do
> 		...
>                if [ "${AVOID_CONSTRUCTOR}" !=3D "true" ]; then
>                  ARCH=3D"_$1"
>                else
>                  ARCH=3D"IdString(\"$1\")"
>                fi
> 		...
>                COMPAT_WITH=3D"${ARCH},${COMPAT} $COMPAT_WITH"
>        done
>=20
> The problem is the COMPAT_WITH line should show up in the resulting =
script as is, however its not getting expanded because ARCH is set.  So =
we end up with:
>=20
> 	COMPAT_WITH=3D"powerpc,${COMPAT} $COMPAT_WITH"
>=20
> instead of
>=20
> 	COMPAT_WITH=3D"${ARCH},${COMPAT} $COMPAT_WITH"
>=20
> Not quite sure how to fix this w/regards to quoting to prevent the =
expansion.  One solution is to just rename ARCH to something like CARCH.

Not really a solution to your problem, but in general ${FOO} gets =
expanded by bitbake, $FOO gets expanded by shell.

regards,

Koen=


