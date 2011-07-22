Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QkHpc-0006XF-56
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 17:40:04 +0200
Received: by wyg30 with SMTP id 30so1763159wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 08:35:55 -0700 (PDT)
Received: by 10.227.201.207 with SMTP id fb15mr1376922wbb.113.1311348955466;
	Fri, 22 Jul 2011 08:35:55 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p14sm2002094wbh.30.2011.07.22.08.35.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 08:35:54 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1311191810.git.tom_rini@mentor.com>
Date: Fri, 22 Jul 2011 17:35:48 +0200
Message-Id: <4EFFABBF-7073-4B97-B5A5-F9DBF4B7C5DA@dominion.thruhere.net>
References: <cover.1311191810.git.tom_rini@mentor.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH v2 0/1] Resync siteinfo.bbclass with oe.dev
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
X-List-Received-Date: Fri, 22 Jul 2011 15:40:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 jul. 2011, om 22:50 heeft Tom Rini het volgende geschreven:

> Hey all,
>=20
> This is the second of two pull requests.  This doesn't depend on the =
first
> request, it's just splitting changes up.  There's three changes here.  =
First,
> site/ix86-common was setting the wrong value for unsigned int.  =
Second,
> change perl to use SITEINFO variables rather than functions. =20
> We're down to one change now to re-sync siteinfo.bbclass with oe-core
> and oe.dev.  This re-works the functions a bit inside siteinfo.bbclass
> to be easier to add new platforms (and hopefully multilibs) to.
>=20
> My next step is to work on merging and verifying as much as possible
> the site files in oe-core and oe.dev.
>=20
> v2: Rework based on Richard's comments to not be a generator and just
> return a string list again.

Not that it has been merged, can the siteinfo from meta-oe get deleted?=


