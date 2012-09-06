Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T9ZoZ-00081X-HO
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 13:00:03 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1T9Zcb-0005M2-6P; Thu, 06 Sep 2012 12:47:41 +0200
From: Phil Blundell <philb@gnu.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Thu, 06 Sep 2012 11:47:40 +0100
In-Reply-To: <CALbNGRR0tpkqGtN6szJc5dLqYKPRFnyeaD2tyRAk6nV50aOT8w@mail.gmail.com>
References: <CALbNGRR0tpkqGtN6szJc5dLqYKPRFnyeaD2tyRAk6nV50aOT8w@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1346928461.2673.186.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PREFERRED_VERSION_virtual/..
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
X-List-Received-Date: Thu, 06 Sep 2012 11:00:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-09-06 at 12:45 +0200, Andreas M=C3=BCller wrote:
> In meta-gumstix I am working on a central include-file where I can
> switch kernel-sources/-versions at one single place.
>=20
> For this I need PREFERRED_VERSION_virtual/... working.
>=20
> Is there a specific reason why this is not implemented or would it
> cause huge efforts to implement?

Well, it's inherently meaningless: virtuals don't have any version
number, only concrete packages do, and it's entirely possible that the
different providers for a given virtual might have unrelated (whether or
not intersecting) version numbering schemes. =20

Why exactly do you want this?

p.




