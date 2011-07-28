Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QmOCV-0004gm-8x
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 12:52:24 +0200
Received: by wyg30 with SMTP id 30so21915wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 03:48:08 -0700 (PDT)
Received: by 10.227.178.203 with SMTP id bn11mr7455101wbb.51.1311850087748;
	Thu, 28 Jul 2011 03:48:07 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo18sm730212wbb.12.2011.07.28.03.48.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 03:48:06 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
Date: Thu, 28 Jul 2011 12:48:00 +0200
Message-Id: <966412C2-ACA2-42E2-B836-3C5B7F47FE09@dominion.thruhere.net>
References: <1311824295-13464-1-git-send-email-bengardiner@nanometrics.ca>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] [PATCH] raptor: add recipe
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
X-List-Received-Date: Thu, 28 Jul 2011 10:52:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jul. 2011, om 05:38 heeft Ben Gardiner het volgende geschreven:

> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
>=20
> This recipe is a port of recipes/raptor/raptor_1.4.21.bb from
> git://git.openembedded.org/openembedded, commits
> 01e8e9f325d8d251e852e7a5704b5fe50880e1ad 'raptor: added recipe' and
> f1d24b5a986233f869364eb109476f5184e76d10 'raptor: add libxml2 DEPENDS'

Why does this need to be in OE-core and not in some other layer? It =
doesn't look so core to me, especially since nothing in oe-core (or =
meta-oe/efl/gnome for that matter) depends on it

>=20
> The recipe was modified by adding a LIC_FILES_CHKSUM assignment.
>=20
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
>=20
> ---
>=20
> Not tested in the oe-core + meta-openembedded et. al. layers.

So why are you sending it if it isn't tested?

> We are not
> ready yet to migrate from the 2011.03-maintenance branch. This patch =
is
> proposed for inclusion in oe-core so that we can meet the new policy
> requirements for inclusion in the 2011.03-maintenance branch

Where does it say it's OK to do a pull request for untested recipes? And =
where does it say it needs to be in OE-core first?

> and submit
> a subsequent pull-request for commit

I seriously disagree with sending pull requests for the maintenaince =
branch for untested recipes!=


