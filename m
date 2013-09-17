Return-Path: <Bjoern.Stenberg@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BBB536C894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:35:47 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 17 Sep 2013 15:35:46 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id BA80728BD31;
	Tue, 17 Sep 2013 15:35:46 +0200 (CEST)
Date: Tue, 17 Sep 2013 15:35:46 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Chris Larson <clarson@kergoth.com>
Message-ID: <20130917133546.GY26522@sestofb10.enea.se>
References: <cover.1378890742.git.rongqing.li@windriver.com>
	<dec697bffb0eebaeb34f5acd32929ba866174585.1378890742.git.rongqing.li@windriver.com>
	<CABcZANk8PQkxHUZ93-bSzgoSzc2_W3ArNT7_cD1v47oLBL7X7g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANk8PQkxHUZ93-bSzgoSzc2_W3ArNT7_cD1v47oLBL7X7g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] ptest-runner: trivial fixes and refine
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
X-List-Received-Date: Tue, 17 Sep 2013 13:35:48 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Chris Larson wrote:
> On Wed, Sep 11, 2013 at 2:17 AM, <rongqing.li@windriver.com> wrote:
>=20
> > +    for x in `find -L ./ -name run-ptest -type f -perm /u+x,g+x`
> > +    do
> >
>=20
> As far as I can tell, busybox find doesn't support -L, so this adds an
> implicit, undeclared dependency upon findutils.

That is correct. Busybox find does however support -follow, which in turn G=
NU find does not...

--=20
Bj=F6rn

