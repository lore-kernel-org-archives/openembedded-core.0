Return-Path: <Bjoern.Stenberg@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 5012F610FB
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 13:20:42 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 24 Sep 2013 15:20:42 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 334C528BD31;
	Tue, 24 Sep 2013 15:20:42 +0200 (CEST)
Date: Tue, 24 Sep 2013 15:20:42 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Stefan Seefeld <stefan@seefeld.name>
Message-ID: <20130924132042.GG26522@sestofb10.enea.se>
References: <1378948190-16620-1-git-send-email-stefan_seefeld@mentor.com>
	<1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
MIME-Version: 1.0
In-Reply-To: <1378948190-16620-2-git-send-email-stefan_seefeld@mentor.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Enable ptest support for lttng.
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
X-List-Received-Date: Tue, 24 Sep 2013 13:20:42 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Stefan Seefeld wrote:
> +RDEPENDS_${PN}-ptest +=3D "make"

I just noticed that the lttng-tools test suite is hardcoded for bash, so th=
at is another dependency.

--=20
Bj=F6rn

