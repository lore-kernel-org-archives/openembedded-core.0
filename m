Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UcZkC-0007Za-PR
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 13:19:46 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 15 May 2013 13:01:19 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id EC91028893A;
	Wed, 15 May 2013 13:01:27 +0200 (CEST)
Date: Wed, 15 May 2013 13:01:27 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Jesse Zhang <sen.zhang@windriver.com>
Message-ID: <20130515110127.GY25918@sestofb10.enea.se>
References: <cover.1368517957.git.sen.zhang@windriver.com>
	<52b7eb9a13f023eb8d5987ac14d79ef265be5d5a.1368517957.git.sen.zhang@windriver.com>
	<20130514125841.GV25918@sestofb10.enea.se>
	<51933BC3.5090001@windriver.com>
MIME-Version: 1.0
In-Reply-To: <51933BC3.5090001@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] perl-tests: convert to ptest
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
X-List-Received-Date: Wed, 15 May 2013 11:20:28 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jesse Zhang wrote:
> How verbose should the output be? The TEST script actually does its own
> analyzing and summarizing of the test results. Do we want the summary
> only or all the details? Do you want the detailed output converted to
> ptest format too?
>=20
> For example,
>=20
>     # ./TEST=20
>     t/base/cond....................................................ok
>     t/base/if......................................................ok
>     t/base/lex.....................................................ok
>     t/base/num.....................................................ok

I would say this higher-level form is OK. Just sed it into:

PASS: t/base/cond
PASS: t/base/if
PASS: t/base/lex
PASS: t/base/num

> The output from the actual test case conforms to the TAP format (not
> sure about the top-level TEST). If you have an analysis tool, why not
> support one more widely used format? I can't see much value in forcing
> one format everywhere.

There is no supplied analysis tool for ptest. Ptest is defined as producing=
 a specific output format, to simplify parsing and analysis of the results =
however and wherever you want to do it.

The alternative would be to say that a specific analysis tool must be used =
which understands every different way of reporting results. And after going=
 through a number of packages I can assure you are a lot of different ways =
to do that, some quite creative. It would mean that every package maintaine=
r would also have to add the result format of his package into that analysi=
s tool, likely creating a huge mess.

I prefer the current way of putting the responsibility on each package to p=
roduce a standard output format.

--=20
Bj=F6rn


