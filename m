Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QINax-0005qc-MZ
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 18:09:35 +0200
Received: by wye20 with SMTP id 20so2837358wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 09:06:54 -0700 (PDT)
Received: by 10.227.208.136 with SMTP id gc8mr1587716wbb.37.1304698014552;
	Fri, 06 May 2011 09:06:54 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	h11sm2089000wbc.26.2011.05.06.09.06.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 09:06:53 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BANLkTi=yVmeX5xH8qHwOHwoeoXqi5Hs2uA@mail.gmail.com>
Date: Fri, 6 May 2011 18:06:50 +0200
Message-Id: <FC216C43-4A6A-41B8-9565-2462C914D6C7@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<1304691622.30391.124.camel@rex>
	<1B7A477C-E4A5-4EBC-A7E3-CAA30A583ADF@dominion.thruhere.net>
	<BANLkTi=yVmeX5xH8qHwOHwoeoXqi5Hs2uA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 16:09:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mei 2011, om 17:36 heeft Otavio Salvador het volgende geschreven:

> On Fri, May 6, 2011 at 11:51, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>> So, is having both sets inside ${PN} a dealbreaker?
>=20
> I think it is not BUT this choice could be a distro choice.

Everything can be a distro choice, you can make gtk/qt or even =
qt-x11/qt-e a distro choice. The point is to see what is an image choice =
and what isn't. Defaulting to distro choice is a recipe for disaster =
(pun intended)

I do *NOT* want to write a new distro.conf for every silly option out =
there.=


