Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UIEgU-00005U-DB
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 09:47:50 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 20 Mar 2013 09:30:55 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 2D450288AF8;
	Wed, 20 Mar 2013 09:30:55 +0100 (CET)
Date: Wed, 20 Mar 2013 09:30:55 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20130320083055.GQ31812@sestofb10.enea.se>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: Problems with ptest and package splitting
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
X-List-Received-Date: Wed, 20 Mar 2013 08:48:10 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi. I need a little help.

The ${PN}-ptest group is not added to PACKAGES by default in bitbake.conf l=
ike all the other groups. Instead it is added to PACKAGES in ptest.bbclass.=
 This way it is only added for those recipes that implement ptest.

However it turns out this doesn't work when package splitting. Instead of p=
utting ptest files into packages-split/${PN}-ptest, those files are put int=
o the core ${PN} package which is obviously not what we want.

I'm scratching my head a bit about why this happens, and would like help fr=
om people with deeper bitbake knowledge. I guess the splitting is somehow d=
one outside the package scope, but why and how do we fix it?

Putting ${PN}-ptest in PACKAGES in bitbake.conf "solves" this issue, but Ri=
chard Purdie was against that earlier since we yet have only a few "ptest e=
nabled" packages.

--=20
Bj=F6rn


