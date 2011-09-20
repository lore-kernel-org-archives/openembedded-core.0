Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1R65Sl-0007GS-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 20:54:35 +0200
Received: by eya25 with SMTP id 25so1053894eya.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 11:49:17 -0700 (PDT)
Received: by 10.216.169.75 with SMTP id m53mr1251228wel.55.1316544557540;
	Tue, 20 Sep 2011 11:49:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fa7sm3552887wbb.26.2011.09.20.11.49.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Sep 2011 11:49:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1316542962.git.sgw@linux.intel.com>
Date: Tue, 20 Sep 2011 20:49:09 +0200
Message-Id: <3C0CAE4F-8E6A-472B-BF36-D1785741C24E@dominion.thruhere.net>
References: <cover.1316542962.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 0/1 v2] Fix avahi x11 dependency with non-GPLv3 Build
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
X-List-Received-Date: Tue, 20 Sep 2011 18:54:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 sep. 2011, om 20:26 heeft Saul Wold het volgende geschreven:

> This version removes the DISTRO_FEATURE check for x11 and simply
> removes the DEPENDS on gtk and sets --disable-gtk to EXTRA_OECONF.
>=20
> If someone uses/needs the avahi-ui bits, they are available in the
> OE repo, we would consider taking them into oe-core if there is a =
clear
> need for it.

Can't you just port over the OE classic recipe instead of this =
half-baked patch?=


