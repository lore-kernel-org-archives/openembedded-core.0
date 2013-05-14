Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UcF64-0004ar-QE
	for openembedded-core@lists.openembedded.org;
	Tue, 14 May 2013 15:16:53 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 14 May 2013 14:58:32 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 272FF288939;
	Tue, 14 May 2013 14:58:41 +0200 (CEST)
Date: Tue, 14 May 2013 14:58:41 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Jesse Zhang <sen.zhang@windriver.com>
Message-ID: <20130514125841.GV25918@sestofb10.enea.se>
References: <cover.1368517957.git.sen.zhang@windriver.com>
	<52b7eb9a13f023eb8d5987ac14d79ef265be5d5a.1368517957.git.sen.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52b7eb9a13f023eb8d5987ac14d79ef265be5d5a.1368517957.git.sen.zhang@windriver.com>
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
X-List-Received-Date: Tue, 14 May 2013 13:16:53 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jesse Zhang wrote:
> +++ b/meta/recipes-devtools/perl/perl-5.14.3/run-ptest
> @@ -0,0 +1,2 @@
> +#!/bin/sh
> +cd t && ./TEST

run-ptest also needs to parse the output and reformat results into the stan=
dard ptest/automake format, such as "PASS: foo", "FAIL: foo" and "SKIP: foo=
".

--=20
Bj=F6rn


