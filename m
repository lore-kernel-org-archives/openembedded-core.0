Return-Path: <Bjoern.Stenberg@enea.com>
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4B9C86B389
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:17:32 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Fri, 20 Sep 2013 11:17:27 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 7504F28BD31;
	Fri, 20 Sep 2013 11:17:27 +0200 (CEST)
Date: Fri, 20 Sep 2013 11:17:27 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20130920091727.GD26522@sestofb10.enea.se>
References: <cover.1378890742.git.rongqing.li@windriver.com>
	<dec697bffb0eebaeb34f5acd32929ba866174585.1378890742.git.rongqing.li@windriver.com>
	<CABcZANk8PQkxHUZ93-bSzgoSzc2_W3ArNT7_cD1v47oLBL7X7g@mail.gmail.com>
	<20130919114753.GA26522@sestofb10.enea.se>
	<523B1261.1060709@windriver.com>
MIME-Version: 1.0
In-Reply-To: <523B1261.1060709@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 20 Sep 2013 09:17:33 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Randy MacLeod wrote:
> Yes, Roy will fix this. He's on holiday for a few days.

Excellent.

> I presume he'll add a check to see which arg to use for find
> rather than add a dependency on findutils.

I suggest skipping the find command altogether. The run-ptest files are def=
ined to always sit in ${libdir}/${PN}/ptest and thus don't really need to b=
e searched for.

Also, 'pushd' is not available in the busybox shell.

(I should have spotted these during patch review, but I was temporarily una=
vailable. Sorry about that.)

--=20
Bj=F6rn

