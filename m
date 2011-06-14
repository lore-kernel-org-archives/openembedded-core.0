Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWUan-0007kE-US
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 16:27:47 +0200
Received: by wye20 with SMTP id 20so4509643wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 07:24:20 -0700 (PDT)
Received: by 10.216.220.139 with SMTP id o11mr6615461wep.12.1308061460500;
	Tue, 14 Jun 2011 07:24:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w62sm3520443wec.42.2011.06.14.07.24.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 07:24:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308060644.12359.41.camel@desktop.home>
Date: Tue, 14 Jun 2011 16:24:18 +0200
Message-Id: <19457E2B-45A3-4A02-8BDB-58A538B6A1F6@dominion.thruhere.net>
References: <1308060644.12359.41.camel@desktop.home>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] Recipe for util-linux-2.19.1
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
X-List-Received-Date: Tue, 14 Jun 2011 14:27:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 jun 2011, om 16:10 heeft Chris Elston het volgende geschreven:

> Add a recipe for util-linux-2.19.1.=20
>=20
> Since 2.19 util-linux has dropped the '-ng' part of the package
> filename / extracted directory name.  So util-linux.inc now uses
> base_version_less_or_equal to insert this string if required.  This
> caused a deprecation warning for bb.vercmp, so changed that to
> bb.utils.vercmp_string.
>=20
> Most of the patches for 2.17.2 apply unchanged, so renamed the =
directory
> meta/recipes-core/util-linux/util-linux-2.17.2 to
> meta/recipes-core/util-linux/util-linux so that they can be shared
> between package revisions.
>=20
> Signed-off-by: Chris Elston <celston@katalix.com>

Chris, Saul updated to 2.19.1 two weeks ago:

=
http://cgit.openembedded.org/cgit.cgi/openembedded-core/commit/?id=3D596e6=
807826c34a4f93d7cb26052d1bd7a985201

It doesn't seem to have the vercmp change you mentioned, could you try =
to rebase your changes against that?

regards,

Koen=


