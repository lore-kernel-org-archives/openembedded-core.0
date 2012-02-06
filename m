Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RuOkE-0000ji-Ni
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 14:36:35 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D25404B008E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2012 14:28:31 +0100 (CET)
Date: Mon, 6 Feb 2012 14:28:30 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120206142830.79e73ef1@eb-e6520>
In-Reply-To: <1328533275.24049.16.camel@ted>
References: <1328533275.24049.16.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: Performance numbers
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
X-List-Received-Date: Mon, 06 Feb 2012 13:36:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Le Mon, 06 Feb 2012 13:01:15 +0000,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :

> Its been a while since we had some performance numbers and there were
> recently some questions about how current build time compared to
> previous numbers.
>=20
> On my 12 core system, build time for qemux86 from scratch is ~42
> minutes. This compares favourably with previous numbers from that
> system. Interestingly, switching to qemumips resulted in a build time of
> 43 minutes in the same tmpdir suggesting that the native part of the
> bootstrap process isn't the bottleneck.
>=20
> On the quad core (the system used for many of the previous numbers I'd
> provided), build time for qemux86 was 105 minutes which again is roughly
> consistent with where things were for 1.1.
>=20
what are your settings (PARALLEL_MAKE & BB_NUMBER_THREADS) used in
both cases ?

Thanks
Eric
--=20
http://eukrea.com/en/news/104-2012


