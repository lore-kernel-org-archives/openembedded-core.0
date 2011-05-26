Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QPZOa-0001Ih-NR
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 14:10:32 +0200
Received: by wye20 with SMTP id 20so498794wye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 05:07:29 -0700 (PDT)
Received: by 10.227.12.18 with SMTP id v18mr765125wbv.72.1306411648927;
	Thu, 26 May 2011 05:07:28 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o19sm422677wbh.4.2011.05.26.05.07.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 05:07:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1306401007.git.lianhao.lu@intel.com>
Date: Thu, 26 May 2011 14:07:26 +0200
Message-Id: <082D01B5-B66B-471E-B4F8-823F3B6A03C7@dominion.thruhere.net>
References: <cover.1306401007.git.lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 0/5] network based PR service(revised)
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
X-List-Received-Date: Thu, 26 May 2011 12:10:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 mei 2011, om 13:55 heeft Lianhao Lu het volgende geschreven:

> This is a modification of the original patch to enable network based =
PR service.=20
>=20
> The main difference between this series of patch to the original one =
is that=20
> this one uses the PKGR/PKGV during the package feed creation. It also =
made the=20
> PR service disabled by default(by leaving the PRSERV_HOST and =
PRSERV_PORT=20
> commented out) and revised some function names.
>=20
> The following features from the previous patch comments are not =
included in this=20
> series:
> 1) automatically launch PR service in localhost use case.
> 2) respect OVERIDE to allow setting PRSERV_HOST/PORT per recipe basis
> 3) write permission control in the PR service.
> 4) way to sync up local PR database witht the central server.

Does it support going thru HTTP_PROXY like the bitbake fetchers? It's =
not a must-have, but it would be nice if I can have the internal builds =
consistent with angstrom upstream.

regards,

Koen=


