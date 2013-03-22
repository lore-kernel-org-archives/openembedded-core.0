Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UJ2xw-0007QL-Ar
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 15:29:08 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Fri, 22 Mar 2013 15:12:14 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id E3C3528900E;
	Fri, 22 Mar 2013 15:12:13 +0100 (CET)
Date: Fri, 22 Mar 2013 15:12:13 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130322141213.GC46421@sestofb10.enea.se>
References: <20130320083055.GQ31812@sestofb10.enea.se>
	<1363879406-3440-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
In-Reply-To: <1363879406-3440-1-git-send-email-bjst@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: Re: [PATCH] ptest bugfix: Make all ptest files go into -ptest package
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
X-List-Received-Date: Fri, 22 Mar 2013 14:29:08 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Bj=F6rn Stenberg wrote:
> Move ${PN}-ptest to start of PACKAGES to ensure all ptest files are
> packaged in the -ptest package.
>=20
> Add QA exclusions to insane.bbclass to ensure -ptest packages can contain
> any files they need.
>=20
> This patch fixes bug #4069.
>=20
> Signed-off-by: Bj=F6rn Stenberg <bjst@enea.com>
> ---
>  meta/classes/insane.bbclass |    6 +++---
>  meta/classes/ptest.bbclass  |    9 +--------
>  2 files changed, 4 insertions(+), 11 deletions(-)

Don't merge this, it's not fully working. Updated patch coming next week.

--=20
Bj=F6rn


