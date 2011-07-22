Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QkHBY-0005Pq-8Y
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:58:40 +0200
Received: by wyg30 with SMTP id 30so1732974wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2011 07:54:31 -0700 (PDT)
Received: by 10.216.229.210 with SMTP id h60mr1984975weq.29.1311346471575;
	Fri, 22 Jul 2011 07:54:31 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id j54sm1591050wed.47.2011.07.22.07.54.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jul 2011 07:54:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3a3c69a1bc3cf0b6f6a3b13d86c12ed21798d48e.1311345613.git.richard.purdie@linuxfoundation.org>
Date: Fri, 22 Jul 2011 16:54:24 +0200
Message-Id: <29D487E1-5E59-4A53-B518-3692FF11C70C@dominion.thruhere.net>
References: <aeea22da699b276a97ca1a17e3c53176c9afd9de.1311345613.git.richard.purdie@linuxfoundation.org>
	<3a3c69a1bc3cf0b6f6a3b13d86c12ed21798d48e.1311345613.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 3/3] conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH
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
X-List-Received-Date: Fri, 22 Jul 2011 14:58:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jul. 2011, om 16:49 heeft Richard Purdie het volgende geschreven:

> Since we're updating the tune file format, it makes sense to abstract
> the compiler tune arguments at this point too. This means that should
> these need to be overridden at any point, the original values can
> still be obtained in a similar manner to the other TUNE* variables.
>=20
> Whilst this isn't strictly necessary for any current need, its likely
> good practise to standardise this behaviour.

So if I'm reading the patch correctly this doesn't result in a behaviour =
change, it just shuffles the definitions around in preparation for =
Mark's tune overhaul.

regards,

Koen=


