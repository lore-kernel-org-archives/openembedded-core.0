Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UdHII-0008Bi-N2
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 11:50:00 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Fri, 17 May 2013 11:31:19 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id A415B288979;
	Fri, 17 May 2013 11:31:29 +0200 (CEST)
Date: Fri, 17 May 2013 11:31:29 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Jesse Zhang <sen.zhang@windriver.com>
Message-ID: <20130517093129.GC25918@sestofb10.enea.se>
References: <cover.1368761545.git.sen.zhang@windriver.com>
	<6f982350937c07b4dd73231e4d99322cb86c6fab.1368761545.git.sen.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <6f982350937c07b4dd73231e4d99322cb86c6fab.1368761545.git.sen.zhang@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
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
X-List-Received-Date: Fri, 17 May 2013 09:50:01 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Jesse Zhang wrote:
> +--- a/t/TEST	2013-05-15 23:12:12.705104588 -0400
> ++++ b/t/TEST	2013-05-15 23:20:20.126104587 -0400

Is patching t/TEST better than simply using sed to transform the output?

I took a quick look at future versions and t/TEST is modified in both perl =
5.16.3 and 5.18.0-RC4. This means the patch will have to be manually update=
d for each of those version updates. And the patch cannot be upstreamed.

Unless there are clear advantages with patching t/TEST that I have overlook=
ed, I suggest using sed in run-ptest instead.

--=20
Bj=F6rn


