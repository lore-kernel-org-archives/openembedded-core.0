Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qz1cY-0006h3-GM
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 09:23:30 +0200
Received: by wwe32 with SMTP id 32so1273793wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Sep 2011 00:18:35 -0700 (PDT)
Received: by 10.227.178.131 with SMTP id bm3mr1171384wbb.85.1314861514845;
	Thu, 01 Sep 2011 00:18:34 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id et16sm260280wbb.2.2011.09.01.00.18.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 00:18:33 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1314854414.git.sgw@linux.intel.com>
Date: Thu, 1 Sep 2011 09:18:31 +0200
Message-Id: <95EF12C0-BBBD-4F4B-8418-C8BF3D0E0219@dominion.thruhere.net>
References: <cover.1314854414.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 0/3] Sato recipes and tzcode/tzdata update
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
X-List-Received-Date: Thu, 01 Sep 2011 07:23:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 sep. 2011, om 07:23 heeft Saul Wold het volgende geschreven:

> Richard,
>=20
> This set of patches convertes the Sato recipes from SVN O-hand server
> to yoctoproject git servers.  Since we converted to git, I needed to =
bump
> some recipes PR to ensure they got the correct versioning (svnr vs =
git).


Note that 0.0+s* > 0.0+g* so you'd need to bump PE as well to ensure =
upgrade paths.

regards,

Koen=


